Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4020877lfm;
        Mon, 24 May 2021 18:12:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyya2yhm0S+KR/mpKRZz1r8cG8xdFCL05pD8iJlk5O9A9REo3zgaDkB5D/e64E+IMroQ9rg
X-Received: by 2002:a05:6638:258c:: with SMTP id s12mr26676965jat.92.1621905158192;
        Mon, 24 May 2021 18:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905158; cv=none;
        d=google.com; s=arc-20160816;
        b=thcmQEdMRJal8Ku/jor2R1c/DVN8ay8gwnehVfLCDdw0sxiKefFWZHEjCi9RA/03I1
         PpDD+sqNjOHorIWl6JRuhNo71/4opZ+OtA4Pv4R1dRrYn3qSOnaP3+s5S7tWnTZvH+if
         OcBUXv+bS6IyU2KNuayCjUSurML5nm57qtz/mCEtA46kC/c2m1gcp9hlk21lONAkT5Pa
         SukSUWB7dQV7A/9o1EmN2+fi+3xTE0q/LBdEO6tUUe0/7vln+E2beRH4sJ7AGdlig6LY
         UuA0CQSrkY/WaRFilSurkT2DSgQXocBbaLnqTcJtDlGRcBfJP8SKSF8JXQxMHixUsdYi
         iXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kTQFUYPN2TBKMrZb2fo1xu1LqT0RL2Q/8a0Tw7EkkbU=;
        b=B1VjUlUFGMNTfYkIa8C9kd5wIwCquMFEKO4G9Ouqspqs/RKJXhV/laHa7VVh6O1L78
         g5030sQpoNyHWCbA2vTgtL+HpO7uJsYUEGd8gJLIMCroohvfccGEHF+EbjZYwxnrlOR9
         iEazHyHwmvI7Iqeoks7roh8RaHh67lvCqNn2RTO8vMwsZqTqkvLbe9I8QvvFMoettlQK
         a27TZPRlqFNB+NXl8LBIQ6STujC+OIrp7G2kvEENi/BmlJpTVJPZm6p8FSB21LlBXNiI
         GB9ocLlufeZThUD0vVbsSQqLbfGIb0t6GrDXYF3x9MJrPTmV2Mld/UXKYfafI/MI5ro/
         yFXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiSPhn9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si16595731jan.123.2021.05.24.18.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiSPhn9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLcb-0000RF-Cw
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUf-0001kl-RK
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:27 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUM-0001gL-Qa
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:24 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b7so11343182plg.0
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTQFUYPN2TBKMrZb2fo1xu1LqT0RL2Q/8a0Tw7EkkbU=;
 b=QiSPhn9VDpajOP72zlOCP29CDjZaLMpAq2FejhvEFsA+RAD/iZ6PkUjTfUbl6d/dCK
 myZlBY5Oige9YxjBuJ0wNubYokYALQ7Bu2qqFEnonH8yXaLvjm/5bNkFL8RHPbtulBgC
 7W2s0lZr90VNIxB3P4iOBnrNwJH0uVYHJIpMIMsymM4OAp5l1tS/G1kJblDFarBXRWvo
 QA2XmmUxm8vudJcgS5P5lnVOBLkOymke1U9+X49nnEKmtVTxyV5hp9sw2xh4vSOeG7Kz
 Wv6Rc8EEVN+PS55ohxZUS37iFgWRV4BpUMue51EYhkrWPX5y9pFVsOoiAiKFDGgGPflj
 H61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTQFUYPN2TBKMrZb2fo1xu1LqT0RL2Q/8a0Tw7EkkbU=;
 b=GuZU7PMvR3bgZEzhT+nbd1W3JVCJsx/LDwow7y4UegRfnoDNfwkgCYUzhlpOGUwYwd
 M0gHGwdOdsh5nZmdL6H7PkgcDxS14S++ozjMC9OzimZ9EErKtKcHVis16IfaNrEo6/9x
 YLva6x/lxjPdh7ANYxKqHWk4JRroL4UehPbfP1jh+FgJp0Nm7orokGCPFzgxf/ZBJtUf
 pBTDDco/diqTi2G0J4pIEAj+008NMmxXjs6iCg33i+R0uFVOY0F9bpgar3p9EQoCfadD
 TVjm0WnHIKgZGMZdbWQ1q3KohTygJLQYmAa6O7dJeaeRiQ8lqfiL+sDHXVTtlIOMSsIS
 GzYg==
X-Gm-Message-State: AOAM5305+VwInh+7KTsLjBN6uGI+FYrdpjthgrsO+6cqccCVJpa9X0Wt
 tIpJ3tJx8lmDt+qIOGEEd1OrNA==
