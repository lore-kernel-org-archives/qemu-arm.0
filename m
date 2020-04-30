Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2215778lfm;
        Thu, 30 Apr 2020 11:32:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypIDp4TpKlRoe5Ziftgs/38BUO9iO9mTPlGajjzUQ+8yqcQszEz8blzM0xoUP2yVn9E3JeXb
X-Received: by 2002:a37:a78e:: with SMTP id q136mr5097187qke.33.1588271535333;
        Thu, 30 Apr 2020 11:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271535; cv=none;
        d=google.com; s=arc-20160816;
        b=tQcsymZ732A1OI/xcnx11BwtSFSBXpav7cIBqiH7bbBfmAcCgPLteWQPcHXLNxG+ST
         RVIEYw9d6SJn3ylGxj/kUQh1DznJ3FugXoTGaiND0SHIyQuMXV4Io2DzSYmdUOtFBIwT
         MFyjvJrIzLtLx5e+LzEMDOVjZ+wHYpvvQbDaXQoPkBFdZFn2K1WR576ZzmLtfPDz7/Sf
         Q7TjjLtC4ufm1cB1eLmYtmq2lHjcTTTDtDnuPF5jWjjOD0okalZxGNHqVZFl4rpdVbma
         JP96nb5uKmjL7IsizwspFRsTApOZ2JfPvN/G3szN471l7owyr6yBVAL9fF+RacYAOSiA
         VGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+LfsWU+1Yby3pwqmNZERr3r8EY6rerTNDvwO7ihyqeA=;
        b=tHV+mWtWcPGs0+df/IdmlDkuv2cXfBJfABtj05+2lW28VWVz21c3x/0iSu/x16ez+H
         jbev85r4L4jvzDw+aoeMHAzGzc8M4vsLq+i3AHQZ0YaEEcmC12x1rvf258XF9v9NT3J4
         nCSL9wFq6nw6fpbLq2C2MQ8FzVIQ7t+qgOKy520phEy0ZAtlFx3rj5FW1C9bys0iYU5N
         kOCamXTjnJ76Q1PuFAfqjfNuZxaVFTWaWpF4itEWLBR7zmaZu464UsKU8kj8X6t590KM
         mQ9R2rW3zJyuGcUFNBeZ3LLOUOYudJxiThaEu/HoLhS+WHSUnrte7rMwt9++8iSYCVhm
         zBoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qqo2bP2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id f27si311979qtm.94.2020.04.30.11.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qqo2bP2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDyo-0002K2-Jr
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeQ-0002BI-VL
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdv-0001IS-HZ
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:10 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdv-0001Hu-37
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:39 -0400
Received: by mail-wm1-x343.google.com with SMTP id z6so3081410wml.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+LfsWU+1Yby3pwqmNZERr3r8EY6rerTNDvwO7ihyqeA=;
 b=Qqo2bP2ZNANMSIcYsPLVm2XdJMJlTbIe95tu3AumClelKNpijaAdwvr401XSQ3dqdx
 yNnh5lXKt1vNq5rhEucadFxIZSbfh7r/y4jMlCQwyfAZl5vFlYgFYTm4Ped08lpE8cn0
 lVlEvPaqVos0hcFDCa/atNO5ZRE/Xn5I734nJH02zuepoOJnRQ7Y+PCcnHBDO84S8zoe
 09npfmCfXH9Dvl7VuKycLXcxiWbsdnY6bIaZaKT14oWXwUg9w7d4Fz+mGn5ssORJPJmr
 fNINYZKSGLlPO0tNEHuQcpGGaX90GPjXPaCC0eU7Y7uzsekWAZWVmseekJwUzsQ5UzXS
 XLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+LfsWU+1Yby3pwqmNZERr3r8EY6rerTNDvwO7ihyqeA=;
 b=pUB68d6qxS/A9T68HTvtR94Uuk+eklEy1ml3m5plQbIR1GZ9gUXFZxjhYf7vLAK87j
 mWlss+bYdaB7Vv8ejRsU01xu4nyNE3fl3bixyFkqNq0r+tZNXlMmKIosysqXfev4vpBd
 8B3Jqb7drz9sOLhQiQABy5lMxHN9jpHS1vdPNuajaNqcAvdFEIb7CGPyUISjTeTAeppL
 JylBIb6cZC2/GWkzSQVsG1n0A2F+iCwBi7K/K6D28NGfWz3sx+dU06w8oLuE/OCnauYH
 MHulE5TuCYs9DtgmmvMeAuG7TGeGo49Eg3GQ3hCLrw9toinZSPBZLeLhOyepIe1r4kpo
 7iyA==
