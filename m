Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp538974lff;
        Thu, 12 Aug 2021 09:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynRFpxiJNnOei+JEUfWQFLfowDZrK/kbywHmFe74pAt7JA8vOgB/r0Z8dFe9Neiexm2vSv
X-Received: by 2002:a92:3607:: with SMTP id d7mr3674112ila.5.1628787517822;
        Thu, 12 Aug 2021 09:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628787517; cv=none;
        d=google.com; s=arc-20160816;
        b=yuGOPeTG6ta3sNOyNXQUpk34KZeZ5eZFAx3iAaslcSvJrMHqS2+3dgu6gmeUT3UZ49
         yxePzK7MAm0uTvj0foNlvLMzIri0ye28KWjfCCxp0iWakFIgCriNO5V1cS+FJHAk1Ah9
         pwx2avx6hTeRBvZb89QsIlwZ50qPeeThy27HkOPVegMCoehsilkjYSMKRy087upp7igf
         OI9C/ewbu/HgoDa+YyyzHzPUoPMTExNoOX3RrXI5Yebt9YBASdFcBb7UsRAkzjGjHHQY
         azbYfUfojcC34pyuV4A4dZ2wXuQ5WD4FdQ918cIGFkerTsPNxab29w8wInCxrg8bhcjD
         9MkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kyjpq/o+nyGQCVVXepRD7yL60Hllj+cbnk5hSa+ob8U=;
        b=oh8D0Q1WkeecIyVWJ3+6IXzZHuZ2fZi+9VTg9NiXwNFnZkKLuExrNj8vw1qKMRESNZ
         //8NFaSoGSn1jYyl5vIeaRHFKRmE9nvsbYIYTv+NUqgI0HjiaAHRQnZ+mStMbk19o6y6
         12mQBD3EztivLuEgw2Iujt/V+j1LjS2MOd7yQT6It/UH1F4VNHirp85XZlyroEWMG3oj
         2o/tAqVbkSp9AgzjM7HYKDfkYzmQ10ykLu+qdzAf9tOGniZNc8LBj5n9KMkHpjMbPmwF
         EJIMSZfnSmG2usaNTbJH3AaS6Zzs403/LXaMfLdjPTV9OxUfSwlgTdAtv+ZkW3wuqdIb
         EDSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LPPb53qf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si3666142iow.30.2021.08.12.09.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 09:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LPPb53qf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEE2N-0007o4-Cw
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 12:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxx-0007wA-EV
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:01 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxq-00065E-Qe
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:01 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id 3so3515010qvd.2
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyjpq/o+nyGQCVVXepRD7yL60Hllj+cbnk5hSa+ob8U=;
 b=LPPb53qfW5CrHK29wAv3kd9TlWYA0+BrAZeghHdqquKi4DmCkrhqa58y4Wa3daQHQd
 mlXZ9fIgacLxuv1sfOOdEC/P3qiJkABZKCs7mxKgA4JNr2bukgBPkKDeikpbW9ri+lhK
 WYXuZsE67EkXlFo96SxQvFJ0s2kg53en1f3VdB6RFDpoO6FLQfwSy7kGp/x24zUqgGMC
 JpTpQX/Vrfh6wN9f7exVPe5lrHFhHg/rCrYJOvu0f1uNxFY+QPK1uaLAtU6lKn7+98Ss
 GA3pCnPs6W3Sm+M4Cg9ypZ21W1ZBN+IX1tt4e2+4O6nVCGKqjq3oKgTaeNGsFIHYKCGp
 Zicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyjpq/o+nyGQCVVXepRD7yL60Hllj+cbnk5hSa+ob8U=;
 b=alpugIiSssEhJE1KBBMcC7/pBrVSRi7c7X7Vj15PmC37oTmzRUlkeCXw63Gi2yxkpG
 QdFxf01Hem5ukNi1XQbM0Eei4DWHVyujBJktwnQHkWpRmtg0DxAiFaAiIJ5sHYUWm1Ix
 iuF+/PFw83acEslQh7a4r/laUUFicxVqeMiXNzqVIEzMLrYfBkUzLn+YldvzJ+MWOtSC
 4ua5qZCK0lfxn0FUbKPokqx8XdMEYTuEjOUNg0JQURtPqZcZO5uIeCz62/nTc+Tp76Cn
 v23RYCibS1qkWpSsnFIxoyvWZExQFzwB7+SunYYPAhMex8OwbTH2+YHZo8K9/R7ERS8L
 UhrQ==
X-Gm-Message-State: AOAM531jXXbZhf2F6GZ/gFRiu+wGHYuw9sr0/ygvL22QqhUud7bnJyyP
 vr8swQhP605av6AWcEObfbPqR6ltk/XKVA==
X-Received: by 2002:a0c:fe6a:: with SMTP id b10mr4896533qvv.6.1628787233247;
 Thu, 12 Aug 2021 09:53:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:53 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 09/10] hw/arm/virt: add ITS support in virt GIC
Date: Thu, 12 Aug 2021 12:53:40 -0400
Message-Id: <20210812165341.40784-10-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5XxrMizm7pZi

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
index 81eda46b0b..3cea2aa039 100644
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
@@ -2043,7 +2057,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
@@ -2746,6 +2760,12 @@ static void virt_instance_init(Object *obj)
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
@@ -2790,6 +2810,10 @@ type_init(machvirt_machine_init);
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    /* qemu ITS was introduced with 6.2 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c46699..b461b8d261 100644
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

