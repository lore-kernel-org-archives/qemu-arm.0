Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801841njk;
        Mon, 2 Dec 2024 05:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeb4dIZx+hEKflVIy1myLD0mzXEdO+YwL89/k8sq5UR7K16OF+MkrXT1UowTXcO/qtJhcLa6lGhqUSdw==@linaro.org
X-Received: by 2002:a5d:6d01:0:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-385df7330c5mr16098414f8f.32.1733145250731;
        Mon, 02 Dec 2024 05:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145250; cv=none;
        d=google.com; s=arc-20240605;
        b=VNqaUtlOWUmTyePXFasixL/0O18FRqDmXHGqgoZegmYtzLLkNndhtTWAf/ILNSoPY2
         SJ8oSZv9kvYHA8+LjQiUE7be6Pnlz9NdyJoYb7vAwv6qRAZzcVL1VEdN7iUV/KXOSTL5
         KNejTJD9MUeZoOJKfCoR2VtiUV8lBMaKZPeEX+5aG4wnITxMc/kVhpHnJaniAcMkR4ac
         ZTxe69v5DFLIdxUdmaBEBuAy4eX2TXlGnfv/emI9f5sApzEAEvbswm5HXAIdl/Wu/oW5
         g95qwMl29qDwcixwDZHV6bDQLLyQJPHGrxFcu7uqs0N3C31eBdoW6pRZ1d5LNYEoxYpX
         mQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iLWBUHvjOah3un3/57/rPBpB/Wh0uSx2UDmLN935xs0=;
        fh=lKlAUTqAdUIXmGOKIRreWD4KcTsfXxx9HHWKP/Vql0s=;
        b=DcmnCgmSEUdh7kAzEwbyRBZrIM6yhJOjydblOC7KoyCRDmpFEeAkdIzJSnPlAeqCDU
         LwE6YkdwBOdkLiyAtBERbQoz1rr+s+VaziGQlOtXEAKQ0dTV1cFl+ETXN4jxnYQzCTql
         /fXGLfp9IYJtV5NrJ3gwrm9f8W6s313WqZPLDnne6Ei0h1BH4PTKi9OkFRpsynHfFK6E
         vsO+1Kd01EdtYBYCjr8pymsDg+WZcPR4lkS6eBKexblK594x2kcj9DhmMpQuZlA4G8DC
         4iDSFNC+eXLASlRDQ5v1g9PLvGQxVNd1LTMQaK8e8ksKw5vyx7WMF0WB4R7hrQ3q0hVH
         woSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JPQ27JMr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e183acd5sor2345229f8f.6.2024.12.02.05.14.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JPQ27JMr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145250; x=1733750050; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLWBUHvjOah3un3/57/rPBpB/Wh0uSx2UDmLN935xs0=;
        b=JPQ27JMrEyLyBicwGRjNtwY3q1TxiXqhGDWWJb5i8ur4M2D4wEG+y2Sa3fBR2gX6F5
         hNe1N8JUXueRgs3UEz/dEsQ36iPDMgQrsdhNUtCU6pxzb4IU76oMbk4gs0vqCun5dy9i
         hOmqCSI4d5dv9wp2y70/VWn1JJfW58sYvzdPstTZOoCPF+RQj4wTKDcj3hCN37doDsfF
         6SNHI4QI3guXS4fQPRKzpcav+p9QPAML2tcUkUn0TW51gPIvpgskokj/uaBZ/dy4zsTe
         FAheWCHS9PiNC9CXZzypYa7qthXurs/ett+ri3SMo7HsXNrDXV1Na0xQYghyxEmXWDMn
         9KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145250; x=1733750050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLWBUHvjOah3un3/57/rPBpB/Wh0uSx2UDmLN935xs0=;
        b=R9v9Hg0/FFZ6+NfAe99ZPRBEdLY/1WuVfRaPQAnxkXpa/GEimNWXlfH40dLRaGP8nA
         +7CltOYu2/erzmbsipzbGRJ8DremabXHTt0zPgg7HUhmNS4y9vVc2ceMFMMW/kHuj2lF
         rv1mvaeTHUslcBvXuhMpOXQvOZTbqtIAwmKSLhIyTP+DWHLT66+/SCXtXk1xOXnojeUR
         LXbWrx6K97ae2kaFbNGwafuTu3wv2Dyx4dwClBmqpeweHkLK3nJuNu/XcmEgjAHKHElQ
         bG6qE/VixKpXEHzNUJFIwav7Ua9T51iHHtM8OJFWHuk51b0/Ixha3Npxtx/Lpvbiq9Me
         X7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX5UDmy2mZkJAeJkBm54Rg+JmUL/gQQxpk5OaIxpUKjaZTyJxSFhk4dxozOlm1yy3Hw4OcJKP7+a+o5zw==@linaro.org
X-Gm-Message-State: AOJu0YyEEbLfPth2r5LCbFEIOZJ0B2xn0BpSvUccAwg8kv/BTbdeI06I
	2uyo0O+oHNhp6ozYfUJa8fq6Y2My2GCSjCzZ8gM106Is0Dxa41wKsFts2yXeA8LUdg==
X-Gm-Gg: ASbGnctb4LJU+izcql8vOy0QPXf9WgPHtK/6a+6jK/XXJ66oPHqiahUUoJ0EPVthEiD
	H1y+n617ytZ9bZp0w05M6lQ85tkL8EHrmEPjewU0pe+e3ZNeasXsq+F42r0INyIV8SNb3lMCfPM
	aUhCuvPB6Ubx46pmT1U79sHdWGQHIItN5pvk+iZ1Nj+eaUIRunNEk4PJYW25yQRgcTdsF1a11i0
	c20ILkh4i4xKsH4j6tY+DhRdCn5qfpEo7PhIcQVKPkXP5y/OM9mSuE=
X-Google-Smtp-Source: AGHT+IF0Hwpzg6dNKKvHLMYzIyDSn83uORY7RarpqFUSX/f91/tb9XChu0z+5QbApuX4pt02PA7YMw==
X-Received: by 2002:a5d:6f12:0:b0:385:f996:1b8e with SMTP id ffacd0b85a97d-385f9961e8emr1313251f8f.16.1733145250043;
        Mon, 02 Dec 2024 05:14:10 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:09 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 11/54] target/x86: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:04 +0000
Message-Id: <20241202131347.498124-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Yy2Eq+EK9P9r

Set the FloatInfZeroNaNRule explicitly for the x86 target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: Update the comment to give the info from the x86
spec rather than a TODO comment saying we need to check it...
---
 target/i386/tcg/fpu_helper.c   | 7 +++++++
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 53b49bb2977..a98b4f67ff0 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -173,6 +173,13 @@ void cpu_init_fp_statuses(CPUX86State *env)
      */
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->mmx_status);
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->sse_status);
+    /*
+     * Only SSE has multiply-add instructions. In the SDM Section 14.5.2
+     * "Fused-Multiply-ADD (FMA) Numeric Behavior" the NaN handling is
+     * specified -- for 0 * inf + NaN the input NaN is selected, and if
+     * there are multiple input NaNs athey are selected in the order a, b, c.
+     */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->sse_status);
 }
 
 static inline uint8_t save_exception_flags(CPUX86State *env)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 3062d19402d..ad4f7096d09 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -490,7 +490,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * Temporarily fall back to ifdef ladder
          */
 #if defined(TARGET_HPPA) || \
-    defined(TARGET_I386) || defined(TARGET_LOONGARCH)
+    defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
          * case sets InvalidOp and returns the input value 'c'
-- 
2.34.1
