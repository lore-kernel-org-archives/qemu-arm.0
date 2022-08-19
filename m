Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp904791ejf;
        Fri, 19 Aug 2022 04:19:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6okjhhhQo9U0/0Tz9vWy5/4yavsHnXhIEUYjgYqZeaWhw2CQcE+UikKDdeeDtSiozHLopN
X-Received: by 2002:ad4:5c88:0:b0:476:7fc7:a24 with SMTP id o8-20020ad45c88000000b004767fc70a24mr6190555qvh.28.1660907945415;
        Fri, 19 Aug 2022 04:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660907945; cv=none;
        d=google.com; s=arc-20160816;
        b=j6kAkeHzmebRvQcpkwLZ/2koXk9eAY25Tas6H/npBLPntA+4yuDcYQr9EXj3OQTxv3
         UuSYzHpdwLLUGEsylJS9BFVqJIyEOITKmipz/P4TDkird1iG3IjajCTh5UrLKfRIFqkD
         8EEa0RzcglOjQ/IfytKLM+csx79erR0ToHE6we8wmRxH38snZh7DPvqVl1MAg1jFVk2G
         kHttO0cak2sQhbiBsZR1Bjth0uyvjAjlaBO1/eQ/bIPWswetbKVTrjHER9XUyGVBOv4K
         j8/GeJO/c5Jfy8hFkIJ+8YmDQQSvhzakNkm26ncZjiHUAsb9J8RjMVFgthIrj6vR/MS1
         k3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rlB3te70E8fDcNZgIxgUZkmq5hKy8dXzvxbhDulIQgc=;
        b=NldAcw2ch9CehbMI7V8Kcawn06XN6r7WYDke9vUqHM6Fk5lmN6Z/SuZUYKkIMF0fwq
         dqn/AexUcDLCB+o9n6vsaW7JQW+WWPk/v7Vdui5uquYFcuENTofG9K1lpYkrbecgDAFM
         CNpTS1bJlqGdZQDSSv7cGluInZtBAODrqpI1iUktsKZO5AsPZMqMPNn+sXpSx0PfyrGQ
         s0ssy16IexWudfPq7lxOULzyf9hRB9RU+Q23UhKL2sCpGFq4q4OYwc1IalRDtZbkddx7
         0Vw+BIfGbHiSkQA9qT+7rR0jkD5+D8JEUrNf9+q6PoJg2NKy+h523E5+JrpmdcSvZZLR
         gltw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQwwI7Zs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020ac86042000000b0034456ccc16fsi1598751qtm.262.2022.08.19.04.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 04:19:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQwwI7Zs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oP01o-0005dP-Jr
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 07:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkO-0002DF-IL
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkH-0001QX-VS
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so2313572wmc.1
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=rlB3te70E8fDcNZgIxgUZkmq5hKy8dXzvxbhDulIQgc=;
 b=jQwwI7ZsZYyohUGFe1oyhFvha5d7NUCU+ZFyNS549L2JAmwiV7YsSs4LfHPNdE5hpt
 Gy/QsVKdxnwpdPvpxdxJlzfF667tP6HKwPaNwq4xCuggnWA3mfv1A1bRTOXDHY/m0vAJ
 sM2GzR0aEeROPjIOG3ipdTDeO7WxJyFrNLsXIQsU6kO9dFcKUiXsr7ic7rZszHh7z3d/
 drM+NbY1r6EX/Xs/0iHgAx0aEtC20fUyG3PijnCMi8xMp8ZoM6TD0EOCDKG/6+lR05Od
 Li1k53zTJ6CR4BbQqaUlRpuLCKRKFG6sZhEYz2uWK7eH135LzGI33FjrUefeFRrjiTir
 6TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=rlB3te70E8fDcNZgIxgUZkmq5hKy8dXzvxbhDulIQgc=;
 b=wE3PxSe7w3O7SZBXp68EWoxmZutYGI01YOUjuID3SW6k7XyvBmBaBzMOIStruyY9RW
 OTj63EVM1WL4Qvkoro65NswllIs3Lu/cPhdBGv7J8tiXDAcHYjbwYR3nEHt+386/mxof
 jRuGc7fIMsTEXubgF8XQgwLM+JQuHiXbPwH19tvkwiz4frWpHwD7AKR+akLT0kUhP48r
 jnTo171UM4WM/Qa5vniBy+5ngYp9pa/jfioNe+mBY4uy2r/N+t06qR+MCmfPwTPZTs5l
 MXYngvKSljvO8lsRLJQ+g/YiOiKYs2jrKrC/+fOzDk830TvWLx0ChPD0d9PoZY4KjCFM
 EatQ==
X-Gm-Message-State: ACgBeo2bypoAN7jTbgYHh0Lhy/ymb+tNfcCxLXeIuxEvtKRjfsRtlOAS
 PDQ4GN9gBcut9Ai7WkRIXpEJwkatryfxUw==
X-Received: by 2002:a1c:f317:0:b0:3a5:e38f:46b with SMTP id
 q23-20020a1cf317000000b003a5e38f046bmr4357252wmq.98.1660906856620; 
 Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/arm: Implement ID_MMFR5
Date: Fri, 19 Aug 2022 12:00:49 +0100
Message-Id: <20220819110052.2942289-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ao/pStO7t3wc

In Armv8.6 a new AArch32 ID register ID_MMFR5 is defined.
Implement this; we want to be able to use it to report to
the guest that we implement FEAT_ETS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837e..fcc5927587e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -975,6 +975,7 @@ struct ArchCPU {
         uint32_t id_mmfr2;
         uint32_t id_mmfr3;
         uint32_t id_mmfr4;
+        uint32_t id_mmfr5;
         uint32_t id_pfr0;
         uint32_t id_pfr1;
         uint32_t id_pfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c171770b035..07378519259 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7586,11 +7586,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "RES_0_C0_C3_6", .state = ARM_CP_STATE_BOTH,
+            { .name = "ID_MMFR5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_mmfr5 },
             { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 84c4c85f405..2d737c443eb 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -643,6 +643,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
+                              ARM64_SYS_REG(3, 0, 0, 3, 6));
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
-- 
2.25.1

