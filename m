Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp3107973ejo;
        Fri, 15 Dec 2023 07:17:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4aYJ9Qp3cVSsJ6ej8wihp8dEJm+HIMrPQVHu0QAE/pNNiRIW7fNiBCnFff5HWWeNn6CfS
X-Received: by 2002:a0c:edd2:0:b0:67a:3e38:6d77 with SMTP id i18-20020a0cedd2000000b0067a3e386d77mr11553633qvr.26.1702653428198;
        Fri, 15 Dec 2023 07:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702653428; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6yjFkoEVbrQNLznCGPZBgZj1ERfXXZMTKhLVEGkyzEjgoJZRS3aqAi3wlOR9GVDSN
         A4lhoEBItQN1iZdVhHfLcWRcekOdK+7N1vu0mXOGqhJYfvcq3Qw6EPrl53vNkG+ly9aC
         dMrxUnHpIvM644K9EGnlA3DyKPJ5R3FWSAiTEWWvCIkw+Q1vUbVYoE1MiaWmGDOjhigh
         BlU2Gj6LewT5fGFMJGEH5FhryMX7q6JNU1UxqVoXdbsBuZQWWBKftNf9YtbRsscTrgoD
         5ClxyCf5kjZfN0arg7H9Rj8mbL+Qoy5obj6RR+DtQv4icMGWG+pm/RGMAYx7aiGzfi0G
         Fb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FD5lcscTgLjr7YreIMa4Mn7D9UemU5jzp3PkrPYtuEY=;
        fh=C2FsmRbQ7EWUl7lfPdfXyVHemm/cZPyko4K0Xw3sclA=;
        b=OvBXEz6dMBTuWJjPifKBpbVRptcPI8E+44hrZH1SBbUNkOOGMw2WXoLmPw4eZ3eq5U
         YLU9IkqC8SUBj8WqaJBOrsTkrIVaT1PHANYCMTQKj7deIrmAxgfl2aPET0qzreWBGKvp
         G11/J3ZnhRRCgNhTR0yUetp+7UkTm7ecx5byQdrijyBby9jlp5DPpll10M6Ef83O+O9l
         NfhIqoFUjbVchzEdC1FnxrJEdQHXjs6FnqKhIP+gqPJWDURoOvQZGIR8jHJsuv+gy3V3
         /0iBOeByT2/AwCqz/Cl1bExi2JAWtQ4SroPhGV5ea646Kc1qtntlhBdm2JIyXgZEnj6U
         nbGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4jtDbjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a056214124d00b0067ed6dc31a3si12891477qvv.368.2023.12.15.07.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Dec 2023 07:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4jtDbjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rE9vw-0000uy-R7; Fri, 15 Dec 2023 10:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rE9vs-0000lb-HL
 for qemu-arm@nongnu.org; Fri, 15 Dec 2023 10:16:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rE9vo-0005wV-L6
 for qemu-arm@nongnu.org; Fri, 15 Dec 2023 10:16:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so8223515e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 Dec 2023 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702653410; x=1703258210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FD5lcscTgLjr7YreIMa4Mn7D9UemU5jzp3PkrPYtuEY=;
 b=h4jtDbjAvllWqGta7svmrLsBF/ex3u43Rqk5VkZfgBq0xJV7mNDC/6tHUgC+TZKfaa
 1MED4Wz+2xN5hQPd2RYr7AIRjZXj0FkoXH7+xEyb8vpa9uIv9AKi+Yed35iXbdObqt87
 HpRk2+Zx+KLz6thaA5jlCLHYxdtsxqSb82Iwvm8ZiXFQMneS0fQ3gzIK1i19gITWynUI
 Agnm8PDMoBNnmKkHvvV4lGtwjTQ7JJLSyONENjOnuRjFc6Ogc7raANeDmjvn8NQwF2TJ
 vzjBu/WRVetaku725Jq/yMAiYwoWK6aL+v6F6IsiVriC9v+aYm4eo38VXlzy0rAWwSXq
 /bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702653410; x=1703258210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FD5lcscTgLjr7YreIMa4Mn7D9UemU5jzp3PkrPYtuEY=;
 b=GoudcMRdekxf0UAVWbSecZTLdJyN7r7a4qSQ7YIeWcU+TkEFV0tveiW7q2gDSv0pl4
 KrjEKGKeQ60tHnlfuzisQGBf15d0Oru2yn7rR8lwzpLYnqJ0FpUuPtvUl6FhczAzdalJ
 mdZWAM/d5bEUqVse52bTkiLJepE0d8RNv8GYldMi8NtfXT9xK3x308cV7OpvAv56ZExG
 7aUI73Y7HJ5cFv5B1/svyQUDUK02szGvQxIRgs+MeaQ37wf4MZ2JH4Xt1NEuAzWTF+Z4
 aIHYHAEWFj97D5fvBiHaNDkBaihcNbNBpX91zK6af0t5UAwOPhwE4fCrNMtD3ucxR3eC
 oGng==
