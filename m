Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3788146dye;
        Wed, 2 Jul 2025 05:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6IrD1ai4shgsvEQbmjrTL093fzZ93ukVrNcnlku+t54CBYxEtSe2Unw32zT9wXEcJdLWn4LcTrvdQpw==@linaro.org
X-Google-Smtp-Source: AGHT+IF0NzrzEbV/NBZXv8HfRJMbUxqDYElisc2YPC8ujS5vd6N/eWS68Xq2QAzJ3PGCC3mZbh5V
X-Received: by 2002:a05:620a:1a89:b0:7d4:6648:cc with SMTP id af79cd13be357-7d5c47f620fmr370456185a.57.1751460786601;
        Wed, 02 Jul 2025 05:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460786; cv=none;
        d=google.com; s=arc-20240605;
        b=SvmZEKUHBF0Jvs9VzmCplwDZv/bAoOXVw/Omuv8bYf4IeYgFoCifUM8dEGTFMM6x8L
         LL+lIJU5jRW+OK++iEZkMxOHhay+uwQFUzN2cfuqg07GkW6h0MHbahg3eDIPcsE8YIfX
         0woXtUg86ngxxkILMikeU+wZMF7ZxC15rebsvOwIrG21WUB9j0N9XeYslZxIQg8b/mBv
         BWIm5em49LGlW9xUeNmuldch7R9N01xqsRoeewWiYscDZMgkKwRYvHmjc4yk7bG8lHkG
         hoHCf7qjTTdaioAxOHQ2vwN/i1bzNLc+Sy+6+5mhCEinUkHZrHerkC811dlP9c/tKABy
         MNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W0HakkWnU0sRhIJeclkaThbG+8ICEXrlPucPEFHPhkY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=EUuLi4jcYnhAIkCWbiD+88+5EzTzyNlkBJ/ZCGb5ahMSzW7Sop5MtZZvgSM4/YhSet
         RP9wQ3rFcEW+1P2UJb/oV4yuYauP51ud4oitLDXQxSj8v0NFkTmfOBFJu6gxwhZwvJ9t
         JpGZ4iA3vj1oHkAhR7BSNbRcB2K+d/pHwZuLutdI8HhjuS7uZxfOZRSedLqtJSZtDumi
         zYj2Uc0FzDxYhGPDV6IhToIowuYgR+uTK2rVXqA+8tD5lJzGceydRdabjL0lTuu7LwpA
         gDTyFwmHduvGTV0O1HSwKBNgdwFU54dSfI1BVjzuj99YZ35I1+fW+Nnyek9CigwhIsGP
         SRTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GyubkU8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44319308fsi1270527185a.113.2025.07.02.05.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GyubkU8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwpB-0003UG-8c; Wed, 02 Jul 2025 08:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwk6-0004rb-Il
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:19 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjh-0002F3-Ht
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:11 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2ef891cd058so3418127fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459926; x=1752064726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0HakkWnU0sRhIJeclkaThbG+8ICEXrlPucPEFHPhkY=;
 b=GyubkU8hNggPd7IUWcrESZ2TqjuxcPM8e097q4CuqKwE3uL96t7nZs8x/PoaQRovfh
 XPjwg2OLwKlU7s403EHK2XFO1JDZQoHYYUCM1fVSKkWw0OgNlGBCou+4JAOFW8J3v4Ga
 1YN4Qno5FKiACDbGkNi1lATCkUL/jg3dDCS7Xw9qBfW+EfyUtSQ9p8Oyh7OFdYA8LVxC
 Dva0rndjpVEphwXxc2NjYqlNmlrk1IDgfuthQrTBrYuspXv35h3tDNFjeK3pBDp7l8FO
 JmHcmKheCNqjOiTZFAf4YlRZK8dqm1Acxoeh3vo0J21nw8HQzm1JYtIAMGcePg39jIM1
 AFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459926; x=1752064726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0HakkWnU0sRhIJeclkaThbG+8ICEXrlPucPEFHPhkY=;
 b=NTIgnoOOiwzGIfHe0LJ569rL3TM5A4f2qzrciCWnAhTj4q2ZqhJYajCn676mKzyVQx
 4+IAB12y+qddHvOlFKSHAiVchIA8pnh0+l/sstZAitg+CJvFu7F/Gvcjr98hkiSyJK2z
 un2Lr6eCbgKds63LWJ3/7mjVXrLK+OvEu/Qv52x25WVn0FSweuX1uFmfGuWoXLoKZCmD
 L/r6biC+KQ6R36qj0qqYOTnZ9DbSe6ZWhzbDcYS99Qr7TOWBxmSDAzQtw6Z1cPRmFaTI
 9cqiKIWDOv0nmWZ+v7QwlX3O8CK3FszmzWjQ87vRr+c4py0RuxzK+Ex4FhSdusqynA2y
 wJLw==
