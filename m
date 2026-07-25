Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290C7C531FC
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 01:01:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnQlT-0000r2-9w; Fri, 24 Jul 2026 21:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTH-0006wY-Lh
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:31 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTF-0000nn-Pi
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:31 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-5bf959b820cso615899e0c.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 17:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784940149; x=1785544949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ULQiUUKETfl5XXs6acGhTrFSt59xD9witMzeBOvlHc8=;
 b=sYBR1HoYv5RW/zbBYs6hPF1pMT90NyWCvrVfyTmkrfpQJkTgDv0zcvf6pYXVD9anOc
 ycijKnQMGxJHZ7sjk2PPHsT0zVdjO/6f9tqVhNbJhxb6nG0aLRomcdSwCrw3TGxMROIB
 lkQQ1qnIhnklDHS+J4xtix3OjakO1qMzzR8Y7PTlE0bYA3eto3PJpTOLEQstiGfpkuS0
 XdplxH4PHUZBZMRHvuy9YDjl/dhLX6hjaes3xeSfvO2gywnqBa8AxviL5Ipje5QUn21P
 aMncfJKmj3F27TldGygX3rqrY+yrhu7vcAN/RkK8lW6fu8XQnGPEMXLrDZ1m3HyEm3Bv
 k3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784940149; x=1785544949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ULQiUUKETfl5XXs6acGhTrFSt59xD9witMzeBOvlHc8=;
 b=oguH0V/2UvWzL/E3G0ut0wLedaFrvWCtlzZGAYkV/f89xgC960u/LxpaUldFHDL2ZV
 hTWMVbfZuoL+kopAQLKwi9SHhrdq0Po7HUMPK2qTUF82yJUphc8vdTHPl+ZEkVdLgV7/
 3veQMkwqj/4vLzcX6WO7WroAum61XGKCy2ZLAVCjhBInInsc29IswziRKLRn6xHGLIbz
 7gk7qooGOOFbw3W/N2bNr4HThyrzHcZ4HDX4oODTcMaSlJM4FVaPfjjd3TXd5UekhezU
 uEDga/XotW7J/vam+e/nZ5sqFhGA/mbxV0TQJCphLUhlYrhvDwrDuTJIc5DwuCix8Xzc
 Z6fg==
X-Gm-Message-State: AOJu0Yy19ibSrhN0cdGHCAVGekPMRkW0OdVaWygfAU/nklO2oCMNfZbn
 9+4KhcKmgejLlzVy5l7Jj+G9Df8EszHNFRBSbbq1URlZgDZwmFSn0erm
X-Gm-Gg: AR+sD12p2z+ZhmkcORZ+lso8uitVwpHiuZLDSW0DLtE/WtQGMTLda3YBPtY/Mk+aatG
 WKWC7MAtntN1MODw2Yd+LsH7XjRsyncJwYZlS5Ka3O9vOHRB7dhGECoOE5pZRFjCYOn1ON/iHA5
 7k67mYALMFxmYLsQl5fXRBf3TM6H9o6cIbBI7T2SLK1szHkx3z4u4ZKtbeX05rgjGSGDg4nJB93
 T+tIyCOxd6wKAUwMNG5vZ/HU+UjrTyX87dqDNcxLJkO+GWmAVri4TXdhFEiflVZFMkrxq0jEZXc
 VwWLs4CAqKFt91VccSrzzRbMl2TcsMPWeiY2FL2jTOvBxRUy3pnBdomUasH17A+ayoalZhAX8gT
 x8BnA28HK7BaMjnhZM25XPLn5+Zi24S6uFQSzXyv/axILWDCIE+zow9YKiOoDCHgPbXtah1F9Tr
 GV/gDvQKORUVUVS+5s75QDXcu3ReRVqC89
X-Received: by 2002:a05:6102:570f:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-750407b9b29mr680225137.20.1784940148748; 
 Fri, 24 Jul 2026 17:42:28 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774f12690sm930591241.12.2026.07.24.17.42.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jul 2026 17:42:27 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Sergey Kambalin <serg.oker@gmail.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 06/19] hw/net/bcm2838_genet: add GENET register structs,
 part 2/4
