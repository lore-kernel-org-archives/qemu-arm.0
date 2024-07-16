Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp149992njk;
        Tue, 16 Jul 2024 05:51:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUl3DYj9psmD9L+eQyHEiJGkChWTBHk8eg6MyYMgHk/xR+ydx1CwqM7tWGbIHTVmf3dmv+nJZjoqwVCI7cPG45tuMRRJweL
X-Google-Smtp-Source: AGHT+IG89ED+tbgM4Oka70vV67qy26h3lpwgw2sii+qNMwRAGL0qPMrUQArs6yzgzXdUWSnc84Y5
X-Received: by 2002:a50:bb23:0:b0:579:e7c5:1001 with SMTP id 4fb4d7f45d1cf-59eeee358bfmr1305872a12.23.1721134265685;
        Tue, 16 Jul 2024 05:51:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721134265; cv=pass;
        d=google.com; s=arc-20160816;
        b=KcM4mCP1yNlNP8jx4MM6+WzxKKx8F3j+HaXuTlhQZHpnrlCrMcWapztEFFwAnj4G2g
         TFXj6Hr9lPaHeN5oyRnGf8aZxWOZOvmIf+7cu1VCnKnTBlTwn1xrJUM7gqnBVi42NA2e
         R2C9BgQ6SWvq61v0lTJLnXYbrrK+qAM2/L9WR+nPECgy5TlUH6IphcRCurKSIJTmitR4
         xR/oifYXOXrhMVdUoJcgd7mUrIiYcYLItGGzu19WwgFhRkkIiIhvKP7+II4jn4C8aDES
         uAWjuuGcj4gz7McKhgaIQNaaV7PbkoFnSLnCzgKMA2Tz/1B5EEr+88KescKkcKPAKBA8
         ASOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=JQOKrG52Y2enmmfF+L80VMku0KsDSGPKvaWKbQs8/U8=;
        fh=198Z6/DjJUZtxiqdZgHCPCGNnnWmA4SYXZMw1ozy+4Y=;
        b=AlTr0morD72aJQKxcilcsrudnZqZfKDEiqqJ2QI3nDi7AkuAaLih49Au6AWJER7bnv
         TvKOGebpn7t66joQ/dj8ZdZFKrtoi1UKHgn3FOw/yqtmChHY/LvyzFTtwdJp5gjC66fF
         VBUbWcixUhUtMaxRpPSBg2NKq0xQc+cl4Cm7nu1pFPznxR+3jaRpTvhHlalllrB7ZYXD
         Pp3AIBNjEccfw/ZIy+l6l7Gpj8bedIPSFU7vFFfRSQL0v9lvFmMn04KwF0a7UOZpbhPX
         HvGUqwM45opsbFHODu7Z8npR+FMtd0lvN9qBuBWJGxFokz0ESFc3CQuuMT/Hl5yDQHUO
         K+Zw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="VtL5/5jm";
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21706-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-21706-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-21706-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-59b24f532e0si3840796a12.160.2024.07.16.05.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 05:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21706-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="VtL5/5jm";
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-21706-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-21706-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456991F21A0C
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 12:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9CB145345;
	Tue, 16 Jul 2024 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="VtL5/5jm"
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357354D8A3
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721134254; cv=none; b=eh2Yg2rItcTsdG+l6Mwd0+tsh3qhi8rbONygFbmDFtFqmRQVBWOHtUzHIIogadrRXSkmGi3yQu310iPOM+ncjR24wSSD0VSzV1ZkiwJo/UQGRN1zFuV9qIhnPiquLKYQXXz9p+6Q8Df37KOFpyvwQvEnpHCT7Kdlkthga+YEqqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721134254; c=relaxed/simple;
	bh=wBAQpGl/CAhz0RwvC8Z28Y8GdheJmjjpT6Nx1YpBjZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2J1r54BNXk8GrsS0RcHXdVo0xvEg8V6FnEcSBH1OPj0SHvcukCq7JA1Y2HYdARhM2PRineB/NKI24dMDHC7YdDDy9FpyU3vARNrEOFS7ylSHdvcKTNQcYwfpIqVWrPY1C7n7pYU4Ta4pBekYeW/idGcV7bKNngBpXUJRwveeRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=VtL5/5jm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso38729135ad.1
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721134252; x=1721739052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQOKrG52Y2enmmfF+L80VMku0KsDSGPKvaWKbQs8/U8=;
        b=VtL5/5jmdTc2lKh/95RmJCsWcrSZX3efuXGXuCQicv+PYnQoJ+1BgLzE6qUPQsdBPQ
         4UuDqhY8298Z9b3dPn8Wy/P3R2MUvb7roddKr3fyF711bmdTJHQCrFvz2JnxMlk43gbQ
         JXiSfbv4oK57Q/xiZrr4WO+51d9JHWZigay7bqJQMU6oy4Qsa4r610UTEaVwoyvT5aIE
         VjOjLxaYK/ySB1+J6v3zTZOnNk+hpFAYl55F/sQ+lGxr1GkrdWw06z/DWbnYQ23Py83f
         duL2ogfgv/9EQoSfl2CCn6bMVshqMNSaLt5LrIaj+fr6dazboJb7V4S150V24el4Vs36
         ocCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721134252; x=1721739052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQOKrG52Y2enmmfF+L80VMku0KsDSGPKvaWKbQs8/U8=;
        b=UZROUuzfznib5ZER9BztYnAOdCH0a0YK2Ws65CIcwJdXTwen1i7jpslcEjKBtLF8rh
         iIDW/Dpbw7Hc9pVMWy5KMDykNy7oSwxccYutpKPvDgGfA+3BB0q2G85TD/M3VYs5fZbg
         Ya+41ZoC9xIfKREBLe+cv5GXsu1SQXMxHdvtLpmJKqEE4N3TX96V0+Bz56JHSBOcifkb
         ZoQUTcMf/UBbHXU5tJTp4zPv2PwALgY6A5WHxhQ+Df3um9nAzl6fjXb/BmxMeY/81bwR
         NZnNYYhHBESd2NY2vvOEqXc2CYLn7YmABnJJEd/xku1FiWqxzVIRz2lRVT0ioqLW5sP8
         2AcA==
