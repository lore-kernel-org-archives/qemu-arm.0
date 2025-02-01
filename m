Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143719njb;
        Sat, 1 Feb 2025 08:44:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURgb8eyvK+7iwdEwAUU2DcsEAMhUgdQTAjvCjyfMKM5xKJbu3mKJ+FKIL5xd+fShdgMOUOUHugwComqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVdL+ddJjBYsf2BttMTR1sUnUL1rwb4JcoAjAI7UhvWU//D0fPBiXOmH1ZXigXP/bUwfn9
X-Received: by 2002:a05:620a:2b8a:b0:79d:76c3:5309 with SMTP id af79cd13be357-7bffcccc8e8mr2275204185a.4.1738428276472;
        Sat, 01 Feb 2025 08:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428276; cv=none;
        d=google.com; s=arc-20240605;
        b=glf+axC/YEWetAOZnYKQX5HFBIe+tCOoVTYDbkculUrvYPnnp3c53UmEFZ9XjCDkfF
         L5qIkLRbuo8ldbDx+Cwykl/m9wzQ5qlpYsQHspt4BSZwhFlvceFe8vIWsVjOQhIpxsex
         kBOyott5WS8dRtyUfzjoPSPYSsj0MwxpX4m7nUGbV32l5unfv3hUKvfn0Hn2ihQocXMs
         LXsfYP3j89+YveF/EndmiVWSqHhzhkpiy5MBpk3k7t9j2LDTpG9Gmhlw64XeE1OtruAr
         F8FQSTWc8xpJz+NwKj7aQNcqAayYpbJz2GMBQfOKkIsWvw1S3Jwk8r7vbSSeblluaaZQ
         VZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bl3ONI7qAO69oWR+GPfjMThtztDgJTrkN3erh6CzbvE=;
        fh=7jfN+Vt3JLRmLvdow5XaNBbV9/mhom8Eabc6NMuSx4U=;
        b=I5XMSe+Wn8hr3EXjCM31mbHsHx0ygVXvOnt74423T72JWVwB4RfKhWZLDkLvaA6+ur
         0ewGxhYMdmH425Hug2FdTv00Yo01sBw8FhDiduagOcojPKzcGWRQAaoKMW2+JO8jnCwa
         8Qh3sNNjnlLjY9SzkHFsf5shtIMCx2OBfkO4iQJNd4GAaKZvPeszU5v95tt4bG4LV/DL
         bow795K1/lL5S53vKOmgANDVXUsuPngsTvWsJtWmFM519ngMiYqNHTbi3Q+u5iAD/8YY
         XvRjyat4oEmaluKyslCoQyYXQUOT0dQAwvMF8BNRYUE+7vqZBNnhKFWYfCd3Kw5tSKhP
         Op8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwV7ziky;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a924f77si651998985a.567.2025.02.01.08.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwV7ziky;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1teGYz-00081Z-9u; Sat, 01 Feb 2025 11:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYc-0007EA-Em
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:41:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYa-0001J2-Il
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:41:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so35124435e9.0
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428079; x=1739032879; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bl3ONI7qAO69oWR+GPfjMThtztDgJTrkN3erh6CzbvE=;
 b=VwV7ziky/+8R79UNtrxC6/OzDk3i+/v/r0JkXfx+nSJZLK7JzzAH5sIJeImBmJJ4KN
 sIgqDgqxNPf1/gqJvv9rTPHZl2zkLXSK+xPk6VNTW9yT8RrHQNm7x5Jm5XP4XZ2Zfkju
 3m1LAXkeIGbq0PPSQ2clfosWj1UCjZh8gfAIlTE+5e5XiyZ+0JdWdLxtmQ2sISsYxB1x
 d/06m8lHZ/AOb5jNTUc5TX4P+qnqnirgNV6zPuK8//eypPiYl49fBq/3T/CvYfIQupMz
 054ilhjwVf0l1R2q0PW658hCj4ErUZ75D4zOrE7bD6TYXOV2VrGbow3zvIOpO2FEaRyw
 Hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428079; x=1739032879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bl3ONI7qAO69oWR+GPfjMThtztDgJTrkN3erh6CzbvE=;
 b=q4aEFMuwczRm0aqDoy5o/iidiaRjye0/nIZpmukxUGrIjZv+ipBDLltFblkTNYNs/M
 H2OeAu3ONiuUFWQPwlr95pkcI9U1BgjMARgFwFnxTfGGhq1Gqni4jyI2MGF1i2PW+pEM
 fix3uz3zOAOKtjjrzifZg5qI9jSBrzAJyEN1ji/w/aUfrhoGspR65j7YXZFsQJ20vLR0
 Qlh2V1TdLbzEvmeQH0jCYkiIzznTIOwMRQkXOTeu+KdKsYWjtFzQ9LE8ohYHwbbvaWvM
 h8h4t9TKEz7NuenHlukmp221XjSwriEqt8cCrIvieAql1vJsXVAm665/CxM/QTN8p3PP
 LVsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw2cfsXZ0x3zvjvBPJC+oks5jCamddENoglAtKqKIxFB+mxPP/uJOCi67Nyj5btLjFkSdk51yxl33Z@nongnu.org
