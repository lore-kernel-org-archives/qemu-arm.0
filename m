Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp75848njc;
        Wed, 18 Jun 2025 23:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRLKKnUl0i1ZZtjJP+fXodrzp3O/bdJRdjbK1uBeoeVk7woF/MlCcUrVpsMEtaCWLHyyFlCWdUkC0M4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHagZ01v4IBHGkxG28GVAsumtiU4AYjYBr501oI2ED610PwPsUwZtcoyELZ+lwF7W+neK4u
X-Received: by 2002:a05:6214:2b84:b0:6f2:a4cf:5fd7 with SMTP id 6a1803df08f44-6fb47799899mr312099196d6.45.1750315332024;
        Wed, 18 Jun 2025 23:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750315332; cv=none;
        d=google.com; s=arc-20240605;
        b=htPfHiXELEfRFQh6xUVxAt1i+Sly2gQnIeoS1AHXRU4RTjBkj0GGJhajrXTVqiv3jf
         ibQioNf4rr+zyOXn0vtwHb9LQe/FgEZ0opfhItkotVjhv65og3dcn9b1uexstH0VruGW
         gg0aEETL9z3srVzNdPc5vPGjPD/kDT9mHstkkFyEfZMhaO5rs4BdZPjfsgi8qMxTkqDr
         UZpDYA7zGxzyAQKRoaH6HCMpI94FbJHQ2BNRVhbpMWH6/SycGbWPRF8Hc/jM8imnsw+I
         3W/UzGNFd49uxhACkTqOEWE7kjAMhJ6+7PZvoPbtVOLiPaLrOiku34vr6h1QcajwRDCu
         RQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JJm6drq+sKXI+VcUWjCN/2l1yfGKe3VzXS7GoFTMlx8=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=PqLdWszmN5vqofQo/WeCd+2uFQdL0QGj/s3DF70WjJ0HS/6ts5L6NFFcDzuyE/R74W
         GJ5Kr+xXTWaLDTESWFqKwVUNT/z1sb+xtHSFgsBiSOHC+HL+VyOkFfYMlUCWXfqvFOKA
         XvxFrXvkXc3dPwWh0FLzK3paeMr1d15Rmg4ltjiGUxZo8T3w8pNzIjqkv4zOdKdfcGwn
         ur6KSzkjMgREKVA3aUGkuBVWgUWRTHINlVWAQ50vgp/3RErtri64NMLFj3ESdZpldsup
         4C2dxVKI2aANRrPeoS9WmVEtgDL+VWKJinRAEHSEaITNzywDQTlagTAfaIwpsxXJKdwd
         hVVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8df6422si1597941685a.132.2025.06.18.23.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 23:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uS8xt-0002Vo-Bd; Thu, 19 Jun 2025 02:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uS8xq-0002VE-Rn; Thu, 19 Jun 2025 02:41:35 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uS8xo-0001s1-Sc; Thu, 19 Jun 2025 02:41:34 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 19 Jun
 2025 14:41:16 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 19 Jun 2025 14:41:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [RFC v5 2/4] hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to
 SBC
Date: Thu, 19 Jun 2025 14:41:11 +0800
Message-ID: <20250619064115.4182202-3-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619064115.4182202-1-kane_chen@aspeedtech.com>
References: <20250619064115.4182202-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XPLKuhB6M9zL

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch connects the aspeed.otpmem device to the ASPEED Secure Boot
Controller (SBC) model. It implements OTP memory access via the SBC's
command interface and enables emulation of secure fuse programming flows.

The following OTP commands are supported:
  - READ: reads a 32-bit word from OTP memory into internal registers
  - PROG: programs a 32-bit word value to the specified OTP address

The integration supports both externally provided OTP devices (via
-M otpmem=XYZ and -device aspeed.otpmem) and fallback to an internal OTP
instance if no drive is specified.

A dedicated AddressSpace is used to issue memory transactions from SBC
to the OTP backend. Trace events are added to observe read/program
operations and command handling flow.

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/misc/aspeed_sbc.c         | 161 +++++++++++++++++++++++++++++++++++
 hw/misc/trace-events         |   7 ++
 include/hw/misc/aspeed_sbc.h |   7 ++
 3 files changed, 175 insertions(+)

diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index a7d101ba71..8e192e9496 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -12,12 +12,19 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
+#include "system/system.h"
+#include "qemu/notify.h"
 #include "hw/misc/aspeed_sbc.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define R_PROT          (0x000 / 4)
+#define R_CMD           (0x004 / 4)
+#define R_ADDR          (0x010 / 4)
 #define R_STATUS        (0x014 / 4)
+#define R_CAMP1         (0x020 / 4)
+#define R_CAMP2         (0x024 / 4)
 #define R_QSR           (0x040 / 4)
 
 /* R_STATUS */
@@ -41,6 +48,14 @@
 #define QSR_RSA_MASK           (0x3 << 12)
 #define QSR_HASH_MASK          (0x3 << 10)
 
+typedef enum {
+    SBC_OTP_CMD_READ = 0x23b1e361,
+    SBC_OTP_CMD_PROG = 0x23b1e364,
+} SBC_OTP_Command;
+
+#define OTP_DATA_DWORD_COUNT        (0x800)
+#define OTP_TOTAL_DWORD_COUNT       (0x1000)
+
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedSBCState *s = ASPEED_SBC(opaque);
@@ -57,6 +72,82 @@ static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
     return s->regs[addr];
 }
 
+static bool aspeed_sbc_otpmem_read(AspeedSBCState *s,
+                                   uint32_t otp_addr, Error **errp)
+{
+    MemTxResult ret;
+    AspeedSBCClass *sc = ASPEED_SBC_GET_CLASS(s);
+    AspeedOTPMemState *otp = ASPEED_OTPMEM(s->otpmem);
+    uint32_t value;
+
+    if (sc->has_otpmem == false) {
+        trace_aspeed_sbc_otpmem_state("disabled");
+        return true;
+    }
+    ret = address_space_read(&otp->as, otp_addr, MEMTXATTRS_UNSPECIFIED,
+                             &value, sizeof(value));
+    if (ret != 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Failed to read OTP memory\n");
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
+    AspeedSBCClass *sc = ASPEED_SBC_GET_CLASS(s);
+    AspeedOTPMemState *otp = ASPEED_OTPMEM(s->otpmem);
+    uint32_t value = 0x12345678;
+
+    if (sc->has_otpmem == false) {
+        trace_aspeed_sbc_otpmem_state("disabled");
+        return true;
+    }
+    address_space_write(&otp->as, otp_addr, MEMTXATTRS_UNSPECIFIED,
+                        &value, sizeof(value));
+    trace_aspeed_sbc_otp_prog(otp_addr, value);
+
+    return true;
+}
+
+static void aspeed_sbc_handle_command(void *opaque, uint32_t cmd)
+{
+    AspeedSBCState *s = ASPEED_SBC(opaque);
+    Error *local_err = NULL;
+    bool ret = false;
+    uint32_t otp_addr;
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
@@ -78,6 +169,9 @@ static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
                       "%s: write to read only register 0x%" HWADDR_PRIx "\n",
                       __func__, addr << 2);
         return;
+    case R_CMD:
+        aspeed_sbc_handle_command(opaque, data);
+        return;
     default:
         break;
     }
@@ -115,15 +209,82 @@ static void aspeed_sbc_reset(DeviceState *dev)
     s->regs[R_QSR] = s->signing_settings;
 }
 
