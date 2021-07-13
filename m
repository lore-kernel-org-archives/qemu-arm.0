Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp610786lfc;
        Tue, 13 Jul 2021 06:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxedb0s9r4Gm1QvfPImBlusR9bQY70oF3fLfunC+31ROClU6+iVntFyvphjfEPGPLfQiprx
X-Received: by 2002:ab0:1545:: with SMTP id p5mr4357471uae.74.1626184672553;
        Tue, 13 Jul 2021 06:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184672; cv=none;
        d=google.com; s=arc-20160816;
        b=ThLhL4cDOeXhhFuInVXbCv5bAS5IOC/zoQ2qFjinwX50IzU6Cqv5WweVXB4e7X7ddu
         ooKPBnX62RMo4P0Fg9aYEzDQr11zO0gWD8EFLimpfePRN0r82tjRTBwhjDxzAghHXUxz
         xvRxtv5m//MvplHeL6pBkFmC3rzN0C+xjEY7DV/B+SmuIWxSfxeKfJ7UMFmZzg6lqH3p
         boX+zUMRN20BQ8bGa6h5I43zDsvs+3sm5wJhGga7vlfU9G2mLSbYJOHuZPrmaifpbOpF
         WdvrgSu6gg9R/J5hzepQC2woZ5dL277iSpj1qIrwh5hbdK+Lp8UxJdRpZv3kNJxz3d1n
         l57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kbQLDgQV6VvX5+WpuSOCf9tnLATz5FQ5PTEJgS4fW8c=;
        b=c+cjuejswVSIYt5MuQw91IyEwsnAMgmfPd9rZwZgWcuA2rcUaAmaUtSZdOBBDa/1ss
         PGmXeuS+wEDGbWrDVsEOaGRstoQO3GOEyBl6Xs91FDA5iJdglI0aFT+q9f25fOL6acJ4
         xXDKu0iQQgXEFmG+ZRuWoTsgGpqzTOehuARpKynsviqXTES7p0rDP2doO5y4id4LI52x
         9uqZMuVGtdWa80ZA7JuUbgQQ8CH9m4YNnW5B+kC/Wu4RN7wHOVDD75C6L16g8yl+bOuA
         aRmPdUlBr1rVHqBryoDlT+omJq6dp7yhNs1WefJec6niqnyeeiQteTYxeKuHX6CFfoRi
         GS0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UVvGwXc/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si18919200vsk.283.2021.07.13.06.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UVvGwXc/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Iv1-0007WZ-Pi
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibp-0000GK-Rf
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:01 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibf-0003oW-FA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id l6so5380048wmq.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kbQLDgQV6VvX5+WpuSOCf9tnLATz5FQ5PTEJgS4fW8c=;
 b=UVvGwXc/5AQwBw21BRu1gheE56cHjVzohKUahmI028zSJfdE/kcU+EzZBlde1ab3bc
 YYDIJrDaq5lBxybVA49RjPNAkVrTywQbpcofpQlJyKPdWIU/5fJaYnGPHfSIpPOGNZhn
 9ar6LoLx849OSnbhlshBaC9NUYYNUCzP5TuALeHpJDu8UJ0jHfGxT+aKSoJ4zj8qicpC
 HdBr7bd+/VSfH2f6BY3xSeb2+O5/LEuX8gxXbrVBB3JaHelEOyFpYCxkRCdJdkjcJY+u
 4jQOgONdVYFxcXfv8cKKRI/w9gwiYyqvfRl4ugVln/1NA3yxkOeHDfxN8zu1H4X2mCYc
 nZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbQLDgQV6VvX5+WpuSOCf9tnLATz5FQ5PTEJgS4fW8c=;
 b=tFppHYWI5PlbDolHC2jw0Uz+NU2vk4pHZqWcloUHBGKe/ef7+tEuM/WJofHa9VXgUh
 5pEMk1hpiLvDc68C646FRvLj+RsZm5kmK3iFTLZQtNYBUuv4pCHqbhSgO9AhbzDr1Ztk
 MSmTGXEv07fXCEJMAkgrNZNjrYfc+lgvsaipgG7psG3J6h0XGKEjpbGUxMg8oRt/nLiY
 H3tZQdRz79s4LVQJR10T7M2g5Tcca6HoEkv3zm36ERaNSCA/nS7ohOQOrSr/3HJAmp7q
 Vi+t1yfMSTnqkuDgUBlLjMtbi1092cgUjEE5bvEw/jqWm0g5Vc32tv09nKTJunrlsjh5
 4KEw==
