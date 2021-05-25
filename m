Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4054559lfm;
        Mon, 24 May 2021 19:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaqFUPm2/Z50p1BDCE0lNwCXrDV9uJ/GJhPMjQ5wyR8RWwZ02NJJG4y4g4k2lKL2e7sE7h
X-Received: by 2002:ac8:5313:: with SMTP id t19mr29447164qtn.190.1621908771692;
        Mon, 24 May 2021 19:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908771; cv=none;
        d=google.com; s=arc-20160816;
        b=BtAWTY64LQtQ6hef9Csw0wgKuMS9gsFXY4gqfgUER04NoB0cZJPQ5THHHPp9BPuMQH
         CZJaRKO+HuWdSWlavcwlFHa/0seOHf4RsLkVPmBHCsd8M9PwL9lSXSBlILc9U6EOlQdK
         wfNlWQj9nAyKJurssdM70BHLygy1QrmDTGMpLSgVgJrMTwkEG18qy2vgOOHwXcjccDIf
         cHhQyaZdTTFoDa7ss7wWURu1aXSG36fMNIFeBTNMuP5ii6jzTbiHRi+M7nAK0jUyJmdS
         KCL2Zt+xbaSAiXMdC+7DCd04mrapQRWCwW92ZIIiooHqp+qif/lLKejEzX+1F74H7JL1
         z0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s3J5xZAT9p1EG4Pf7PPGTAQp3zXTu/AnQThOp9WPnBo=;
        b=xclaIOCKNqnTfrIIWbgHK4NU79eBKiNrubdP/DFTEr6LOG0KyiYnI7wK69ysl4DBKq
         wPRVidNbgtLQtPW4xnh6j8UWsz8X7FEPdQ/hmkGOhxLbA1w2oJ2mu5Y+2U5jzjGM8RL+
         zDIF2JqWTSItk0UxH9rIBGY85jG0fs/0nBHEE0mMETJ3SG2rSSZC06BpYxUSBRV0R2DR
         bcmdeO4OBCZ4PvMgL0JkT3manuGQ69UI2XUKVjV37wBtW0+a31vsWRuX9aOSvLnJwJcZ
         v13SNWoB7LLmsXxUA9ghKTObb/mnk0O2jOwWtp0o7hvPCPRwvaJzTPIReao+tB1pG+63
         x9mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PeJV6hiY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u29si10394985qku.189.2021.05.24.19.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PeJV6hiY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMYs-0000Ec-UM
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYR-0000i1-Kg
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00041Z-7q
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g18so20613623pfr.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3J5xZAT9p1EG4Pf7PPGTAQp3zXTu/AnQThOp9WPnBo=;
 b=PeJV6hiYV5x+R3VSAKZDrUbZI8yeiLdgl7sG13XXfxjgjrtwY7OQ16RS6nBKQTCOvX
 vT2g7d9ajTp+7/jTEN90xnPbq36+kxZn75pqpevSVOts4p3iFBRIOYA0JHYMH6nCULz/
 63/9rB4+CxSXGi8J2ue+3SSoh6YF6U5w6z0/NrakVYt/XYMYq7RTeazXicKTFNrLpMD+
 CiTQGb81x7H6zJQssslUska7AFnhtJtK0OKcVDshweWr+vi2PKRWeAYI8RGQC1+LYpOF
 08pCO3NRw2EG9SD1NfxCGQYO6rVe2AC2Wr6cap3usxBEaKCTkrN5C+ms7NmKlTLNTWYl
 KqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3J5xZAT9p1EG4Pf7PPGTAQp3zXTu/AnQThOp9WPnBo=;
 b=eph+oaKyrI6SrqjE460TeWRImBX6pWuyyREmbPbadlzD6cu9pVTZbop+YyeM8Ck/43
 /2QpepJIrqU7mRwnOM0LpuqLbEhdfN2jJmr/XDH1N60J8V6Bam34Kd/re+TAbTLXdjJh
 Y/3xXLnRLfKf2y8/+JzaZ7LzrEMlk/dMJ3HReoeJWR1f2Jrv61pZCF6MotQTmNMT+OmM
 qD8ZUXg6jg/kkJh59nqVjEq5PQeu89AJXnI9DBGT/n/GxhSamFrAMacpLn8K6I4gyl9c
 On+uDkChDl9atf4FF43FiZTucdcCm1RE1vyvkK+Joap9C9rrl2vU02FkOmQ6S4Tg/PIh
 MU/A==
X-Gm-Message-State: AOAM531KoL6JqasaxsiYaiTPQBXuSpbYyx6T+0dXUkNTyCLyd51+aNwR
 W4zPu3Tes0kWtQT0PmRbQDoTh8ETVKkmlQ==
X-Received: by 2002:a63:f502:: with SMTP id w2mr16366269pgh.197.1621904848143; 
 Mon, 24 May 2021 18:07:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 46/92] target/arm: Implement SVE2 FMMLA
