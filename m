Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193595njb;
        Wed, 11 Dec 2024 08:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUv+GoEEcrZd9sFsYqOEkRYO4K5JNQ4ijLR6W3G5CQf+B0UB1pB9LIqUmiQla4H2j8cJN5mv+xAS/knA==@linaro.org
X-Google-Smtp-Source: AGHT+IE6nXn2AXqGNLZ9pZ8aCPwH2ji6AhaFUTqchOscRRTbV4awGAKvQZsvpNN5bRAqBaG/nU3D
X-Received: by 2002:a05:6214:19c2:b0:6d8:8f81:e2e3 with SMTP id 6a1803df08f44-6dae29bc102mr6128706d6.8.1733935045956;
        Wed, 11 Dec 2024 08:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935045; cv=none;
        d=google.com; s=arc-20240605;
        b=hYE0+9ol0tXrYP5bmGi6zESr54vdi7bS4mKVdZw4kP5Xxtm7/2Tb9oVF28aPmMRHnY
         i6/F68H7JG02BxLUHgqdRsAzV7yCSTSfgLmltIAOo5Js8ZorrPDK2nZF3YGh/hV8p3kJ
         BGlYel0oXf84BleGlvSxwX4vDgzfADnQ5GEqghbRGHw0NoNISbl3C4Tkxl5YCvLS6GYc
         qpQojBV3chxGyGJNaR6Eivs24EynDJXGBrp7mnbCV4hr0PP6EUnrQqg2ShlQxtfpvLf8
         0eBrodhWA8JrhwQwp9Txh9jJD5OEyxSsdGfgt9TtsBxT/Fwh7uCLCkC0pmWPFm7vejHR
         /AEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S4hQ/k3bgfabyL+FoFt8yRR+YCYyEP8pytxrqcBvzgQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=T99zr3pkVYMN/vbgnXYnQar3YLu4+TOxB0katORI4mGs+MlX7lf96tK3alolAT3+q+
         7Hsg0Sp0bprh9wtRFB2XJ3TXoH9f+9Lg53C2S6oX8v4mIENqJLpyREbMHZcSAzOReTR0
         GivxQLuJjGf4aS2UQ+CpM1uQJNfQgZBPHvmZSLcSq32Dvn3J02ogoHt8pTbsm2fy8OnE
         qBhW6IG7f+lzHRk/dgWK/iGMjyNR0j3gLIufmR7aabo6EumW6zz8ARyfcpiLhPHtapkU
         deDCt9wTjmziTKuOLUhFh9Sy2sAYeHS4ywMfL9GMLt1gq0Vr+D64e7ixWkHc4/Gg3bsa
         f/Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vusrzw4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8ed534b44si137131686d6.511.2024.12.11.08.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vusrzw4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPi9-00030j-Oz; Wed, 11 Dec 2024 11:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhz-0002GL-UL
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:37:08 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhy-0002OR-2u
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:37:07 -0500
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6d8f75b31bfso38124546d6.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733935025; x=1734539825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4hQ/k3bgfabyL+FoFt8yRR+YCYyEP8pytxrqcBvzgQ=;
 b=Vusrzw4M9C1jka/tlHsfd764JmctcGsQiuYrTcMieTFDJEXnxK7t/u9CKBWCIKYC8G
 YAAEHUq7VSK5XUtbU8wZ+5u2Z2N3au0aFi98A3cvJv4KpLp/+rGPtacPs4MIBJRtsikO
 OwjasVZWL+6zj8K4TYdyHJsdufRMybkEVifcWLBiXjKoKn+HBuiIRHcnrWAGRNRzJGj6
 EiJhkt2h80Fq0WwT8Jkg/T0xPYkU+KHEur9WV1TFwZqULJPjCgwD0piiiKB8ULoTvznh
 uKnYYBRaNWSbvVLZZbgNZ6rYKtWhFsvBQZULELAQQTrLW2jLNgD9qM/LdpKZmcktFwnv
 WJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733935025; x=1734539825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4hQ/k3bgfabyL+FoFt8yRR+YCYyEP8pytxrqcBvzgQ=;
 b=jmkP1SUVbwO+A12WZ7r9qO1B0fLwfsibi7ldsTSDiawITmzNzuyes1REe51kdRXFlG
 pm7Ax2F3Ue46hAQicUfjLa9DMfzxcfGQugVp4E7VLMi3cI5E3QYs2YMKPnvULMXtfU5I
 A/gxTpGn3vKYe7iJm9/cr9Sped4yVqaC19oDQSUjXS+pquKHaq8WD1lA8c9ETMWcAuWX
 +jsvDYREkyx30NEMYES80keIhb655B7M5ly2Pb60/PVPqxMX5INPBefxUqQ3vLD5uKy7
 fiW3HkvMg5E/q4nGmCxq7Nj0LrHd9en3pb+NKxiUsMpKblUvtJgG8Krly4MKyp52QMtr
 PQCw==
