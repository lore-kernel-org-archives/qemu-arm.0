Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143627njb;
        Sat, 1 Feb 2025 08:44:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2JUGqiDWZXmfzZVZMS6kfqTIpTaJzyMOhLuqk9Zez6KDAGXFRiGJ3ETSdMx28j0SkPSGPiNHCDYv+fw==@linaro.org
X-Google-Smtp-Source: AGHT+IH7qM/WEahr+FklUq2bvVUuRZyDMMozeGbMaR0WTpSyxsyaKFgAylbHfrwgRYMws12g84Uj
X-Received: by 2002:a05:620a:2b88:b0:7b6:d350:9bfc with SMTP id af79cd13be357-7bffcd06af2mr2403082985a.27.1738428264594;
        Sat, 01 Feb 2025 08:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428264; cv=none;
        d=google.com; s=arc-20240605;
        b=R8ZJcjt13sq9xCccgV7ykjnIrKBlW+8zGMLIog1thkG6SmHANLZhvLzjrHIRH98Xxf
         aVN5r5tyedOz8OGcOs6zrotTlMx5+nFBkyEptvge9bFGwu7a6PLAVAKqZNeNgXCnvr4a
         W4pKmp5JLXOGhrfOav4C76GwxeumgnlwjTp7BNvl59A/URhBM7jFOveBmoQvWZaxG8fh
         RtihAbakvFpAHpsAzXPU07no2bgiukLddYkbntTblxPrNiKSJfNVL3GEnjshdNKu91Uu
         uHOOCchHmnLZwMw9CLT+HNiN0IbRYr5A+dtcbNgdRQIRHgaIggHSWua6KqqAFMQNAV6D
         jk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bnhwa00yLr4VQXjWCmJB9nG9V/x9ySKrwjOdXwHQEUE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Dub1zyJQ7KZiqFZexaAhwJ4uFc4FzLvStbXVlht+ClCCRvvHxfuGv0SGCsLa7R9laX
         yplYjIxojpRgJ1ScV86UyiNs9prVfkfSyWqXhZmDcFAItTIDm3oW8bE/ESwo2L6q+MWn
         PFXviFBPP+S1m+ywgVmRseDBWw/TLee//BY7RstfLSB9EGwWlpIpaKTMwbHIez0k6DNt
         x1+qHrWH4AteD1+sou8z3wkfN4N+2bZVCMP9NsjRXByPk9waigTNAzM+MycCfm/iKkGk
         BgZlZJ6qzox99+OPliyyq4bYd8mVdn8aGfX2cpbX7UysUNL0xFQG/qv/tCg19g7ePFXa
         01zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cfrKCUxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549a1459si59875496d6.308.2025.02.01.08.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cfrKCUxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY6-0006E6-Nn; Sat, 01 Feb 2025 11:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY4-0006CU-3k
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY2-00018u-JK
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862a921123so2087472f8f.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428045; x=1739032845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bnhwa00yLr4VQXjWCmJB9nG9V/x9ySKrwjOdXwHQEUE=;
 b=cfrKCUxXZ6xK1BmbSo6IBNkPcWlFVD2yVmKin3s3kp5RgaDT9iqP7D7J69bQgvapah
 5f7lLBFB+epTYgzMqJgFPXC4JdYOfxN5ufAlnzjpPtKMNOAJLPrY8np1oC8H40c7td+p
 Br9DulEvimvDQy3F5zqzClzCnwmQnbCf4IRDZLk45uOSUvkkCYI5+Kav+018Ub3EIvNh
 8Bo7/Yi9tPuk4D0b2fsHyeBYXDOfRUgOivUQJcEvn/LCI5swXMigclOC8IOxzjTkg5B5
 oKrbfns3VBT38CSunNsdZvE1iL57/izW/hQ13c1i6md/QotJJCAkUt6moUgfHA4A0jr4
 +lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428045; x=1739032845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bnhwa00yLr4VQXjWCmJB9nG9V/x9ySKrwjOdXwHQEUE=;
 b=CVK8QbDYpMZtbuRwhJkNc6hfuhVvNmMl7tE50ov5ppGgVUqFD69zl8SE5Om6LJuXzF
 /nkgHNxUFQ7MRv3T3J0zFZvx8m6J9ojfTeMUcS0QwYj9DavY19gqAFH9YD32m4wDgfuL
 40gv9AxSPM6O2JR4rZcrzh0cf/7bvpXszzNdcGe96GbnZa88aUG1iJ7ZLWNX94qI0Bxx
 gVM8iSfChjh+hpRC5eCiq3+e16scw1+SMCZHdr7o1AwBFwjZ3Rpm8pJWqNo6mqzAIjE+
 U7/+8H2145wOkldlazPz2oeXb4MG0UiYt6SScVSFHyhI6NuOnVuOlaza2MCLQI34xPAI
 NCmw==
