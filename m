Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1014857njb;
        Fri, 6 Dec 2024 09:24:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTfbMfGPP3InKu29dd4tftbZc8ccivJngJZKJXCTdm6iZtW6ei6xHZAoWkgan48B1hrgYVWAltJZk55w==@linaro.org
X-Google-Smtp-Source: AGHT+IGXOR7ZII61kvoLziTkm49louKEobdpHTfb+EEEDTZsUIs0ojxMrjqcEjup8u15CEfFXTnk
X-Received: by 2002:a05:622a:4b:b0:458:2182:b07a with SMTP id d75a77b69052e-46734cf452emr46813411cf.18.1733505842753;
        Fri, 06 Dec 2024 09:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505842; cv=none;
        d=google.com; s=arc-20240605;
        b=GQiQuy54iNC/2A6fZ9JJ2kZVjY2e1rvTo/uxNwVStVstXWaGksBq1K/Aq01nljoYso
         9I+PId2jZfwiCLDrCC7DnObbq7/ey0TmOdIG0m2t0SB6MgIE8m+NQzd1/zlgald4e0Dp
         TBX957nN0EYIUsKj3LkMl+t27ta1blf3DcW6XPIP7xVj2peLSF6mCF0J5kNJ17Z03djZ
         svNu7/sUDs5XjAqBcDkTxjeSi2cClUIqrNFV/nuiMDOLcRfyhdg/gNmLLIeI6bk9dDhu
         V9XBQ3yB3qGhxWhit9KCfviQ06mQHCdvU2qOu2xJWwtVRj4ve10aOiaFokfn8d6d0uFY
         EOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JvGddUxsPsnyaeSRXnu0mchmbntTRDh2IlBKhNJmmWE=;
        fh=lz1o1um/QO0hwBlu/v6PrVRqWjcmj+ZnymcGBywSnsM=;
        b=Iqnjx73xZakG7s5ON0ODNRJqMNA1i69ClNkpaNMs6mGlocLLH1BF16jYL5E/0Ydf/0
         uhCyASRvWHLAAJVUyMINOFmRXu1VGj9DAWJyYQY4SDoxUvMzyml+kmD/CbOpV4Y8tJIS
         t6t7ztBfrxDio9HyQKLSjjsL+FHGcRGP6EvaX5i2lu1GA2lWMHyFl4t6Wotz1309BAkN
         3EYDWrVd2E/KfMDhxr0RAW8Zt5UTtuYsDsmQC17XSe5gsP9B5UfuvNxR7K72cJYMt9P7
         yeKtPcc2vNXNj83mwr+1we9WygE1hnedNM/UmKb+t1YOBrEOoraK56JBmbrrearSYuK1
         0m8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jmMNnMdl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b4fc1si48718381cf.60.2024.12.06.09.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:24:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jmMNnMdl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJc1z-0004p9-CB; Fri, 06 Dec 2024 12:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1Q-0004Bv-Rd; Fri, 06 Dec 2024 12:21:44 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1N-0000z4-1N; Fri, 06 Dec 2024 12:21:44 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA0E4A443D9;
 Fri,  6 Dec 2024 17:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5C4C19422;
 Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505688;
 bh=eNJ0L18CqakPOsgyzdzaKDzBHHjkiPmCHmVgcT+mZFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jmMNnMdlvruwYpyvgGKjmcJpccfhK2n1ouuVaFQqxzazOJAhsVo3uZkUFCOMx2AiW
 Qw9Q8rlDhbdqlp3ThXZmDrc6r57SAVbdpXWo7P/js6gy1KL6/i2bnH+l7ddiH0/eV0
 XHKZspY+10ujwXrNEuXnJNwlwjOWptUfeUWpnRrz28fcaJcT282xcitsVx/8T+fEl1
 m8Hb6V6j7aagwoFF9LuKn6Xx3LtnBlb/VDmCKetydB9T5oMv+VN75DQDL8W/sJ/D/p
 VMJlN5B6xpDfEH7dRWLjXwQGHt9tFlyi9m8flAXuyYHtPrMyKQM2AjhOsHZBCWc+AB
 /b32giTFAswgQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc18-00000005RL4-0ZHL; Fri, 06 Dec 2024 18:21:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 24/31] target/arm: add an experimental mpidr arm cpu property
 object
Date: Fri,  6 Dec 2024 18:12:46 +0100
Message-ID: <5ad2755ea045bdc6700ff063b717136da0941f39.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-TUID: S3oa43AN3ojK

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
index 6938161b9541..aec9ea5000a0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2636,6 +2636,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 
 static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
+    DEFINE_PROP_UINT64("x-mpidr", ARMCPU, mpidr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e641280d4..1ccd2d6b0c3c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1035,6 +1035,7 @@ struct ArchCPU {
         uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
+    uint64_t mpidr;
     uint32_t revidr;
     uint32_t reset_fpsid;
     uint64_t ctr;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f38eb054c06b..5b0ea8ba5fb8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4700,7 +4700,7 @@ static uint64_t mpidr_read_val(CPUARMState *env)
     return mpidr;
 }
 
-static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+static uint64_t mpidr_read(CPUARMState *env)
 {
     unsigned int cur_el = arm_current_el(env);
 
@@ -4710,6 +4710,11 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
@@ -9741,7 +9746,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
               .fgt = FGT_MPIDR_EL1,
-              .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
+              .access = PL1_R, .readfn = mpidr_read_ri, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
@@ -9751,6 +9756,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
 #endif
         define_arm_cp_regs(cpu, mpidr_cp_reginfo);
+        cpu->mpidr = mpidr_read(env);
     }
 
     if (arm_feature(env, ARM_FEATURE_AUXCR)) {
-- 
2.47.1

