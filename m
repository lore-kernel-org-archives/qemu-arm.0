Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984865njb;
        Mon, 9 Sep 2024 09:26:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcd3oaCg9vvyFMImCkx9EdsTKNM10jiU1vyykfZA8vqxeL9rvFgv63ne32J8p5Yk5tZFsUo6a6RrhVDA==@linaro.org
X-Google-Smtp-Source: AGHT+IHbqBbbRXYespbz04yliq2DNazrQ3bQuL+iUaEFsRjN0DrtqMwHSZ6CY+UEcIDe720cEezk
X-Received: by 2002:a05:6358:5f01:b0:1b5:ff94:adb9 with SMTP id e5c5f4694b2df-1b83820543cmr1472699755d.0.1725899180910;
        Mon, 09 Sep 2024 09:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899180; cv=none;
        d=google.com; s=arc-20240605;
        b=VJcf4I2KdkKM2gy3hQWZ0p0dkMmpH9uM076LxqmD3TrnQ1II/2ZuMA4MrntVJerGjj
         TnuicAxfspwm+RkyppEz28EujxllAt5xCDAGYd2tKGeUdx4i0+E2/4WfpBTziHxT+GHn
         sC/hu4khxL7/hkVbHagUhgcLkMpA1NYk+rvwbMvNOGk0nuPtOmI527SGVD7waX1UnO8N
         t7zogZ0P/ut1BbYh2pFhSKaggCphIkU881zm0Rtm/GMvStbeX2Zvb1xqrMm3ru5ttK+e
         JMiX3Rt6Xr2OCuOZu/ozV7FPtz8kC/L9qAwFdiFgymIVx1zuPZC+qtXDRJcv3KhnjaKf
         Lp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XrDRzJ/c9VTiTIrd51j+4GPvZhjTs3/9ON5FInLeosk=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=f/nmkEdXYM4b2vdpHCeVxmIl13I4XSsrpaAvilCqz8HpVowLnvu0ZEFzgWDfkLaJmb
         WoBMggTnfvS2iwRrgjwCS9feo1Z3E6ERiUr+mtqA8+M5JeA1JJDXdcqfV8vNUb+Uo5Lv
         pJCrHxx4jz+0m1BNb1naLy4EFl+cGIoy+rphrcjbnKFvpX/H9U+jE9/2+mxWVCAFc28B
         3ULn44zzTbDU2Gf4PguOOEALKODsEiBGuxkbX+bbdauiYb/BZPO4/hAtrS+RhVUEq0jf
         Ga4hzrlwGs6l9S0xXxfHTHgsRd2I7vLpdws32PjAowQypX6SBmyo70ra3Y9S0bvkNb8/
         nxiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ulad8Ql3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a359e1si592419985a.368.2024.09.09.09.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ulad8Ql3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snhAD-0002PL-2e; Mon, 09 Sep 2024 12:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAA-0002DW-9W
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:22:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA8-0007gu-6A
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:22:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20543fdb7acso31131595ad.1
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2024 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898967; x=1726503767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrDRzJ/c9VTiTIrd51j+4GPvZhjTs3/9ON5FInLeosk=;
 b=Ulad8Ql3bHf3qzyx7W0DEXebY9otZR0yKuZtK+0O4AoCo3rbNWntHWAZV2lZIADfRM
 oGQjEO4eHRRRslPDYU2VAtrqkWJjq1q7XFslQmqz5raOCFhLl0UGCAEdGFCiwF+2oDSc
 pCXL2wJowcyiSj97FU2zkD0UJAynYqkixUreLCmYcgsbaEvJuPFwWQVOFSRugchbzgJv
 bOkQWYO6AbT5dbEpyLwjbmJnJYPjMKGY8sNqBDMteIjZevRp2YmcNvsgIhhikYJo4Rwe
 BChZ73stO47/CNBUDGel9IGOtoH2B54rVXAzXhox71IQpA3fAQQ8yHZHa1jfyfu5Jnsu
 DhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898967; x=1726503767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrDRzJ/c9VTiTIrd51j+4GPvZhjTs3/9ON5FInLeosk=;
 b=XFHyzoQ/DosPuebMhd1Y55P4vOe2wpOED1fKeoFINrZDPr3gqwrsdcXtFWH8s++WQN
 XjX4l6z3usG04QAVCI0xM+m/5f4E0XrsSgtfj5Wp47cVsupqe7hx7saTzWbOlAlJlrEF
 7PlMZN2k/1EuCsiE8X9s8JJvN2G/2JKcPFvXl5VwSY1ihRCqnFkMFCFd00o/lFEkxc/s
 oUIs5sNELhq1Fj6Nxk+ZSrTV4MRtKAN9YVtOZB+1P/hGUYRkbsP8XyHkDJBZHP7okyji
 /KU8Y7IXJunI5bR3hYE1gwKWY71cI4JlyLO4+NxSo+t0xnhzvD2l+KtlUF8Lj6vH+f++
 I0Cg==
