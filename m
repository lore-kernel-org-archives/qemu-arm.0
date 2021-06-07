Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3684611lfa;
        Mon, 7 Jun 2021 10:11:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD/lJZB+HeBaMOXDLmuEb2LwdZTUp0yQgR6Ks7DD0EsypL+HhT1dxl35w5LDFjN+jU0RPX
X-Received: by 2002:a9f:3291:: with SMTP id l17mr5049571uab.17.1623085893446;
        Mon, 07 Jun 2021 10:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085893; cv=none;
        d=google.com; s=arc-20160816;
        b=LJ2wC3+9VTI+nhZdBc+VOCooM4yAx53GQ5z6+9In1u+9M7zFVv8beYOaefBovDq1cm
         P5wp97EghmyDYep2mruEr1JGyydL+vfegZUk0dHNJFtdVjtLt7NgJe9e13f8LTD242K7
         HDOIBsZHZA1X6q0aCtz/aRZv5H/WG2apQ9I1Xwr74n7fIls9c7C6Adf5GHIWAVGF/VUV
         hpVe/zZbGK91lXRIttQgZ4yJa0QsCJbeUeyMAdifv7XOLI/pH+K/SAZtAxPcVxxP+8eB
         WjONmojqUWCmXKZjeFjiCisJ0DIPMJeo0lhlQriwwm9pYmgeA9NEUMv6HLH1nGYrd5U5
         b2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9rdP9+7JlYEzrxLr9eGsR6KrxjEDczbLT9FYDCtT1so=;
        b=G49kYZfunr4rTCsPqhnRhiJqbtHW+ogqzh3jF27BLwCAwfy8Wemdl5g0IueZwYmzCV
         ftC03zxPl3D2TLeFkZK4ZCJ5l7z66KAyq0vpbmuu/QH1uumLNdjd3Gl0D5nQNtaVittY
         Risiv/Q6SCnVbNR4s2lPgNFzTt4I3/YrtUR/ZkMMjV55f3UsacnGAb22E+i9wF2PJye9
         usMaNYQSCeCO5Kinxp1Q57UI7JFeE1PM6zxm7jcPZ9HkO5B5ip6C7ykbAtZqe9R2Hbcs
         xMlaNXr0TDHRff+lZ8YG9ArwBlz/hO0eGDhxtJ++sjDboNKX20dIja4iWE4qMmnNbmlc
         nnFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmLZzoQE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si1180159vsc.170.2021.06.07.10.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmLZzoQE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqImi-0002f9-Nv
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIan-0007eL-HO
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaK-0007yx-8f
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso102500wmh.4
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rdP9+7JlYEzrxLr9eGsR6KrxjEDczbLT9FYDCtT1so=;
 b=XmLZzoQELFuox6ArF7gy+F0Q/p0LW8EkD78YLbPPXfumchL4qBJ4udyhuRnHSpKWK/
 ve+u7esFsOTX4AZ4O4D/GW7MkCWh1vT4IAg87tobidzcqHTlHWzPGXHV6QsWQpjNUYar
 C7KSdJQD2Lpj21Jy33jKbMtSlHW3UwzsrAZEFQh6y5EWJOlayF9NSVSMHGcXmclLgutD
 wVKCljiIi8Biv24X5UruDVHJ5Zddu5hHuHaLnDBXKrfLiltnM6k6+dTiscEstigQs19R
 hlGDFYkvU0XwJYQPOJFXVjvg+grCcvq+MLg9ZlDvS9OfXKmSiVw96A8NvIzVDc2g5ULs
 o4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rdP9+7JlYEzrxLr9eGsR6KrxjEDczbLT9FYDCtT1so=;
 b=h15qkFm01mMpvny9r6p8tVv5R0dFtZZ1TRGzqwCJtS3wv0g7THmTPcg+tv5IobT9mC
 /nCGWvqInmpfvupJ1ekbuJ79f9ri+WDViRe2+l4AQwYqFDkyegFFYOp0pv2J+jImSIbl
 gCN/sghIElznIl0keE9kydhlZSqHH1O37Zc8xIhPrVG9mq/7c7Nr2QxT6PJL83paryn3
 ThTVyq6xbvUdjizks/Zh78AzQ0penSRg9r0HTh22qbFeqb7r3L4n/IC0VExjNi8+oit/
 DrS6XjSULyr2F7GTsy0yWUxeutzU+L2X7DYaIOnVuZAXjQ5sUvZ+lVG5aASTi4wmq1SD
 tp5A==
X-Gm-Message-State: AOAM530PwnDlwb1Lgw+d427zYLabEMbphMZhCjSj7eWs8A5jvU6Z8vDB
 LB0XHHVBOnkbBqeCqwfDPP8hi673kA32mGhW
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr73613wmg.160.1623085120671;
 Mon, 07 Jun 2021 09:58:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/55] target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
Date: Mon,  7 Jun 2021 17:57:47 +0100
Message-Id: <20210607165821.9892-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: rVF1issc83C0

Implement the MVE vector logical operations operating
on two registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  9 +++++++++
 target/arm/mve_helper.c    | 28 ++++++++++++++++++++++++++
 target/arm/translate-mve.c | 41 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ece9c481367..ad09170c9cf 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -65,3 +65,9 @@ DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vand, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 09849917f5a..332e0b8d1d6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -25,6 +25,7 @@
 
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
+&2op qd qm qn size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -32,6 +33,7 @@
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
+@2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 # Vector loads and stores
 
@@ -68,6 +70,13 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
 
+# Vector 2-op
+VAND             1110 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VBIC             1110 1111 0 . 01 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VORR             1110 1111 0 . 10 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VORN             1110 1111 0 . 11 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VEOR             1111 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a5ed4e01e33..6b3d4dbf2da 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -306,3 +306,31 @@ DO_1OP(vnegw, 4, int32_t, H4, DO_NEG)
 
 DO_1OP(vfnegh, 2, uint16_t, H2, DO_FNEG)
 DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
+
+#define DO_2OP(OP, ESIZE, TYPE, H, FN)                                  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            TYPE r = FN(n[H(e)], m[H(e)]);                              \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r & bytemask);                                  \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_AND(N, M)  ((N) & (M))
+#define DO_BIC(N, M)  ((N) & ~(M))
+#define DO_ORR(N, M)  ((N) | (M))
+#define DO_ORN(N, M)  ((N) | ~(M))
+#define DO_EOR(N, M)  ((N) ^ (M))
+
+DO_2OP(vand, 1, uint8_t, H1, DO_AND)
+DO_2OP(vbic, 1, uint8_t, H1, DO_BIC)
+DO_2OP(vorr, 1, uint8_t, H1, DO_ORR)
+DO_2OP(vorn, 1, uint8_t, H1, DO_ORN)
+DO_2OP(veor, 1, uint8_t, H1, DO_EOR)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b4fc4054fe1..0e0fa252364 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -30,6 +30,7 @@
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -322,3 +323,43 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+{
+    TCGv_ptr qd, qn, qm;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (a->qd > 7 || a->qn > 7 || a->qm > 7 || !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qn, qm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_LOGIC(INSN, HELPER)                                  \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        return do_2op(s, a, HELPER);                            \
+    }
+
+DO_LOGIC(VAND, gen_helper_mve_vand)
+DO_LOGIC(VBIC, gen_helper_mve_vbic)
+DO_LOGIC(VORR, gen_helper_mve_vorr)
+DO_LOGIC(VORN, gen_helper_mve_vorn)
+DO_LOGIC(VEOR, gen_helper_mve_veor)
-- 
2.20.1

