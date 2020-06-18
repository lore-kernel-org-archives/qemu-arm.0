Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1290013lfm;
        Wed, 17 Jun 2020 22:18:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9IH+10KYTSjhnUBHtw4M/mtwmCn0AK1T/QyhXQsbI2R8KBqTCIlO05PlV3i4d825IEucg
X-Received: by 2002:a5b:b49:: with SMTP id b9mr3414834ybr.343.1592457504039;
        Wed, 17 Jun 2020 22:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457504; cv=none;
        d=google.com; s=arc-20160816;
        b=qfRvxszuMSI3g7JLO4akYioNXx8SrYrp3qGVs0pWfQbtmYu4zwAAintNPvrXjA2Y6B
         SVheEo7so0Ej/gr1I2gpfQPl9h1I/kEsSQGsjMk/apbFUIwVihn7uT7BL6KIimTN5lWm
         ykvcyqmusy2swxh1Dtp2xKgz0+qoA70cE81dENaD7HIjqM4wzT9IJhp9fbVtZ9rqdwuy
         BoxDRc9vBxWHmxo5c3+OmL9JlrCq4EA3ozxpLhPPiMc+PEG4VB9IsaGwYKbUqXyQkv+e
         M+FnBZLJBMSfnbC5nt3GkzAZ7iWWpT2/3nEmFXwroM0Zlyp70papi3t0m7Iq9Q36nX6l
         zeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5TxUKrLaDC0E38AmwbDDUif4r9Uj8vPYoUULcTkqXz0=;
        b=RArxi1sj4ddE9ceSeCT0yvMJO/3OACT4sSLCpVM7B9d3rwy3smrt9q6L/C9BHE51oF
         DTePVWT88vjsLoJWXCKIWSnER+tz8bi50TybqgTBdHR8ZGNxS4HGrdGFjdfpdRE7nymW
         yvJeDd/kE8qPke5FMGhEOg0YWmyEYGzeZ7yrYHN9zNFlt1959WEVlDNVuW7Hl+hNcQk2
         3awXSvaWvcZWesFo2t4ygQ1WDiRWM39bMKMJXIF+h32ZljTHL6vnqBRcgzJ9gcj2OtQ5
         DTaWQlc9Ej8711FIwhNTzU/zG8GlK5fCgledxigk1tpd8KsmCYfVBSLH2buRx6jBUU5v
         DfXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dzsiqI3I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si1530268ybo.286.2020.06.17.22.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dzsiqI3I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmwR-0000tu-Cx
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmFB-0007Op-04
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:33:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmF6-0003iR-Uy
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:33:40 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b16so2178180pfi.13
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TxUKrLaDC0E38AmwbDDUif4r9Uj8vPYoUULcTkqXz0=;
 b=dzsiqI3IBcOLKLVRmlSOcWuJLqRLS3cXaYQ4Yq3EzFD7F8oxvKW825vaV8HtSgLlGf
 cHpLvwUfaggkbkO9Rig4RopufQqKZq95SKq7dj9cKcQj3IT6u+DMm6KRHD96/tdTue6u
 raBd+e27cSjpzAycQvsDwksplEgmL9ijMYWvwJvWOBcp1du+ehR1dv5taekkP8yWHizx
 DOxQAWG+xYQbncI5lx9zDq7zqNjkHfjL1GWoW5l6iGBkCZP2HtMTcMqcggZkSxcJKHpP
 JZlIuqPMUhTJYfCsObZx5m224xRekE69KUSlnJILsiC3q2SOkMiDolkIPK9F7d694Y2E
 o4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TxUKrLaDC0E38AmwbDDUif4r9Uj8vPYoUULcTkqXz0=;
 b=NHMrv1flPhyQYJ3ShpqdirbvWWFWutd9RCM5pTm/umZuCyqPRYmS4b0MJ5ICjSbvxq
 PSFoEeZ49yhZdDUdbEPLujNYel+NfXoUA9Im9hKKDCDVI5OFgiw3sjic7dziNMiTcgT/
 +FCzvjRewxPphZlD5V697WruHydhlGXkvBUgKoqfKBfYutdebz598+sRBatCeg0jQoeK
 MuSc+TqovEBMWtvQjVoDCjXePIFUdkaCqAU5+BeBSgGCnm/85tEDjRX72fmGPRy3TGYL
 ez3tgIVczA1LWk5Hnl1sD4HGLT7CZ/Kob36tSIdVkf7Paxgi9vD7uYU5z6FcTGpHP0EF
 KM8Q==
X-Gm-Message-State: AOAM530/wwCbeYkp8hogNOrFvafYz1cLhXFBIWUCYm9sQMAEcXuw0qAg
 vJ8/ek0n7QRxLajC36vkAcd4eLMzaoE=
X-Received: by 2002:a63:5d1:: with SMTP id 200mr1876679pgf.59.1592454814554;
 Wed, 17 Jun 2020 21:33:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 099/100] target/arm: Implement SVE2 bitwise shift immediate
Date: Wed, 17 Jun 2020 21:26:43 -0700
Message-Id: <20200618042644.1685561-100-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HIvwcJGEVcra

