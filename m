Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp57352nji;
        Thu, 11 Jul 2024 02:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVHibitDLNTxltHCQjgeRAR2YRX/ELgQnGozDLeyfjth1sToQBUc6wnrJ5lYaAyEdBBypuvVfCQtlonT1a4RDAuzDhwynTK
X-Google-Smtp-Source: AGHT+IGxjLRr9vhOUukZCUOqfYrp1gd/m10ARRwN8U9eCkqp5akJNzWqDUkifESUGBigoW/XI38L
X-Received: by 2002:a17:906:2c51:b0:a72:8c5d:84df with SMTP id a640c23a62f3a-a780b6fe9b5mr502462566b.39.1720691549426;
        Thu, 11 Jul 2024 02:52:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720691549; cv=pass;
        d=google.com; s=arc-20160816;
        b=MvzJpAuREkGZyzTdINhimvYoUlqayA9uyMQJfLzjH5Jcm64DTbs1NglFHY+mDUmBR5
         lLTHij4/bBcJSHkU7KjEeh7HsrA+uKhuOVc5tLWwkj/v3aozr9/GZYjoGng5DwngPl+W
         qqtuUerRHJTUlEtQbhbJjzeQwQR5iYhxc9qsYM9N8V2ppkBiENMgmQ4qhgQ9zq4efrtq
         C2xDxNogi59+O3TFXb2gxtZwVeLhPOsll7YreQzMbDwrMMvOqfx5nZB9J0Cot2+UeV6c
         gSigaWQSe4Y7Qzh/XRlJE+sMhftyTgGXngqnQAAXW7Ji0joojxonYGvSqsjEzAp+21pp
         sZyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+Xn9NEUhgy1mVkUTfyUK5CRy+a8tO2EbMBEr3FgTGqs=;
        fh=lrhZkYEXTJqdwy6JVWCshxVYzm7PrVAdDZOtk5h7MV0=;
        b=TvLoVKdSPJ0Lhs3UUnyeEZDdO7pukSKczRFKVgpcJ2s+VP6aJvZDRenWjQrKY2Ifhg
         1yYN2Jbw06d0543iT2fQOYxb7nclopWbglRHs/Uq9GzPUWI0jtMbro1W6bpQBYj67Ybw
         3JtPvoREzL9f/5BhkPPVIjUcNZESbZEgp19wAEs3uuCyiUYHNQFKLXDZILsZD/+yOXud
         Ydew+2U+ELKHV4Ci9AgcYTOlIukg+9RObpoCqVbmp8bJzm6GmeR8OXChEemHzj77mPLR
         NdR7kX/N9hiCnByhFI3bMDKv+OBtG5UcrQLMliN+ksf5gB1d5bC4ESWOV8RiA9BUKrcD
         1zjw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=NpHARU17;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248918-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248918-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-248918-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a780ab0daa3si307224666b.603.2024.07.11.02.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-248918-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=NpHARU17;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248918-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248918-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C12071F22FDB
	for <alex.bennee@linaro.org>; Thu, 11 Jul 2024 09:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489FD157467;
	Thu, 11 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpHARU17"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711415748D
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691541; cv=none; b=sn7OSZI34gGMcsDcdSN4p0ylrtL/HufYjAln5ijWrqAmZmjUuTZ4TEm9S5ryV1HyPZ2O+2OjsIwwmRzWXccUf2MyOFwhDNSrJ4rgHsvzZoTsOr77Q7ZT7M5pm83VPZNMBvC8tO77khIr3GQJqhEIO85cP6XDzUVXLL81OMsAgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691541; c=relaxed/simple;
	bh=725/tP/GCjlN8Z34GtQNtVt/F4poaFotjr12mxvM/JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs163tOCIiy/OhaJGJgsT3oemyUB+NFSvKD6KniM/LozXDj2OlHWlwZjXk+6KgP8Z3SHHHyoWEX8ubBLxDbZK+XGLAvwO1JsjOUiFDSMFOkLKx8IpIPfR2jAnDkTktT3wSufMFkoyK5nAwgi+v89emxNUErkvrbbsh/7kF1+vB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpHARU17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8994AC4AF0C;
	Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720691540;
	bh=725/tP/GCjlN8Z34GtQNtVt/F4poaFotjr12mxvM/JA=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpHARU17cFWhRXZKgw9M/i1B71oq7o/mGTGTkf59JV1wTBCqytUmjt1gEzJeAb8yI
	 gCsB+M3lyZiMDWWcwTzYITAhHNQFPLJA5q+e8PT+vQEB4ze2UmJkbsvNFIhy1ZRnv9
	 mgh/Ydg5LsUCD0I18A/yjSChbPJBrQi7ljDubQZnpjoFtviWYGOKRVXgyeOmOCDNwW
	 TPQ5Fynuu4Cs7JzK7K+Tbi+WNwo2CuQmwq+dq2dyby5T6hVTruvOoX8d3MHg8m63Lx
	 +1hMxo9vUV8Rgd5a1gwVvQAAeik9M5f7wwPofY4bdMMdM3yYIFOMZ0PyH4i9rrZTQS
	 Mzi3/DD/yGMhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sRqTK-00000002jZp-2lwm;
	Thu, 11 Jul 2024 11:52:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-edac@kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/arm: preserve mpidr value
Date: Thu, 11 Jul 2024 11:52:06 +0200
Message-ID: <60ffdecc1c9a1389182142451afc91ca6bd111dd.1720690278.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720690278.git.mchehab+huawei@kernel.org>
References: <cover.1720690278.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: YJnDZ2+U5b4A

There is a logic at helper to properly fill the mpidr information.
This is needed for ARM Processor error injection, so store the
value inside a cpu opaque value, to allow it to be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d8eb986a047c..2858fef963a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1026,6 +1026,7 @@ struct ArchCPU {
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

