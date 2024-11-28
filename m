Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413154njb;
        Thu, 28 Nov 2024 02:43:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUs5BNMtI3ghRO9S7R7lob3PpUtcDxOj9cis9g0GdkOiDiT1ZSPnFRD4tb1uoAe35Rhtup4UOjOuqGqgg==@linaro.org
X-Received: by 2002:a05:6512:3c9d:b0:53d:e8ed:2962 with SMTP id 2adb3069b0e04-53df00cf644mr3184567e87.19.1732790608928;
        Thu, 28 Nov 2024 02:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790608; cv=none;
        d=google.com; s=arc-20240605;
        b=FpyOIIyteGrvi7FGgZDszUpn31/jGGzvEMQnu/onJaXsV4rl1FCmSC956SQ1uisa/J
         vgjHSLn4qPUtt3YwEdgPINhiDSNlib9l5is3bKwkT/XOXEcVJHDWQEC86wZOEn7OeaV7
         Nd8s43jGR6SMWNoKLarj9L2CtYu8XpINgvqFm9OJ9xrjgWfO0bbVqLUoS0zDXB24bJmt
         /FkFIaiaMuw9sxYHfSGXt6Ys15D8PA5yud/vZir4eWAnbwXk1QFq/qLq7tJ5oPNhnUkE
         DDFjiS0AAnZQQmp7n/cRlau+OpYCBkkOxNkC4irhu43d126EfLgrtd4PsvsvVIYQXq68
         koRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=x4JtTEJWuqktTR0K+Db+JfgEPXYfhnr/W1wwAJOuIfc=;
        fh=/shjrzEXNvctxJGI0+4X9qMmZFZbFX7O9ZY+VPr+7tg=;
        b=S2MGRc3oU8SCMcrtjMBARGz+xQjmuG6BHI4/TD81JlUnK+AE3M8x0Hp1cEqQBbuTwo
         IBLKIzyP+IkuNdUjAsc/BrNreoB6J62ivejEooLilrstfFGjVRKBBidNwkP6L0NZVkRO
         fk7ElD5hC1Cfdxl+YSjDoPRl32m2eLzCgJymjPY0XddY13Ipf1sNLKQNfi8zmd6LR5G8
         uRRLZe1sIC+hKQNl3Gw9yN+T/ihVorQYTPOe9fzOme4FbJW7db4KBkIkKzBBh92wvRvA
         XfGqLfIqkz4HHxh4bHC6ML8KdcPXQpjtB06F2f9jx95X0uK4JETKaOSHlafwtVYINOM3
         aduw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfNLK8tL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53df645a152sor290946e87.13.2024.11.28.02.43.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfNLK8tL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790608; x=1733395408; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4JtTEJWuqktTR0K+Db+JfgEPXYfhnr/W1wwAJOuIfc=;
        b=jfNLK8tLTMQxC7pwxLoljJ320faPI0VZKNPemj2K6t99oy38x3nR14+443v5btUymL
         OxTSOTQlFX4Qfvkjijdj7dt/l19Lk0gDCVwenv/gFjiZdvJO8MUZvALV//mQ+6hgmIgK
         GNOKbsxKoo487Kz9jGcobkCZjRNdHB9tAJIz2Jz/zLZ8RC72X9yUYN7K2Oef7uiScMwD
         YEUTBtxf+7DOSC8gsO3VjArRBKNcw6nbKlM0+roLn5zadLJMsS0X/GLaj6EN2Y96veeB
         ES0XlOz1LSFnjEvkXLRMHp5pnVZXcACCxPB9HVl+pM/mF0skrM5+oBDwUpAoC/LpIW/3
         LjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790608; x=1733395408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4JtTEJWuqktTR0K+Db+JfgEPXYfhnr/W1wwAJOuIfc=;
        b=et5vPusakF/QiDmTtdcx8bdTLYwZ4WRdW4WutC33LCq5/gxTCK2x7VfMC1pk7uRgr5
         tV6hu9dH6EMAmIpqxluM/WZqo6KP3MMvfQCoLTaRDnhSGpmmw1qC8TnOf/aOAy7RNRgd
         7gRSFZUdPE4bC7iV0Dx/hUCWf6x6hJT4wKP06Mcg8IUNvkwVFkwU21UzQgArIvABrfa3
         OtAe32V/+Jn4mw9rZ2cbbv/rPH4KCHrDneoEXEKWpLpBn6s6WAtrUoGLYTjAl/iBLMe6
         fWcQiAMrBxAPX3meMs1+ujxZ9dw6YXkXmNMRYWiBjlB5+F6s8H4I1KrY+uAIPlb0sHKU
         dxVw==
X-Forwarded-Encrypted: i=1; AJvYcCVOqEcWHFA/LoSf+wPWw5JNG646z0ahD7RCuIkoU6DpjyAHwh5AcK2fJtKO8pRI002aE9NOjwGm3EpPvg==@linaro.org
X-Gm-Message-State: AOJu0Yx87OTyYNFuRMLZZzZ7AcQv5hYGo34ZV0KQbLRQ2qewEryKmB0s
	qvmiLc7+jlBHl+0luVqxFuPryn0KwWa8YpVD+/p6YNu1Jcxx5SCQutfKEpNV2Ggnow==
X-Gm-Gg: ASbGncvqV/+4ttwknZ4SmauKfb/IXPL5ePE3ynC+V5H1Z7n0GuXk+THFpWt66mpXSEj
	GuooKVykWyZ/hGgny/LeqoFlZ02Elk+92YJCEDrSSE5FTHZRURu0Pk3n+Jdtt3fIr6DgtMIHig1
	Aux9EbfnIiNyOZwmUfpku/oUtFqMtaWtwuCp0N4E+uDxQlNtTuMoNR0QH3dQLGgwegCHMJhpqxy
	RaxncNO0/cs+n2M+kmYzHujQNIimUpp8fZVIeoDlPqDwWPWpIgrEm8=
X-Google-Smtp-Source: AGHT+IFznEpI3626Zge6MstJ38Rvz+FlulNzVErYAdeWNT7kyvFMFVQK7nEiiNlSohoHqRH1nB9MVw==
X-Received: by 2002:a05:6512:1115:b0:53d:ecce:361f with SMTP id 2adb3069b0e04-53df00d9e74mr3968213e87.30.1732790608301;
        Thu, 28 Nov 2024 02:43:28 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:27 -0800 (PST)
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
Subject: [PATCH for-10.0 17/25] target/loongarch: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:02 +0000
Message-Id: <20241128104310.3452934-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Cmm1eUiUrF+m

Set the Float3NaNPropRule explicitly for loongarch, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/loongarch/tcg/fpu_helper.c | 1 +
 fpu/softfloat-specialize.c.inc    | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index 6a2c4b5b1db..37a48599366 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -37,6 +37,7 @@ void restore_fp_status(CPULoongArchState *env)
      * case sets InvalidOp and returns the input value 'c'
      */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, &env->fp_status);
 }
 
 int ieee_ex_to_loongarch(int xcpt)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9b5243c9529..32edb493776 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -508,8 +508,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_LOONGARCH64)
-        rule = float_3nan_prop_s_cab;
 #elif defined(TARGET_PPC)
         /*
          * If fRA is a NaN return it; otherwise if fRB is a NaN return it;
-- 
2.34.1