X-Gm-Message-State: AOAM5303gNoWIcq87sM+KiIU4jt5QWt5nHIMneKvtNcTy5FLpGCy9ePj
 2kR81tDaeL/MlLkCnHB3iFAS0i/iF9v7QuKF
X-Received: by 2002:a05:600c:2248:: with SMTP id
 a8mr45755wmm.141.1626183470092; 
 Tue, 13 Jul 2021 06:37:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 28/34] target/arm: Implement MVE VMAXA, VMINA
Date: Tue, 13 Jul 2021 14:37:20 +0100
Message-Id: <20210713133726.26842-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSIPW9a2nqMT

Implement the MVE VMAXA and VMINA insns, which take the absolute
value of the signed elements in the input vector and then accumulate
the unsigned max or min into the destination vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 69f0474f6a3..c36640e75e9 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -88,6 +88,14 @@ DEF_HELPER_FLAGS_3(mve_vqnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vqnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vqnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vmaxab, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmaxah, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmaxaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vminab, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vminah, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vminaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1d38dd8dba3..3899937f033 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -156,6 +156,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VQMOVUNB       111 0 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
   VQMOVN_BS      111 0 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
 
+  VMAXA          111 0 1110 0 . 11 .. 11 ... 0 1110 1 0 . 0 ... 1 @1op
+
   VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -176,6 +178,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VQMOVUNT       111 0 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
   VQMOVN_TS      111 0 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
 
+  VMINA          111 0 1110 0 . 11 .. 11 ... 1 1110 1 0 . 0 ... 1 @1op
+
   VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3b3695885ef..40e652229d6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2250,3 +2250,29 @@ DO_1OP_SAT(vqabsw, 4, int32_t, DO_VQABS_W)
 DO_1OP_SAT(vqnegb, 1, int8_t, DO_VQNEG_B)
 DO_1OP_SAT(vqnegh, 2, int16_t, DO_VQNEG_H)
 DO_1OP_SAT(vqnegw, 4, int32_t, DO_VQNEG_W)
+
+/*
+ * VMAXA, VMINA: vd is unsigned; vm is signed, and we take its
+ * absolute value; we then do an unsigned comparison.
+ */
+#define DO_VMAXMINA(OP, ESIZE, STYPE, UTYPE, FN)                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        UTYPE *d = vd;                                                  \
+        STYPE *m = vm;                                                  \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            UTYPE r = DO_ABS(m[H##ESIZE(e)]);                           \
+            r = FN(d[H##ESIZE(e)], r);                                  \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VMAXMINA(vmaxab, 1, int8_t, uint8_t, DO_MAX)
+DO_VMAXMINA(vmaxah, 2, int16_t, uint16_t, DO_MAX)
+DO_VMAXMINA(vmaxaw, 4, int32_t, uint32_t, DO_MAX)
+DO_VMAXMINA(vminab, 1, int8_t, uint8_t, DO_MIN)
+DO_VMAXMINA(vminah, 2, int16_t, uint16_t, DO_MIN)
+DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 59e09f58a8c..f243c34bd21 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -277,6 +277,8 @@ DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
 DO_1OP(VQABS, vqabs)
 DO_1OP(VQNEG, vqneg)
+DO_1OP(VMAXA, vmaxa)
+DO_1OP(VMINA, vmina)
 
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
-- 
2.20.1

