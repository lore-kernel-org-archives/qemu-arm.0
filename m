Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1789381njb;
        Thu, 6 Feb 2025 12:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCjoDwrN2Rg0o8BpL3B4KcUzahjf08SbCyDU7y96wDN1R6bxwPg/IsMuQtd+0tZV5IJTeA6uJNawpRYw==@linaro.org
X-Google-Smtp-Source: AGHT+IF6WsUkcS/9JflYPANo19Fs4KsLXfqu2ejhnCQ0aguhkLKK27J/rrkOUHlkPgkQkuat+NPt
X-Received: by 2002:ad4:4eea:0:b0:6e4:3459:de83 with SMTP id 6a1803df08f44-6e4455c1c01mr6196336d6.2.1738872998574;
        Thu, 06 Feb 2025 12:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872998; cv=none;
        d=google.com; s=arc-20240605;
        b=VcwDuX2Rfhf5VjI8T+rTWMaXzd4rj8ZR4k/Gt+IwpCn9L4zxbmxHq/EAqx/7Z+1Sse
         bpFoHmweEjnyX665ExTNzUS2bUAoc/BBOVT707MYtHTtQbP5wnn9rQAx2zKL7xxCp98o
         jdBhU9tK9SHPIIGD1+nAsGCUbIzdSqsrazkBV36dAe9XHmtU+/ozB+iOFBBIP70Ci6nY
         Oolqgb9k5tTM0+2NQHHzly0lX5j5w7+ZOv2LXZ5dfcbSSBN/AN1Jp0oz0EGxpbeRe9G+
         CcZfy/n1bdBgoIIA0irxXZosMQo61mfc5baDzy5iyJMdyxp2o8FMscqaO2AnuR3WTVKW
         l/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WaA26QwdbT5KEG0jRzmu/uC0u+13aOEkIOvu+re9AH4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=M7TVLAua7tCAVjLt2AYEy5gdEfCjJvh8nPie423m8z+d/wiIw2/lBSftQ/w5Au+4Lg
         DcCo96A7YwbROg4eFtBlKujGnScgJtJNOvKHIMrzAfUtlfeHvVYCUWH/Fm8PFEeLo4gp
         ecN2ZnpvIzIqmBwxF2y5mtHFup/6pij5PB7kSGn0PGUDz076gg78cl7j4YBr91Vo7hR/
         Se2Jca+tH8a5Tb4X7SrjBo6mvrcay3lPTc63ZIeXGxm2Q5oq3p6yGhK+Xvs6Sin+1nAo
         Duo9P8OnSCJ2n5+jwwZRgTMd43tJScUJFM5G2wkS1Qav6UwleAcKUjy8u5zUxCOqGgJb
         JIow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Px4sCQf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bac9db5si16901566d6.216.2025.02.06.12.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Px4sCQf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg87p-0004cB-Gc; Thu, 06 Feb 2025 15:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83k-0007v7-FB
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:17 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83d-0001Bs-RU
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:12 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2fa1c093d6eso822307a91.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 12:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738872061; x=1739476861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WaA26QwdbT5KEG0jRzmu/uC0u+13aOEkIOvu+re9AH4=;
 b=Px4sCQf6ZXxmx6EgDucHWFT/4iPUKoDlB1hK4TJ6hIbuoaVQ3cMpy+E1jy1UolMsZE
 /nCXNYX5Mxy/XP1emQd1VapGVlwCogf85yhccHHDAMzL5138wjd39x+cV7ErRIE1uYG0
 5HmNsVXfMWfvqvX4l13mIlLAfkYhUFTjRY6Z51CUbNTDF+ZKmiRnVIRA1qwHC7g76kC/
 S28TuVQud/njuPUEZXk2LpcZ0YnlislBDbylsuFSgxXbhvss0uRbdJf8bobs/ezmEna4
 oVAs40m+aMedWo6Tw6NLa3rZoepBpLbODytcZGuMQ1ar2Sd9B9UVxLBeiLl7hJ9VHkrr
 LrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738872061; x=1739476861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WaA26QwdbT5KEG0jRzmu/uC0u+13aOEkIOvu+re9AH4=;
 b=NVmnWAcPXxwu7INpYkCOhbhaQID6GTXfUakb4N7zXWKWeFdX3nrIyKehaXtGon4HQv
 ZbGZGkaTE07fNYY1g1tQ8yursKeLneuxskDps8/dLapMNF1JvZYzp2ddhGmVt33Rl3S9
 +5X/veJcynhmheDgMIyf1aEOYCPL1/XYWNirs/RlUYmhTGqy70IRZmD/Rvl9pll5YAmp
 Ov00TiIcZGnfaM+8sE5kqM137KdeyrdHiAuV5zlhqAXv6ctHJ/NqBHedyFermr5Mhufd
 SnBlv8Xrp+EpmQgf6dr5jRdB4N+X+R0M/KxevlkqV0QvHy3ZHC2YpQBln7ce4eYsu8UG
 xR9g==
