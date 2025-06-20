Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877210njc;
        Fri, 20 Jun 2025 06:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbDjj+SQZhm8UpIeh6MqeHej2OdZXQgcIG+dowX4j/MJwPuIRYDYPcxIJ5fgTWlhYzCVtoH7OJBTt76w==@linaro.org
X-Received: by 2002:a05:600c:83c7:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-453655c6169mr30698515e9.17.1750424844049;
        Fri, 20 Jun 2025 06:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424844; cv=none;
        d=google.com; s=arc-20240605;
        b=QbIkLeVn1FX56VQw+M87nK+kfOmGzCe0QoRafdFjfHrEqT+aBGyACP3WjbSc/NBdKo
         TrOvC5O7flPhE61LAL/Y/bX8NOiQkEo2c1u83iE3ppuEk5YuLhs1wQVv0/qbdHGrb5qn
         iUTRdZVOE43W/mwSlLon/MDQ4i4BD3gyM0h84UBU4IY/ET8WdRWfiFM8mR7UheUaOGBA
         NCAPKwygYHNwm4t/RNm0Njoud4S60E1YV7mOvPPpGIz06znohOgSjE/d8FEjSKOlItkX
         Q1oE2hOT8Iuj9aY3HxJi3FuRhzapssDDl4yGov/NSR35pSuMFb+UyfVjVrDEGRUm4wKg
         4Q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=33tTruwtHJUDsLE1NQEO6k6TPJwHdavbHWnexaTt8VY=;
        fh=951+ZajV3WfzxMSVsCb4T9MGvLDkQ7k1uK10rZEBe3c=;
        b=JZGWyUqOi3LPyhmpzWk2c6lOehly8Wk6Jg/2qtra5Ed4v4aWdRP0rrDS7CzfN9dp+B
         bcMmX02EkVzuvm+nrEPMVPhkJ92mGzlH4CgUJ0qwJxzE6eQsQ4JzQ0GU35zF3qatHdeL
         +D06LN/y/QxIQH3fHz8byUqg5dj4gU7t5y52sU2scNR2tX/zHHYnPq546SV1iKw8+cbw
         wUqdm2F4rB+epAZrf1W8WTY7mNv6p2psaRCIKQJdcScGSrsNvXdSNq3I4n/XfqBHJrKi
         z+lyv0QyUC4lH+UeskDHUrkPzUYKuSeFGWdoueVbVL+mfnSqqWyo93xUoRVyDc+LnwVu
         VQmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mBz6/5Un";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4536470828csor6285175e9.10.2025.06.20.06.07.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mBz6/5Un";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424843; x=1751029643; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33tTruwtHJUDsLE1NQEO6k6TPJwHdavbHWnexaTt8VY=;
        b=mBz6/5Un2w+ylRkTKIOu2kJ7Xy/d8A9GUC7i1tP2Px7/jt0UD3NfuHoGIvWZSeqPFl
         I3hRQieGoBK2qk8RfYRvWHGRudZu8J1LjxGmTt+mbY6Jsn5dFvKjI+Tf7AburNmXH9vJ
         pPUQnZlyrdi0NHmCVn4bE3qbPopM/DY0YtiWSxjQ4f/rJaK7JuVyIu9zqgqGOiIhUCdD
         Z/fEm8fHzCNsZV+47eUn6D7BsjcLpImel/c15bdkLm6J2+AlZ0/DfRj8QWozs35RrAXQ
         L33mA/k8eWBvF4m/xwJjbMB6mV/Ua5IO7EduH7EtSmghldaAD2kSiRKtpiHmBZSNs1xr
         /ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424843; x=1751029643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33tTruwtHJUDsLE1NQEO6k6TPJwHdavbHWnexaTt8VY=;
        b=YWzSyRLVu4z5u49UjhWt2+mHxDNWBYICatwezHk6/jI5yZmPuYPITlt8/vJeyANoxH
         bEVisTgExMmhR36Ea07mxTiLWs1Gn47gN1Rogwi78j9SF2Rsgc89P+dEtMOr+K45+5sU
         cFAmoN9OkmWgF9fwEdo4qGn8vBxZFtnx4ZMLNRtRf/8KjA2x5J6TNiQ0OCMH5Hn8GdIq
         qR6HeeC9WGX7g1Baf617kydtIZniJ06KF892xDIpdWW+5cczN/NOAN+sVhdOxKHQOHu4
         EKWmP2XJbt7sh35Pjkza7rRmIRo/lux5UPF9OCOouQb78fPznccUW+xSbODqB56OS0bM
         VoRA==
X-Forwarded-Encrypted: i=1; AJvYcCXRA1d0HekmTYURjSrNO4wuxJtAV+awq+LqCixkDZrdHhkXovwKRbgJz0tBRYhzDx/esnkNqhn0HYDF/g==@linaro.org
X-Gm-Message-State: AOJu0Yxd2OkBzG4DWPfakqFK/8e/iZfk3E5lv+Frrurvmv6MaZaPnB6X
	mE4srLRVADt4mC21KqMbgxFrhPK3IxdbydH1GTnTbeEzDSjZ3vf4BRlvizx4Xh/+Pg7GiQ==
X-Gm-Gg: ASbGnctF/whbYxf+vLc7DG6uZ0SQJCAumQGqspO9VoYLD2H7yFIn6kIlu8Nw5YCoEMT
	5EeVWpReFex+Y4KYfRamj3n6P15srKaGdnMqDtyEPgz6+f7RAhoT25xbYxoyfPp8yh5qhv/3Sxn
	MshuXDrXzjEpqo8w8byQIhnYzOq68ft+wS5L0l/MlSmjUcUmVVFGZowraAiDGQJWKdJ9ar/eA0g
	QOz9mXXwtuCcqT4g2s5d426zMCdqEBvEb5LqRslOX+fpVtsk/c6By+CLJb38yUtF/+kkZ9zztDO
	zQCZz+7Gqv90xdoCxkDK6XdVnLiDq0MAc+s3hxwvm3JaNosHD7ScMWFT4L5A5hbBEDKS9Eur52v
	f92rmCaCjThpl73bN1aSGbvqBX3adfQsE/Qi7
X-Google-Smtp-Source: AGHT+IEPb6wrdygh9iEg1xDu0Enz1glDmMWW79h8+hZ9AnnXvHvnm2dPPn2ChqyV+PmW9BY7cS4i1g==
X-Received: by 2002:a05:600c:35c3:b0:450:d568:909b with SMTP id 5b1f17b1804b1-453653ba6a3mr28180435e9.14.1750424843244;
        Fri, 20 Jun 2025 06:07:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e983c97sm60000735e9.9.2025.06.20.06.07.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 02/26] target/arm: Reduce arm_cpu_post_init() declaration scope
Date: Fri, 20 Jun 2025 15:06:45 +0200
Message-ID: <20250620130709.31073-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PLTSRvB7oYUV

arm_cpu_post_init() is only used within the same file unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 2 --
 target/arm/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 302c24e2324..c31f69912b8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1150,8 +1150,6 @@ void arm_gt_sel2vtimer_cb(void *opaque);
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
-void arm_cpu_post_init(Object *obj);
-
 #define ARM_AFF0_SHIFT 0
 #define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
 #define ARM_AFF1_SHIFT 8
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e025e241eda..eb0639de719 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1713,7 +1713,7 @@ static void arm_cpu_propagate_feature_implications(ARMCPU *cpu)
     }
 }
 
-void arm_cpu_post_init(Object *obj)
+static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-- 
2.49.0