From: Stephen Long <steplong@quicinc.com>

Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 33 +++++++++++++++++++++
 target/arm/sve.decode      |  5 ++++
 target/arm/sve_helper.c    | 39 +++++++++++++++++++++++--
 target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 135 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a00d1904b7..cb609b5daa 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2250,6 +2250,39 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_srshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqshlu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 4e21274dc4..d2f33d96f3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -342,6 +342,11 @@ ASR_zpzi        00000100 .. 000 000 100 ... .. ... .....  @rdn_pg_tszimm_shr
 LSR_zpzi        00000100 .. 000 001 100 ... .. ... .....  @rdn_pg_tszimm_shr
 LSL_zpzi        00000100 .. 000 011 100 ... .. ... .....  @rdn_pg_tszimm_shl
 ASRD            00000100 .. 000 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
+SQSHL_zpzi      00000100 .. 000 110 100 ... .. ... .....  @rdn_pg_tszimm_shl
+UQSHL_zpzi      00000100 .. 000 111 100 ... .. ... .....  @rdn_pg_tszimm_shl
+SRSHR           00000100 .. 001 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
+URSHR           00000100 .. 001 101 100 ... .. ... .....  @rdn_pg_tszimm_shr
+SQSHLU          00000100 .. 001 111 100 ... .. ... .....  @rdn_pg_tszimm_shl
 
 # SVE bitwise shift by vector (predicated)
 ASR_zpzz        00000100 .. 010 000 100 ... ..... .....   @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b37fb60b7d..fe79e22bb8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2231,6 +2231,43 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
 DO_ZPZI(sve_asrd_s, int32_t, H1_4, DO_ASRD)
 DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 
+#define DO_RSHR(x, sh) ((x >> sh) + ((x >> (sh - 1)) & 1))
+
+/* SVE2 bitwise shift by immediate */
+DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
+DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
+DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
+DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)
+
+DO_ZPZI(sve2_uqshl_zpzi_b, uint8_t, H1, do_uqshl_b)
+DO_ZPZI(sve2_uqshl_zpzi_h, uint16_t, H1_2, do_uqshl_h)
+DO_ZPZI(sve2_uqshl_zpzi_s, uint32_t, H1_4, do_uqshl_s)
+DO_ZPZI_D(sve2_uqshl_zpzi_d, uint64_t, do_uqshl_d)
+
+DO_ZPZI(sve2_srshr_b, int8_t, H1, DO_RSHR)
+DO_ZPZI(sve2_srshr_h, int16_t, H1_2, DO_RSHR)
+DO_ZPZI(sve2_srshr_s, int32_t, H1_4, DO_RSHR)
+DO_ZPZI_D(sve2_srshr_d, int64_t, DO_RSHR)
+
+DO_ZPZI(sve2_urshr_b, uint8_t, H1, DO_RSHR)
+DO_ZPZI(sve2_urshr_h, uint16_t, H1_2, DO_RSHR)
+DO_ZPZI(sve2_urshr_s, uint32_t, H1_4, DO_RSHR)
+DO_ZPZI_D(sve2_urshr_d, uint64_t, DO_RSHR)
+
+#define do_suqrshl_b(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, (int8_t)m, 8, false, &discard); })
+#define do_suqrshl_h(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, (int16_t)m, 16, false, &discard); })
+#define do_suqrshl_s(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, m, 32, false, &discard); })
+#define do_suqrshl_d(n, m) \
+   ({ uint32_t discard; do_suqrshl_d(n, m, false, &discard); })
+
+DO_ZPZI(sve2_sqshlu_b, int8_t, H1, do_suqrshl_b)
+DO_ZPZI(sve2_sqshlu_h, int16_t, H1_2, do_suqrshl_h)
+DO_ZPZI(sve2_sqshlu_s, int32_t, H1_4, do_suqrshl_s)
+DO_ZPZI_D(sve2_sqshlu_d, int64_t, do_suqrshl_d)
+
 #undef DO_ASRD
 #undef DO_ZPZI
 #undef DO_ZPZI_D
@@ -2265,8 +2302,6 @@ DO_SHRNT(sve2_shrnt_h, uint16_t, uint8_t, H1_2, H1, DO_SHR)
 DO_SHRNT(sve2_shrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_SHR)
 DO_SHRNT(sve2_shrnt_d, uint64_t, uint32_t,     , H1_4, DO_SHR)
 
-#define DO_RSHR(x, sh) ((x >> sh) + ((x >> (sh - 1)) & 1))
-
 DO_SHRNB(sve2_rshrnb_h, uint16_t, uint8_t, DO_RSHR)
 DO_SHRNB(sve2_rshrnb_s, uint32_t, uint16_t, DO_RSHR)
 DO_SHRNB(sve2_rshrnb_d, uint64_t, uint32_t, DO_RSHR)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1dd67ef538..2b2e186988 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1044,6 +1044,66 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     }
 }
 
+static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
+        gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
+        gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
+        gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
+        gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
+        gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Bitwise Shift - Predicated Group
  */
-- 
2.25.1

