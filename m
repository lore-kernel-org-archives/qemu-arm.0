Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877762njc;
        Fri, 20 Jun 2025 06:08:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2iNnj6jnFo5RdPWLUhua36UCguQ+ddre4ESfbI8G7QxoyghwtnY8bnIOKYpjxeN8EwvDFvydnueH9LA==@linaro.org
X-Received: by 2002:a05:6000:98b:b0:3a4:e5ea:1ac0 with SMTP id ffacd0b85a97d-3a6d1192656mr2037980f8f.5.1750424882723;
        Fri, 20 Jun 2025 06:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424882; cv=none;
        d=google.com; s=arc-20240605;
        b=hblSCA46RZKKkm0W1FNT9b60RrDRWL81/T9xF3eaB34VoJ3/wMdejb6Pew9tsUUr2Q
         TRvmAS87Qh36MIj/kP0/elgFriq0E/gD6+DVXUQNcfxKaBo3QEJrv3ZGEk9kg9rl2hX3
         xQ1dRdAh6BTDRZk97+0C3qQ6eQ+VYTkHTyTfpsRUOfcnkmv7eSJlr29cjGKRzi0BBAW+
         gFUcvR5d8TysSTnkXkBqgNfQlfxquvWGG30wtotiyU2MC2ZfzBaygx0hcagUuxisB/Vz
         z9NHBdDg3LdzJk1zeHanRDV5F/beecwjXQhIXFsoLYgOSnfHM9P5MeWEy/ICWv4LHHh0
         7Ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DHkUxhiwznLnPGQ7CmoJiivDkUiQkmNfBetsY13UZBg=;
        fh=WK7t8q/IXghH/vt3lojkMXHatvM7Fe4KMA6JpbJjjTc=;
        b=XKqLU/nUH3blCOY8oJ0KEVGhg2XqEkC+A3fFBKMX5PJkz79EbfsgG+hB3+9vHYpJin
         fkGYoPVDsSUupTBzTXXNkAHQlZEgoWhAa0z35pJpr6OOA6ZCxGws6WMqJz2jA0ef0Y1Z
         TQZpcSlpsZ9u0MzmQQwnz9QR3cqk1kx1KlhF55KCU2Q2QpqB3U9cOugCojW/aw28+hvi
         8vJdPPS8JRqWxD1TsZgQW2IZeziDCdaWqv1plZUNPrDQSgx6pS4xafrgnCDpN5supD1A
         6ugNlo2DFlTICICZtykDGJseA1PJ7XWojGOXnWqYqZIN9Bmd6IzeT2jlpNtJ1UfWAiHu
         Bk8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YOBhD+9/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45365a3c338sor5605285e9.9.2025.06.20.06.08.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YOBhD+9/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424882; x=1751029682; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHkUxhiwznLnPGQ7CmoJiivDkUiQkmNfBetsY13UZBg=;
        b=YOBhD+9/txGqPbRsnuigCNRMp2zcmWvLVdCLFEn8gTfb0utS/Ve+wubwsmaiepnVra
         iTueV0XhzxGfEpv9QNvkSzRtMCeWn80LUQbiLCXy82ziigrQCEN8hFAE18CwADxyMaST
         iOKARfX9TbJZrh48dEhuvzOsD3cjdrFRYDslXvBg/KC2sIVhfTB83/okE8nTUNUZ9kQl
         sNooMU/OLnPhw64KwDsyWJ6dvJLa/y60yFp7fsNwhqYntVLsNGNwYsbW57jbfDu7/XrD
         tySZFebIpijiJOmxTdC5UlMAu05RZaw6sk5lztcxS7uX2dZb/bsfx2FZme9Ixsrx1p34
         l10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424882; x=1751029682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHkUxhiwznLnPGQ7CmoJiivDkUiQkmNfBetsY13UZBg=;
        b=V0tHDnDPsYqh5FNh8uyvf2aLi7Ghv4aFXMIW+k/4d9kmGcGn/fvwV0TapsTVmCdVqW
         aMvSAniYP3V5Zr+xGBhw/kU2aQpHJuHbHrNPyNZAeANb2NPbiYuT9CaiWpMocjPaI5eW
         9SRejAM0lFeYdc9ERbTml2YOZr8zp+eJrd3XreSwhOg+uUhyiI4CqrDnR8V0k+x7FBB2
         fBgt4no5bNiFbLOC0K9fny/ZOCHej8R/CYnuggVgSysliR3zQQs2bPMYZicU+AKV0nTj
         NLNojTPHR6g4ZuD+aOTTKGRMDPwujrDitcZD90mmaSBXcgSz0/w9+B90ha6iRmf6miWF
         ppkw==