X-Gm-Message-State: AOJu0YzJ4Cj6JkwTQUtKAB6qeL7cwUpYsytfzUG0FmoM6RDQGGFz6rvJ
 xx5iG7oAmLhkEZFsNwbccLYdG8A5Wp3Mke64R2qRcFOsWKIGRDZsZ4femm7mPQu6XmYoVA/Bes0
 X
X-Gm-Gg: ASbGncvowywpuwscIjtij/KY86wQgFGKW5dCZ14tHFM0XbfJQFKZANZ08oUMGxmAwMz
 sN1z4Ur4f4E61CELis242iXKa7O2QgozuQSktyo2P6PWTW5w0A8wwX6g4IlpnVRI5XvSwlhm8nk
 Sqk6Ll4ZBRq+zq9JgBagXQppi/xFw0DfBnKlOS5lVAqtPSRNctIWlvx429wp6wNqMeFsjxdc326
 LBmrSCW7c6ry7FWiPVVXZYwzyTeTQBrE3O6MbSxFcUxiMi/gLEEHaMo4WbaY8PVBWEo1h5DALvo
 uIq1hGGC8rnCLku/nXIv
X-Received: by 2002:a05:6000:1acd:b0:385:e37a:2a56 with SMTP id
 ffacd0b85a97d-38c520964d4mr13115636f8f.52.1738428044843; 
 Sat, 01 Feb 2025 08:40:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/69] target/arm: Handle FPCR.NEP for scalar FABS and FNEG
Date: Sat,  1 Feb 2025 16:39:24 +0000
Message-Id: <20250201164012.1660228-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4099bplLrAWk

Handle FPCR.NEP merging for scalar FABS and FNEG; this requires
an extra parameter to do_fp1_scalar_int(), since FMOV scalar
does not have the merging behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f31ac3b9549..35db806d0b7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8437,21 +8437,30 @@ typedef struct FPScalar1Int {
 } FPScalar1Int;
 
 static bool do_fp1_scalar_int(DisasContext *s, arg_rr_e *a,
-                              const FPScalar1Int *f)
+                              const FPScalar1Int *f,
+                              bool merging)
 {
     switch (a->esz) {
     case MO_64:
         if (fp_access_check(s)) {
             TCGv_i64 t = read_fp_dreg(s, a->rn);
             f->gen_d(t, t);
-            write_fp_dreg(s, a->rd, t);
+            if (merging) {
+                write_fp_dreg_merging(s, a->rd, a->rd, t);
+            } else {
+                write_fp_dreg(s, a->rd, t);
+            }
         }
         break;
     case MO_32:
         if (fp_access_check(s)) {
             TCGv_i32 t = read_fp_sreg(s, a->rn);
             f->gen_s(t, t);
-            write_fp_sreg(s, a->rd, t);
+            if (merging) {
+                write_fp_sreg_merging(s, a->rd, a->rd, t);
+            } else {
+                write_fp_sreg(s, a->rd, t);
+            }
         }
         break;
     case MO_16:
@@ -8461,7 +8470,11 @@ static bool do_fp1_scalar_int(DisasContext *s, arg_rr_e *a,
         if (fp_access_check(s)) {
             TCGv_i32 t = read_fp_hreg(s, a->rn);
             f->gen_h(t, t);
-            write_fp_sreg(s, a->rd, t);
+            if (merging) {
+                write_fp_hreg_merging(s, a->rd, a->rd, t);
+            } else {
+                write_fp_sreg(s, a->rd, t);
+            }
         }
         break;
     default:
@@ -8475,21 +8488,21 @@ static const FPScalar1Int f_scalar_fmov = {
     tcg_gen_mov_i32,
     tcg_gen_mov_i64,
 };
-TRANS(FMOV_s, do_fp1_scalar_int, a, &f_scalar_fmov)
+TRANS(FMOV_s, do_fp1_scalar_int, a, &f_scalar_fmov, false)
 
 static const FPScalar1Int f_scalar_fabs = {
     gen_vfp_absh,
     gen_vfp_abss,
     gen_vfp_absd,
 };
-TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs)
+TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs, true)
 
 static const FPScalar1Int f_scalar_fneg = {
     gen_vfp_negh,
     gen_vfp_negs,
     gen_vfp_negd,
 };
-TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg)
+TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg, true)
 
 typedef struct FPScalar1 {
     void (*gen_h)(TCGv_i32, TCGv_i32, TCGv_ptr);
-- 
2.34.1

