Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592955ejj;
        Thu, 23 Nov 2023 10:36:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRbt8hGiCHhY+9yC1rWWd3iopNA6/1tJiPFL8YqcA9hZByc/F5Eyb7IIqE8Ns7iFl0I5He
X-Received: by 2002:a05:6808:f90:b0:3b5:37c6:6dcb with SMTP id o16-20020a0568080f9000b003b537c66dcbmr273976oiw.21.1700764601544;
        Thu, 23 Nov 2023 10:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764601; cv=none;
        d=google.com; s=arc-20160816;
        b=TbXmQppiVBHuvsTRcalbXrgRTp2nPRq8zbU9K5Qi3xxgRJ6rA4NS2Rd2bmSUM7uGmY
         ZLoXSF9PKH/JYmO5SAWpyB+pbpJsc5BOlFH4MUXWKSRtDbOsTqxiMs5S3AMSsPt8GXCT
         aNuWYHyvsJ85F3CLCZikE7BdQsYi3cF1lIuqWY75lv2q2jCKTUFwhF8zz640PDYj08Ht
         e9gvLfLm9Ew7Ind0P7Kan/VVFPvhTbx0PhbCNiX9GwVH8Jh2ZaoF1RPAy0IEEpu3JSS1
         wmX2dvCe16b560KPV1TCLAVThU0kBQZ3RsMOE2c2cNZhJYdzDHDPwBsTN38aUDoxW2xh
         H4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Otvbi712uFgYyup+pTZVJRpTHa74RGjJF86YXo2+tew=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=FsT6NApnEw+3X3d6JaBGeSqGC4vlZDd7XbwEVWAXSaIZtaFpMAbbHym6MmjnEavHEy
         gomHoVbKQ+JTnDfQIXVOiLzgQV6sYDIkzv7y1x0ZZ5fIFnrxd7vCalEO08s+QZfzdA9B
         vKPXLcCrwKBD52EHonPadGpv/Q+y7TBOVSi60D27V5u+QbnJvhfSkxbQGuxmJ0G+edsa
         DLTbN6eDQhm1bFIHD8Mz3YE5pDJdor4k7xiU9UHaxVfdmZKMJXKww4aWqOWNFxDNm0X6
         bO9wHjoHM6huWa0qVWIplbHP2T0aP5qPcyH3/3zeU8A0uGuY34bVb2gn3B8eVpd48a/Z
         STkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyyZspK3;
       spf=pass (google.com: domain of kvm+bounces-2382-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-2382-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2382-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id cl22-20020a056a02099600b00578b4082453si1862522pgb.712.2023.11.23.10.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2382-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyyZspK3;
       spf=pass (google.com: domain of kvm+bounces-2382-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-2382-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30092833EC
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8804A988;
	Thu, 23 Nov 2023 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyyZspK3"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B56DDD
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:34 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b399314aaso636625e9.0
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764593; x=1701369393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Otvbi712uFgYyup+pTZVJRpTHa74RGjJF86YXo2+tew=;
        b=dyyZspK3Mi5vUh/CQrIe24PXJAewY/syQyhlttao41E4RWUf7mZjgCV3bNksXB1uUi
         WNJ0aghSGpIJfM1sPdL3zu518VDLd0mf1jcFlIXoFBuWn526vCbHBtVj02F92GoSoNrk
         kjlJdXFT3/cGxbq59HohZvuA5I6ir3gL8uLxTaoYuWDVD/JKnjfhA0q6SFZRzZmHhE/S
         Z3k/cAJyR0u59RiJ4k0Ik2dvOGbc/mYWl9zg11AQzkBMX0ngvGb5u7pIAdB4VKH79nrH
         CQufPP0HQJdX7xDLtLsAtr9PWOoHG59bmqhdIKUwjAzRsUolLBqanGK5OZK1YQD+lVMr
         GeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764593; x=1701369393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Otvbi712uFgYyup+pTZVJRpTHa74RGjJF86YXo2+tew=;
        b=s0XD1/KZEeXWRLCjdhuqnY4acN66cqPuGbvcFj55eJQ/QSATeC9xj+3Q1ZIm6FdDp7
         NajKJzxn5sKD5NLfB9/3Qgbo4eQH2R5lwM0EZLOrAnqGOG2zBgdShqYAXy+/ALdGEwRu
         Wwt+/PXHDFjwGnR2Ej8rNWh6I3q/avWk0JmVQ4sOdS8BIKIQgeZiJz7WnYxU2bD6Lvdy
         6+t7xdXrvaE4MPZWdysqK/ZCb4olJMDc+W+9B2e7jcmoKCSX3/eSsBbTefc2yIW/W5od
         4cYc62KzLPuG433BLdk50n8cTsfhNRLwDwONNjCFIC4euXwX84yM1r2zzAu8UnE4j15z
         c1kQ==
X-Gm-Message-State: AOJu0YySqHvXTWTSjchpz4I7jAVfVTCJr0NJGmhOixP/6pWf/GDWsCsN
	dp+0PYnH3z5wJpyT09S2hNociw==
X-Received: by 2002:a05:600c:1ca6:b0:40b:2a69:6c1d with SMTP id k38-20020a05600c1ca600b0040b2a696c1dmr367611wms.4.1700764592790;
        Thu, 23 Nov 2023 10:36:32 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b003143867d2ebsm2344690wrz.63.2023.11.23.10.36.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 13/16] target/arm/kvm: Have kvm_arm_verify_ext_dabt_pending take a ARMCPU arg
Date: Thu, 23 Nov 2023 19:35:14 +0100
Message-ID: <20231123183518.64569-14-philmd@linaro.org>
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
X-TUID: 3u50a7suWHQb

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 57615ef4d1..91773c767b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1172,18 +1172,18 @@ static int kvm_get_vcpu_events(ARMCPU *cpu)
 
 /**
  * kvm_arm_verify_ext_dabt_pending:
- * @cs: CPUState
+ * @cpu: ARMCPU
  *
  * Verify the fault status code wrt the Ext DABT injection
  *
  * Returns: true if the fault status code is as expected, false otherwise
  */
-static bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
+static bool kvm_arm_verify_ext_dabt_pending(ARMCPU *cpu)
 {
+    CPUState *cs = CPU(cpu);
     uint64_t dfsr_val;
 
     if (!kvm_get_one_reg(cs, ARM64_REG_ESR_EL1, &dfsr_val)) {
-        ARMCPU *cpu = ARM_CPU(cs);
         CPUARMState *env = &cpu->env;
         int aarch64_mode = arm_feature(env, ARM_FEATURE_AARCH64);
         int lpae = 0;
@@ -1220,7 +1220,7 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
          * an IMPLEMENTATION DEFINED exception (for 32-bit EL1)
          */
         if (!arm_feature(env, ARM_FEATURE_AARCH64) &&
-            unlikely(!kvm_arm_verify_ext_dabt_pending(cs))) {
+            unlikely(!kvm_arm_verify_ext_dabt_pending(cpu))) {
 
             error_report("Data abort exception with no valid ISS generated by "
                    "guest memory access. KVM unable to emulate faulting "
-- 
2.41.0

