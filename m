Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261141dyc;
        Fri, 4 Jul 2025 07:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4SLfprqp99BYR6b1+PeskIQ4fFUzKc0D3zg0X1nV8he0KX+OhBc4FFxS4cFc38/ZF4uRRIszdjdNFeg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJby5G2GTYG7+bRkLBZg7+J17+erMSnTiPC8A25YOL5/1qPZvLS8m94e4j0aJA191eV9w2
X-Received: by 2002:a05:6102:3752:b0:4e9:a2bd:b455 with SMTP id ada2fe7eead31-4f2f1ed7245mr1579637137.14.1751640066390;
        Fri, 04 Jul 2025 07:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640066; cv=none;
        d=google.com; s=arc-20240605;
        b=lIjP8frUOi4Xx+r3gMCd0fVC9h6fhyZkQQUYs45f22eURW61CY3GVob+CbjIullS4o
         7kccYfdQhchHo+0WQ0FjuTwNV6C0nKy7NfLZXY2K57nX9D4Ht0BD+26aXI7cLQM7npN8
         cly6IX/gK5txJX2P5cgck+lVtGnraxtsS4Y5eg+QBi0s14siDCcnUJG2ppX1wnJWIXBp
         r2I6NPAtO0UC3Bz3OUqSgeCXvgN2KDitdBWdk/56Ik/LXZ9+765aVppYPT+HJJUojR3i
         MFgpE/c9f9ww+c/wvt8LpRggLE+huL5SKQfr4rCEjEGJfeLRw674gCuuMFIcA6vjYNe/
         Rw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XxuhX7jAE01wypOCiSa4edSMsIBxfbscXCFO5YQqXuQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=FIUiZMrP7jCjd4VcW+IM8piDjZX2AmQxN+y06gVduK2q4w5ODJM9DGPljZgXdcePRH
         yeaSRr2e8rQ0fK93PKizdddaNFZP63Bh+9+IgtzacI094g8AvhM7G9QAVmSoPkvzmUFp
         aSh6deLpfskETa23nTyQ9w3u1eheeRwIsZgX6uw2V4WNbRSmv5I1KnVhbAlmUHSJc+Lr
         fCy3qxtO3NLwrn2qdq9oZ6aOp6gMGeMPJF2Y1+SRIi/IeqSQVZpFnNMJPmYoxLNh7vJt
         hEPfvSQW3A4CwW91/ZCtJ+G607X4BUIMpnM6iU4DLgaxMi11MWG9Qfw3/aeYrxYcFIH4
         99FQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dCd9yaEl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea6e45cdsi668868137.317.2025.07.04.07.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dCd9yaEl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhYo-0002De-Cu; Fri, 04 Jul 2025 10:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPG-0002WD-3p
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:28:52 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPD-0001RP-Hw
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:28:49 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2efdd5c22dfso748963fac.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639325; x=1752244125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxuhX7jAE01wypOCiSa4edSMsIBxfbscXCFO5YQqXuQ=;
 b=dCd9yaEljcC4kA5vrbABv86ELmBZkQiE2E7rGc2CIraIy80aOJPVO/QIaKMbzdKN7y
 5gd9DzmnbPPbhWYY1UWCqJs0OM9LkAIbkq+rnDLBNU0Dv4b3k4oJ/Vm9q0CToQ9xsOcX
 FgshwUuBYhK7QNcvu8OilnQlzXK8jnSIZF+7Z4DkbdhsdSXZBan5IDu56BriX2aAF0Km
 4IgwiqLfM996+yu61vvcg+6d4rGaT2S3+gpSn0GfQdMTjtxxMbTV67qfr9igjD84070o
 ImD6qHPBVOXVzCUZmDHoePt3wevhMA1kj2pc4pPpWas5AR1NaMXmncDgt96oZw7aC8do
 8F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639325; x=1752244125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxuhX7jAE01wypOCiSa4edSMsIBxfbscXCFO5YQqXuQ=;
 b=s/3UgLGe7nZJxVqoId+/6oAlmaC0caSfriiJY5heSYKxbDe5GPxUteGZNhEyFJ0qbh
 KMuBjnSZ9yzOsToNuogJ15slhmoWOTCpGdoS5bSQeafJ7+w3aWxj6rSv9aUrHWtMtNwm
 c9cMD0Pzo/n0zZLKmM3UTNtr+rq3ILxR/8V0ptUVe3vDwe3ZXpjrX28jE4aj+60dw9Wx
 0w2debQvCejycOqMiwjWkKD4NSBILvqfVqsXXzTGm/fQlhy/vxLZ/mCe6Q9j0XzJE6hr
 3KPryZzZor8kNU5xXV4m6Yuo5KgYe7yQ6cLvOqOMhl7Rkr/UazzYES8DDf/RmfIDZAp7
 j0Xw==
