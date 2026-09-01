`timescale 1 ns / 1 ps

module hog_version_rom_tb;

    // Параметры интерфейса
    localparam integer C_S00_AXI_DATA_WIDTH = 32;
    localparam integer C_S00_AXI_ADDR_WIDTH = 7;
    localparam integer ADDR_STEP = 4;  // AXI Lite адресация обычно кратна 4 байтам

    // Тактовый период
    localparam integer CLK_PERIOD = 10;

    // ------------------------------------------------------------------
    // Сигналы тестбенча
    // ------------------------------------------------------------------
    reg                                s00_axi_aclk;
    reg                                s00_axi_aresetn;

    // Сигналы AXI Master (подключаем к Slave входам DUT)
    reg     [C_S00_AXI_ADDR_WIDTH-1:0] s00_axi_araddr;
    reg     [                     2:0] s00_axi_arprot;
    reg                                s00_axi_arvalid;
    wire                               s00_axi_arready;
    wire    [C_S00_AXI_DATA_WIDTH-1:0] s00_axi_rdata;
    wire    [                     1:0] s00_axi_rresp;
    wire                               s00_axi_rvalid;
    reg                                s00_axi_rready;

    // Сигналы данных (входы модуля)
    reg     [                    31:0] global_date;
    reg     [                    31:0] global_time;
    reg     [                    31:0] global_ver;
    reg     [                    31:0] global_sha;
    reg     [                    31:0] top_sha;
    reg     [                    31:0] top_ver;
    reg     [                    31:0] con_sha;
    reg     [                    31:0] con_ver;
    reg     [                    31:0] hog_sha;
    reg     [                    31:0] hog_ver;
    reg     [                    31:0] xml_sha;
    reg     [                    31:0] xml_ver;
    reg     [                    31:0] mylib0_ver;
    reg     [                    31:0] mylib0_sha;
    reg     [                    31:0] mylib1_ver;
    reg     [                    31:0] mylib1_sha;
    reg     [                    31:0] myextlib_sha;
    reg     [                    31:0] flavour;
    reg     [                    63:0] device_dna_reg;  // 64 бита для slv_reg18 и slv_reg19

    integer                            i;
    reg     [                    31:0] expected_data;
    reg                                test_passed;

    // ------------------------------------------------------------------
    // Экземпляр модуля (DUT)
    // ------------------------------------------------------------------
    hog_version_rom #(
        .C_S00_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
        .C_S00_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
    ) dut (
        .global_date (global_date),
        .global_time (global_time),
        .global_ver  (global_ver),
        .global_sha  (global_sha),
        .top_sha     (top_sha),
        .top_ver     (top_ver),
        .con_sha     (con_sha),
        .con_ver     (con_ver),
        .hog_sha     (hog_sha),
        .hog_ver     (hog_ver),
        .xml_sha     (xml_sha),
        .xml_ver     (xml_ver),
        .mylib0_ver  (mylib0_ver),
        .mylib0_sha  (mylib0_sha),
        .mylib1_ver  (mylib1_ver),
        .mylib1_sha  (mylib1_sha),
        .myextlib_sha(myextlib_sha),
        .flavour     (flavour),

        .s00_axi_aclk   (s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_awaddr (32'b0),            // Не используется для чтения
        .s00_axi_awprot (3'b0),
        .s00_axi_awvalid(1'b0),
        .s00_axi_awready(),
        .s00_axi_wdata  (32'b0),
        .s00_axi_wstrb  (4'b0),
        .s00_axi_wvalid (1'b0),
        .s00_axi_wready (),
        .s00_axi_bresp  (),
        .s00_axi_bvalid (),
        .s00_axi_bready (1'b0),
        .s00_axi_araddr (s00_axi_araddr),
        .s00_axi_arprot (s00_axi_arprot),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_rdata  (s00_axi_rdata),
        .s00_axi_rresp  (s00_axi_rresp),
        .s00_axi_rvalid (s00_axi_rvalid),
        .s00_axi_rready (s00_axi_rready)
    );

    // ------------------------------------------------------------------
    // Генерация тактового сигнала
    // ------------------------------------------------------------------
    initial begin
        s00_axi_aclk = 0;
        forever #(CLK_PERIOD / 2) s00_axi_aclk = ~s00_axi_aclk;
    end

    // ------------------------------------------------------------------
    // Основная логика теста
    // ------------------------------------------------------------------
    initial begin
        s00_axi_aresetn = 0;
        s00_axi_arvalid = 0;
        s00_axi_araddr  = 0;
        s00_axi_arprot  = 0;
        s00_axi_rready  = 1;

        global_date     = 32'hAAAA_AAAA;
        global_time     = 32'h5555_5555;
        global_ver      = 32'h0000_FFFF;
        global_sha      = 32'hFFFF_0000;
        top_sha         = 32'h0000_0000;
        top_ver         = 32'hAAAA_AAAA;
        con_sha         = 32'h5555_5555;
        con_ver         = 32'h0000_FFFF;
        hog_sha         = 32'hFFFF_0000;
        hog_ver         = 32'h0000_0000;
        xml_sha         = 32'hAAAA_AAAA;
        xml_ver         = 32'h5555_5555;
        mylib0_ver      = 32'h0000_FFFF;
        mylib0_sha      = 32'hFFFF_0000;
        mylib1_ver      = 32'h0000_0000;
        mylib1_sha      = 32'hAAAA_AAAA;
        myextlib_sha    = 32'h5555_5555;
        flavour         = 32'h0000_FFFF;
        device_dna_reg  = {7'h0, 57'h1A5_CAFE_DEAD_BEEF};

        $display("Starting Reset...");
        #20;
        s00_axi_aresetn = 1;
        #200;
        $display("Reset released. Starting Register Check...");

        test_passed = 1;

        // 3. Цикл проверки регистров 0..19
        for (i = 0; i <= 19; i = i + 1) begin
            read_register(i * ADDR_STEP, expected_data);

            if (s00_axi_rdata !== expected_data) begin
                $display("[FAIL] Reg %0d (Addr %0h): Expected %0h, Got %0h", i, i * ADDR_STEP, expected_data,
                         s00_axi_rdata);
                test_passed = 0;
            end
            else begin
                $display("[PASS] Reg %0d (Addr %0h): %0h", i, i * ADDR_STEP, s00_axi_rdata);
            end
        end

        if (test_passed) begin
            $display("==========================================");
            $display("ALL TESTS PASSED SUCCESSFULLY!");
            $display("==========================================");
        end
        else begin
            $display("==========================================");
            $display("TESTS FAILED!");
            $display("==========================================");
        end

        #50;
        $finish;
    end

    // ------------------------------------------------------------------
    // Task для чтения по AXI Lite
    // ------------------------------------------------------------------
    task read_register(input [31:0] addr, output reg [31:0] data_out);
        begin
            @(posedge s00_axi_aclk);
            s00_axi_araddr  = addr[C_S00_AXI_ADDR_WIDTH-1:0];
            s00_axi_arprot  = 3'b000;  // Normal access
            s00_axi_arvalid = 1;

            wait (s00_axi_arready);
            @(posedge s00_axi_aclk);
            s00_axi_arvalid = 0;
            s00_axi_araddr  = 0;

            wait (s00_axi_rvalid);
            data_out = s00_axi_rdata;

            @(posedge s00_axi_aclk);
        end
    endtask

endmodule