X-Gm-Message-State: AOJu0YziZsr/x4rvTykfujbVcY8xJEQxdtTBFKVdn3Zzp3Pldga6qpa7
 ThgqoKUEf6XXJbKvTMekVXwuSp1lAeuKtshBg+baAV20JnZ3LiyaZloTMUqwlcOTvbShetdmlGM
 d
X-Gm-Gg: ASbGncu0QQ1VF2I3oaGFgVFTmH/fnQbMizmv8+6P+x0A1mLCSITmgSLaMYYUwpfPJLX
 GVhi8FdvCUyAeNZ9i37kb6UBorj7qslb88F6MlfBGRFWgUCYYJaFFeH7KUNx8lsBqbXSu1awJ//
 OlqzglDM3rv3FuZ+j7zi3AV1SSKcE2N2aYqyCNitjhns/8RsnmNmRoWSeN71akfPTgfSnUXW0+d
 a5D0QW+zqoCsVx5YNiVfSosR86rWKYgcXQNNKWYiTlJOKpFev040V6KFG5mDoJGMkvC3XOzGAY+
 bJvuLlGLi6Db/En/oCoh
X-Received: by 2002:a05:600c:348c:b0:436:18e5:6917 with SMTP id
 5b1f17b1804b1-438dc34c0a9mr153740165e9.0.1738428079055; 
 Sat, 01 Feb 2025 08:41:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 49/69] target/arm: Handle FPCR.AH in FMLSL (by element and
 vector)
Date: Sat,  1 Feb 2025 16:39:52 +0000
Message-Id: <20250201164012.1660228-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZhT6WYJy+i98

From: Richard Henderson <richard.henderson@linaro.org>

Handle FPCR.AH's requirement to not negate the sign of a NaN
in FMLSL by element and vector, using the usual trick of
negating by XOR when AH=0 and by muladd flags when AH=1.

Since we have the CPUARMState* in the helper anyway, we can
look directly at env->vfp.fpcr and don't need toa pass in the
FPCR.AH value via the SIMD data word.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20250129013857.135256-31-richard.henderson@linaro.org
[PMM: commit message tweaked]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/vec_helper.c | 71 ++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index c2f98a5c67e..5f0656f34ca 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2124,27 +2124,24 @@ static uint64_t load4_f16(uint64_t *ptr, int is_q, int is_2)
  */
 
 static void do_fmlal(float32 *d, void *vn, void *vm, float_status *fpst,
-                     uint32_t desc, bool fz16)
+                     uint64_t negx, int negf, uint32_t desc, bool fz16)
 {
     intptr_t i, oprsz = simd_oprsz(desc);
-    int is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     int is_2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     int is_q = oprsz == 16;
     uint64_t n_4, m_4;
 
-    /* Pre-load all of the f16 data, avoiding overlap issues.  */
-    n_4 = load4_f16(vn, is_q, is_2);
+    /*
+     * Pre-load all of the f16 data, avoiding overlap issues.
+     * Negate all inputs for AH=0 FMLSL at once.
+     */
+    n_4 = load4_f16(vn, is_q, is_2) ^ negx;
     m_4 = load4_f16(vm, is_q, is_2);
 
-    /* Negate all inputs for FMLSL at once.  */
-    if (is_s) {
-        n_4 ^= 0x8000800080008000ull;
-    }
-
     for (i = 0; i < oprsz / 4; i++) {
         float32 n_1 = float16_to_float32_by_bits(n_4 >> (i * 16), fz16);
         float32 m_1 = float16_to_float32_by_bits(m_4 >> (i * 16), fz16);
-        d[H4(i)] = float32_muladd(n_1, m_1, d[H4(i)], 0, fpst);
+        d[H4(i)] = float32_muladd(n_1, m_1, d[H4(i)], negf, fpst);
     }
     clear_tail(d, oprsz, simd_maxsz(desc));
 }
