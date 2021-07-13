Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp610322lfc;
        Tue, 13 Jul 2021 06:57:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdxM3cNW3hjTgiu/5RSkQgM+lObPCqKtAGZl9lKpTjreWuGfJcDMrUM8oT0cLUUB/NLVqw
X-Received: by 2002:a67:cd95:: with SMTP id r21mr5847303vsl.7.1626184636990;
        Tue, 13 Jul 2021 06:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184636; cv=none;
        d=google.com; s=arc-20160816;
        b=rewAFd4+iTz0dZ1rWxn2e7a+7IDTcR8edB3AXfO3TflIcRp1yzEWaPfO6tPO+8htrA
         XDdKCAFfGu5ZG36AmGbkSwe9uAmZx5P+qX35Bd9xFpQIEWB+y0AqV+6Q4mMaXvBF6WLH
         uY+5MpvQ1YnKo1B0Cz9L2vwWUidK5/EYOPSkWT0paMqjDzwyLZxtzD982KmsqZ7YpPYi
         v11oRfLGlCnz0G5kEfGidEa/yOLqo0dUyr6veniU+2GKgu/Q+w6K3ci60ruLObX/U2kY
         U7kmrLKnkjqtXTZ72vaGdA0iI23pqgAqtIXqaBQw7AkagJobMbxy+fzQ9wnBmVUebu8e
         g2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ja0q62vN/Key46fFCtdomZn1IL1h348ETeYRWt5fgQE=;
        b=JY7Ay9XRYWQ5Ves24BbNtTPo0bl3VX89lnLlD1SRgWbXqFbkUTwnAvWdEvhltRaA+x
         Fl41NYZRtrNSYSEBs2wu/6sn8/ZiHJicVD6+9vQWltOd3L9XMKs2nGpiHS7PPL8kitfx
         wCimGb4pmla5EWAZaX1JuOKF5smoqUgyiGK9WW0yoShjA2X59vUUqs0heCUNmQwWeaMY
         yxTE2FDhAdLjLFNDF5nE0kH834ffGpiYwwv2KHkSuSOm7O0OeV0brNxQHv0Fi2EO7JL4
         TB6N9U2tfQvI9dZFdzjYZZA1Wh14e/xUxra42RzTHvN06EfvgpROL5ZzKZ0+HEMOMlAU
         9Miw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S7RxtI6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a129si13773543vsa.226.2021.07.13.06.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S7RxtI6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IuS-00062y-7i
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibh-00009a-Lp
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbZ-0003jc-Jf
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d2so30572219wrn.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ja0q62vN/Key46fFCtdomZn1IL1h348ETeYRWt5fgQE=;
 b=S7RxtI6rXRoVAAagOXqdsW8hhsuULLD52tIcR2e2gKmMy03F/filRbQqT5L3/1BfDs
 vs5J7dkkrsZTsBZr2PXW9ehjIkIMZoo3EVTgRvINAHXS0z5B3Nl1/jEc5qtC+ptb6Mh0
 BCLkB8UTQrzHOqAZnnFNeZW6hBtX8bbyvqqyT9gc5w8b0Kkqzack0UtWopT4qDYX/bGG
 XsNKeLYuWxzfQ7b06LhQq2OzzmyNfqFgee15qDuEvh7/dkBQMfUt7ZqlUrvi4mizYsDj
 ZA/FvXOf/JCKSTcIl/SDPXHCrSI9OqOTRRRdIBXdkVBwdp4SZF4kl7tNf8e4GrCfWzzH
 h1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ja0q62vN/Key46fFCtdomZn1IL1h348ETeYRWt5fgQE=;
 b=qXnmpQXEF1tMACEZK6SMRk4ZnlQby6LlPTYlYDVbW+444PpgAVccd5I+oRCU3wRlj4
 r1LOOCs7j86mUzsslEgWX08GixTJFA+chsZOPHKFFNszv+WYETiMuu0h9QwAeiK+a0nR
 fV6Nrx3rnUk5G4Ny4zBr1uF6xqvwLmXl4OtUnY1eWT6nWKwc8604ZjJem7iUP8juIM/3
 Va2521L7L+vHzURbp9mFO4PssuazvCDwIL4DHbW5AsX/iTmoFOGaGQlKP2DSAg2cIS+e
 BDtvxtVV8JmOePYVWdBRDUbk18exZEKiTYh0GxX0yc55YcjCD2p+tj5FHWkOSeR/dbg7
 A3Bg==
X-Gm-Message-State: AOAM530tZtAl1XxI3ajJAdAOO89k6z3mKsjqjc3rq8X71J4wdez3dVlk
 dlvZJ25+tCt+juTbV7H4FkvNSVcQCrxX4ObY
X-Received: by 2002:a5d:408d:: with SMTP id o13mr1572605wrp.246.1626183464282; 
 Tue, 13 Jul 2021 06:37:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
Date: Tue, 13 Jul 2021 14:37:12 +0100
Message-Id: <20210713133726.26842-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G2fsgs9uWjci

Implement the MVE integer min/max across vector insns
VMAXV, VMINV, VMAXAV and VMINAV, which find the maximum
from the vector elements and a general purpose register,
and store the maximum back into the general purpose
register.

