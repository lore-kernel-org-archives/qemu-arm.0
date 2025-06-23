Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509283dyb;
        Mon, 23 Jun 2025 05:18:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr35rzwmTK9TNX1KZHJf36psaA78reuGgEPo1eoZkP8D0KASZO5K4cdkGPtTJyO2gCq5+LrVT1yUdiBA==@linaro.org
X-Received: by 2002:a05:6000:2383:b0:3a5:3b56:974e with SMTP id ffacd0b85a97d-3a6d11910c8mr8073918f8f.6.1750681138672;
        Mon, 23 Jun 2025 05:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681138; cv=none;
        d=google.com; s=arc-20240605;
        b=dwiOB5DaZ+lQ+gH5iqnHr66TrRLLJHmBGaKT8Y4yxRJsOPnbCUSL2BmNN82WiaWDG3
         VYmjJ7pwdeeKqCDPSolYlmReyr5vPLPpq2sDMd9vGSIu0LYLCepnr24dLRO62gB6+efJ
         gmyinGx1Z1Y03jqlu6YVLEGn9A4fTVoi9/dpw2tc4b0X6fMRN6KhvnOhhDqJFx9nwGtp
         esXT795wumbZOO5CdDZU7y7RlziClz2OWFpFHKbhHagFSkejY64lykxq44TB6zQ7hFsT
         Mwal5IuHwv3c2bq60vzY0Lh07xKItFyHv6bSrUookU5UP2UNERr94up8vfpatSYHHBAR
         mlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=33tTruwtHJUDsLE1NQEO6k6TPJwHdavbHWnexaTt8VY=;
        fh=7ezoOpH/5TGYzSnLOv04mKBqE+Jc0n+K0l3FYXTa3sU=;
        b=OstMiue/YppNNYPB/Fw/q57GKC6cjsxxO+VHxHqIboCXoqeuCcBEgF1IJeGSmzJ1oy
         nL+HVmzkq5T94AlVvtmpZhvM2eaW7C1PcOvj6YEoV5yJDmVF/xlj+2WQFY/uFmsoVvu/
         dtrtJDrjXwzJM9qhGJzPT3xKMU6bm3GJGOYHGnWXDI5letmldHiCZUNdAFm6MPgq5dug
         BJsk+NB2Z6p7XAshV7DujIOLalU83LfRKLUt2m3/lD5pJ8st6UpNBN7rlITS4GTvg99V
         XCZiyUO9KSYPKKsKox0b/9Mt51Gy5pWJOkmWTLgkXcamCatygnhK+rV3Z6QXvzLEAri/
         IEuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cc5ww3Cu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d143b01bsor1773669f8f.4.2025.06.23.05.18.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:18:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cc5ww3Cu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681138; x=1751285938; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33tTruwtHJUDsLE1NQEO6k6TPJwHdavbHWnexaTt8VY=;
        b=Cc5ww3CuvCQhQf7PV8TWImR+VaX+yjYwd0vMRE3OmNv0Ss4sAlnaYF5ka4jJ2lwsyD
         XXrmpldrAMNnhBF8WBqmPR/Z5yjyziRu5NRT7P/u2P0lYm6GKYcSGhP3/JMQmAYFqf3b
         o7CPA+FYouWa5w/ccG+avX8pVsnmgkh1wdgc/xTgu4axHyJqxdLVR4dErlShwFpNww1+
         1C4rqzW582tmBe2NUvJweqELeM5s48HcBkPT8ofvWQg7+3BPq8iVjvp6GciqsrX5oWtz
         wjJzVf2STk28aLXFt8HOHCXD3W7iJ+0aRVN3dzyHvQll/AiEuU9MEezYPu1T2Z1/SK4l
         O5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681138; x=1751285938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33tTruwtHJUDsLE1NQEO6k6TPJwHdavbHWnexaTt8VY=;
        b=galfgp2IieFxG0bl1YKOLhailk8KP2l/VQWHX5cXP5WSBjMIwUfhA6kytROslJLxul
         3dm3VtdKwKsXbr9eZHlPww4P+TgpFdfFFHuMqqH6x/Zh3IkTVW/r17zNjy7PHvGkENhH
         WWi+1FOXy5hBqkKlnp51LpuNzlyaXneo/AHgJu6yxxlS83wkGLBPAhu7nwkCSK6O8hLF
         2dUduaXUdCAzj/NAw2CJV5ItpBe0pmrt3k3iv9AvtJA6/Hp1/77ygK13yrKWya3UdHr+
         EaImoRLRx5ZXqjAJf9rdvGt8pOyMcpiYQXdt1UC29lj/xnHDM/SAn6WTEvhCzoceQkEq
         kVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfhrqDP+0e7Nz881q7sDi1MLxWakn0YKdL0A+ggxhrClbqI9iUk3sFsbAvWhqq2wkAtsOkKWE+TzP9qg==@linaro.org
X-Gm-Message-State: AOJu0YzRYI9kpOFF7ONB9AUigT2Xjtd3howGtN8ZtxQv66U7aKHW7GqU
	eXaD1wJLrIqThN7yshfUHaTGkQghHqFxOhAdwuDVDERFeSi1VKMX3gD24Uh4t+XqIlMEDw==
X-Gm-Gg: ASbGncsTZ29xyYhSq7R5ECRYZTA0tWkmGKSChZqMsX4Y2BVRYgTA5x4A7gD+V8LWMb9
	P4/ZEQGZpKvgJGc5shbccpWe1tZCbT4SHxA0/y+lhA6hmuhwi1aTYcKJoQdKl+XXnGxiV2r5D0h
	MgedF1CaK4n4+ygwAiTX+k7yLr5y/5rRD+cBuF9qZZbe+nBFFXxdF2h2GZI4OEchVc4wyKUjkbu
	jwQ/HW0dAEtUG8iyPhvDpsx2PW0h+F9NrrJh7Vz2N4j9nEVN/0/UZfw2XHr+q23q4O4VSa+BcDC
	YDjfh2OO7jnW0xQuMnw8/JgJc4D+1m6U3H43uk9/N/tA3CeyGqY6SXWUFuMn2eraIYqXGQ/AKs7
	QDNHG5k0ZqGlGszHAPxakQL+RjuauCPyqerMnjMIPxyfHLbI=
X-Google-Smtp-Source: AGHT+IEjVwbsAMNAS5by9E9W3i2mS1agngW0TG97TbFd4Y+XoqUdKx/v5toxL2DXWSaOw2EUWfZl2A==
X-Received: by 2002:a05:6000:471e:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3a6d12a9a5amr7627210f8f.26.1750681138080;
        Mon, 23 Jun 2025 05:18:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d118a1f2sm9166243f8f.83.2025.06.23.05.18.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:18:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/26] target/arm: Reduce arm_cpu_post_init() declaration scope
Date: Mon, 23 Jun 2025 14:18:21 +0200
Message-ID: <20250623121845.7214-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AOq0Bkal3hLe

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