X-Gm-Message-State: AOJu0YyN9/KiA+E1JroFY1Lbwa/n2jDxzMEkPZxneJvyoIzAYKO0mPJq
 mz/7/JOG8/kn70jnTvixqDCdx6X/QgtXOlA68UlRESQl0tN/dKdj1d5iV21GbFVlgCM=
X-Gm-Gg: ASbGnctB06P0dgN7k/gosL6KqvtjQk+QvshtO9DaTKyx0mwVbkPPEQudyHT3T5ddJcA
 K3TQlRdRsqcc8NRfQd/m2VJktzhK5FcpfZIsV5ENknd10hBD/Y1MiCJAnIi93FXCvs2VbgYUzfL
 R0MU+MtjO9fwCRDlsi+Gcq0wXyjNzZlvfifI4Gcu2znpo23aJNjoUU6nNK1FvNd9Fxb/FhOSURL
 SlyfvLTTCcO8flihWvbwn1qAIsO0pqGCsoLSYt+VZ2AsppvIF7PSy7xpGSvbFSf8j2L0rdwrbMe
 icuALlUkGQMbRhEn++wE3qng0HTorJfIjzFtmrUs/67hBG+7tTlDAwvguwiZGL4VEVx1rjtN8JT
 8nzbO
X-Received: by 2002:a05:6871:2016:b0:2d6:72a4:4c24 with SMTP id
 586e51a60fabf-2f5a8d2a08emr1986086fac.32.1751459926122; 
 Wed, 02 Jul 2025 05:38:46 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 73/97] target/arm: Implement ANDQV, ORQV, EORQV for SVE2p1
