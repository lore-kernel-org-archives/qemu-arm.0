Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp606823lfc;
        Tue, 13 Jul 2021 06:52:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsSbebF9RYnbU3c5OsKwHJ3BDogalM+e3gjxan7QqB/jcxg8NB6R6K2jA1wyEEri50wdfZ
X-Received: by 2002:a17:906:3c14:: with SMTP id h20mr5880290ejg.176.1626184375923;
        Tue, 13 Jul 2021 06:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184375; cv=none;
        d=google.com; s=arc-20160816;
        b=rjvzU2cOGdNx5aebolxBpvWkifuMsfFIoCZz3gG8+mpmvnlLCZ0D809Nn/rlgIbyZQ
         qMVqgE4IV4buGNcrPGEjKzYmoYoejzI46bWgT51nEtfLuIB7pjUZJazrEkp6eCepS8HY
         gNeGSYgqXaU5mDWhk9yw8GN8+3EH5gdklUyAXJV9dHrpw2V85ypQDKTTH9oPyRjuLiDe
         8SoiGqo2IJJ0WgEEbocpOvx4HAWMZWlcorc426iRiLMlbeWdNRqB+TWA8VbCwME3cTse
         Sp0CTfITeBhn5mAI/pICZnvhq5xqqZV9kyE2vYim8tjmA91gATeIJ+ZKOxepnjK3gPhy
         7xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gzlJnyMrAHKkx+BzpZ7aFiX7hVIlIkOtXpndBsdqVDU=;
        b=KptNWlwTQ0BAQaWivdaadidDSg2TaguSDGhaVSpfmWKmwCJs8rd8qoIyCvcyMCzNeq
         f3QbFoJhEXBoM3HKeJ9F0QRVnhlX8MyDAVDWi5mbAr7dDXJJ5RW5C5k0TCdGkoYkMHT/
         iCWW/uDI/Jz6vgs0nlqdMQwSXEewrnu2VCiIEkEtR8MBTLo2CugiEqBbjnmNp6DBIfkk
         H/4+otlQUP68831omyiQH+DhTqoDrcjBMQ2/ZPN1dxeYLcJphvv/o6DY6J+3cNS9ItUu
         M1+Q+FqDM4hcxnLi6RPwWg6tfpDie37p+sYA/Y5UU9uXv3QN5s2ugbKE3KIZ5TFySJik
         tz2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyL9kYmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si16165088edv.207.2021.07.13.06.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyL9kYmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IqE-0003cU-RR
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibj-0000E2-4z
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibb-0003kZ-Mm
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so1658861wmb.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gzlJnyMrAHKkx+BzpZ7aFiX7hVIlIkOtXpndBsdqVDU=;
 b=fyL9kYmLHS0panODdQJ1HznzgaPj4CvG7lLCY19bQYtXRRACR9rmf2A8ekIP9RCsfa
 gjF3PHapA1fR4gnzGbI0gC/iNKa0L8lAfpIS3LS9nFZ/Q9CYUDBYoNFyMlcdsqTTy+sC
 xM209QduJaeuzil/hVx2ma+veMOshY9twm1Em3/KYkgtVVYlbaPN9bd/m9HIwkxZICCI
 RAh8ko4mGJbYGJmSAsCM8Y5fTE1PStMKqVDsRZDi2OgV5SLfJLqTE3moBOcJfnuT2slB
 JFKkVoY/cH/DY0VcAL6MA8W6/V4MEvubfogZslEY6U2FOr5bpCoeknauYx4YE7JSwssH
 N0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gzlJnyMrAHKkx+BzpZ7aFiX7hVIlIkOtXpndBsdqVDU=;
 b=DjChi13OJzxgmqNXmb3GTVV1fhRFjyOaKG0DKuGrAlTrMd9mOiTcvJjY1Vs9OlOi0y
 YOAJj283vlRTYQiM6AMSs6Q/5naNJ/bZRwYInTR81cXRhqkSUVBoXp0J4Gzwds7Vmzqn
 LXInNc6IGYvDr2LqRSGhNIlWD7hIi1/HNQrn8xvsSL9DEk/z7IxLmPFeVK91lSykf8k7
 tUtGcS8GIUCVrPlvOL0LdMiqlRwmX0YLvrUhHByssCCYOCv1ZNf5zjpyAiNeFq+z7x5B
 J2M2JrvMaat9KdHK2p/wGI1Dos8KXaceNnYDO3MWm4632jQV47s1iSog1Zn8zXa4Bupp
 U/EQ==
X-Gm-Message-State: AOAM533Y1Afpbhxy1cMVhzAgjNstfPvasShbtt9EvTm0hKVcIfMvw8+Z
 4dF81YqJbm2sP6tcWeaiYwziG3odBZSLBQGk
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr5135904wmg.63.1626183465698; 
 Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 22/34] target/arm: Implement MVE narrowing moves
Date: Tue, 13 Jul 2021 14:37:14 +0100
Message-Id: <20210713133726.26842-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: dwmaYW3QdKQo

Implement the MVE narrowing move insns VMOVN, VQMOVN and VQMOVUN.
These take a double-width input, narrow it (possibly saturating) and
store the result to either the top or bottom half of the output
element.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 20 ++++++++++
 target/arm/mve.decode      | 12 ++++++
 target/arm/mve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 22 +++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5c3f8a26df0..84aa9de6e06 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -80,6 +80,26 @@ DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovnth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovunbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovunbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovuntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovunth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovnbsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovnbsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovnbub, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovnbuh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntub, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntuh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vand, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bf6cf6f8383..79c529e762f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -153,6 +153,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VQMOVUNB       111 0 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_BS      111 0 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
