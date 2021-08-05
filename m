Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp640350lff;
        Thu, 5 Aug 2021 15:33:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvRQgPcTN6fD7rZxftjWupJMzSu4jCGj3vmnJJgAS7J4ySp3tPM0m8uTgxxAa5bI/NCe5/
X-Received: by 2002:a92:c946:: with SMTP id i6mr406144ilq.228.1628202815797;
        Thu, 05 Aug 2021 15:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628202815; cv=none;
        d=google.com; s=arc-20160816;
        b=pcocz68qN9JHsBP+XkWJ5/dsfwVCsqf8nmvthMfbqIs+ehZk7QGtAYkxhyqFfIrplB
         u7A7xqU+Z+uPCCcw3zwcLrWdyYzNxNIBOhnhyIimH9mNkEQVRqZ76BfEsYq7o6gebo24
         5lp8MPcCjiqVta82Zxb4PNP5BfbhI9fueYqmOfVZy5QmAva2ykwRGye7LvDxXzhVK0ix
         1aw7epMA1qG3L33BCzIgnaImpBlaAn+ETSvctV/61q64ie9QU9DW1A9IY8eS3L03nXsg
         TGoU020jf7+LQwsYzWBhEH0U/LaYiXsTKR5l7aEz+p8hEPxlFrzcFiDH28qn9m7XarbC
         XogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yG/u+nkDS8KZvhv4H0mRtZ4vwKxUsJYu8AiwnqDVS6Y=;
        b=ugYUKFHQ9y4EgIkhQo42pSNTK8XQJFxx7/JZBxJQbrbZcNJzv+gB5d0dB+0eRAQpYO
         oAc7S5FLnr0vSQuET3rznt5Q+pfuDbwL1ZsThXnH3htH5KCKZV1BSgDnTiROzsHBU1Rz
         ftD1ZhxShSnq0Gn03Ptoi2n4y8B9bB192wRG2Jzb83ms/XR4SZnsIKWq221o7vgvwW3f
         jpXs7WbetCJiBqC841I6uzWFp18dM+EMIOahHy2Xzx0uy+yS8WDk9DOAXu5mopHKuyzj
         Pc7ckRoHOWIXz4pgrKId8UODujErX8DiSvR487yxvpel4RrteQadEf9pv7hiy+pj8zuI
         x4ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qlIVed2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si7102752ilo.41.2021.08.05.15.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 15:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qlIVed2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBlvj-0007gV-1b
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 18:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsV-00081Y-5V
 for qemu-arm@nongnu.org; Thu, 05 Aug 2021 18:30:15 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:37792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsR-0005vT-0a
 for qemu-arm@nongnu.org; Thu, 05 Aug 2021 18:30:14 -0400
Received: by mail-qv1-xf34.google.com with SMTP id js7so3850195qvb.4
 for <qemu-arm@nongnu.org>; Thu, 05 Aug 2021 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yG/u+nkDS8KZvhv4H0mRtZ4vwKxUsJYu8AiwnqDVS6Y=;
 b=qlIVed2U0EU/7YVERW4pd5lMXZhCPNmAaxsmQmG81aWxOEQn8TMfEg/TCtfEi7WtmV
 x1nupNNyAiHC7pOkBse6C8hOV43w+2jRrkG41OXrzSdxarSPr3RF8cc3HDveBFsuGR3S
 YXEK55cDPOAyz+AOB7vr5psurkM9nikGHak9ItPGFW+6/LfrOi3GOBmgFXdTyn/oldMq
 2CQWQcA0EcEzu/rFZJ7mlpSyslm05AobceDhvR45Z8OYEDVdlbQ5r1IWN5Enf6OlZN1R
 imnbQOKA/DNW9Wnzh0HDB6ufxyJShYEdBVmjZQpIbmBlEQG9LMx+pZjokuZN0IHMrzYl
 Mi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yG/u+nkDS8KZvhv4H0mRtZ4vwKxUsJYu8AiwnqDVS6Y=;
 b=RCo5eiFB+7EKP3DorI8YQiGPaGc7nOtC2ku167HT3hY9sC+z+BbRCLGn15STIu4hD5
 MHGU9d83WSL34GtuRzrYhdRJ9/0Zl7+PQu4Kxvd134CyM1BhXgr8AVFczQcBI4iAMRoG
 pwIG4YvynnOF+zgcD89/GI5bAQ1psiMKdkiAxCZs0+dA+t2BT4e8bDICTma3/GloppoD
 oY6JCcm7LBGLJg4N46/u3pp+vPLoIjqS7KqH0ITyFLTmDLlC4luPIea2K9Kmd0pS0cTa
 3sJH8CbpPXdNIOUkSUKv7RnfXKLM9hyO3aDXEJdCyXTVYzCtYp2N1r/5KMrV1kNJjzg/
 jCxw==
X-Gm-Message-State: AOAM532eRoDQ+8yx3fsz9mvUA/w7/KR8i0aHIK//pVul+1K1XR/nRZul
 piefIVggbs7G9mJO/wI1yW6xuw==
X-Received: by 2002:a0c:fe6a:: with SMTP id b10mr7961829qvv.6.1628202610127;
 Thu, 05 Aug 2021 15:30:10 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id d28sm3655195qkj.25.2021.08.05.15.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:30:09 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v7 09/10] hw/arm/virt: add ITS support in virt GIC
Date: Thu,  5 Aug 2021 18:30:01 -0400
Message-Id: <20210805223002.144855-10-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210805223002.144855-1-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf34.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MZtAXwhvFUWS

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
index 81eda46b0b..99cf4f9dbd 100644
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
@@ -2795,8 +2815,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
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

