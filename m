Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413239njb;
        Thu, 28 Nov 2024 02:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9zxsmly+urIlFfrSmJShhbzPyrYvDCvpn/wkqafFb53iueNw/jg6kLPC3WoCsnzNVmUfnpDI19qzCxg==@linaro.org
X-Received: by 2002:a05:600c:458b:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-434a9dcfd5emr61994565e9.15.1732790618236;
        Thu, 28 Nov 2024 02:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790618; cv=none;
        d=google.com; s=arc-20240605;
        b=EEFnLDbYbwdnmnGhBgWO4Iw03h1sk2VW2xSf2ZOkAUqyh4labr8O7JQm/hS+ovtAiG
         UFT8saM//wpt3foyweAo4hQzNzkCFJSDkDC1qhytbEEPQhECgTe46PEVGOwFgdExD2Qo
         Hpfv6WV5k0T04ovex5PmpTX6uBz9j2yJHotiY6d0auk4jsKcgFqE9jKfHl/vrXiroXAs
         xeqHEA8lhyfjSCXs0k9h1+dr+MGpbB8Z2Kd4hjCWtUrH64aScxGJ3pZ0xBuP32UxFk38
         LIzeP22FPsuDJAgNZOASN+7NJlPH7dQFVPhzwn0cs0Xh4aWQcrjD3mNPCfObvN+tURqV
         wCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zfa3WE0hEeXkZktlw3Eszp/UyNtqhw8PzXG1xyTaEO4=;
        fh=WWlBS1Rh7haTUZJTLb+J5ICdJfkhHq7Wb2meijpV1Sc=;
        b=RGKqc9WnU2gAetz4FO9eJ7j9PX1txKpin3swTMUt6v+LgPG8YkliMMhFFIxC5YYGSj
         +VkE2Jlzd/dfjRHKnJQHNDMiVqFe+WpWQa1ujlzurczulaHJnL9vb32/S3KhWxhU7eHJ
         +tqUg1F54iluWoXa+cW5bjtU0E/LnkOGywDxnjBa2xuiR3WJLGmg6/CakUYEeHEj1ZRt
         hwHDLy7C/bRhcJjTshjxFUfjwZOdII/07cPL3f3WWbNPKr0VD4CmK4xGy+dPPIY52bTS
         jNcVG+haQfYm5W9xus0ODnEN2wfqlz951HRr+rCBSLn+RFEHPCe0Jn1q8/pvzgqFCM2Q
         +vCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKmo3b4q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b104fd06sor5175245e9.2.2024.11.28.02.43.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKmo3b4q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790618; x=1733395418; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfa3WE0hEeXkZktlw3Eszp/UyNtqhw8PzXG1xyTaEO4=;
        b=xKmo3b4qFjHLxXnA6y3uXLx7STK1fQZLJVs8cO3aaLVAAXooTwpSTn9856u6NKC/gd
         jp8ee687CgwJhMDFchyod182LkZSNT0onmLEpx61Clc8UeD3O9/YvnerkLbOv+iTX/Re
         ek425QQHiOV+wVRHYNNHRrDOZl8LEHtx9nW0u75ijTJkBkZNKkAOBrVQYtNdZOszpV1T
         LCOXdR2rMZYBkosx0fr/APJ5K1gmP8a9lNnj3sns3s5ic9dsWFpjLmp/n1/pUXh38S+K
         8Vmf7cLzznqnsPw1NKBNbuVEnz8TTmr7/XEgKsVvg348HQCG9KfCMa5GLdt51lIYakJO
         Al1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790618; x=1733395418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfa3WE0hEeXkZktlw3Eszp/UyNtqhw8PzXG1xyTaEO4=;
        b=F09wMH8CwSeWNFGjMNTzKIdRDtG4nzdYW8zdkj2FOhTwzbQciA0CDayK70Ov2r1J34
         wawqddj7bA4LObIYa78/bYMwEyIMpmBTY5Ym8vtrAdU67jNeqJjrn6cmKA+Zi9TtYeYo
         mcwCyxBiC5zq3C+WiUQ579QzkbH57yo0o5OJa+A4FeJXLnddsbsqjRlZMnPWZ8cux7xD
         /yDGyDhPW2G0zrj5owIXLgIJTJQeBeBfIOJcmcP/IwRX70Sni2CUMxHOhsUCTxJ9uL6f
         ryDeNcpLATkXACSRu+yXfTgbhEjcGxqZnpjC7Qqd7iFLrKa4gvNORyLKAosgsqfRUkYd
         lR9w==
