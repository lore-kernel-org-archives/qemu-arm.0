Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801890njk;
        Mon, 2 Dec 2024 05:14:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxymT3zNkvVzYSblmmo41cX+gGqrI7HQneMDfwgwUyToQYj3Oq4IWldtBmFkUAZTQsX/+ih6GpdD4ArA==@linaro.org
X-Received: by 2002:a05:6000:1a8f:b0:385:e43a:4ded with SMTP id ffacd0b85a97d-385e43a5222mr5682865f8f.57.1733145254172;
        Mon, 02 Dec 2024 05:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145254; cv=none;
        d=google.com; s=arc-20240605;
        b=LKAnU4pIKtrnXoMIaAcpY1l/LGMcZ9VbMyuEm77OVD5po4Q9+c0n/tsf0YRP5a5ix2
         EAihGH823ompKt8BZ5/BefZob2QvoWcqjdd7MjpTt3Z8d6QOL7xsPimgI2Jl1+lgjYLw
         xY2BHn4hex8scatpnv+hLizJyeMyHKCGjA8wwBLXfmxLykM8FlahJuJolR24bi+E6gJc
         MoaRm8poKipU2yqcWdeDp6S1ilSR4xPJLjc6Jiy6vODQsPdAfR0uS7Ox9BNHVx6Jg9fP
         St5oAQy8szxF3P9DMEky1827uS3xWBxGVSo432HZnrfBYsc1ps5ahOvpkSdjD/KMLAvW
         M7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ILG1Z/M6B7uFxp4kFKW2IzoAsh4FqMmE+eh75zkfLko=;
        fh=/RyT44F3umUBSXgSQCKc4y+UfXFL5uQPpnlDHtiD6oc=;
        b=jboQBmPUDMpNl1ps3mYkUH1l9u/6s7ZLDQ4AOJAu3Tc6HjRSkJibpuynHFbxfNmftL
         IFQe57MZKdLLlfW3CWqfFZbzk28z24BiVFI2mROxMpmmH6Sr6/E4eAB36BmPWO5LdFW3
         IxClOnDHE6lbc1GmzWK8JzSlQ62WUQ6gTnsIOIWTtZYSSWesb6Qfpepav5jjtg4dFIXF
         rRmty92ybSHTnXrMLhNiluADDTCGE8t6BW743S/IrEj9SN2PbaBMfAbe+UEbEZxXOInt
         c8yLsXClpUJRiS3rTtVHTW1WQKjRPaswu1W6vk+H0NbS5IZpuQkkM7EvV5c+esmzCXQN
         raNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zWncAKfk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385f161c03esor683921f8f.9.2024.12.02.05.14.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zWncAKfk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145253; x=1733750053; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILG1Z/M6B7uFxp4kFKW2IzoAsh4FqMmE+eh75zkfLko=;
        b=zWncAKfkElCIOMzVHxC+47ErZ4jhzyGryIN6sgQM3J3lPfCYgDImozCsn9M9yUw3ZN
         7u2/Zbc82+T6xP1/IggJRojKrIiL3v+qqu8Ep4r80yHeh/NCGm6tbhfHSfhWL8s9Cb6f
         KXN2KuotH/7M7G9tS7SgRunL7+H4dKGC9jqXsMH9stu+9FenCs++N/fsB9O0N+gIFjup
         caRfPs3Ov+AUu3ghm6BFcrLG296FdwrdOKC4ATkla2YS15hv8/Gj+hp/el2bD/C5o6KD
         bLXNGp/+0YMOxvm/QAUljakANT/WGD0qpWO4L+FoysX5FjkCtGdqzptTUE5anKUXnAkv
         4Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145253; x=1733750053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILG1Z/M6B7uFxp4kFKW2IzoAsh4FqMmE+eh75zkfLko=;
        b=vQC13VCopAbu7pfYhFdrrPbb9zxSni7lWY2DRoGy7Do/manSMzYZQ9fpFU38dPYsrN
         NFD91JLADW8EknREoefQG3gJGjA9xRKqGAo9Ybv2oIrEgzh21Q+2hVRFNvaAo836XSpA
         NGiCBCeO2wYK6MmWt5HYZCFUjAqRvGAoW8+aNJSz4IIucL4UMNMDktAXQ/hRGd9QEeBw
         dM3aYy+7gcD+TAX4y1P9tnbubP8LVVJEKMS++wmbquyKULQ8j1+YvxfN+JMMVmNOVn+c
         EBOYOug3R+mBNTQ6LCji/EnZ9yCXLtM5Au5giRink+Qus8By1Kf5xBXpgDoUHO4zHzPo
         U8qw==
