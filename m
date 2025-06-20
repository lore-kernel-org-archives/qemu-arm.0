Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878920njc;
        Fri, 20 Jun 2025 06:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJnxrvtirHevnamSA38ZmLyC1I8IKgIzPUqMbO7dmah0k6AkQogZvIfYD6ytuOT9hpYTLOah0V99aaig==@linaro.org
X-Received: by 2002:a05:6000:1883:b0:3a4:f918:9d4e with SMTP id ffacd0b85a97d-3a6d12e0c22mr2224126f8f.41.1750424962869;
        Fri, 20 Jun 2025 06:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424962; cv=none;
        d=google.com; s=arc-20240605;
        b=OfgZLEgDlSYEOelC4juPIhgwulTZNZgUpTL4pTo2++7Cd3wmXjMdvDR93GFebWQD3o
         tR4Vm/9XuA1dL5nGYeCVgzfK0xBG3cnscqDYvYK4SljoT0zuFuwXXRLzNYwCpd6DzblD
         JbkBaG+p0zXpmpd62uRfxvlZrBCgMBweWiwa8uHGibmIGqp1rKQEzFwK7rN20HKipevv
         zXqUvWUzWmZxpFzBdUcGIzJFjCuccnhybisUzqTEjwjRF8OjsuywbIEWrtoigEbrowXp
         AeeuWr167Fz7H6GrkMhQa+YA7F8EYxHs0gHP3y6lNkANE+ToYSWQ1Pf54404QBNrDzhQ
         Vg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V640ljTD2H/6yk77CGg8pqgiDQ7Rk/byXNy/qGehgeE=;
        fh=SX78HkADp3vhRNEIhj/Qcf0gDnJ6fp0I38KP1iFwCoM=;
        b=CKg1gZeuzn1ArLbV9ktB3mcKU0rcrPNc14w49ezRrGkwYzQOQ29oPRUGQvbUos2mE5
         8KjmCigI0A0kdd0ZC92Nqerz3dFGoVAeJGPoDx7GBKqfb+KcW3gSwCSf1YdgWiAJtuu5
         IyPWZISOXrzCPfe9Hl8a1Hxwsxr/DI2/iYXt//2hN79pvVd0hk0lp+FKu83NDUlKS2nP
         3R1EdL6tKhO9mOm6Z8QRkBNZtaRIcq7PP9se1w0RGND/z4O7Elwj8NjaJwyW9lZ0Ayv7
         PvdQd1R+xBfjl3a7AVlKhNwp0NIp/Dtqv8sJZEHSNpieDaa1I11/PDImkg8Q4NgjeJGF
         Dfdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqgYEGND;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d140f471sor523578f8f.6.2025.06.20.06.09.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqgYEGND;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424962; x=1751029762; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V640ljTD2H/6yk77CGg8pqgiDQ7Rk/byXNy/qGehgeE=;
        b=IqgYEGNDeHzBPsUejDXBHcfsBkQee9rZQ4T9/VeGPCysYnhbf4rRUGWV5JKAAFZcJi
         qxrWDuACAgwHwyBcf6CWt4qq48veUyrtIs+73i6bOhBo7i1BwUHCXtpjdk7qXTXwy/+t
         OYFQwgG5Dk8k4ueP+LEtk5vO6jJjgCfwae5Z0Xa4P2gM4VfEhmWecI/GZ3KCOkVSNbJm
         CHbnd4R99yfta4LiwtBhmX+Zh7UsHkLO2F2hC+cyJt2TBOI/gdMD4f5rhRAcIhx2qukV
         zH0bSa3zOjFXfP/yMK4D5qf8UPcT1ju6Dc+R81HQXz2iZE1teO10NHt2nAtdjG95fJNx
         urLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424962; x=1751029762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V640ljTD2H/6yk77CGg8pqgiDQ7Rk/byXNy/qGehgeE=;
        b=Ew6h2OeYDXE4JSPev7cN8x0r+EIhAKgC2Oph00N8Qt1OwdMiGvl+wjLtN01VNeOncH
         aFej0zbkjEN7i0rkpUURUFmpks8XH1OrVvYjFqshvmzZdZVIp3X3SZZ6QtfDCCz5nDUB
         vzqE8tUard4C9uPQ1El6gwnvc28pITvZ4E6SEYfx0kFH9FvwCExceOhFMr/2YabWFQwT
         fRW1FQ2Jmjxj/YmgSI1+Zg04JS2h7pRy//F17jRkuBM+zlKEXQjhfC79RMO4yuhdoJ+Y
         X3XNHWrnUuIsRqY7ULlm4CkMGYkgcvSSY27WTPx7DwaHXO7s/57r3vTPee2YJ0eaY5I8
         VDJg==
