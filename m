Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp467442ejx;
        Mon, 21 Aug 2023 21:26:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ3Lg+HL1ZbtMscOGX4sWz5p04/LctqndbB42JG9oFVnJmTGWnoAmV039n9oFq20nvjXFj
X-Received: by 2002:ac8:5b4b:0:b0:400:7bb9:45cb with SMTP id n11-20020ac85b4b000000b004007bb945cbmr12013159qtw.27.1692678390132;
        Mon, 21 Aug 2023 21:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692678390; cv=none;
        d=google.com; s=arc-20160816;
        b=hfDZ6PNvTyDKXLk8v9TTQfk6W7D1GAYR1QJNPvhytEIBsCZT8vQmCdVD90qc8UetTj
         u3jBFgVA3Rve2XS3Sb0sR1F5C/j53PkDHU1PebpvjYhGgclZ8m6FZFCZ39fs2ShxW+tz
         glMByKNFupG/mNFfTNkNcPWuQNGTvM65wCHTKD7PatAwDogbTZHX0orbswh68DxvFv9e
         hQv81NYL8cT+ZODtcwIhpa6wQJHQmK61JbdDYsAUhWaViFRNju+KM5LzAWYtyuaywo0D
         pP7pdEyi5GjFcXeTTgiFgk0bvEaV34/5thizzdItJkdCyNF3fVbDe5OTyqga28zgBrIL
         mQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vhkbaseSYctv0PKDmJHETTELtOUQpyXPx69wgq43tTw=;
        fh=lg8/ckKb61gDlKZ2NmTq/Hk94gXqE66TCPFK/Ovz1LA=;
        b=CsOx5ZAWHszhR6Z91PhVsEnE97nSjjqYBcMui93LBiSCktF6ZH0XN+a5enBQpjyRKc
         NZqh8RBhN5FPcYrFMVSBcKR+Vg2s6WEbxB0ovKFctIPdQ8ZQFT86MzIqxos2pydOv4BS
         m7UsYcdRcktNeESurYSJEVFfFaDe9e1OSVIAq3UDByBDQHW/MEcpTRk6DO8FsM1YhB8m
         ExjyvcyVkUVizns8jLLGm1Lk0AQvniPcKyCueKrbpo7bpH9WE8Bes5eHzmjq0j+izsxu
         MvgjAAM1UqtHAcEYtbrESIwa/GxcISXTAmlT/hMCrHjkv8QSE+ZrjMXdif6ESu1ywLMZ
         Grcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sNkof9U0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020ac85f88000000b003f86195769dsi5727902qta.408.2023.08.21.21.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 21:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sNkof9U0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYIxX-0006GX-PK; Tue, 22 Aug 2023 00:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxW-0006Ej-N5
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxT-0007WF-J0
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:38 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68a40d85593so1226986b3a.2
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 21:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692678334; x=1693283134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhkbaseSYctv0PKDmJHETTELtOUQpyXPx69wgq43tTw=;
 b=sNkof9U0i1la53JWZ0rew/LsdcEath104n5xTgdMWxgQ1gtaw0Xm8Ntg73duZbtTUF
 SMooTCsacl7qZW4vvndr2P3PlyuzZtEb0coYO4KVv8OmgnJtRBXihyfKN7kXWJuyOpS4
 +KLxTJalFK25Gy+/lAS2y6s3lj2/21SCPc9+dpC4sk5cGdkPt4I4Pbs7GBmlbvygXqX/
 nxTUkTwuWF+b5N8CpmugsEABw7Cj55COV0gKlNJLzvMnAZNeETbaJpYSJEnTGskoxgI5
 +rI+EKM1Gckr4rLDzDUdgZHPAkR00sLaNWysyTK9aEToJmcCInEuQaVy5+8e5KtLI++y
 Rn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692678334; x=1693283134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhkbaseSYctv0PKDmJHETTELtOUQpyXPx69wgq43tTw=;
 b=QheEqg4dEgs75jhQVbmETWu401LhldHOxEM9uhYoXwmBWXIz5udkERENc63CgSn5d2
 8skSh6U/HvQQHt9J79gnbnUJ4lGS1sw49g5bhyBYizveut6cQ9L+kK9vdGgc4T3RcaHU
 cjsgXnFqHWZz2IZ0tRfkQf3r3ogzu1nxyH3DEAS9HExoLbPlTDU3ijF5ptQdTxbFRnGP
 Z5cURIwvWAfIl99X7/jDfFNu89hV15kFsatM0+QcFtd1wr78Gp2S+izwkEp9WEXIB94x
 jzqXFzbFyDdPvNxDBRNe/kRGgOmBuiyPerVcR8LUzRC3GLHxlouMEh8/9ZrwCVkTKwqT
 Kxpg==
X-Gm-Message-State: AOJu0YyM6kvfOcnpmZ/dsH3//phyzzDOV8BMvHX1pOo3lMgwAGXrTpRA
 1p7w7Pg7FteiVQp+v8MIizh1HQ==
X-Received: by 2002:a05:6a00:16c5:b0:66e:4df5:6c10 with SMTP id
 l5-20020a056a0016c500b0066e4df56c10mr7028734pfc.34.1692678333930; 
 Mon, 21 Aug 2023 21:25:33 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:2c08:e710:4459:46f1])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b0068a3f861b24sm3364908pfo.195.2023.08.21.21.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 21:25:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 2/9] target/arm: Add ID_AA64ISAR2_EL1
Date: Mon, 21 Aug 2023 21:25:23 -0700
Message-Id: <20230822042530.1026751-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822042530.1026751-1-richard.henderson@linaro.org>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: R/5rozHXxx32

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
index 88e5accda6..fbdbf2df7f 100644
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
index 50f61e42ca..3bae262b2f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8334,11 +8334,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index 8fce64bbf6..c366f7f517 100644
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
index 94bbd9661f..e2d05d7fc0 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -306,6 +306,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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