X-Forwarded-Encrypted: i=1; AJvYcCXCz8WWri2eOyTAdvNUtDyn2VqUn2RyA47o4wqoa23bJ7PIVeecuQASwtNmINjbM6oo6Zi1DZIU6GHBvw==@linaro.org
X-Gm-Message-State: AOJu0YwD0c5DB2cLwU5VhK1qD+1ZKQ6aoi3KKcU9dftbiZwmwfw/DPEN
	KtNV6H3HTVVZ05smo8XfJHJNqQGk5I6Ccf4bRUgLWlHPG0JbsBebL/3kjBX35/Cc0EMqYQacZtV
	0Foc=
X-Gm-Gg: ASbGncuMfNMeRXcZ5zuRYziiNpcQ6AmaWJ3iDWydPjNBZ+r0VX60+jvjD1Kq+ZDAOnB
	K5RysKUvVm5NArV9kzap3/mZk6AmkVlbrrxVq04N0qeLWiNQIwU1oAEuVKNZs7NUF60Gfmw+q6P
	vB3n4cM/fwm6mszgsq1u7MS+kB11dKChOuUzDqco0g458jUZ7EzwJcoDriEJk1/xDI7MYWDE014
	HMviBhoR4jHZKHNTp3DeKDgLskx1/v5lOu9BQZDAShqAYwrMc+n5/8=
X-Google-Smtp-Source: AGHT+IH/BdBMZ0YZ5BZUq73sumipnQV70zAwYH3ayAVJ8S0pggKoSjQKPZjHAdmDnCF8uJZAVTJuLQ==
X-Received: by 2002:a05:6000:4026:b0:385:f16d:48b4 with SMTP id ffacd0b85a97d-385f16d4f88mr3719008f8f.40.1733145253603;
        Mon, 02 Dec 2024 05:14:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:13 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 14/54] softfloat: Pass have_snan to pickNaNMulAdd
Date: Mon,  2 Dec 2024 13:13:07 +0000
Message-Id: <20241202131347.498124-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HbxdEdk67wMs

The new implementation of pickNaNMulAdd() will find it convenient
to know whether at least one of the three arguments to the muladd
was a signaling NaN. We already calculate that in the caller,
so pass it in as a new bool have_snan.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat-parts.c.inc      | 5 +++--
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index aac1f9cd28c..655b7d9da51 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -67,8 +67,9 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
 {
     int which;
     bool infzero = (ab_mask == float_cmask_infzero);
+    bool have_snan = (abc_mask & float_cmask_snan);
 
-    if (unlikely(abc_mask & float_cmask_snan)) {
+    if (unlikely(have_snan)) {
         float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
 
@@ -80,7 +81,7 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
     if (s->default_nan_mode) {
         which = 3;
     } else {
-        which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, s);
+        which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, have_snan, s);
     }
 
     if (which == 3) {
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 3e4ec938b25..a769c71f545 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -473,7 +473,7 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 | Return values : 0 : a; 1 : b; 2 : c; 3 : default-NaN
 *----------------------------------------------------------------------------*/
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
-                         bool infzero, float_status *status)
+                         bool infzero, bool have_snan, float_status *status)
 {
     /*
      * We guarantee not to require the target to tell us how to
-- 
2.34.1
