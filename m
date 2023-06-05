Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2677993ejb;
        Mon, 5 Jun 2023 02:56:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HcnRpAxu4lYDElJPVaxrpLrZu9p9qA14nYd7bd8QKW9sn3UnpcG2cKl9U34m7noO4EZHy
X-Received: by 2002:a05:620a:678b:b0:75e:b9b8:ab57 with SMTP id rr11-20020a05620a678b00b0075eb9b8ab57mr1474219qkn.70.1685959012533;
        Mon, 05 Jun 2023 02:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685959012; cv=none;
        d=google.com; s=arc-20160816;
        b=y20H2wL5DsC26ztpWLPdJlKQ+BOKiMkm+MtPsXyJuQJRByVbG2KdCOVgQmLuiFgbQB
         Uisq1MkJlWdoqjBlc0J5O7SoxKIP2AMrB+ZC4OBEfCxEg5CNkjErSYGq9PZtGqszVxIj
         SGVphzSudMGo1tXZXCGXmKMNDmyfMuq4MR75CnJRDveTCLVDuvfnYk/+IA+Xl6JD9LmT
         eZOcLBFn3CxFu7GErELm68Xt0eVJ+uwv/VN7C59DZIiH0Mg/15KUCUUQtNtWqczLQVuV
         RvdJZ1tMQswJUh9hx+bCgvyyPNq1II7TRB0JalA9Em6ofLHdHAUz55usu5+2xKs2fAA8
         Cb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9VCCWntDxdPC+4+lkkGU674aiFKtQ1HeAGlserxW6Sg=;
        b=OkZ25RAplSYqKJmQfRYHIL8UOjhHixKkH5dftlymgWDKgpVI+DTVfYRiIN4tWSyKzA
         /4X5oJrdcI1iLoB3OazC+zeJWpazq4YBfC59pdRp9qwrkGQ5nUVqXLL9pK4iEVLtT/PY
         K1UVCOSbv99x/Q9t3NSNJyRCw7Sb2HUXzqxfjKC9iItJi9UrWotB2vEv1LdNoS6GA3Vp
         mgMLk4LQrEjN/f0OYdQyK0EaOG9JDv2OS1rQxZvs+1oh/xdy+7c4yNK/j9VN5Zg2CRy/
         eg47VbfqgXGcpCL+u7FLCGru1ugsRpVzvhty3JcwfcgkQ4ZrZA0PYLbcqh5ssiVDy41I
         hA7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14-20020a05622a040e00b003f6ac5d20a9si4483079qtx.247.2023.06.05.02.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 02:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q66x8-0001UU-I9; Mon, 05 Jun 2023 05:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q66wx-0001TD-KL; Mon, 05 Jun 2023 05:56:33 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q66wu-0007dY-M9; Mon, 05 Jun 2023 05:56:30 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDHpI_msH1kRaFLAg--.1176S2;
 Mon, 05 Jun 2023 17:54:46 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBnkiIwsX1k8YwAAA--.784S4;
 Mon, 05 Jun 2023 17:56:04 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Date: Mon,  5 Jun 2023 17:55:36 +0800
Message-Id: <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBnkiIwsX1k8YwAAA--.784S4
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQABAWR84icEagAAsy
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxXrW5ZF43Xw13Jr18Kr4fAFb_yoW5Gr1DpF
 4Uur4YkF48tF4rJa93uwnrKF45C395A3W7Z3y7KFZ3ZF1DJr42qrWkGayjk3sxZrWkZrWj
 9FnruF109r1xAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UItQ9ELg+jBc

The current sbsa-ref cannot use EHCI controller which is only
able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
Hence, this uses XHCI to provide a usb controller with 64-bit
DMA capablity instead of EHCI.

Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
---
 hw/arm/sbsa-ref.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index de21200ff9..4fb65704d4 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -40,6 +40,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
+#include "hw/usb/xhci.h"
 #include "hw/char/pl011.h"
 #include "hw/watchdog/sbsa_gwdt.h"
 #include "net/net.h"
@@ -82,7 +83,7 @@ enum {
     SBSA_SECURE_UART_MM,
     SBSA_SECURE_MEM,
     SBSA_AHCI,
-    SBSA_EHCI,
+    SBSA_XHCI,
 };
 
 struct SBSAMachineState {
@@ -119,7 +120,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
     /* Space here reserved for more SMMUs */
     [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
-    [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
+    [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
     /* Space here reserved for other devices */
     [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
     /* 32-bit address PCIE MMIO space */
@@ -139,7 +140,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART] = 8,
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
-    [SBSA_EHCI] = 11,
+    [SBSA_XHCI] = 11,
     [SBSA_SMMU] = 12, /* ... to 15 */
     [SBSA_GWDT_WS0] = 16,
 };
@@ -575,13 +576,15 @@ static void create_ahci(const SBSAMachineState *sms)
     }
 }
 
-static void create_ehci(const SBSAMachineState *sms)
+static void create_xhci(const SBSAMachineState *sms)
 {
-    hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
-    int irq = sbsa_ref_irqmap[SBSA_EHCI];
+    hwaddr base = sbsa_ref_memmap[SBSA_XHCI].base;
+    int irq = sbsa_ref_irqmap[SBSA_XHCI];
+    DeviceState *dev = qdev_new(TYPE_XHCI_SYSBUS);
 
-    sysbus_create_simple("platform-ehci-usb", base,
-                         qdev_get_gpio_in(sms->gic, irq));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(sms->gic, irq));
 }
 
 static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
@@ -803,7 +806,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_ahci(sms);
 
-    create_ehci(sms);
+    create_xhci(sms);
 
     create_pcie(sms);
 
-- 
2.34.1

