Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp452733njb;
        Thu, 4 Jul 2024 01:30:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFq18nl6h5BkJ0ZY+841JxDHB1MD77NCx1l9/o+FO+PbaFaIUpUur8NZYA70qctJwztlXKjWJ/NJWkT55yn3aWQFm6QLPG
X-Google-Smtp-Source: AGHT+IG1nlPkMC3awn49cxwrWMH7CxyAxSb8RFJ4coTSrBTXZ3vUPzrszaGgB7vXcKhM2lQP2fcV
X-Received: by 2002:a05:620a:2683:b0:79d:764f:ba77 with SMTP id af79cd13be357-79eee1c13d5mr144624085a.36.1720081857150;
        Thu, 04 Jul 2024 01:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720081857; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQz5wgi5SkYGqm/1QsIMxaA9zLjQJwgOFlFgsEXbXQMQPimI5iaU/Hfng2mcSvN8jf
         m4a9wSSPDmLS2XTPSedyBSGmXqQfpaNglOK4lsm1IPOw25cL/dr1YMLF0VzRW2doMFlk
         zATvqqqxL/tJT9dVZtkHV2tKzDORhx9hGYNMjktL0fEPCXqMF7SQ0/Vb+ulRdWFkBUGY
         f+vuOw6Ph1eb1XiDW0RqhVqhiaHkbfCYrLHt5cTFIKjmNOC/rUN7JBXMBFijYyJEJaAf
         zprfiLLhdzEnQQBxd5Yk/5vD/+yBkJyTz89HUAFbciX9nwc8H+sKTx1lADZSaLqTfKDH
         2vFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eF2F/z8wr5tM2lQmhRg+Fg3ltciY7zaZhTfLdzU3e5E=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=YSuxwPRCGg7Sgr4oQWk1qDgExvGyZ8HYeN4CARY/pksOBXLinYKlSQfpxRgOHwmS3M
         eg5za6IKyy/IvToBprATk6eywYYVLTE08D1W8QIDS4c+ZuRVsEv0svwm8izIQ+7OmmQz
         UK++Vf+cS+aFYYwWrP2WKKE26p/ggM0HT+fv8edjGwYALNfi3PlGcorQd3/GUSTKdq3R
         CwO3nQ2rpaJkdSapKVBaEmpER+D5OBC0LBSFKqQt5DRBpyk+gAfVhlPCN8qZZn9WjPBK
         rqVwtvkRYS1rbdfrP8rPh0f/nvrgv+MsNc/PnkKzu5CvrsHaL+uJZ7Z47m5FmHI9AWep
         Poyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f043esi1404641485a.281.2024.07.04.01.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPHqh-0000TF-UN; Thu, 04 Jul 2024 04:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqg-0000Ss-S2; Thu, 04 Jul 2024 04:29:50 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqf-0002HT-9N; Thu, 04 Jul 2024 04:29:50 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 4 Jul
 2024 16:29:23 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 4 Jul 2024 16:29:23 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 4/8] hw/net:ftgmac100: update TX and RX packet buffers
 address to 64 bits
Date: Thu, 4 Jul 2024 16:29:18 +0800
Message-ID: <20240704082922.1464317-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bo+3mmEFk6Ln

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
And the base address of dram is "0x4 00000000" which
is 64bits address.

It have "TXDES 2" and "RXDES 2" to save the high part
physical address of packet buffer.
Ex: TX packet buffer address [34:0]
The "TXDES 2" bits [18:16] which corresponds the bits [34:32]
of the 64 bits address of the TX packet buffer address
and "TXDES 3" bits [31:0] which corresponds the bits [31:0]
of the 64 bits address of the TX packet buffer address.

Update TX and RX packet buffers address type to
64 bits for dram 64 bits address DMA support.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/net/ftgmac100.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 68956aeb94..80f9cd56d5 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -175,6 +175,8 @@
 #define FTGMAC100_TXDES1_TX2FIC          (1 << 30)
 #define FTGMAC100_TXDES1_TXIC            (1 << 31)
 
+#define FTGMAC100_TXDES2_TXBUF_BADR_HI(x)   (((x) >> 16) & 0x7)
+
 /*
  * Receive descriptor
  */
@@ -208,13 +210,15 @@
 #define FTGMAC100_RXDES1_UDP_CHKSUM_ERR  (1 << 26)
 #define FTGMAC100_RXDES1_IP_CHKSUM_ERR   (1 << 27)
 
+#define FTGMAC100_RXDES2_RXBUF_BADR_HI(x)   (((x) >> 16) & 0x7)
+
 /*
  * Receive and transmit Buffer Descriptor
  */
 typedef struct {
     uint32_t        des0;
     uint32_t        des1;
-    uint32_t        des2;        /* not used by HW */
+    uint32_t        des2;        /* used by HW 64 bits DMA */
     uint32_t        des3;
 } FTGMAC100Desc;
 
@@ -531,6 +535,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint64_t tx_ring,
     int frame_size = 0;
     uint8_t *ptr = s->frame;
     uint64_t addr = tx_descriptor;
+    uint64_t buf_addr = 0;
     uint32_t flags = 0;
 
     while (1) {
@@ -569,7 +574,12 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint64_t tx_ring,
             len =  sizeof(s->frame) - frame_size;
         }
 
-        if (dma_memory_read(&address_space_memory, bd.des3,
+        buf_addr = bd.des3;
+        if (s->dma64) {
+            buf_addr = deposit64(buf_addr, 32, 32,
+                                 FTGMAC100_TXDES2_TXBUF_BADR_HI(bd.des2));
+        }
+        if (dma_memory_read(&address_space_memory, buf_addr,
                             ptr, len, MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ 0x%x\n",
                           __func__, bd.des3);
@@ -1022,7 +1032,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
     uint32_t flags = 0;
     uint64_t addr;
     uint32_t crc;
-    uint32_t buf_addr;
+    uint64_t buf_addr = 0;
     uint8_t *crc_ptr;
     uint32_t buf_len;
     size_t size = len;
@@ -1087,7 +1097,12 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         if (size < 4) {
             buf_len += size - 4;
         }
+
         buf_addr = bd.des3;
+        if (s->dma64) {
+            buf_addr = deposit64(buf_addr, 32, 32,
+                                 FTGMAC100_RXDES2_RXBUF_BADR_HI(bd.des2));
+        }
         if (first && proto == ETH_P_VLAN && buf_len >= 18) {
             bd.des1 = lduw_be_p(buf + 14) | FTGMAC100_RXDES1_VLANTAG_AVAIL;
 
-- 
2.34.1

