Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510238dyb;
        Mon, 23 Jun 2025 05:20:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZ6JncOLeY6UkUrCLk/EjQyxjpZiolepik+e5fEoRUTdIn2TO1Cc7+ZWV/5ZGxQAwZU5AmOl2t1l457Q==@linaro.org
X-Received: by 2002:a05:6000:178b:b0:3a5:2f23:3783 with SMTP id ffacd0b85a97d-3a6d12a3786mr9336233f8f.24.1750681240475;
        Mon, 23 Jun 2025 05:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681240; cv=none;
        d=google.com; s=arc-20240605;
        b=DxqSBF4Rf+YJKYbuqomOwsbH/dAxBVsEvMv0sFYEOeOVeWsOspPIoyNwTzu3QiIhbI
         8us9jH+ZT4l7WKHvL+aB5q50OGN2Uph76FHr2hoBip87yVRT//x0KcJs/kWe5D+T9l3z
         XCjmVz2IKUvcFtXiL42rw87OpI9UJ5JvaPS+Y7Iq1C91aeLhMon0TPyf3s+I41dwEUoR
         lw75V3nfUvV0VkMW0gt5knPavXKad1rq0LhwTNzDJuYLxL5VCaJGH2vNIAksW3Xpv2At
         qFWc5xkWt+dYlF6nVSTwaY/b4F1YgZ57rsQ6K0w7Kk8mvZi0zdXduLNHo4Ddb1yLma9c
         s+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xtQNZzACUXAAbylIZWuCAJaOBU6QlQnouJAN5jXvi6I=;
        fh=LgUNUj4bUv0Fztc7SXW5T057nOfVpw9HNn8e6tsAzl8=;
        b=GYHapMgRcFIvaN3dZHibkQc/FYr5M3Xc/ja3QTpD9c7UlZ7d1lYxZOxrCgHWPHBalf
         vLugKt9r5ZPmQRPX4z3xc1M9h8mZaZIVpe8sp8Bum9vp0zVezFw/qBduUyurZqjEUoVy
         7dsm/wVZhaE7aEjZaIUMyu+vJL13Yk5smcbTxD9XzihU/rhM+wCZsomEA72NJT/wpt/X
         gmky0rCRmgevH4QwuwlAbMoOahFXW8z8ulxvQ4OSeqyL2ugVZx4ALaguuzbbok3xeV+1
         LTYLga+t5LRHPFcD1wDeRIOQwbf3CiQMgWHwzlGsWSxkglXPqtFiyH2c3uV/0Pm8z91+
         FzeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sTpucovo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d9156638sor1231738f8f.8.2025.06.23.05.20.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sTpucovo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681240; x=1751286040; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtQNZzACUXAAbylIZWuCAJaOBU6QlQnouJAN5jXvi6I=;
        b=sTpucovolo2MXX9MYXQH+sUMzLOhFJ5BzkWubi4b+QSWiGQ68jF9+DKsfEDLnws0Dg
         CAoWVmSiN5ePNu3dHu4ndHdKl39fm1czyAJr+vjzUM/ePxIhBVZ4ThLWn5H4Zzu/eqL8
         +GpGajkx6MKJLd7W0exDQMR45vCwjWp/sgWA942a+4V9QFx7a5Ougp3sKd9KNrOYyq/v
         k3cnefZ2MJ5xdEXxjqd/xDTQF92Yjlj/g9XLATec0UKFrsPApcIfDs/Ayu8ITTCkiAXn
         WKlANeR6gABbHfIO9SZxQ8UjFfIk5aKbx5Y7TMjoAMFrXvMyeenP1Em4CFLaTVCrFIKK
         hEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681240; x=1751286040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtQNZzACUXAAbylIZWuCAJaOBU6QlQnouJAN5jXvi6I=;
        b=CIgdx9SXSukYuai74WqRD7N9J4cQ1YYKL2mOAqP3dBWb23UtDp8szwdiUWhxpJwpmi
         3sTDHP9H0o7rAoqYUnREIxJQBRbnCQhNgxaLRpIFKZI85a5Vn9HRcjClI3ca4CmQIb6T
         E/TjgwKxsjHMu9inl+/5Jdx7m3/z03Wcm4j4Jui8YRkpv7rRpmDwB1HAYzPYSqt/AHEc
         eZfsZjxQjnoo0vtVsZwifoJAoguhzgL1s7F3IPFq7ejke1dyw5LtPfp6KdwkmMxTWorQ
         8bU/ajmNyG4NCcy0uMXs2fzYj3bVhX5/SRINduEYsdE0InAqxnAewYexiFqoHw328IbS
         jMJw==
