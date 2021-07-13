Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp611670lfc;
        Tue, 13 Jul 2021 06:58:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjNJvVPdLNAbG9c/Mxh4MmfO0CMHCxIespZjoXLL7vKY5Us3dmJsveIbEgZgswF5l/fmG0
X-Received: by 2002:a67:f3d1:: with SMTP id j17mr6315905vsn.18.1626184739833;
        Tue, 13 Jul 2021 06:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184739; cv=none;
        d=google.com; s=arc-20160816;
        b=zYZQVCaSEXWRlBE8X8HU1vcOAK070bimZXXGjYYT6LQR0QsRvUFPuAb8EKI+SSgydM
         u2ykpXUObxJhb2tzrL9W2SQC1ferjg1VB3sG8A7D53i2Xc6ECbpEjMZXty0NE+R+64xl
         lTjBR0n+A4LtKbnkBLqjJ45TGD42K04S+uApuaECdpDVAfEiJ810IQre08wnUFAL3o/Z
         cg8cuvrDXOKfJSxu7uCkqgKkgtm8knC0mirEdydjMma9hsKesBxtBOJ7yGcWrIWWQUZK
         /uqSeIjEguS43LYeWl21EUlLV2N3KUQ8zdcWMcC4EIii9eowEOxhkf/16DYM0kflJxOZ
         wQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=klXHEewFEEY6mYo55I2EIetx+SJvhkqMxzPxJGrf5V4=;
        b=AM4KiGqBmEZprNBv6v8UhmRxmbCzdhNQBectVX5gFK0nuuwUhmGP5XZoiqfXLtiVTF
         7W/aT8WRMglzuxELGU9/b2C1OfJp8nXU5vnO1PI2qdXJRNG492rDN4/+Dtv05VVdKy7f
         +VJlzS4WfHBYenwe5lvTQcvVsaMn+7J9QXMFSptP4wKpohoDTGJ6C5VYMUnjnSOyv/6L
         eFNv69wGPQVeImKVSPGVA4a0pI/6JhZzdzVQZVuoIs9L/BSojDSwJxjxFdC1J1kwEg+7
         qn1xcisS4giPn+QkEctFXiKheCloY4mi7U2lwfdpNBLJzjnGv9cmel1XwD6loKOJYKnX
         oFyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4lj85qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si17784860vsr.81.2021.07.13.06.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4lj85qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Iw6-0002tg-Ua
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibq-0000Kg-N5
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibe-0003md-03
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v5so30526198wrt.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=klXHEewFEEY6mYo55I2EIetx+SJvhkqMxzPxJGrf5V4=;
 b=v4lj85qeDSP+fBejQEkQYPYFeQHWlPSe57RJpwXzlfUihPSg3T4OOg39AfA8AY0DZT
 qH/7PN4qHnDfx4pXa+SxeDNRYS/pIhVM5lg4kvlK+mOv/zNA3yZ291gw9F+cpVDgQ553
 YTLkFl8nI65OPS8xAAeJGpWpNyEaF+nGEr9RC0wSFmwyppTee0inl0dcnMtnTEhE7uE7
 T2HGJrplVhuiOHZW/pz7cEYG5UxphrVAL9I9lVlx7wjbJz2bCUhwap5oh71Z4D00dazt
 10+8HqYAfiuCuZBqF5ZW9u86jXhxLwLe3RQJoNzx2Ghc5Paf+mTXT/CrpKPckW/Knmwa
 OZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klXHEewFEEY6mYo55I2EIetx+SJvhkqMxzPxJGrf5V4=;
 b=POGGiqMMQWfFsGKeLMeOcXWvHAfs3RJvOJxsqeC9Aa/4Ymz36eX1IgwmeKgb16UUDV
 PImPLXNQ+/4KgTatYM1xbBw+7TU/CGE/N/k8Jlvdsz6u7PdN5iVGZnMWfMfeHG2DyLno
 dyIp5qsqf/ygmUJtVRcO6tMIEo8p27j5hqKq66XTsyU3xyLu6/OklIiU4WsGKxlbPqMe
 sA3td0Nr/b60yKA3y+RiS82eo3VwExAHYjet8VOF9SRuSTDgNBcjxI0VcyBD9lkT0tYl
 Y6R76waybxARMeIEpcKfD9At0KsFDpyWO9xhEv7bvIIzG2eO8YXrOBWI4kc93CtqsOi1
 XYMA==
