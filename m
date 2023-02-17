Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1535084ejb;
        Fri, 17 Feb 2023 06:18:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+lSfU2VdPESi1OwiLLozYk1HQ2+FCE3BeoNADfAsYJkFpG5dVGtQ4hTCwAzBHWyEJBTL6w
X-Received: by 2002:a05:622a:548:b0:3bd:16cf:2f10 with SMTP id m8-20020a05622a054800b003bd16cf2f10mr5983778qtx.35.1676643536990;
        Fri, 17 Feb 2023 06:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676643536; cv=none;
        d=google.com; s=arc-20160816;
        b=zlX4kefOyjckiKcHIutOIE/MrWTAbPmbkcpta8ryHDbVLkbL6k05DMtb1JEhl86rG3
         L2P9Uh+wBiH9FeC8I7aWTTmgYF5bUZ1qiu087LIq7Jmc/s4SdfPWyLAHE4UUb9DX1sWb
         rr8i/tbIKWqKKQYL0ucLbET8B0vC2ihkF82jc4nid3GxJkpxbIun99LsnVmAzE2twsep
         5i+jiX0PPy887A/oFJW8ANjfAsVpYxlGKnKgIMSKLgOyAMx6qWh+jLGpy6RGSsq7sVlK
         rP6S/CP/tu7mTlbSwQ0yM22OF9ourx64y6PkonjgPEaZLYQVu0EJgjiB/qe/Ib2Grc1f
         HQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RjdDodn6okK5s7aO7117Qvyuzzh/B0SLO+sTBQ/Rvlo=;
        b=Yh2RGQOulnf4SgtVe9W7OQ91iMgoBA73vvhOHduw5dqBgiuRDLr/ticwoWJL79wHHw
         peNnOBcVxlwnJF/xGBz6e0lDpNmAo8eeAleFa8OVhx6DSdnjKcN40I5jWrqzsVgF6i2F
         j1mbvfBqTVtnz0ygSq/LXK+65BcCRyEljCLzwCqnO56hcsCTIIVxMCOj7JY6LUid/wQd
         cRayzZc5C5LlREVGIS2PWuQn58JhsE9cByYkKJUlu8G5ABIPg6Rz6Q51B/Zt47IWCXxW
         AFI8XPab+fiBDxAwpnayG9/sdUA2R0AFdKozWJSNRk2IerLwtifKzc7Qhyo4o7DEAX2I
         c8YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="iNHWOi/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05620a280900b00708f55b1be2si3823082qkp.54.2023.02.17.06.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 06:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="iNHWOi/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pT1ZB-0004Pf-Lj; Fri, 17 Feb 2023 09:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pSxGN-0003r2-9M; Fri, 17 Feb 2023 04:42:47 -0500
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pSxGG-0000ba-TR; Fri, 17 Feb 2023 04:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RjdDo
 dn6okK5s7aO7117Qvyuzzh/B0SLO+sTBQ/Rvlo=; b=iNHWOi/2Q7Q4lefkYrYi0
 uNzWHxLMcYXIThiCRer0cVJcVkLBuj9elf1IJUjgAf++7/LmgjXGM4y+yleCinMa
 avXCSv8wC2QiizIlMzmjERA5rxrS3e+Qpmc/E0GY6kxs+AKzNgAq3TGJk3gsQzJn
 vAh1kiUgbv7UjkHm6vX+Yc=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.20])
 by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wBnbAHwS+9jgz5zAA--.48578S2;
 Fri, 17 Feb 2023 17:42:08 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 1/2] hw: allwinner-i2c: Make the trace message more readable
Date: Fri, 17 Feb 2023 17:42:06 +0800
Message-Id: <20230217094207.16882-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnbAHwS+9jgz5zAA--.48578S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ar1Duw1UJF1fZw4UAr13Arb_yoW7GrykpF
 ZIkrsIgFy5Kas0vr1SkF1DJF1rJrykCr1Iyw47J347ZFyUG3W3ZF95JF4rt390k347trW5
 CFW5ZFy2gFZ0ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRqLviUUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBugUZ7V+GuN3OiwAAsy
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Feb 2023 09:18:22 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IH3mxtB/gEDK

From: qianfan Zhao <qianfanguijin@163.com>

Next is an example when allwinner_i2c_rw enabled:

allwinner_i2c_rw write   CNTR[0x0c]: 50 { M_STP BUS_EN  }
allwinner_i2c_rw write   CNTR[0x0c]: e4 { A_ACK M_STA BUS_EN INT_EN  }
allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
allwinner_i2c_rw  read   STAT[0x10]: 08 { STAT_M_STA_TX }

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/i2c/allwinner-i2c.c | 90 +++++++++++++++++++++++++++++++++++++++++-
 hw/i2c/trace-events    |  4 +-
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index a435965836..36b387520f 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -129,6 +129,39 @@ enum {
     STAT_IDLE = 0x1f
 } TWI_STAT_STA;
 
