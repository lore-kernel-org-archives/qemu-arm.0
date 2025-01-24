Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp930280njk;
        Fri, 24 Jan 2025 08:34:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKjybm33zbG9/dip/IQp7qFlWEqMQ7pNxmw2gYgzXEoJXJRRx95svewQLv8g17LCHo7COIAI7+boIgSw==@linaro.org
X-Google-Smtp-Source: AGHT+IHQ1Lp1urCOwMWgCc+n46X6uGPGPYRu3T49l/8PhyDZAc2zkAoOI9lb0eg4WmKXDZco5V7u
X-Received: by 2002:a05:622a:1922:b0:46c:7844:963e with SMTP id d75a77b69052e-46e12a1fd54mr433624061cf.8.1737736498324;
        Fri, 24 Jan 2025 08:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736498; cv=none;
        d=google.com; s=arc-20240605;
        b=W51wSUxnajGhDjnR+PuySECx7ylbpb0KbeO4+imGcZCP3WXBJVOCL2bUW9N4zs+zUL
         Ry0FnYQP7D0poB6AqZ8qTnCat4QYN12nWvkaQx3bDg+td42g3MIWE8e5r9xSu1OIVIk5
         bRP5zb/HqSniGiD82Ye2TMl11yZ1bZrBekv+yV9zdy6/0EsXHnhVVmhksTcrwsvkwrTv
         qozOrK29S8+0o5LNRRQ8HxgC1y26J4bSENQr6y7BGMsN0VOkM2C0XiwJH0g8GL51t8ED
         U+AeRF1rsTrcc6BeLuVAnJPQ+JYIUUA50ouRe0uOngzBS40v3LuPN+H7m2+7fbptCisq
         /qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v5Tz/8qeASxQsHbh8eTYF0AFW/V0SNYL2us/VX5QjOQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=kFkiX6o3AiOugGY/9OfKiPPZyX0w9X2jD0JysONSzRovLz0CtxYuAfHfLp/HcxXBNT
         ECcaV7bwNIAWnztCkIWZxdkduXUNA8wqJa6KWlaZL944kA6ecv/leM+6kR6RKGv0O4hZ
         9Y2vN28/ROIF2k7uG6Dz48zy8ngHA/eZ6fYJ2S9Kf/rSNyFYTsdaWlQg5A1sxOBFeBfI
         vT6RW6wM6VMxihywI1jH/cGSYq3VmTFPMecnnkcF/EtCtOLWbvblkhSs8x9grOtVGui/
         HrduOnd9VXtQ4OE0XETlrIawMw+BaTSjfAO9XFWpj/KPAi5tgV2dQ2s/H0tMvm8GSmrd
         FUUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E03nogmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525c1b5si25426256d6.59.2025.01.24.08.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:34:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E03nogmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMc7-0004Xx-IV; Fri, 24 Jan 2025 11:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYi-0004aS-Qw
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:28 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYg-0005cv-W3
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:28 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436202dd730so16569905e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736165; x=1738340965; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v5Tz/8qeASxQsHbh8eTYF0AFW/V0SNYL2us/VX5QjOQ=;
 b=E03nogmvOwWcKOnvcfiv9M9R4vr0jCyaHIbZt0VachBund4gInyQ9oNB79iqWKZDt0
 Rl6MphP9JazBJd8kAHWQWrylJZtclXRxVnX64mVWaedF1bkJJAWVNxZ37r+AhUz4sqwP
 8w250F0peIit/BlPtz5OccedlNsh/6nrPESX2VIosbiuoVvMDSRtJUYZzM/G7tt+JkST
 8Mr+k9B394CUWbhgWCn3TC/2gb94qIaSUT1kToBeVncavmE8yHDLmCHKUpykt0omBp5g
 hqkstzMSusoIelkb6NAyX6CxVh3D3aLNVzHk9HuvYkxZueW5+Anvht1paJCfjLjQWFqM
 3sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736165; x=1738340965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5Tz/8qeASxQsHbh8eTYF0AFW/V0SNYL2us/VX5QjOQ=;
 b=GCs6lrG1cutXanLfxTTWuhbGfqELBL9ts9RT48RPv6TGscHYEeSECuBqihBpWqsi0H
 wHlYpV8LNZ7StxCcDQQM6Z+ub4bgvcyfkZ8rpy0LXe/lcTH+ZFNFpAzEGj33TKRFbWxN
 chYRNxRz4JHPsqXJLk617fb1QumQpGzgU+huJxgdlteAoAjV930Q14+DDmhLVTpldrNM
 Libidk9qKABqxqoMtji+d9ttxrhXbQBA9SYd0BHqEI0ZKFGG7F8ckNAAz1yGpxKlrx2a
 QTvxoW04gqM9MiuFLcIUYqzuhBLV7sz04Z2d4B92uhlRfANQows/PdOSPWgSOolcKDfW
 Ff+A==