+
   VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -160,6 +163,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VMOVNB         111 1 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_BU      111 1 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
+
   VMULH_U        111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -167,6 +173,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VQMOVUNT       111 0 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_TS      111 0 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
+
   VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -174,6 +183,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VMOVNT         111 1 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_TU      111 1 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
+
   VRMULH_U       111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4eb5dbce6d7..725fe64a348 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1668,6 +1668,84 @@ DO_VSHRN_SAT_UH(vqrshrnb_uh, vqrshrnt_uh, DO_RSHRN_UH)
 DO_VSHRN_SAT_SB(vqrshrunbb, vqrshruntb, DO_RSHRUN_B)
 DO_VSHRN_SAT_SH(vqrshrunbh, vqrshrunth, DO_RSHRUN_H)
 
+#define DO_VMOVN(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE)                   \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        LTYPE *m = vm;                                                  \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        mask >>= ESIZE * TOP;                                           \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)],                       \
+                      m[H##LESIZE(le)], mask);                          \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VMOVN(vmovnbb, false, 1, uint8_t, 2, uint16_t)
+DO_VMOVN(vmovnbh, false, 2, uint16_t, 4, uint32_t)
+DO_VMOVN(vmovntb, true, 1, uint8_t, 2, uint16_t)
+DO_VMOVN(vmovnth, true, 2, uint16_t, 4, uint32_t)
+
+#define DO_VMOVN_SAT(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)           \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        LTYPE *m = vm;                                                  \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        bool qc = false;                                                \
+        unsigned le;                                                    \
+        mask >>= ESIZE * TOP;                                           \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            TYPE r = FN(m[H##LESIZE(le)], &sat);                        \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);             \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VMOVN_SAT_UB(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 1, uint8_t, 2, uint16_t, FN)       \
+    DO_VMOVN_SAT(TOP, true, 1, uint8_t, 2, uint16_t, FN)
+
+#define DO_VMOVN_SAT_UH(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 2, uint16_t, 4, uint32_t, FN)      \
+    DO_VMOVN_SAT(TOP, true, 2, uint16_t, 4, uint32_t, FN)
+
+#define DO_VMOVN_SAT_SB(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 1, int8_t, 2, int16_t, FN)         \
+    DO_VMOVN_SAT(TOP, true, 1, int8_t, 2, int16_t, FN)
+
+#define DO_VMOVN_SAT_SH(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 2, int16_t, 4, int32_t, FN)        \
+    DO_VMOVN_SAT(TOP, true, 2, int16_t, 4, int32_t, FN)
+
+#define DO_VQMOVN_SB(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), INT8_MIN, INT8_MAX, SATP)
+#define DO_VQMOVN_UB(N, SATP)                           \
+    do_sat_bhs((uint64_t)(N), 0, UINT8_MAX, SATP)
+#define DO_VQMOVUN_B(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), 0, UINT8_MAX, SATP)
+
+#define DO_VQMOVN_SH(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), INT16_MIN, INT16_MAX, SATP)
+#define DO_VQMOVN_UH(N, SATP)                           \
+    do_sat_bhs((uint64_t)(N), 0, UINT16_MAX, SATP)
+#define DO_VQMOVUN_H(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), 0, UINT16_MAX, SATP)
+
+DO_VMOVN_SAT_SB(vqmovnbsb, vqmovntsb, DO_VQMOVN_SB)
+DO_VMOVN_SAT_SH(vqmovnbsh, vqmovntsh, DO_VQMOVN_SH)
+DO_VMOVN_SAT_UB(vqmovnbub, vqmovntub, DO_VQMOVN_UB)
+DO_VMOVN_SAT_UH(vqmovnbuh, vqmovntuh, DO_VQMOVN_UH)
+DO_VMOVN_SAT_SB(vqmovunbb, vqmovuntb, DO_VQMOVUN_B)
+DO_VMOVN_SAT_SH(vqmovunbh, vqmovunth, DO_VQMOVUN_H)
+
 uint32_t HELPER(mve_vshlc)(CPUARMState *env, void *vd, uint32_t rdm,
                            uint32_t shift)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c304b8d6e41..ba5b7809b09 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -275,6 +275,28 @@ DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
 
+/* Narrowing moves: only size 0 and 1 are valid */
+#define DO_VMOVN(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        static MVEGenOneOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            NULL,                                               \
+            NULL,                                               \
+        };                                                      \
+        return do_1op(s, a, fns[a->size]);                      \
+    }
+
+DO_VMOVN(VMOVNB, vmovnb)
+DO_VMOVN(VMOVNT, vmovnt)
+DO_VMOVN(VQMOVUNB, vqmovunb)
+DO_VMOVN(VQMOVUNT, vqmovunt)
+DO_VMOVN(VQMOVN_BS, vqmovnbs)
+DO_VMOVN(VQMOVN_TS, vqmovnts)
+DO_VMOVN(VQMOVN_BU, vqmovnbu)
+DO_VMOVN(VQMOVN_TU, vqmovntu)
+
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
     static MVEGenOneOpFn * const fns[] = {
-- 
2.20.1

