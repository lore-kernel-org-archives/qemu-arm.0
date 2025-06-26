Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp83279dye;
        Thu, 26 Jun 2025 00:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLtlUYeixBGH45REN4uy9Hap/yhZOQNyJNvOo4UwkZtRYLsOyhXfItk/Kh/8gSNE7tcxUlBqptlpjmKw==@linaro.org
X-Google-Smtp-Source: AGHT+IFwitddfP4H9JEjA3ncfTvGgFcNLx4y5i+8r2zckOKqwPFrqwqPggXYOw+G6tN76i0RC+zm
X-Received: by 2002:a05:600c:444c:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-45381b1366emr55950835e9.25.1750924676170;
        Thu, 26 Jun 2025 00:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750924676; cv=none;
        d=google.com; s=arc-20240605;
        b=GNKmG9WIdAxhzA+01zoLLXO3XM5/wmlTCGZy4Roahn2QsJPrHJlX8/n3REqXBM6f/Z
         Mips1EU1LMpTfVRoHeUHMmueojMAb0H0Yli9FkZ6vS6lFy8XZlOZg+6xS6ZIPXEhnK1d
         uVsSuTlTlABv2he4jf7aOqcHdNe5gThFR6mSVBTOJWlsZKl5A8IA3GTXAdgrFOD9zzlH
         AZOBBJdk0vcDXMsGrHaw6actwoZAxfqS053j+1wsm+OmJSQ9OtY4+6PM8zV+U4HGlJwT
         UWT3vyUdTwaZD0aGZ2G+IbHu9VVu5Eu5cgvSxBostzJ4Fe4+FTwSJ0XpotMOBN1PIxt/
         4oYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JLkbcahruFVoNIdrJlxNplaoS3STJNsBONFjfS/3lyc=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=dzVqSduJIOwylw/jHm9n1+37FY9HOSX0X4Ugl0mSNn5/013Si5yYllS3nRhGtQ3KT+
         TKepEjf/sssg1zTr+sbO2gKN+hDGmenLaOfaffWZzW5Q5+TOZ9q+xB8D7MmoumE4+e3W
         iMhYRS9IKLSPpQmEJhapmKHVCRrDa9qqx24FIxHGvxj3gnRApyImz+WKuzaz0Eh9a69P
         eCTfDHjYCSLJwBgGZhQ1UIrveMx/zUp3T7m93/RgWPIl7SNFH1gGj1fzwtOs5P8RT8fV
         e4Uxa5TLjAVNBejEpxsp08L4l873cRbEyMgzUu9b79NmQ/lgPrafdtAERdUbWePWpE7Q
         xAsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80fbf4fsi4393959f8f.509.2025.06.26.00.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 00:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uUhUI-00046Y-63; Thu, 26 Jun 2025 03:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhUG-00045M-8B; Thu, 26 Jun 2025 03:57:36 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhUE-0003xl-4u; Thu, 26 Jun 2025 03:57:35 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 15:57:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 15:57:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v1 2/3] hw/misc/aspeed_sbc: Connect ASPEED OTP memory device
 to SBC
Date: Thu, 26 Jun 2025 15:57:09 +0800
Message-ID: <20250626075711.1589039-3-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
References: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3/a/q72vflXi

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch connects the aspeed.otpmem device to the ASPEED Secure Boot
Controller (SBC) model. It implements OTP memory access via the SBC's
command interface and enables emulation of secure fuse programming flows.

The following OTP commands are supported:
  - READ: reads a 32-bit word from OTP memory into internal registers
  - PROG: programs a 32-bit word value to the specified OTP address

Trace events are added to observe read/program operations and command
handling flow.

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 include/hw/misc/aspeed_sbc.h |   5 ++
 hw/misc/aspeed_sbc.c         | 113 +++++++++++++++++++++++++++++++++++
 hw/misc/trace-events         |   5 ++
 3 files changed, 123 insertions(+)

diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 405e6782b9..667d6088c0 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -10,6 +10,7 @@
 #define ASPEED_SBC_H
 
 #include "hw/sysbus.h"
+#include "hw/misc/aspeed_otpmem.h"
 
 #define TYPE_ASPEED_SBC "aspeed.sbc"
 #define TYPE_ASPEED_AST2600_SBC TYPE_ASPEED_SBC "-ast2600"
@@ -36,10 +37,14 @@ struct AspeedSBCState {
     MemoryRegion iomem;
 
     uint32_t regs[ASPEED_SBC_NR_REGS];
+
+    AspeedOTPMemState otpmem;
 };
 
 struct AspeedSBCClass {
     SysBusDeviceClass parent_class;
+
+    bool has_otpmem;
 };
 
 #endif /* ASPEED_SBC_H */
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index a7d101ba71..5cbf55c216 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -15,9 +15,13 @@
 #include "hw/misc/aspeed_sbc.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define R_PROT          (0x000 / 4)
+#define R_CMD           (0x004 / 4)
+#define R_ADDR          (0x010 / 4)
 #define R_STATUS        (0x014 / 4)
+#define R_CAMP1         (0x020 / 4)
 #define R_QSR           (0x040 / 4)
 
 /* R_STATUS */
@@ -41,6 +45,10 @@
 #define QSR_RSA_MASK           (0x3 << 12)
 #define QSR_HASH_MASK          (0x3 << 10)
 
+/* OTP command */
+#define SBC_OTP_CMD_READ 0x23b1e361
+#define SBC_OTP_CMD_PROG 0x23b1e364
+
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedSBCState *s = ASPEED_SBC(opaque);
@@ -57,6 +65,87 @@ static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
     return s->regs[addr];
 }
 
