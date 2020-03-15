Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2153535lfc;
        Sun, 15 Mar 2020 13:58:54 -0700 (PDT)
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr22015980pjv.100.1584305934508;
        Sun, 15 Mar 2020 13:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584305934; cv=none;
        d=google.com; s=arc-20160816;
        b=V+cn6oVSeUQvze5kXGYfdClG8D3n8dXtyy54bQjDVpohhHp4r7DmqSdOar6txH5vXX
         /pA4R+KGzQxWeGTgpstzZ0gvJz66zWZIKKw1RgRyfnlR2ZnbXyGsGQxUXfTKqH78TSjP
         liNYthkRbxzfanDQgnxAvzOPqfOooF5MoNKMRGi+aHguJSPW9WZhWtJhEqTf5kq+OSiF
         El4CKZEGIfkCpdR3faWQR1pcjAPRDfo0zdf47ce4CIE268/yZf8nwUArNxpiW+Ej1a4E
         ZPPgSevx6zCMnkTsVl6NL0Y75at9rc0d0fZguBCBABhag1DNJ0/dFlMowqd7ChslszB8
         LpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=46o/ONBElt4xz1c1CIj6X0D90fesls/AxPAELovCv6M=;
        b=GOEZZ9805yy8ymLkxAAWmLR7gl/0PbUpJzwKCvAoNIltBx/Y5oiDHRp+/tLFLnT20K
         dV1+kogbiiHVuF1aUA+81AqxVppr7+GcW2ou+dReNUDM8r04XptcJ6BTXNZi4FXPqnm0
         1/wrs/BFch6fGYH99nLiRCgiX/drDiLOI31JAq5EQLyTqJ+fVK8g37ZUM4h4SI2MGYGf
         mKZnK8Fn0IZ2HW0jsfWxXNIk26f6qMolsl2SuyhVn52gJJWps52vpgwvNLlXkEnp4rlH
         Ib467CJbIAQ7GrOk181clIFyv3XSuB/k97eY/4Z88TCHuHfNeZUzMF07cvMuRSvOaKW1
         FAEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beuzvKoD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d18sor18503723pgv.71.2020.03.15.13.58.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beuzvKoD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=46o/ONBElt4xz1c1CIj6X0D90fesls/AxPAELovCv6M=;
        b=beuzvKoDC75VH7UNjQws+RdesRD92SfyW75GKrCaK7QjuygqdcGxRgrDZGS4Pvu7lo
         Lmf4RqExOPnV8He1qxQBy8ydKAgX4ucRuM0sqSN/MRWohAR8pzHJ9LB1SH2tCEpPANYI
         kRJUlkrQLGdA2nukcUpePgB0+u4oQMCi0TMVu+fIbqTI7elmKc7cvoTZcL1nTSXlsA5/
         ieYAj6v1iTZ0kOfyiuUvAqdTUvysqNZZmKyhgeFwKLDSLgHYIT+hOltOauIQETPM0uNJ
         zpDtJVn8tv7hgM8109m8qV+qEnVjd63gFyAKyKkZt4DHyf0gQWuHBVHxSvJ3I5QWjAeD
         HkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=46o/ONBElt4xz1c1CIj6X0D90fesls/AxPAELovCv6M=;
        b=dJW242WCIH6ad1deMfclsYRmtrUKipnMdArCH7Xt/6rE9mpjoddrfzi+Uwg7zIT97s
         /vWk9ArBYFjd3M/WfoBKXzsTnT8sAwBv7TIWDAzMfCXGt3e5wVgVOsPSIEOg5SHqflJP
         R+ZWOvPieruTjAx7iuiMyi20GQcDpEyOiZbDLHCNfCBvI7CmX6gp6HsJskEvkxd2JW+Z
         QX/9lWUQh4iym6XcGv5AoRCtVTIWMaGKMbpntZDp/4143bGLBazFw8IDFxMSVMl1A7CL
         XJqPMuieCaGWCqEKmii6zM0Uk/W2aHNkqIf2MSXsEwKnWPpnWbQnj76jUf8uent7IX6h
         opSw==
X-Gm-Message-State: ANhLgQ0h55mIY2I0i/nkgbCY4rmU2rx4MJtA0Q3s9TZhgfhQ1bMjEyvG
	LeOQbSNIeOE5no97jfAwvJGLrS8sW4Abjg==
X-Google-Smtp-Source: ADFU+vuH+GQ26/mXaVla95hbCh0V8fbYg6W7lEnye3eJE96b+uMuEcHHOxBBh2u4O3UycTt8LkdkHw==
X-Received: by 2002:a63:3407:: with SMTP id b7mr24218368pga.163.1584305933622;
        Sun, 15 Mar 2020 13:58:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id w6sm2802641pfn.104.2020.03.15.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 13:58:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v2] target/arm: Use tcg_gen_gvec_5_ptr for sve FMLA/FCMLA
Date: Sun, 15 Mar 2020 13:58:51 -0700
Message-Id: <20200315205851.13082-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lgfYCUx2r3iE

