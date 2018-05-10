Received: by 10.28.4.212 with SMTP id 203csp1064299wme;
        Thu, 10 May 2018 07:09:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrSB2Be1fJdr84mXZBpJPF7PBX8chtF+3Js0/Y9PDuN+N13gZzNmosmWSnpJwQkwFTuD7Tt
X-Received: by 2002:a1c:9015:: with SMTP id s21-v6mr1334131wmd.75.1525961376473;
        Thu, 10 May 2018 07:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525961376; cv=none;
        d=google.com; s=arc-20160816;
        b=czWZIXZMi3nStRm+9F8+ZHeq2ZkKcAyb1HtcHseNQmJGrYjGH4hwGM4qAFGvm9JlYw
         wN1CvGuy3KT9YsfwdtJoQ1MwZTL0MpbyfIKdzP50wCLOotn52X7Fs2pDCCCRsBmQybF/
         /DjjZargP1rt/FyBGcBXrWlOuf3Hm1LV9/tK1jA1RGMd/1SYCEeUyoLFhHuidgMLyvm9
         DM9veODCyPGNSXtAVgde93VhtEp73hGRQRPOQI805R783blWDipL526+Anzf0h+82iKP
         de66LrJKSHRMCR1tY0NwR2BwjPmi3Ql7uFWOUqiY0aK7Iw93JRGeJCD3mIXAg+aIB1Lo
         cykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=phvNjbdXKwF6gAiGMKPp/9bnC+Uma0HqzuJu0Ayam9A=;
        b=T3jyR+iNH3CEWakEoZmaYW1zHku4wH28RIMfGldIPPYYXRhXK9V5xRH2gIM2sZLAJH
         dVoaW7/nheJvA6wsxjpp4ZfXIjSvWtl6HlG2Xvi27gXGw7SzrRnE5+917K60m8OIoNkx
         HBX5GRZOhwqiEUgk/8BwuwckJxfpbjBIAldUJh+5QAfWKuSLeZ9DWLNCb1SiJGxvalyE
         cuPrA5RHbCDQ8Hr9jjU7I2kIQEtCrS5V4pc28Kvcx6uTaOGHkWmsU5ZUFZYUWwKPXABo
         7QD4zsCt6Yd+fvpct/EwjcRi1lfJ9ogyNvCABQJRXyXzupdBIwYE7+D2qmdtURZw8uUP
         Da2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 60-v6si831559wrj.64.2018.05.10.07.09.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 07:09:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fGmGF-0003Ir-Bx; Thu, 10 May 2018 15:09:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: [PATCH] fix fp16 tininess
Date: Thu, 10 May 2018 15:09:34 +0100
Message-Id: <20180510140934.22855-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-TUID: IW0GxD/cFg6g

In commit d81ce0ef2c4f105 we added an extra float_status field
fp_status_fp16 for Arm, but forgot to initialize it correctly
by setting it to float_tininess_before_rounding. This currently
will only cause problems for the new V8_FP16 feature, since the
float-to-float conversion code doesn't use it yet. The effect
would be that we failed to set the Underflow IEEE exception flag
in all the cases where we should.

Add the missing initialization.

Fixes: d81ce0ef2c4f105
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d175c5e94f..7939c6b8ae 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -324,6 +324,8 @@ static void arm_cpu_reset(CPUState *s)
                               &env->vfp.fp_status);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status);
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &env->vfp.fp_status_f16);
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
-- 
2.17.0
