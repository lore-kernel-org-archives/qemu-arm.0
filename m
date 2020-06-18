Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288746lfm;
        Wed, 17 Jun 2020 22:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbhWOOEgJf5G0GtGWZKbJjO0BcgU7efGxnljIB9+tg3Trw1p6M4dCVtXTaEfQMbwhYVXgA
X-Received: by 2002:a5b:4cd:: with SMTP id u13mr3506461ybp.323.1592457368190;
        Wed, 17 Jun 2020 22:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457368; cv=none;
        d=google.com; s=arc-20160816;
        b=vFwayvHSVBlod9mnHUNcee4gIamp4+R/OidkvUVn2dH8SwFSoyuoYvFNFTUrbL3YWg
         3BytTTh8CXRzJInbx5E+VNEHkd+JJmyCQ9CmgYhSTYQDAM7JkuPJmlpBHUIs08h7QbXQ
         CZpCo+I3S3RQGHPJGyFHRlDxvjVhkSFORd+y2gWlXNSrNKFua0dOVo1fgWuhtDQqfgWE
         6btm27ksVQ40+YxuD5sMh+6+7H3SfiKZdjg2iXryJ0ZwS1pMiPukRRuq3jGplqap45Wk
         VoJRaQ5IEWQQ3cFZkrxMEStZ78GcC+YV5LiU5+JUkY8J5DbA2jb9SQx8ZDquVs4Ajqw2
         H6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nErqouJM8m6ybmOPyYqig7BOY3UCkWwmRaJs2NpvbRU=;
        b=Dgk3kQECMX7dr7uZom2bvvul2+MN5qZvKiJ+3WAdcnHkPACq8BJJEvi3cHv8i6Q+9A
         04DxpSHDfXs8FSRT7cAGyFsLaDaLhrgywucg4oKwLslOAXa12qeewUAeRsbCrVjz4zGb
         jn3ZAbV4h5abcr8AUEP+60B7oCIlnhTaUXUa8jPg2QCVFx08Ll6y65uiiHkrdgXGqNbO
         JDRmxvcUGcojRdvlTyaJ9NEgV7F9tIc48fTPFk9pjhMgXZixiiSt2P1rjBs9T/zSwfAf
         MnAObpkCpGW51PqQDP3iEyZEExKYFUun4RD5zF4pQRu3XC7kgI0aqD4vSH94mXtMPF1y
         U1KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z7wPx265;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si1479495ybj.428.2020.06.17.22.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z7wPx265;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmuF-0006D5-Fm
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEM-00069r-Dg
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:51 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEH-0003bL-Vi
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:50 -0400
Received: by mail-pj1-x1044.google.com with SMTP id s88so2078122pjb.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nErqouJM8m6ybmOPyYqig7BOY3UCkWwmRaJs2NpvbRU=;
 b=Z7wPx265hAxpLE5bchnvlxRepP0w88Q6c0rZqhHrGEOUTwbMrTMLBUGTyHmgsxr9nn
 lH0kp/baoDrWBPqTEcEKzqdPzmFrENm7UAFzwjwjcUKfK3Wkyl8aXhA8HqDSLH52rR8w
 r5+fpMXN5yxYWGW0zDHxUknOu6Rzy9MvbDlyZmwxC6KGiGKCTsFYEduPmPuWYPPAQi5e
 9+/WV1olk3lJ4hDyBiGcBtpsejdQ8zuMc5dhc7XZk9z6Jz20sdTZWxT9mzo7m/q37wQQ
 StDKNb5jLGhOK2AjKySmfU4MS7upY0FwZfmGR8wF41WWLFYxAGmkCLcX2grfC4ZOh41z
 2AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nErqouJM8m6ybmOPyYqig7BOY3UCkWwmRaJs2NpvbRU=;
 b=ekJh94DOoCqWxKAN/LZwUPaiXUBlmMs+UtrvNBvdMMG+X7VfmSRMPyOxc6Yy/UaTcS
 90QXv5O7VvttwW7yEn1x/8JckRx2wNfDNTrkUm3N5J9/2B0bgMLbD+iQxebvfJZ8aqh8
 tDZO3o6KY0tfYFc5l7cADrQoAwLDrIFkUIJ0o2630oUeGPfhFmqPlKAKqO/G8taFZH3b
 WUyNf82cJ6oCGEzfQmlb7bz7paqtO1Nz3oDrXwbtvNk7SVa9A/T4XVHhRlREV7O13U3t
 j+LCKdpjr2UsF8izZHcvZlDtF1J2CAtgEgkcgqx5Nj+LA0sUIjonpZJxB9yk+07OfR9w
 fD0Q==