X-Forwarded-Encrypted: i=1; AJvYcCXPkVZ2pALlGJ292CqbvX0nsS+kAcDrPPquOBLvhVt7K0OChZfboFoPsypSvuW/t89u3ZeN6oSVeQz8SJPp5QbTKYoc
X-Gm-Message-State: AOJu0YwIvMH5oBZP0ol2dzEbeLX3f3sd4MaopDc8avLNTvBtQiWMn6es
	JXjbJybhnC+IhsWYhXJnLzS9Hp8hAmXW+RQ7DttvSH3A+V2WrpQ64qgZia3klrE=
X-Received: by 2002:a17:903:1c9:b0:1fb:6794:b47d with SMTP id d9443c01a7336-1fc3cc6a2b5mr19748855ad.52.1721134252576;
        Tue, 16 Jul 2024 05:50:52 -0700 (PDT)
Received: from localhost ([157.82.202.230])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fc0bc270f0sm57678555ad.131.2024.07.16.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:50:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 16 Jul 2024 21:50:31 +0900
Subject: [PATCH v3 2/5] target/arm/kvm: Fix PMU feature bit early
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-pmu-v3-2-8c7c1858a227@daynix.com>
References: <20240716-pmu-v3-0-8c7c1858a227@daynix.com>
In-Reply-To: <20240716-pmu-v3-0-8c7c1858a227@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: 7RcW4jrcSEvk

kvm_arm_get_host_cpu_features() used to add the PMU feature
unconditionally, and kvm_arch_init_vcpu() removed it when it is actually
not available. Conditionally add the PMU feature in
kvm_arm_get_host_cpu_features() to save code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/kvm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 70f79eda33cd..849e2e21b304 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -280,6 +280,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     if (kvm_arm_pmu_supported()) {
         init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
         pmu_supported = true;
+        features |= 1ULL << ARM_FEATURE_PMU;
     }
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
@@ -448,7 +449,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_V8;
     features |= 1ULL << ARM_FEATURE_NEON;
     features |= 1ULL << ARM_FEATURE_AARCH64;
-    features |= 1ULL << ARM_FEATURE_PMU;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
 
     ahcf->features = features;
@@ -1888,13 +1888,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (!arm_feature(env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
-    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-        cpu->has_pmu = false;
-    }
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
-    } else {
-        env->features &= ~(1ULL << ARM_FEATURE_PMU);
     }
     if (cpu_isar_feature(aa64_sve, cpu)) {
         assert(kvm_arm_sve_supported());

-- 
2.45.2