Date: Fri, 24 Jul 2026 20:42:05 -0400
Message-ID: <20260725004219.66222-7-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260725004219.66222-1-marcelomanzo@gmail.com>
References: <20260725004219.66222-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 21:00:27 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Sergey Kambalin <serg.oker@gmail.com>

Add the UMAC (CMD, MAC address, MDIO command) and DMA (ring config,
control, producer/consumer index, status, RX descriptor
length/status) register layouts and their field accessors.

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/net/bcm2838_genet.c         | 89 ++++++++++++++++++++++++++++++++++
 include/hw/net/bcm2838_genet.h | 89 ++++++++++++++++++++++++++++++++++
 2 files changed, 178 insertions(+)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index ff6602c1..02ce3e34 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -20,6 +20,7 @@
 #include "hw/net/bcm2838_genet.h"
 #include "trace.h"
 
+/* GENET layouts */
 REG32(GENET_SYS_REV_CTRL,              0)
 FIELD(GENET_SYS_REV_CTRL, GPHY_REV,    0, 16)
 FIELD(GENET_SYS_REV_CTRL, MINOR_REV,   16, 4)
@@ -56,6 +57,94 @@ REG32(GENET_INTRL_1,              0)
 FIELD(GENET_INTRL_1, TX_INTRS,    0, 16)
 FIELD(GENET_INTRL_1, RX_INTRS,    16, 16)
 