Date: Wed,  2 Jul 2025 06:33:46 -0600
Message-ID: <20250702123410.761208-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
X-TUID: vjtpz7NuuhE6

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 15 ++++++++++++
 target/arm/tcg/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c |  3 +++
 target/arm/tcg/sve.decode      |  5 ++++
 4 files changed, 65 insertions(+)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index ec82d0a4e7..9758613b2d 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -2955,3 +2955,18 @@ DEF_HELPER_FLAGS_4(sve2p1_uminqv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_uminqv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(pext, TCG_CALL_NO_RWG, void, ptr, i32, i32)
+
+DEF_HELPER_FLAGS_4(sve2p1_orqv_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_orqv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_orqv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_orqv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2p1_eorqv_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_eorqv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_eorqv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_eorqv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2p1_andqv_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_andqv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_andqv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_andqv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 59ba1caf02..bc5e039689 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -123,6 +123,11 @@ static inline uint64_t expand_pred_s(uint8_t byte)
     return word[byte & 0x11];
 }
 
+static inline uint64_t expand_pred_d(uint8_t byte)
+{
+    return -(uint64_t)(byte & 1);
+}
+
 #define LOGICAL_PPPP(NAME, FUNC) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
 {                                                                         \
@@ -206,6 +211,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
 #define DO_EOR(N, M)  (N ^ M)
 #define DO_ORR(N, M)  (N | M)
 #define DO_BIC(N, M)  (N & ~M)
+#define DO_ORC(N, M)  (N | ~M)
 #define DO_ADD(N, M)  (N + M)
 #define DO_SUB(N, M)  (N - M)
 #define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
@@ -1900,10 +1906,46 @@ DO_ZZI(sve_umini_d, uint64_t, DO_MIN)
 
 #undef DO_ZZI
 
+#define DO_LOGIC_QV(NAME, SUFF, INIT, VOP, POP)                         \
+void HELPER(NAME ## _ ## SUFF)(void *vd, void *vn, void *vg, uint32_t desc) \
+{                                                                       \
+    unsigned seg = simd_oprsz(desc) / 16;                               \
+    uint64_t r0 = INIT, r1 = INIT;                                      \
+    for (unsigned s = 0; s < seg; s++) {                                \
+        uint64_t p0 = expand_pred_##SUFF(*(uint8_t *)(vg + H1(s * 2))); \
+        uint64_t p1 = expand_pred_##SUFF(*(uint8_t *)(vg + H1(s * 2 + 1))); \
+        uint64_t v0 = *(uint64_t *)(vn + s * 16);                       \
+        uint64_t v1 = *(uint64_t *)(vn + s * 16 + 8);                   \
+        v0 = POP(v0, p0), v1 = POP(v1, p1);                             \
+        r0 = VOP(r0, v0), r1 = VOP(r1, v1);                             \
+    }                                                                   \
+    *(uint64_t *)(vd + 0) = r0;                                         \
+    *(uint64_t *)(vd + 8) = r1;                                         \
+    clear_tail(vd, 16, simd_maxsz(desc));                               \
+}
+
+DO_LOGIC_QV(sve2p1_orqv, b, 0, DO_ORR, DO_AND)
+DO_LOGIC_QV(sve2p1_orqv, h, 0, DO_ORR, DO_AND)
+DO_LOGIC_QV(sve2p1_orqv, s, 0, DO_ORR, DO_AND)
+DO_LOGIC_QV(sve2p1_orqv, d, 0, DO_ORR, DO_AND)
+
+DO_LOGIC_QV(sve2p1_eorqv, b, 0, DO_EOR, DO_AND)
+DO_LOGIC_QV(sve2p1_eorqv, h, 0, DO_EOR, DO_AND)
+DO_LOGIC_QV(sve2p1_eorqv, s, 0, DO_EOR, DO_AND)
+DO_LOGIC_QV(sve2p1_eorqv, d, 0, DO_EOR, DO_AND)
+
+DO_LOGIC_QV(sve2p1_andqv, b, -1, DO_AND, DO_ORC)
+DO_LOGIC_QV(sve2p1_andqv, h, -1, DO_AND, DO_ORC)
+DO_LOGIC_QV(sve2p1_andqv, s, -1, DO_AND, DO_ORC)
+DO_LOGIC_QV(sve2p1_andqv, d, -1, DO_AND, DO_ORC)
+
+#undef DO_LOGIC_QV
+
 #undef DO_AND
 #undef DO_ORR
 #undef DO_EOR
 #undef DO_BIC
+#undef DO_ORC
 #undef DO_ADD
 #undef DO_SUB
 #undef DO_MAX
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 6ad4d1e289..2114b2ecca 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -778,6 +778,9 @@ DO_ZPZ(NOT_zpz, aa64_sve, sve_not_zpz)
 DO_ZPZ(ABS, aa64_sve, sve_abs)
 DO_ZPZ(NEG, aa64_sve, sve_neg)
 DO_ZPZ(RBIT, aa64_sve, sve_rbit)
+DO_ZPZ(ORQV, aa64_sme2p1_or_sve2p1, sve2p1_orqv)
+DO_ZPZ(EORQV, aa64_sme2p1_or_sve2p1, sve2p1_eorqv)
+DO_ZPZ(ANDQV, aa64_sme2p1_or_sve2p1, sve2p1_andqv)
 
 static gen_helper_gvec_3 * const fabs_fns[4] = {
     NULL,                  gen_helper_sve_fabs_h,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index b762257759..ff740f7b40 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -326,6 +326,11 @@ ORV             00000100 .. 011 000 001 ... ..... .....         @rd_pg_rn
 EORV            00000100 .. 011 001 001 ... ..... .....         @rd_pg_rn
 ANDV            00000100 .. 011 010 001 ... ..... .....         @rd_pg_rn
 
+# SVE2.1 bitwise logical reduction (quadwords)
+ORQV            00000100 .. 011 100 001 ... ..... .....         @rd_pg_rn
+EORQV           00000100 .. 011 101 001 ... ..... .....         @rd_pg_rn
+ANDQV           00000100 .. 011 110 001 ... ..... .....         @rd_pg_rn
+
 # SVE constructive prefix (predicated)
 MOVPRFX_z       00000100 .. 010 000 001 ... ..... .....         @rd_pg_rn
 MOVPRFX_m       00000100 .. 010 001 001 ... ..... .....         @rd_pg_rn
-- 
2.43.0