X-Forwarded-Encrypted: i=1; AJvYcCWYbslTANpq5FkorwQ1cEiubGeoQ8qE4qj+45wT9ZkyO5AaWMvGpYNNLo80R+UEWa42SGAJPloxvLWoLQ==@linaro.org
X-Gm-Message-State: AOJu0Yzw69CRH2LZ46pwQtltcavQ2GQDsPXSb47HXxE/dFhdvqED6UKJ
	Hhm6HjHbRNF5aQKJ0tGzs+u4Rlgt6ALdkFxpSm4CD9M0aulLYdkIEyRnHDQvI0NW0JeYxQ==
X-Gm-Gg: ASbGncsa07QUAJ44lqz0InnanweNEL99giVk5R5VvL5HYDpq/rRsmbgOnmEORpx1QdA
	iY36jDXNOcc4ivGooY8GlcSXIuLzLRChgx1KwwNpk1g2rc3iTCbd6xFscTA02UBWXpa8dkytz6m
	7bdrB/sBxbhTqE5zq1phFrruGWE9xkIgRJN3xF2xGucEAtT4gBzWNbZIjJf1MKTUKE4IYJcdo5n
	ne9bZy3QaNh6MNpUm1L+BjCaoFe1mynWd6LLS6Gf8X88jdY3x/rlpiwHY17/DIcYRz1AfTqK78F
	NbzU1XeJMGKApxynrYb8KVy9LzVDGItmfqdR5sgsqQr5mQlv3i2ySr/3tbGWQRSXg31Lhfy/WDq
	t8r0DQqSVzEx8XYY/13jexE5tW8cw7DXdlkGp
X-Google-Smtp-Source: AGHT+IFIRA+QgEzXaz5Kv5aRlxYuLkZKTx/pYgPZDxWBgIRvFsRGsi3xvxXp90rTSlKsbLeeXas7Hg==
X-Received: by 2002:a05:600c:3acf:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-453655c3d4fmr28644125e9.15.1750424882015;
        Fri, 20 Jun 2025 06:08:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b66asm57984935e9.17.2025.06.20.06.08.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:01 -0700 (PDT)
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
Subject: [PATCH v2 09/26] target/arm: Correct KVM & HVF dtb_compatible value
Date: Fri, 20 Jun 2025 15:06:52 +0200
Message-ID: <20250620130709.31073-10-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S/Srg2jBKIpZ

Linux kernel knows how to parse "arm,armv8", not "arm,arm-v8".

See arch/arm64/boot/dts/foundation-v8.dts:

  https://github.com/torvalds/linux/commit/90556ca1ebdd

Fixes: 26861c7ce06 ("target-arm: Add minimal KVM AArch64 support")
Fixes: 585df85efea ("hvf: arm: Implement -cpu host")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 2 +-
 target/arm/kvm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d4c58516e8b..bf59b17dcb9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -879,7 +879,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_exit_t *exit;
     int i;
 
-    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->dtb_compatible = "arm,armv8";
     ahcf->features = (1ULL << ARM_FEATURE_V8) |
                      (1ULL << ARM_FEATURE_NEON) |
                      (1ULL << ARM_FEATURE_AARCH64) |
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 74fda8b8090..9a1b031556a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -266,7 +266,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     ahcf->target = init.target;
-    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->dtb_compatible = "arm,armv8";
 
     err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
                          ARM64_SYS_REG(3, 0, 0, 4, 0));
-- 
2.49.0
