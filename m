Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp485446njc;
        Thu, 8 Aug 2024 05:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvx4Ys+wdGgXzJ1vhNfy9Fz8Iyg9Z7+5esKZNyrjEMI/V+ds2RX6r37PVfYOxnm01elQp3YnsvbJOPBX647vuC/onOEaGz
X-Google-Smtp-Source: AGHT+IHF/RmQH0hcGCf9PPtEZYn07SaICd1TWJc5c8eGSMHK6Du1noIK8MBFj1wIwnmH/ncSEg9e
X-Received: by 2002:a05:6808:150f:b0:3d6:317b:a95c with SMTP id 5614622812f47-3dc3b4596f9mr1939351b6e.38.1723120030594;
        Thu, 08 Aug 2024 05:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723120030; cv=none;
        d=google.com; s=arc-20160816;
        b=GMnlGQwb0uanjyD5pRfyuVTDM0+37XpJzEv1M1fEuhigLvYZvs0eZwZLvyuG6h968n
         r1vnmmFBqqhcu9xXhrmZtT7jriwj/2dy+Vz6RXvBHvInjp4mYCHS+YQ1zsjap3KoztW9
         UyD6YSx2QuQ6/XaT+ePLQM2EUatSOypsYQJGwnwpr6D+lfOvynLAXwYTP7mFUKLtwsEG
         dK2aXw8W+545PtmOLXWrSQcYk2SqdvzgPV7SawnKZw651lK9UHx6VI2fE+qqmDjdAtvd
         Ri2VkTKeDEIR3QRXwmx3O73NwnXwZ5+Eg/LeO3afGS4GznRmDoDwrJJG+4jdZ9yMOhW+
         Qtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TdbNlItxIP4YjhnRontp4+g3GWYBRj20ccHpLLIHNqQ=;
        fh=R1eEDosC1iqku8mu4M2yNrdLLumpWlfEUcZz63EFc9I=;
        b=ZtX7J/GI0pdZk9Or9lFkSSLzWXXpWgGMj/r6c4ZOWjIEsLCknYR5sNhECkgOixsbLs
         AzbwEQKvgr1/wb23hnYk4QzFKWNO8DSggt4P0Nxj4cpJ4sNcZwVvSE8jChZJtqe86iOk
         erKXZ+mq8rc9dUxKu3bb2qDgUyJqddAAhUfp5fYViR0NAodB2D1ewkdnEothTT0M6IWJ
         ojEhCl/ZfXYE6leld2T+C9VIFh2d39tZYy3kF6gLJmIs5S73ka1NYCBNkVeLd3IC0DIp
         3iOVq/A213sl3XdVD+j5DeL/DXUUkCuiljrky+5ho4kupNxDwgHb+e4yDzVS5umz59qD
         aOJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=B9YT2YkU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87d8f81si39389031cf.247.2024.08.08.05.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 05:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=B9YT2YkU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc2EJ-0000ci-Ik; Thu, 08 Aug 2024 08:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2EG-0000NH-Sg; Thu, 08 Aug 2024 08:26:52 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2EC-0005xv-5g; Thu, 08 Aug 2024 08:26:51 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AD510CE13D9;
 Thu,  8 Aug 2024 12:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB505C4AF0F;
 Thu,  8 Aug 2024 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723120002;
 bh=G3S5Uq8J+Zs2KHvbamvYQa8xBiv68WPUdS5cQZJ/394=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B9YT2YkUBu7IUCNpBw5ds7lHhHwlhbQHWqqXup9dbAFPg8bR/OOx7aK+iLB+rli/y
 GRa3LIpmMt4kF+zf8Ta0O3xT/2i4rVryRFy8eXFNj5qGkdMSJbTKzuZP4Mx4R/0DsG
 yoTLoi00aOFXjxbGOVrx2Audtz8Dg6pQALa00GesKeRDWBKakO4nryvIfaGQMcqvcw
 xv9lWbIw4+q8Gl3iMRWkMmp0HeF9/dVp56WR8phKDXFF/mfnfBqItudPjUL2BYBx8l
 qqm2CuvqaOOpf/Xb0MnpAJ2o8zpTD8FurXg0k8CRJIeBHjSiTr+wqvoMM59OzD/1kw
 1XUvQDf450kpg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2E5-00000000oDi-0Bvl; Thu, 08 Aug 2024 14:26:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 09/10] target/arm: add an experimental mpidr arm cpu
 property object
Date: Thu,  8 Aug 2024 14:26:35 +0200
Message-ID: <a60316927a84748517209a741bf904a802827b8e.1723119423.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723119423.git.mchehab+huawei@kernel.org>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=mchehab+huawei@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dlfotpbddfTO

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
2.45.2

