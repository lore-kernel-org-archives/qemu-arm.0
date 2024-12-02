Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802331njk;
        Mon, 2 Dec 2024 05:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJ9f/mEKh1lLMy6Ov2W/95N65SVNTSnsezeWpzGOJnpGbrs/Plhh+lAOtpxJM7smvVYayxlal+ZpnpWA==@linaro.org
X-Received: by 2002:a5d:5f53:0:b0:385:e204:b30b with SMTP id ffacd0b85a97d-385e204b379mr6967548f8f.53.1733145278348;
        Mon, 02 Dec 2024 05:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145278; cv=none;
        d=google.com; s=arc-20240605;
        b=Xbux/2EkhVU11YT0syqfRgTfqNj9snx0nCH0i+0t76MAAe8HE/YpdWOGKGDB367rfp
         NlHEALyX9ysI9NAfIOLll3EMe3zhBjS8l1kwWJi602onm/9UCq9EPrSfK22DIH6rrtXj
         o96z10diIMEkzy4Wu0pDI6Gp0Jpj2jEiMJvX7AK7d4LUWKCbk/5T+b556iRq7Q8WuYpE
         qP1qtGgg+xLbdlW8aoh8WvoFbzPwUcbPBbR5h7Mo4ZoUCe6sTZJn7qjsaYeMUSxUtux5
         DrOyMZavgnwtZro8kqkEJGfmoAM9vp++mDdPlgEcNwB2R3A8oDldd7i3Y78oW+vTnAWD
         OoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F9P3Zyg8EWDd8Ipp5Pjnvse0G07D293rwdAJ1WyzXl4=;
        fh=QEOu9TAYgPZQ3UAu/zv/ALY27LeJqyrjF25wWv9PPFQ=;
        b=SHujEZdgNGiGJSFgnLZlM8eN5C7kp/N1BHKZFovII15NaAXsp4EfT65uxKRTJhdls6
         ZolfX1gftb8+u1w9HotpPAsizDj4HoExVKgiKBejwpx/UZ2m8Kra2gMGtg5Yt7Rmusoy
         4gGiae90xaN94pEN5p12JEAQGAH565FyeFlunzIVIUiNSG4rxJRxmgOsaEsHYLY8cCMt
         iJ14zBmCxpAIdeoHrocBkKq2j6SpYZQ0iZA6ViP6xwgOYPeKjxZtpzYNmMRoAE5u5+ac
         T/2IlWkZ+qNfR2sbivTsvx9dLegETviaue+H8QWm8nfzWuQ51+vz645m1gOLAYmT3pRD
         w64Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeIvlP72;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e04f5cd1sor1655749f8f.0.2024.12.02.05.14.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeIvlP72;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145278; x=1733750078; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9P3Zyg8EWDd8Ipp5Pjnvse0G07D293rwdAJ1WyzXl4=;
        b=zeIvlP723b1je3ehzrPHjPPjRPO6vJmu7xedvRi2yzXXjgzi2JrTaotlv39BqyLk14
         NTXFhkJnZCALAnVZBJ99xqs2z+WhoMbvODt1tid+mMcsxMbPiepRKDenMuXn1W2Aq9Xc
         CHZoCo9EbCkHCwd+r3d3zTtPH6NIKcUHmchEAtScFiwsxEyLnomfVsMebEkZCTsE8qjd
         YEQrvacd1SRq+HOCxf/jGxKRUqN22c/2aTV3DOiKrEW2mLJWakrUZv1GJg2o9IRszWka
         93oLqy0drpEMvxk44a0z4lRcOwb8wPHLaKqXGTlmz4T9OedZDaDtLivgpNpW43CP8Yos
         ii+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145278; x=1733750078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9P3Zyg8EWDd8Ipp5Pjnvse0G07D293rwdAJ1WyzXl4=;
        b=BFL3OY5MBnFXksiZzIfScU2fYrK8lO2i2heLQRWVUJvfPe5IbY4RBsMruJp9YwFOBq
         /3wf3zvHFWsF2SbF8zvMvDHqjknUrYMkh0FzrgUdvnWSn8F/pTIsd0hDQGVKo5akBKRn
         i+QxAGGm/g7DH42J9oJGZ3m48eN2p6zD77eDqEHw1jPe0CWd3QVHlEkqa0t+O+/oVhbI
         GWTYPyydWkM694rqRmARQY2n0XKhVuPXGtXzFXVpjXPXYY03+9qYO5pIbv7Ytpli/xh1
         bRNmv/bPvsUR4+S9eJQ6Oq8x+XXkwpGXZo8TMx8gPUIwS29VetAqNG84eaGW/IB+oneO
         Ns9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcccibJ2zGSB+0xIQd1hZp6TxpnIMnuH1R35k7HUYV2RFxOQE2GXhtaa9Susvm/UPEcjyRvzIXXaIC+Q==@linaro.org
