Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2508558lfi;
        Thu, 26 Mar 2020 16:16:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs7rAN3Z+Y180dKEW5OQTvVFACuDOskdmbKLEP7/YVHavxYkl0EwKqvpkg7WfLASvG3y6PC
X-Received: by 2002:ac8:6951:: with SMTP id n17mr11455015qtr.250.1585264560644;
        Thu, 26 Mar 2020 16:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264560; cv=none;
        d=google.com; s=arc-20160816;
        b=eHx1+n3LXuZu/dAzJoJoThuneAVqItuw5ctRBfh94gwW0PCxLTm2WkwRYCgYXAMiSs
         dw6WEzp/2BiJZmNjUGtU7xaC2fFFyQWQhHUFvhm6EmlMwZhzdcvlBKrDuywaTt2TSqwM
         NR0a5pjSKc6oItICG21Ax8xuZXxlEJRNkmKUcq8ASjs6t6vrtWQnm5TZmoIHkCAPQa1B
         FyCUNRZucDBooWVMPfF6lT9sRhHsx9D80NmUN0DukzQ4MbPwXYeLeicmFKF62vvZv1H8
         pUYpZ2N0TfTvo7jpaCONyPMNcCY48D2vNGYx6MDrmMO3Ut3aRX15v7IR6S5DdUPUpi08
         jtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TZZOTv3OeZghjguCKNcfyc5uGnx4cEJVuFPp8if3XZ4=;
        b=aTaPOWfWdsNd6pEDLKACd2ukP13FDiro93u3fM7/qUyXChl7dhLINjN3zwKviQgSKQ
         ydgQYw/RW//Ynp84QmhX+xY3Sezdo0KKDAkGBf2LWwVopjdEz1HoXf/22MO79PZimDe1
         qV5gdalNhwvNyQBtDshBN7qKhdsvPOzYhWOifa26mOwwx5aN9aCAPLkmWDSCIJnVe/Bb
         euwuEP+n1Ybim0oNnJ+SwuLFJhNm3d+JFP+KSeLUf/eux3T9fUHFeHdgSsz+lgNVHWnT
         Xv7gkWsgkWEY/7hQTxTeZ4wyZzAbhewG+zvpI4xV7/wHCvtttebKj682vZS6vPnOrmUb
         jSrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dOg/KZgb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si2374009qvb.111.2020.03.26.16.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dOg/KZgb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbjE-0005Pg-0Y
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcO-0002EN-LD
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcM-0001P1-GD
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:56 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33571)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcM-0001Nl-80
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:54 -0400
Received: by mail-pj1-x102d.google.com with SMTP id jz1so3750619pjb.0
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TZZOTv3OeZghjguCKNcfyc5uGnx4cEJVuFPp8if3XZ4=;
 b=dOg/KZgbX2SBMbO9mQ0Ao9i5826dhyaAIyqQl4wUUff6lLjBDZgOGDTkzfcGu3TK/r
 W4br3S0TCsczqKk4GHtocBDF3a5Oz+qGdzeJMwLcfHYxs3t+et3RN0SB5sUo7Ji3AbIX
 jrayJCIXq0CjPVr15Dvy65cSNyPC2e4MxMdQyH754ZpJo4auUn+NQWhuFq9k+Wd417qi
 7yTWqGq4JKEfEmKb/x0bUbk6BvhisXKwVWOZVytNXv/QrlVecmdd0mPCR+yMQJoAaF17
 q/d+Bc+Anz5J98EfMAUp48ve59a19jadmDfzhqfb9sQFRaXwYjU6ZbIsh5yKsAd+rIP6
 L7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZZOTv3OeZghjguCKNcfyc5uGnx4cEJVuFPp8if3XZ4=;
 b=cG9P8CTQ5RREAToibLByQDcxHJi/79JwSAp8sstncIlhPP+sOmOSarIqnIbcqitTlZ
 +L8toGkEvDI80GLZIl7+eDqZD5vMEpXFVJjt1w3etqhVpob+H4I3IMk4PZvzIscc5c47
 7WkQfEbg1enyYkgbKJgLuHuFRxXeq8bdEqsjd6sQ8E9LwUcK0AUw9lkA1NOC5vZwtkCN
 h8P0Y9WzU0t8GB+x51FX+vBcpTMm/O03plgYAYsFRDEh42VnHIgFdKjVRyvxj0rQ8fvW
 AAJMfmAHlXNO7qcqSoc7ibBc8LeRivvjEhhEkjuNHsQu4nTZ0PYER9QaVojqVnugIhuN
 luZg==
