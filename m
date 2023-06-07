Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3882333ejb;
        Tue, 6 Jun 2023 19:34:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46FHBRo80AkwkiiWOKySb04h+mElhyyUEmIIUGdyLqH4kXeOhTfWMXvX8000pvOvNcZoJs
X-Received: by 2002:a05:622a:181e:b0:3f5:ef49:722c with SMTP id t30-20020a05622a181e00b003f5ef49722cmr2313303qtc.2.1686105274471;
        Tue, 06 Jun 2023 19:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686105274; cv=none;
        d=google.com; s=arc-20160816;
        b=xMLLDparfVLD5REMuWCSXJEjO5JRmr58HInBnHoiuFekt7eeJK3U9Em8AF1C0hS0ce
         OmGYp2JJzhXxgUZdR4Yt1vQB00p3GTVL+FgQS0toy0McpOY1rxvbEr3HO2GjIEoeYdAb
         qTJmbgcEkKAlNYZERXr1L4cegQUDseBz0QimR9Ld6RvB4MwdZRIGXdMBoW9jkfshe/xs
         10Zr29HwUFJN9WwuIPm5To9cnzPlrrKxRPV+cO3yajNxRN4enqvO/Up5xVFlFHxFc23V
         2Ka/k88YUslb2sXgrI9lHFIZbQ2HqNm0svnyZ1lYd7Neld8Eye4JM4fo43e/uBOsS8Uz
         yHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0rQU+slBQK9bwRbhsORjcXo+76QiLds60PDsvwCgLVY=;
        b=e4wHfE6GJfmqYRzctgs3sdRCwlt43EtnCcbnEXPxFw5AFxJz9rdxH05+YS0YFXqoFm
         2e+lexOtfShgE6GV2W0TMXpRmIRXFsERbdAy0zO2HlO41mLjtfV9HASJ0ymOIxUZINnc
         tdiSKnXazlgZ22WAkq+RgvI2lQUbtcw+VuCMRGFs9/ZHt4IDfe65+uKOaiAKVACh1sR0
         p5fDFS4QLmjGrJToL+EPBiGVnf0UFeQsalYerHYsok7GAJ8qAJPEXUhym9CAzeZuRFxt
         uW3cFESq9i1GCvYu75TqZDbHgyb6In3NG6fUXSCW1Pt0nNC5s4PJ0y3eWSd6b+1Ykxx2
         s4nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05622a038d00b003ef5008333bsi6951002qtx.431.2023.06.06.19.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 19:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6j01-00069U-2R; Tue, 06 Jun 2023 22:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6izz-00068j-Vc; Tue, 06 Jun 2023 22:34:11 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6izv-0007VG-PN; Tue, 06 Jun 2023 22:34:11 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwBHLZgv7H9kfKaEAg--.41412S2;
 Wed, 07 Jun 2023 10:32:15 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBXhEyF7H9k9zkAAA--.329S4;
 Wed, 07 Jun 2023 10:33:44 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Cc: marcin.juszkiewicz@linaro.org, quic_llindhol@quicinc.com,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Date: Wed,  7 Jun 2023 10:33:14 +0800
Message-Id: <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBXhEyF7H9k9zkAAA--.329S4
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQADAWR-hSkBAAAAs1
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxXrW5Kw15uw4DAw18uFy3Arb_yoW5tryUpF
 48urs0gr40yF1rJa9xu3Z7WF45u3ykA3WUArW7Can7ZFyDAr42grWkGay2k3s8JrZ8urWj
 9Fn7WFy8Xr13Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
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
X-TUID: 8WoObpAg7JEB

The current sbsa-ref cannot use EHCI controller which is only
able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
Hence, this uses system bus XHCI to provide a usb controller with
64-bit DMA capablity instead of EHCI.

Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
---
 docs/system/arm/sbsa.rst |  2 +-
 hw/arm/Kconfig           |  2 +-
 hw/arm/sbsa-ref.c        | 21 ++++++++++++---------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index 016776aed8..1751ba0d21 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -24,7 +24,7 @@ The sbsa-ref board supports:
   - A configurable number of AArch64 CPUs
   - GIC version 3
   - System bus AHCI controller
-  - System bus EHCI controller
+  - System bus XHCI controller
   - CDROM and hard disc on AHCI bus
   - E1000E ethernet card on PCIe bus
   - Bochs display adapter on PCIe bus
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index acc4371a4a..ab884ad319 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -266,7 +266,7 @@ config SBSA_REF
     select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
-    select USB_EHCI_SYSBUS
+    select USB_XHCI_SYSBUS
     select WDT_SBSA
 
 config SABRELITE
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

