Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802194njk;
        Mon, 2 Dec 2024 05:14:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4eM3gzHbVO+gmjmKAixdLZ7xvLILpE9aoSt5q1HKQCBniMeFppgOs6oBnxqmS9CX07R2r6UKpNpXfSA==@linaro.org
X-Received: by 2002:a05:600c:458b:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-434a9de3d04mr171211765e9.21.1733145270231;
        Mon, 02 Dec 2024 05:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145270; cv=none;
        d=google.com; s=arc-20240605;
        b=QE6HLGTjDRZynQdCSEPYPNxID7313DwXu9yttzLI30p9c+Sy0WOiCRErJxthWOE3JO
         QOuJGtXiE0e9prx0mDYfgPL7OXLyjkaM/f+FfdEvQSMMof6XuUkakGVN3ce82opRMt4R
         HZHCAFPtJQMlT0ePtLQeYKlrXDNE+fEue8YIOUol9NSxOI0AYb5U4dbLbmXw1djgvZv9
         01rZL+JWbgc4MiYGy0Jld74jXybbxELFwqY7I2O9pzn7Gf8a7UIUXpCnN164xKTLYPMK
         ILHgNxwGJI4FBSphcqBeuFPeWyrW102QUGye8rZTRXrmop42/pGeKtIV85mXqTXVADmz
         69PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=74ZFmjtVXHtNex2HC0gYU65u2vZGTycqwogjuvw6ju4=;
        fh=Wg+iIFB6EBYZpX/kXPS7+IqSnvXVhFBW8GuaxsRXx1M=;
        b=lfhIqOEj3zp8qQm/oLshU94Tat0HqzXedHWsf9QDlUJ3KrZh+DaWt9m1+3gjvSbuWn
         UG4amvRcJAfn2uPWjtB9uSI1o5XuZR2AwDm00xRWYb60JVEsEC5OEOsAPaPAD7Fq9fwH
         y7nYByvxODhcsdpFQF0LnszDIyq+YO5ObqdxGGKZxKZfiK/gTXRHCNAOBDr/ECmCYZtO
         XlZl2BNlef08L8BYohk2df/gUV6m6sS36BmgYkoC80fos7greBo4ppYM2ay6gunmd5+H
         QExh4Rtg8FNtXWKRSPR8ZsPpCzKH71cqBgG8OxEydacHR9ExdqMm1o131VgaBqNxQkur
         YN+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ko2aa8Lg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385efa1fef3sor750779f8f.4.2024.12.02.05.14.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ko2aa8Lg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145270; x=1733750070; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74ZFmjtVXHtNex2HC0gYU65u2vZGTycqwogjuvw6ju4=;
        b=ko2aa8LgF0Z6sD6RYRoaXwmdYdZS9t/GT0G07nRnyQFD2h0fsdfABw+7yQUJ/cvfJT
         YColFEyGj9qLrHPmQyDj+kBHngRvHp41hPn4mYT15VAg0klzM6ujQtS9VssIHHBe7/Tw
         MHlfskF8vrZGnsiscTi0I5pqFQa749yFCulg2SPPE6Gl0vOK2VYTk++lnl6NcG/iqnaX
         R+VIMxwvg1k85FKCOY6NvNUF117nX3wap34tZzlPt15GW3upKe9pHpDC/07mrKapZv0s
         DsH8hTEY2sidjvxCe94fBdK5/zcr0nsIV41V71aq/BUBTzuAiUCMid94VW5mT+yQMNFG
         eGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145270; x=1733750070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74ZFmjtVXHtNex2HC0gYU65u2vZGTycqwogjuvw6ju4=;
        b=kkauw0qEiUt/SJom5zXr1ORllXy2DM8CStweX4rA9cgG00+K4JWvn/0f9bzFefuTU0
         nqV9bM8+1MT6nYCEFH8/+0DkSKhO+BdIDhDiwCTboO9o+UrBRZyIMxfzkP+IHsK/GWxt
         s5QYgUkADu5Ki15vhtirtg4gE3Xjfl3fw2mJ05zrSVA0rUZ/iLuf7LvpqG7+cmnsVwI4
         14myCG3V7tue5GiEGmHYY06toA4nFz/7BH1DExniwxm8UgF9Msc6XIdItsRBttsPm7Jl
         4BOkJaAXYBZG/HwMFrTOD0QpWxE3kiRGZeLtc6JU1Gm1Ward23T3DSV2j91WG+CLcL0x
         b/CA==