X-Received: by 2002:a17:90a:3841:: with SMTP id
 l1mr2049444pjf.72.1621904645261; 
 Mon, 24 May 2021 18:04:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/92] target/arm: Implement SVE2 saturating add/subtract
 (predicated)
Date: Mon, 24 May 2021 18:02:35 -0700
Message-Id: <20210525010358.152808-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yPhTyxBYx92U

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  54 +++++++++++
 target/arm/sve.decode      |  11 +++
 target/arm/sve_helper.c    | 194 ++++++++++++++++++++++++++-----------
 target/arm/translate-sve.c |   7 ++
 4 files changed, 210 insertions(+), 56 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 09bc067dd4..37461c9927 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -371,6 +371,60 @@ DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 61a3321325..cd4f73265f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1148,3 +1148,14 @@ SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
 UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
 SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
 UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
+
+### SVE2 saturating add/subtract (predicated)
+
+SQADD_zpzz      01000100 .. 011 000 100 ... ..... .....  @rdn_pg_rm
+UQADD_zpzz      01000100 .. 011 001 100 ... ..... .....  @rdn_pg_rm
+SQSUB_zpzz      01000100 .. 011 010 100 ... ..... .....  @rdn_pg_rm
+UQSUB_zpzz      01000100 .. 011 011 100 ... ..... .....  @rdn_pg_rm
+SUQADD          01000100 .. 011 100 100 ... ..... .....  @rdn_pg_rm
+USQADD          01000100 .. 011 101 100 ... ..... .....  @rdn_pg_rm
+SQSUB_zpzz      01000100 .. 011 110 100 ... ..... .....  @rdm_pg_rn # SQSUBR
+UQSUB_zpzz      01000100 .. 011 111 100 ... ..... .....  @rdm_pg_rn # UQSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7406368095..1f1783b8f3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -687,6 +687,135 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
 DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
 DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 
