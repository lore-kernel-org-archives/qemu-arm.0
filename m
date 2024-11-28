Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413026njb;
        Thu, 28 Nov 2024 02:43:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZg1MsxRQQA01/7AUo7+W2f6/+tbkFWtpvN390hImGk5Ji+RB054tOxJ05ZshcIosRXDmfwhLkdWn52w==@linaro.org
X-Received: by 2002:a05:6000:1a8c:b0:382:5077:afe8 with SMTP id ffacd0b85a97d-385c6ed7599mr6024695f8f.44.1732790595278;
        Thu, 28 Nov 2024 02:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790595; cv=none;
        d=google.com; s=arc-20240605;
        b=NDR0I7ClLJe5nM4ThgeRqKqlvMeYUt9N+Y2s7N8z3B1dsm39RFj92jVc7i+5EPkNav
         fOTqesXzsH5+d+qo2OInOSrgpmVD45he68ntm07jNEPDr29s1jMNRa2FDiEJnBNuR8uz
         40GmaKxIScynhgIDxNr04Th8n80v784mCTK/c/DCrdl+dfw/pSdSmMQpas/8VvcZT1s3
         R6y4+nZKQ5UG73imNP2z9Z9i3+hllEa/qp+tZ3GZJChkATffcB+sKUQxBmIz/0My3x9J
         PR8Z3Fj+HLJviWr44m15zF3CfRCdoHtmeOA8jQ3wlcZEnp7SHaqxXs2BkEJQuP+GRL80
         6BNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZOEO9KTfNfjM4NNmDftZ94Iu5DxbBvsjabJVOrSGkdQ=;
        fh=1EHpNFtq8f9uT3BM4eDSmKJx8tqJ8m89xZO09+UnbLk=;
        b=QIf+S86UmfCm9GA6FJnXpCdg61FgbyE/M26ODT2xYwFYG92AQdazMuLyWFOzn+T5VI
         87945iJS9Ytb5RI8yfcK7b1oHox3XbMaxX5Vi8MqPRuQ2Z72zvD9Ky7NWpnj2nb04wLe
         1sQhhN8bVGe9jcIZSpgTzB+Mf4qgICB0RESjjvzdQYoOIC/86swrYUNhWL1esLZfRePN
         BDeZoRUS6DfvpSc5ksBh0hlpZ7VmjKmdE/DWEdhHlVI3M2v2IYsfZZQn8MzUkz26VXlF
         ULJNoESEb1QJT4GpfraVLuPKDmxrAKl0iTetb7RD6iMza1IJY7w/hfDzfloMJ44FOnHy
         ZCpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjsTMBX2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd7f091sor431723f8f.8.2024.11.28.02.43.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjsTMBX2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790595; x=1733395395; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOEO9KTfNfjM4NNmDftZ94Iu5DxbBvsjabJVOrSGkdQ=;
        b=GjsTMBX2J6lS0HMF22lRUjaNdqAgXvi6x+y2aX1ugtM1ME9UkAWPllxx0DWJ55Mt5Q
         7KT2uZVGfE1SYlOUGh3ms/fTnEaZlMD8IiQfj230NRutcMhiXIN9R3aKmitm/Q/NV/RI
         xgL/j3k7eE7GEqtlC3VkbJO+WNLJz7GXDRccNgoHVlDnrm0t5s/6LnUQvqsiCvM9N1Er
         dLL5U0WSVx6c1eC+Spn8vJ5XsN/siYOIuIB8U4sBHomb6iuGQmTO4KZaTvUDSutX6rf3
         hwrl7Pg0LK3hVK0sKu7Fs4OfczUMaxSAnSsLXzLsyAuz535N69B6t5+iQ1MnrGopyJes
         94IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790595; x=1733395395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOEO9KTfNfjM4NNmDftZ94Iu5DxbBvsjabJVOrSGkdQ=;
        b=TeR++XlBdVRPN73SUrNqxrgOn/Y5/2oRl8GqcWJAyxJJTmmKSq4xJRoL89BX9fmrK5
         EEGKE7c6G/2g9ZjL8F6hzAmJQXS+3jZ+QrVBvFZOWpKr/pJAyOJ0yc0LAaYnWnmUSJ2h
         MIzBWTRJk37xgwB2ZUwDMGwoXUhuXUUUWZu6oVejtoquVKYaVWZxgT/xeYMkP2hHf22f
         mF/1PJHOo6a8Qcsts6IP3beuM5NOB+lAEi6bxtu04HrBZMo4rzZqvM6kYRErcjw75y/2
         LwR6/FO74uStsObb9qox8dQb8uBPTgHT/7XH+UrsRMLnthScohHBT4Xvj9EToMYi2jEl
         hJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCUivnfpmzJ29Q22YSCrIVGCr2EypBaJhgYTojx8AfYqRsc2XRZQSYHOipNWoxu2/zdmiXuQ96V0TQxZMw==@linaro.org