X-Forwarded-Encrypted: i=1; AJvYcCVg2r2ANch6l05waRrN0Xvzyz9My2jaTPUohsJzI8JNyLBSeWiYKcjudwdKvv6R7r9QLmadSbpF1REVEw==@linaro.org
X-Gm-Message-State: AOJu0YzXN/tZUQegUL/NqLYh0l7WuyTQpsuWCH7gtvfcYI43+uxCiCgR
	sPQyodfQN0b7mj2CqEoAacQ+93geW6FvjYDGsFL0IuM8eKRwRfZy3leVHPl+mc70nQ==
X-Gm-Gg: ASbGncsSg4BnfuxEYkB4wgcvBKTJSQ3NsSt8TeffUCmQAGFp4GjiSbeRLQQK8S3GqaD
	tXfqHFCVzsmqrQ91WzzVLrS/ztNXbbjAUJOAt8YLchGKf3i9SOC8LejpKIpA6Z8BoZXBHwHZKw1
	mhdWHGwIe+tdQKiNqFg70X4zbAFfwNh0yzcUrRdnPpwW7ZvCgrapuWgfDWOZfBUHeTfbeNzzXhk
	i+xADyHZneeOXU3SJJLaQfQmPrdzRrRZl40coonP0NObUlp2CoDJwg=
X-Google-Smtp-Source: AGHT+IFTXydxmNqzHUMrjLYeqi7UUKW4Cm6RESZeQThmbS95R5edyOboW/pND1+LCIW51N2TZjvQnA==
X-Received: by 2002:a05:6000:156f:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-385f0c94ea6mr4495634f8f.33.1733145267678;
        Mon, 02 Dec 2024 05:14:27 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 22/54] target/mips: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:15 +0000
Message-Id: <20241202131347.498124-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tSEHmZ3ZHjWu

Set the Float3NaNPropRule explicitly for Arm, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/fpu_helper.h       | 4 ++++
 target/mips/msa.c              | 3 +++
 fpu/softfloat-specialize.c.inc | 8 +-------
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index be66f2f813a..8ca0ca7ea39 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -29,6 +29,7 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
 {
     bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
     FloatInfZeroNaNRule izn_rule;
+    Float3NaNPropRule nan3_rule;
 
     /*
      * With nan2008, SNaNs are silenced in the usual way.
@@ -44,6 +45,9 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
      */
     izn_rule = nan2008 ? float_infzeronan_dnan_never : float_infzeronan_dnan_always;
     set_float_infzeronan_rule(izn_rule, &env->active_fpu.fp_status);
+    nan3_rule = nan2008 ? float_3nan_prop_s_cab : float_3nan_prop_s_abc;
+    set_float_3nan_prop_rule(nan3_rule, &env->active_fpu.fp_status);
+
 }
 
 static inline void restore_fp_status(CPUMIPSState *env)
diff --git a/target/mips/msa.c b/target/mips/msa.c
index cc152db27f9..93a9a87d76d 100644
--- a/target/mips/msa.c
+++ b/target/mips/msa.c
@@ -66,6 +66,9 @@ void msa_reset(CPUMIPSState *env)
     set_float_2nan_prop_rule(float_2nan_prop_s_ab,
                              &env->active_tc.msa_fp_status);
 
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab,
+                             &env->active_tc.msa_fp_status);
+
     /* clear float_status exception flags */
     set_float_exception_flags(0, &env->active_tc.msa_fp_status);
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c4d8d085a98..28db409d22c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -505,13 +505,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 
     if (rule == float_3nan_prop_none) {
-#if defined(TARGET_MIPS)
-        if (snan_bit_is_one(status)) {
-            rule = float_3nan_prop_s_abc;
-        } else {
-            rule = float_3nan_prop_s_cab;
-        }
-#elif defined(TARGET_XTENSA)
+#if defined(TARGET_XTENSA)
         if (status->use_first_nan) {
             rule = float_3nan_prop_abc;
         } else {
-- 
2.34.1