+static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max)
+{
+    return val >= max ? max : val <= min ? min : val;
+}
+
+#define DO_SQADD_B(n, m) do_sat_bhs((int64_t)n + m, INT8_MIN, INT8_MAX)
+#define DO_SQADD_H(n, m) do_sat_bhs((int64_t)n + m, INT16_MIN, INT16_MAX)
+#define DO_SQADD_S(n, m) do_sat_bhs((int64_t)n + m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_sqadd_d(int64_t n, int64_t m)
+{
+    int64_t r = n + m;
+    if (((r ^ n) & ~(n ^ m)) < 0) {
+        /* Signed overflow.  */
+        return r < 0 ? INT64_MAX : INT64_MIN;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_sqadd_zpzz_b, int8_t, H1, DO_SQADD_B)
+DO_ZPZZ(sve2_sqadd_zpzz_h, int16_t, H1_2, DO_SQADD_H)
+DO_ZPZZ(sve2_sqadd_zpzz_s, int32_t, H1_4, DO_SQADD_S)
+DO_ZPZZ_D(sve2_sqadd_zpzz_d, int64_t, do_sqadd_d)
+
+#define DO_UQADD_B(n, m) do_sat_bhs((int64_t)n + m, 0, UINT8_MAX)
+#define DO_UQADD_H(n, m) do_sat_bhs((int64_t)n + m, 0, UINT16_MAX)
+#define DO_UQADD_S(n, m) do_sat_bhs((int64_t)n + m, 0, UINT32_MAX)
+
+static inline uint64_t do_uqadd_d(uint64_t n, uint64_t m)
+{
+    uint64_t r = n + m;
+    return r < n ? UINT64_MAX : r;
+}
+
+DO_ZPZZ(sve2_uqadd_zpzz_b, uint8_t, H1, DO_UQADD_B)
+DO_ZPZZ(sve2_uqadd_zpzz_h, uint16_t, H1_2, DO_UQADD_H)
+DO_ZPZZ(sve2_uqadd_zpzz_s, uint32_t, H1_4, DO_UQADD_S)
+DO_ZPZZ_D(sve2_uqadd_zpzz_d, uint64_t, do_uqadd_d)
+
+#define DO_SQSUB_B(n, m) do_sat_bhs((int64_t)n - m, INT8_MIN, INT8_MAX)
+#define DO_SQSUB_H(n, m) do_sat_bhs((int64_t)n - m, INT16_MIN, INT16_MAX)
+#define DO_SQSUB_S(n, m) do_sat_bhs((int64_t)n - m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_sqsub_d(int64_t n, int64_t m)
+{
+    int64_t r = n - m;
+    if (((r ^ n) & (n ^ m)) < 0) {
+        /* Signed overflow.  */
+        return r < 0 ? INT64_MAX : INT64_MIN;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_sqsub_zpzz_b, int8_t, H1, DO_SQSUB_B)
+DO_ZPZZ(sve2_sqsub_zpzz_h, int16_t, H1_2, DO_SQSUB_H)
+DO_ZPZZ(sve2_sqsub_zpzz_s, int32_t, H1_4, DO_SQSUB_S)
+DO_ZPZZ_D(sve2_sqsub_zpzz_d, int64_t, do_sqsub_d)
+
+#define DO_UQSUB_B(n, m) do_sat_bhs((int64_t)n - m, 0, UINT8_MAX)
+#define DO_UQSUB_H(n, m) do_sat_bhs((int64_t)n - m, 0, UINT16_MAX)
+#define DO_UQSUB_S(n, m) do_sat_bhs((int64_t)n - m, 0, UINT32_MAX)
+
+static inline uint64_t do_uqsub_d(uint64_t n, uint64_t m)
+{
+    return n > m ? n - m : 0;
+}
+
+DO_ZPZZ(sve2_uqsub_zpzz_b, uint8_t, H1, DO_UQSUB_B)
+DO_ZPZZ(sve2_uqsub_zpzz_h, uint16_t, H1_2, DO_UQSUB_H)
+DO_ZPZZ(sve2_uqsub_zpzz_s, uint32_t, H1_4, DO_UQSUB_S)
+DO_ZPZZ_D(sve2_uqsub_zpzz_d, uint64_t, do_uqsub_d)
+
+#define DO_SUQADD_B(n, m) \
+    do_sat_bhs((int64_t)(int8_t)n + m, INT8_MIN, INT8_MAX)
+#define DO_SUQADD_H(n, m) \
+    do_sat_bhs((int64_t)(int16_t)n + m, INT16_MIN, INT16_MAX)
+#define DO_SUQADD_S(n, m) \
+    do_sat_bhs((int64_t)(int32_t)n + m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_suqadd_d(int64_t n, uint64_t m)
+{
+    uint64_t r = n + m;
+
+    if (n < 0) {
+        /* Note that m - abs(n) cannot underflow. */
+        if (r > INT64_MAX) {
+            /* Result is either very large positive or negative. */
+            if (m > -n) {
+                /* m > abs(n), so r is a very large positive. */
+                return INT64_MAX;
+            }
+            /* Result is negative. */
+        }
+    } else {
+        /* Both inputs are positive: check for overflow.  */
+        if (r < m || r > INT64_MAX) {
+            return INT64_MAX;
+        }
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_suqadd_zpzz_b, uint8_t, H1, DO_SUQADD_B)
+DO_ZPZZ(sve2_suqadd_zpzz_h, uint16_t, H1_2, DO_SUQADD_H)
+DO_ZPZZ(sve2_suqadd_zpzz_s, uint32_t, H1_4, DO_SUQADD_S)
+DO_ZPZZ_D(sve2_suqadd_zpzz_d, uint64_t, do_suqadd_d)
+
+#define DO_USQADD_B(n, m) \
+    do_sat_bhs((int64_t)n + (int8_t)m, 0, UINT8_MAX)
+#define DO_USQADD_H(n, m) \
+    do_sat_bhs((int64_t)n + (int16_t)m, 0, UINT16_MAX)
+#define DO_USQADD_S(n, m) \
+    do_sat_bhs((int64_t)n + (int32_t)m, 0, UINT32_MAX)
+
+static inline uint64_t do_usqadd_d(uint64_t n, int64_t m)
+{
+    uint64_t r = n + m;
+
+    if (m < 0) {
+        return n < -m ? 0 : r;
+    }
+    return r < n ? UINT64_MAX : r;
+}
+
+DO_ZPZZ(sve2_usqadd_zpzz_b, uint8_t, H1, DO_USQADD_B)
+DO_ZPZZ(sve2_usqadd_zpzz_h, uint16_t, H1_2, DO_USQADD_H)
+DO_ZPZZ(sve2_usqadd_zpzz_s, uint32_t, H1_4, DO_USQADD_S)
+DO_ZPZZ_D(sve2_usqadd_zpzz_d, uint64_t, do_usqadd_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
@@ -1623,13 +1752,7 @@ void HELPER(sve_sqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int8_t)) {
-        int r = *(int8_t *)(a + i) + b;
-        if (r > INT8_MAX) {
-            r = INT8_MAX;
-        } else if (r < INT8_MIN) {
-            r = INT8_MIN;
-        }
-        *(int8_t *)(d + i) = r;
+        *(int8_t *)(d + i) = DO_SQADD_B(b, *(int8_t *)(a + i));
     }
 }
 
@@ -1638,13 +1761,7 @@ void HELPER(sve_sqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int16_t)) {
-        int r = *(int16_t *)(a + i) + b;
-        if (r > INT16_MAX) {
-            r = INT16_MAX;
-        } else if (r < INT16_MIN) {
-            r = INT16_MIN;
-        }
-        *(int16_t *)(d + i) = r;
+        *(int16_t *)(d + i) = DO_SQADD_H(b, *(int16_t *)(a + i));
     }
 }
 
@@ -1653,13 +1770,7 @@ void HELPER(sve_sqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int32_t)) {
-        int64_t r = *(int32_t *)(a + i) + b;
-        if (r > INT32_MAX) {
-            r = INT32_MAX;
-        } else if (r < INT32_MIN) {
-            r = INT32_MIN;
-        }
-        *(int32_t *)(d + i) = r;
+        *(int32_t *)(d + i) = DO_SQADD_S(b, *(int32_t *)(a + i));
     }
 }
 