X-Gm-Message-State: AOJu0YzZlk44m9G1KPGZ4UbfNYRUd1BZYHHhd648sAoR25FiuQ2uCQR5
	Eqqi9QwVH6tLw20I/iPr9eKYrwmEiILZKWoIVgUyC+yXXqcqkryZVia0Ku8eDfks3Q==
X-Gm-Gg: ASbGncsjAocrTkzcQIkQOfayWTyU78TY2ukrgZTjsTfFtCWeIljAMmvu93zg8JcX+qV
	P3HddYBgCaFraV3C5hPgb69iH6Pzb3irghhll2hm5LLMOUpqFIRoLj6ZXHpAO2iGx9QngmhDU9C
	NO2geFVnP8fbvMc+cU918ai5bhSibKDIBvgdYcM+YRaa/Y/g50p8K3mP4HR0JUQz45fTEYMY6cU
	ye81hXo/1zpBEJ6ypB+pOdLr1VU4mhGIoy6rLh+5y0EenLCRol6QWg=
X-Google-Smtp-Source: AGHT+IEHV2k+O/xTAwFMT5IKBm3rjKsR1oFixoePTjRIgioOUVa39hCCEWN6/3kQ60QTDkyvzGk3rw==
X-Received: by 2002:a5d:5f86:0:b0:382:4a6c:fdd4 with SMTP id ffacd0b85a97d-385c6cca1edmr4753490f8f.9.1732790594521;
        Thu, 28 Nov 2024 02:43:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:14 -0800 (PST)
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
Subject: [PATCH for-10.0 02/25] fpu: Check for default_nan_mode before calling pickNaNMulAdd
Date: Thu, 28 Nov 2024 10:42:47 +0000
Message-Id: <20241128104310.3452934-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3FYjnyj/QHzg

If the target sets default_nan_mode then we're always going to return
the default NaN, and pickNaNMulAdd() no longer has any side effects.
For consistency with pickNaN(), check for default_nan_mode before
calling pickNaNMulAdd().

When we convert pickNaNMulAdd() to allow runtime selection of the NaN
propagation rule, this means we won't have to make the targets which
use default_nan_mode also set a propagation rule.

Since RiscV always uses default_nan_mode, this allows us to remove
its ifdef case from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat-parts.c.inc      | 8 ++++++--
 fpu/softfloat-specialize.c.inc | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index d63cd957a19..aac1f9cd28c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -77,9 +77,13 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
         float_raise(float_flag_invalid | float_flag_invalid_imz, s);
     }
 
-    which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, s);
+    if (s->default_nan_mode) {
+        which = 3;
+    } else {
+        which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, s);
+    }
 
-    if (s->default_nan_mode || which == 3) {
+    if (which == 3) {
         parts_default_nan(a, s);
         return a;
     }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c557c41b2af..81a67eb67b5 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,6 +475,13 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, float_status *status)
 {
+    /*
+     * We guarantee not to require the target to tell us how to
+     * pick a NaN if we're always returning the default NaN.
+     * But if we're not in default-NaN mode then the target must
+     * specify.
+     */
+    assert(!status->default_nan_mode);
 #if defined(TARGET_ARM)
     /* For ARM, the (inf,zero,qnan) case sets InvalidOp and returns
      * the default NaN
@@ -578,8 +585,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
-#elif defined(TARGET_RISCV)
-    return 3; /* default NaN */
 #elif defined(TARGET_S390X)
     if (infzero) {
         return 3;
-- 
2.34.1
