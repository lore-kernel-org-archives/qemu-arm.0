Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458408dye;
        Mon, 30 Jun 2025 06:09:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9FSgffDZGr3OivZfTYqbgzYXlInnnXqeHT0Xd8rcnkhh0lZRVImIQgZapNx3trg8UoEbbUbyStGmHvQ==@linaro.org
X-Received: by 2002:adf:fccb:0:b0:3a5:3930:f57 with SMTP id ffacd0b85a97d-3a9004801acmr9250871f8f.51.1751288985807;
        Mon, 30 Jun 2025 06:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751288985; cv=none;
        d=google.com; s=arc-20240605;
        b=YujY/X50n3EgwYscpq9t86p7Y4V5/kBVRGqF9JlLpI5LYJFTiZWTKP7cEpEv0oJ9kd
         FTp7ICF0YXKBMtjukWs5zSHfYc/nDwBoMf6WD5pmRAprX0hhlkYPIoaWHtys4gKOxkE4
         icHc1QZq5HQDKO7KNO3dUvbpPBT/yU6eU8BW7gRwTKa8ztovyNmyVH2CSw2hLs66cA/l
         17j4NXIjDPi6Y+PLNtGUPsySGmhc+Pmgb7ubicjJR9GnHSQXjFyjX2KzYkiu0usCyqWl
         kyqsiHdhYRX2UvKfYR6990CDztgqcZCeWLLIsJGG78z1g9Ij2PviFUyXtQg3V7U0YPGm
         fSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JYsduLxNVqPKGIUHLquU8P/wxsfx+yTwXnitP4Bhu9k=;
        fh=lOJGVd442d0Q9vIJjxD+y18Q9fBH5BQA0nk0puSY9gA=;
        b=j/0BGEc2o8OLHo5FZaR6ik6h3sUfWHcWyI8GucVpswaboZuh+MAIqX8T5kBCH841Pg
         6cTY+zsjP2fXaAW3PsGSSV2XTOCCkClgL+rQBf8c9BV5/rPrM3AaO0IDBDVVpo2kOePG
         OKwBq8fnC2elJrRjAIJG5knJ7yC/8EKgEQA7b8BSxHt7tZuAcMUPdYdZny0a/5jtnkwz
         uANCcaKxfIB6uT0fpVnC8gcIb2ycMcl7y0zBuC7KzsQOC19tQuhKfSHVNHnE7W/+hXX2
         cgx7sgpakDKgIxKbZDcFACRdOQ4D9qvzl7RSMCMklX18GtWlKMXLQZ5GFechfghqTuki
         4mlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Icj91XRy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a892e68cd0sor2508511f8f.9.2025.06.30.06.09.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Icj91XRy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288985; x=1751893785; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYsduLxNVqPKGIUHLquU8P/wxsfx+yTwXnitP4Bhu9k=;
        b=Icj91XRyc2YEmHS1upLipGehlhAJxFCDrkzL09LEPof7fJnzshFaSn1iPXR2nk4m1Y
         KBZsl6XMyAnk74R4yUI8Ua2vU4QBoQEbQ47nDWSU0E5L1KDG2RRwS+L1D5iZ9uiDqE7+
         NMF6OFsWN77AqeCdaPpM0bM06jXkmYVuHUDnGh902wQGTnmngwefudhNg5hIOCouaxZt
         Jb2HuRKoQxQUQgAfgAawlP8B9qKfqupfwhjcnjrjdOJKl9tutxKvxsmcgDhAqSmlHIeN
         sMWObXbRw2DNcQ25Vnjc3ehDbwmquIQjeg/klZML8oyaxvvQQKL9okbsLrCkBgsjVy9i
         Z0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288985; x=1751893785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYsduLxNVqPKGIUHLquU8P/wxsfx+yTwXnitP4Bhu9k=;
        b=RcVMkSexTsgEhWkHpXi371Y47uB/HFOk3vsilDbHRQxt+2SJvjPu0zR/OLNpwa6i+b
         hftXH/VlzVW+Q4bDFxhFrw5w7NIhlC4TJNvyWN5uL/eFojlmJtnxjf63F64f3ytO5eGV
         GoFPshi3ssFPzqIsGLBhzsZW5HHkbc/E994XPd0P8xBnNMo4dfOQYnqLxKg6PBVjDmyn
         HM1wBBHnUkFIZeaqkQvAkDJibNW+ee6aT5QzihmTpRt9rbvzgdS3BGH/jcG6Nmv1Si3g
         861X1mjJJ21n4ry/v3XmVydyd9eAsUhZbwHEfXlNyMHAPAjxxBQXd2Aygoud3iZpRcC0
         YA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl3jCNe3Z+JQdRQ1fmE81LJkXQHN2YxH1DtoDcF3MliIyPIpoRruJd2MROhLsZ9tnWchD/UvK22sMmnQ==@linaro.org
X-Gm-Message-State: AOJu0YwlASbqUqYQYOorNRP0TDflvAEOnVxO9zTd8/E6QwFfkytCBsmh
	WIVGGPfy7mTHh7cfWIb1WQMIMjM+u31wO0DqAOANn7zC8/fevUosK4jY6vxb4PMKhh2V9fkCsjk
	l1WfvbE8=
X-Gm-Gg: ASbGnctWvzYsOrNFmG2khm8AeAVLr3Kd1Eya2fvQd3V+ExY2Z/77kQSy846mkoR5vFg
	Pbyyo2CJ37lcHAPWTvnocrKXjWtUbRyv4Dce5HJ0exvA4aPyHDT8HhE9UQ16KdFSU0alBKv5qDJ
	pzUKLV5zIMpdKzeUX9qk1DJBrNW4HS3kn/ynGEnbW+8KNs5SnhipwY62I3lzOTWrnXHjd5pDLBY
	BqN6pnJp8/FQv+hmoYSTdHFzsMHKIXnvsLg4RP7i9W7Rh6u/bmQdBd2zDDAY4bEv1bkHMwUyo7F
	0AdyukkeD2X8ThCQmw/6ARiiDUPiNu6HmDPo3iLjPZO9GS298PXJKCuSEw3MiAKWnnpqfHADRBD
	r7kwhW7ckZ5jIx5goZZfspi6etjc/SMtF+W0F
X-Google-Smtp-Source: AGHT+IGGUzavBAxnZDAudqJ5R9I1M0tcbn771DSJnY6iAVvDoRTWzTNamhzqevp5dtEWdPx1XkvQuw==
X-Received: by 2002:a05:6000:1786:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a8f577fdf7mr11776774f8f.1.1751288985121;
        Mon, 30 Jun 2025 06:09:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3aba76e40c0sm6177885f8f.59.2025.06.30.06.09.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:09:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/6] target/arm: Only set CPU_INTERRUPT_EXITTB for TCG
Date: Mon, 30 Jun 2025 15:09:32 +0200
Message-ID: <20250630130937.3487-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130937.3487-1-philmd@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HcIG71lSlnxh

Commit 34c45d53026 ("target-arm: kvm - re-inject guest debug
exceptions") removed CPU_INTERRUPT_EXITTB from KVM, but it
also appears on HVF. Better to restrict it to TCG.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 889d3088079..764b1f82dc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10929,7 +10929,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 
     arm_call_el_change_hook(cpu);
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
     }
 }
-- 
2.49.0