Date: Mon, 24 May 2021 18:03:12 -0700
Message-Id: <20210525010358.152808-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlPd0ON3PN3e

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422165503.13511-1-steplong@quicinc.com>
[rth: Fix indexing in helpers, expand macro to straight functions.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++
 target/arm/helper-sve.h    |  3 ++
 target/arm/sve.decode      |  4 +++
 target/arm/sve_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++
 5 files changed, 125 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ae787fac8a..595bc6349d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,16 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_f32mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
+}
+
+static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F64MM) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 28b8f00201..7e99dcd119 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2662,3 +2662,6 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(fmmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(fmmla_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c3958bed6a..cb2ee86228 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 floating point matrix multiply accumulate
+
+FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
+
 ### SVE2 Memory Gather Load Group
 
 # SVE2 64-bit gather non-temporal load
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5b6292929e..fa96e28639 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7241,3 +7241,77 @@ void HELPER(sve2_xar_s)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = ror32(n[i] ^ m[i], shr);
     }
 }
+
+void HELPER(fmmla_s)(void *vd, void *vn, void *vm, void *va,
+                     void *status, uint32_t desc)
+{
+    intptr_t s, opr_sz = simd_oprsz(desc) / (sizeof(float32) * 4);
+
+    for (s = 0; s < opr_sz; ++s) {
+        float32 *n = vn + s * sizeof(float32) * 4;
+        float32 *m = vm + s * sizeof(float32) * 4;
+        float32 *a = va + s * sizeof(float32) * 4;
+        float32 *d = vd + s * sizeof(float32) * 4;
+        float32 n00 = n[H4(0)], n01 = n[H4(1)];
+        float32 n10 = n[H4(2)], n11 = n[H4(3)];
+        float32 m00 = m[H4(0)], m01 = m[H4(1)];
+        float32 m10 = m[H4(2)], m11 = m[H4(3)];
+        float32 p0, p1;
+
+        /* i = 0, j = 0 */
+        p0 = float32_mul(n00, m00, status);
+        p1 = float32_mul(n01, m01, status);
+        d[H4(0)] = float32_add(a[H4(0)], float32_add(p0, p1, status), status);
+
+        /* i = 0, j = 1 */
+        p0 = float32_mul(n00, m10, status);
+        p1 = float32_mul(n01, m11, status);
+        d[H4(1)] = float32_add(a[H4(1)], float32_add(p0, p1, status), status);
+
+        /* i = 1, j = 0 */
+        p0 = float32_mul(n10, m00, status);
+        p1 = float32_mul(n11, m01, status);
+        d[H4(2)] = float32_add(a[H4(2)], float32_add(p0, p1, status), status);
+
+        /* i = 1, j = 1 */
+        p0 = float32_mul(n10, m10, status);
+        p1 = float32_mul(n11, m11, status);
+        d[H4(3)] = float32_add(a[H4(3)], float32_add(p0, p1, status), status);
+    }
+}
+
+void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
+                     void *status, uint32_t desc)
+{
+    intptr_t s, opr_sz = simd_oprsz(desc) / (sizeof(float64) * 4);
+
+    for (s = 0; s < opr_sz; ++s) {
+        float64 *n = vn + s * sizeof(float64) * 4;
+        float64 *m = vm + s * sizeof(float64) * 4;
+        float64 *a = va + s * sizeof(float64) * 4;
+        float64 *d = vd + s * sizeof(float64) * 4;
+        float64 n00 = n[0], n01 = n[1], n10 = n[2], n11 = n[3];
+        float64 m00 = m[0], m01 = m[1], m10 = m[2], m11 = m[3];
+        float64 p0, p1;
+
+        /* i = 0, j = 0 */
+        p0 = float64_mul(n00, m00, status);
+        p1 = float64_mul(n01, m01, status);
+        d[0] = float64_add(a[0], float64_add(p0, p1, status), status);
+
+        /* i = 0, j = 1 */
+        p0 = float64_mul(n00, m10, status);
+        p1 = float64_mul(n01, m11, status);
+        d[1] = float64_add(a[1], float64_add(p0, p1, status), status);
+
+        /* i = 1, j = 0 */
+        p0 = float64_mul(n10, m00, status);
+        p1 = float64_mul(n11, m01, status);
+        d[2] = float64_add(a[2], float64_add(p0, p1, status), status);
+
+        /* i = 1, j = 1 */
+        p0 = float64_mul(n10, m10, status);
+        p1 = float64_mul(n11, m11, status);
+        d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a64ad04c50..a94b399f67 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7672,6 +7672,40 @@ DO_SVE2_ZPZZ_FP(FMINP, fminp)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
+static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    gen_helper_gvec_4_ptr *fn;
+
+    switch (a->esz) {
+    case MO_32:
+        if (!dc_isar_feature(aa64_sve_f32mm, s)) {
+            return false;
+        }
+        fn = gen_helper_fmmla_s;
+        break;
+    case MO_64:
+        if (!dc_isar_feature(aa64_sve_f64mm, s)) {
+            return false;
+        }
+        fn = gen_helper_fmmla_d;
+        break;
+    default:
+        return false;
+    }
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
                             bool sel1, bool sel2)
 {
-- 
2.25.1