These insns overlap with VRMLALDAVH (they use what would
be RdaHi=0b110).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 20 +++++++++++
 target/arm/mve.decode      | 18 ++++++++--
 target/arm/mve_helper.c    | 69 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 48 ++++++++++++++++++++++++++
 4 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c702db4c39a..282bfe80942 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -387,6 +387,26 @@ DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vmaxvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vminvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vaddlv_s, TCG_CALL_NO_WG, i64, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vaddlv_u, TCG_CALL_NO_WG, i64, env, ptr, i64)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 67bd894daf1..9ae417b718a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -40,6 +40,7 @@
 &vcmp qm qn size mask
 &vcmp_scalar qn rm size mask
 &shl_scalar qda rm size
+&vmaxv qm rda size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -97,6 +98,8 @@
 @vcmp_scalar .... .... .. size:2 qn:3 . .... .... .... rm:4 &vcmp_scalar \
              mask=%mask_22_13
 
+@vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -314,8 +317,19 @@ VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
 VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+{
+  VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+}
+
+{
+  VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+}
 
 VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d44cd80e18b..5066ee3169a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1266,6 +1266,75 @@ DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
 
+/*
+ * Vector max/min across vector. Unlike VADDV, we must
+ * read ra as the element size, not its full width.
+ * We work with int64_t internally for simplicity.
+ */
+#define DO_VMAXMINV(OP, ESIZE, TYPE, RATYPE, FN)                \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint32_t ra_in)             \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        int64_t ra = (RATYPE)ra_in;                             \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                ra = FN(ra, m[H##ESIZE(e)]);                    \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+#define DO_VMAXMINV_U(INSN, FN)                         \
+    DO_VMAXMINV(INSN##b, 1, uint8_t, uint8_t, FN)       \
+    DO_VMAXMINV(INSN##h, 2, uint16_t, uint16_t, FN)     \
+    DO_VMAXMINV(INSN##w, 4, uint32_t, uint32_t, FN)
+#define DO_VMAXMINV_S(INSN, FN)                         \
+    DO_VMAXMINV(INSN##b, 1, int8_t, int8_t, FN)         \
+    DO_VMAXMINV(INSN##h, 2, int16_t, int16_t, FN)       \
+    DO_VMAXMINV(INSN##w, 4, int32_t, int32_t, FN)
+
+/* Max and min of absolute values */
+static int64_t do_maxa(int64_t n, int64_t m)
+{
+    if (n < 0) {
+        n = -n;
+    }
+    if (m < 0) {
+        m = -m;
+    }
+    return MAX(n, m);
+}
+
+static int64_t do_mina(int64_t n, int64_t m)
+{
+    if (n < 0) {
+        n = -n;
+    }
+    if (m < 0) {
+        m = -m;
+    }
+    return MIN(n, m);
+}
+
+DO_VMAXMINV_S(vmaxvs, DO_MAX)
+DO_VMAXMINV_U(vmaxvu, DO_MAX)
+DO_VMAXMINV_S(vminvs, DO_MIN)
+DO_VMAXMINV_U(vminvu, DO_MIN)
+/*
+ * VMAXAV, VMINAV treat the general purpose input as unsigned
+ * and the vector elements as signed.
+ */
+DO_VMAXMINV(vmaxavb, 1, int8_t, uint8_t, do_maxa)
+DO_VMAXMINV(vmaxavh, 2, int16_t, uint16_t, do_maxa)
+DO_VMAXMINV(vmaxavw, 4, int32_t, uint32_t, do_maxa)
+DO_VMAXMINV(vminavb, 1, int8_t, uint8_t, do_mina)
+DO_VMAXMINV(vminavh, 2, int16_t, uint16_t, do_mina)
+DO_VMAXMINV(vminavw, 4, int32_t, uint32_t, do_mina)
+
 #define DO_VADDLV(OP, TYPE, LTYPE)                              \
     uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
                                     uint64_t ra)                \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 650d1470f08..949c11344e3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1320,3 +1320,51 @@ DO_VCMP(VCMPGE, vcmpge)
 DO_VCMP(VCMPLT, vcmplt)
 DO_VCMP(VCMPGT, vcmpgt)
 DO_VCMP(VCMPLE, vcmple)
+
+static bool do_vmaxv(DisasContext *s, arg_vmaxv *a, MVEGenVADDVFn fn)
+{
+    /*
+     * MIN/MAX operations across a vector: compute the min or
+     * max of the initial value in a general purpose register
+     * and all the elements in the vector, and store it back
+     * into the general purpose register.
+     */
+    TCGv_ptr qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qm) ||
+        !fn || a->rda == 13 || a->rda == 15) {
+        /* Rda cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    rda = load_reg(s, a->rda);
+    fn(rda, cpu_env, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VMAXV(INSN, FN)                                      \
+    static bool trans_##INSN(DisasContext *s, arg_vmaxv *a)     \
+    {                                                           \
+        static MVEGenVADDVFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vmaxv(s, a, fns[a->size]);                    \
+    }
+
+DO_VMAXV(VMAXV_S, vmaxvs)
+DO_VMAXV(VMAXV_U, vmaxvu)
+DO_VMAXV(VMAXAV, vmaxav)
+DO_VMAXV(VMINV_S, vminvs)
+DO_VMAXV(VMINV_U, vminvu)
+DO_VMAXV(VMINAV, vminav)
-- 
2.20.1

