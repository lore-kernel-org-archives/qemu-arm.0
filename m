Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4186227lfg;
        Mon, 22 Mar 2021 21:18:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqQvpeyb5sZPljpzmNPspf2WP+JzhmV6Fd9GDd7hqqunn/rihfZhKKjZ0uKEOssMWaVlfC
X-Received: by 2002:a92:6b10:: with SMTP id g16mr3253320ilc.26.1616473096427;
        Mon, 22 Mar 2021 21:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616473096; cv=none;
        d=google.com; s=arc-20160816;
        b=d19aEzwfedjNQqHRlyaqHh4zKVmmjzNwoNsii4Jy+CTHYDffsLCJt5TmXTFqnX5OfA
         FgC5C8jkL5dNMSpECqJ47o02j3f1yaC2rQbf7saV7ctT4qTyc/iQOboYQkmy8PkJU9+F
         4WUIPpfXUb7Qi4GtAkHvsVBuPfPbfPTm2FyhQ5qnzPq+mtLZEF3f1DW7p+e0J3DgckG1
         wWqjSxYR0SlzR1Gn0yXcZtMMnhF8suK2xt0BFTzScyX+bbByCEq+cdQUx83evczAilQo
         0zMbEuOE1GLFmbFvFBgVrgaD2H8ZANbso/y45BpAdvlhpht399cXrWLdPb5NxI6X6M6m
         WVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
        b=QWSnQZ31RAaGapRbmD/CqDjJy2YS7IAWqKXeigDt4yAwqsjD6Igz2omLA7sFc3AkFu
         y8M25Buz8a7bsx4UAWX37WLABefEG3OUXa0GjeGIYnx4rlDW0AlMssbo0hVOCcsqUGBf
         t7HJiFM7xctisAgIcYNcMMP6M5cKyqbUUxQiuHr9jYzyI7Xfb9XuSp0/WakcOVGG6Icp
         BB4aFeo4YX354fUnj8LKsG51tevY0UEiFYaIm6luNNXixZ/knLILyrvBl2ZDX2EIjuGr
         sGLEs1erkCUEONgL5VRmv8Up87gke3PXQ8dXqM+qR2PgWVQ0b7T83ln0L4j1ceDz+TGN
         iqPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eOennnAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si11049953jaj.113.2021.03.22.21.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 21:18:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eOennnAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOYUh-0005n3-Li
	for alex.bennee@linaro.org; Tue, 23 Mar 2021 00:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPp-0000oe-7V
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 00:13:13 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPP-0006dS-VA
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 00:13:12 -0400
Received: by mail-qk1-x731.google.com with SMTP id z10so13098191qkz.13
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 21:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
 b=eOennnAjZl/gXsvTkXxNaPZN2Um9rfxdNAvoYx0ZQbNmML1VizMxrjN0w7CWJNVgYM
 ea5P/zzYh0igaEngwWO1uMHW4um4uqAVMMfwyKSRwoASUDPSH5xGsRTxHIm0QcqMqOSZ
 xAQXPUrGWtpS5MWf8w1T/XZmq2eu/AzS6t8h0X0YKwOILJh3+DseGFGgCFNw37x1fGbz
 g36kjiDLVCG5Mu4AQ8iRkjk93MCOl07zlrnMYud3M2JwRAQ/hskQdOQ1IveXeyYXL38k
 hqDJK3kjizWYt9vuJLcmKtD2UCdtZ83/mTA/V0/IhRH8Y863qE6QuQVR6DjLTVa+IfL8
 UMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36CRRigRDg6z7Ps/zHm2nFOe3o4QS1w0QeVs5IpQt88=;
 b=M/iuBWjQrNUpEanPmoImB3oht/0rrKsDtPp2I00bmwqYx15OhxQMUslm1CBgYfmIRu
 7E58Ddb8/L7F/lTN1jz/tekD/Ca2qBfp5ALuV3N/9qmIGPW0Ocp7xWFJ27nKxH+iti32
 mL5FkXhJohWVCpXdCQtiDmeQTb183ZzcRuyUBLutrd1UJZqHmUIKCBHQtxyEEyJtA3UE
 emzpPjFvZVfaCBvMUlMnyHe0kN8HFNoBQ8cYmXuFTV7EHKWzJTFEISfpA2NBJ5Z/7Vyt
 CCducFvGRyR52ygW9vCWPC2sE086PP9JOQ+GQXYA8r0MlBo8Bju9rR8jg64w2MFlD2Xy
 vrlw==
X-Gm-Message-State: AOAM5306EoHur6qARWkFZ0ltFZaLFhpOfCrDl+sjL3luCFcWcJ3v63Xk
 S00cVMKzc0xvaLjjnIf1mCdKbzhpMrdYqg==
X-Received: by 2002:a05:620a:20db:: with SMTP id
 f27mr3685575qka.51.1616472765872; 
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 8/8] hw/arm/virt: add ITS support in virt GIC
Date: Tue, 23 Mar 2021 00:12:38 -0400
Message-Id: <20210323041238.133835-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
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
X-TUID: wRH5sqW5yKXH

Included creation of ITS as part of virt platform GIC
initialization.This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/virt.c        | 10 ++++++++--
 target/arm/kvm_arm.h |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..77cf2db90f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -622,7 +622,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -656,6 +656,12 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            object_property_set_link(OBJECT(vms->gic), "sysmem", OBJECT(mem),
+                                     &error_fatal);
+            qdev_prop_set_bit(vms->gic, "has-lpi", true);
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2045,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
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

