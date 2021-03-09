Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954882lfg;
        Tue, 9 Mar 2021 08:20:53 -0800 (PST)
X-Received: by 2002:aca:6289:: with SMTP id w131mr3402656oib.69.1615306853080;
        Tue, 09 Mar 2021 08:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306853; cv=none;
        d=google.com; s=arc-20160816;
        b=EyJr8yCM34XSnC+SQKjynsmFvCZC086rOtlvPY8Hk/vhvUxLHWQylL7u2k2t7WFm1W
         1Z265g7bKoifI3VJ4n8x46NWSlrnwkS61+uUw+iaRNO2pzKnLnRAadCBEcT/3oqNI5lO
         D5UXqOlcFd0aD58Qw7hEY5CFSnrEqXvEE2M2+U5DFS2z6Z3XjQupfvWCQVRcp5MnGnG+
         H5r5dMgisneL9Gs3xS42fjKaqxo8DSgQSPiEc4Z3fNPBA7qxFxrc1SFq7mbT2qxhs1MB
         Ca46ecJHaIhdRfn6EmdAnnlHz96NFJZP7r7Ylev8Z0MqONXXisNtEXRg0SoXG1oek89u
         oL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+s4Ex6WJ2oxr+RR4s+3+c7rbv+0uvqpEzs763JIOfME=;
        b=iMqHu4TKwnsA+0VfiwCjQWs4mpSK3YjwZKm4suovRH8b1VdAvAoBME5c0Nit9O1xj+
         siijubbAGRjKJMu7HRhlG4cGf9IVlwub/fSJOhhRShgBoH7DjNha+QGIo8IXAYdL0HSo
         nRsXEdKN5k4l3G9ZhdRj7OEN3bTLQZWB6oEVj5hdNBMbuoUpnovnI8fHjWdh+H5lwlb6
         H8GwvG5Meb7FQkfkk6Uo9/Z6sVJjQ/4sgBIpFOSZpmZ3Tk8dOzEvCafwQl4VuBXDo5DI
         FR9XF61v9n1LImp30zIojnjLlIK4UZqR1xt8o3ZW+Da2XLB7xgF9YH3XmuOT8x0604Os
         FpVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4Y7ubhR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e17sor3304998otf.4.2021.03.09.08.20.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4Y7ubhR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+s4Ex6WJ2oxr+RR4s+3+c7rbv+0uvqpEzs763JIOfME=;
        b=y4Y7ubhRzzGM1uGSydXZo2o0+lJ90YagFX3foXSRID0URQ0J74P8ndPTmRtiILXyhu
         oGQUUFULMICx8mmPle8AOg8u5XXY8kux2Ba+5jiToj3FKSD2SO68TqTwT1jFhLNRTAta
         7CbXdMFN5GmHMJVCOr7JqMS5nN61sa25BttreG7d1EjnA3rHa9FMPuakAcq7tnNce44t
         Lp1g26I+z0KyOJB+jIXTwXiJsmRspOp2hTYgwlgAlR8J8fOQDYiHPDR5EDjQUhk66BpP
         Kaq1ybRY36zTwookMlKr7UEti333D+c9maEuFmC9z2X+HgQqIPhuFuveoP2BOr2nj/OY
         ee0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+s4Ex6WJ2oxr+RR4s+3+c7rbv+0uvqpEzs763JIOfME=;
        b=tF56S+NlXmsqS+v+kkigwcx7aaBuUE67yiBT+7vXfA2HzvR0jGNOYTmy4AxQPoKUPT
         gAW2NvDh+nfidpDllseL+TCM9TgcpXw+K40fPDWXH+epgMXc51HKnOAxY2R05Y5ZIch0
         ScGD7TKRAJozmQqyAbl9UCD+BrybU056KWUpnpGdn3/Cp8L6RvtA98nzkjb+2nSYU2FF
         X8TfifwYZ5VH5Pei/9UMt5yZ3jDFyuGVOeulk2agDznOudFsodBN+PLtswz/1igevSQo
         Eotr5m3hf6EJ24LBj/IvdwghGuQQf9SXgvdcXTKk0kC+nMUAt9pxIF9z1ZUFN4R7hxtZ
         sqag==
