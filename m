Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp478397lfi;
        Wed, 30 Jun 2021 08:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzeQXuR1Ab/5vIIsL422HvIYHapEREx6lZ1In0+4/o0PxygDfdhwH0nWWfxXBpV1hT/SXV
X-Received: by 2002:a17:907:7253:: with SMTP id ds19mr3601347ejc.342.1625067164969;
        Wed, 30 Jun 2021 08:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625067164; cv=none;
        d=google.com; s=arc-20160816;
        b=V4q3SEcFcFh5s4K7jOLIRyYf01VhxGW0YYJSRy69m/3GUB1Z5C0FRVWp+6MT0fBN62
         P57MALB2/FNyytxRe9wgOVajzmP730zrX31yOE6IS7J2tnLlEtMcbjFw0AfIRMEY392a
         lKzy8pDHdpQ+kSKoBJyYUgOkLnc0EPZVGYcp8qLaMlHU3OBFA3f9Cz6FTlKCi0cfP71I
         c51E4z/c6V1tLaUObB3J4ZiorVhY40bkmKO2qRAVs1GRgw9xqSWtAtzIcdfV1hzKFqA2
         FmFGu053XsPwmbnOLs9QpHdraF+pd2FmQ6qV8tMD1mbr+EONfFRq35wH97mQ1zOTgieL
         jCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YQc7hngRcXAxMgbGTFQRDdYH/dKN+DPW0PpKb5MWZc4=;
        b=00BsQVIoUuNH5JVtiWS3Sg6hLBMvM6bMx1Y89hUPaZpfEj1lUMBjKGyFRTwJhBH3tD
         2/ryGXf5t8LYAiH5TZl50jcsxMrOSO9TuiyQbyvjNYpK6He34pHtCFNfbCUYfqgK2P2U
         aWR7VnTyzxAmX+IW2V/0eVAM5r6A8GAYU+N5r62w6LJ5GVvdVvf0+DoL6A7+a5/yacOL
         NwZvH0m4rKeZxblH82BYa/xuO8mEsMijA16kXfiapGky21ecFLgnX9fzidc+7F2wUuqB
         Fvya8/o+HCk2LL5FCrsLwJGAO6Bb8E6d3/Z5rdQIDlYiSshPNt+iBM4r/y/FTToQk6G5
         4Hyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hE4XgNUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr34si1997386ejc.466.2021.06.30.08.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jun 2021 08:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hE4XgNUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lycCh-00055p-Ui
	for alex.bennee@linaro.org; Wed, 30 Jun 2021 11:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCK-00051U-1S
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 11:32:20 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC6-000591-JK
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 11:32:19 -0400
Received: by mail-qv1-xf32.google.com with SMTP id m15so1284751qvc.9
 for <qemu-arm@nongnu.org>; Wed, 30 Jun 2021 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQc7hngRcXAxMgbGTFQRDdYH/dKN+DPW0PpKb5MWZc4=;
 b=hE4XgNUAYOnRMhFlNrFGk2KrqxPbRCIUCfAyfzzd2uBTvVsHaonknegXtb0Zovka1s
 1x/re/nDf52LYz7pIGZs+Y/FxjxUzVLAYd+urfUersB0s7NYkdFtM0GfOWEWHMs94Mr1
 MfwEX3L8ZAZOpRWnKq5/NKNt8ucV+bhCnOLSFQKnhyax2Pl9KQv5UDhKOemlZplzE79t
 M2QKONbecVNBZBN9Ozzw3Gwq41DBP3xkE316JH37jwvx7brHn/c96kPrtVptVs4amug3
 wZNRUx/nermsuNAL/46jqnAJgL27kwy/33iGSrWxTLK0zrlsLS5pTlb01P2LppU6fhAk
 4XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQc7hngRcXAxMgbGTFQRDdYH/dKN+DPW0PpKb5MWZc4=;
 b=Fu84q7rn+FviMS+YAQOK7JE4ekrcvCOtq+xJpQuvm/fUEIh8oAr7IvM/B7b3lCy2U7
 ui5CRTHfQMVnov85ycNbQiBfwXYiIumgy/yBwdnu89B3JyPkyi4MMk+SrvymaSvAyZPW
 Brmuqb1f1UA32h3FpxLWQ070nP0Gwa9xxzvi2eAEPnAmYZYIlu55BHInfFr0risHvFVa
 bu3zXlIgoODIzUjuWHkqI2CC38PETMT4uD3TW8+FrHa9WsaZIkltKngChUPwClwgs4Ot
 itc7eBfLk9Yjm1lkQNAKeELrKIAN6yUYMjIldPMVC9eTWCMOQX7yP33MeC0bo4cDK9SB
 s4uA==
X-Gm-Message-State: AOAM531sh85/fa5vVNT25eZbU8fB+35d6tB1Hw47RFPNVItMM84SDECy
 DUzt60iiGpdC22e87Oi4NQCRgg==
X-Received: by 2002:a05:6214:b08:: with SMTP id
 u8mr37699872qvj.52.1625067125867; 
 Wed, 30 Jun 2021 08:32:05 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:05 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 09/10] hw/arm/virt: add ITS support in virt GIC
Date: Wed, 30 Jun 2021 11:31:55 -0400
Message-Id: <20210630153156.9421-10-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F8GCE53Z+DQp

Included creation of ITS as part of virt platform GIC
initialization. This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 28 ++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  2 ++
 target/arm/kvm_arm.h  |  4 ++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f06014..1d8c44685c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -583,6 +583,12 @@ static void create_its(VirtMachineState *vms)
     const char *itsclass = its_class_name();
     DeviceState *dev;
 
+    if (!strcmp(itsclass, "arm-gicv3-its")) {
+        if (!vms->tcg_its) {
+            itsclass = NULL;
+        }
+    }
+
     if (!itsclass) {
         /* Do nothing if not supported */
         return;
@@ -620,7 +626,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -654,6 +660,14 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            if (vms->tcg_its) {
+                object_property_set_link(OBJECT(vms->gic), "sysmem",
+                                         OBJECT(mem), &error_fatal);
+                qdev_prop_set_bit(vms->gic, "has-lpi", true);
+            }
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2053,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
@@ -2720,6 +2734,12 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
+
+        if (vmc->no_tcg_its) {
+            vms->tcg_its = false;
+        } else {
+            vms->tcg_its = true;
+        }
     }
 
     /* Default disallows iommu instantiation */
@@ -2766,8 +2786,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_1_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    /* qemu ITS was introduced with 6.1 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE(6, 0)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..f873ab9068 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -120,6 +120,7 @@ struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
     bool no_its;
+    bool no_tcg_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
@@ -141,6 +142,7 @@ struct VirtMachineState {
     bool highmem;
     bool highmem_ecam;
     bool its;
+    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..0613454975 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
         /* KVM implementation requires this capability */
         return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
     } else {
-        /* Software emulation is not implemented yet */
-        return NULL;
+        /* Software emulation based model */
+        return "arm-gicv3-its";
     }
 }
 
-- 
2.27.0

