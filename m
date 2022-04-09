Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp171938lfq;
        Fri, 8 Apr 2022 17:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKGWCFBM03uYDMybxCfjSXW+mBzgXFieEbhp4uWCKG6KZc9JnRrY9ET4zMIe6CyfEdSliw
X-Received: by 2002:ac8:6693:0:b0:2ed:964:c268 with SMTP id d19-20020ac86693000000b002ed0964c268mr4021013qtp.459.1649462971297;
        Fri, 08 Apr 2022 17:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649462971; cv=none;
        d=google.com; s=arc-20160816;
        b=zl9M6f56y07lSLbp6Z8LdZ1oy6G90Z1kwIxk5QsHZ/MUe+gcH839z7B7BImFIPc7ZV
         bji1KtjbFyWagSavEeUgiQVvf/fhmjKXl4popFsvIuj3420nfrT+sJ2j/c5RiJaD1Or6
         oz03SsL8VN2LypnSN15Rt+2oQb1Kz2t4+MerouWSIOk/pawoT0kjUCv84WINDr0nMZpe
         5APKZS0Eyu5yr3xgFumOzH0jcJBI5QlB33QtNBN9YMaO3OfI9WyXGZvDSaypNpzYgerw
         bAWIzQUihcrj4kBgA885cwZdsI5DcDvDVpLRQGaSDSEE1n8IOIhf4S0tfLqpMBA8L4CP
         IvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VyFhrugTgFt58NiQM9eVPjxsvqh4sz6yt/2EjO+Xbh8=;
        b=Cub2v+ELcGaGpIUmgtB4myftMaHNLA3OsN32Ia58ZDHZJdQb6Y3BUCXpHH2lOAkS4X
         BFhMsmClx1ttHi1QNjpR9MVu9vsArfDxwVWZdwBcHnpPGideb5Nnrz7gYJoBli5/YdF9
         bBnXdy1ChWsLr73YJdEmxyO204RDINTx0xrelmXxuYOPEm7oFLBbBx9OLvt57/4vk12S
         X1ayj7qXnicYA2tTjjoW6tI4aNGWNzaYPfJC6d5iQlx+GnpGukWCNruqZtb0oAUE/wsg
         KSMHSL0pY7CvFmYa0PZZX9ggh9aMniYjcG6AgpHlsRaqjcvpOyd7UuTT304YsGGnljqi
         73qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJNc3Mup;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp9-20020ad45f89000000b00443cfc49992si1381386qvb.245.2022.04.08.17.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJNc3Mup;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyfS-0002Zc-Pr
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydo-00088n-D0
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:48 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydm-0003Pl-In
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso13270464pju.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyFhrugTgFt58NiQM9eVPjxsvqh4sz6yt/2EjO+Xbh8=;
 b=GJNc3Mup4LvHeUDzJC453cGL0e3WGVarNSxaUmYytIMcurPaMuywUPgAjokRJRWCwN
 DkVnjTT35C4Ig5pE+udj02/sZyeZiEI2zuygx5eAgYk72AevXJ4euY0kqr3Z5402NlIf
 L9YTluALdqNTdg+Drmyzn5ooCwSSo813B5zkRDsBdACH2Fc26B2J3/l91vtMud+COfj4
 wes5iJDrbX/hZQtGnWkQ6rWGSYnwDRAxCSn07aTRpoyPA023Qm0/TNkCjm/w9/DVye+l
 MtHblACloaKCixzzC0Dk0928VFkJfWWnZGqsN3RPQwG8FIcersInPhXVgccvvicWTXI6
 qIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyFhrugTgFt58NiQM9eVPjxsvqh4sz6yt/2EjO+Xbh8=;
 b=IfSKRAcpYdbF7Q9Nvm7E+9JaEPIrcXQljk/muyETtz/ObZ/hpWkHk1b7kb6OuNXvSw
 OqoR9EvgMMbEbCLDl+O8Ywsx4VdVQAcjjA2yvrpFDJp4E6PK8VYJez5e/mAvQqccMbDy
 X/wNrloPnqfMGJjW9tktomVWjukscnGtFDBqhdzyCZ5Wj5vtW8Wc1EyYnFEmTawE9Pqg
 zxEA1b+BjiAwn3sJhRue8yGxxR7VgRpCnQOKtVu26u5HN6E5j7pvpIY6r/1PgrbS6/b8
 U6SpsbpSJHhuch0Fe4EgQTWoHDHige/N5dEwtxnfP1IpLwZqo49f5XsMMS/VBj0qjhTE
 TzAg==
X-Gm-Message-State: AOAM53158ASWSrkntINwoaRlgt90JZnsuGJAWTpADZhWNJmdlbA5l7M6
 ctT5+bPBbx2atMLPWmGrG2F1hwnRxG6GlA==
X-Received: by 2002:a17:902:cccf:b0:156:31a:736e with SMTP id
 z15-20020a170902cccf00b00156031a736emr21718756ple.76.1649462865172; 
 Fri, 08 Apr 2022 17:07:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/16] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Fri,  8 Apr 2022 17:07:28 -0700
Message-Id: <20220409000742.293691-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUAmzs0csqcf

This register is present for either VHE or Debugv8p2, and is
RES0 from EL3 when EL2 is not present.  Move the definition
out of vhe_reginfo and provide a fallback for missing EL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d14650615..210c139818 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7443,11 +7443,20 @@ static const ARMCPRegInfo jazelle_regs[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo contextidr_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW,
+    .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2])
+};
+
+static const ARMCPRegInfo contextidr_no_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0
+};
+
 static const ARMCPRegInfo vhe_reginfo[] = {
-    { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
@@ -8443,6 +8452,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_vh, cpu) ||
+        cpu_isar_feature(aa64_debugv8p2, cpu)) {
+        if (arm_feature(env, ARM_FEATURE_EL2)) {
+            define_one_arm_cp_reg(cpu, &contextidr_el2);
+        } else {
+            define_one_arm_cp_reg(cpu, &contextidr_no_el2);
+        }
+    }
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
-- 
2.25.1

