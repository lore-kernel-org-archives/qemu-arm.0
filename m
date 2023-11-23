Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592588ejj;
        Thu, 23 Nov 2023 10:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETxKtiktx4RObVlTosbpGCI0RESIXfDyGl1HcRywwhAcfc0V+1AWKOTdPG0jzyb4Oj97SU
X-Received: by 2002:a05:6830:118d:b0:6d6:4729:3526 with SMTP id u13-20020a056830118d00b006d647293526mr354472otq.29.1700764566805;
        Thu, 23 Nov 2023 10:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764566; cv=none;
        d=google.com; s=arc-20160816;
        b=MI7nKY5piMpBwmOY432daZGY/cTFAl+wVr/TJ+cIjCTTay2hPTSNpgtI4Bv7ZZsN8Q
         CLv3sjlR6sPdLRTEY9Vc4FnTMHXz2fSaAjP/x98Wf9qb6ZySfdEsYB5l2z6YxSE7K30S
         Ma7HCARfpPSSRAvEG7B7UZABsW2YTErH5JmSfLqVqBoQnYymcsxNs4A4V9Hp6ey2OnF8
         iQhmjA7MlL9o9Zswpc34Z48MS8jzCYCLCIGzL1VYwDHEXFqgAaKt+YGtixjw6xsAM933
         PUAiyZ9HM8Q6KKKXMZ2UI0TntuaZFBU5lFxjliQ+0H81+zCCinJqOWvuxYTwfq1eLG2k
         4c6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=znNmY7edfJI2fYiqN/HJeKsLDF9NhHOuefv0PghAu5M=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=XUO61Dq/sBLHGa4NF8wSnweKfO7QGHpsxatUpyTNBqn9D8bTpqfBOYwCCf4pJAYtGy
         0YrHSLH3d6D8LsjwVRGHhQXVY0b/AtJiGpbnXSXQxSa1WJv8AGm7Kgb1J84EZ3BX/OjK
         KYveZYatdNhp0fKgo6i9sODuLE20w95hKu2fbdtk7zLBRi26jxYORdHaoPQ9+74Ae9j0
         0bls7EXJrRGqXWD2XPXlzLk9OikKeq5h6k9NLKGko3Qfys/NEbmScf5mXEvUoc4FU4cL
         ZQoVMkf5tysvRXWXWEgofelxxXi0tumz340VQrjEvbxb3ERTv/2PyroGTmjBgVDIICZB
         hruQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0q+YThR;
       spf=pass (google.com: domain of kvm+bounces-2376-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2376-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2376-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id w5-20020a0cef85000000b0066d14432c26si1612375qvr.146.2023.11.23.10.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:06 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2376-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0q+YThR;
       spf=pass (google.com: domain of kvm+bounces-2376-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2376-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 707891C21012
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166F84A988;
	Thu, 23 Nov 2023 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0q+YThR"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DE810C6
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:01 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507c5249d55so1658072e87.3
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764560; x=1701369360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znNmY7edfJI2fYiqN/HJeKsLDF9NhHOuefv0PghAu5M=;
        b=C0q+YThRk8Jj049ZITDnrVzHv0D18jT5lJbkRoXeB3mbE5JWhVz1LZ1KB82KjAIE3S
         HxnVnnJBRa/Xz9KiqaN3tNAEFODXErwd81kTlj81il5WDwOmjwzla2YnAxSodikND3/u
         iRLfD8VbTxsHbfp+V/Emk1g0XNKyERfmn69DAKNvtCiIAda+EBjmAmYWXwXhZdiEuHUc
         dOZuNxWgmagIHAlHU2wZE5PkSj3Yb5eZJfFkScxM3lU4oGI2MUuf/r5HWTGHSlTuN0B1
         dfxc5HQjhM0Zp/NWlNg/YIo7HMF2RJ5uSZORBv1bucLbdDe1CIp9syB4zQWhNnFNX6OP
         OTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764560; x=1701369360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znNmY7edfJI2fYiqN/HJeKsLDF9NhHOuefv0PghAu5M=;
        b=CGJK1VsyIUVGmlP4fNhqaO/c2ThMA5cC7GIJGGua+MNhuSlHpffXCqGJLnqxfqJfir
         cNC9vzxmJGwr9f26HRIxq5Xim3hwLtflC0eW5TwLzgU0LXikIlnYNbnOVzKld9Kn5hC3
         eSldHRbw5Luw2dl1EiGss1oB4LSHgW+aGK6jCWM+zO5pLGpJU17Yy1ovtBrIJuRyk8uo
         V2CI7QDIkUaJ72Bq6nyzvAD9NuggEw9KcV//0fY3kNXWtoJzfYSg2bxuA+LSCQCixvKB
         V52zosacvC+xAcpYV2TjqR1mQ/xygJyQxgXmbeQY+x/F11qU2efmphdrUeLhRRjMTdOU
         rOpA==
X-Gm-Message-State: AOJu0Yzr5B3p56Rgll6FS23QE4LqRi6jyNOBrCTWnvpjaMfh/bbeNeio
	RURouUVuzY1Q/n0WQhNjfVpH5w==
X-Received: by 2002:a05:6512:39c4:b0:509:4655:d8d5 with SMTP id k4-20020a05651239c400b005094655d8d5mr92555lfu.11.1700764559795;
        Thu, 23 Nov 2023 10:35:59 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2352293wrz.53.2023.11.23.10.35.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 07/16] target/arm/kvm: Have kvm_arm_pvtime_init take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:08 +0100
Message-ID: <20231123183518.64569-8-philmd@linaro.org>
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
X-TUID: UfFtQsCDXx4K

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h | 6 +++---
 hw/arm/virt.c        | 5 +++--
 target/arm/kvm.c     | 6 +++---
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 84f87f5ed7..0e12a008ab 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -205,12 +205,12 @@ void kvm_arm_pmu_init(CPUState *cs);
 
 /**
  * kvm_arm_pvtime_init:
- * @cs: CPUState
+ * @cpu: ARMCPU
  * @ipa: Per-vcpu guest physical base address of the pvtime structures
  *
  * Initializes PVTIME for the VCPU, setting the PVTIME IPA to @ipa.
  */
-void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa);
+void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa);
 
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
@@ -268,7 +268,7 @@ static inline void kvm_arm_pmu_init(CPUState *cs)
     g_assert_not_reached();
 }
 
