Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004327njm;
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVs01rjhROCSRoGIRYxuo9YtaQp+RrY5dLYECVMY+QTsNtGkOLXEfuOVg/hDOopP9TkMGrYX8ooKXghvsOka+FYPtZv0rN7
X-Received: by 2002:a9d:7356:0:b0:6f9:e125:947 with SMTP id 46e09a7af769-702075f2786mr4823953a34.3.1719774063349;
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774063; cv=none;
        d=google.com; s=arc-20160816;
        b=pqaqmig3NPiu1HoA4ckNXTSL0PGalqVdXAIbjPnBFjw7jgiRY4mG67xlyqwt+uKwTW
         /1u8D0zHq5SSWWCnfkf/+0CE5zoaCX70Rkr/oeIgLJn7ueYLloar091DWWLyVc5wYk9H
         QDZ8Z9G6Zzvz/I7djoVYcNI5Uiat0NVzBXdXGnphglS2Q1BmQ3o5TguSenhjsvt/Pe57
         5x8ioiwZUjxK07EFd1qP3X3pD2vqmw+IKlWZDbT7LBspCAUlhfcZFX3G8rdEzSjC1b3J
         0nE7LiCOzbH94EWkyyM7DBaR5NsKoHlATWvm+cqAFCEtFaLAyHOuZYvsAIAN+UjB2FEZ
         4y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RVOFvPwsyl4QfxgYtVSSFj0skJQCOvZiNxR84pYswu0=;
        fh=Z0JGfeRK2eAvOFpTCWeOQwHQCcvXwJUWC9ENXBRcFy0=;
        b=DspTzAFFqKwg9t0NFdRySKikFmXZdKzszag05FAiZHzm935UD5QRr1zrfbrNC4hppa
         2qpcvgDOMaxZQ8G6CEs9lvsDB08I4FL9sAmE+fFf0d5ZQoeKI8ruiaVM8HQWP7bylYUh
         KwSqmRbF5Wjf6r4MWaXIAxYeucYX92hol2Jnkc45dNs+d2v7gEV/DUQojR/OSuBIVvpl
         /SwI+TbEfcA+V0Eu0jnAhSwZDkt70I7f4j/YZ8XQmxBIkg07XetGzorODsrrx5xtuKXk
         J/oNWVTH5V2ggjbQwoqGckBJhLjtAn6Gp6VL83+M/fJYOyz7LAx4KGjUnel7Gvc1cmIf
         fapQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wG0NtoCr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-701efbb6184sor3453960a34.2.2024.06.30.12.01.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wG0NtoCr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774063; x=1720378863; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVOFvPwsyl4QfxgYtVSSFj0skJQCOvZiNxR84pYswu0=;
        b=wG0NtoCr9mtu72YQWl0jrqBGh2JdFkf66DZIOvmZoKgCmr0DER/90WYMXpOnyTh40S
         ThCDlOTD2Igx0dsmTZin90k6kWfMrsDM7BUe3ZCSixRWT+0+0uK7zfcvWcL1asoGBawk
         O99qcF+TBBEcKGTBzXDnLOg1/nRV/rIqpbeMg33j9RhMoI7u6QqZGXusTghN2zpGFFC/
         v1IHj2uGEIB04cufCvxhCnXanyQUI5vfTFeoqbPmHga5EL2iVe2REJ8aboNjQZU6LHEF
         5B0gY0SBdijdzpfTWLCRCakkGmzmPEleY1EMTfMqV6Olfk9pRt9VUWmHbIpcjaipi2zt
         QOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774063; x=1720378863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVOFvPwsyl4QfxgYtVSSFj0skJQCOvZiNxR84pYswu0=;
        b=a4HJqksvt8saDQIYegqEvrr8kgqDkc3JDoCNccaE6IV6gMTTDHoUg07h6WKcZmz/XC
         cw0NpcwexI2m7o4Isa4GVvPIg3ODUdFMYV7mVyPD4znsvBLFZThXmfp7KEmc6jptnz7A
         MUNqrcL+qSIz9dgVORBj9pNgU4qDuohsko7eojMIPJ7uZgQNVtkrQ3INmUKEnngoFedZ
         U/wNr57zQu8WleaY1EYqYM90NPh/iDBbUUH5p3sCgoth5lk7fWvS99qnM/3+g5gieyyQ
         V7CgoJPKMgj/cw9P06ZalC+jlq088/SxQBp4T3P/RALVNHSKStoSQ5Q4n8/14Hhyz8T+
         s6YA==
X-Forwarded-Encrypted: i=1; AJvYcCU+tp7sxPRYKxh+JAohvCXiN7fAEinJNLylGbU/aIwWPun6N1j9H6xXI7/0xPo2s72YjSnFDyedVlsId8EO+FhaySvh2Ydj
X-Gm-Message-State: AOJu0YzjyPkvCyOfygSicAwGyUDrjHXwJb3WteXyd3eb64aDiLVBM3xF
	gS7niIcV96FvliGBUG1YdcTbx7OvzM0TRcYxSDH+QMNnzAMsGdTWavJdCtG70tywcg==
X-Google-Smtp-Source: AGHT+IHA7EAD2BcPbLOszhLP6OoRn2JyUpvo96A5Uk5LyADv0Efa7Q+vf8tGolXYGn9c94tdtTdkyQ==
X-Received: by 2002:a05:6358:9486:b0:1a6:84aa:13f with SMTP id e5c5f4694b2df-1a6acf39bafmr430163455d.24.1719774062730;
        Sun, 30 Jun 2024 12:01:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:01:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 11/14] tests/tcg/arm: Manually register allocate half-precision numbers
Date: Sun, 30 Jun 2024 12:00:47 -0700
Message-Id: <20240630190050.160642-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T1WvH2aSKPQi

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Clang does not allow specifying an integer as the value of a single
precision register.  Explicitly move value from a general register.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
[rth: Use one single inline asm block.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/fcvt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 157790e679..d8c61cd29f 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -355,7 +355,12 @@ static void convert_half_to_single(void)
 
         print_half_number(i, input);
 #if defined(__arm__)
-        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" ((uint32_t)input));
+        /*
+         * Clang refuses to allocate an integer to a fp register.
+         * Perform the move from a general register by hand.
+         */
+        asm("vmov %0, %1\n\t"
+            "vcvtb.f32.f16 %0, %0" : "=w" (output) : "r" (input));
 #else
         asm("fcvt %s0, %h1" : "=w" (output) : "w" (input));
 #endif
-- 
2.34.1