+REG32(GENET_UMAC_CMD,                  0)
+FIELD(GENET_UMAC_CMD, TX_EN,           0, 1)
+FIELD(GENET_UMAC_CMD, RX_EN,           1, 1)
+FIELD(GENET_UMAC_CMD, SPEED,           2, 2)
+FIELD(GENET_UMAC_CMD, PROMISC,         4, 1)
+FIELD(GENET_UMAC_CMD, PAD_EN,          5, 1)
+FIELD(GENET_UMAC_CMD, CRC_FWD,         6, 1)
+FIELD(GENET_UMAC_CMD, PAUSE_FWD,       7, 1)
+FIELD(GENET_UMAC_CMD, RX_PAUSE_IGNORE, 8, 1)
+FIELD(GENET_UMAC_CMD, TX_ADDR_INS,     9, 1)
+FIELD(GENET_UMAC_CMD, HD_EN,           10, 1)
+FIELD(GENET_UMAC_CMD, SW_RESET_OLD,    11, 1)
+FIELD(GENET_UMAC_CMD, RSVD_12,         12, 1)
+FIELD(GENET_UMAC_CMD, SW_RESET,        13, 1)
+FIELD(GENET_UMAC_CMD, RSVD_14,         14, 1)
+FIELD(GENET_UMAC_CMD, LCL_LOOP_EN,     15, 1)
+FIELD(GENET_UMAC_CMD, RSVD_16_21,      16, 6)
+FIELD(GENET_UMAC_CMD, AUTO_CONFIG,     22, 1)
+FIELD(GENET_UMAC_CMD, CNTL_FRM_EN,     23, 1)
+FIELD(GENET_UMAC_CMD, NO_LEN_CHK,      24, 1)
+FIELD(GENET_UMAC_CMD, RMT_LOOP_EN,     25, 1)
+FIELD(GENET_UMAC_CMD, RX_ERR_DISC,     26, 1)
+FIELD(GENET_UMAC_CMD, PRBL_EN,         27, 1)
+FIELD(GENET_UMAC_CMD, TX_PAUSE_IGNORE, 28, 1)
+FIELD(GENET_UMAC_CMD, TX_RX_EN,        29, 1)
+FIELD(GENET_UMAC_CMD, RUNT_FILTER_DIS, 30, 1)
+FIELD(GENET_UMAC_CMD, RSVD_31,         31, 1)
+
+REG32(GENET_UMAC_MAC_0,         0)
+FIELD(GENET_UMAC_MAC_0, ADDR_3, 0,  8)
+FIELD(GENET_UMAC_MAC_0, ADDR_2, 8,  8)
+FIELD(GENET_UMAC_MAC_0, ADDR_1, 16, 8)
+FIELD(GENET_UMAC_MAC_0, ADDR_0, 24, 8)
+
+REG32(GENET_UMAC_MAC_1,             0)
+FIELD(GENET_UMAC_MAC_1, ADDR_5,     0,  8)
+FIELD(GENET_UMAC_MAC_1, ADDR_4,     8,  8)
+FIELD(GENET_UMAC_MAC_1, RSVD_16_31, 16, 8)
+
+REG32(GENET_UMAC_MDIO_CMD,             0)
+FIELD(GENET_UMAC_MDIO_CMD, REG_DATA,   0, 16)
+FIELD(GENET_UMAC_MDIO_CMD, REG_ID,     16, 5)
+FIELD(GENET_UMAC_MDIO_CMD, PHY_ID,     21, 5)
+FIELD(GENET_UMAC_MDIO_CMD, WR,         26, 1)
+FIELD(GENET_UMAC_MDIO_CMD, RD,         27, 1)
+FIELD(GENET_UMAC_MDIO_CMD, RD_FAIL,    28, 1)
+FIELD(GENET_UMAC_MDIO_CMD, START_BUSY, 29, 1)
+FIELD(GENET_UMAC_MDIO_CMD, RSVD_30_31, 30, 2)
+
+REG32(GENET_DMA_RING_CFG,             0)
+FIELD(GENET_DMA_RING_CFG, EN,         0, 17)
+FIELD(GENET_DMA_RING_CFG, RSVD_17_31, 17, 14)
+
+REG32(GENET_DMA_CTRL,              0)
+FIELD(GENET_DMA_CTRL, EN,          0, 1)
+FIELD(GENET_DMA_CTRL, RING_BUF_EN, 1, 17)
+FIELD(GENET_DMA_CTRL, RSVD_18_19,  18, 2)
+FIELD(GENET_DMA_CTRL, TSB_SWAP_EN, 20, 1)
+FIELD(GENET_DMA_CTRL, RSVD_21_31,  21, 11)
+
+REG32(GENET_DMA_PROD_INDEX,              0)
+FIELD(GENET_DMA_PROD_INDEX, INDEX,       0, 16)
+FIELD(GENET_DMA_PROD_INDEX, DISCARD_CNT, 16, 16)
+
+REG32(GENET_DMA_CONS_INDEX,             0)
+FIELD(GENET_DMA_CONS_INDEX, INDEX,      0, 16)
+FIELD(GENET_DMA_CONS_INDEX, RSVD_16_31, 16, 16)
+
+REG32(GENET_DMA_STATUS,                     0)
+FIELD(GENET_DMA_STATUS, DISABLED,           0, 1)
+FIELD(GENET_DMA_STATUS, DESC_RAM_INIT_BUSY, 1, 1)
+FIELD(GENET_DMA_STATUS, RSVD_2_31,          2, 30)
+
+REG32(GENET_RDMA_LENGTH_STATUS,             0)
+FIELD(GENET_RDMA_LENGTH_STATUS, OVERRUN,    0, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, CRC_ERROR,  1, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, RXERR,      2, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, NO,         3, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, LG,         4, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, MULTICAST,  5, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, BROADCAST,  6, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, RSVD_7_11,  7, 5)
+FIELD(GENET_RDMA_LENGTH_STATUS, WRAP,       12, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, SOP,        13, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, EOP,        14, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, OWN,        15, 1)
+FIELD(GENET_RDMA_LENGTH_STATUS, BUFLENGTH,  16, 12)
+FIELD(GENET_RDMA_LENGTH_STATUS, RSVD_28_31, 29, 4)
 
 static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
 {
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index af5e8abd..b3893c2d 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -18,6 +18,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_REV_MAJOR         6
 #define BCM2838_GENET_REV_MINOR         0
 
+#define BCM2838_GENET_DMA_DESC_CNT      256
+#define BCM2838_GENET_DMA_RING_CNT      17
+#define BCM2838_GENET_DMA_RING_DEFAULT  (BCM2838_GENET_DMA_RING_CNT - 1)
+
 typedef struct {
     uint32_t rev_ctrl;
     uint32_t port_ctrl;
@@ -83,6 +87,88 @@ typedef struct {
     uint32_t reserved_0x18[58];
 } BCM2838GenetRegsTbuf;
 
+typedef struct {
+    uint32_t reserved_0x0;
+    uint32_t hd_bkp_ctrl;
+    uint32_t cmd;
+    uint32_t mac0;
+    uint32_t mac1;
+    uint32_t max_frame_len;
+    uint32_t pause_quanta;
+    uint32_t reserved_0x1C[10];
+    uint32_t mode;
+    uint32_t frm_tag0;
+    uint32_t frm_tag1;
+    uint32_t reserved_0x50[3];
+    uint32_t tx_ipg_len;
+    uint32_t reserved_0x60;
+    uint32_t eee_ctrl;
+    uint32_t eee_lpi_timer;
+    uint32_t eee_wake_timer;
+    uint32_t eee_ref_count;
+    uint32_t reserved_0x74;
+    uint32_t rx_ipg_inv;
+    uint32_t reserved_0x7C[165];
+    uint32_t macsec_prog_tx_crc;
+    uint32_t macsec_ctrl;
+    uint32_t reserved_0x318[6];
+    uint32_t pause_ctrl;
+    uint32_t tx_flush;
+    uint32_t rx_fifo_status;
+    uint32_t tx_fifo_status;
+    uint32_t reserved_0x340[48];
+    uint32_t mib[96];
+    uint32_t mib_ctrl;
+    uint32_t reserved_0x584[36];
+    uint32_t mdio_cmd;
+    uint32_t reserved_0x618[2];
+    uint32_t mpd_ctrl;
+    uint32_t mpd_pw_ms;
+    uint32_t mpd_pw_ls;
+    uint32_t reserved_0x62C[3];
+    uint32_t mdf_err_cnt;
+    uint32_t reserved_0x63C[5];
+    uint32_t mdf_ctrl;
+    uint32_t mdf_addr;
+    uint32_t reserved_0x658[106];
+} BCM2838GenetRegsUmac;
+
+typedef struct {
+    uint32_t length_status;
+    uint32_t address_lo;
+    uint32_t address_hi;
+} BCM2838GenetRdmaDesc;
+
+typedef struct {
+    uint32_t write_ptr;
+    uint32_t write_ptr_hi;
+    uint32_t prod_index;
+    uint32_t cons_index;
+    uint32_t ring_buf_size;
+    uint32_t start_addr;
+    uint32_t start_addr_hi;
+    uint32_t end_addr;
+    uint32_t end_addr_hi;
+    uint32_t mbuf_done_tresh;
+    uint32_t xon_xoff_tresh;
+    uint32_t read_ptr;
+    uint32_t read_ptr_hi;
+    uint32_t reserved_0x34[3];
+} BCM2838GenetRdmaRing;
+
+typedef struct {
+    BCM2838GenetRdmaDesc descs[BCM2838_GENET_DMA_DESC_CNT];
+    BCM2838GenetRdmaRing rings[BCM2838_GENET_DMA_RING_CNT];
+    uint32_t ring_cfg;
+    uint32_t ctrl;
+    uint32_t status;
+    uint32_t scb_burst_size;
+    uint32_t reserved_0x1050[7];
+    uint32_t ring_timeout[17];
+    uint32_t index2ring[8];
+    uint32_t reserved_0x10D0[972];
+} BCM2838GenetRegsRdma;
+
 typedef struct {
     BCM2838GenetRegsSys sys;
     BCM2838GenetRegsGrBridge gr_bridge;
@@ -95,6 +181,9 @@ typedef struct {
     uint32_t reserved_0x400[128];
     BCM2838GenetRegsTbuf tbuf;
     uint32_t reserved_0x700[64];
+    BCM2838GenetRegsUmac umac;
+    uint32_t reserved_0x1000[1024];
+    BCM2838GenetRegsRdma rdma;
 } BCM2838GenetRegs;
 
 struct BCM2838GenetState {
-- 
2.47.1


