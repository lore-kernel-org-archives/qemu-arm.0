Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592567ejj;
        Thu, 23 Nov 2023 10:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0Ou4rfW1CeCaE6wwesq9us2q5eR/Rv3Twy4XEytSxSLRRQavYDki+sjZ02rs6JbeUq3uz
X-Received: by 2002:a05:6a20:e119:b0:18b:acc8:a5fa with SMTP id kr25-20020a056a20e11900b0018bacc8a5famr57211pzb.7.1700764564674;
        Thu, 23 Nov 2023 10:36:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764564; cv=none;
        d=google.com; s=arc-20160816;
        b=xZ9bh4sBQtwKCxYB8gzCUtgKBYJc93jXaKk/+F1QzA6PFSbgVwWcyfNrbR0IzeUW5G
         str1LTXpIVaHAKQstrApgCdSb56kixPo5lXvCGIUt2a+kQ56g1Eal0GiZcyaa05m8odl
         277fX84xn4d+MWU6owYIa1zOfzz3yQAsfnrBjEp42jSIe1FqOuxAt3KYybYU9l7/9RRT
         k4s44hcm/GIwjB4AmJ8CbpsKlJcE6h42N5UZcw7CUs/Q939lNqeYZ4RIyo0/+WrO54FZ
         nJe0eK4Ue4rmV4UQnRh+q11DOE2X6XvqVxtK3pGgoBJ/ardlD80BAkp27r6abG19XZEV
         GsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=APkzUJ5V8QYL4MOU/zl88wqY6eeEqD/ibNzL1bZO05g=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=dE5Vm1Q+e41rrwpsY3FI1MdOMs/GbqN/J1zmxuLhj7cltVmSkB9CrcnYRz+zLCFs3e
         VPaQHiE0w8l0oPnCaLKFRF+bOwAlbmRE+Ej5M0SemLACUInIpfM0Lx8m6NbwUzEficmc
         SVUhI9uycx/OnTz1lg6HUt0RxIby1VYEw4lU3/0XfSWNBCWnX1e0SaYWowoHL8VLTd+v
         mCfN1pp87lKcBBuO2x4ZZ2y1UuxfXvOkS7Tx7RqSNpZ3E8hwJQIKOwP2esoRzHO7CzQa
         1k87X4WVnivrljCC8ogjtXMY5qySRf+0Ckm7Mv85HFm0agJd1FmGJeL1CHlNm2A9snJi
         /c6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZuezVE+4;
       spf=pass (google.com: domain of kvm+bounces-2375-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2375-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2375-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id fc4-20020a056a002e0400b006cba60de063si1786267pfb.22.2023.11.23.10.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:04 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2375-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZuezVE+4;
       spf=pass (google.com: domain of kvm+bounces-2375-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2375-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F124AB2181B
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DE54CE1E;
	Thu, 23 Nov 2023 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZuezVE+4"
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222A6D43
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:56 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c875207626so14111761fa.1
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764554; x=1701369354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APkzUJ5V8QYL4MOU/zl88wqY6eeEqD/ibNzL1bZO05g=;
        b=ZuezVE+4ZaCw9ZaZlShhg1h5p67an0qTAKQQ4poUfV2GNxne7Cn8vnxoFf3KtfK4Pn
         qt3by1CS2MbCNlngk20BwpMbpiwhBUMU9KGk/4faMnoV5hlq0O/1WbKPFltD4rQugUY9
         ZdAwSp2WZweto+nlSu6BL8T12+s8RP1a+Z3Li2CS5rzS1+m6GF6hIowlClic9r0j9oWn
         TnJXy9DU/eE+9nf6ELfNw7MD5sFURNQqccysb24vi9usq4QLAxvad1+0lAI8JyoXkT9/
         r8k+Wm0Fw9qyOrH8l8HPJAfdrdV6R46uzuXRaPbWD5aAP773XxJ1SvM+Ssws79bExy4g
         xj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764554; x=1701369354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APkzUJ5V8QYL4MOU/zl88wqY6eeEqD/ibNzL1bZO05g=;
        b=iukLrNAL4zVVZ2N9n7u0DqJpY7Cyf453y3HHAJUJOgdoT5RAdcPyNUMtJG3WKBFjr/
         ufFuOUE2nLKNLyWDUEyFzo0QXyH+4rVidX9CgBkvjhfRTp0XQE4SNKD0WTJfn/4om+KE
         hLDJpxAD3Zx7vVoYoWSgdiZ/Cx0KClURKI5PlIudPGSL6xhfulAfq/4mYLEdMzUC0iqV
         CQ+Ymm9E2Jn5EEJki/gzt74EPsBDq0E57I6LCIiQyQ9W4fNDq1zEYIk2mJHDEPHHQ36J
         lu1Fph/bhOigMDGgN5R+VATAoj0oRVdRhrORuA2X/g6OSiHVE+LOF1JpnvKralKzXDjx
         QMIQ==
X-Gm-Message-State: AOJu0YxfaUDHKK3jJTVv2v/GhJdKsUNKbl/5v3f9xDaBma+o4BSN9YDz
	Rr0Fmgaov2Gp7aKA0N1CGZDbzQ==
X-Received: by 2002:a2e:9e09:0:b0:2bc:e330:660b with SMTP id e9-20020a2e9e09000000b002bce330660bmr180065ljk.9.1700764554485;
        Thu, 23 Nov 2023 10:35:54 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0040b2c195523sm3477497wmb.31.2023.11.23.10.35.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 06/16] target/arm/kvm: Have kvm_arm_set_device_attr take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:07 +0100
Message-ID: <20231123183518.64569-7-philmd@linaro.org>
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
X-TUID: 42i/WpbGFmh3

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 766a077bcf..73f4e5a0fa 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1691,18 +1691,18 @@ void kvm_arch_remove_all_hw_breakpoints(void)
     }
 }
 
-static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
+static bool kvm_arm_set_device_attr(ARMCPU *cpu, struct kvm_device_attr *attr,
                                     const char *name)
 {
     int err;
 
-    err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
+    err = kvm_vcpu_ioctl(CPU(cpu), KVM_HAS_DEVICE_ATTR, attr);
     if (err != 0) {
         error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
         return false;
     }
 
-    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
+    err = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_DEVICE_ATTR, attr);
     if (err != 0) {
         error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
         return false;
@@ -1721,7 +1721,7 @@ void kvm_arm_pmu_init(CPUState *cs)
     if (!ARM_CPU(cs)->has_pmu) {
         return;
     }
-    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
+    if (!kvm_arm_set_device_attr(ARM_CPU(cs), &attr, "PMU")) {
         error_report("failed to init PMU");
         abort();
     }
@@ -1738,7 +1738,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     if (!ARM_CPU(cs)->has_pmu) {
         return;
     }
-    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
+    if (!kvm_arm_set_device_attr(ARM_CPU(cs), &attr, "PMU")) {
         error_report("failed to set irq for PMU");
         abort();
     }
@@ -1755,7 +1755,7 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
     if (ARM_CPU(cs)->kvm_steal_time == ON_OFF_AUTO_OFF) {
         return;
     }
-    if (!kvm_arm_set_device_attr(cs, &attr, "PVTIME IPA")) {
+    if (!kvm_arm_set_device_attr(ARM_CPU(cs), &attr, "PVTIME IPA")) {
         error_report("failed to init PVTIME IPA");
         abort();
     }
-- 
2.41.0

