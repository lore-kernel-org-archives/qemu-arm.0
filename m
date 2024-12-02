Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801854njk;
        Mon, 2 Dec 2024 05:14:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvkf0EgD/rG001GRMauCuCYHWZUqg94Y/K7TJzvwhwfD+GK/qiRAFf6UasJCxI+B8gQdnW6oaDRkDBow==@linaro.org
X-Received: by 2002:a5d:5f4f:0:b0:385:ecdf:a30a with SMTP id ffacd0b85a97d-385ecdfa4ddmr5015156f8f.33.1733145252062;
        Mon, 02 Dec 2024 05:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145252; cv=none;
        d=google.com; s=arc-20240605;
        b=JXqH0N2lcRDg8OOwwChhWBGzNcLG0rNcWRNMw3lY2yrQK6CNt63j1VGewoBK7laT3v
         15R0FdJGL5i/7xQt9W7twCd/PBBAfVyC9fPiUZSmgPThzoFGD3AR8XhayLi0OPfsqY5w
         qRt9hp6ndteiTwemI6kMCJxlmHA8cX6+tTVB2BW7FtaUJdWsaE1xa49HcvfqgXCegeCI
         119/i3tRXj9WcwMUiQBdP4m66Bq7jLlxhfckGPP0MbuKrzKxMZjZgJo/fPpuTlcolQgF
         3yze4MPoXpRXlEM85rwRgHiNJN+hYP8NsP/Ebc4B0HDiIrbpzjwdYdwSbzTjqNFCJRLS
         32lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hfWcIGFElRwNWX99Qr3KLu7RlocWXtaK9gnVDhRhWYA=;
        fh=Vbui/ijrr8eqmIx0eelQkJA0rml+5bWLxcIrkiItAa0=;
        b=OaoyWzCGuFCucubvPRp6YGFR5+SBlJz58pVbxeI7vN/0vjKtewW8A6u5qqSEwlXjbd
         qYtbUKz0LSVu3r+Hjon09H4LqeM8oIan1EZtFD7Ss2dRgtre2hlTsQUMX+zUF/shn5We
         uOncu5dhZof8sOrSCknQ9g4Zgqn0ViyA2ljoq1pfz785q5HPZZcxFRBpz3yryPda9Lc6
         SvIigx/DrIE5lXH/nGcgcqTrumKVCeXNt83iunqbZVI9AWAxIajjVavcC80SEZ5648sy
         OGHKWC4Z8gurWTQCwzNT1EROQDvuLXipPw+HutdQyHsUowTEMY+BlI0NYREpgSEnXn9L
         XxyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+3uZ3+H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ddd953basor2112031f8f.4.2024.12.02.05.14.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+3uZ3+H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145251; x=1733750051; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfWcIGFElRwNWX99Qr3KLu7RlocWXtaK9gnVDhRhWYA=;
        b=a+3uZ3+HfbjYbvXP55zXGbcZLHya0SBlDk4set7P0xHqCBMLXXn9HhBIDClIN4Vh9v
         5bSX5nFASFWckJTe9wFNaf75BPwGldjNSwTB5hkrUWpPKnWjUmEHUK++yJTAinzIrXpP
         b3o5P6c3YqSZaEjP0BRYGe0rgNePuwvpWCMgU11TrRwTW7ihsy+uvsN6SUC60gyKSgxp
         a7U7v/auVi10SINDXcIXnzE0ECIaM2cSXGcQgVvPo6US1iydhaoo62/REg+Xvfe/sIgG
         by0g7QqgnwlvQPrBbVGReKtrtEZCr1EqQTPNkSyXwdmyeZ9wbCMYNxgbw+EleI+Ft/jR
         GOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145251; x=1733750051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfWcIGFElRwNWX99Qr3KLu7RlocWXtaK9gnVDhRhWYA=;
        b=ruEKHXj2Uyuk9liLRghrE0uslqevWp/D+fqoS7sxhxDwWR1Dw50UQ2ZTIB4FiAP/di
         rdNRD7STXWvLs1lUq/iKShBa7ZgJadKwJMZrpvTat1vnjZhNIzo/fANS6ZmR5deHuHmx
         WdLTY3HMieDmLRGsjsncpA5MXuInw97YJfrWDCjS8Bqi7t0YItSr3l4rL486hzWFCFdM
         zAm1SH0rq+Fw9Q11EuQa3a8RDAzdTKolL/Zsgz5YPSqeFWK148p3+LvY1YvpyXCXAipV
         NRy+pRMds0BPNrdCHLBW8eR9FtIFgJzmo49Mu9CNTZJB9p6OTLG1cDe5AxB4d/2pOG7N
         xVxg==
X-Forwarded-Encrypted: i=1; AJvYcCUHJeAK119HVTCtUqwcO09Jbx8qwD8nVSeYIbjW/2GteN+vWQut2/EdY81xSBsVVvBppYF7kuI2+plZrg==@linaro.org
X-Gm-Message-State: AOJu0Yz90yyR67sX9hz87EU+svSmt1x3GDDPSP9ofJdvThRoVFlo75+j
	EXzPvKDvs7rBpbk3VDvAuutZkHescbSdozjV0Znx033DzDKRa/ZOPIvMPkHvKmwahA==
X-Gm-Gg: ASbGncvga+N0BHQLWWp2EE/uYetsCr06Wt9ke4JNsFJvkWievfFaHrJNOpzyK05wgbP
	PTO6KZpHwANAMEo/KOHsLZlqQ2t0mFaSTVQJUGFfgUr0ZvdM1vLCya4DqBvn6ikWcKeppjO9arK
	WiylUAj+0G9A1/ThZ4/dllBx8THLMq+iuc9PPzOnEsXsU59cz1Ko29FnnLa8cA2dzNlSVyJDuLE
	2Y/gtuSO16LLRpPH+p9MMcGMfIz0/q9hGn0uCQvUbyydt3kmeVxwj4=
X-Google-Smtp-Source: AGHT+IFl5ZKDcFMgGIc5LeK51D4mmt2uCTorCPud1MxCTo9j54Y0ZSTaNWqE25haKOFhN7LIYZOF9w==
X-Received: by 2002:a5d:6485:0:b0:385:e176:4420 with SMTP id ffacd0b85a97d-385e1764637mr9309692f8f.10.1733145251088;
        Mon, 02 Dec 2024 05:14:11 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:10 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 12/54] target/loongarch: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:05 +0000
Message-Id: <20241202131347.498124-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QuZSSGOZAwzC

Set the FloatInfZeroNaNRule explicitly for the loongarch target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/tcg/fpu_helper.c | 5 +++++
 fpu/softfloat-specialize.c.inc    | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index 21bc3b04a96..6a2c4b5b1db 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -32,6 +32,11 @@ void restore_fp_status(CPULoongArchState *env)
                             &env->fp_status);
     set_flush_to_zero(0, &env->fp_status);
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fp_status);
+    /*
+     * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
+     * case sets InvalidOp and returns the input value 'c'
+     */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 }
 
 int ieee_ex_to_loongarch(int xcpt)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index ad4f7096d09..05dec2fcb4c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,12 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_HPPA) || \
-    defined(TARGET_LOONGARCH)
-        /*
-         * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-         * case sets InvalidOp and returns the input value 'c'
-         */
+#if defined(TARGET_HPPA)
         rule = float_infzeronan_dnan_never;
 #endif
     }
-- 
2.34.1