X-Gm-Message-State: AOAM5335+Czz7gQYehnjt/XfRhVMZoVzGW0VmV/kfLB5iEe/dzv3W2k2
	aYoy49hbguCbV/Z21+ahNcXjbLR7MPAQ/DiybgU=
X-Google-Smtp-Source: ABdhPJx//UKWHYwfdSYC04Xn9/AU0oqB2gP31vr/Nb4CaYH4WvRNbAm+NH2iWdzfGWg0AYNO4fE3cA==
X-Received: by 2002:a05:6830:558:: with SMTP id l24mr24494637otb.209.1615306852671;
        Tue, 09 Mar 2021 08:20:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 08/78] target/arm: Implement SVE2 integer pairwise arithmetic
Date: Tue,  9 Mar 2021 08:19:31 -0800
Message-Id: <20210309162041.23124-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4HkYwWEu8wRH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 45 ++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/sve_helper.c    | 76 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  6 +++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5fdc0d223a..09bc067dd4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -326,6 +326,51 @@ DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 58c3f7ede4..61a3321325 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1140,3 +1140,11 @@ SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
 URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
 SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
 UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
+
+### SVE2 integer pairwise arithmetic
+
+ADDP            01000100 .. 010 001 101 ... ..... .....  @rdn_pg_rm
+SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
+UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
+SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
+UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a7a934f3a4..19ae7722f0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -681,6 +681,82 @@ DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/*
+ * Three operand expander, operating on element pairs.
+ * If the slot I is even, the elements from from VN {I, I+1}.
+ * If the slot I is odd, the elements from from VM {I-1, I}.
+ * Load all of the input elements in each pair before overwriting output.
+ */
+#define DO_ZPZZ_PAIR(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    for (i = 0; i < opr_sz; ) {                                 \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
+        do {                                                    \
+            TYPE n0 = *(TYPE *)(vn + H(i));                     \
+            TYPE m0 = *(TYPE *)(vm + H(i));                     \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));      \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));      \
+            if (pg & 1) {                                       \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1);              \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+            if (pg & 1) {                                       \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1);              \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+        } while (i & 15);                                       \
+    }                                                           \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZZ_PAIR_D(NAME, TYPE, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn, *m = vm;                             \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 2) {                           \
+        TYPE n0 = n[i], n1 = n[i + 1];                          \
+        TYPE m0 = m[i], m1 = m[i + 1];                          \
+        if (pg[H1(i)] & 1) {                                    \
+            d[i] = OP(n0, n1);                                  \
+        }                                                       \
+        if (pg[H1(i + 1)] & 1) {                                \
+            d[i + 1] = OP(m0, m1);                              \
+        }                                                       \
+    }                                                           \
+}
+
+DO_ZPZZ_PAIR(sve2_addp_zpzz_b, uint8_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_h, uint16_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_s, uint32_t, H1_4, DO_ADD)
+DO_ZPZZ_PAIR_D(sve2_addp_zpzz_d, uint64_t, DO_ADD)
+
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_b, uint8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_h, uint16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_s, uint32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_umaxp_zpzz_d, uint64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_b, uint8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_h, uint16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_s, uint32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_uminp_zpzz_d, uint64_t, DO_MIN)
+
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_b, int8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_h, int16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_s, int32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_smaxp_zpzz_d, int64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_b, int8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_h, int16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_s, int32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
+
+#undef DO_ZPZZ_PAIR
+#undef DO_ZPZZ_PAIR_D
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 07e1315cca..0675abf1d8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5958,3 +5958,9 @@ DO_SVE2_ZPZZ(SHSUB, shsub)
 DO_SVE2_ZPZZ(UHADD, uhadd)
 DO_SVE2_ZPZZ(URHADD, urhadd)
 DO_SVE2_ZPZZ(UHSUB, uhsub)
+
+DO_SVE2_ZPZZ(ADDP, addp)
+DO_SVE2_ZPZZ(SMAXP, smaxp)
+DO_SVE2_ZPZZ(UMAXP, umaxp)
+DO_SVE2_ZPZZ(SMINP, sminp)
+DO_SVE2_ZPZZ(UMINP, uminp)
-- 
2.25.1
