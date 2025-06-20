Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877125njc;
        Fri, 20 Jun 2025 06:07:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVASzPcrPjVaLdgPM5oyeXEzvjdVEX40NKyB4UAPBviPTcbJ1Edx1A4TlG62fgREpYFeTwtg0GW/VQE7A==@linaro.org
X-Received: by 2002:a5d:584d:0:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3a6d1322b83mr2130097f8f.29.1750424838756;
        Fri, 20 Jun 2025 06:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424838; cv=none;
        d=google.com; s=arc-20240605;
        b=N4tuy02cxMITqIy9BBmEFE6VK98/4VLZ1QXYwMyaJAEpcIGuYBjHZXOtYOpVbIyw+x
         /JSnefy/iG3q139GXV4Jg0TZ/tqxo/hRncCVQQPG5T1Vtol/zknJR/dcnA/lIjfEl5kS
         sNLfUuhcGVyt5E3S+odryTF6qjzX1e0mlg47pO1DXsWjQ7si587O6PatHzm/jO6x64JW
         IQYa7oRqPBUgWrA65F1KOXt5KhihtQA1/7WCjVGrcUYbP1Gox4HKvq4RKu+3/BPTuoX+
         NuYuL52/elpYIrFTG/dq53tu9KXeKrdNCtTdUxqcB98Bzu3wuf8/sQ3ZFlWyrXwaplQW
         VRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tBZvBlUJJ4ZZzRhwp1RRYC3txHSba+iTcUIOSqbdq4E=;
        fh=VV2wmcqgpuDwVOS8yQXgh0X3HByAqQY6cdxd4AsjbW4=;
        b=N9NY3b5OOV+Ni7jY/gBi9hHdvz4eW6cIbDGU7jtr1X6TrVzI0zQxK+4xN1HEuF0SLL
         wnUGhcSOztDDUwwpPnrYm4MiMYICte4DKoUCKOSAjXekBXZzUsaVHxsZy1z0x9m+YTPM
         3s5EZEBaxbp9f3GBan7Ooa0PKPCzHZwmZE5bnTELk3kcFnmZ7gfmnSYAMFFC5CSDIFVa
         65qXYVkVqtXiqwQwlTWpJ31Y7a6uoXHxjxc1Jrc+Y0aqIR9KomNw5JBswRrSoCcPz5Kr
         vuf0B9weZczCA+tCFrvJn839mn/cGk/988+Mme1Z6lX3rbVnQPaOY2R3eP6N8RP8IpFv
         IHIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bP0a9xFS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d0f0fbe1sor442283f8f.1.2025.06.20.06.07.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bP0a9xFS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424838; x=1751029638; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBZvBlUJJ4ZZzRhwp1RRYC3txHSba+iTcUIOSqbdq4E=;
        b=bP0a9xFSqfhhX5r2wm1eiHuNk7j50KHttaFrOFESlwM24WbqEEdeE8ceLuKauuG3a5
         sqgHVQHyPMhdJforDI1k0Rc537ohUYe6lyHGuNZUepzaKvUMhtrz1rSjyx5WweieAY3F
         JIsuPRfhC32qKFsgZ0pCLlYyq3Y55Sz8o5Io6DPqrTwsx8yT/gEkaiyZxgswmmg54pBx
         1Y55IBudhKOsYGCuT49Tq0m+Oi56vgCz6Uq8e/jml2vTAr7HW6DkcitdQd4830EKSf+f
         bLMKap/dYJfIFIXl+H/FHi1tboYmFlcJ3IRge/nhFYXfQlmdurdnbBitKS+LPVqieCra
         WC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424838; x=1751029638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBZvBlUJJ4ZZzRhwp1RRYC3txHSba+iTcUIOSqbdq4E=;
        b=CUkTA6u4OZUei41UkKeZXYE7BqTrlMICxpM/KDnBr4lRtmaLj9fWRYFTedJhWbcHJH
         /U20HRC0wy2h4C3KGTCNm33QAo+ryxu9ZTr+bNza334ccrm/iEfMDwEoHL6peALUHhCV
         Gd7Pwk1pUVeJNngAZl9CqJb4rzR+69Pb4OaBIfQE3BEy1C1BqP5W/XK50kUpob1N44sy
         38SWCAF9KzUVTg5wJ74DO2mmaOF8xVnzEiEDjD8ffr63SmoVyrZo9vA6A5wS/CanD4rP
         F46bCnEJ0tIJvkqrHJhLXusLaIkzYHLmc2XUFwiD+I9BHwjNvencFqUQKFYfVLyzICdr
         s0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd2QaCZLhPh9vXiyg2nFkwOm81GMAuc1TCBrhzMQbidxW0iycK0ohE8GrOz4FU2JdcYzJx8oowDuKJaQ==@linaro.org
X-Gm-Message-State: AOJu0YxOvIu+kMh01icuhoRVHLbI/XLhq9GiVm5lBA/vYB0smRlfbphd
	DIc42R174hGND1yTmT+OEf/GLNRWKE67qBLn7peiAxIw+wnJhEsByfCpxXeV1uiCmPmv7Q==
X-Gm-Gg: ASbGncveYSSlWBBRQCAeCtPnY+K6dNTRp3p0MaDl70zDH855ZI1K22RFtoIk8Eg0hsS
	8YC0oCPehqQgYVi3NT3dLS2GZjWvY/FMfPYlIoUax0Kx+z1S5Gh2sNJpj4jnGiqcBNLwEcFycJ5
	qIFOnGKN0BZSBwCL99f/rWy4pkpTX9fxlgcmSFysPbm+dlQtzxs8NWz/YUVH0XMctOUZMh6TB3M
	fFiM/8pa3Fr068YXf/xOvzPRpFYbVlotQvmCk9VHhDOLely+4Q7nPoruZUE8ijJJtHYGgnauTPm
	v0TFOjNzpWpbQRVmhEEREYpAgwVOwdeHxwsFTp1keXY8fHY2FqL/LTGwc1xVkyX3Lcyh7r4fBZY
	qxeklRbQ+BCyJJkek5eTysK+IUc6PUBDA/8MT
X-Google-Smtp-Source: AGHT+IHkCPt6KL3uT84KaXQEf8w6Zl9aLccw1KatAjKZiNkbl+svh0rrY7kI5cIzTp13dZSGCGViFw==
X-Received: by 2002:a5d:5e09:0:b0:3a5:39a8:6615 with SMTP id ffacd0b85a97d-3a6d12fb239mr2292246f8f.11.1750424838047;
        Fri, 20 Jun 2025 06:07:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm25426765e9.2.2025.06.20.06.07.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:17 -0700 (PDT)
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
Subject: [PATCH v2 01/26] target/arm: Remove arm_handle_psci_call() stub
Date: Fri, 20 Jun 2025 15:06:44 +0200
Message-ID: <20250620130709.31073-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5QQBJ8wSmhme

Since commit 0c1aaa66c24 ("target/arm: wrap psci call with
tcg_enabled") the arm_handle_psci_call() call is elided
when TCG is disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3360de9150f..5ed25d33208 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -650,16 +650,12 @@ static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
     return false;
 }
-static inline void arm_handle_psci_call(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
 #else
 /* Return true if the r0/x0 value indicates that this SMC/HVC is a PSCI call. */
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
+#endif
 /* Actually handle a PSCI call */
 void arm_handle_psci_call(ARMCPU *cpu);
-#endif
 
 /**
  * arm_clear_exclusive: clear the exclusive monitor
-- 
2.49.0
