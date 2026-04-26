Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D94FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:51:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjE-00078L-3j; Sun, 26 Apr 2026 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziw-000708-1y
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:39 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziu-0008N4-Dp
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c76cce85bd9so3529219a12.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210835; x=1777815635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPMUzDzHKRYKX/hzV0qTrhYipGFAxbdzi8RMy7dDcLg=;
 b=AyVT8ivfhsJpfZ5ira+mMuVH+swu5pN72HikEMm8akGenOHVEAIdps41IqUIFcExFp
 kMgudPdi0Z0AbSfCJss4K3YUGbcgXYQVbilYTfb1M7YRSXHOYsUz9XPCxJBAs5B1ClSA
 FM4vzvhqxx8/I71ZVMt57+0h9MF1NMyYxMlB/GHvokt+25ZZnLR14YKFPRHAMRWsATlx
 2+frLvsbF4oBfx3cNOdSYokit3LdDqutkjSr3hdmtf4pp/NSHm5/hjfg+ix17wrnLG12
 4tUMntMDpxONGB+PpFIm9ui8zl3rX/AIOtJ7tUK06fnTEQpeC/2kZH2mVKfGb1bHR8wN
 d1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210835; x=1777815635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uPMUzDzHKRYKX/hzV0qTrhYipGFAxbdzi8RMy7dDcLg=;
 b=ZWSPBn7ZAImHO1kmc0FvfjUgpiBIYFDINVAlkaGC6bQKCSL8HvDx/Bf9nNsm9j1zYf
 HlB74EbaLXJO4jiInlKBl2xYRRWxjKV0rsPMKccIkiLMkDElNULiuSQuUl6Mc4y0cxcV
 i4FVWI5Rj6BH4wz02jp/oJ9Lr8TRLIfARt7U7/wJoL7ID9GlCak7eT2tEZ7Sudxa0wjN
 cV4kYpApyoVRSnr//8NDXpb/CQSI1qKQWb6WUkkOaE2l5EauQZIOI01FHEHsURrgjMQU
 /UMeePga0rYNUbN4+oggklPLiezCpqGFMclbX7/Qj2czmCgyV8NDi+tQIC38vcRhQIhR
 j7Hw==
X-Gm-Message-State: AOJu0YyFglwVNCaV2HJXFQzhgZNWgGr6sjAfwUSGDAazxX6x8m5D1sRn
 Qw9DZK7xS3gwjtLdx64Z+k3MZvKQh8qT0i5gpg5SdJ3XA00xkpjTnpX2wzJHi4IO5rs=
X-Gm-Gg: AeBDieslKcv1wtMFdd5VQVQMiy9QMN//oC5s0t+QVdDeS7hFMOGM6fWYNJipbKcwflb
 fSJibzSx4SztSH6INRHk602qRq/7rtOB3ERkxtJA1oPdrIBmCDyoZCyxr11oQ1Gnj3hnI+0xyo+
 UQms/eoUQg5zSE/pL0HaXdRQQVztkIpPOcYcyO/VPr3JrQGrhbVOFoQ9UcZTLpOn/IqgtAaW6Gv
 gNrbi2S065oEw0tAYYg8XNpHTag0RV1w31BcQ6dQYNchgdbgFj7Y7xPqvtC1dGviLdBKJiwzgJh
 e81v1AH4wpvs9Gh5Ytkspz6fDd56YO8UlfQ/VCvG6VlKN+twqM9EJ5cQ2d2uZAk8n4LwPBdTWhr
 f7mcB5or51ZwaIU23Z+LUyspeY0C/hhbrkCdWdqHxTz69nuxIcOoEYdLab4g5ggxBWzHmCDhiwj
 /4Q9APmZwFxyclxc7mD935tr7/jw6UHnIOhocO03PE