X-Gm-Message-State: AOJu0Yx+LFl7CuXLkGdCmw03by4WJ/Ufv0qYfkqgRMnpnFswQ6sf5ypD
	kUYyzwwMmZtBibJxcdRX/pAQlkd2BLFmLWGDSHIZE2qiMo+5o4wwFU+m2FfHp+uq0M4ct/du+VG
	kAKA=
X-Gm-Gg: ASbGncteC2ZnIKP7HXfI6rt26ILwbhg4kHRj3iNsBsH7bSSSs1/G9x5dzKnSU7FtHp7
	bkLsyMk0DLxwL/CGWUCN/QEeaWfT6GkvWrdBqiGUh8IQZ5wGgS8+1Ho3KqsRW8IxllxgRHXIz/7
	UpeB7iGvnbRvUxzkF/3uiytOtKOzXAKm4v18wUikUSqgCA9hm2tfl1Gab4EYYd4C2IlI0tKsUHv
	1DtqfG30slB40T5i/uLnSbATELjdkfGG31/3WMB8JfE1eN8i5LJh68=
X-Google-Smtp-Source: AGHT+IFL61A+tairJzPOItayh6olQ1F+IieedrTB8+3a6uLQVDTHerrpGpRDJzdWMxXPxCl7i8SUAA==
X-Received: by 2002:a05:6000:2d04:b0:385:e30a:394b with SMTP id ffacd0b85a97d-385e30a3bdcmr6032714f8f.16.1733145277754;
        Mon, 02 Dec 2024 05:14:37 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:37 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 31/54] target/m68k: Init local float_status from env fp_status in gdb get/set reg
Date: Mon,  2 Dec 2024 13:13:24 +0000
Message-Id: <20241202131347.498124-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GImI+4+gTNKl

In cf_fpu_gdb_get_reg() and cf_fpu_gdb_set_reg() we do the conversion
from float64 to floatx80 using a scratch float_status, because we
don't want the conversion to affect the CPU's floating point exception
status. Currently we use a zero-initialized float_status. This will
get steadily more awkward as we add config knobs to float_status
that the target must initialize. Avoid having to add any of that
configuration here by instead initializing our local float_status
from the env->fp_status.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 9bfc6ae97c0..beefeb7069c 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -36,7 +36,8 @@ static int cf_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n)
     CPUM68KState *env = &cpu->env;
 
     if (n < 8) {
-        float_status s = {};
+        /* Use scratch float_status so any exceptions don't change CPU state */
+        float_status s = env->fp_status;
         return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
     }
     switch (n) {
@@ -56,7 +57,8 @@ static int cf_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
     CPUM68KState *env = &cpu->env;
 
     if (n < 8) {
-        float_status s = {};
+        /* Use scratch float_status so any exceptions don't change CPU state */
+        float_status s = env->fp_status;
         env->fregs[n].d = float64_to_floatx80(ldq_be_p(mem_buf), &s);
         return 8;
     }
-- 
2.34.1
