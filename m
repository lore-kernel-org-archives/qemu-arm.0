Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592663ejj;
        Thu, 23 Nov 2023 10:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOgHYMYfCXb12ll+H3dlPoxL+ibcWgdYY2kjIwMq89hMz6TfPlYZ63njVxpgujrok1Hfvf
X-Received: by 2002:a05:6808:1211:b0:3ab:8295:f2f1 with SMTP id a17-20020a056808121100b003ab8295f2f1mr264270oil.45.1700764575123;
        Thu, 23 Nov 2023 10:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764575; cv=none;
        d=google.com; s=arc-20160816;
        b=E1dscrx10VryVyzA2/s8hZRzKv8o+uqtESwsrQpPYwCASJ5pqdOf0eeXwvU9G08qoL
         jfYElpfpq6G5dqUFU+woo4L3fnrNiSiZbG1wQP1i8OevM62yQayeKltSj72PNLtHsq3l
         I8dQ2pUNIkD7EZjWMY/CFhfcaC9W652lHIuqLZQgxY7w+sUsCCbqEIOziLxyrWeHnZ6H
         Zrg4j+L4aH4MqnbicHTldCeOBHIjUZGyuwPLWIpyY+om9uTHE76V3Wrn+G/lWPI0PKjA
         JkzTvxKiYeof9DWlHrzW8zeFBEHNK7UrTNRUeuYiGSel1xa8Vi0epIqV3pM69RCiUI9i
         nReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=sJjfIOalwsvZmq2fy7v7JKs3hNC/WaTRJ81yhz4vDXw=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=uuIbkSj1ZGl5WUQw+FP67QDkcVdlHIE21zPuZ2WXxuWypb6EZ0rSl99WO6bZXT7590
         plwksooe4vlgK0/OneG8taVYWFlNXg8/7AiOeO3HnY9k2dRzbPlwdcpj+CuWmHiu0uaz
         MvIE/wyHbhuVfhYiycQIfJg8gCUaJjqkfzcul2bVAdVp7BMgPCJ7kXr4fgSJpC/neH6G
         iTsEGhXeXk8fye3UsXGj7FrbRKQBPgDgRvjQald0OBsGgcIdzUVVAi8wER9xHS9BgiDm
         bRnGl1rFmcKud/I1HTDBDUfmrCM5xcnd7VMNYvmVLih5oW6DYFjJz2v7hp2kUzD31nEg
         ypOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ac8Lp4ik;
       spf=pass (google.com: domain of kvm+bounces-2377-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2377-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2377-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id h3-20020a63df43000000b005a9c40151b3si1768239pgj.804.2023.11.23.10.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2377-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ac8Lp4ik;
       spf=pass (google.com: domain of kvm+bounces-2377-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2377-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED8ADB212F2
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E084C3AC;
	Thu, 23 Nov 2023 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ac8Lp4ik"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD9310C2
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:06 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40790b0a224so7659915e9.0
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764565; x=1701369365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJjfIOalwsvZmq2fy7v7JKs3hNC/WaTRJ81yhz4vDXw=;
        b=ac8Lp4ikWZipDOzTWtJLNlV/ZwuUjhpZVf61In80JWbLRpsUz9wLLDl1ep6f58ECn2
         NgfDjJdeb4ru59to/CX8XbMRyLmhLJhuXNsvGX8e1cT+mjtXK+YCO5WWo+p0ueDe09DP
         ypNwyb6ILqW73xpkYino8nC+2136n5+HfIrGcmH4bX/ckCIaDmKyz5yE+v6efjlomjVf
         wHQc8RnFUXp40liNbpF3lmKZJxEu6ZGbXhmTOT3MVTKZ4twCznBLlXeQ4S0DIduDCCKY
         lAiOUkeSEqIZvfFz/G4cn0hkoxxxWARcJjcY80th1/io2CepXscAHbDXF8IW8Mj/znNp
         ITBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764565; x=1701369365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJjfIOalwsvZmq2fy7v7JKs3hNC/WaTRJ81yhz4vDXw=;
        b=HTiyUqa7L3KbxS7qp507bYWM3MxlG43B2lKNZv0Vor/XpR+/KOfRfd9bMZf4o6q76z
         XQp9GjYCfhVvfiGp2NgESa7C7qhraPgyz+tfKO07gGahU/TDOK98HL4DqmFXXl6NGJz7
         OpwwgflDiIvVgVYrk29gNmcvAkTaDgObq+QlB2UZXR3mi+i6UogddC+gIIodowfQYOeR
         f35vtC80MGCBxle9RQluJG2snoYCDtvkCQlr/Go+tCJW5X7aX45725tc+Lzfs1jsvlMv
         dFPKM/N0y8UptFyn4VBoSD4s7H5NK+b3ViGijiDej98oa+DRwwDx98XF2d+Tyf6sMyIe
         myGQ==
X-Gm-Message-State: AOJu0YzISmjR9alMaKDJTLjveEiGxT0CDRjtfXhhdihrf2DzxLVvb/fS
	puW0jTLNCxF6h1vm7YMe4p8hoQ==
X-Received: by 2002:a05:600c:1c12:b0:407:612b:91fb with SMTP id j18-20020a05600c1c1200b00407612b91fbmr290352wms.30.1700764565221;
        Thu, 23 Nov 2023 10:36:05 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b0040a507f546fsm3526409wmq.8.2023.11.23.10.36.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 08/16] target/arm/kvm: Have kvm_arm_pmu_init take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:09 +0100
Message-ID: <20231123183518.64569-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
References: <20231123183518.64569-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NLWbRJLjT8X/

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h | 4 ++--
 hw/arm/virt.c        | 2 +-
 target/arm/kvm.c     | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 0e12a008ab..fde1c45609 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -200,8 +200,8 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
 
 int kvm_arm_vgic_probe(void);
 
+void kvm_arm_pmu_init(ARMCPU *cpu);
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
-void kvm_arm_pmu_init(CPUState *cs);
 
 /**
  * kvm_arm_pvtime_init:
@@ -263,7 +263,7 @@ static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     g_assert_not_reached();
 }
 
-static inline void kvm_arm_pmu_init(CPUState *cs)
+static inline void kvm_arm_pmu_init(ARMCPU *cpu)
 {
     g_assert_not_reached();
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b6efe9da4d..63f3c0b750 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2000,7 +2000,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
                 if (kvm_irqchip_in_kernel()) {
                     kvm_arm_pmu_set_irq(cpu, VIRTUAL_PMU_IRQ);
                 }
-                kvm_arm_pmu_init(cpu);
+                kvm_arm_pmu_init(ARM_CPU(cpu));
             }
             if (steal_time) {
                 kvm_arm_pvtime_init(ARM_CPU(cpu), pvtime_reg_base
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 82c5924ab5..e7cbe1ff05 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1711,17 +1711,17 @@ static bool kvm_arm_set_device_attr(ARMCPU *cpu, struct kvm_device_attr *attr,
     return true;
 }
 
-void kvm_arm_pmu_init(CPUState *cs)
+void kvm_arm_pmu_init(ARMCPU *cpu)
 {
     struct kvm_device_attr attr = {
         .group = KVM_ARM_VCPU_PMU_V3_CTRL,
         .attr = KVM_ARM_VCPU_PMU_V3_INIT,
     };
 
-    if (!ARM_CPU(cs)->has_pmu) {
+    if (!cpu->has_pmu) {
         return;
     }
-    if (!kvm_arm_set_device_attr(ARM_CPU(cs), &attr, "PMU")) {
+    if (!kvm_arm_set_device_attr(cpu, &attr, "PMU")) {
         error_report("failed to init PMU");
         abort();
     }
-- 
2.41.0