X-Forwarded-Encrypted: i=1; AJvYcCWT9xB0lVNh9BX7zZjJZ0jPppZK6qs/KZGx2W4mwTDNckP4FqyZLNV8OaGfX1OcL3+BO0v7Ayzik9TGWA==@linaro.org
X-Gm-Message-State: AOJu0Yxg9tkGG8B7lFGZnyPm+tKgJHMPwkw8ziYgWw70Zpzk381xVSZJ
	r2LyH+aMKIllML4U7hjvsCXZyTGjqvgek37ewZOUQjrj3MUf3JD+M83TgX0/s0lO48n37g==
X-Gm-Gg: ASbGncu8QzTPKINNWobt1J5FJqrGH0JH3mWN5ksYDcb4ond++cwtqtwmhA1n3VjngQB
	OMVwfHBM4xwi7ybt2LCvOUqSyp8r8/IycJkiR+o1lGY5HXkdJeNUoXlRRYMPebJgOKQv+H5jBwG
	zmNZ8k0hmTUGw4e4ev8YPQnHM5HuGF89EXE/0bPl0muBneoef7qbHpkyMHaS2inuZCBxmzjHv35
	HF5tl7s0yxunhNBNcJcukqQzIw52Wyl1Ujl9eM3pxt8iPsdPP1B186RIlF1aPB2orYqccXV/aV0
	CNOus2w9VsfxwB8wiDkZoeTemQMuivbjMiMzjuLRny/Nz4WoMN/XL63Kiyk0pxpEy3rgQhxcQ8l
	68M0w5YaJ3nY5U9SRci4jhmtSerOma1V8xcKh
X-Google-Smtp-Source: AGHT+IGloUAr04yva76gXPckxz6WSYPWq4wDXpDI9HHEpLc89a3rsZ2d9KIpm2RuC3BaoxLIlkYNIg==
X-Received: by 2002:a05:6000:230e:b0:3a4:ef48:23db with SMTP id ffacd0b85a97d-3a6d12f9af7mr10894746f8f.59.1750681239899;
        Mon, 23 Jun 2025 05:20:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f104f6sm9656927f8f.12.2025.06.23.05.20.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:39 -0700 (PDT)
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
Subject: [PATCH v3 22/26] tests/functional: Set sbsa-ref machine type in each test function
Date: Mon, 23 Jun 2025 14:18:41 +0200
Message-ID: <20250623121845.7214-23-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t4vfa6icz8eA

fetch_firmware() is only about fetching firmware.
Set the machine type and its default console in
test_sbsaref_edk2_firmware().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
---
 tests/functional/test_aarch64_sbsaref.py         | 5 +++--
 tests/functional/test_aarch64_sbsaref_alpine.py  | 3 ++-
 tests/functional/test_aarch64_sbsaref_freebsd.py | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
index e6a55aecfac..d3402f5080a 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -40,8 +40,6 @@ def fetch_firmware(test):
         with open(path, "ab+") as fd:
             fd.truncate(256 << 20)  # Expand volumes to 256MiB
 
-    test.set_machine('sbsa-ref')
-    test.vm.set_console()
     test.vm.add_args(
         "-drive", f"if=pflash,file={fs0_path},format=raw",
         "-drive", f"if=pflash,file={fs1_path},format=raw",
@@ -68,8 +66,11 @@ class Aarch64SbsarefMachine(QemuSystemTest):
 
     def test_sbsaref_edk2_firmware(self):
 
+        self.set_machine('sbsa-ref')
+
         fetch_firmware(self)
 
+        self.vm.set_console()
         self.vm.add_args('-cpu', 'cortex-a57')
         self.vm.launch()
 
diff --git a/tests/functional/test_aarch64_sbsaref_alpine.py b/tests/functional/test_aarch64_sbsaref_alpine.py
index 6108ec65a54..87769993831 100755
--- a/tests/functional/test_aarch64_sbsaref_alpine.py
+++ b/tests/functional/test_aarch64_sbsaref_alpine.py
@@ -26,8 +26,9 @@ class Aarch64SbsarefAlpine(QemuSystemTest):
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
     def boot_alpine_linux(self, cpu=None):
-        fetch_firmware(self)
+        self.set_machine('sbsa-ref')
 
+        fetch_firmware(self)
         iso_path = self.ASSET_ALPINE_ISO.fetch()
 
         self.vm.set_console()
diff --git a/tests/functional/test_aarch64_sbsaref_freebsd.py b/tests/functional/test_aarch64_sbsaref_freebsd.py
index 26dfc5878bb..3cddc082f3b 100755
--- a/tests/functional/test_aarch64_sbsaref_freebsd.py
+++ b/tests/functional/test_aarch64_sbsaref_freebsd.py
@@ -26,8 +26,9 @@ class Aarch64SbsarefFreeBSD(QemuSystemTest):
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
     def boot_freebsd14(self, cpu=None):
-        fetch_firmware(self)
+        self.set_machine('sbsa-ref')
 
+        fetch_firmware(self)
         img_path = self.ASSET_FREEBSD_ISO.fetch()
 
         self.vm.set_console()
-- 
2.49.0