X-Forwarded-Encrypted: i=1; AJvYcCWLRrYFze+cQ4qFXCKLsLwOPJUVox9LPBhL0B8gKz9/crggMqko3XWgf/t1I9CCwKJwEF6c80j0ezTrnQ==@linaro.org
X-Gm-Message-State: AOJu0YzNdqo3IctbRpIbLenVSgTHT5/p58j/I6+JoLxMOKTxquyd8ACC
	FAaiBmRto2muk7fAT1PaZT5ibvnLnWFtrb7/rXQd8JW3jX1vQ4hduNFQX5tIv7fcIbrmYBJb6eA
	CzmO5XL4OaQ==
X-Gm-Gg: ASbGnctNy7dfNVi1khh0K0RD8AZipQc+lrDyRilGkLMHi6IpuaE5KZidjUl8UmdqiGo
	G5vKpi9T0hjsUxNe5hNW6rDoFEiSQC6eq62RUpGl3Xt/RP1xJHoZATk3e0CywNZusBXhUpW6Vxd
	0DZwH3/yaAZd5Mypt6uQDBJu9kO24UTE/DWs7zvpHkhHQxwbTgIscWL9hhovqLzY+aoGo/4HsgG
	IGHczP4Mf7YKkURBAtXjuHBGbKYRo1TniQdLdSZnLthsBx2D+eucUMzz2LRZFwJzmf+l0HHIkF9
	YKZzI9XqrmPOxOEz5o9zvdWdR9Koy5Tp2dOMzAyEu4nMcnX544y/kEkLwF88/VSwK61JZftYmY7
	pADqGnUGkwdo/LDtevRXCo51RvNg6yxqzmneZ
X-Google-Smtp-Source: AGHT+IGgGpF8T6F/eU2syTxh0rLMvaVCXrLMi432W+jy74ylNB4a4nTNwHJAEpagSMq8fk2NTIgxGQ==
X-Received: by 2002:a05:6000:65a:b0:3a6:d579:b78e with SMTP id ffacd0b85a97d-3a6d579b7f8mr393678f8f.46.1750424962155;
        Fri, 20 Jun 2025 06:09:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc66fsm24808055e9.18.2025.06.20.06.09.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:21 -0700 (PDT)
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
Subject: [PATCH v2 23/26] tests/functional: Restrict nexted Aarch64 Xen test to TCG
Date: Fri, 20 Jun 2025 15:07:06 +0200
Message-ID: <20250620130709.31073-24-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9lhUo3GpItPD

On macOS this test fails:

  qemu-system-aarch64: mach-virt: HVF does not support providing Virtualization extensions to the guest CPU

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_xen.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/test_aarch64_xen.py
index 339904221b0..261d796540d 100755
--- a/tests/functional/test_aarch64_xen.py
+++ b/tests/functional/test_aarch64_xen.py
@@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
         """
         Launch Xen with a dom0 guest kernel
         """
+        self.require_accelerator("tcg") # virtualization=on
         self.set_machine('virt')
         self.cpu = "cortex-a57"
         self.kernel_path = self.ASSET_KERNEL.fetch()
-- 
2.49.0