X-Received: by 2002:a17:902:8f90:b0:2b4:5f96:184d with SMTP id
 d9443c01a7336-2b5f9e5da53mr294550925ad.5.1777210834983; 
 Sun, 26 Apr 2026 06:40:34 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 10/84] fpu: Drop parts_{add,sub}_normal
Date: Sun, 26 Apr 2026 23:38:47 +1000
Message-ID: <20260426134002.865628-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Drop the forward declarations and the _Generic macros.
Add partsW() for use by muladd_scalbn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 16 ++--------------
 fpu/softfloat-parts.c.inc | 12 ++++++------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index aa96ac530d..117c335d66 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,20 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static void parts64_add_normal(FloatParts64 *a, FloatParts64 *b);
-static void parts128_add_normal(FloatParts128 *a, FloatParts128 *b);
-static void parts256_add_normal(FloatParts256 *a, FloatParts256 *b);
-
-#define parts_add_normal(A, B) \
-    PARTS_GENERIC_64_128_256(add_normal, A)(A, B)
-
-static bool parts64_sub_normal(FloatParts64 *a, FloatParts64 *b);
-static bool parts128_sub_normal(FloatParts128 *a, FloatParts128 *b);
-static bool parts256_sub_normal(FloatParts256 *a, FloatParts256 *b);
-
-#define parts_sub_normal(A, B) \
-    PARTS_GENERIC_64_128_256(sub_normal, A)(A, B)
-
 static FloatParts64 *parts64_addsub(FloatParts64 *a, FloatParts64 *b,
                                     float_status *s, bool subtract);
 static FloatParts128 *parts128_addsub(FloatParts128 *a, FloatParts128 *b,
@@ -1635,6 +1621,7 @@ static const uint16_t rsqrt_tab[128] = {
 };
 
 #define partsN(NAME)   glue(glue(glue(parts,N),_),NAME)
+#define partsW(NAME)   glue(glue(glue(parts,W),_),NAME)
 #define FloatPartsN    glue(FloatParts,N)
 #define FloatPartsW    glue(FloatParts,W)
 
@@ -1660,6 +1647,7 @@ static const uint16_t rsqrt_tab[128] = {
 #undef  N
 #undef  W
 #undef  partsN
+#undef  partsW
 #undef  FloatPartsN
 #undef  FloatPartsW
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index e1ce2be924..6e1800b117 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -541,7 +541,7 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
     if (a->sign != b_sign) {
         /* Subtraction */
         if (likely(cmask_is_only_normals(ab_mask))) {
-            if (parts_sub_normal(a, b)) {
+            if (partsN(sub_normal)(a, b)) {
                 return a;
             }
             /* Subtract was exact, fall through to set sign. */
@@ -574,7 +574,7 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
     } else {
         /* Addition */
         if (likely(cmask_is_only_normals(ab_mask))) {
-            parts_add_normal(a, b);
+            partsN(add_normal)(a, b);
             return a;
         }
 
@@ -760,8 +760,8 @@ static FloatPartsN *partsN(muladd_scalbn)(FloatPartsN *a, FloatPartsN *b,
         c_widen.exp = c->exp;
 
         if (a->sign == c->sign) {
-            parts_add_normal(&p_widen, &c_widen);
-        } else if (!parts_sub_normal(&p_widen, &c_widen)) {
+            partsW(add_normal)(&p_widen, &c_widen);
+        } else if (!partsW(sub_normal)(&p_widen, &c_widen)) {
             goto return_sub_zero;
         }
     }
@@ -1869,9 +1869,9 @@ static void partsN(log2)(FloatPartsN *a, float_status *s, const FloatFmt *fmt)
     f.exp = f_exp - frac_normalize(&f);
 
     if (a_exp < 0) {
-        parts_sub_normal(a, &f);
+        partsN(sub_normal)(a, &f);
     } else if (a_exp > 0) {
-        parts_add_normal(a, &f);
+        partsN(add_normal)(a, &f);
     } else {
         *a = f;
     }
-- 
2.43.0