+static void aspeed_otp_machine_init_done_notify(Notifier *n, void *opaque)
+{
+    AspeedSBCState *s = container_of(n, AspeedSBCState, machine_done);
+    Object *machine = qdev_get_machine();
+    Object *sbc = object_resolve_path("/machine/soc/sbc", NULL);
+    char *otpmem_drive = NULL;
+    Object *otp_dev = NULL;
+    Error *local_err = NULL;
+    char otp_path[128];
+
+    if (!sbc || !machine) {
+        error_report("Failed to resolve QOM paths");
+        return;
+    }
+
+    otpmem_drive = object_property_get_str(machine, "otpmem", &local_err);
+    if (local_err) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Failed to get otpmem property, %s\n",
+                      error_get_pretty(local_err));
+        error_free(local_err);
+        return;
+    }
+    if (strlen(otpmem_drive)) {
+        snprintf(otp_path, sizeof(otp_path),
+                 "/machine/peripheral/%s", otpmem_drive);
+        otp_dev = object_resolve_path(otp_path, NULL);
+        if (otp_dev) {
+            object_property_add_alias(sbc, "otpmem", otp_dev, "drive");
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Failed to get otpmem object\n");
+        }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "otpmem-drive is not presented\n");
+        error_free(local_err);
+    }
+    g_free(otpmem_drive);
+
+    if (!otp_dev) {
+        s->otpmem = ASPEED_OTPMEM(object_new(TYPE_ASPEED_OTPMEM));
+        object_initialize_child(OBJECT(s), "otp", s->otpmem,
+                                TYPE_ASPEED_OTPMEM);
+        qdev_realize(DEVICE(s->otpmem), NULL, &local_err);
+
+        if (local_err) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "OTP memory realize is failed, err = %s\n",
+                          error_get_pretty(local_err));
+            error_free(local_err);
+        }
+    } else {
+        s->otpmem = ASPEED_OTPMEM(otp_dev);
+    }
+}
+
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
 {
     AspeedSBCState *s = ASPEED_SBC(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedSBCClass *sc = ASPEED_SBC_GET_CLASS(s);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sbc_ops, s,
             TYPE_ASPEED_SBC, 0x1000);
 
     sysbus_init_mmio(sbd, &s->iomem);
+
+    /*
+     * Blockdev backend is created later than realize stage,
+     * to associate SBC and OTP in a later stage.
+     */
+    if (sc->has_otpmem) {
+        s->machine_done.notify = aspeed_otp_machine_init_done_notify;
+        qemu_add_machine_init_done_notifier(&s->machine_done);
+    }
 }
 
 static const VMStateDescription vmstate_aspeed_sbc = {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index e3f64c0ff6..0f6e2038cf 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -90,6 +90,13 @@ slavio_sysctrl_mem_readl(uint32_t ret) "Read system control 0x%08x"
 slavio_led_mem_writew(uint32_t val) "Write diagnostic LED 0x%04x"
 slavio_led_mem_readw(uint32_t ret) "Read diagnostic LED 0x%04x"
 
+# aspped_sbc.c
+aspeed_sbc_otpmem_state(const char *enabled) "OTP Memory is %s"
+aspeed_sbc_ignore_cmd(uint32_t cmd) "Ignoring command 0x%" PRIx32
+aspeed_sbc_handle_cmd(uint32_t cmd, uint32_t addr, bool ret) "Handling command 0x%" PRIx32 " for OTP addr 0x%" PRIx32 " Result: %d"
+aspeed_sbc_otp_read(uint32_t addr, uint32_t value) "OTP Memory read: addr 0x%" PRIx32 " value 0x%" PRIx32
+aspeed_sbc_otp_prog(uint32_t addr, uint32_t value) "OTP Memory write: addr 0x%" PRIx32 " value 0x%" PRIx32
+
 # aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_scu_read(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 405e6782b9..858e82861b 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -10,6 +10,7 @@
 #define ASPEED_SBC_H
 
 #include "hw/sysbus.h"
+#include "hw/misc/aspeed_otpmem.h"
 
 #define TYPE_ASPEED_SBC "aspeed.sbc"
 #define TYPE_ASPEED_AST2600_SBC TYPE_ASPEED_SBC "-ast2600"
@@ -30,16 +31,22 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
 struct AspeedSBCState {
     SysBusDevice parent;
 
+    Notifier machine_done;
+
     bool emmc_abr;
     uint32_t signing_settings;
 
     MemoryRegion iomem;
 
     uint32_t regs[ASPEED_SBC_NR_REGS];
+
+    AspeedOTPMemState *otpmem;
 };
 
 struct AspeedSBCClass {
     SysBusDeviceClass parent_class;
+
+    bool has_otpmem;
 };
 
 #endif /* ASPEED_SBC_H */
-- 
2.43.0