Now that we can pass 7 parameters, do not encode register
operands within simd_data.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Remove gen_helper_sve_fmla typedef (phil).
---
 target/arm/helper-sve.h    |  45 +++++++----
 target/arm/sve_helper.c    | 157 ++++++++++++++-----------------------
 target/arm/translate-sve.c |  70 ++++++-----------
 3 files changed, 114 insertions(+), 158 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2f47279155..7a200755ac 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1099,25 +1099,40 @@ DEF_HELPER_FLAGS_6(sve_fcadd_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fcadd_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fdfa652094..33b5a54a47 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3372,23 +3372,11 @@ DO_ZPZ_FP(sve_ucvt_dd, uint64_t,     , uint64_to_float64)
 
 #undef DO_ZPZ_FP
 
-/* 4-operand predicated multiply-add.  This requires 7 operands to pass
- * "properly", so we need to encode some of the registers into DESC.
- */
-QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 20 > 32);
-
-static void do_fmla_zpzzz_h(CPUARMState *env, void *vg, uint32_t desc,
+static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
+                            float_status *status, uint32_t desc,
                             uint16_t neg1, uint16_t neg3)
 {
     intptr_t i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     do {
@@ -3401,45 +3389,42 @@ static void do_fmla_zpzzz_h(CPUARMState *env, void *vg, uint32_t desc,
                 e1 = *(uint16_t *)(vn + H1_2(i)) ^ neg1;
                 e2 = *(uint16_t *)(vm + H1_2(i));
                 e3 = *(uint16_t *)(va + H1_2(i)) ^ neg3;
-                r = float16_muladd(e1, e2, e3, 0, &env->vfp.fp_status_f16);
+                r = float16_muladd(e1, e2, e3, 0, status);
                 *(uint16_t *)(vd + H1_2(i)) = r;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0);
 }
 
-void HELPER(sve_fmls_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0x8000, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0);
 }
 
-void HELPER(sve_fnmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0x8000, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000);
 }
 
-void HELPER(sve_fnmls_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000);
 }
 
-static void do_fmla_zpzzz_s(CPUARMState *env, void *vg, uint32_t desc,
+static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
+                            float_status *status, uint32_t desc,
                             uint32_t neg1, uint32_t neg3)
 {
     intptr_t i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     do {
@@ -3452,45 +3437,42 @@ static void do_fmla_zpzzz_s(CPUARMState *env, void *vg, uint32_t desc,
                 e1 = *(uint32_t *)(vn + H1_4(i)) ^ neg1;
                 e2 = *(uint32_t *)(vm + H1_4(i));
                 e3 = *(uint32_t *)(va + H1_4(i)) ^ neg3;
-                r = float32_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                r = float32_muladd(e1, e2, e3, 0, status);
                 *(uint32_t *)(vd + H1_4(i)) = r;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0);
 }
 
-void HELPER(sve_fmls_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0x80000000, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0);
 }
 
-void HELPER(sve_fnmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0x80000000, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000);
 }
 
-void HELPER(sve_fnmls_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000);
 }
 
-static void do_fmla_zpzzz_d(CPUARMState *env, void *vg, uint32_t desc,
+static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
+                            float_status *status, uint32_t desc,
                             uint64_t neg1, uint64_t neg3)
 {
     intptr_t i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     do {
@@ -3503,31 +3485,35 @@ static void do_fmla_zpzzz_d(CPUARMState *env, void *vg, uint32_t desc,
                 e1 = *(uint64_t *)(vn + i) ^ neg1;
                 e2 = *(uint64_t *)(vm + i);
                 e3 = *(uint64_t *)(va + i) ^ neg3;
-                r = float64_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                r = float64_muladd(e1, e2, e3, 0, status);
                 *(uint64_t *)(vd + i) = r;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, 0, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0);
 }
 
-void HELPER(sve_fmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, INT64_MIN, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0);
 }
 
-void HELPER(sve_fnmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, INT64_MIN, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN);
 }
 
-void HELPER(sve_fnmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, 0, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN);
 }
 
 /* Two operand floating-point comparison controlled by a predicate.
@@ -3809,22 +3795,13 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
  * FP Complex Multiply
  */
 
-QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 22 > 32);
-
-void HELPER(sve_fcmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fcmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
     intptr_t j, i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    unsigned rot = simd_data(desc);
     bool flip = rot & 1;
     float16 neg_imag, neg_real;
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     neg_imag = float16_set_sign(0, (rot & 2) != 0);
@@ -3851,32 +3828,25 @@ void HELPER(sve_fcmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
 
             if (likely((pg >> (i & 63)) & 1)) {
                 d = *(float16 *)(va + H1_2(i));
-                d = float16_muladd(e2, e1, d, 0, &env->vfp.fp_status_f16);
+                d = float16_muladd(e2, e1, d, 0, status);
                 *(float16 *)(vd + H1_2(i)) = d;
             }
             if (likely((pg >> (j & 63)) & 1)) {
                 d = *(float16 *)(va + H1_2(j));
-                d = float16_muladd(e4, e3, d, 0, &env->vfp.fp_status_f16);
+                d = float16_muladd(e4, e3, d, 0, status);
                 *(float16 *)(vd + H1_2(j)) = d;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fcmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fcmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
     intptr_t j, i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    unsigned rot = simd_data(desc);
     bool flip = rot & 1;
     float32 neg_imag, neg_real;
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     neg_imag = float32_set_sign(0, (rot & 2) != 0);
@@ -3903,32 +3873,25 @@ void HELPER(sve_fcmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
 
             if (likely((pg >> (i & 63)) & 1)) {
                 d = *(float32 *)(va + H1_2(i));
-                d = float32_muladd(e2, e1, d, 0, &env->vfp.fp_status);
+                d = float32_muladd(e2, e1, d, 0, status);
                 *(float32 *)(vd + H1_2(i)) = d;
             }
             if (likely((pg >> (j & 63)) & 1)) {
                 d = *(float32 *)(va + H1_2(j));
-                d = float32_muladd(e4, e3, d, 0, &env->vfp.fp_status);
+                d = float32_muladd(e4, e3, d, 0, status);
                 *(float32 *)(vd + H1_2(j)) = d;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fcmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
     intptr_t j, i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    unsigned rot = simd_data(desc);
     bool flip = rot & 1;
     float64 neg_imag, neg_real;
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     neg_imag = float64_set_sign(0, (rot & 2) != 0);
@@ -3955,12 +3918,12 @@ void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
 
             if (likely((pg >> (i & 63)) & 1)) {
                 d = *(float64 *)(va + H1_2(i));
-                d = float64_muladd(e2, e1, d, 0, &env->vfp.fp_status);
+                d = float64_muladd(e2, e1, d, 0, status);
                 *(float64 *)(vd + H1_2(i)) = d;
             }
             if (likely((pg >> (j & 63)) & 1)) {
                 d = *(float64 *)(va + H1_2(j));
-                d = float64_muladd(e4, e3, d, 0, &env->vfp.fp_status);
+                d = float64_muladd(e4, e3, d, 0, status);
                 *(float64 *)(vd + H1_2(j)) = d;
             }
         } while (i & 63);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b35bad245e..8d6b971d50 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3948,42 +3948,30 @@ static bool trans_FCADD(DisasContext *s, arg_FCADD *a)
     return true;
 }
 
-typedef void gen_helper_sve_fmla(TCGv_env, TCGv_ptr, TCGv_i32);
-
-static bool do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
+static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
+                    gen_helper_gvec_5_ptr *fn)
 {
-    if (fn == NULL) {
+    if (a->esz == 0) {
         return false;
     }
-    if (!sve_access_check(s)) {
-        return true;
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
     }
-
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned desc;
-    TCGv_i32 t_desc;
-    TCGv_ptr pg = tcg_temp_new_ptr();
-
-    /* We would need 7 operands to pass these arguments "properly".
-     * So we encode all the register numbers into the descriptor.
-     */
-    desc = deposit32(a->rd, 5, 5, a->rn);
-    desc = deposit32(desc, 10, 5, a->rm);
-    desc = deposit32(desc, 15, 5, a->ra);
-    desc = simd_desc(vsz, vsz, desc);
-
-    t_desc = tcg_const_i32(desc);
-    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
-    fn(cpu_env, pg, t_desc);
-    tcg_temp_free_i32(t_desc);
-    tcg_temp_free_ptr(pg);
     return true;
 }
 
 #define DO_FMLA(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a)          \
 {                                                                    \
-    static gen_helper_sve_fmla * const fns[4] = {                    \
+    static gen_helper_gvec_5_ptr * const fns[4] = {                  \
         NULL, gen_helper_sve_##name##_h,                             \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d         \
     };                                                               \
@@ -3999,7 +3987,8 @@ DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
 
 static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
 {
-    static gen_helper_sve_fmla * const fns[3] = {
+    static gen_helper_gvec_5_ptr * const fns[4] = {
+        NULL,
         gen_helper_sve_fcmla_zpzzz_h,
         gen_helper_sve_fcmla_zpzzz_s,
         gen_helper_sve_fcmla_zpzzz_d,
@@ -4010,25 +3999,14 @@ static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        unsigned desc;
-        TCGv_i32 t_desc;
-        TCGv_ptr pg = tcg_temp_new_ptr();
-
-        /* We would need 7 operands to pass these arguments "properly".
-         * So we encode all the register numbers into the descriptor.
-         */
-        desc = deposit32(a->rd, 5, 5, a->rn);
-        desc = deposit32(desc, 10, 5, a->rm);
-        desc = deposit32(desc, 15, 5, a->ra);
-        desc = deposit32(desc, 20, 2, a->rot);
-        desc = sextract32(desc, 0, 22);
-        desc = simd_desc(vsz, vsz, desc);
-
-        t_desc = tcg_const_i32(desc);
-        tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
-        fns[a->esz - 1](cpu_env, pg, t_desc);
-        tcg_temp_free_i32(t_desc);
-        tcg_temp_free_ptr(pg);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, a->rot, fns[a->esz]);
+        tcg_temp_free_ptr(status);
     }
     return true;
 }
-- 
2.20.1
