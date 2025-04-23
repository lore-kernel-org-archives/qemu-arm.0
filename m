Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2774290njd;
        Tue, 22 Apr 2025 19:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZrH5fh+K1N/a+ya6MJPinqSEIEzlxZU9ql4pt04GVCcQeQeFMwlfafhTdiWpC11dipt19bZYDefsYEw==@linaro.org
X-Google-Smtp-Source: AGHT+IGdxLhrBwLQxnxCLxekZrlZ53gv6s/tWiD8o+pILf6sWev1pMm/74Q4o1OUfxunSC8kw10k
X-Received: by 2002:a05:622a:1a12:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-47aec495438mr317692121cf.33.1745377112124;
        Tue, 22 Apr 2025 19:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745377112; cv=none;
        d=google.com; s=arc-20240605;
        b=ktK3XLEzRvM3W4jVQ8HjrSlpHu4G/GLwJI/zMGvXhuxiQk+43XlPYTiUhN1erQB8Bc
         2F8qYCG6SUi1SxAOvLmvSsYDjLIAJdBGfIJ/xE4Jz5KtcrrknlUzVJXi3lOSqMcmleAW
         hjwGARfZZ4GkGyy1lS2fuyYpTYaLA6Jcp1pKXp4mAIxsJ8rslq5PVWP5baUqXRIBuq9V
         QHWy7xMPbPqed2sSX63lXT5TbDIx2xDzkP1vj6eCYPdmXJdCNd3GwmtCajjL0NNG5qpK
         1WWUf4h119PxJx0MLpm7FUjeoVecxsMylgl/uOwhFrKif+gUyfDKmEzrjYFmOb7rNs90
         9eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=rt7AjKchMlIw1yCZkqrgH15uykh1a7IHLLodkjTUHLc=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=hWwh1LTXlQbiUzTNq9Yz5de/m7R3ur5SLyFCYkTLVph8MilGZz//at3Pq69kUenBIt
         1RXj+W9lSbA2OU5oSA/ZJK3wQ7q4tKWGpZ8AA791h0l9JLo/8UzbtBdB19umPHb0CfWC
         CRXzMLPlOpzX2d9ZKi65KlRI6kgrR1rsSSjKzbS++U2WnqE1kcalsmQ3impnzfFAVMGG
         86Fy0e/bh1srOUQ7JiHY5wKUCucQkAkSs0y5csqG8d9RPbD+WnbXfqa1pYcEZR+yzpEq
         qJBm/T9pKCcZON8Rb9oJzf9CisJQcOZIGV6RGDvKmyrx0VyLbK5PhDdvgRpq4jeFOsmc
         ucKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9c2bc8dsi125823711cf.174.2025.04.22.19.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 19:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7QIX-0007Dh-C5; Tue, 22 Apr 2025 22:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u7QIS-0007C4-83; Tue, 22 Apr 2025 22:57:13 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u7QIQ-00043I-5S; Tue, 22 Apr 2025 22:57:11 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Apr
 2025 10:56:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Apr 2025 10:56:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v3 2/3] hw/misc/aspeed_sbc: Connect Aspeed OTP memory device
 to SBC controller
Date: Wed, 23 Apr 2025 10:56:50 +0800
Message-ID: <20250423025651.189702-3-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423025651.189702-1-kane_chen@aspeedtech.com>
References: <20250423025651.189702-1-kane_chen@aspeedtech.com>
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
X-TUID: FqA0hS6ie5ns

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch integrates the `aspeed.otpmem` device with the ASPEED
Secure Boot Controller (SBC). The SBC now accepts an OTP backend via
a QOM link property ("otpmem"), enabling internal access to OTP content
for controller-specific logic.

This connection provides the foundation for future enhancements
involving fuse storage, device configuration, or secure manufacturing
data provisioning.

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/misc/aspeed_sbc.c         | 146 +++++++++++++++++++++++++++++++++++
 include/hw/misc/aspeed_sbc.h |  15 ++++
 2 files changed, 161 insertions(+)

diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index e4a6bd1581..f0ce7bbdf0 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -17,7 +17,11 @@
 #include "migration/vmstate.h"
 
 #define R_PROT          (0x000 / 4)
+#define R_CMD           (0x004 / 4)
+#define R_ADDR          (0x010 / 4)
 #define R_STATUS        (0x014 / 4)
+#define R_CAMP1         (0x020 / 4)
+#define R_CAMP2         (0x024 / 4)
 #define R_QSR           (0x040 / 4)
 
 /* R_STATUS */
@@ -57,6 +61,143 @@ static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
     return s->regs[addr];
 }
 
