Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp300556njf;
        Tue, 13 Aug 2024 16:24:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU+Hj0ef/8C+BoD/bAGmg/8M9pBlTy7hRVjlNBCwP8epKiQctXkKR8J4dbfZ9ffYWsmFCWRV2Kbgz3lGGt+PcJZPPG2Kvnn
X-Google-Smtp-Source: AGHT+IHEL+WXbMBhuWAAha/W4mHSlat06s/eT6v5xK5O4T90hSMUj77v8W7kX2J0W2eMTVlFO3Z+
X-Received: by 2002:a05:6871:1c6:b0:25e:1ca6:6d09 with SMTP id 586e51a60fabf-26fe59f8989mr1253192fac.8.1723591462397;
        Tue, 13 Aug 2024 16:24:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723591462; cv=pass;
        d=google.com; s=arc-20160816;
        b=wlW5h9rfWLPpw1xOFntDrkjNn79K2ygf/bX/bWmweyviBH/EzQo7qxJGZBg52fZ8Qf
         TEu7E6tkAN53y7+wW013TPQyrsqF7I4HGRyF1J5sBgMtEu80GUWc1fUm+nnRo2ddmwv1
         Z4vAvYnj7kxIJ8HlkDilVUUl423CWPkS9bHGpxJx8SzpDbYtMQUcx0wCVyZAJrt3+ad9
         3Nr3stXLblNSki/16xdyhcyKfS7FTq+7oZZrh3DwgWwNWeP2jdFvrUBAHbkMmUhBpdvQ
         y9M3XGJw80I700BjukKZl9pyx3GOsREsNKWWHfxROaZDQPQt9bS4JLN3jDEfhGEmNIuD
         d3AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/1pJeHcpfkJh7JXQUBjsJphpn83tVEznytr59sOYKMo=;
        fh=R1eEDosC1iqku8mu4M2yNrdLLumpWlfEUcZz63EFc9I=;
        b=hure/f5ikFEmw73NxZFMAoFTI8GCF4Fq/F9mKhJkpMuzh3kYjOOaCFHLpluWJg3Y2X
         wpQDiWUI25JupXbI2R4KfQIgQ42oOsMpJiXk7Utyz4pESQ/8nC+Qj4EYC1hh1pN8muM0
         JZdnRWn/o4rgVxm31UPcVTCvRc28N6klloiuE5MrOYnumTLLPxtoyInKMgQ1aVDQtq2Q
         RFreNg7vwOTC3t+aprVqHwD6k4O3svKRy75amMt15xqnOqKOaQwfJ5y1NrdbpizrfkH0
         1KhSKIQJb3IZRuZP4WZkS7GHsCeEksFuf6KZR5xL6jtiBcaVWY6yuiYwOxmLdR6cNAYf
         wijw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sagI4dlx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285617-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285617-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-285617-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7c697a266fasi2674181a12.57.2024.08.13.16.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-285617-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sagI4dlx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285617-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285617-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1BEC2849DF
	for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 23:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC04B1AC431;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sagI4dlx"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2B1AB53B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591451; cv=none; b=mbyprDWPdm5QPYeHZ8HZiyszUbiwqGchGEeex+Mmf/o0FG9rzkTRybQt69P49az1X2fJPI2gsflV1SaWWyZJT8U1GJP19JgWhXcly30PRzz+UDIU7/e9ySEf82lBf+aPwL+l3bofhrAw8+uL6FYanlk6UPXVgfUCgekd8csL7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591451; c=relaxed/simple;
	bh=IYrtvsBCzlGe0MTkFkAK6noEUXQNZZJDowRzzCJAOeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivp1WmZes6Ouf5xHu0sOLEcA1Qx4qZf9HvbrT/tRqqbxwof/n6E7ERPakZky2tb+FVWBv1CqVp0mEF27+a1UCscQol9pKiAyOsHaYOtYseNdIp6zEiubmnVpq1Se21NEjBTwKbD9Ob3r03HW4ih+0ie8C0GSY5iVGv0nAGRZDus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sagI4dlx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59041C4AF0E;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723591451;
	bh=IYrtvsBCzlGe0MTkFkAK6noEUXQNZZJDowRzzCJAOeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sagI4dlxetlku/RcQZDKH4+9wkeMTAjfuW0Z7K8tEg0ibY5f8yEyFHbPAbERsS4o3
	 fig0bcYP7/Kh6ECXL6aGGNDgUJmGo3+mbcBYXE3D39ulCXQuO4nxiCBNTM0136Vnxz
	 CccOxVDAmWnQ0ir4y3KeGXJ6NTiBnaI0asqCRPGS3/ru5pksn1ocotIuDkRyQ69t8q
	 rQjRl7/NOuCq751AF4LTx5KLb04s6nzD6iN9aKDakKMhgNiuhX8bofCioZl/Tel+jU
	 MVE6yoE6LRlWMnWm9YO0nr2dkiEFrA2b1eZSxf5IPpHT4OHgmUtPzlRmTPb6+HQSZm
	 Q0ZTRV/2GUNFQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1se0s5-00000002asg-26g7;
	Wed, 14 Aug 2024 01:24:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v7 09/10] target/arm: add an experimental mpidr arm cpu property object
Date: Wed, 14 Aug 2024 01:23:31 +0200
Message-ID: <aace4ed6fe4ea5eceeacd9d4dedc6510294301f0.1723591201.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: z8Yif1XbTMLx

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
index 8fb4b474e83f..16e75b7c5ed9 100644
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
2.46.0

