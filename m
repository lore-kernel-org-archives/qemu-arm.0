Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1784028njb;
        Mon, 29 Jul 2024 06:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUJWzO7l/cQGPcNXZ5Z2oeqIBIJgPTDuu72R29nUb19qLrD8+8pdBNzpDuy/D1H4vQUec6mGoBHXRsV7CjvruAbkH6VqOaY
X-Google-Smtp-Source: AGHT+IE35SplkzGXGikcllBuTBJ1wPSn8mSJaDSpAH1lCQFkaKAOJJqmXCh2eKhaMegdkPRAvZlD
X-Received: by 2002:a17:907:2d2a:b0:a72:883f:f3dd with SMTP id a640c23a62f3a-a7d40188dfemr499986966b.56.1722259287240;
        Mon, 29 Jul 2024 06:21:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722259287; cv=pass;
        d=google.com; s=arc-20160816;
        b=G4wOjfVV7fhrdgBdua6/ThJCa/5yEilSOu9POVxoFdv5xDRCC9wwFYVf3jTlo0w4eo
         6jV62CqcNGnHv1fNyrvjMWRWrNDmaZF2yzyLauo+UkwKcYUCogJGMbZOOPb80afwcAgo
         PZ3kFNQtGuj8NFfLuHV+KfDoyTlAI7rXi/ZR8k4hNY+8E5sy+NzoKrjxqi7M5XPDB1lF
         4PsthD3T4UZlnWVHg2epXJTTcLDcUaxx6xJKgcKNsq0wZ6LWHGpdwAmGbevjYC4fmlIk
         aDwUrFroUfrse6ARGipkgAUIa+959eRr8NEDUXygYC+iWqicKxcJIM5gzOfIqPZ9pjWv
         rlhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9diJlXOopYwHZZRFFXAlgBrB9lTcSmvWEnBKBZOzOUs=;
        fh=R1eEDosC1iqku8mu4M2yNrdLLumpWlfEUcZz63EFc9I=;
        b=cM72oqDbVqJXLBr8F8k80bkJLb8v6glj8VRWouzSrM39qREQfKAf/TY6PpZcjWHawZ
         LDetu+alT1eKSGFL/qnMho64XGD2AtFqJYp0PaCnG5uXJU8xwtbTCHFtDzKIGu/nXdGW
         cMsqXKmI81hZtgxcOggu0K1cINRET02L/0yWZ2vE+jTv+XKkTyJG6TtNVRbTnIsL7wu1
         1r8Yhh4CXxLRY8FQ5kuGNfKYobMyUk8TBURmxRNKxqg45ZY3itd6rcEzezNP91RSa+xS
         fdS4LCocuZDd8OAM3u1ezRqA9YmdZvjSIOgpQqVqGldWTpnr+7z/zGgZ4KHX0aH1ZiSp
         3nww==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="i/N9Sc4z";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265833-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265833-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265833-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7acac7c978si637109066b.753.2024.07.29.06.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265833-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="i/N9Sc4z";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265833-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265833-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE65D1F22087
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D635149DFA;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/N9Sc4z"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C507148853
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259281; cv=none; b=YPAh5VTsqnWClmESXgI9wo3jRuOlmVFeUnXEtYT/LyHi+KT2n3auhwEXH1P2yXfNME+OOWkkgubzmmM5gaurjPj2MU5KBH28j2dp1hZrg3BLsebTU+tNvEE7koBjnzwxIDdjqoIiUlySYVfu6fmNuBergDdEzbmf8GWqG3RT4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259281; c=relaxed/simple;
	bh=CEfB5KrYRL3cgljABI9Vh0KZmODdlgqjxE5jRa0lRAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdFXbSbvCOBXSid5dC74frgyRFHqRy3yN5sku/+zQDJf0WxU6WSklPyxBuW4gGDcth8XUmQ+VE7T2O8Ntoq8VzoltH/JsLiY2RhjZnDuIBKWAhacNtrCyek/c6eeoyspRVidofKg9PvZkax/R3JldHVO5lXgJUhMjXxCHeQnuIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/N9Sc4z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF26C4AF09;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722259281;
	bh=CEfB5KrYRL3cgljABI9Vh0KZmODdlgqjxE5jRa0lRAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/N9Sc4zEclRKNOtAmZGCQ0OLwB7pUzU3Fr5vY1Xd5cjgOtHWfOQWbU87h/D4hHWZ
	 ap3GspjoPKv4X8miHWNYDy5z9ed3oBEhorqhhJsb0V5qyQdFtT2GhqMimCBUYvrOck
	 GlYcULfPujDGz3/icwoaG5ysj0s/tp85vaPtSyAkhA/rHVNKnVzNENdAMursYg9mDu
	 r9p0DeXB9diW8+AB6PDBGtxcsrpqGPnmCevcnH3AWzkhuwmkxthzchOn04eVmkFOWU
	 H4a6aeb5B4Q1N+cUFpz7gjCodlsmLvmw/aOxOXWmahCvIdBFnW9iafKOWpf9FpX9CM
	 n2flbt4tD48Cw==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sYQJT-000000030VZ-0VUZ;
	Mon, 29 Jul 2024 15:21:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] target/arm: preserve mpidr value
Date: Mon, 29 Jul 2024 15:21:07 +0200
Message-ID: <459cf7dd22b3de57a2079e0a43dc20d87b3f05a1.1722259246.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722259246.git.mchehab+huawei@kernel.org>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: WGWN12VxCT78

There is a logic at helper to properly fill the mpidr information.
This is needed for ARM Processor error injection, so store the
value inside a cpu opaque value, to allow it to be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a12859fc5335..d2e86f0877cc 100644
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
index ce319572354a..2432b5b09607 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4692,7 +4692,7 @@ static uint64_t mpidr_read_val(CPUARMState *env)
     return mpidr;
 }
 
-static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+static uint64_t mpidr_read(CPUARMState *env)
 {
     unsigned int cur_el = arm_current_el(env);
 
@@ -4702,6 +4702,11 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
@@ -9723,7 +9728,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
               .fgt = FGT_MPIDR_EL1,
-              .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
+              .access = PL1_R, .readfn = mpidr_read_ri, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
@@ -9733,6 +9738,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
 #endif
         define_arm_cp_regs(cpu, mpidr_cp_reginfo);
+        cpu->mpidr = mpidr_read(env);
     }
 
     if (arm_feature(env, ARM_FEATURE_AUXCR)) {
-- 
2.45.2

