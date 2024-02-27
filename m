Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543859ejf;
        Tue, 27 Feb 2024 00:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmsRgPSE1GR4LGwIZA8h6rVmhtU6NZ+7G3lMeC0WCXzDT+2eumGL7uWYqd3VJkvUGSCcH6b2YXaB6lLUHtB93qer7+V79n
X-Google-Smtp-Source: AGHT+IHAtaiNI7d3N4Le2Gd5+VhCB4z2VWyXfl0Ydcta9+PgQf8vawC/HEkALhg1EW4n4wgDsXQM
X-Received: by 2002:a05:6358:548a:b0:17b:5d25:76a5 with SMTP id v10-20020a056358548a00b0017b5d2576a5mr12281130rwe.3.1709023366536;
        Tue, 27 Feb 2024 00:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023366; cv=none;
        d=google.com; s=arc-20160816;
        b=TPWlQPOCCfYvJfWqN8xNFKLfdbc6/mbc/vcqTFh4UARx/cMgH5bstVf/FmpJbMnzQ/
         L3UXeshjZgWxO0NF0t+fRL4s6OtwkHfI3PoA4LCnFCLzlGHHeFutpyprceTOQnJSadhC
         iHOANNA8eOnkj7hLq1HwgJzUNhneLSetnBJPjO0ns7crJupdBUANR7ntM7nKQ2boY+CB
         sxFtUNWhq/LKfxTLMFzWbSi8YUgcmRUR4CiX2exXCS1yBwNMT8zdCg+WDWUXVOoWRWi1
         MAwT4OXFnyCPbQowdJIycQD53fciGo2rFzzIBKtWOcOSDwLTnLpb79OIbsLeAw4mQrD7
         Ch5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PlYoLDbUbjomSEd23m1u/ajnPye5YRTUfebEkIuJSY0=;
        fh=TUHHe60BaQzwu8XNc8W6oYbE3rtpAHHwRW1MwN417go=;
        b=nH2eYobpQUhi3TafW2K0bpO5sjDwrP8kUiMva4YPFEdPB4xtbb4rF1yv6dbIKAxLLu
         SwgWZ92+yWC/GbEV7UZ9MRRTSZX7llOMqMXRTmxuxhmqcMtb9WtUoq1mdX7mRQkVUwYx
         CBCLlT2ogyb1LHGfTK927ITHej24HZL2yeTYYaGme53Nyu4jVmWSqckdjj5DtSf2AKVn
         sBDqa0Hs8x73RYfdtNinlXv82AFrDU/rZLtCdg4mnMSzRtiLi00hnG3xAHy3oE8nzvzN
         03Fe0Ugux7wmnfBRc/kxwqE1oqy0qfOwiEJN/X4Xg4bvt7q2AKAElkcwVWKQ2h1ejdRd
         exPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wk0N9BPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22-20020a05620a221600b0078770e84db6si6818671qkh.511.2024.02.27.00.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wk0N9BPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret25-00089s-Pf; Tue, 27 Feb 2024 03:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret1e-0007VF-6N
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:41:23 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret1b-0007zq-G9
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:41:21 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512aafb3ca8so4097571e87.3
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023277; x=1709628077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlYoLDbUbjomSEd23m1u/ajnPye5YRTUfebEkIuJSY0=;
 b=wk0N9BPMHt8EJFuUbebe20rU6Wqn7n8F0g6naKqaT9U7fxGdtSkl4YsHeD/awMRtz6
 YVjEQEmQCq4Rwt4jB2JuV/Fa+7Lmv5tU9Jj0F5EGBafzoUdla+fPsrqSM+/xYnPnkODv
 UD9fFo/hxyg5gEctPHZQeRA+MqpeA9qWpOy9uRDcW5nQeWZFcr1vZtRsnZitJKZUu2SJ
 q1//IQ+ts8NcvaR3b7C74ipEDaqPNLF2RulAxbuSwGMJgQCeudKbIyygvjU+J329lQDy
 O2R9lR0ADZp5sT76Mq3qUoWIgfPYDm+a5C57CYTcDgdw1noUcKrN29lf+0pV9PG+WpMF
 +N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023277; x=1709628077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PlYoLDbUbjomSEd23m1u/ajnPye5YRTUfebEkIuJSY0=;
 b=pMB4hTfnLufzjo2ujd/S+2kSrGmFvlxyO38uokmN5ZQXD+N4Irnzcj8gjmjIXiFj+s
 /wvPmuoXoMw1u3+w6j1Bsm/Sphxo4SVgIsV1XvsBZK/ITaPGYDQ91jpdi8S6NbJ6IZTu
 xOzd1NqocoLZPinigH9fhx/Nw5SrjoDG+ZVcA3Ujymmj5baM9qat7hS/j8ZVDolUNDL6
 hvzc6MQdkKyydgqTgxkdJaeGvkWE8qlftrcplFgiDDV/6t6VNJePO1fyXZo5kUOcY7oI
 fYgYHBLpiRwhGx7b4ZiwUkuXAiFsx30Ts/It+iOQiCYvW/NZfuhUBG/41mhVo6V6z1uI
 7ctQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVocwpDW1mJrylJGUfUSs5v6xh3QOMM0CRtYIPtSND3X6P1VP/cMdrHqCePcpN06nq0WrZqjtuolCerteUJsVe+qrHg
