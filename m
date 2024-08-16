Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1117335njf;
        Fri, 16 Aug 2024 00:38:30 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXMiC98xHzbl69OHzWByYFL6Hfo4YnG8taM55NeQ8vCIySh8aowfryaka8zGB3F+BZt5QLSKRtQcppAD8cY+mgPIrkN6rQH
X-Google-Smtp-Source: AGHT+IEYLO+Nr9Zt2k/NiE661Wy4W1OgdnRC3qQgIHOElUfzkOBEsq05lS323pkFsWbzXBAhaXM+
X-Received: by 2002:a17:907:e658:b0:a7a:bbbb:623d with SMTP id a640c23a62f3a-a8392a4fbdfmr140353266b.66.1723793909937;
        Fri, 16 Aug 2024 00:38:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723793909; cv=pass;
        d=google.com; s=arc-20160816;
        b=pOfx/ScQew/zhaErWy6z2fmcKPbnV+jf9tzRsK5FrbHuv7E+KOmYwlaKEnS1DPATbu
         lye92JFo1K3XLoUNofT76BnZ2oAn70GvO8YYhaHb5zBHvm3R4neoQBRErLxlafAfOXQA
         kHoY9amV+c+7jhOTLEh78MXQinqyHBZLuYIa5Zq+nJHSkqvzrvJSGilP3mY0zfsavJ2t
         3Z4bEyo26uQ70AkvxhrW8gFKRCoskSpegAzr4KPprs6QLKWKqITfGbk8VW/VhcubSwwx
         fOHPxq2FdBwYR1gg6PDSNaDOXzAVjuOVKg2PlifLswkwDa4lG5Tb2Ea8Bd362JCapopI
         Sjag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=CUGRkvXDm0LZ4lfkGIXrGo/o9NaEJknn8eZFGkUWeRQ=;
        fh=R1eEDosC1iqku8mu4M2yNrdLLumpWlfEUcZz63EFc9I=;
        b=A/uizeikgknwdOrAvR7mT32iMNmPEygoSPrjwcIMn8CcmmENYNXYxBhxwz1H6Gs+bU
         5+fkoYFt1vuQpKLdQAEuO2VrHYslUcjW3yTtDLDCyGK3kG37IFw1u5P7tsKXpu0nrCX7
         Kcvqm0AlTY+1/3KgMxT8bjBc/NrnagkoI740RNtXx7z+qgq5R2pd9dyrcR5D9qskcIOc
         CahxZ3ThfsSpIX+RTQtd9a+5WE8Mj/NUMMBQtJwXuVIlRPQGgn5d1j1f5a5hLMtfvB4z
         p/QVm0ISbwBSZMlYnoMo4a6txaOCShchK/bqPs2IuE1tNFBhzzAENSGQB0EM74k93IYs
         jXHQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BQJq1HE1;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-289186-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-289186-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-289186-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a8383948e08si169370466b.505.2024.08.16.00.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-289186-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BQJq1HE1;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-289186-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-289186-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E78D1F2727D
	for <alex.bennee@linaro.org>; Fri, 16 Aug 2024 07:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0CF138490;
	Fri, 16 Aug 2024 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQJq1HE1"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8DC1369BC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723793873; cv=none; b=FuqGDQbCWXzT5bOPL16wXh+leNe1m1cbUyubpXifA18zqwmzvNNG+bBv/SqbiZ6MN/JxjdYSmqSs0qPRGpfOB/C16yMiKC+weF6QxF10N1a6I8STpuiwS1s+X5b+eIxxmSLQRSQkEy/QFIaJt8jEDw5BVR3WKJHAMXIHMezy1yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723793873; c=relaxed/simple;
	bh=nFa18EP1VntHvi50soKrL++v7UfmRI3rSREy+WDR8ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJNWGmWAsXvlVMbjO3PCW7KyDqAe/llYVCTQV9sAhMkYKhsWKCjSGGT6dG2XDvdK7iaSpt6Swh+UgiUGLkAAmfM1C5tFXztuEwP4RyBPaLIHFKL0XIZ0C6ymffX4X8Uei+XPhsgmmlIxWmzWodPlGCGs9KHDIHURpUHMYbcW6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQJq1HE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717A9C4AF15;
	Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723793873;
	bh=nFa18EP1VntHvi50soKrL++v7UfmRI3rSREy+WDR8ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQJq1HE1XGM9SJjGfeUOBcsmlY9qq5GHcVd8J1W5Ovq6j5eayzm2mLF5yF0PFUJer
	 P6hGOpC1x57m1IwdRwr1Dkhs8Z40Qhl2RCYM/lKwYnzBrVl/Z8hAEmFq/jERBYW044
	 eGBMwmLRotxuTOu27WXzEKYPbiFLZweoDszIcbhbrnr4+OFI+bPNI5O2xR0seEMpLb
	 O6zPFNxneQ7VS4RNHw0txVk07newFQT/uBXEsrfFqiKmc6feRtimdsvsCJV3XFapCd
	 srWhHMOVM2zjh6+v6cveD/5QsEVYQimUoxxR3CuLbqk6zm9GwBHd6ou8Pqre6+arkA
	 xvrtxOV5FOqdQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1serWx-000000055ev-2oNH;
	Fri, 16 Aug 2024 09:37:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v8 10/13] target/arm: add an experimental mpidr arm cpu property object
Date: Fri, 16 Aug 2024 09:37:42 +0200
Message-ID: <2e1c52c861bdb33b95334bb3598038a73426f5c6.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723793768.git.mchehab+huawei@kernel.org>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 1C6HmPbFAtLB

Accurately injecting an ARM Processor error ACPI/APEI GHES
error record requires the value of the ARM Multiprocessor
Affinity Register (mpidr).

While ARM implements it, this is currently not visible.

Add a field at CPU storing it, and place it at arm_cpu_properties
as experimental, thus allowing it to be queried via QMP using
qom-get function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 target/arm/cpu.c    |  1 +
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 10 ++++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c239181..30fcf0a10f46 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2619,6 +2619,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 
 static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
+    DEFINE_PROP_UINT64("x-mpidr", ARMCPU, mpidr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a3fd595621f..3ad4de793409 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1033,6 +1033,7 @@ struct ArchCPU {
         uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
+    uint64_t mpidr;
     uint32_t revidr;
     uint32_t reset_fpsid;
     uint64_t ctr;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0a582c1cd3b3..d6e7aa069489 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4690,7 +4690,7 @@ static uint64_t mpidr_read_val(CPUARMState *env)
     return mpidr;
 }
 
-static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+static uint64_t mpidr_read(CPUARMState *env)
 {
     unsigned int cur_el = arm_current_el(env);
 
@@ -4700,6 +4700,11 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return mpidr_read_val(env);
 }
 
+static uint64_t mpidr_read_ri(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return mpidr_read(env);
+}
+
 static const ARMCPRegInfo lpae_cp_reginfo[] = {
     /* NOP AMAIR0/1 */
     { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
@@ -9721,7 +9726,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
               .fgt = FGT_MPIDR_EL1,
-              .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
+              .access = PL1_R, .readfn = mpidr_read_ri, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
@@ -9731,6 +9736,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
 #endif
         define_arm_cp_regs(cpu, mpidr_cp_reginfo);
+        cpu->mpidr = mpidr_read(env);
     }
 
     if (arm_feature(env, ARM_FEATURE_AUXCR)) {
-- 
2.46.0