+static void aspeed_sbc_otpmem_read(void *opaque)
+{
+    AspeedSBCState *s = ASPEED_SBC(opaque);
+    uint32_t otp_addr, data, otp_offset;
+    bool is_data = false;
+    Error *local_err = NULL;
+
+    assert(s->otpmem);
+
+    otp_addr = s->regs[R_ADDR];
+    if (otp_addr < OTP_DATA_DWORD_COUNT) {
+        is_data = true;
+    } else if (otp_addr >= OTP_TOTAL_DWORD_COUNT) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid OTP addr 0x%x\n",
+                      __func__, otp_addr);
+        return;
+    }
+    otp_offset = otp_addr << 2;
+
+    s->otpmem->ops->read(s->otpmem, otp_offset, &data, &local_err);
+    if (local_err) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Failed to read data 0x%x, %s\n",
+                      __func__, otp_offset,
+                      error_get_pretty(local_err));
+        error_free(local_err);
+        return;
+    }
+    s->regs[R_CAMP1] = data;
+
+    if (is_data) {
+        s->otpmem->ops->read(s->otpmem, otp_offset + 4, &data, &local_err);
+        if (local_err) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Failed to read data 0x%x, %s\n",
+                          __func__, otp_offset,
+                          error_get_pretty(local_err));
+            error_free(local_err);
+            return;
+        }
+        s->regs[R_CAMP2] = data;
+    }
+}
+
+static void mr_handler(uint32_t otp_addr, uint32_t data)
+{
+    switch (otp_addr) {
+    case MODE_REGISTER:
+    case MODE_REGISTER_A:
+    case MODE_REGISTER_B:
+        /* HW behavior, do nothing here */
+        break;
+    default:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Unsupported address 0x%x\n",
+                  __func__, otp_addr);
+        return;
+    }
+}
+
+static void aspeed_sbc_otpmem_write(void *opaque)
+{
+    AspeedSBCState *s = ASPEED_SBC(opaque);
+    uint32_t otp_addr, data;
+
+    otp_addr = s->regs[R_ADDR];
+    data = s->regs[R_CAMP1];
+
+    if (otp_addr == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ignore write program bit request\n",
+                      __func__);
+    } else if (otp_addr >= MODE_REGISTER) {
+        mr_handler(otp_addr, data);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unhandled OTP write address 0x%x\n",
+                      __func__, otp_addr);
+    }
+}
+
+static void aspeed_sbc_otpmem_prog(void *opaque)
+{
+    AspeedSBCState *s = ASPEED_SBC(opaque);
+    uint32_t otp_addr, value;
+    Error *local_err = NULL;
+
+    assert(s->otpmem);
+
+    otp_addr = s->regs[R_ADDR];
+    value = s->regs[R_CAMP1];
+    if (otp_addr >= OTP_TOTAL_DWORD_COUNT) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid OTP addr 0x%x\n",
+                      __func__, otp_addr);
+        return;
+    }
+
+    s->otpmem->ops->prog(s->otpmem, otp_addr, value, &local_err);
+    if (local_err) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Failed to program data 0x%x to 0x%x, %s\n",
+                      __func__, value, otp_addr,
+                      error_get_pretty(local_err));
+        error_free(local_err);
+        return;
+    }
+}
+
+static void aspeed_sbc_handle_command(void *opaque, uint32_t cmd)
+{
+    AspeedSBCState *s = ASPEED_SBC(opaque);
+
+    s->regs[R_STATUS] &= ~(OTP_MEM_IDLE | OTP_IDLE);
+
+    switch (cmd) {
+    case READ_CMD:
+        aspeed_sbc_otpmem_read(s);
+        break;
+    case WRITE_CMD:
+        aspeed_sbc_otpmem_write(s);
+        break;
+    case PROG_CMD:
+        aspeed_sbc_otpmem_prog(s);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unknown command 0x%x\n",
+                      __func__, cmd);
+        break;
+    }
+
+    s->regs[R_STATUS] |= (OTP_MEM_IDLE | OTP_IDLE);
+}
+
+
 static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
                               unsigned int size)
 {
@@ -78,6 +219,9 @@ static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
                       "%s: write to read only register 0x%" HWADDR_PRIx "\n",
                       __func__, addr << 2);
         return;
+    case R_CMD:
+        aspeed_sbc_handle_command(opaque, data);
+        return;
     default:
         break;
     }
@@ -139,6 +283,8 @@ static const VMStateDescription vmstate_aspeed_sbc = {
 static const Property aspeed_sbc_properties[] = {
     DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
     DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
+    DEFINE_PROP_LINK("otpmem", AspeedSBCState, otpmem,
+                     TYPE_ASPEED_OTPMEM, AspeedOTPMemState *),
 };
 
 static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 405e6782b9..8ae59d977e 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -10,6 +10,7 @@
 #define ASPEED_SBC_H
 
 #include "hw/sysbus.h"
+#include "hw/misc/aspeed_otpmem.h"
 
 #define TYPE_ASPEED_SBC "aspeed.sbc"
 #define TYPE_ASPEED_AST2600_SBC TYPE_ASPEED_SBC "-ast2600"
@@ -27,6 +28,18 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
 #define QSR_SHA384                  (0x2 << 10)
 #define QSR_SHA512                  (0x3 << 10)
 
+#define READ_CMD                    (0x23b1e361)
+#define WRITE_CMD                   (0x23b1e362)
+#define PROG_CMD                    (0x23b1e364)
+
+#define OTP_DATA_DWORD_COUNT        (0x800)
+#define OTP_TOTAL_DWORD_COUNT       (0x1000)
+#define OTP_FILE_SIZE               (OTP_TOTAL_DWORD_COUNT * sizeof(uint32_t))
+
+#define MODE_REGISTER               (0x1000)
+#define MODE_REGISTER_A             (0x3000)
+#define MODE_REGISTER_B             (0x5000)
+
 struct AspeedSBCState {
     SysBusDevice parent;
 
@@ -36,6 +49,8 @@ struct AspeedSBCState {
     MemoryRegion iomem;
 
     uint32_t regs[ASPEED_SBC_NR_REGS];
+
+    AspeedOTPMemState *otpmem;
 };
 
 struct AspeedSBCClass {
-- 
2.43.0