X-Gm-Message-State: AOAM533V1nAR4qYSsDErpGfog9Q2yGySy2HK+kuOOt6SeiLjLqejg2+Q
 zon40rBK+KoLOmCs9qJRNdhBZQ==
X-Received: by 2002:a17:90a:4a6:: with SMTP id
 g35mr2337121pjg.155.1592454764702; 
 Wed, 17 Jun 2020 21:32:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 084/100] target/arm: Implement SVE mixed sign dot product
 (indexed)
Date: Wed, 17 Jun 2020 21:26:28 -0700
Message-Id: <20200618042644.1685561-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEmCKHy9RhzJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++
 target/arm/helper.h        |  4 +++
 target/arm/sve.decode      |  4 +++
 target/arm/translate-sve.c | 18 +++++++++++
 target/arm/vec_helper.c    | 66 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 331c5cdd4b..df0a3e201b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3877,6 +3877,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_f32mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
diff --git a/target/arm/helper.h b/target/arm/helper.h
index e9d7ab97da..6fac613dfc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -587,6 +587,10 @@ DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sudot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e8011fe91b..51acbfa797 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -815,6 +815,10 @@ SQRDMLSH_zzxz_h 01000100 .. 1 ..... 000101 ..... .....          @rrxr_h
 SQRDMLSH_zzxz_s 01000100 .. 1 ..... 000101 ..... .....          @rrxr_s
 SQRDMLSH_zzxz_d 01000100 .. 1 ..... 000101 ..... .....          @rrxr_d
 
+# SVE mixed sign dot product (indexed)
+USDOT_zzxw_s    01000100 .. 1 ..... 000110 ..... .....          @rrxr_s
+SUDOT_zzxw_s    01000100 .. 1 ..... 000111 ..... .....          @rrxr_s
+
 # SVE2 saturating multiply-add (indexed)
 SQDMLALB_zzxw_s 01000100 .. 1 ..... 0010.0 ..... .....          @rrxw_s
 SQDMLALB_zzxw_d 01000100 .. 1 ..... 0010.0 ..... .....          @rrxw_d
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 94c1e9aa05..fe4b4b7387 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3842,6 +3842,24 @@ DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
 DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
 DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
+static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_data(s, a->rd, a->rn, a->rm, a->ra,
+                        gen_helper_gvec_sudot_idx_b, a->index);
+}
+
+static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_data(s, a->rd, a->rn, a->rm, a->ra,
+                        gen_helper_gvec_usdot_idx_b, a->index);
+}
+
 #undef DO_RRXR
 
 static bool do_sve2_zzx_data(DisasContext *s, arg_rrx_esz *a,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8e85a16e7e..e1689d730f 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -678,6 +678,72 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_sudot_idx_b)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    int32_t *d = vd, *a = va;
+    int8_t *n = vn;
+    uint8_t *m_indexed = (uint8_t *)vm + index * 4;
+
+    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        uint8_t m0 = m_indexed[i * 4 + 0];
+        uint8_t m1 = m_indexed[i * 4 + 1];
+        uint8_t m2 = m_indexed[i * 4 + 2];
+        uint8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_usdot_idx_b)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    uint32_t *d = vd, *a = va;
+    uint8_t *n = vn;
+    int8_t *m_indexed = (int8_t *)vm + index * 4;
+
+    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        int8_t m0 = m_indexed[i * 4 + 0];
+        int8_t m1 = m_indexed[i * 4 + 1];
+        int8_t m2 = m_indexed[i * 4 + 2];
+        int8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
 {
-- 
2.25.1

