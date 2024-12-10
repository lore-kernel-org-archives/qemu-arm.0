Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3443577njb;
        Tue, 10 Dec 2024 08:26:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3l4eaaMBZ/iBkB08xqz0aHS6E7SXVCflC2GvKlHfulpM2IR4QZ0QntuP5zPyH8YWlZhAeYWgmU91JjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IExwuYiGYRsf0VkLGxoWzE3lV2JYTEws3jCo9OwiKamzHhWCR1K/YDyLC05+utmDGkh16DP
X-Received: by 2002:a05:6102:290c:b0:4af:fa1b:d905 with SMTP id ada2fe7eead31-4b1160db686mr5890716137.14.1733847997585;
        Tue, 10 Dec 2024 08:26:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847997; cv=none;
        d=google.com; s=arc-20240605;
        b=lUfSNz/JXTsrlAthzGZbhq2r+G1haesfvoiMy6goWS1Y8FgOFMRq74ZJk9QnBEjLts
         NbTA16Hj+9TDCAFvbIHayw0E15uDSFBhB3wBjaQJrB6duedtljrRW21FIb7Bjquu9j2O
         t/9CYVZEGeVppHj7qvaNI897L8B4bbb6swtVEPcrkVOQsIA+ePRIeJKzbMG+A2L12Ppc
         N3iKzDs30Bfksd10p3W0AeIZ0g3GNRYniRCUfvGOcn2R0jvKlpeOfEiEKsAnGuRhW3sW
         fGM7KnGEtTP173grU6tLmKhj1AIZV8qNKUCCCb089bAe4dsbIwDRHQnXBJLoQt0g90Mb
         CVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TrtbMxhB7QypfthbdI/dreoH2lLNkOWwe1R5ZbE+fj8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=EecHO9q5ItcTZDPdr8kepWkeHYO1zNtxthglR2jjZRE1WBHrDZGr34TDDccjxBp148
         f//SDGtDIKx1qnoJgkoYQQ5VP3X1mk6A2oeuyhyjKATnPC2SY7rPeffo5TiEapoQErn4
         ARUnnL6pFJP8KI8k4gS+MEgauefUo1rRGdUoRO3qvTclXAN/6+/TmRiryR6zhpgAGPTC
         B+H3pfN+rz+OYoRmbZIKx8EjaLm/NG9/LGSr/yqtw+cfV09Nxfjh7fZkhSyW5wUsHppt
         wdc/yqh58KpGw3Q/Ji1g3pYtQ7rPNwVg3JNTA3ot4gM5O9EZMbRdYC28bdSuR9e3vA0l
         2aXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEKSaCta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4affb4b349dsi1122086137.559.2024.12.10.08.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:26:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEKSaCta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL32k-0000Sb-Rd; Tue, 10 Dec 2024 11:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32N-0007th-4v
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:41 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32E-0007WH-VJ
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:33 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso3385696e87.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847860; x=1734452660; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrtbMxhB7QypfthbdI/dreoH2lLNkOWwe1R5ZbE+fj8=;
 b=pEKSaCtaL97guwQWI9C9KYADOxffjoilOwDs4998ytAFVVtkrDOjJ74K62TWqETuZE
 1dCOyO6Z2VzHIh2tDWK4LK36tdk3OIq8YWyl10rF3X1cWdY1dWMn+KNoZGb8OQ97z3NW
 UN56QWziXuHxQ74sez3n+xsLnKZ1I8lh9peFkeuMo03U3f8gnTi4aqWoZ57ii0MvDGkt
 9zV2zqPjOgoRt15uMXMVTuW1/qJz8c9WatH03gZRztBy5tcrh84S++chHXwRGAKFPBXt
 wh3Qz3fvoDfVgAOA4lqHSII20kLc7vE0lZz32bLYBqn3vbcV5v5jV044qz3y3L/tvg4L
 dV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847860; x=1734452660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TrtbMxhB7QypfthbdI/dreoH2lLNkOWwe1R5ZbE+fj8=;
 b=WtGrVp/R1mvbWuVa1nsrkkGLfvEFm2P6YCdER5xA54ILbfkFZAOahtv5xvrJXxes7L
 hch2LLMtYr0KKKodc+AgD5p7pCnGiFjAC6lEGxCqe+8UdzvIfgidBfe8yHB/xT08eLgS
 4h4wVfAmRlxFCpQrlorwmMdnqRoPZH+tIDUzQpG6P3yTxt+31xdQw9u7z3So5IFMXALJ
 5hLdRlQaAJ+r0vgMKk9AKEAbOIhxUgV4de13JmVFGnvCR4A6xr3n9LYgeLlIk6/PhfjU
 SsLHpMd+QR/I5ppuiaELhVJ7fXiHJ8A5YZ+M07afG1ylFa5Cdrz9b8H8UnSQClPoOJnH
 he9g==