X-Forwarded-Encrypted: i=1; AJvYcCVoMlKkx5qCYHIVwcdebH5eDMarmeqjPwlQwmObGazBu5IeKUweNytbBAu8mPinYz4nmoR8kkOn5Kd4NA==@linaro.org
X-Gm-Message-State: AOJu0Yxy8YT+U6rlSQ6u3IM8fsDbxeNftWNTDVA6SrC3Yftuj4OLGRVh
	SHTPf0FqP5EN1XTLWV3oAASSfEXjyzHT3bS9B9JaIxWw/xN3iW0wd4BQZ30w12e1e/ZTnSRh3xn
	H77I=
X-Gm-Gg: ASbGncvn0EF0k2rZ/H1Hg3I26HZbHIGnN1hYBdwK5oXQuph1f8jFtU1lxgDlpBU/WEm
	bz8gR2Sm0R5NOZCsMWFMLvHtTFU3sqqhprEK4CnGR5v7SFO/Wwwu4dcvF2ikaPpsHBGPJclY31S
	SVPKExO8rFJT9Y30NiRB+TrP+eKHPmel45nV4KvosrnyTqejEln9Tdgy2Bi1qp97SsUe2ZJKHoY
	rpUJI1SIF/tUrY1tcmx34Z+AThRnfI2F/VRoaNoMXdJqHbuNNxfa6o=
X-Google-Smtp-Source: AGHT+IEkBsbVJvsOrZdU/bWIWX4Mwf9E2dHz/HQ9DDr+QVOG3OEjoakFnX8ebUp0N0dtsxDmzVj6gw==
X-Received: by 2002:a05:600c:1e2a:b0:434:a8ef:442f with SMTP id 5b1f17b1804b1-434a9e0b47amr51873015e9.32.1732790617727;
        Thu, 28 Nov 2024 02:43:37 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:37 -0800 (PST)
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
Subject: [PATCH for-10.0 25/25] fpu: Remove use_first_nan field from float_status
Date: Thu, 28 Nov 2024 10:43:10 +0000
Message-Id: <20241128104310.3452934-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XS39TGyL2PAZ

The use_first_nan field in float_status was an xtensa-specific way to
select at runtime from two different NaN propagation rules.  Now that
xtensa is using the target-agnostic NaN propagation rule selection
that we've just added, we can remove use_first_nan, because there is
no longer any code that reads it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-helpers.h | 5 -----
 include/fpu/softfloat-types.h   | 1 -
 target/xtensa/fpu_helper.c      | 1 -
 3 files changed, 7 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index cf06b4e16bf..10a6763532c 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -113,11 +113,6 @@ static inline void set_snan_bit_is_one(bool val, float_status *status)
     status->snan_bit_is_one = val;
 }
 
-static inline void set_use_first_nan(bool val, float_status *status)
-{
-    status->use_first_nan = val;
-}
-
 static inline void set_no_signaling_nans(bool val, float_status *status)
 {
     status->no_signaling_nans = val;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 79220f8c67f..e2db92c72fa 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -291,7 +291,6 @@ typedef struct float_status {
      * softfloat-specialize.inc.c)
      */
     bool snan_bit_is_one;
-    bool use_first_nan;
     bool no_signaling_nans;
     /* should overflowed results subtract re_bias to its exponent? */
     bool rebias_overflow;
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index 4b1b021d824..53fc7cfd2af 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -59,7 +59,6 @@ static const struct {
 
 void xtensa_use_first_nan(CPUXtensaState *env, bool use_first)
 {
-    set_use_first_nan(use_first, &env->fp_status);
     set_float_2nan_prop_rule(use_first ? float_2nan_prop_ab : float_2nan_prop_ba,
                              &env->fp_status);
     set_float_3nan_prop_rule(use_first ? float_3nan_prop_abc : float_3nan_prop_cba,
-- 
2.34.1
