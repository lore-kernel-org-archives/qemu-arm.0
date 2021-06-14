Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2073085lff;
        Mon, 14 Jun 2021 08:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl3H1O/spqMKpGKiUVPePECvju9dFdsOqlzm6xXJZKzshGL+gEnwfTUJbs5K7LWp0GhUyi
X-Received: by 2002:a67:e208:: with SMTP id g8mr18521017vsa.0.1623684483074;
        Mon, 14 Jun 2021 08:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684483; cv=none;
        d=google.com; s=arc-20160816;
        b=vpQL+CAften5F2+3rnCM07gjG0Mu+bF3jx6BBAVjUGRJ70iagfeUfTI/57H+QAoMjs
         kE8i81CJ3g5Vq7OoGdSD+tppE9I1KT/w39PVwLzOYAFt5kW6vP7ApkGxjcIiouA3EKuF
         4Oj2fFVyVOSgWm6oPcBzUNT9lARGnOu8K50emDtGoENKFgTwL7NKTJYeIMTfVDesKGkK
         3MhOMUVtG1Yi7Ityuj6JQd8GLENqHNBr1EQRvAwjtgGdv/A8gPAG56stYn3mqOhF9ECE
         8UElah4S0hE3yDpgV4jLQMsw3aaJA+QgSi14AERNKedG3lEtNDrc8wL/MNf2m0+8mW6N
         wgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yDKIXJbyEIRnkWLbV4gPk5teKIqaIMP55NuvxbCXaCU=;
        b=oB1w7OllMT1Cimn5kHs4H43/HA5Sclk6WHTr911W7GB9xwTDJChew4K4wPoE9XplHw
         erhGL+ZJ2qraC9oleppZ+e+QLHwUtQaocWANj+51Xxx3ObbwK/K1lPGgk7Lw8N9G9o8D
         UNn3OCAFEYRFwBbHW1WNzl63u4fkxQCwSegNX7NxP+B2sVdMuynS61DsiGvqRfoAihYp
         yvzHNFbTX0ZPlm0K0uKSd5Jtjcrc28jx2z0MbvtVSBJmw9z74JzWZH9cJVnreqM4JWcq
         0meovnuFmGETsEPq2tggD2CgTSVwCj2zf/H8rRPJxvOLwjA0qwxH5fA5x++gkeWnQ3rz
         cjuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y+t43lGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21si5546190vkl.62.2021.06.14.08.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y+t43lGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoVO-00063J-72
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEm-0001bd-8r
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEW-0000Rh-Hp
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id f2so14931725wri.11
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDKIXJbyEIRnkWLbV4gPk5teKIqaIMP55NuvxbCXaCU=;
 b=Y+t43lGBnX67ES/YSquX813OKhOlpgW1xswvt4j5Ym92m12wcQlqdJgPFABpXg4hbq
 gV8UwvUBFam0/oD5z5EpbWX1nTZ9H4TAy7ZsHOFBk+q8u8KyzxrgPW0lx+MhwwPAbqTD
 lgHqcDTkI0jz3WM7h8Xn7e3UZEn+LUq/bisLDmCo0FrXIAt54UfsOIMYlfnhwwkJvleU
 0sHYnphVKLpWUzBKpVaN6UGwTwyIc2FPf4mXQx0Op1JvBoQgl7gzokrJR8CQtqDkEJ7T
 8jVIuQWXv6SVej983YD6jYEPmAp3Gq4QyeTkLsxGTlhybVB28+LSvkiztF10ByxnEtPH
 eBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDKIXJbyEIRnkWLbV4gPk5teKIqaIMP55NuvxbCXaCU=;
 b=Lh7hDiCewPPfEeDbCF4oGkIJImBQ4nJjmo9n3Qr/SKT4QulBRZIRH3cgp5hTzrAEet
 yc7DfqZZOA76rdZMGGPsRtowwgt6ajgc83lN2y8b0U5sjFZT9Lr5tYWTD3xe/6FzSYa0
 igDmEhChJWW7TrzFX3QdgmwMuzx8g2LAtQ6tWqy03ys9HYKWfLmCpookAk3DQbQ44T8l
 ReIDyGPVRrYIb/d7pXnfaLgX1YPzIYmq+3lJ2RUEpJGTSK5iYX4dv9JiD4B3+XcCEDoX
 duf9lC8sDf91wRQyY+ra7BFrGEfZuj8s0aCWewrXBfPdrFpxvc+oVSxHDuaSHkiY4c4Q
 T2vw==
