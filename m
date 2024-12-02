Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802696njk;
        Mon, 2 Dec 2024 05:14:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWa0LNhfdwNv8FKY3E9CnavHJtJ4nL6yesswg0egGLaRhWeDQEXQTkBpXmTo8gGA5g4FZRI596O1+5SCA==@linaro.org
X-Received: by 2002:a05:6000:1862:b0:385:e429:e59e with SMTP id ffacd0b85a97d-385e429e70bmr5525644f8f.52.1733145298992;
        Mon, 02 Dec 2024 05:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145298; cv=none;
        d=google.com; s=arc-20240605;
        b=HoWb+8B68VY3P5b8+ZytWHy72AdELTynROWbaXORe63W6tqCqzWc1+UjivYR9fpz38
         HpzXzY2Ko/wmBgL5Zeur6BIXUPLswAMFrUqw0/QRbqDhv/uz1ofyg+hVzX5jTTB3GtGS
         xhWRqOPLN2G/7I4IWt38E+saGArF4bWejJEyJZfquRB7DcyTOuY7qSHNimEs9WtJRV9f
         c8uDWpxLr8c9UiBSUjvrcJDGFvu1kFcBkEM6xSpJ3BGxZMfxQL6RDnqYRwOsZoWu2W9u
         F+kGVhNjN+IDyvjDNNjKgow7z6e3v7+kgPDEz7Tvu4wjMPi/V+6SPHftZD3NxkCK/Xe3
         +HRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nt3T9iHPBG+FHbTn0HSdShbMUsPPH/sHv7Ur12KBxlg=;
        fh=/XzMTxBqMJzktuvFX1TzKV1XfpuUru7vo0gz7wQsxG4=;
        b=SS8z6CvyZHq9L2NkxEPvWVGIa3sL0LaRHj19w3ImwTgNtQ1SjOR1mWA1DyAkCBZHkU
         38HBLjB6yQooreI4WD9IUL98nlocvVjopJ2wd8fcLjEzyGkobSQT61DGu6rQaY9hhbzq
         yWwm0bZmEQ3RjEhShDeuujffzg+5y0iDxFysJ1BlnhxvDnBM7HlwYoV9vt8EWifezEF/
         lOGWaXZGOABCJx++Pm5UvoicY93FBQuWYWS5b2NihkVIxXckv/KBlGjgQsqWLiqaZxrZ
         Q3Ns4R5d/c+54w5f1FRZzEtmqdmJgpSRfg7zNjNCehM8pFtAx1qFyGhgSbr8T2ToGwgQ
         kgeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sZ/RpF2I";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd2d728sor2063998f8f.2.2024.12.02.05.14.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sZ/RpF2I";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145298; x=1733750098; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt3T9iHPBG+FHbTn0HSdShbMUsPPH/sHv7Ur12KBxlg=;
        b=sZ/RpF2I2pEpjO+9eKYm4OkH+MMqSIrpIJt3FGAptnvtfXK3Ks6AHK7/GB8NrsgUO+
         5zcnAdylMO0YGtes6HGQ7y495HZ3kzXdCbVbPGFRa865tues/o0ghUTE8NqpfcOwOv2N
         PN4WBU9+UO4HNlLYb1Yr7T15MkrY0wpegqTyAW/fw6hqurOnuVrBeL7VdCRqCxZQ+BGA
         kWGrjlu0jmI8saL27VEYipEWUGey4L2VYHyMPtxebCx8X2kaszVbW4h+vOHmObn1GoU4
         HcIvxb8UnwxWEthJD6xdH22NEVivAEZxlHQNBFNn6VEyVlbxLa3yEIeLjH5O/+szx50i
         EqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145298; x=1733750098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nt3T9iHPBG+FHbTn0HSdShbMUsPPH/sHv7Ur12KBxlg=;
        b=PCSn7jrUfhys/YL1Qn7IjMpb7XWWpYpHV1NUy4xtbFOdxqyVDrproXCEzhLIblzBn7
         6RY0TTD7CGVxvq7MqgLP0yslwUgQQ2Ds3ulz8Ixrd/jr/pH2OONEnuZGSaEHRSI9VGFl
         nfY1lhC/kXcTepOUOhmn0lUgyEwRJcJBNmQy0bHBLhVDALBjdk9oYBO0D5nKTpoEaUCW
         TOi2/ls9O3SXMLWTEyCMhiTiRHjBhK8CM+lJShsBk7rx8seoMV+xRCZePNSdAEkiv4A3
         IpQAyq8uXEX9/0Uko9JTaQ5cpZ+pYqQMmTrxBU5sgqkn0nyhEuU2RUsGJOS6esd4lDe4
         itBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMEtw2GnrHAgkeoFmchly2NnY0e3Oh39fAvEQsHOOL87PLy9XkQr8yo7mRCEwIQKjFVkpAKL3go57ACA==@linaro.org
X-Gm-Message-State: AOJu0YxbhEAtKsWU8FV77I9vI0oDyoILNKaAzGJ3qcFJ46otWBmcewD2
	kQLQh2mHWIczfHFqG0xz2ze2NQDdZZEjFnNZsqWRFOg4EH8/tDwdXRSdjAOZA0XZuQ==
X-Gm-Gg: ASbGncseQn5n3ZkoeiMely1f7ctnomvVCKPKQLOqVODMm+5NkJGCZAI4Yn4UeQvEucl
	lvBUEbCzdfH1uivJXMoU3x8j+2AGwrUbMCWnWNlEkMsdoPWrI/LfSz9Jy8B7lvVfkRqE5E/oXP9
	mFIWlPfPA6ijbh0yv0f+Z1tZRvTZTlpSVawYYklsspe5XH0JqPNoVrN0rRrxwEZbisjk8B6rZN0
	uOHSHsVmPv77sGGoiTN+XwcbNIp0mHHLe7fDXr3nF1RiY3/eHEnaOU=
X-Google-Smtp-Source: AGHT+IE7hA5L/kdfOrXZwx6rchjyvu0rnQhZYrqgT7fhKReK3S5N/rvDY7kE0Sn6w9k2hiQ4e9zeaA==
X-Received: by 2002:a5d:64a3:0:b0:385:f9db:3c4b with SMTP id ffacd0b85a97d-385f9db4370mr798479f8f.10.1733145298343;
        Mon, 02 Dec 2024 05:14:58 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:57 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 52/54] target/riscv: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:45 +0000
Message-Id: <20241202131347.498124-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rmj0SUbhP+fH

Set the default NaN pattern explicitly for riscv.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f219f0c3b52..80b09952e78 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1022,6 +1022,8 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
+    /* Default NaN value: sign bit clear, frac msb set */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
     env->vill = true;
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1
