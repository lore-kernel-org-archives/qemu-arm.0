Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694624njb;
        Mon, 17 Mar 2025 21:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSbN7dPACF19w2Y3SZvP7dd+VhwrFiDbgQgSAQfNPL6S/0f6quS2eKMuNjKe6vMuIlxEnNB3yH2OVepw==@linaro.org
X-Received: by 2002:a05:6a21:62c8:b0:1f5:679a:226c with SMTP id adf61e73a8af0-1f5c10ec617mr21134525637.5.1742273502001;
        Mon, 17 Mar 2025 21:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273501; cv=none;
        d=google.com; s=arc-20240605;
        b=YcyLNERQ/6RuQAmFJUi6Th6PffMr2bTodzb4QdRoAygK+w11IK7Eeq2KCLWLD6iZLO
         PijHqKWBCxD+ndUrvIPsPi8hNRW3HwtBbJJPrUBMRnQazvK6nwR9pAgYkIpRvyhNfb10
         7j6wIDfwVnEbpdby1DLhm4PkKUlqhLpRRqCniod7K90QPZZpUo0lTDPi0u3husc3q2Sx
         M6D4gdRsEf0bBfRbuI3xE8qXnVUykWMJ1+n8LhJa5jc4mjwPq7Z5EIKIeeWPOu4yd9Ju
         WsUmOTIRqZ0Rp5tMHHJEIpXMHA3WMuwzxaVbATHTe3Swxv2BhsB9nc7eKdNJdSjJ/0wd
         Gjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ovyvu8DCxOT3MJqFMX/qU9iZeR9dz9+LihTzZn+g4uA=;
        fh=HrQj3Bl6kxigjCAHpGFx4tnSi3Q2g35WIIVXLkKXzMs=;
        b=X9jmW/SMVOhX4RFk5n0wpcm/Arzr3IPWtSfVswG3TJAMUXwd1XXOwbBv6ZG7RRzyFo
         JnW32btAsVVqfnvzbQvGsLDYm0fEdnpSMPt6AzMrTH13PjbSp+ANjK3X8Y3aAg07r1gH
         qqQKhCJPHzsSuQEvdj4iuPR+OmeSiONZQVgBWSKSttbakPjD3Ece3MMnRiUgGVbc40rt
         PZ/s++9USAr4sU9ET+JHW0Y8sxiDhm3jgoXl5IQqwjz2bLUADp/4UYBKJyE+9uLW6p6m
         oKyk8ypqo6VP03t7tXiyuqU0iux90U5TIMkoGiH4oSLInWTQ5LSlI0AhSapk2wGCHPwY
         tC4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a1O9MFpQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af56ea79ed2sor7380722a12.1.2025.03.17.21.51.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a1O9MFpQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273501; x=1742878301; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovyvu8DCxOT3MJqFMX/qU9iZeR9dz9+LihTzZn+g4uA=;
        b=a1O9MFpQwWsvuMhf6c66wQdNnKz3wTwFlJtnbq6V8b46BLF1akRcbtlXufZFF+VATC
         NHvbGeD/HzLlX/QbHnWtGgHE4eG2S060hJOEWDKS7wWNMhcYMlZ6UxTXrynh43KEOjn7
         h9imJoCgBOFdlmQWjilddN0TALV5NsjIMHXmyc09r9/TZPcAZKv2OtQGKQBHlapN+ArQ
         8f5ZppqwG0B4LLaWZA+7yljeuu/HFD3Qfhwy4EVvao8Uz7rug2MhYf6ZirIu2CO+Niiu
         H0Z5mZNinmnDX/4VoanWk/wzziK+m340J8bWOd0knrbLMr5IAOC5+dmUnj00I2vbDNDV
         r9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273501; x=1742878301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovyvu8DCxOT3MJqFMX/qU9iZeR9dz9+LihTzZn+g4uA=;
        b=V4GtylSI3lCFwWr4LmbYSsSgbnubOUg/kCQQtsAD9NSOh6R3pfEK571EjYyGh4RA/n
         cyuCzsAdQ8qAH3MdM0jzf9sz48aPHpRg1eiE/v+xqsBsC0kZ96IxRE+DMHqs0NAsRkCc
         j4/O0kTAac5AhpQO8xp4BoDmxzD1sq/Bglcr8yAtMvYP17hzNchAFQQII0DIT223Ldv/
         AVu9O7Fr62oNsOQpmqt7TKhupOwIEbmYi2O/6D7Usfsw2TonEy76AUp085FzGWwgfqwt
         31CkFMTvc2gVk/WVr75Q0obsfRVJ+Mq0FRFJsHRiYb0d2/Ous5AIT/DBWE+o8WKV/fVm
         CrQA==
X-Forwarded-Encrypted: i=1; AJvYcCUqSOIcq51kSv0kb7KDPgrc/X/ILFuWkWY40Kiobiq0mavT8Z1gMrpS9/oBb9K7PYlBVQOy10sJIy9AAA==@linaro.org
X-Gm-Message-State: AOJu0Yw9rAv8t57lSrYaSGLfQfNyL0wIf7OyN25jLMaYlYVm9kJoiZGG
	6nwlCd/OZ7tMQ7UBnPfDmSC5pkXcC09MfBSq6j7A619SRl/2koqimyZk+SeRIerdiQ==
X-Gm-Gg: ASbGnctXkGNrBvSCQ9VtHr2fRL6xliS8LlSg4X1i08pXd4kU8qi4jqiwPSWq7VMqrEJ
	3G9RF1Nuel4A9YdKeM7fJCHBujzDtV+QMpegWxDetYwDVoXS3hERzOKVr2ISd9mLk4InizxNe2U
	rQhveyk4jJ8FlyfayS9qLhquE3JtkLvv/IiArRtT1rDo4O9Bnw13LWPEEVtHSZkIAqnml+9ztnH
	Y8gHYrF9RlKRu17w2GwUR47+45wQzCFjq7PcxgHkb/5xNOzrt+ByS9goZtK5pu+gS8G2FSw3SNs
	0ZJTv6tPhXCzmY/fLAaKn4tL4k9GtGmB4uG7yrdI2e1z
X-Google-Smtp-Source: AGHT+IGpoy0HiXaK4W5rGsoIV6EB7nMCBdVrRX+IRN9Qga4zDbHRqASR/8vpI124f9RU9cNmPTSLpw==
X-Received: by 2002:a05:6a21:164a:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-1f5c118eb0bmr21535312637.20.1742273501600;
        Mon, 17 Mar 2025 21:51:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 09/13] target/arm/cpu: define ARM_MAX_VQ once for aarch32 and aarch64
Date: Mon, 17 Mar 2025 21:51:21 -0700
Message-Id: <20250318045125.759259-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6UADy8m5ZiIO

This will affect zregs field for aarch32.
This field is used for MVE and SVE implementations. MVE implementation
is clipping index value to 0 or 1 for zregs[*].d[],
so we should not touch the rest of data in this case anyway.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 27a0d4550f2..00f78d64bd8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -169,11 +169,7 @@ typedef struct ARMGenericTimer {
  * Align the data for use with TCG host vector operations.
  */
 
-#ifdef TARGET_AARCH64
-# define ARM_MAX_VQ    16
-#else
-# define ARM_MAX_VQ    1
-#endif
+#define ARM_MAX_VQ    16
 
 typedef struct ARMVectorReg {
     uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
-- 
2.39.5