X-Gm-Message-State: AOJu0Yy+zP9aCq1+NhTvrIp8Vdm8w7XYoAskNVqJ2aVWqRGnkBFQ2cnd
 UnEEYY1jzbUyL/CvuH7mMMcKcS5YzNzXAd0LScWUzVFTJlwG9Kvzbc9QOsss76MkCVdI7TKlMUr
 rvw5mEQA=
X-Gm-Gg: ASbGncsRqqfu+lVvYHI012EZ6y7poQggBhL0NuKeWc+wpJd+7vOsODPJHmEquCVz+qe
 fFBjLkNI6a1ADZDwgyEekfgI/Y5EzN2lP2I3QLySI8BF6Jah5pnnjNS8Fn49xMRFI2+2XDJfoBG
 ZRx9Nf25tLNWUJDLBwuKl2dwjMp0kvvIcdsnZ1gYZPzQaalrH1qUSuE1g0DUcqD5seEWWE9jgpv
 5KfYLXyQPYWBuqTVBVynTRWvAWI3xFngKQ1bJe2+lhXDFnTOWjy+NStXH5DQSV2AyW8eY890uzc
 /OPUdZ4hwXnBseug0nhmAff/mipHcVY2aLW8F2nc7xORN8VCPKWQKiVesa8/MV25eLmEzGiRQLd
 sV1QKFOo4i16v28MDIqE8ePHs0jkXJJeyIr3BHSFBA2Ow97DK
X-Received: by 2002:a05:6870:d207:b0:2d4:ef88:97af with SMTP id
 586e51a60fabf-2f796b86111mr1649502fac.3.1751639325343; 
 Fri, 04 Jul 2025 07:28:45 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 086/108] target/arm: Implement BFMLSLB{L, T} for SME2/SVE2p1
Date: Fri,  4 Jul 2025 08:20:49 -0600
Message-ID: <20250704142112.1018902-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ld/QeGwCq+7e

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  6 ++++++
 2 files changed, 36 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 05c0fc948a..079d310960 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7421,6 +7421,36 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
 TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
 
+static bool do_BFMLSL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    if (s->fpcr_ah) {
+        return gen_gvec_fpst_zzzz(s, gen_helper_gvec_ah_bfmlsl,
+                                  a->rd, a->rn, a->rm, a->ra, sel, FPST_AH);
+    } else {
+        return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlsl,
+                                  a->rd, a->rn, a->rm, a->ra, sel, FPST_A64);
+    }
+}
+
+TRANS_FEAT(BFMLSLB_zzzw, aa64_sme2_or_sve2p1, do_BFMLSL_zzzw, a, false)
+TRANS_FEAT(BFMLSLT_zzzw, aa64_sme2_or_sve2p1, do_BFMLSL_zzzw, a, true)
+
+static bool do_BFMLSL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
+{
+    if (s->fpcr_ah) {
+        return gen_gvec_fpst_zzzz(s, gen_helper_gvec_ah_bfmlsl_idx,
+                                  a->rd, a->rn, a->rm, a->ra,
+                                  (a->index << 1) | sel, FPST_AH);
+    } else {
+        return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlsl_idx,
+                                  a->rd, a->rn, a->rm, a->ra,
+                                  (a->index << 1) | sel, FPST_A64);
+    }
+}
+
+TRANS_FEAT(BFMLSLB_zzxw, aa64_sme2_or_sve2p1, do_BFMLSL_zzxw, a, false)
+TRANS_FEAT(BFMLSLT_zzxw, aa64_sme2_or_sve2p1, do_BFMLSL_zzxw, a, true)
+
 static bool trans_PSEL(DisasContext *s, arg_psel *a)
 {
     int vl = vec_full_reg_size(s);
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 10cac2de22..0df3312739 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1727,18 +1727,24 @@ FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
 BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+BFMLSLB_zzzw    01100100 11 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_ex esz=2
+BFMLSLT_zzzw    01100100 11 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
 ### SVE2 floating-point dot-product
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
 ### SVE2 floating-point multiply-add long (indexed)
+
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
+
 BFMLALB_zzxw    01100100 11 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
+BFMLSLB_zzxw    01100100 11 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
+BFMLSLT_zzxw    01100100 11 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point dot-product (indexed)
 
-- 
2.43.0