X-Gm-Message-State: AOJu0YzAYRKDsy+1Gwjnn66vWA/tXdf1lVncGiO2U9zFbReCLBWMP0FZ
 K11NQW5vMDCm6vpHtlmuz4Z2Lp81CQqjKZnjsw1whKdo9xr5E7o50fighQU8bxSyrnwwDIyB6zp
 c
X-Received: by 2002:a17:902:ec87:b0:205:7b1f:cf6d with SMTP id
 d9443c01a7336-206f053113bmr123784875ad.30.1725898966902; 
 Mon, 09 Sep 2024 09:22:46 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/29] target/arm: Use tcg_gen_extract2_i64 for EXT
Date: Mon,  9 Sep 2024 09:22:15 -0700
Message-ID: <20240909162240.647173-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WRZ+Jcq8abY+

The extract2 tcg op performs the same operation
as the do_ext64 function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6d5f12e8f5..1a0b2bb33b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8890,23 +8890,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-static void do_ext64(DisasContext *s, TCGv_i64 tcg_left, TCGv_i64 tcg_right,
-                     int pos)
-{
-    /* Extract 64 bits from the middle of two concatenated 64 bit
-     * vector register slices left:right. The extracted bits start
-     * at 'pos' bits into the right (least significant) side.
-     * We return the result in tcg_right, and guarantee not to
-     * trash tcg_left.
-     */
-    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-    assert(pos > 0 && pos < 64);
-
-    tcg_gen_shri_i64(tcg_right, tcg_right, pos);
-    tcg_gen_shli_i64(tcg_tmp, tcg_left, 64 - pos);
-    tcg_gen_or_i64(tcg_right, tcg_right, tcg_tmp);
-}
-
 /* EXT
  *   31  30 29         24 23 22  21 20  16 15  14  11 10  9    5 4    0
  * +---+---+-------------+-----+---+------+---+------+---+------+------+
@@ -8944,7 +8927,7 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_resl, rn, 0, MO_64);
         if (pos != 0) {
             read_vec_element(s, tcg_resh, rm, 0, MO_64);
-            do_ext64(s, tcg_resh, tcg_resl, pos);
+            tcg_gen_extract2_i64(tcg_resl, tcg_resl, tcg_resh, pos);
         }
     } else {
         TCGv_i64 tcg_hh;
@@ -8965,10 +8948,10 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_resh, elt->reg, elt->elt, MO_64);
         elt++;
         if (pos != 0) {
-            do_ext64(s, tcg_resh, tcg_resl, pos);
+            tcg_gen_extract2_i64(tcg_resl, tcg_resl, tcg_resh, pos);
             tcg_hh = tcg_temp_new_i64();
             read_vec_element(s, tcg_hh, elt->reg, elt->elt, MO_64);
-            do_ext64(s, tcg_hh, tcg_resh, pos);
+            tcg_gen_extract2_i64(tcg_resh, tcg_resh, tcg_hh, pos);
         }
     }
 
-- 
2.43.0