X-Gm-Message-State: AOAM5300cop3jBth5yCVxxJPvn9DjKhsviWl8GyqQ0aqwwxOLVmccUwl
 a5OcchRzWgYbj/BcdHSHpbnX7lfqQId88BAN
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr5603589wri.377.1626183468648; 
 Tue, 13 Jul 2021 06:37:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 26/34] target/arm: Implement MVE saturating doubling
 multiply accumulates
Date: Tue, 13 Jul 2021 14:37:18 +0100
Message-Id: <20210713133726.26842-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WjfevLjk2MJh

Implement the MVE saturating doubling multiply accumulate insns
VQDMLAH, VQRDMLAH, VQDMLASH and VQRDMLASH.  These perform a multiply,
double, add the accumulator shifted by the element size, possibly
round, saturate to twice the element size, then take the high half of
the result.  The *MLAH insns do vector * scalar + vector, and the
*MLASH insns do vector * vector + scalar.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 16 +++++++
 target/arm/mve.decode      |  5 ++
 target/arm/mve_helper.c    | 95 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++
 4 files changed, 120 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 50b34c601e1..e61c5d56f41 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -387,6 +387,22 @@ DEF_HELPER_FLAGS_4(mve_vmlasub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlasuh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlasuw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmlahb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlahh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlahw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlahb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlahh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlahw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqdmlashb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlashh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlashw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlashb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlashh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlashw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 2e2df61c860..99cea8d39b6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -418,6 +418,11 @@ VMLA_U           1111 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
 VMLAS_S          1110 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 VMLAS_U          1111 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 
+VQRDMLAH         1110 1110 0 . .. ... 0 ... 0 1110 . 100 .... @2scalar
+VQRDMLASH        1110 1110 0 . .. ... 0 ... 1 1110 . 100 .... @2scalar
+VQDMLAH          1110 1110 0 . .. ... 0 ... 0 1110 . 110 .... @2scalar
+VQDMLASH         1110 1110 0 . .. ... 0 ... 1 1110 . 110 .... @2scalar
+
 # Vector add across vector
 {
   VADDV          111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 91c0add8da7..1013060baeb 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -971,6 +971,28 @@ DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT_ACC_SCALAR(OP, ESIZE, TYPE, FN)                      \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            mergemask(&d[H##ESIZE(e)],                                  \
+                      FN(d[H##ESIZE(e)], n[H##ESIZE(e)], m, &sat),      \
+                      mask);                                            \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 /* provide unsigned 2-op scalar helpers for all sizes */
 #define DO_2OP_SCALAR_U(OP, FN)                 \
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
@@ -1019,6 +1041,79 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+static int8_t do_vqdmlah_b(int8_t a, int8_t b, int8_t c, int round, bool *sat)
+{
+    int64_t r = (int64_t)a * b * 2 + ((int64_t)c << 8) + (round << 7);
+    return do_sat_bhw(r, INT16_MIN, INT16_MAX, sat) >> 8;
+}
+
+static int16_t do_vqdmlah_h(int16_t a, int16_t b, int16_t c,
+                           int round, bool *sat)
+{
+    int64_t r = (int64_t)a * b * 2 + ((int64_t)c << 16) + (round << 15);
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat) >> 16;
+}
+
+static int32_t do_vqdmlah_w(int32_t a, int32_t b, int32_t c,
+                            int round, bool *sat)
+{
+    /*
+     * Architecturally we should do the entire add, double, round
+     * and then check for saturation. We do three saturating adds,
+     * but we need to be careful about the order. If the first
+     * m1 + m2 saturates then it's impossible for the *2+rc to
+     * bring it back into the non-saturated range. However, if
+     * m1 + m2 is negative then it's possible that doing the doubling
+     * would take the intermediate result below INT64_MAX and the
+     * addition of the rounding constant then brings it back in range.
+     * So we add half the rounding constant and half the "c << esize"
+     * before doubling rather than adding the rounding constant after
+     * the doubling.
+     */
+    int64_t m1 = (int64_t)a * b;
+    int64_t m2 = (int64_t)c << 31;
+    int64_t r;
+    if (sadd64_overflow(m1, m2, &r) ||
+        sadd64_overflow(r, (round << 30), &r) ||
+        sadd64_overflow(r, r, &r)) {
+        *sat = true;
+        return r < 0 ? INT32_MAX : INT32_MIN;
+    }
+    return r >> 32;
+}
+
+/*
+ * The *MLAH insns are vector * scalar + vector;
+ * the *MLASH insns are vector * vector + scalar
+ */
+#define DO_VQDMLAH_B(D, N, M, S) do_vqdmlah_b(N, M, D, 0, S)
+#define DO_VQDMLAH_H(D, N, M, S) do_vqdmlah_h(N, M, D, 0, S)
+#define DO_VQDMLAH_W(D, N, M, S) do_vqdmlah_w(N, M, D, 0, S)
+#define DO_VQRDMLAH_B(D, N, M, S) do_vqdmlah_b(N, M, D, 1, S)
+#define DO_VQRDMLAH_H(D, N, M, S) do_vqdmlah_h(N, M, D, 1, S)
+#define DO_VQRDMLAH_W(D, N, M, S) do_vqdmlah_w(N, M, D, 1, S)
+
+#define DO_VQDMLASH_B(D, N, M, S) do_vqdmlah_b(N, D, M, 0, S)
+#define DO_VQDMLASH_H(D, N, M, S) do_vqdmlah_h(N, D, M, 0, S)
+#define DO_VQDMLASH_W(D, N, M, S) do_vqdmlah_w(N, D, M, 0, S)
+#define DO_VQRDMLASH_B(D, N, M, S) do_vqdmlah_b(N, D, M, 1, S)
+#define DO_VQRDMLASH_H(D, N, M, S) do_vqdmlah_h(N, D, M, 1, S)
+#define DO_VQRDMLASH_W(D, N, M, S) do_vqdmlah_w(N, D, M, 1, S)
+
+DO_2OP_SAT_ACC_SCALAR(vqdmlahb, 1, int8_t, DO_VQDMLAH_B)
+DO_2OP_SAT_ACC_SCALAR(vqdmlahh, 2, int16_t, DO_VQDMLAH_H)
+DO_2OP_SAT_ACC_SCALAR(vqdmlahw, 4, int32_t, DO_VQDMLAH_W)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlahb, 1, int8_t, DO_VQRDMLAH_B)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlahh, 2, int16_t, DO_VQRDMLAH_H)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlahw, 4, int32_t, DO_VQRDMLAH_W)
+
+DO_2OP_SAT_ACC_SCALAR(vqdmlashb, 1, int8_t, DO_VQDMLASH_B)
+DO_2OP_SAT_ACC_SCALAR(vqdmlashh, 2, int16_t, DO_VQDMLASH_H)
+DO_2OP_SAT_ACC_SCALAR(vqdmlashw, 4, int32_t, DO_VQDMLASH_W)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlashb, 1, int8_t, DO_VQRDMLASH_B)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlashh, 2, int16_t, DO_VQRDMLASH_H)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlashw, 4, int32_t, DO_VQRDMLASH_W)
+
 /* Vector by scalar plus vector */
 #define DO_VMLA(D, N, M) ((N) * (M) + (D))
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 650f3b95edf..f8b34c9ef36 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -624,6 +624,10 @@ DO_2OP_SCALAR(VMLA_S, vmlas)
 DO_2OP_SCALAR(VMLA_U, vmlau)
 DO_2OP_SCALAR(VMLAS_S, vmlass)
 DO_2OP_SCALAR(VMLAS_U, vmlasu)
+DO_2OP_SCALAR(VQDMLAH, vqdmlah)
+DO_2OP_SCALAR(VQRDMLAH, vqrdmlah)
+DO_2OP_SCALAR(VQDMLASH, vqdmlash)
+DO_2OP_SCALAR(VQRDMLASH, vqrdmlash)
 
 static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
 {
-- 
2.20.1

