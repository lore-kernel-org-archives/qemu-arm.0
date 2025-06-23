Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510039dyb;
        Mon, 23 Jun 2025 05:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGwtDYPXUBIUZ0tNR8fCG4YP/TjPC2x2htRjJEweHG/EFpPFVfm7JpGsiwY63DyzZE4M3OfAKZt9dByA==@linaro.org
X-Received: by 2002:a5d:5f4b:0:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a6d12c1848mr10458079f8f.16.1750681220341;
        Mon, 23 Jun 2025 05:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681220; cv=none;
        d=google.com; s=arc-20240605;
        b=izFsLYTqzoSy2BawMXALLPl7mnuFxzDJywJxRlYgD5J9k5wHoS4i07nMWIZg+QiOO4
         t4OPvwo+6Qr9YiT5Tbps0EkXObA/GvevcAKhwCcC2/GZ21NZDjSHV0+4JlL9puTbfZU7
         m6ULbBUJfgqDfTefvhvfe+Ol/t0YKsZd/nqLFBkqvgFyENxnEFo23OpF3kYr0+1jqsle
         UmFTHjMmGhIv8xiiYeV9FpuoTs6SG/K49uoH+qBNe1BZ3B08XUEgFlBtsqyZYYG4uZnc
         HTMaggrOP/tkBIIh5/b5rO7OHGki3ZRM4VQksg/Q87DRaYfmxvtrkb0WmSrx8ltYY4yz
         8Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CoTleeCUcvYndolgWSxVbjuEBw5fGt+mb1nmRFlbWPU=;
        fh=QFlTUXrNFIkDQ7be9wjXdBNKuk2GX8BkO9pp6UJZO3k=;
        b=RHOI23IFTXI805Mrf5MtF7vxWpN4SvJTaqZsP6x/CthKzKNjOaaXZ5OJwnHHkK2/UN
         WLs7ZbwFuhF9xjPgMmxENkGtuJQeO8QUbu4eCEaabz1hoELcPNmmFUxQdjPSa0600ZXp
         WGrL8UqkW77z1Jeg0sD1rgnonSTslvaI37WCVG+Mkv//17hjsH41gT/DBsb9wgTx3fcT
         uvmukYZ6l83ln6/pXPYfv7mq0Y5Q5B2wYhPVK4FnOJIdgegHxC15ECjAeG8F57FxUVwe
         PPOU+Qfvb3mfW0+55IiNk4tJ+5uXhk4gt4wJMmOxswriCPvuoAhE4mWtPQFUyNSTzyB/
         /FXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WemGmd9s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646db077sor27591115e9.4.2025.06.23.05.20.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WemGmd9s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681220; x=1751286020; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoTleeCUcvYndolgWSxVbjuEBw5fGt+mb1nmRFlbWPU=;
        b=WemGmd9sfSN45XoHMpqfVcIN96wBKk3kbTYSbJolAZCeGIInJjvqYGxwut9c96Uh0Q
         +XoGAPjR01bvSRfl/JS0a10VtTZ2efmrxCkxAY+q3KkWwEnmoiYgc0ptkJbm+bQQGyk/
         n4gHiEYVfZvze9GHzotkbEAaVgiQBteQKhyf3HTZPuS2eQXV7PLxGiP6l8RHdxYN4D8R
         +aqaoddBmwQ+KwneCQbdSr63YNJrXk99t89hUUsSi5TTy4FY8RkMtRWGemcEHLdlDgZB
         fJNZEBxrVOnU6hUHg6f04xAAhF45EwZ8WA/oczzLT5WECh2iIf6R3nmj0NeNPmsiR+FV
         D1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681220; x=1751286020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoTleeCUcvYndolgWSxVbjuEBw5fGt+mb1nmRFlbWPU=;
        b=qlMfvBaQ5b9u0rYU9iq2SB1kUhIp51o7ck5vf17o4TJjZ4JTzJPHIuAhb8TjH27rmp
         cnWmbgUy5yc9Lh54MgP1InUmqIZ18621eDMgYJYZnsciO75hpskXfL2imqsv66tl3701
         nJ7pzBNjKENGzKZDo6FclLo8RtR2SQcj+MvBXTfUygY2xoFaMwFZ6BuLAsQ/CCbP282J
         D34zM/nIxdQrUn1L1sNIP7wxzY7ysKuZRbw3p38d+/7DXuPwme28AOqWEW0705+ddurj
         39uYLWWZeNv+8ScHxBerIgCTRcTOAlqUhU5gvNa5iSRM40UfK76oqiJSv0W30PwbaAAV
         AM3A==
X-Forwarded-Encrypted: i=1; AJvYcCVSOzlNSNLhr9O5VnLwbhznPNJly6wlyAffDh9eEpaGcGsxtg6M0h44Kc+hBWeyOyOf7rUV+Y3qd8H++w==@linaro.org
X-Gm-Message-State: AOJu0Yx9K+YUdK4ih4BBG0Mzc8FIMhCBQEGGiF0WgyM5K0/0laaLY0JL
	dm3dq7cPCaIrAjmYPZi8ezOMKPkAneG8Su2I9J/dcgrPXTNexAXbEcRxudTT3ssabOW8JA==
X-Gm-Gg: ASbGnctbUuzDm5z2x0hF6jD0ZzKQTgAFzzKIWfNxHlboJ39u+e1xlr15weZ4xA1Zayp
	+3Y6Op0X0vWlyOMHRS3w+3GqkqMLJ1zvRkt/k+8RnE6BhYtxhF60yxU8FmvzWBpf615dnjKgoZ3
	dieT06R5ueNwEOgTUOp2YYFIHOgckgqUze/0r9EH3veu1yLZd9U1mzavaCeh+ndU/st0q32Kvo1
	lI8qaiR6uUcgrAR6+HIMxf+86OfTi71OjbKyueQI4w3c9HCn/QHhmLw+8UbXUakbNrtbkz7V8ET
	QGImSflfsY4tkLBONpjhZKNVeuBq0B43HV+/R5pi6boI0sMkPncQ36s0X57C69lHLvSTUyriLjQ
	fZjEga83j5qMmhjwo7yMrMp4D3J7wnRuEAoTsYhwzP68DC+w=
X-Google-Smtp-Source: AGHT+IFBHJwLkEEc6nlf5I87v2Hc8Cpzzh5zV8wh3kfSp+SDxvF8pOTvTMZ84BVKQcVmti0UNd5Jng==
X-Received: by 2002:a05:600c:a345:b0:453:58e8:a445 with SMTP id 5b1f17b1804b1-453654cb7bemr101468665e9.11.1750681219792;
        Mon, 23 Jun 2025 05:20:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647071f4sm109685435e9.34.2025.06.23.05.20.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:19 -0700 (PDT)
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
Subject: [PATCH v3 18/26] hw/arm/virt: Only require TCG || QTest to use TrustZone
Date: Mon, 23 Jun 2025 14:18:37 +0200
Message-ID: <20250623121845.7214-19-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TxQjpTUlwc/a

We only need TCG (or QTest) to use TrustZone, whether
KVM or HVF are used is not relevant.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99fde5836c9..b49d8579161 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2203,7 +2203,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
+    if (vms->secure && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
                      current_accel_name());
-- 
2.49.0