+#define TWI_STAT_STA_DESC(sta)  [sta] = #sta
+static const char *twi_stat_sta_descriptors[] = {
+    TWI_STAT_STA_DESC(STAT_BUS_ERROR),
+    TWI_STAT_STA_DESC(STAT_M_STA_TX),
+    TWI_STAT_STA_DESC(STAT_M_RSTA_TX),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_ACK),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_NACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_TX_ACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_TX_NACK),
+    TWI_STAT_STA_DESC(STAT_M_ARB_LOST),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_ACK),
+    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_NACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_RX_ACK),
+    TWI_STAT_STA_DESC(STAT_M_DATA_RX_NACK),
+    TWI_STAT_STA_DESC(STAT_S_ADDR_WR_ACK),
+    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AW_ACK),
+    TWI_STAT_STA_DESC(STAT_S_GCA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_GCA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_NACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_NACK),
+    TWI_STAT_STA_DESC(STAT_S_STP_RSTA),
+    TWI_STAT_STA_DESC(STAT_S_ADDR_RD_ACK),
+    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AR_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_TX_ACK),
+    TWI_STAT_STA_DESC(STAT_S_DATA_TX_NACK),
+    TWI_STAT_STA_DESC(STAT_S_LB_TX_ACK),
+    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_ACK),
+    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_NACK),
+    TWI_STAT_STA_DESC(STAT_IDLE),
+};
+
 static const char *allwinner_i2c_get_regname(unsigned offset)
 {
     switch (offset) {
@@ -155,6 +188,59 @@ static const char *allwinner_i2c_get_regname(unsigned offset)
     }
 }
 
+static const char *twi_cntr_reg_bits[] = {
+    [2] = "A_ACK",
+    [3] = "INT_FLAG",
+    [4] = "M_STP",
+    [5] = "M_STA",
+    [6] = "BUS_EN",
+    [7] = "INT_EN",
+};
+
+static void trace_buffer_append_bit_descriptors(char *s, size_t sz,
+                                                unsigned int value,
+                                                unsigned int start,
+                                                unsigned int end,
+                                                const char **desc_arrays)
+{
+    for (; start <= end; start++) {
+        if (value & (1 << start)) {
+            strncat(s, desc_arrays[start], sz - 1);
+            strncat(s, " ", sz - 1);
+        }
+    }
+}
+
+static void allwinner_i2c_trace_rw(int is_write, unsigned int offset,
+                                   unsigned int value)
+{
+    char s[256] = { 0 };
+
+    snprintf(s, sizeof(s), "%s %6s[0x%02x]: %02x ",
+             is_write ? "write": " read",
+             allwinner_i2c_get_regname(offset), offset,
+             value);
+
+    switch (offset) {
+    case TWI_CNTR_REG:
+        strncat(s, "{ ", sizeof(s) - 1);
+        trace_buffer_append_bit_descriptors(s, sizeof(s), value,
+                                            2, 7, twi_cntr_reg_bits);
+        strncat(s, " }", sizeof(s) - 1);
+        break;
+    case TWI_STAT_REG:
+        if (STAT_TO_STA(value) <= STAT_IDLE) {
+            strncat(s, "{ ", sizeof(s) - 1);
+            strncat(s, twi_stat_sta_descriptors[STAT_TO_STA(value)],
+                    sizeof(s) - 1);
+            strncat(s, " }", sizeof(s) - 1);
+        }
+        break;
+    }
+
+    trace_allwinner_i2c_rw(s);
+}
+
 static inline bool allwinner_i2c_is_reset(AWI2CState *s)
 {
     return s->srst & TWI_SRST_MASK;
@@ -271,7 +357,7 @@ static uint64_t allwinner_i2c_read(void *opaque, hwaddr offset,
         break;
     }
 
-    trace_allwinner_i2c_read(allwinner_i2c_get_regname(offset), offset, value);
+    allwinner_i2c_trace_rw(0, (unsigned int)offset, (unsigned int)value);
 
     return (uint64_t)value;
 }
@@ -283,7 +369,7 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
 
     value &= 0xff;
 
-    trace_allwinner_i2c_write(allwinner_i2c_get_regname(offset), offset, value);
+    allwinner_i2c_trace_rw(1, (unsigned int)offset, (unsigned int)value);
 
     switch (offset) {
     case TWI_ADDR_REG:
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 8e88aa24c1..fa5e8d5021 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -16,9 +16,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 i2c_ack(void) ""
 
 # allwinner_i2c.c
-
-allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t value) "read %s [0x%" PRIx64 "]: -> 0x%" PRIx64
-allwinner_i2c_write(const char* reg_name, uint64_t offset, uint64_t value) "write %s [0x%" PRIx64 "]: <- 0x%" PRIx64
+allwinner_i2c_rw(const char *s) "%s"
 
 # aspeed_i2c.c
 
-- 
2.25.1