X-Gm-Message-State: AOJu0YxaEnQmiUlFB1aFPvXnWWc8RHrCXJouhEq4ja4WLM04N4Ln5RgD
 pG9wonJthGiZlr+1nazA6kVtBtcDOzd5CLu86WDfam2L7jpbVmXr+dOhBhL1ISw=
X-Received: by 2002:ac2:58d9:0:b0:512:febe:ab20 with SMTP id
 u25-20020ac258d9000000b00512febeab20mr2406231lfo.17.1709023277754; 
 Tue, 27 Feb 2024 00:41:17 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 j5-20020a19f505000000b00512daaef13bsm1109312lfb.102.2024.02.27.00.41.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:41:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PULL 14/30] hw/hppa: do not require CONFIG_USB
Date: Tue, 27 Feb 2024 09:39:30 +0100
Message-ID: <20240227083948.5427-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: E392QJylnOKB

From: Paolo Bonzini <pbonzini@redhat.com>

With --without-default-devices it is possible to build a binary that
does not include any USB host controller and therefore that does not
include the code guarded by CONFIG_USB.  While the simpler creation
functions such as usb_create_simple can be inlined, this is not true
of usb_bus_find().  Remove it, replacing it with a search of the single
USB bus on the machine.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240223124406.234509-6-pbonzini@redhat.com>
[PMD: Fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/hppa/machine.c | 10 +++++++---
 hw/hppa/Kconfig   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 5fcaf5884b..37ee6387e0 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -396,10 +396,14 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus,
     }
 
     /* create USB OHCI controller for USB keyboard & mouse on Astro machines */
-    if (!lasi_dev && machine->enable_graphics) {
+    if (!lasi_dev && machine->enable_graphics && defaults_enabled()) {
+        USBBus *usb_bus;
+
         pci_create_simple(pci_bus, -1, "pci-ohci");
-        usb_create_simple(usb_bus_find(-1), "usb-kbd");
-        usb_create_simple(usb_bus_find(-1), "usb-mouse");
+        usb_bus = USB_BUS(object_resolve_type_unambiguous(TYPE_USB_BUS,
+                                                          &error_abort));
+        usb_create_simple(usb_bus, "usb-kbd");
+        usb_create_simple(usb_bus, "usb-mouse");
     }
 
     /* register power switch emulation */
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index dff5df7f72..ee7ffd2bfb 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -2,6 +2,7 @@ config HPPA_B160L
     bool
     imply PCI_DEVICES
     imply E1000_PCI
+    imply USB_OHCI_PCI
     imply VIRTIO_VGA
     select ASTRO
     select DINO
@@ -17,4 +18,3 @@ config HPPA_B160L
     select LASIPS2
     select PARALLEL
     select ARTIST
-    select USB_OHCI_PCI
-- 
2.41.0