X-Gm-Message-State: AOJu0YxV5zYp1j2IjDsBy4K0+dh9yk7zQqh/4LOz368jzcWzqNppz4Xk
 Q2kVPUZ+8plXTNA6/AKykv2ka9TSjPzTUdQGDkFH3zQpZovg9mbCJ/P/JUgh9no=
X-Gm-Gg: ASbGncvU8BZqGqNWfqXmcD6Jcb1mFicx+eXPXJrIGW8WmKBzHM700RiRvBZzHGkgizo
 gUAbSljm+gnXhHz4qvHGeZnEzTyqQI2DMxzxYOuCVuH95alb+slqDtXQCrSrGVo4HJPHDOgADuT
 qZSdSgoWpXbQL7mz277JaeBEo8mTpOQWcjYFKoUvn/umfGBg2qpGlbzaRHjZavNDZohRJ1bcKlz
 uCeeSk/PLzJUC69FjRWXKylzDGII1O6vnWNopWxE1b6AXqMeDiwTS3Sv38=
X-Received: by 2002:a05:6512:6cc:b0:53f:22f8:74f with SMTP id
 2adb3069b0e04-54024107643mr2084979e87.44.1733847859655; 
 Tue, 10 Dec 2024 08:24:19 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:24:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 53/69] target/arm: Implement gen_gvec_fabs, gen_gvec_fneg
Date: Tue, 10 Dec 2024 10:17:17 -0600
Message-ID: <20241210161733.1830573-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: 7wfFxcNEFimr

Move the current implementation out of translate-neon.c,
and extend to handle all element sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  6 ++++++
 target/arm/tcg/gengvec.c        | 14 ++++++++++++++
 target/arm/tcg/translate-neon.c | 20 ++------------------
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index edd775d564..b996de2c15 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -602,6 +602,12 @@ void gen_gvec_uaddlp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_gvec_uadalp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                      uint32_t opr_sz, uint32_t max_sz);
 
+/* These exclusively manipulate the sign bit. */
+void gen_gvec_fabs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz);
+void gen_gvec_fneg(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 2755da8ac7..01c9d5436d 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2697,3 +2697,17 @@ void gen_gvec_uadalp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_fabs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz)
+{
+    uint64_t s_bit = 1ull << ((8 << vece) - 1);
+    tcg_gen_gvec_andi(vece, dofs, aofs, s_bit - 1, oprsz, maxsz);
+}
+
+void gen_gvec_fneg(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz)
+{
+    uint64_t s_bit = 1ull << ((8 << vece) - 1);
+    tcg_gen_gvec_xori(vece, dofs, aofs, s_bit, oprsz, maxsz);
+}
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 0821f10fad..b9b3d1c1fb 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3041,14 +3041,6 @@ static bool do_2misc(DisasContext *s, arg_2misc *a, NeonGenOneOpFn *fn)
     return true;
 }
 
-static void gen_VABS_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
-                       uint32_t oprsz, uint32_t maxsz)
-{
-    tcg_gen_gvec_andi(vece, rd_ofs, rm_ofs,
-                      vece == MO_16 ? 0x7fff : 0x7fffffff,
-                      oprsz, maxsz);
-}
-
 static bool trans_VABS_F(DisasContext *s, arg_2misc *a)
 {
     if (a->size == MO_16) {
@@ -3058,15 +3050,7 @@ static bool trans_VABS_F(DisasContext *s, arg_2misc *a)
     } else if (a->size != MO_32) {
         return false;
     }
-    return do_2misc_vec(s, a, gen_VABS_F);
-}
-
-static void gen_VNEG_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
-                       uint32_t oprsz, uint32_t maxsz)
-{
-    tcg_gen_gvec_xori(vece, rd_ofs, rm_ofs,
-                      vece == MO_16 ? 0x8000 : 0x80000000,
-                      oprsz, maxsz);
+    return do_2misc_vec(s, a, gen_gvec_fabs);
 }
 
 static bool trans_VNEG_F(DisasContext *s, arg_2misc *a)
@@ -3078,7 +3062,7 @@ static bool trans_VNEG_F(DisasContext *s, arg_2misc *a)
     } else if (a->size != MO_32) {
         return false;
     }
-    return do_2misc_vec(s, a, gen_VNEG_F);
+    return do_2misc_vec(s, a, gen_gvec_fneg);
 }
 
 static bool trans_VRECPE(DisasContext *s, arg_2misc *a)
-- 
2.43.0