@@ -2152,14 +2149,28 @@ static void do_fmlal(float32 *d, void *vn, void *vm, float_status *fpst,
 void HELPER(gvec_fmlal_a32)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
-    do_fmlal(vd, vn, vm, &env->vfp.standard_fp_status, desc,
+    bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t negx = is_s ? 0x8000800080008000ull : 0;
+
+    do_fmlal(vd, vn, vm, &env->vfp.standard_fp_status, negx, 0, desc,
              get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a32));
 }
 
 void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
-    do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, desc,
+    bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t negx = 0;
+    int negf = 0;
+
+    if (is_s) {
+        if (env->vfp.fpcr & FPCR_AH) {
+            negf = float_muladd_negate_product;
+        } else {
+            negx = 0x8000800080008000ull;
+        }
+    }
+    do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, negx, negf, desc,
              get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64));
 }
 
@@ -2184,29 +2195,25 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
 }
 
 static void do_fmlal_idx(float32 *d, void *vn, void *vm, float_status *fpst,
-                         uint32_t desc, bool fz16)
+                         uint64_t negx, int negf, uint32_t desc, bool fz16)
 {
     intptr_t i, oprsz = simd_oprsz(desc);
-    int is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     int is_2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     int index = extract32(desc, SIMD_DATA_SHIFT + 2, 3);
     int is_q = oprsz == 16;
     uint64_t n_4;
     float32 m_1;
 
-    /* Pre-load all of the f16 data, avoiding overlap issues.  */
-    n_4 = load4_f16(vn, is_q, is_2);
-
-    /* Negate all inputs for FMLSL at once.  */
-    if (is_s) {
-        n_4 ^= 0x8000800080008000ull;
-    }
-
+    /*
+     * Pre-load all of the f16 data, avoiding overlap issues.
+     * Negate all inputs for AH=0 FMLSL at once.
+     */
+    n_4 = load4_f16(vn, is_q, is_2) ^ negx;
     m_1 = float16_to_float32_by_bits(((float16 *)vm)[H2(index)], fz16);
 
     for (i = 0; i < oprsz / 4; i++) {
         float32 n_1 = float16_to_float32_by_bits(n_4 >> (i * 16), fz16);
-        d[H4(i)] = float32_muladd(n_1, m_1, d[H4(i)], 0, fpst);
+        d[H4(i)] = float32_muladd(n_1, m_1, d[H4(i)], negf, fpst);
     }
     clear_tail(d, oprsz, simd_maxsz(desc));
 }
@@ -2214,14 +2221,28 @@ static void do_fmlal_idx(float32 *d, void *vn, void *vm, float_status *fpst,
 void HELPER(gvec_fmlal_idx_a32)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
-    do_fmlal_idx(vd, vn, vm, &env->vfp.standard_fp_status, desc,
+    bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t negx = is_s ? 0x8000800080008000ull : 0;
+
+    do_fmlal_idx(vd, vn, vm, &env->vfp.standard_fp_status, negx, 0, desc,
                  get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a32));
 }
 
 void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
-    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, desc,
+    bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t negx = 0;
+    int negf = 0;
+
+    if (is_s) {
+        if (env->vfp.fpcr & FPCR_AH) {
+            negf = float_muladd_negate_product;
+        } else {
+            negx = 0x8000800080008000ull;
+        }
+    }
+    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, negx, negf, desc,
                  get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64));
 }
 
-- 
2.34.1