X-Gm-Message-State: AOAM533HltjMomHetfOUizmXVp7LgFZoMuPiJ5qXm03QJ8tG2sdXs2pI
 qj2fH+9odcdiRfSv588UpLuQkTesp093mg==
X-Received: by 2002:adf:a195:: with SMTP id u21mr19007639wru.367.1623683435224; 
 Mon, 14 Jun 2021 08:10:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 30/57] target/arm: Implement MVE VMULL
Date: Mon, 14 Jun 2021 16:09:40 +0100
Message-Id: <20210614151007.4545-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BobyEeFIjoF0

Implement the MVE VMULL insn, which multiplies two single
width integer elements to produce a double width result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 57 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 02bef53ed41..9bbeb7ec49d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -130,3 +130,17 @@ DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmullbsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulltsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 241d1c44c19..5a480d61cd6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -101,6 +101,11 @@ VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
 VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 
+VMULL_BS         111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 53d13e7dcf5..8a6cb39bbff 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -364,6 +364,26 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
     DO_2OP(OP##h, 2, int16_t, FN)               \
     DO_2OP(OP##w, 4, int32_t, FN)
 
+/*
+ * "Long" operations where two half-sized inputs (taken from either the
+ * top or the bottom of the input vector) produce a double-width result.
+ * Here ESIZE, TYPE are for the input, and LESIZE, LTYPE for the output.
+ */
+#define DO_2OP_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)               \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            LTYPE r = FN((LTYPE)n[H##ESIZE(le * 2 + TOP)],              \
+                         m[H##ESIZE(le * 2 + TOP)]);                    \
+            mergemask(&d[H##LESIZE(le)], r, mask);                      \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -384,6 +404,20 @@ DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
 
+DO_2OP_L(vmullbsb, 0, 1, int8_t, 2, int16_t, DO_MUL)
+DO_2OP_L(vmullbsh, 0, 2, int16_t, 4, int32_t, DO_MUL)
+DO_2OP_L(vmullbsw, 0, 4, int32_t, 8, int64_t, DO_MUL)
+DO_2OP_L(vmullbub, 0, 1, uint8_t, 2, uint16_t, DO_MUL)
+DO_2OP_L(vmullbuh, 0, 2, uint16_t, 4, uint32_t, DO_MUL)
+DO_2OP_L(vmullbuw, 0, 4, uint32_t, 8, uint64_t, DO_MUL)
+
+DO_2OP_L(vmulltsb, 1, 1, int8_t, 2, int16_t, DO_MUL)
+DO_2OP_L(vmulltsh, 1, 2, int16_t, 4, int32_t, DO_MUL)
+DO_2OP_L(vmulltsw, 1, 4, int32_t, 8, int64_t, DO_MUL)
+DO_2OP_L(vmulltub, 1, 1, uint8_t, 2, uint16_t, DO_MUL)
+DO_2OP_L(vmulltuh, 1, 2, uint16_t, 4, uint32_t, DO_MUL)
+DO_2OP_L(vmulltuw, 1, 4, uint32_t, 8, uint64_t, DO_MUL)
+
 /*
  * Because the computation type is at least twice as large as required,
  * these work for both signed and unsigned source types.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b8206dc77cd..e4ed118cdc6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -361,3 +361,7 @@ DO_2OP(VHADD_S, vhadds)
 DO_2OP(VHADD_U, vhaddu)
 DO_2OP(VHSUB_S, vhsubs)
 DO_2OP(VHSUB_U, vhsubu)
+DO_2OP(VMULL_BS, vmullbs)
+DO_2OP(VMULL_BU, vmullbu)
+DO_2OP(VMULL_TS, vmullts)
+DO_2OP(VMULL_TU, vmulltu)
-- 
2.20.1

