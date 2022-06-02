Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5213872lfh;
        Thu, 2 Jun 2022 15:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVkfOwia2So2UssKBqCPb3jDoY7k9GGOI01osNhNaQ8k1qmo7P+ypy6X92ATX73CjRU0fM
X-Received: by 2002:a05:622a:1708:b0:2f9:3409:aff9 with SMTP id h8-20020a05622a170800b002f93409aff9mr5470827qtk.434.1654208782001;
        Thu, 02 Jun 2022 15:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208781; cv=none;
        d=google.com; s=arc-20160816;
        b=DwKynTRpU2vZ97ESJi5wEAmzmpG6Q+QKMboExUgU+Ted9fOck4DJF6XwWn6UDI3BKo
         K9nNIzYvoNnAG9IduX+cILBeHYkAtLITehJ0LyCsRQ4Lziq8oyUMFU9vmal3f8kF7qGL
         uEl4gt1+yGGPcItNzJuEGGh3Xx27sPUePtebFuXIk1696lvcnrDd0MWGMgRHF0bgZpTF
         rKfb9RL7kLTxmNLcu4aFc3cqJh4MiyVFQnWF2mjb3QmMn9yv+EX8zYBekjZtU4ZXWWqp
         X0svQvsXMAz2GeXkLuuhJpvLNE/3MuAP+1YMS8DUrfbDZNuIEtM/Yc0HaSdU91lPDzQ0
         CqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s3jNY3UkHfmIkcwzioHwZsMLqfT+fqIVUcaYJ3PqXa4=;
        b=02X+VsnPKOC0S1YTrNQOba22AjFpYXTtVNDvCfMST40mNoF5NQ2DUs7LA119knIoDt
         FLwUoCCr0SKzf9fN6ZTUrIF7o4QH9i4NiNt+81imW3ZvhvHoTFjccopBBc+4KMznQcYR
         QUiTleQdFV2b77rKjfxMjE6d7Ff0n6TLSbEfW4gFzKTKXsA3ND6loq1tnEDdLzcvzcLT
         5bguduCESR6aBJc+tsDQAzlm7YkQw3hFStHVJzdBgSyDylkDk+X1IDYR0WDqgno4ttET
         qbAg808KMK824U9r5WzVGObhvtnFzFY7B03gpK9kSTbIRogiNgAch35W5npjT+T6v0ed
         gCNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ug29dcRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a05620a289200b006a3ae9bbe53si3171007qkp.7.2022.06.02.15.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ug29dcRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtGn-0006BN-FG
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskC-0001Si-9P
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk8-0000sM-Ol
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so5894842pjs.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3jNY3UkHfmIkcwzioHwZsMLqfT+fqIVUcaYJ3PqXa4=;
 b=Ug29dcRh+NQvOHPfisITUC11YFeXMnhVV2YnflbwhY/tkYv8AHsuEnU85lT6TMttem
 uuUOqU0feSicrJH1WUjwsTAWQIo7GXmpvISY2PgYZcIb7Lx/gAmdYFsuFdqyM7SufJyQ
 hdPD4gFApphD46l/snmrA6XEvHCmnb4DgFLD3cjx9VXvD0Wp6QvncN3AJhWluEO197S+
 wvginT5YFdOv2o+FED4VMjtqKYxRVPZZJCyantLiUxN/BqSezHxJFL5AnzGAMh9Pgyb6
 TjabZz3+XnmrzBu/qcY/1ENlLVKG2Yn939PFrG+vRXx/t3wrd2RcHnIEE8f3OESYkcCY
 A+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3jNY3UkHfmIkcwzioHwZsMLqfT+fqIVUcaYJ3PqXa4=;
 b=KysMYQggPhDpXgishD0VWAVhUDC3IgfvGBy0THLP32ehodVe4ksJqWUu6xEl3dENto
 QWLgfOovTZ6LksduAyXxKOqxVuufU8l2+oMy05CJVBlMJRXBygOYOhGbs+AdYPv9snkw
 XjibcSSXYEto8ndFaaSpqEKqtKGSoBxC0PyeP+u1k0dnr98rXqXAtUn4hTDt8vMcq9Xs
 KoeyrR2HsbHaMHQLLByhpBaCh53BoMBOVWMVbEJR7esFXU+AMzGpYDekCHUbDEOMFhGV
 lLozf2ZGMaDZGhA74GeOO9GIHa1M2KF1Fg5y9Kz6SRENmm2nAkhEgkhCRqFdYp53Q6Cs
 FFew==
X-Gm-Message-State: AOAM5322cJ8g0oOAmZunnmGeQTa1JkAGmEf9ht125q1uNiXXntIJ5vg1
 YEEh3zKI6yFjv5PclFUwSvpwMg==
X-Received: by 2002:a17:90b:1642:b0:1e0:96b:c3f2 with SMTP id
 il2-20020a17090b164200b001e0096bc3f2mr7543108pjb.228.1654206753432; 
 Thu, 02 Jun 2022 14:52:33 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 44/71] target/arm: Implement SME ZERO
Date: Thu,  2 Jun 2022 14:48:26 -0700
Message-Id: <20220602214853.496211-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: PGijrAsZYo3w

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/translate-a64.h |  1 +
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-a64.c | 15 +++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 6 files changed, 60 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 6bd1b2eb4b..ec5d580ba0 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -30,6 +30,7 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
 bool sme_enabled_check(DisasContext *s);
+bool sme_za_enabled_check(DisasContext *s);
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index c34d1b2e6b..4172b788f9 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -58,3 +58,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m].
+     * Unless SVL == ARM_MAX_VQ, each row is discontiguous.
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 222f93d42d..660c5dbf5b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1231,6 +1231,21 @@ bool sme_enabled_check(DisasContext *s)
     return fp_access_check_only(s);
 }
 
+/* Note that this function corresponds to CheckSMEAndZAEnabled. */
+bool sme_za_enabled_check(DisasContext *s)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (!s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false),
+                           default_exception_el(s));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..d526c74456 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(s->svl));
+    }
+    return true;
+}
-- 
2.34.1

