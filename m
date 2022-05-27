Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1214245lfh;
        Fri, 27 May 2022 11:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxpbBH7WswR74WtdlaqDU0W/bSfeZlHhGTmmDjZvAFZ1c7gAsd6RhxjfNvcjtfRjlhctMn
X-Received: by 2002:a05:622a:138f:b0:2f3:f407:4652 with SMTP id o15-20020a05622a138f00b002f3f4074652mr34591715qtk.153.1653676688951;
        Fri, 27 May 2022 11:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676688; cv=none;
        d=google.com; s=arc-20160816;
        b=K6AfduOcicUovuPk+QjD4nGOFWk3Teh1rSbLgrYb3SpCHkXuO0ftdWDeUhUTczpU8A
         TFF7Z/ZMgmbfh1g6inpkkka8vJQK9KrZ42wGsDv3MUvaTkQztgIG5Ii5hh+JqyjV8PoJ
         Q7mC3swcdd83zVifpmZcQifjuq4ihGb+8GysGyWy6FV38PgJAaHl94c+vd3sE3rMYweg
         iKPkciJwaTl7Am5G1ukhIq7JGustRGPfXiQ0RowyvQejhV46L1gRXeeK+UIdg9cc1raT
         pms9L/0xvF35hXDe7zJ6zhZqcHsiMPCdYabcXN1OBQf7bhaPPjNMIR6mIU204znE5q4M
         CTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LK54F8//LHG+fp3S873Ol13IwAhgls+S+j8g1g81rGg=;
        b=sWkUKaYGFBzgRXfmhDvOalG+E9ejSXQU8THijrkGxCMBVshO1cPQPnWg88fH9qvXFx
         4yuSq39U3oePyJ90h/3bv8+M3djNF+7t/r8voQh2AvOlHAtw1cJrpbpLkhW9TA9zmEwT
         XpPGA2KjF3Gn7tgr/OzvB3sdrYnf2tquyMlTP8bMdpgMcA/JFdJpKJAkZtbGYM0eeg5e
         OwoIP8Wmy5M3P+X2/X9vm/gNHVw6SrEST20FgB8M8ZduAJetJgC7urbqS79Y7xENGNRS
         djdL2jr35xcOwmlhUjXJfkONvAjZJaul3vn4w8CqrLyv7PvM3asUAqh+pEg4nIXRLyGU
         V9UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q904b24h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a14d200b002f9372523edsi3240116qtx.632.2022.05.27.11.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q904b24h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueqe-0000ya-EX
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYP-0006FA-V4
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:17 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYM-0003Ve-IZ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:17 -0400
Received: by mail-pg1-x535.google.com with SMTP id r71so4625434pgr.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LK54F8//LHG+fp3S873Ol13IwAhgls+S+j8g1g81rGg=;
 b=Q904b24h2lZ5Ajr8BKU69huBpHfc3CSyEMOY6Ut/9lhz4oHAB/ArRQFLWi5Buxr1nR
 JLuBNvFvY3aXgYqK199sjEPlGx//XgiGzFudQWf8mPZC48Tm5DkawAGkKtLPstndzpXk
 jQf/GqjeBdtnedo/Rieq00szz/bJbiAE+7lCNVO3qB2RPiC6fqc9zU/t58IUWPOKgnwL
 RvxCb9VK7ErCPAp1z7DjLVwbe486hJxCxaXdOXrwFRflZrE7wvroHsmBsaPE01nXSKC5
 1i8F5sxfEHVcM+Vs0NmcM4gVKWuFUEEPS16vLeTW7I1RFZWmrH1q/q4P42bL470iNnmo
 /SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LK54F8//LHG+fp3S873Ol13IwAhgls+S+j8g1g81rGg=;
 b=hpkOGyzT4JKD9NhQTphODrYaLlwiBPV9+88PxU4Iu3Npq64cHaRt3SUz+9uPG+xagW
 BTJf618O3pNSIA/ej8oNEj0BS4+5MJeexlCFzgBXIKeTWgc0PtH9cFiu7k9F84A2wB5G
 vLo9sXvE9McoAv3sUwGVaV31ldweN36L0Pwae0LJ3IMppOYfrNwC0/OgKNjROvZxkkR5
 5ZueRx51ltK9uVxX6bm6CcfVeWPEMeUgB9qhId7y97UF9UJ5EmaDtyya+K5YpLsfRFjH
 l16BnMdK2XGW2KEjZlNnJXe+U9dqZZH159vVlajvv9XQQIRgri1U1PdI+VKOrH/pSiFx
 iezw==
X-Gm-Message-State: AOAM5317ZgFqc3eqtQDFJ9qsxv9+nH3elVQSldQRFE4kqelbLcOpi29a
 Y8D3PdXMsjCFPhTkxOa/f/RWtPl/RqeqbQ==
X-Received: by 2002:a62:1b06:0:b0:518:1649:bb6d with SMTP id
 b6-20020a621b06000000b005181649bb6dmr45401146pfb.25.1653675553238; 
 Fri, 27 May 2022 11:19:13 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 004/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zzz
Date: Fri, 27 May 2022 11:17:17 -0700
Message-Id: <20220527181907.189259-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-TUID: UxQeiasUfFYB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 74 ++++++++++++--------------------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f7e7a569b7..fd1d749c0e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -153,14 +153,20 @@ static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
 }
 
 /* Invoke an out-of-line helper on 3 Zregs. */
-static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
+static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 4 Zregs. */
@@ -1173,13 +1179,7 @@ static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
 
 static bool do_zzw_ool(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
 }
 
 #define DO_ZZW(NAME, name) \
@@ -1345,10 +1345,7 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 
 static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
 static bool trans_ADR_p32(DisasContext *s, arg_rrri *a)
@@ -1390,13 +1387,7 @@ static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_ftssel_s,
         gen_helper_sve_ftssel_d,
     };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
 }
 
 /*
@@ -2426,11 +2417,7 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
         gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
@@ -2460,10 +2447,7 @@ static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
@@ -2618,10 +2602,7 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
 static bool do_zzz_data_ool(DisasContext *s, arg_rrr_esz *a, int data,
                             gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
 }
 
 static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
@@ -6693,13 +6674,10 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
 static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
                             gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
@@ -8377,11 +8355,8 @@ static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
     if (!dc_isar_feature(aa64_sve2_aes, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
-                         a->rd, a->rn, a->rm, decrypt);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
+                            a->rd, a->rn, a->rm, decrypt);
 }
 
 static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
@@ -8399,10 +8374,7 @@ static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
     if (!dc_isar_feature(aa64_sve2_sm4, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
-- 
2.34.1

