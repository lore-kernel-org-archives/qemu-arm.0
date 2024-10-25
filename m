Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086208njx;
        Fri, 25 Oct 2024 07:13:13 -0700 (PDT)
X-Received: by 2002:a05:600c:1e0f:b0:431:518a:6826 with SMTP id 5b1f17b1804b1-43184211ee6mr101736695e9.19.1729865593357;
        Fri, 25 Oct 2024 07:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865593; cv=none;
        d=google.com; s=arc-20240605;
        b=hJ1ALowKLy6GoM9TZzmbjIoEjf7gOIubU/RaVkH06JspPqJ17morCVp/3mkLPlX3Ww
         y5+MGE6xXdjKUElRGd1Agx+k0Oub/cKto9/N9nJLa9vJ/rSFij0x3ob4eyo/Z4O900Wg
         AIM+PwzrXJ7W+1kuzdvZIsgYFyMCjqd8kZujC9jrfjgvTaqNiKA0TzLB1AsZG0BQGrEk
         s/2t8wBRFm5BkXe+Bm9P9Xz+LbsfTTLx2wR+psICbytwjSRJmN4M4+qLRmSJBeqt78vm
         FMqOKHxYan1vlIayaB40DbDDVE8OFGw8cQ9qg9c24K606flO6I/DT1qhcBf0Va+6n/xG
         3rmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ID1X5YPOP+wvOiim/+MbdA0+ojv9rI9zYRkjUusf1JE=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=ZXlvncVKl3/Qfa7XniSkUeTjWz1zoEDASoGWonGboMx0mhHPT9JiARBVOcryIqyYAA
         bEHfZAg9KWhB/0146mrpSZzgHf/om14+hl92AS/CJfZV7gZS/tym4ECU8pounTlkOKzE
         m87bBaGbp5yzpc/CyjwdZILmFhK9NlZ2DH6/NU7u1I/iq664ipqzb42S3LurAI3LSZue
         riG6RX7U/hddXeCUP/vqujdlUW+vRFdTXX7RXaL0SLWly1ELEjV1NL0uJCzeLEVQu87A
         tclQQ38i0Z5YRk1c5vLPjxDjkLQaqI8QtKdIu1TvXYLnm1sqCP253SODRe1F2SzW3qco
         qY/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4yQl+Sy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397cdebsor5715735e9.11.2024.10.25.07.13.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4yQl+Sy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865593; x=1730470393; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID1X5YPOP+wvOiim/+MbdA0+ojv9rI9zYRkjUusf1JE=;
        b=O4yQl+SyN1EdwU29mP+HTUEwbjG12iECE6mUbPoEAuWQPHKoLGqCmB7DNG/o2XdhpA
         6LeUs+GKxpDfv3V5ShuiOnQsjeNFM8cH2VAHbITKcaIA/KUHvEhFx8k5JIP7AKQIywQS
         m/ba93DS/PDu5FijzBHgDAskKCyJmeFd55xOH/UKrZIfKoWRNqovvEK0giEskxleHVP4
         dA0Agv1vPzUxSYQqrek+JPKaF3KMRGjprZVJvaW7fg8Wt6elz/z3IqJuH1orGTdbETVy
         riX7S7QWVF2yPYgiKbKjglr0YT9hoKjr1guci8gDb4GGg5Cy+38M+RoQRO2iAW8cdCub
         FZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865593; x=1730470393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID1X5YPOP+wvOiim/+MbdA0+ojv9rI9zYRkjUusf1JE=;
        b=UMWKhzRgULpT1B1FJ6Dxu2pL6PjwaMzQZ5D/lfINGsviJ0fVjCwwFLOhCqPCvvH0xX
         6ZTUZtTpHUgP0gta6fh6EXooYMfAEAFXsuluhWRW6Il9qSWeAVH5z9aZcDY3X8qRGyqx
         r1XIrcDBIpFuz9Xx6FlaEWjqu4s0mvQ0gloacfhfM2FJWZ/qEqrkk9AhuF4kI1Qi3ZAe
         sDrz9cWAczCb8jCnRm7ZT+0nMxGA7OkKmrhwb+LhPBjqQfsgSYPSNmKZr2xcz7ZgB+kz
         zvIMPrKjeY/vxKWsKE00PaoD+voMISZwdIprVntKdnDi2Ws6C6ATrfY0w30EJLu9OGq3
         ffKA==
X-Gm-Message-State: AOJu0YwI8NwuOfSgmZiRgrZWVENmO6A6nkZC70rISEpoIVclTuFqXbXP
	gJjPH+Q8LanHRlPWsk+AVHqvXYNoYVJklEAEfMmcp4lSSt6te6mIErBt1ITKOVK3Nw==
X-Google-Smtp-Source: AGHT+IGy1w+80bOSIQXUmP56n98o4p/PcDYHpGIXkWufhknYuh37RULU8ikJ7ZEtnUhTzvm7qJRzVw==
X-Received: by 2002:a05:600c:4f04:b0:431:24c3:dbaa with SMTP id 5b1f17b1804b1-4318c8db165mr63501525e9.2.1729865592796;
        Fri, 25 Oct 2024 07:13:12 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 19/21] target/openrisc: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:52 +0100
Message-Id: <20241025141254.2141506-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ytbxoJD1LvVV

Set the NaN propagation rule explicitly for the float_status word
used in the openrisc target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/openrisc/cpu.c          | 6 ++++++
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 6ec54ad7a6c..b96561d1f26 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -105,6 +105,12 @@ static void openrisc_cpu_reset_hold(Object *obj, ResetType type)
 
     set_float_detect_tininess(float_tininess_before_rounding,
                               &cpu->env.fp_status);
+    /*
+     * TODO: this is probably not the correct NaN propagation rule for
+     * this architecture.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &cpu->env.fp_status);
+
 
 #ifndef CONFIG_USER_ONLY
     cpu->env.picmr = 0x00000000;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 40cbb1ab73b..ee5c73cad46 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -407,7 +407,7 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
     || defined(TARGET_SPARC) || defined(TARGET_XTENSA) \
     || defined(TARGET_I386) || defined(TARGET_ALPHA) \
-    || defined(TARGET_MICROBLAZE)
+    || defined(TARGET_MICROBLAZE) || defined(TARGET_OPENRISC)
         g_assert_not_reached();
 #else
         rule = float_2nan_prop_x87;
-- 
2.34.1
