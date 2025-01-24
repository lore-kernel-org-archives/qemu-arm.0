Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp936761njk;
        Fri, 24 Jan 2025 08:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZ46Zb97FzkcJBHfNl8cXGfONKuXxbHsMTM48t+7TeAS7kc0YWazw1+WuGlIpkBdW6AJD8pTf8I21nTA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4s+L1QG+YDJVLxq84kL9b/j1SvNQALOOLRMUF26bbCAXVyJI4IWT/bg8Dg7H6hGndhSYi
X-Received: by 2002:a05:6122:169d:b0:50d:35d9:ad60 with SMTP id 71dfb90a1353d-51d5b26e01cmr26794545e0c.5.1737737171584;
        Fri, 24 Jan 2025 08:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737171; cv=none;
        d=google.com; s=arc-20240605;
        b=BRMUBfup/Sl5hPcozeEEWoZGY1r3TxJDPQNcKkeSzGCvPuEPOhwF0TYCwWnikFPuvG
         na0qYPs2EX4G+bUrnBaEjCN5b+ZIyY145DM3cU3nsQk2xoOD0U7h2EcQGbIc1s7BYfhI
         CsZiagCRcET8uP4rcY5xm1Y/0mFugIQavH5Et/hYT8xphlzuGAsr3+coF81RLuth8IDX
         pLQKeelQYvCkxRkm4mJTLhvSzhEDXGl3dyehdMz/7qP7FvDFPg9STasdLRLK3v1dl4NE
         XnZ5UO4GlAtww8MPokPC/gBSaU92AWQoD9LrMoaXaNYGrnONR96zCJQw+hciUP6CV6bA
         cJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3ps5knb3sFdf6P1gy0cvrFvUI+yUM1AgSFsV6YuWq8s=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gKyxwBWWs5IcMEdwtltQMZUJh5C898vLAPUCWpOnzHtBs24Dgaqggsgrolg2dpE4D6
         +8V7eMiAA0Hh81GRZ73zxjhrPN9DgkLGnFb7/XA2nxF+n3nyZuU6Vz1jbSqFfzo4l7+j
         Y5F47itCWFe4ccySEmk/TuZ2yiKUIqSQc1I0ha2DKtRbGbF7qT7onhUk2YPgHTjLxVXc
         kf7VdWxaMIX3QQbiaIqIjMeRCM8e1jlSdSk+n0864RGVRfGlYGmjfFcA8oJF7qKhh5NQ
         8TbgXtI/3AUj7r5yJIeEqCgaxA+rckAI9lNk4GRB2K95aizNXgcagswdpVVU9rV67spi
         9I5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ls32xaMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ec43af9si1190846e0c.130.2025.01.24.08.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ls32xaMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMfA-0003qr-E0; Fri, 24 Jan 2025 11:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ0-0005is-Na
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYx-0005ie-3N
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43635796b48so15509415e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736182; x=1738340982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3ps5knb3sFdf6P1gy0cvrFvUI+yUM1AgSFsV6YuWq8s=;
 b=Ls32xaMPpu+apW9Q4Oa+F2jIWXCpbP4br0mXSNAZFKlNVOdMMQ7p5MK5CQgzE5cwLc
 I++wsSpA0jDP14Wx7Hw0KBww/eGwU9kMMQHZ40TcMPVEb8111h3h7TmVKg9y2fDwQc6q
 mxr71+Iupptp9VIy9AD/HSODQ4JuYKCzCcJHJ4L5KbIYOarC1eqENfBEh88KBuca/pDt
 Vxo7HCv7QrxdL0n588bPUxdCXeASGipkty4F/b5zwxw3Oj6++ksXgA+hbNgL1+DXSlGl
 or/k6FdhR/tQEPakEc4o1NSHNpbFOfQlBxTfXOtEUDpmzeeIG/vbztN6H5mwITlHjB85
 9BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736182; x=1738340982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ps5knb3sFdf6P1gy0cvrFvUI+yUM1AgSFsV6YuWq8s=;
 b=kz54qkGVBACW1Sgy+16Y6Si2JdldL+S0nU1wptxusSsQHndTZP3FKPeLSnnckalH9e
 ZYGZ+cC8CemIcDtxf4zuiYDKQxKt4gFGp4C4eamNWlHAcE+T/WEnAAgG8/9cQKzRWhiU
 isPjsh3AZoWUGDPXFFwqhcIHzxLi6buPvm0/TixjLIIxLQIuvEmABcFyuuDFtaeUE596
 dTwX6inT+Is5qg1IqXELKSAmk9qxMax+MwW+NDZyRAVy1sKBy70xMGgrj9jmheB2kKJ2
 tixFsvT6Jtr2O9VSCPYzN/MvssNfKi0WgiZcoklEt9ECYB9W3/qpUAayhqa9N38xi2dF
 +wkQ==
X-Gm-Message-State: AOJu0Yxjenk1y08DRuhY0+3pWHXFB7zUZvrHmroVAIiispoTmCatZGOj
 06oglb6BEVTcjNMIWTa8hzZR0fGzruyvn4dYFwu0G3xU79dP3oUFEUKfs0t/wcaucfCcuv+lf83
 U