X-Gm-Message-State: AGi0PuZWzgBvDVjbbFSl4b5EzbsOhsx+CFo5H/obKw8VQ2pp5V0DHJ5k
 kUsUPy+zEQSsHpUmuMrnAzaCGSNE7c55bQ==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr4523836wmf.175.1588270236868; 
 Thu, 30 Apr 2020 11:10:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/36] target/arm: Convert Neon VHADD 3-reg-same insns
Date: Thu, 30 Apr 2020 19:09:51 +0100
Message-Id: <20200430181003.21682-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9kEuNDAwP4O

Convert the Neon VHADD insns in the 3-reg-same group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 62 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          |  4 +--
 target/arm/neon-dp.decode       |  2 ++
 3 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index bc5afb368e3..7a602d76566 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -970,3 +970,65 @@ DO_3SAME_64_ENV(VQSHL_S64, gen_helper_neon_qshl_s64)
 DO_3SAME_64_ENV(VQSHL_U64, gen_helper_neon_qshl_u64)
 DO_3SAME_64_ENV(VQRSHL_S64, gen_helper_neon_qrshl_s64)
 DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
+
+static bool do_3same_32(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
+{
+    /* Operations handled elementwise 32 bits at a time */
+    TCGv_i32 tmp, tmp2;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        tmp = neon_load_reg(a->vn, pass);
+        tmp2 = neon_load_reg(a->vm, pass);
+        fn(tmp, tmp, tmp2);
+        tcg_temp_free_i32(tmp2);
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    return true;
+}
+
+#define DO_3SAME_32(INSN, func)                                         \
+    static bool trans_##INSN##_S_3s(DisasContext *s, arg_3same *a)      \
+    {                                                                   \
+        static NeonGenTwoOpFn * const fns[] = {                         \
+            gen_helper_neon_##func##_s8,                                \
+            gen_helper_neon_##func##_s16,                               \
+            gen_helper_neon_##func##_s32,                               \
+        };                                                              \
+        if (a->size > 2) {                                              \
+            return false;                                               \
+        }                                                               \
+        return do_3same_32(s, a, fns[a->size]);                         \
+    }                                                                   \
+    static bool trans_##INSN##_U_3s(DisasContext *s, arg_3same *a)      \
+    {                                                                   \
+        static NeonGenTwoOpFn * const fns[] = {                         \
+            gen_helper_neon_##func##_u8,                                \
+            gen_helper_neon_##func##_u16,                               \
+            gen_helper_neon_##func##_u32,                               \
+        };                                                              \
+        if (a->size > 2) {                                              \
+            return false;                                               \
+        }                                                               \
+        return do_3same_32(s, a, fns[a->size]);                         \
+    }
+
+DO_3SAME_32(VHADD, hadd)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fb64eb3a800..67616fc218a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4786,6 +4786,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VML:
         case NEON_3R_VSHL:
         case NEON_3R_SHA:
+        case NEON_3R_VHADD:
             /* Already handled by decodetree */
             return 1;
         }
@@ -4866,9 +4867,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VHADD:
-            GEN_NEON_INTEGER_OP(hadd);
-            break;
         case NEON_3R_VRHADD:
             GEN_NEON_INTEGER_OP(rhadd);
             break;
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index a4932e550ed..055004df4e8 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -42,6 +42,8 @@
 @3same           .... ... . . . size:2 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
+VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
 VQADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 1 .... @3same
 
-- 
2.20.1