X-Gm-Message-State: AOJu0YwJrreS9qRKTX8B1pS1b7WcaqXGtgHpIgNN8ts8X/Xv68C5cRko
 2Ax/223tAmJN5GJZGzF6nPEzgA==
X-Received: by 2002:a05:600c:1c1a:b0:40b:5e1c:af27 with SMTP id
 j26-20020a05600c1c1a00b0040b5e1caf27mr6205148wms.45.1702653410401; 
 Fri, 15 Dec 2023 07:16:50 -0800 (PST)
Received: from localhost.localdomain ([2.221.137.100])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040c411da99csm23981111wmq.48.2023.12.15.07.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 07:16:50 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] target/arm/helper: Propagate MDCR_EL2.HPMN into PMCR_EL0.N
Date: Fri, 15 Dec 2023 14:46:53 +0000
Message-ID: <20231215144652.4193815-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 96w9g6E0iUqi

MDCR_EL2.HPMN allows an hypervisor to limit the number of PMU counters
available to EL1 and EL0 (to keep the others to itself). QEMU already
implements this split correctly, except for PMCR_EL0.N reads: the number
of counters read by EL1 or EL0 should be the one configured in
MDCR_EL2.HPMN.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff1970981e..bec293bc93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1475,6 +1475,22 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     pmu_op_finish(env);
 }
 
+static uint64_t pmcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint64_t pmcr = env->cp15.c9_pmcr;
+
+    /*
+     * If EL2 is implemented and enabled for the current security state, reads
+     * of PMCR.N from EL1 or EL0 return the value of MDCR_EL2.HPMN or HDCR.HPMN.
+     */
+    if (arm_current_el(env) <= 1 && arm_is_el2_enabled(env)) {
+        pmcr &= ~PMCRN_MASK;
+        pmcr |= (env->cp15.mdcr_el2 & MDCR_HPMN) << PMCRN_SHIFT;
+    }
+
+    return pmcr;
+}
+
 static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
@@ -7137,8 +7153,9 @@ static void define_pmu_regs(ARMCPU *cpu)
         .fgt = FGT_PMCR_EL0,
         .type = ARM_CP_IO | ARM_CP_ALIAS,
         .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcr),
-        .accessfn = pmreg_access, .writefn = pmcr_write,
-        .raw_writefn = raw_write,
+        .accessfn = pmreg_access,
+        .readfn = pmcr_read, .raw_readfn = raw_read,
+        .writefn = pmcr_write, .raw_writefn = raw_write,
     };
     ARMCPRegInfo pmcr64 = {
         .name = "PMCR_EL0", .state = ARM_CP_STATE_AA64,
@@ -7148,6 +7165,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
         .resetvalue = cpu->isar.reset_pmcr_el0,
+        .readfn = pmcr_read, .raw_readfn = raw_read,
         .writefn = pmcr_write, .raw_writefn = raw_write,
     };
 
-- 
2.43.0