X-Gm-Message-State: AOJu0YzxrGhrAj5yLwcoL4OD73OZANti2aFBnXZNxlnL/IrghAcMUr8L
 ekKkoR4FQxKPU4u6hWQs+ru5kL7fcHz0vDxHCZd/jjQZbm2JNboopgBcuyjXXyYUZNL1htaQ2xD
 J
X-Gm-Gg: ASbGncvibXW3YmpQVZLq0JK+5ETfL8BS83IVWPNn8DAwpEyTie8NXRf6nKTN6BDIkUn
 T7nLCUcm/0JMRzbzSGKoDA4x7482G9J9c3033wlXHRWSUcwDKpjaHCk7/w5qCAiCSDFS+A8NoyK
 +5Z9TuDIUlaVW++G5lsX7pnPg4EguBn+MNuUD10meW2YPflTHX8V1PjxNNxOufPG+Fv3q3Er3q6
 37/fIbBvCWsQ7hJHdwNPNCTDn/cwW2KjaFGgcrYKuRWeTeMdFEEOiRw3arQ3xHyYYYoGmjHh9JS
 IN2riehV+Eo=
X-Received: by 2002:a05:600c:450c:b0:434:a91e:c709 with SMTP id
 5b1f17b1804b1-4389145145fmr259338315e9.28.1737736165503; 
 Fri, 24 Jan 2025 08:29:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 38/76] target/arm: Handle FPCR.NEP for 3-input scalar
 operations
Date: Fri, 24 Jan 2025 16:27:58 +0000
Message-Id: <20250124162836.2332150-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rJ8Qj43Qhsuh

Handle FPCR.NEP for the 3-input scalar operations which use
do_fmla_scalar_idx() and do_fmadd(), by making them call the
appropriate write_fp_*reg_merging() functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 19a4ae14c15..66c214ed278 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6356,7 +6356,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
                 gen_vfp_negd(t1, t1);
             }
             gen_helper_vfp_muladdd(t0, t1, t2, t0, fpstatus_ptr(FPST_FPCR_A64));
-            write_fp_dreg(s, a->rd, t0);
+            write_fp_dreg_merging(s, a->rd, a->rd, t0);
         }
         break;
     case MO_32:
@@ -6370,7 +6370,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
                 gen_vfp_negs(t1, t1);
             }
             gen_helper_vfp_muladds(t0, t1, t2, t0, fpstatus_ptr(FPST_FPCR_A64));
-            write_fp_sreg(s, a->rd, t0);
+            write_fp_sreg_merging(s, a->rd, a->rd, t0);
         }
         break;
     case MO_16:
@@ -6388,7 +6388,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
             }
             gen_helper_advsimd_muladdh(t0, t1, t2, t0,
                                        fpstatus_ptr(FPST_FPCR_F16_A64));
-            write_fp_sreg(s, a->rd, t0);
+            write_fp_hreg_merging(s, a->rd, a->rd, t0);
         }
         break;
     default:
@@ -6867,7 +6867,7 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             }
             fpst = fpstatus_ptr(FPST_FPCR_A64);
             gen_helper_vfp_muladdd(ta, tn, tm, ta, fpst);
-            write_fp_dreg(s, a->rd, ta);
+            write_fp_dreg_merging(s, a->rd, a->ra, ta);
         }
         break;
 
@@ -6885,7 +6885,7 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             }
             fpst = fpstatus_ptr(FPST_FPCR_A64);
             gen_helper_vfp_muladds(ta, tn, tm, ta, fpst);
-            write_fp_sreg(s, a->rd, ta);
+            write_fp_sreg_merging(s, a->rd, a->ra, ta);
         }
         break;
 
@@ -6906,7 +6906,7 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             }
             fpst = fpstatus_ptr(FPST_FPCR_F16_A64);
             gen_helper_advsimd_muladdh(ta, tn, tm, ta, fpst);
-            write_fp_sreg(s, a->rd, ta);
+            write_fp_hreg_merging(s, a->rd, a->ra, ta);
         }
         break;
 
-- 
2.34.1

