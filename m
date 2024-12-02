Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802862njk;
        Mon, 2 Dec 2024 05:15:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU03hC+HEd0XuUfZ5kq5tFTAoKGZeZ5+X8SsQGIKn2T75c/EFDv6EbAsXiVvWi/rrW0LFSefzfNZgirIA==@linaro.org
X-Received: by 2002:a05:6512:b1c:b0:53d:d19f:1c7e with SMTP id 2adb3069b0e04-53df010ea53mr12584265e87.51.1733145306708;
        Mon, 02 Dec 2024 05:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145306; cv=none;
        d=google.com; s=arc-20240605;
        b=FbEPb2qhGjrem6nX3I5Aq5Y8VxaH8YzJ/aiXOmZQcfytiri9Q1Gc8xQaTvfRnUZqVT
         GqZF+xRQ1ttIct/BaWU2kiwaiB5i62dMQDnsoS4OyXjn1r+AGKkz08q31RZPypOGKPIS
         FSFVzpl9qrpugFIGU75m7srgXwF+a2+OOgPJ0zc25hMLL4RTxqmVa9Bm2qGvz3UUIkNS
         mWLSFRqZFYo7707ooGB5AdsJXHQQNpB5VMyYoGgyRPjd9t0Dd3BAATOsj/hMDUwMRNgm
         Y9kbVs+0mOE6iOUllcJyXpdlbz4m8HYLkp6BIP7KipvMR+lVVlCJR8A1s+3CvAzMWxYm
         9+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3+p59mil36Jx5sXbuX/nuYCVFK4hOA1MfgGjeXhWnZ8=;
        fh=/WI9aB+MX+m28JYc5+wNhp/4mfErWAbr5Tx0JKPpzqo=;
        b=QOmojGb5CWsqd428IpvWvsdR8i8aHhf3PyTK7Ug/x/pr5/HuoN1CtsJMeVoQKDyMqP
         iWd7/ODKVfFZW2SRDxzg4MZaKMisx+b5NQvkb9myCo3Rgs46/02teFb5hYtQuW2Jb0wW
         wtOADS8BD6+ylMadJM5RfmjGMsIiHG/ypotNMZE4mR+M8AaGJGWO3KWb08jwllWPwrn3
         5LDbR/T6K3QoNt+HaQSAipTT/8dFl2vBhSB6ifro10fhAb0hkDzfLvLQWh1EAJBRohmk
         r6cUhAcxhQE6C7J5prbP8U1EWo7UAeuRCAKjnrdlmiOMZ1hJs4R7FlZDadowqai6z+jf
         ZCKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VH0zleIN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53df6496dfesor2146406e87.24.2024.12.02.05.15.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VH0zleIN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145306; x=1733750106; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+p59mil36Jx5sXbuX/nuYCVFK4hOA1MfgGjeXhWnZ8=;
        b=VH0zleINChXe26BHTif/Hi58VjMJJXXPptUwdvCgkMoHOAanM7xAmlHLDv2AvpQTOK
         Ikx2dMZig0uiDzu9NmAPooGgzK39goPny1ygfQN+JgLAysWKZPHm4I9+77gg+3GbvKA2
         gY59iXrGB4sH99mBf8xJqh9kXihphK/BVDpwC7/qvoZ1qjkGgE+uJ7pDU+fJMrquCfe0
         JZGMALeSI7j1GvZTiHCoRqW6CEPaNM80XB2IjoFmHwxbZBmpzjV9YWhRtg88hDb2F62O
         a8sdhthNhhnlUReO81J7yxo24mWkt+SAmSkTgeMvJRP/bjYKnkVyGr6NF1fXuCkHiZs3
         UOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145306; x=1733750106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+p59mil36Jx5sXbuX/nuYCVFK4hOA1MfgGjeXhWnZ8=;
        b=vcKBUBBkHx3CweF4Hz9OIE/nmND5AGeOlGjaKPP7Mgur/cUf0H6gIqdEdCZSm/yN1Z
         znM1iGQvsrRf84c4FMasm1xHFOnqo5V96N5IzqnT+MMdShpQYw2YJ0sEg/mR19XFFuq4
         nqMG5/FOQJQy/eMBOBu3Xe30yXbXDs3yeDMDec7Rhpb+XVgzBeH6XhstL+fQ23ixZ0sJ
         RYjiuqL7OuzNoh9dif7ZZmlkKTqzydXdqjdb/ZSJeXXKKte6KhKTidaxwyigQ3T7lNrn
         QOxETN14yBFTVpqIE6aRB7oCgb9S7FtVetHJsGKTKEpsDe8qUbE2UBygaqak1CVFy3K7
         YvTA==
X-Forwarded-Encrypted: i=1; AJvYcCVFRcPdbJ5Xl7jxlERiN9WZtykbsXFTs3i9Z6mrgu8ZDFTsi3/2wG75sbflca4eYpZcTjNugdbD6+sjIw==@linaro.org
X-Gm-Message-State: AOJu0YwCYcvk06pUyLI5r6xraZXCUQlbWJ75QtQ2vay9Ua3mzElGpIYf
	YP/5iISN58DyTZ9v0JIUgT4pGSzzDCnngI4YIs2zK1ymleKeBs+Rp4uvGje6DH6Low==
X-Gm-Gg: ASbGncsPNXpHigPRUJXMY8sq0E2z6gRz6DhvOI9zcvbq0GsehjcoC5E5wXAWyYUAxfO
	LWr7J7QYqHSpSVb0ywYbVjuB8X2YZFtr3zG/Gt2k5GunS7t2enzPVAkbiYhdOnYiPJHrqrUIt51
	YCVXtBR0f4mI7eznf184siCTR1tmuk4LVT6tbphsnDD2AUKsd5DKTP3EReZwucVCve/ZXO9AhNS
	TZ5SXnNvmTa8zOx/clFzATFZNaus8WbkbTikEBP07Fqdpz6kk+uNKU=
X-Google-Smtp-Source: AGHT+IHphx87kWVxOi7U2XvnsxZQjFZxWWWkqumFQb2lLvHXTj2payivvRcQYH/MGvdQ+/OF8DxViQ==
X-Received: by 2002:a05:6512:224f:b0:53d:d3f1:13aa with SMTP id 2adb3069b0e04-53df00d1177mr12216593e87.20.1733145305814;
        Mon, 02 Dec 2024 05:15:05 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:15:05 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 54/54] fpu: Remove default handling for dnan_pattern
Date: Mon,  2 Dec 2024 13:13:47 +0000
Message-Id: <20241202131347.498124-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BMeCEBp6LAzj

Now that all our targets have bene converted to explicitly specify
their pattern for the default NaN value we can remove the remaining
fallback code in parts64_default_nan().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 5954a6213b9..e075c47889a 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -135,20 +135,6 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
     uint64_t frac;
     uint8_t dnan_pattern = status->default_nan_pattern;
 
-    if (dnan_pattern == 0) {
-        /*
-         * This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
-         * S390, SH4, TriCore, and Xtensa.  Our other supported targets
-         * do not have floating-point.
-         */
-        if (snan_bit_is_one(status)) {
-            /* sign bit clear, set all frac bits other than msb */
-            dnan_pattern = 0b00111111;
-        } else {
-            /* sign bit clear, set frac msb */
-            dnan_pattern = 0b01000000;
-        }
-    }
     assert(dnan_pattern != 0);
 
     sign = dnan_pattern >> 7;
-- 
2.34.1
