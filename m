Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp599882lft;
        Mon, 20 Jun 2022 10:59:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1toGX4SyJhbFRCKiE+qO+Mh5dSxl6eEWiMPjlTV4Sbt+fBN4q4olwnFA2+9T0txT7YMUGmV
X-Received: by 2002:ac8:58cc:0:b0:305:1da9:7f5d with SMTP id u12-20020ac858cc000000b003051da97f5dmr20550754qta.345.1655747971734;
        Mon, 20 Jun 2022 10:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747971; cv=none;
        d=google.com; s=arc-20160816;
        b=A6sFlYtmDBvXOHm+ThCU4ZSG2+Ksi78Ia/EUP6NvKNI9p6qYp3iJXiV5OtQKJkMRmD
         6V00NzpPj/4c46/ax6/8P7O3AV+gouPrJ0rjgXQmPuHsD5kQTrLEJWLWXM4mQYVn7U6L
         xHjNU6WMahDN8ceH+D3wqSnndsnaqKFE83COLLZJAhJZNRieAFFsMVsRgxnXkepwBWQq
         igQEMtSQf7bY8iqE2CN6V0iDTM7KRLr7OX7S5KYxBtSIV0rYph16i2PQKRnxyUiCk29h
         CXzZsFNJM3Ji9pSaWoFcnFdmePb47wto1whK1FmBjB6asiHqQRjG4EbgEDBGELKR7msT
         7yDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GI+YlDQYkDB/N7mh7auOF6n5z7sxW3awZsRTI+xJ+O8=;
        b=S9iL+zk73lKzG6BMPgjHfnTa+7LcrDAQe2qHD3ykYz9c/th3cYsTYeJthlHT9G59oO
         1KEipOvhn6xNEAXptyH3O46ZdQevmLLC/DTn6JPBpdwWNzASGZHYg8JSq9NqTZPOSITP
         /gRAKpueRmmA6ggQZR4Xu/6NjJQZ1gjG4u32U5OYjtGjm11Dn+vSH5BPH3GbX226ySE2
         Q5XMelpBOqE/+lUsqs3+IYNx3mpaya+eAMhu+TpxSfmL5U74SE0vqX2LMZB5a4iYr9e9
         ZJTMu1pCrL0ESxA1VnoWF102oSvG4HQus8UBAxpg5EwxBCFM/nbRM1XoFThbkK6Hpk9V
         eL4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui6Jv1VS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05620a450e00b006a61f108ae0si9538501qkp.357.2022.06.20.10.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui6Jv1VS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LgR-0001Vp-90
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZu-0005cH-CR
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:46 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZs-0001NP-OS
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:46 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so10896574pgc.4
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GI+YlDQYkDB/N7mh7auOF6n5z7sxW3awZsRTI+xJ+O8=;
 b=Ui6Jv1VSNxw+TnwLYlwaSuTkhMfo67zUK/R/myq0tuXimgLuLEgDxZ37H3nc/nM9X3
 8eeogw77pGTjhLOuD7gqx1KtB3pePwHaD44qg4m6MdIuN9hUAlepIsEk+Vt6j4p/UhPk
 PccBPij1v5Q3Eg2tzuzQIAINlSFVeg0tXJ4eawbn6nnoGiZaDd76rWq+uFBij7X1dRcP
 glNy7Mk+cW6+OaWAYrHU62KJlSFmqGTu86lvSmP62uM7VD1aBfDLMt3+ioxe8fHFIJks
 kdh08mabEBMn9n6ss/PbcUB2pQm5KgwngI31G+208oKOc+wPhI6se37mKJnEzldEg9f2
 SbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GI+YlDQYkDB/N7mh7auOF6n5z7sxW3awZsRTI+xJ+O8=;
 b=pKyZcREO07onixrpZ8hC0fGC0tOFdyo8aKogrnUgFgIeyRxQVcn/CPghmKqEqblOR4
 v1vShO3khrT1+pOZpH//Rc1NLlU/zVXUnk6PYAQN/iucIlFe+WiVqGTVPXUAE1FRWBxu
 mayzLCf4PlR441FehUhqTwTJpGtglPxwxUunbYBAVnODHk6uFq1cT5w/TMQ7bS3MGhte
 eokwiKYuQ7RHLf1Y0kXuGpW/Ir1RVW2fcxBC097Ks/6O81A/JXWMLodKu4KIxQ6u8GtZ
 h3FGUKKFtCHCvLiwGgFoDNf2x61U+ChzHaDygxXvf9PwGW5E9nUzron0nzyGfPd21Da6
 LRjw==
X-Gm-Message-State: AJIora/luRhSf9aidlrJ0qrQyprPK/wYwafz3fngUdsXRlDLYGSXcRR3
 TLnOQKJvmNLgfHeq7DFSE0BTiyPCfjjWww==
X-Received: by 2002:a05:6a00:2185:b0:520:7276:6570 with SMTP id
 h5-20020a056a00218500b0052072766570mr25433927pfi.84.1655747563472; 
 Mon, 20 Jun 2022 10:52:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/51] target/arm: Add PSTATE.{SM,ZA} to TB flags
Date: Mon, 20 Jun 2022 10:51:52 -0700
Message-Id: <20220620175235.60881-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: YKtqD4zsP6+3

These are required to determine if various insns
are allowed to issue.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 2 ++
 target/arm/translate.h     | 4 ++++
 target/arm/helper.c        | 4 ++++
 target/arm/translate-a64.c | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dec52c6c3b..05d369e690 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3160,6 +3160,8 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
+FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
+FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index c88c953325..93766649f7 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -97,6 +97,10 @@ typedef struct DisasContext {
     bool align_mem;
     /* True if PSTATE.IL is set */
     bool pstate_il;
+    /* True if PSTATE.SM is set. */
+    bool pstate_sm;
+    /* True if PSTATE.ZA is set. */
+    bool pstate_za;
     /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
     bool mve_no_pred;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bbd04fbd67..e06c054c3d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11335,6 +11335,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
         DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
+        }
+        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8f609f46b6..5cf4a283ba 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14630,6 +14630,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
+    dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
+    dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1

