Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2506806lfi;
        Thu, 26 Mar 2020 16:14:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsbe70QO8DBveKbR/EcWK34jYhck7gnsybyls/J7jrvq1vuDjjXSah+SorawyBzOmTZl0N9
X-Received: by 2002:aed:2f01:: with SMTP id l1mr11341707qtd.37.1585264451240;
        Thu, 26 Mar 2020 16:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264451; cv=none;
        d=google.com; s=arc-20160816;
        b=NbotOCpENnpmjsCOkep5IIkcQtkWlGICB8/YD01G8YuJqRAhtNyUlUWGzXbdjjgr5s
         A8/JHBy5xaYegRpIfobbojaBT+HPwI6p9xHg5LkWwrd94oVH0A7vuEQyqruSlqwzF0L0
         8/wVlA6caCBUVBuUQCxYTb4XQj4aSjUx8FNWbXqts4gO7azxYcuXP6W30R+q7HggR3xt
         wxbUUOSFCqdV3a+3+ayrFx9UjXbzVkyrRuS6kaLY0Esu2pXx1vQPVa10BUhnTrGJ5uPf
         87ZLE+X7+vKjubzfZe3khntTQIzfTvRCl0SfKWvF+XCAU/WV3+Wi8Hodx0K6nOApu3OP
         tB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rI8qejJNvyJMtMzOFbbZO4TRq+KeIHi8lkQl/Kjod0g=;
        b=jNAqG97uvPtok8YNFwHhpgiA9gof52wUTGQFPb0Q+zyztuIZfqXGYkjmfSJp4oOaZh
         LDBFIyQAAWpGdlI5X9NXrm5wi2jA1AEyuHbvzsIqUYDBIHLzHZVRhR+1BxLYVrvSKdmU
         LoyPdI/hZUV8yLh3Lx4+Jr1wAIdksVtv2B2u3HXq6pmyef8XOB+058pfJmEfxd1/ItOy
         fzC+qQpH4AxcPlvc/oZs1iGUUZ0rgESoPtCBRFK5lwgQxrvuteoRKjTosNAKFYRZTdMJ
         SeBiTZDPS80yYFISN160UnaQUD2UoARmy9Z9e4VJx4Ez4OdJ+r5He+BwVli9xPUz0J4Z
         qpBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RJ64crcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si2400255qka.174.2020.03.26.16.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RJ64crcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34599 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbhS-00029X-Iz
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcU-0002Tu-1P
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcS-0001Z5-LP
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:01 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcS-0001Xw-F0
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:00 -0400
Received: by mail-pf1-x443.google.com with SMTP id q3so3526548pff.13
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rI8qejJNvyJMtMzOFbbZO4TRq+KeIHi8lkQl/Kjod0g=;
 b=RJ64crcLI/IiapbqkQWiQAhcVnS+EC2JxfMAlP2pfuq6LQaG4KuMeOlLm0j2ym8b1J
 WBDNEQeWBAFCsdRRKryCr/J32tu53LGaGCZAspzLYWODv6Fj/ftlPAJXTWHlhviJ1o4V
 tYSnn9owYLxT9Qjbj8rcgMP2jwIBVKNx2jbcVfcj3Vjoy93ehTz/QATOJhW48JcdiujE
 t2XuWILZcr49oH6Hgc7fNzXWHPHKZV74IYeuavftKeu7xawIursnI8kWZI5n6kij7Acy
 62i4vIGyxaWCifq5a8xXwhnTX/FXM4xPos/yBikiF0Xhu8sxWTTyMdCHbLnCea9cQrYU
 M53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rI8qejJNvyJMtMzOFbbZO4TRq+KeIHi8lkQl/Kjod0g=;
 b=gfYdxrv69ua+l6U7PBNcUqhQBuMNQGPHWZLMYP/eN+BrKiLFyc05+Ggd2X3B3btqwg
 6pUSAB30kpnmPsrO8djvJo+j7OdixCj1TLPy8P8yC1CaWylZF/P81oC17jUj4NSZregw
 hpP+BsTZIccJ3xQ4bn7BZlCbj9OFH1kgeAH7BOGq8ypArtaIth8UHTePQ/rNTJVnw+rd
 5lUiFiMFm1VaD0ObhoTxoa3ZDc/sPTga6GjlM1Z6kqTO7Qfml0yKcvsc0BrJRou1yT8F
 yu82/hvCqcZ0eFhOiHT1zsU7QA0Z38gxAod+Wp0pX3/jYeU+pL2P5Tf+g+r9nyNVaHgG
 37PA==
X-Gm-Message-State: ANhLgQ3uhJ1kV0Bnmd/m7jNOB6GOTZaRWc1481HlXOckHOP5wwG/Vr3q
 8lWHjlryFqaL3YIH9YyrUlVsd3q8s1I=
X-Received: by 2002:aa7:9f94:: with SMTP id z20mr9893160pfr.261.1585264139443; 
 Thu, 26 Mar 2020 16:08:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/31] target/arm: Implement PMULLB and PMULLT
Date: Thu, 26 Mar 2020 16:08:22 -0700
Message-Id: <20200326230838.31112-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: LxsLyGWgehEC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++++++
 target/arm/helper-sve.h    |  1 +
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/vec_helper.c    | 26 ++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2314e3c18c..2e9d9f046d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3855,6 +3855,16 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
+}
+
+static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c4784919d2..943839e2dc 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2371,3 +2371,4 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2410dd85a1..04bf9e5ce8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1204,6 +1204,8 @@ USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
 
 SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
 SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+PMULLB          01000101 .. 0 ..... 011 010 ..... .....  @rd_rn_rm
+PMULLT          01000101 .. 0 ..... 011 011 ..... .....  @rd_rn_rm
 SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c66ec9eb83..67416a25ce 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6064,6 +6064,28 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
+        NULL,                    gen_helper_sve2_pmull_d,
+    };
+    if (a->esz == 0 && !dc_isar_feature(aa64_sve2_pmull128, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_PMULLB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, false);
+}
+
+static bool trans_PMULLT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, true);
+}
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 00dc38c9db..154d32518a 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1256,6 +1256,32 @@ void HELPER(sve2_pmull_h)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = pmull_h(nn, mm);
     }
 }
+
+static uint64_t pmull_d(uint64_t op1, uint64_t op2)
+{
+    uint64_t result = 0;
+    int i;
+
+    for (i = 0; i < 32; ++i) {
+        uint64_t mask = -((op1 >> i) & 1);
+        result ^= (op2 << i) & mask;
+    }
+    return result;
+}
+
+void HELPER(sve2_pmull_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    int shift = simd_data(desc) * 32;
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint64_t nn = (uint32_t)(n[i] >> shift);
+        uint64_t mm = (uint32_t)(m[i] >> shift);
+
+        d[i] = pmull_d(nn, mm);
+    }
+}
 #endif
 
 /*
-- 
2.20.1

