Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp434566ejb;
        Thu, 7 Sep 2023 09:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwldjLXGPawLuRth4NihxeL/zfoENGL0KjBc/URNESIGzn5zYbSJ701fofi3HZyd387IM8
X-Received: by 2002:a1f:d9c1:0:b0:48c:f9e9:51a8 with SMTP id q184-20020a1fd9c1000000b0048cf9e951a8mr124440vkg.9.1694102639443;
        Thu, 07 Sep 2023 09:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694102639; cv=none;
        d=google.com; s=arc-20160816;
        b=virE14YfboZ5uuG6kXQjFSkjhSy+IRf/Ksebu9+SrdkZh5XFiMrBIZfvTKjyygcUVx
         lu8s7OhfWpp/GuQ9yEjkjw3HwbCnz2UZeF7F3YiHErZEDq95GdLObtSGwvL0E9M6dqdQ
         k7IRwC56s5GxbCWRf9nFFReULB+McpWbCLU+SMocxPWLksLEPi6xrYQK8GKg10BkK/rf
         rAMChCMGKQ+QEc6p84kZuvgS0LYp7l6+CZ1L8XsKaw4gErY2BLs9kjyxoaeYJ3H41e8/
         88xxj91EoPK8FoNMvLbPgf/9s7feOMyBmXmq8y4egiZL7MfDDBTdWW1zAkI5QHEGzH+R
         jSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XiMac+EyjFmDHh8KtlpnhJCEzMAlxr5N/iXDwj0li1s=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=QKcLq04f+ezYOW3GIox5fLbWtgT3SUlZlfK9ZjYs58eA+8kZ1aGyYxj5EgyaqtliV5
         r2wjRuYhaaUMuGjOOxUvanHYRTSuyPB0rQmQM4PKlnd4Nr/3ZFbZWdAHsD4upvzpJJjB
         UdsXENtXmRpeARnGf49rRNO1y1y69VRgtNIjB2uOzfP9wIyZT7MztcOcMxbMnb4I66W5
         pdQCd2i7DcRz5f2HkBq//Gn8LPTMwN6mwynPTV5M5wQgboMYgi3TCBr6/Dmo3sazMFYw
         AZvrcbF9DlK901zIREHZ1D/Eyh6C45thZ7HfDdRyIayUrfiodh/8BYkIr34HGyeKNTiT
         cVng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqWvO+op;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p62-20020a1f2941000000b004937f46a7a8si132238vkp.305.2023.09.07.09.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 09:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqWvO+op;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeHTz-0000pu-Hd; Thu, 07 Sep 2023 12:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTx-0000om-TA
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTt-0001ze-K9
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31c6cd238e0so1575637f8f.0
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694102624; x=1694707424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XiMac+EyjFmDHh8KtlpnhJCEzMAlxr5N/iXDwj0li1s=;
 b=TqWvO+oplSAHBWYAFHQC2YjCG7Q6vTNnd5rG8/bhnZEXiT36ATUbLy/eE0SEzLxivT
 C4Rd0jFwl+vRcKL0dKJI+fADK8W6Ar+evFRSoJcjAWbu2oKDi+dKTfAxYyuak/iXkSOe
 KnS0l2Y7a8OjpJchWhSEvXF9gqC8lXdaSVEz+jVmFEL0jjGGJCsmSUiiVS9wBB6J8+1W
 T73L58tvO4/WVzkSPKgGFZ74As0xu5xXU/3iWo7suyY9HZ0CJj45T6djQ21JS7eEGf2U
 7CZ6M9OLCIn2WvsiMylKO6zhbAZk/+/WNct17a7KQLefh4jcEmGQHWAOBYOKhsI49Pq5
 ArQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694102624; x=1694707424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XiMac+EyjFmDHh8KtlpnhJCEzMAlxr5N/iXDwj0li1s=;
 b=AwH6opyE4VLwEdyuPs3+xSHBTYoaB8A1OLCVZHQN96LkzGCp2D49YEwHdXcZb44aqX
 tHK+0StBCFvEaWnVdDmZMS7u7N/vzctuLr1uct7D5TizwC4ZdlH8zcmCEaG0WSV5t6jl
 DO35jpmD0iYOHff7hG7kR8EB6c6QZhPa2/ZuhPp7OZCPb/hRXIiyUEQ/VTKfA2PtQwJu
 /goU5weGg96bxTVzdkRfa9Epu2M0Cu8Tv3+b0hkRWWtRdP83tHAx2zznw0JJecX+mBA2
 28XocZeH0yH5Jkhao1hravejcYCzbkbdLHsIG6bbgAoQqHHzGEGUEQpMw++cU/N798dn
 rCYw==
X-Gm-Message-State: AOJu0YxlG8jMR1O0uD3NlRX8VNtLYTyfBWkZA1muSiSiJ7UL7Tv3ZSly
 dEcbmGkPvzFitYgRywd37KTZTM1prHrx7X5TA5s=
X-Received: by 2002:adf:f8cf:0:b0:317:6734:c2ae with SMTP id
 f15-20020adff8cf000000b003176734c2aemr2372884wrq.11.1694102624048; 
 Thu, 07 Sep 2023 09:03:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm20256241wra.116.2023.09.07.09.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 09:03:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/14] target/arm: Add ID_AA64ISAR2_EL1
Date: Thu,  7 Sep 2023 17:03:29 +0100
Message-Id: <20230907160340.260094-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907160340.260094-1-peter.maydell@linaro.org>
References: <20230907160340.260094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: EEeymkL8nh5Q

From: Aaron Lindsay <aaron@os.amperecomputing.com>

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
[PMM: drop the HVF part of the patch and just comment that
 we need to do something when the register appears in that API]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     | 1 +
 target/arm/helper.c  | 4 ++--
 target/arm/hvf/hvf.c | 1 +
 target/arm/kvm64.c   | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 278cc135c23..9b76cc68c6d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1033,6 +1033,7 @@ struct ArchCPU {
         uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
+        uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3f5a7d2bdc..f9f7c3c39e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8435,11 +8435,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64isar1 },
-            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64isar2 },
             { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 486f90be1d2..546c0e817f4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -847,6 +847,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
         { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
         { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
         { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
         { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4d904a1d11b..ac440c33f9a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -304,6 +304,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 6, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
                               ARM64_SYS_REG(3, 0, 0, 6, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
+                              ARM64_SYS_REG(3, 0, 0, 6, 2));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 7, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
-- 
2.34.1

