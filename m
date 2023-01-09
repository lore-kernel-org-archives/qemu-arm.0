Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2447990ejc;
        Mon, 9 Jan 2023 09:26:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsg3aSx2uUg1XGP+VhJ4S5+3GkYBHeWKFaBacKWkxVWB4Iax3NF2Q+TfRE2HmuN2Bs9eInu
X-Received: by 2002:ac8:5295:0:b0:3a8:fdf:8ff8 with SMTP id s21-20020ac85295000000b003a80fdf8ff8mr84283065qtn.36.1673285201866;
        Mon, 09 Jan 2023 09:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285201; cv=none;
        d=google.com; s=arc-20160816;
        b=ErmBDY8VerghqTEDgcdxyUxXwLW5lAT4fa3kXuDWbNWxrONWoj83T1oJf6xLRCoktB
         2k1Hu9DuKKBenYvPqFRt9ApQeeURH0ew4MwbhnbqBeV4LZfasRwoI9DZzeo1VbVGoVNG
         g94RD6JuFWEkGyVkV7ivY1QnAbgS2Vw0V/5fE4sJ/wwH7P7iRqu+V0C3nSKlAaVzXieP
         WpVHnwVRP9bca7Zh52aEjVLiXucUB2BoumnG0tkMc86rBx5zAOawQa/J6G/pN0K2GPsF
         Lm6Bvp+3LL6n8XF+gF2L0K6y8tG9+ouvQEUCNAAx0ZGlZ1AJKePLK/a78TUdHkjDHUvi
         VNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bElzg9gcPkQSB5qeUp1jbWeOHZY8Np62336a2cjRrOg=;
        b=AAHIQ4givq66TbN0aGm+kK5liaIRHTrxc3MiU6h7FeaYqlfjwfdjFFKyPTasaoBlcH
         C3AAnXJazL9SWcvMjs3L1HqOm608jD1n0k/00SeWeBth1O2MOfQLfnKHVjBgva4EGk9W
         Qpc2d3C1C0mFD8j2ORi2OSV3DtlhuFK5wQ+wZcdiMlcjJoFSSyrn5yRdlI/zD8g6M6W3
         qPT2F0OZxgE33vBN089XritxoNTrZIjkOMp6GS4792HGLBEg9xlSDn6LyTPNKfHp5YHO
         poY9x7SMATcQGqUFFWayt+9DpVtv13YLmvCtYVb9slm2olvGoLa1MYGeGMXhY8siMVtr
         HPag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qoVd6Z10;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020ac8720e000000b003a6258d436bsi4868119qtp.596.2023.01.09.09.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qoVd6Z10;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuE-00037n-9e; Mon, 09 Jan 2023 12:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtb-0002gZ-Cd; Mon, 09 Jan 2023 12:25:17 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtZ-0001IA-GL; Mon, 09 Jan 2023 12:25:15 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z11so13631888ede.1;
 Mon, 09 Jan 2023 09:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bElzg9gcPkQSB5qeUp1jbWeOHZY8Np62336a2cjRrOg=;
 b=qoVd6Z10qY8IG2F3UiZewvNqymWy6v1Clpf51XoiqsNQYfcfeuBCykWgBBcbS1Jdk+
 c8bpAJqGoQG1rpnlggOrrArMgHItPnPY6npp69ux2UHCMR28v/n9pZ7+wnmOk35Nr/xG
 8U3G+MDquO2egO8z8pgBPgCsuOfab6SUPWejdJdweYsV9FIrINhz5b9wtxf5iO7FcFuC
 QLq1h4BIH/WOLJ2mbMdukFnrKPpYlTqZ7OrSB4Y2LO9cwlsLElCITWD/DayrF2BCOL+C
 2ok0Suix49JDBjLNmGcyUqSRvEaPkrcExNlzlo6Ba3gysjFwRIkpkHSAb+hzy0/9pT93
 /ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bElzg9gcPkQSB5qeUp1jbWeOHZY8Np62336a2cjRrOg=;
 b=z5dNZb/K0Hoic3Da6GELYonR8FEHnK+LNjlkjmVwLIMKC+ae96Jajo6l7m90xNhViT
 f+I5UyWwl7lSxKbgyaSYt4vcedOCM5tyfbZnRZftNuV1pAAJlDTT3OzdhRewm1eaqNtS
 0HLPWGOXSWQ/39KICpgZ21lXuJsCtA0sLB0STn2Np8jnWTXQSy2rqT+cdyocd7WUg8tl
 lwfGLt/ZGznaT1pS9tGzx17EmUE74V/OYIt27PpJF6djkbqnZFPC5Mv0bHydHXCFSfHw
 KCXWKOoDxVoi7yXcja/QNawCn7P6j67haaLCTjtHyCpBb99H0ZnMhCZYPd0nFlr4uxMx
 z2Pw==