@@ -1668,13 +1779,7 @@ void HELPER(sve_sqaddi_d)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int64_t)) {
-        int64_t ai = *(int64_t *)(a + i);
-        int64_t r = ai + b;
-        if (((r ^ ai) & ~(ai ^ b)) < 0) {
-            /* Signed overflow.  */
-            r = (r < 0 ? INT64_MAX : INT64_MIN);
-        }
-        *(int64_t *)(d + i) = r;
+        *(int64_t *)(d + i) = do_sqadd_d(b, *(int64_t *)(a + i));
     }
 }
 
@@ -1687,13 +1792,7 @@ void HELPER(sve_uqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint8_t)) {
-        int r = *(uint8_t *)(a + i) + b;
-        if (r > UINT8_MAX) {
-            r = UINT8_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint8_t *)(d + i) = r;
+        *(uint8_t *)(d + i) = DO_UQADD_B(b, *(uint8_t *)(a + i));
     }
 }
 
@@ -1702,13 +1801,7 @@ void HELPER(sve_uqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint16_t)) {
-        int r = *(uint16_t *)(a + i) + b;
-        if (r > UINT16_MAX) {
-            r = UINT16_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint16_t *)(d + i) = r;
+        *(uint16_t *)(d + i) = DO_UQADD_H(b, *(uint16_t *)(a + i));
     }
 }
 
@@ -1717,13 +1810,7 @@ void HELPER(sve_uqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
-        int64_t r = *(uint32_t *)(a + i) + b;
-        if (r > UINT32_MAX) {
-            r = UINT32_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint32_t *)(d + i) = r;
+        *(uint32_t *)(d + i) = DO_UQADD_S(b, *(uint32_t *)(a + i));
     }
 }
 
@@ -1732,11 +1819,7 @@ void HELPER(sve_uqaddi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t r = *(uint64_t *)(a + i) + b;
-        if (r < b) {
-            r = UINT64_MAX;
-        }
-        *(uint64_t *)(d + i) = r;
+        *(uint64_t *)(d + i) = do_uqadd_d(b, *(uint64_t *)(a + i));
     }
 }
 
@@ -1745,8 +1828,7 @@ void HELPER(sve_uqsubi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t ai = *(uint64_t *)(a + i);
-        *(uint64_t *)(d + i) = (ai < b ? 0 : ai - b);
+        *(uint64_t *)(d + i) = do_uqsub_d(*(uint64_t *)(a + i), b);
     }
 }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2d449c9b57..609d5ae7b7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5963,3 +5963,10 @@ DO_SVE2_ZPZZ(SMAXP, smaxp)
 DO_SVE2_ZPZZ(UMAXP, umaxp)
 DO_SVE2_ZPZZ(SMINP, sminp)
 DO_SVE2_ZPZZ(UMINP, uminp)
+
+DO_SVE2_ZPZZ(SQADD_zpzz, sqadd)
+DO_SVE2_ZPZZ(UQADD_zpzz, uqadd)
+DO_SVE2_ZPZZ(SQSUB_zpzz, sqsub)
+DO_SVE2_ZPZZ(UQSUB_zpzz, uqsub)
+DO_SVE2_ZPZZ(SUQADD, suqadd)
+DO_SVE2_ZPZZ(USQADD, usqadd)
-- 
2.25.1