X-Gm-Gg: ASbGncuqRUa10Z3JjzkaHekimuqrQhUYsLuaEbpvSEKjS304ODkJFXwo9st1HK2L3NI
 BUptPHXXi5YiO1oMGqh5uMLN2qPgX6n/GRDe1Zvrs7WNnEjCbB3rkR2OxqAJB58bOcs/tDUbH8L
 q/r18JK8cKGJ0elamskEIFaKrUqduYI26EQjX2ltWbre9AHO7QStjljM8aFRh/cJ/E5jYnlftsP
 Vi7CSzRC8srgecykPdXfb/hTSFYfDmaD7/17uP1zBgP7tugkCaTyloSOlH8evUarZte3YOJHPN/
 SP0edRsAX5U=
X-Received: by 2002:a05:600c:1d0c:b0:434:f9ad:7222 with SMTP id
 5b1f17b1804b1-438b885652fmr75931585e9.7.1737736181651; 
 Fri, 24 Jan 2025 08:29:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 51/76] target/arm: Implement FPCR.AH semantics for SVE
 FMIN/FMAX vector
Date: Fri, 24 Jan 2025 16:28:11 +0000
Message-Id: <20250124162836.2332150-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QX6csJzosHqe

Implement the FPCR.AH semantics for the SVE FMAX and FMIN
operations that take two vector operands.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c    |  8 ++++++++
 target/arm/tcg/translate-sve.c | 17 +++++++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 3c1d2624ed4..918f2e61b7e 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1140,6 +1140,20 @@ DEF_HELPER_FLAGS_6(sve_fmax_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmax_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fmin_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmin_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmin_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve_ah_fmax_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmax_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmax_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_6(sve_fminnum_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fminnum_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 2f6fc82ee4f..a688b98d284 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4347,6 +4347,14 @@ DO_ZPZZ_FP(sve_fmax_h, uint16_t, H1_2, float16_max)
 DO_ZPZZ_FP(sve_fmax_s, uint32_t, H1_4, float32_max)
 DO_ZPZZ_FP(sve_fmax_d, uint64_t, H1_8, float64_max)
 
+DO_ZPZZ_FP(sve_ah_fmin_h, uint16_t, H1_2, helper_vfp_ah_minh)
+DO_ZPZZ_FP(sve_ah_fmin_s, uint32_t, H1_4, helper_vfp_ah_mins)
+DO_ZPZZ_FP(sve_ah_fmin_d, uint64_t, H1_8, helper_vfp_ah_mind)
+
+DO_ZPZZ_FP(sve_ah_fmax_h, uint16_t, H1_2, helper_vfp_ah_maxh)
+DO_ZPZZ_FP(sve_ah_fmax_s, uint32_t, H1_4, helper_vfp_ah_maxs)
+DO_ZPZZ_FP(sve_ah_fmax_d, uint64_t, H1_8, helper_vfp_ah_maxd)
+
 DO_ZPZZ_FP(sve_fminnum_h, uint16_t, H1_2, float16_minnum)
 DO_ZPZZ_FP(sve_fminnum_s, uint32_t, H1_4, float32_minnum)
 DO_ZPZZ_FP(sve_fminnum_d, uint64_t, H1_8, float64_minnum)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 214aec7f83b..0fed92fa48a 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3759,11 +3759,24 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
     };                                                          \
     TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
 
+#define DO_ZPZZ_AH_FP(NAME, FEAT, name, ah_name)                        \
+    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
+        NULL,                  gen_helper_##name##_h,                   \
+        gen_helper_##name##_s, gen_helper_##name##_d                    \
+    };                                                                  \
+    static gen_helper_gvec_4_ptr * const name##_ah_zpzz_fns[4] = {      \
+        NULL,                  gen_helper_##ah_name##_h,                \
+        gen_helper_##ah_name##_s, gen_helper_##ah_name##_d              \
+    };                                                                  \
+    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz,                      \
+               s->fpcr_ah ? name##_ah_zpzz_fns[a->esz] :                \
+               name##_zpzz_fns[a->esz], a)
+
 DO_ZPZZ_FP(FADD_zpzz, aa64_sve, sve_fadd)
 DO_ZPZZ_FP(FSUB_zpzz, aa64_sve, sve_fsub)
 DO_ZPZZ_FP(FMUL_zpzz, aa64_sve, sve_fmul)
-DO_ZPZZ_FP(FMIN_zpzz, aa64_sve, sve_fmin)
-DO_ZPZZ_FP(FMAX_zpzz, aa64_sve, sve_fmax)
+DO_ZPZZ_AH_FP(FMIN_zpzz, aa64_sve, sve_fmin, sve_ah_fmin)
+DO_ZPZZ_AH_FP(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
 DO_ZPZZ_FP(FMINNM_zpzz, aa64_sve, sve_fminnum)
 DO_ZPZZ_FP(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
 DO_ZPZZ_FP(FABD, aa64_sve, sve_fabd)
-- 
2.34.1