X-Gm-Message-State: AOJu0YyHzPOR8KCOLicsmQYZDUtj9crQs4U8ksENf3iAO5RlJ3KZDW2k
 BPYVgeP6PHcU9nahCWW0H+7YXOroO95W2bf5wxjIkFwdrPBrMAnZWEfxqZH6g9M=
X-Gm-Gg: ASbGnctk+3R2w40ACvPGg7U+3C/zcunxYaCsLUmnTfId3lHfG19E+4wdcuqOOmNoYH7
 9w84OCQAYDd7bbVeoSLqRrbobunqemhRch6BTB7AOXtKYMCGfUmNxSGKNNYTfwGJVDgC2QUmbzL
 Hz2QIAU7/Tuuk33ClKPkEuI9RNvSEhKkt/NszUqK9tXPHSaSF25Z0zPXnmf8ij3XHePVnOvv1HO
 ZH+VvTwDP+ayjiDMSV7cZY+OilhCKgXLfvXPiqMz05hvd3v7YhCoUCPDFDKiQ==
X-Received: by 2002:a05:6214:da3:b0:6d8:8874:2131 with SMTP id
 6a1803df08f44-6dae29ef9acmr4914916d6.13.1733935025139; 
 Wed, 11 Dec 2024 08:37:05 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:37:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 67/69] target/arm: Introduce gen_gvec_urecpe,
 gen_gvec_ursqrte
Date: Wed, 11 Dec 2024 10:30:34 -0600
Message-ID: <20241211163036.2297116-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wyLkX0HopNa1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  3 +++
 target/arm/tcg/translate.h      |  5 +++++
 target/arm/tcg/gengvec.c        | 16 ++++++++++++++++
 target/arm/tcg/translate-neon.c |  4 ++--
 target/arm/tcg/vec_helper.c     | 22 ++++++++++++++++++++++
 5 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1132a5cab6..9919b1367b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1121,6 +1121,9 @@ DEF_HELPER_FLAGS_4(gvec_uminp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_uminp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_uminp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(gvec_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h"
 #include "tcg/helper-sve.h"
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index b996de2c15..9b9abf1992 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -608,6 +608,11 @@ void gen_gvec_fabs(unsigned vece, uint32_t dofs, uint32_t aofs,
 void gen_gvec_fneg(unsigned vece, uint32_t dofs, uint32_t aofs,
                    uint32_t oprsz, uint32_t maxsz);
 
+void gen_gvec_urecpe(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_ursqrte(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                      uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 01c9d5436d..01867f8ace 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2711,3 +2711,19 @@ void gen_gvec_fneg(unsigned vece, uint32_t dofs, uint32_t aofs,
     uint64_t s_bit = 1ull << ((8 << vece) - 1);
     tcg_gen_gvec_xori(vece, dofs, aofs, s_bit, oprsz, maxsz);
 }
+
+void gen_gvec_urecpe(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_32);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_urecpe_s);
+}
+
+void gen_gvec_ursqrte(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                      uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_32);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_ursqrte_s);
+}
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index f9ca889bec..c4fecb8fd6 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3070,7 +3070,7 @@ static bool trans_VRECPE(DisasContext *s, arg_2misc *a)
     if (a->size != 2) {
         return false;
     }
-    return do_2misc(s, a, gen_helper_recpe_u32);
+    return do_2misc_vec(s, a, gen_gvec_urecpe);
 }
 
 static bool trans_VRSQRTE(DisasContext *s, arg_2misc *a)
@@ -3078,7 +3078,7 @@ static bool trans_VRSQRTE(DisasContext *s, arg_2misc *a)
     if (a->size != 2) {
         return false;
     }
-    return do_2misc(s, a, gen_helper_rsqrte_u32);
+    return do_2misc_vec(s, a, gen_gvec_ursqrte);
 }
 
 #define WRAP_1OP_ENV_FN(WRAPNAME, FUNC) \
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 0f4b5670f3..c824e8307b 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3105,3 +3105,25 @@ void HELPER(gvec_rbit_b)(void *vd, void *vn, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_urecpe_s)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = helper_recpe_u32(n[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_ursqrte_s)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = helper_rsqrte_u32(n[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.43.0