X-Gm-Message-State: AFqh2krx3EJqxJ+cMd20rAfGHiVRFQ/sJ+kAnYqkUtlmcwg66hTEQ6Qj
 dLFK799t+U5QXKgBBPoP7hrRJDZTUxjztg==
X-Received: by 2002:a05:6402:1149:b0:482:d62c:cde with SMTP id
 g9-20020a056402114900b00482d62c0cdemr51101195edw.13.1673285110708; 
 Mon, 09 Jan 2023 09:25:10 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:10 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 16/33] hw/isa/piix3: Create TYPE_ISA_PIC in host device
Date: Mon,  9 Jan 2023 18:23:29 +0100
Message-Id: <20230109172347.1830-17-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NfA3Pojjqgv1

The newly introduced TYPE_ISA_PIC allows for wiring up devices
in the southbridge where the virtualization technology used
(KVM, TCG, Xen) is not yet known.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-16-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  4 ++--
 hw/i386/pc_piix.c             | 15 +++++++++------
 hw/isa/piix3.c                | 10 +++++++++-
 hw/i386/Kconfig               |  1 +
 hw/isa/Kconfig                |  1 +
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b1eaab1d95..514ccdb7fd 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci_device.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -50,11 +51,10 @@ struct PIIXState {
 #endif
     uint64_t pic_levels;
 
-    qemu_irq *pic;
-
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    ISAPICState pic;
     RTCState rtc;
     UHCIState uhci;
     PIIX4PMState pm;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5ea8d4a585..df8e2e389b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -219,10 +219,11 @@ static void pc_init1(MachineState *machine,
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     if (pcmc->pci_enabled) {
-        PIIX3State *piix3;
+        DeviceState *dev;
         PCIDevice *pci_dev;
         const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
                                          : TYPE_PIIX3_DEVICE;
+        int i;
 
         pci_bus = i440fx_init(pci_type,
                               i440fx_host,
@@ -247,10 +248,12 @@ static void pc_init1(MachineState *machine,
                                  &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
 
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        piix3->pic = x86ms->gsi;
-        piix3_devfn = piix3->dev.devfn;
-        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
+        for (i = 0; i < ISA_NUM_IRQS; i++) {
+            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
+        }
+        piix3_devfn = pci_dev->devfn;
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
@@ -259,6 +262,7 @@ static void pc_init1(MachineState *machine,
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_irqs(isa_bus, x86ms->gsi);
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
@@ -267,7 +271,6 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index ed7d58bc98..88a6bf28ea 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -39,7 +39,7 @@
 
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
-    qemu_set_irq(piix3->pic[pic_irq],
+    qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
                     (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
@@ -297,6 +297,13 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* PIC */
+    if (!qdev_realize(DEVICE(&d->pic), NULL, errp)) {
+        return;
+    }
+
+    isa_bus_irqs(isa_bus, d->pic.in_irqs);
+
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
                           "piix3-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
@@ -360,6 +367,7 @@ static void pci_piix3_init(Object *obj)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
 }
 
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index c4fb5b49bd..1291f59896 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -71,6 +71,7 @@ config I440FX
     select ACPI_PIIX4
     select PC_PCI
     select PC_ACPI
+    select I8259
     select PCI_I440FX
     select PIIX3
     select IDE_PIIX
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index cf79580384..fccf095d07 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -35,6 +35,7 @@ config PIIX3
     bool
     select ACPI_PIIX4
     select I8257
+    select I8259
     select ISA_BUS
     select MC146818RTC
     select USB_UHCI
-- 
2.39.0

