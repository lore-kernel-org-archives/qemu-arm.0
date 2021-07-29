Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5542057lfc;
        Thu, 29 Jul 2021 04:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbOMU9QjIxKrnEPXEipDieYDbpYLrHuMmeS7vKnNY8dDhiJvdKXmItbz1IwgNco+GZwE0v
X-Received: by 2002:a25:cf82:: with SMTP id f124mr6240943ybg.58.1627557776528;
        Thu, 29 Jul 2021 04:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557776; cv=none;
        d=google.com; s=arc-20160816;
        b=Zoz9hllEEUN6PiJcybe3AxtOqegV+KAz49DhbjEQ0lhzoeuHr4qQ46tiBV8IUNrgsG
         DKeKotYQ9hFp2tE/jeWFywSjy835rpa6oONtEvfA/JYvNBOyH5lVXVAd2BV/JCGNt7QC
         z0nPK2MMqouEoxsksZeTBwvdTrbYjtbVi2IyTp1C099uNQ3ex8Fr7LuEOpzqCXvT9wGd
         yEjKzQcFIMP3os051T1UPkfjKqOgmg6amEf/TvYQ1EQpvBLYvpR/1LD+oCfLp2H5kDT6
         SWi+wTAUG9pkbjqDiYDn3sTmIkocN/bXpwzfKQ2axpjw/vF3XAm2VbX94e+xKZ0dysdu
         CCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wKy0dzwUb/umCJpYC/xTp1e1IUqKJL1s4VW/DPW/sww=;
        b=jGjbxMeyy4lAdzYJzdPFA3UVhiwqvVVek/iONtRh7dX9iGZFaGmD2fA2aBwepGM2JV
         nFmRnmT6g8BUxybgKYzJKRFlTNz1XM2DldNZOyellU19P8FmYlxYUNPUMOMFFZ8KLSz1
         vpEAFkPKOKaDz7v9AmLhWzRXsPm3MyfMRLh/xXVyUCL3VrB3ygAEiHPsvWfw/qhhJPnR
         1qpWJwRci6jRi71OXl1l51Jp+BcrpjYbac6eKZdCXxn8lTnjCeDsh4UnCD4/AmIEisIC
         AYA+KXLB4Ohyuw0qN8cA9zAXKjfNt3D/DL5hBFl5PrZsRcbiFZBSODTSTURqrcU/ylvW
         vwlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zq0HSg9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si2849409ybp.436.2021.07.29.04.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zq0HSg9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m947o-0007V8-1a
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9410-0000kL-7h
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:56210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-0001CY-MM
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n21so3461049wmq.5
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wKy0dzwUb/umCJpYC/xTp1e1IUqKJL1s4VW/DPW/sww=;
 b=Zq0HSg9xfVC9uUGymhEm0+zrU9l2afdmPdU1lg3PkCDk0mbpn4fEHZ3ia9L6wTMqxN
 pPVZGnZp8wL7U05z7aVY/zqN7EToqHH/zPvTzPt3PbfIRKJOD3udfbQJT0vvIv0Z/hbS
 vQmxyl8fyOM0S2a6xPtP5/w+sOf8OJttmHrjOXsF6nNEt+1ZX9JDzhzRLZu9JtXsUZii
 H+Qotk2rPjMSAYKqwJRJXfbQWPcbsDhfwIxbhRWLOTaSUv0lEm5lhNGs78/NEqwleyo4
 4H+aO4cpZhWYsKRLdSega1R747io7/d71AwUH2XT2DnAc4lDhHY4AXPtLo1cmjKb8Qz4
 VLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKy0dzwUb/umCJpYC/xTp1e1IUqKJL1s4VW/DPW/sww=;
 b=EVkHuyGWaLiqoT3UNNjStsfPEFCbsV/erBURFjtcMXQBmfFHB1+ITM8b3y9oid6g1o
 PhwQTvi5ipUyR+fagbom+HrzloO1yD+HLP969DHP1mhd/TMvVV4GY3ZwlhAsQUO9Jltz
 0LTdLq98RkmTqW6aF1CylMUS0PWIuwJb0EZzWyJITffvXP/jI0dsMgje03J2fTdHD38u
 UQmnbaUqACjljYmhyWcHOua9XK0MvKtA9Y6cZDRj/0OmmSzPAUrh9Q2PqKRU/rgYDHRB
 LTKWY0w8frHlUyf7cVoriJe2MwZlDCT6bXaZsToKotHJC8eEwdod5EgMUVRluAZuuvRx
 xRUg==
X-Gm-Message-State: AOAM5335/3m0827jVeQmH30LB1A2uRbGON0Ywo3xu0pNDnuu7+Mn7f13
 tjdk6JwA/6oFts32DuN+oIR1Tlvxn5a+9A==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr4224738wmk.51.1627557332183; 
 Thu, 29 Jul 2021 04:15:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 21/53] target/arm: Implement MVE integer min/max
 across vector
Date: Thu, 29 Jul 2021 12:14:40 +0100
Message-Id: <20210729111512.16541-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FnAFuxqtNtQN

Implement the MVE integer min/max across vector insns
VMAXV, VMINV, VMAXAV and VMINAV, which find the maximum
from the vector elements and a general purpose register,
and store the maximum back into the general purpose
register.

These insns overlap with VRMLALDAVH (they use what would
be RdaHi=0b110).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2: Drop the harmless but unnecessary
"take abs value of 'n'" part of do_maxa() and do_mina()
---
 target/arm/helper-mve.h    | 20 ++++++++++++
 target/arm/mve.decode      | 18 +++++++++--
 target/arm/mve_helper.c    | 66 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 48 +++++++++++++++++++++++++++
 4 files changed, 150 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0ee5ea3cabd..2c66fcba792 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -379,6 +379,26 @@ DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
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
index bdcd660aaf4..83dc0300d69 100644
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
index ac608fc524b..924ad7f2bdc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1254,6 +1254,72 @@ DO_VADDV(vaddvub, 1, uint8_t)
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
+/*
+ * Helpers for max and min of absolute values across vector:
+ * note that we only take the absolute value of 'm', not 'n'
+ */
+static int64_t do_maxa(int64_t n, int64_t m)
+{
+    if (m < 0) {
+        m = -m;
+    }
+    return MAX(n, m);
+}
+
+static int64_t do_mina(int64_t n, int64_t m)
+{
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
index 44731fc4eb7..2fce74f86ab 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1321,3 +1321,51 @@ DO_VCMP(VCMPGE, vcmpge)
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