X-Gm-Message-State: ANhLgQ0I4o9PUiwEdrCpn62JgGgciTK09Xm+PofjnfHUCTA6DwkSWK+z
 unJ36eSP7pXgcbgt9cu3cZXrnA==
X-Received: by 2002:a17:902:9890:: with SMTP id
 s16mr10062525plp.71.1585264132994; 
 Thu, 26 Mar 2020 16:08:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/31] target/arm: Implement SVE2 saturating add/subtract
 (predicated)
Date: Thu, 26 Mar 2020 16:08:17 -0700
Message-Id: <20200326230838.31112-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102d
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DG5Imiaj66ox

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  54 +++++++++++
 target/arm/sve.decode      |  11 +++
 target/arm/sve_helper.c    | 182 +++++++++++++++++++++++++------------
 target/arm/translate-sve.c |   7 ++
 4 files changed, 198 insertions(+), 56 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 028c3b85a8..368185944a 100644
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
index 86a6bf7088..86aee38668 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1150,3 +1150,14 @@ SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
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
index d7c181ddb8..bee00eaa44 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -678,6 +678,123 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
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
+DO_ZPZZ(sve2_sqadd_zpzz_b, int8_t, H1_2, DO_SQADD_B)
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
+DO_ZPZZ(sve2_uqadd_zpzz_b, uint8_t, H1_2, DO_UQADD_B)
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
+DO_ZPZZ(sve2_sqsub_zpzz_b, int8_t, H1_2, DO_SQSUB_B)
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
+DO_ZPZZ(sve2_uqsub_zpzz_b, uint8_t, H1_2, DO_UQSUB_B)
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
+    /* Note that m - abs(n) cannot underflow. */
+    if (n >= 0 && (r < m || r >= INT64_MAX)) {
+        return INT64_MAX;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_suqadd_zpzz_b, uint8_t, H1_2, DO_SUQADD_B)
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
+DO_ZPZZ(sve2_usqadd_zpzz_b, uint8_t, H1_2, DO_USQADD_B)
+DO_ZPZZ(sve2_usqadd_zpzz_h, uint16_t, H1_2, DO_USQADD_H)
+DO_ZPZZ(sve2_usqadd_zpzz_s, uint32_t, H1_4, DO_USQADD_S)
+DO_ZPZZ_D(sve2_usqadd_zpzz_d, uint64_t, do_usqadd_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
@@ -1640,13 +1757,7 @@ void HELPER(sve_sqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
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
 
@@ -1655,13 +1766,7 @@ void HELPER(sve_sqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
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
 
@@ -1670,13 +1775,7 @@ void HELPER(sve_sqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
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
 
@@ -1685,13 +1784,7 @@ void HELPER(sve_sqaddi_d)(void *d, void *a, int64_t b, uint32_t desc)
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
 
@@ -1704,13 +1797,7 @@ void HELPER(sve_uqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
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
 
@@ -1719,13 +1806,7 @@ void HELPER(sve_uqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
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
 
@@ -1734,13 +1815,7 @@ void HELPER(sve_uqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
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
 
@@ -1749,11 +1824,7 @@ void HELPER(sve_uqaddi_d)(void *d, void *a, uint64_t b, uint32_t desc)
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
 
@@ -1762,8 +1833,7 @@ void HELPER(sve_uqsubi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t ai = *(uint64_t *)(a + i);
-        *(uint64_t *)(d + i) = (ai < b ? 0 : ai - b);
+        *(uint64_t *)(d + i) = do_uqsub_d(*(uint64_t *)(a + i), b);
     }
 }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5f137c0e92..21dfb2455a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5998,3 +5998,10 @@ DO_SVE2_ZPZZ(SMAXP, smaxp)
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
2.20.1