+static bool aspeed_sbc_otpmem_read(AspeedSBCState *s,
+                                   uint32_t otp_addr, Error **errp)
+{
+    MemTxResult ret;
+    AspeedOTPMemState *otpmem = &s->otpmem;
+    uint32_t value, otp_offset;
+
+    otp_offset = otp_addr << 2;
+    ret = address_space_read(&otpmem->as, otp_offset, MEMTXATTRS_UNSPECIFIED,
+                             &value, sizeof(value));
+    if (ret != MEMTX_OK) {
+        error_setg(errp, "Failed to read OTP memory, addr = %x\n", otp_addr);
+        return false;
+    }
+    s->regs[R_CAMP1] = value;
+    trace_aspeed_sbc_otp_read(otp_addr, value);
+
+    return true;
+}
+
+static bool aspeed_sbc_otpmem_prog(AspeedSBCState *s,
+                                   uint32_t otp_addr, Error **errp)
+{
+    MemTxResult ret;
+    AspeedOTPMemState *otpmem = &s->otpmem;
+    uint32_t value = s->regs[R_CAMP1];;
+
+    ret = address_space_write(&otpmem->as, otp_addr, MEMTXATTRS_UNSPECIFIED,
+                        &value, sizeof(value));
+    if (ret != MEMTX_OK) {
+        error_setg(errp, "Failed to write OTP memory, addr = %x\n", otp_addr);
+        return false;
+    }
+
+    trace_aspeed_sbc_otp_prog(otp_addr, value);
+
+    return true;
+}
+
+static void aspeed_sbc_handle_command(void *opaque, uint32_t cmd)
+{
+    AspeedSBCState *s = ASPEED_SBC(opaque);
+    AspeedSBCClass *sc = ASPEED_SBC_GET_CLASS(opaque);
+    Error *local_err = NULL;
+    bool ret = false;
+    uint32_t otp_addr;
+
+    if (!sc->has_otpmem) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: OTP memory is not supported\n",
+                      __func__);
+        return;
+    }
+
+    s->regs[R_STATUS] &= ~(OTP_MEM_IDLE | OTP_IDLE);
+    otp_addr = s->regs[R_ADDR];
+
+    switch (cmd) {
+    case SBC_OTP_CMD_READ:
+        ret = aspeed_sbc_otpmem_read(s, otp_addr, &local_err);
+        break;
+    case SBC_OTP_CMD_PROG:
+        ret = aspeed_sbc_otpmem_prog(s, otp_addr, &local_err);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unknown command 0x%x\n",
+                      __func__, cmd);
+        break;
+    }
+
+    trace_aspeed_sbc_handle_cmd(cmd, otp_addr, ret);
+    if (ret == false && local_err) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: %s\n",
+                      __func__, error_get_pretty(local_err));
+        error_free(local_err);
+    }
+    s->regs[R_STATUS] |= (OTP_MEM_IDLE | OTP_IDLE);
+}
+
 static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
                               unsigned int size)
 {
@@ -78,6 +167,9 @@ static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
                       "%s: write to read only register 0x%" HWADDR_PRIx "\n",
                       __func__, addr << 2);
         return;
+    case R_CMD:
+        aspeed_sbc_handle_command(opaque, data);
+        return;
     default:
         break;
     }
@@ -115,6 +207,26 @@ static void aspeed_sbc_reset(DeviceState *dev)
     s->regs[R_QSR] = s->signing_settings;
 }
 
+static void aspeed_sbc_instance_init(Object *obj)
+{
+    AspeedSBCClass *sc = ASPEED_SBC_GET_CLASS(obj);
+    AspeedSBCState *s = ASPEED_SBC(obj);
+    Error *local_errp = NULL;
+    bool ret;
+
+    if (sc->has_otpmem) {
+        object_initialize_child(OBJECT(s), "otp", &s->otpmem,
+                                TYPE_ASPEED_OTPMEM);
+        ret = qdev_realize(DEVICE(&s->otpmem), NULL, &local_errp);
+        if (!ret && local_errp) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: %s\n",
+                          __func__, error_get_pretty(local_errp));
+            error_free(local_errp);
+        }
+    }
+}
+
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
 {
     AspeedSBCState *s = ASPEED_SBC(dev);
@@ -155,6 +267,7 @@ static const TypeInfo aspeed_sbc_info = {
     .name = TYPE_ASPEED_SBC,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(AspeedSBCState),
+    .instance_init = aspeed_sbc_instance_init,
     .class_init = aspeed_sbc_class_init,
     .class_size = sizeof(AspeedSBCClass)
 };
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index e3f64c0ff6..6f216a77fd 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -90,6 +90,11 @@ slavio_sysctrl_mem_readl(uint32_t ret) "Read system control 0x%08x"
 slavio_led_mem_writew(uint32_t val) "Write diagnostic LED 0x%04x"
 slavio_led_mem_readw(uint32_t ret) "Read diagnostic LED 0x%04x"
 
+# aspped_sbc.c
+aspeed_sbc_handle_cmd(uint32_t cmd, uint32_t addr, bool ret) "Handling command 0x%" PRIx32 " for OTP addr 0x%" PRIx32 " Result: %d"
+aspeed_sbc_otp_read(uint32_t addr, uint32_t value) "OTP Memory read: addr 0x%" PRIx32 " value 0x%" PRIx32
+aspeed_sbc_otp_prog(uint32_t addr, uint32_t value) "OTP Memory write: addr 0x%" PRIx32 " value 0x%" PRIx32
+
 # aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_scu_read(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-- 
2.43.0