X-Gm-Message-State: AOJu0YwuErOFIbRRb6TcBROBp6rtvsRE95LT8np2JhzZTRQK9hxKylVt
 yYRNHu8Mi+9jOf0gxZchTAy5ycIWac3eby9l50CSbQ2HlKNc9j2MwAL87VPEivJ6YpJvZ4xU1s3
 K
X-Gm-Gg: ASbGncuD9EN0LskPKo2TWNzY6GonAr4ENZJtF4DrRzvp5M8QS33idQNXGbNMp5mk1fK
 QjjpQ0JiUMO/uBpA2Kl5VYbHfZgSHRSfiY+P6OaAHsMamxcU4BoJA7Ki0UjzI//vMXAhd/L+GNv
 ClfzQPqyMhJVXz1KbjrfnHS0NEjRZAazxIE9UfDVbS4/aZRGcdvn/xy6ZamTURYh+wk0MvJ57se
 LurA5/bJQYrnx4CGRiP+N5tvTDlc6FIboKvuQiBa0VK+PI1ZGLjCOLc7i0hKEs+FWwhMmAToHnE
 y5H4oRYXEOFg05kleIjK3XU3Fp8D77Q0t7f3Lq+SOuqbYI4=
X-Received: by 2002:a17:90b:4c02:b0:2ee:a4f2:b311 with SMTP id
 98e67ed59e1d1-2fa2406471emr509817a91.8.1738872060934; 
 Thu, 06 Feb 2025 12:01:00 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee24sm1808857a91.36.2025.02.06.12.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 12:01:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/61] target/arm: Implement SME2 SEL
Date: Thu,  6 Feb 2025 11:57:14 -0800
Message-ID: <20250206195715.2150758-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: 7dAFfjefdH03

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 25 +++++++++++++++++++++++++
 target/arm/tcg/sme.decode      |  9 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e71e3ec8e3..78bd750701 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1520,3 +1520,28 @@ static gen_helper_gvec_3 * const uclamp_fns[] = {
     gen_helper_sme2_uclamp_d,
 };
 TRANS_FEAT(UCLAMP, aa64_sme2, do_clamp, a, uclamp_fns)
+
+static bool trans_SEL(DisasContext *s, arg_SEL *a)
+{
+    static gen_helper_gvec_4 * const fns[4] = {
+        gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
+        gen_helper_sve_sel_zpzz_s, gen_helper_sve_sel_zpzz_d
+    };
+
+    if (!dc_isar_feature(aa64_sme2, s)) {
+        return false;
+    }
+    if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        gen_helper_gvec_4 *f = fns[a->esz];
+
+        for (int i = 0; i < a->n; ++i) {
+            tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->zd + i),
+                               vec_full_reg_offset(s, a->zn + i),
+                               vec_full_reg_offset(s, a->zm + i),
+                               pred_full_reg_offset(s, a->pg),
+                               svl, svl, 0, f);
+        }
+    }
+    return true;
+}
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 9bbf89b15c..1d0ac4f09b 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -872,3 +872,12 @@ UCLAMP          11000001 esz:2 1 zm:5 110001 zn:5 .... 1    \
                 &zzz_en zd=%zd_ax2 n=2
 UCLAMP          11000001 esz:2 1 zm:5 110011 zn:5 ...0 1    \
                 &zzz_en zd=%zd_ax4 n=4
+
+### SME2 Multi-vector SVE Select
+
+%sel_pg         10:3 !function=plus_8
+
+SEL             11000001 esz:2 1 ....0 100 ... ....0 ....0  \
+                n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2 pg=%sel_pg
+SEL             11000001 esz:2 1 ...01 100 ... ...00 ...00  \
+                n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4 pg=%sel_pg
-- 
2.43.0