-static inline void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
+static inline void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 {
     g_assert_not_reached();
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be2856c018..b6efe9da4d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2003,8 +2003,9 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
                 kvm_arm_pmu_init(cpu);
             }
             if (steal_time) {
-                kvm_arm_pvtime_init(cpu, pvtime_reg_base +
-                                         cpu->cpu_index * PVTIME_SIZE_PER_CPU);
+                kvm_arm_pvtime_init(ARM_CPU(cpu), pvtime_reg_base
+                                                  + cpu->cpu_index
+                                                    * PVTIME_SIZE_PER_CPU);
             }
         }
     } else {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 73f4e5a0fa..82c5924ab5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1744,7 +1744,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }
 }
 
-void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
+void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 {
     struct kvm_device_attr attr = {
         .group = KVM_ARM_VCPU_PVTIME_CTRL,
@@ -1752,10 +1752,10 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
         .addr = (uint64_t)&ipa,
     };
 
-    if (ARM_CPU(cs)->kvm_steal_time == ON_OFF_AUTO_OFF) {
+    if (cpu->kvm_steal_time == ON_OFF_AUTO_OFF) {
         return;
     }
-    if (!kvm_arm_set_device_attr(ARM_CPU(cs), &attr, "PVTIME IPA")) {
+    if (!kvm_arm_set_device_attr(cpu, &attr, "PVTIME IPA")) {
         error_report("failed to init PVTIME IPA");
         abort();
     }
-- 
2.41.0

