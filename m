Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413056njb;
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMpC70BYSVaLdT4Y3ZVC+UHFfypWGJT7IdPWG1FbqQWH2qCXxrOKb8okPMjO7/C/artKEq7juP1p2klA==@linaro.org
X-Received: by 2002:a05:600c:1c0e:b0:434:a7e3:db7a with SMTP id 5b1f17b1804b1-434a9df221emr65652015e9.31.1732790598064;
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790598; cv=none;
        d=google.com; s=arc-20240605;
        b=QuTfxfEfbEqfZp35JeZeNVc9OI+VPES7qvhVFfF+bxJ3XARj2ioHLi97gxlkj5SUwE
         14RIIIv2zJ3aIrBWfAimkHhVXPhIGGPMED6CNTRD8uyOpCALjT5K+8zhiDeaJ6Gsw1Fx
         pbgZFT+x5TCU2/zLX1tclZVgG5A+P4Fup4jlbQRy4pVTGvr66PHDV7hV8S7YPrzoujcm
         S6JRuSSJ3mRWqsLfgZ8WmywLd/Haw92NbEbEffVoj1yoq9rpnd1lvWgvBMjZiJtG+x9V
         FDcL2mBazXDKkxAREYPilj1JJfSTx/crGGJ3p+UTNJiQywqB3r5/e12zNOdTZMKdLW+v
         8lSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4tTkIIhrcxBZurdxQEsXyUswGgpnjQ7q8C2Djt24mE4=;
        fh=yeoXavl3yNoKP/3PyEOcjquSsNNmu1hgLCxpTHn3MNM=;
        b=KaM5ON+uRRKjl7l1pSxuREVghSvwZBiMNnDTXVo0hwJtj9HR4Jiq1WGY6Paicvgy/M
         4J+4Q94CIKfr3f+aOXnEDu6iwkwnBen/Z1pDtgv3/TkBLTs9wwdNOfH9Lmcfu2m0zJP1
         XcI9kqh72+4HguvHS/dI9p49JfEL8c0aLdeK/RGfeZNBqkjyrRSV0bfALMaaKPnnGf42
         b7VqbX52V36v4lyTYy4ii/daKPSDrjQfRBC8LOHVANbD7Ujn2hmm2MFQmnII9kjNqms4
         U4w1+X+ZhE6bQberpd92Ufxm8NI0a3FTGYKHRoWZHZq/H597WXR1ZFqr6PaZ0NHjkL1e
         cZ8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqBOPyNb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a300dsor4890635e9.11.2024.11.28.02.43.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqBOPyNb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790597; x=1733395397; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tTkIIhrcxBZurdxQEsXyUswGgpnjQ7q8C2Djt24mE4=;
        b=FqBOPyNbwgMZaFC+dxB0X+sGaH3lD9ZvTgNuHqnsJbAg4d7Q2dSzOWH0fEH6bb9QJ4
         bIEjvDrnQ3mW3+TdsSNh0pFvFj/5DMUjTF6K7d1MkiQhMIBBOun6oQBWeR8fSInlHAXj
         zcrimqakLP9o5NfO8yrc3KgKKtqY8qGq61GDFX0XkK8ZIzc/Zaftll/wqixS4L29YK5n
         seCbflcsLXeH6VlXreLWo/KVKIfeKKY3qhxzKIpr3E1cTs0oxN6VBkzgIoD9ozR4tyNA
         iSjbtk7rf/ciLfj92nbdywGEjdZgWfgtW4+ZKBd3DfRE0q52swOJ8Vg8DDff9nCkxxt/
         Grkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790597; x=1733395397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tTkIIhrcxBZurdxQEsXyUswGgpnjQ7q8C2Djt24mE4=;
        b=iNiSA5FYi/BBm+9Ssju0iHFlgf0nfhw+4tJrYM8W1hvyGKX6L+xhcjjO8zCd2zUnHa
         QiCCvcQcxr3nGVNFLZcxRCpyjqTQ3YEBi+O6nPD2WRel5xiTiX437BLQuUmAMTw61anO
         QOQSdk5hvWMHgvrx14ucPUCy9VBdCuV/qrvT52gJmndyZVCORXAhvBfqcosKdqAw8erD
         rEKVjBXrqXmHGCXxkC+WTSSLu55HLE2iI2QJsLBcqOvFRhiMvxMuLRwo7fzmQ0xgwYZb
         p2bN+R5owZAcMsT6WBOAQfTmKxgCony/0xJmikJiFT7ShlxKbAZwzLE8PpFniKWSrdWu
         yWWA==
X-Forwarded-Encrypted: i=1; AJvYcCUjS25UjaQueXqYdABDbrzv0dt1a9aBZhYfjM6f/nXaVCoL3sAuOuWXh3acB3Jccl/8byb2Y6h6NDHU3w==@linaro.org
X-Gm-Message-State: AOJu0YzcBRIBf9Z56LtgTwZoxqSy4X3M4qkzErMWIcPgU+eh4PwZoK9I
	zopd0dkSCBXH9M8OibeJYQVTGP+GASAW04rcn6bxwyirSTjyFuFxUmd1TobhdNYsKw==
X-Gm-Gg: ASbGncsayRS0/cxNBxqoyM6IaRqfUfgXA6HvP5H56yj9QmVbHNdJyMjleOwutkNQx9Y
	8IyXu+ZSmH+bTPRtav/CNKCVkjydcOc/gDKiWkBL1N1L7L4YqBt/j27ne89ckuEZMRDM6eoPJHa
	Of6MQK8COX5ScYWLTiFCHSvGD1MYmjIkfL0mMbNtD4n/5rxHAdmT1/xQEgTNvxpAPXmQWokVgYd
	tPg2pBNbfdtSGEdhY7O08fC5Cv04h7jkn2IxGpG3Wz1qUaPySkHPaM=
X-Google-Smtp-Source: AGHT+IG5lSeN2KFb6Yig+OEBeyIMwuYEw2rT4BgFuZynv+ZIVjSU7aBGEarxaDG3Yeq6RQ+0eWBgGw==
X-Received: by 2002:a05:6000:2b0f:b0:382:4a75:57f4 with SMTP id ffacd0b85a97d-385c6ef38bdmr3968690f8f.56.1732790597461;
        Thu, 28 Nov 2024 02:43:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:17 -0800 (PST)
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
Subject: [PATCH for-10.0 05/25] target/arm: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:50 +0000
Message-Id: <20241128104310.3452934-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iYIGZ7UHAhey

Set the FloatInfZeroNaNRule explicitly for the Arm target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c               | 3 +++
 fpu/softfloat-specialize.c.inc | 8 +-------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6938161b954..ead39793985 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -173,11 +173,14 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
  *  * tininess-before-rounding
  *  * 2-input NaN propagation prefers SNaN over QNaN, and then
  *    operand A over operand B (see FPProcessNaNs() pseudocode)
+ *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
+ *    and the input NaN if it is signalling
  */
 static void arm_set_default_fp_behaviours(float_status *s)
 {
     set_float_detect_tininess(float_tininess_before_rounding, s);
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
+    set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
 }
 
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index f5b422e07b5..b3ffa54f368 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,13 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_ARM)
-        /*
-         * For ARM, the (inf,zero,qnan) case returns the default NaN,
-         * but (inf,zero,snan) returns the input NaN.
-         */
-        rule = float_infzeronan_dnan_if_qnan;
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
         if (snan_bit_is_one(status)) {
             /*
              * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
-- 
2.34.1
