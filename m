Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5181736gdb;
        Wed, 14 Sep 2022 05:32:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7MQmFSPsSNHucumb7QU39eUFAHDIAbm+CpfhMyw5eiH18kTeeMLliUSK242GnVfOz3qdIH
X-Received: by 2002:ac8:5a81:0:b0:35b:bbb8:6481 with SMTP id c1-20020ac85a81000000b0035bbbb86481mr8911209qtc.393.1663158742353;
        Wed, 14 Sep 2022 05:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663158742; cv=none;
        d=google.com; s=arc-20160816;
        b=mKnSfEZjPp7ZPwZ4rCuZCRourRmwA7qHPE80+s1DW/iOU1Xvdppx4H8lMfD8Wz4gAk
         fzs22AghWM/OXlhgmR/dpjAj11rlLO7hVN5yNfa2CxAEHfI0v2MaTWv61MZK0MzMcuO3
         uG5xJEbK3p11G249x4QQ5fqwTnSowSrCIxKikZIrBIRdgWi2dUBXZStFVa4XuQGf70EE
         XFoZWoq+gKJBv6rYToschQcZp27J36EErEniVhnus0TzfnI4ME+OIXrV4lIKlLXGjthm
         wqEX8QlEccb7U+WKCOJff6GRelDxBKGDRrb4ycxozRMyl3HD/Q1ivqliPogTI4VXFVTr
         QGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lt+ttdGIQexwt79JDxPbiWwikZH53evL9J0LFT30Rjk=;
        b=Iz7Ne1u+PBcrVjGJ6vwvwvgIN2Uen1T+FxolrRMEnkuNrunlQ796CzzsrnY9W/cqUf
         tQCHnpFH6IHnLDUippWvpd9MUXx/JxjFQ7xxE8fCMt4YoyBJfuMKVvmLeTXf53FurObT
         pmNkn0thCjx5vzFUA9Q8LeqXb9qtf29t+W2TbzL3w5E4kJ5cgGwbSZkhYafKi2N1fwWF
         hmcLvJHezmCI3AC9iKaOJ7VoGi9c0N7cAQC6/O/YwpDwe2QyK6jDRfyEO6qyJqFlqhBz
         d0vcDmVa2r0lK2dt11c14Rd9r9jV59rUj2NBghm9N8Q6YE30oJYjw8VNN74nHiEDeNoG
         cZWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="anRq/B7O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci5-20020a05622a260500b0033c77780c8csi1162633qtb.54.2022.09.14.05.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="anRq/B7O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRYz-0005n1-Mh
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwW-0000Fa-3K
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwL-0008Vh-MW
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so15307889wmb.4
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lt+ttdGIQexwt79JDxPbiWwikZH53evL9J0LFT30Rjk=;
 b=anRq/B7OavS/ZZsMEBoCtwqQPhi+nJyPi2ZFsh6c151AWPCo8kvC7UfMi6Y+4IR3Pk
 dkCuf2JkqlsvOrfht7Zp0duRiGsQHUp/OX5IbT18TGmEg4rjfusJIEm2SJ+jOW6r769G
 npnT0EiLO4tso66yOQEMBle1iyTlp3U2LCjrJzq3veoFjjm/cboKGu2Cg6j373gXE3II
 OV7j0UoQmFAxkS9MejzkwA2JwZSz6ByLuzJeqizRgmdjYPhRHKdvsOuS44Irk4nh2gVn
 gUNt16uLvcKbEgRJ+2dOrxvfFSJGN2KEKpQINdoxGGUUj5f3TMHGDRwOt5AXiSgh40m9
 xaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lt+ttdGIQexwt79JDxPbiWwikZH53evL9J0LFT30Rjk=;
 b=XvpvqlIRIAwRG5ta+Rp6SEDOUwuf647tYti3CN6xNppMym9pqXVrbuy38fUxixDYy1
 s6AJit42cNI9brE3T6kUSXnx9Azmaxw0S9w5A3IqBIsxMVbSlJ8pg9JOXxCA2POgU9bk
 Q6yAA+5rJ2hjLYFSS1co21j9q6/6VHXPcY1ZsUU1+mRHp3qnCkh8nnFfMAFb0SkSHbfS
 FsVgWXmL5PpkTglrWJWLseqjG+iW74Uei4KA2ZlCcXoxvZwU04xaC6WvgE+sstR5Ljuo
 NyYNnRdu2km7BkjFmBXeL/h+CawmdKH7+n6XS9VOE8uNj4wC0Vwux04UEHcPR+Ke1u+j
 p4LQ==
X-Gm-Message-State: ACgBeo0Htc3mU+AtaznPwbfOt8HL3bQAaS7lahs0IG60Q/lya8ibZnnR
 Pk3CiUM1RkcIczB2I8AUIs4x4J2Qwive8tyl
X-Received: by 2002:a7b:c844:0:b0:3a9:70d2:bf23 with SMTP id
 c4-20020a7bc844000000b003a970d2bf23mr2775850wml.165.1663156344108; 
 Wed, 14 Sep 2022 04:52:24 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/20] target/arm: Implement ID_MMFR5
Date: Wed, 14 Sep 2022 12:52:02 +0100
Message-Id: <20220914115217.117532-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ufu3+UI468eW

From: Peter Maydell <peter.maydell@linaro.org>

In Armv8.6 a new AArch32 ID register ID_MMFR5 is defined.
Implement this; we want to be able to use it to report to
the guest that we implement FEAT_ETS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-4-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837..fcc5927587 100644
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
index c171770b03..0737851925 100644
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
index 84c4c85f40..2d737c443e 100644
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
2.34.1

