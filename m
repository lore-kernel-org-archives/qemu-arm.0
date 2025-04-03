Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4184972njd;
        Thu, 3 Apr 2025 08:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0lky5x2w1qNpv8bdFG4lC1BtkNwB68nZCnfmTvL6MEWNEdSnY9RbcyyJsU+NsRQ7sSrVasRws7HT9/w==@linaro.org
X-Received: by 2002:a05:600c:83cc:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-43db62b59d7mr176661635e9.25.1743693526472;
        Thu, 03 Apr 2025 08:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693526; cv=none;
        d=google.com; s=arc-20240605;
        b=S+8soZelY64AZxtDuHvJT6QyFxtOlgPlBPqALPPKr84WXirCnWPiDG3TgQNHhDIJzh
         8meWGzzLijFtcFbtfyRLnv+ERn6/PV/VaK8/2tOLRidMGQTkuceAKN6GjfSCUQrYNKvP
         O++xQ0C3NOyq1Jz30zGnsY3qhrdCEvrJJcIXNLWC25qsudt3LR+QQFBGSgPDAedYz9S/
         fmNdkXjJM2HXVkZyxdXB/I7HoXBExnCSKh5ruBLoGKp6FA8nS0bu3aSqDXuUYMzW73KW
         16wQsV89POT/FPgwVLy0K2Hj1j4f7mtdGvAjzNz61wHg4jtCHcDF3rChKFu+rHv8fY8H
         awPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=otH5kJZDaqXFqi3K0/tLZ6a2mur9OK5+mhfeGaUByik=;
        fh=qAhwkEYekow+nmOb8tDL4BCT05de6iSParFltqckwfQ=;
        b=MsmgU7/B7Dhgd6VIpAZTSN3pNWI0PdUTJx2gmC2IOFkd1TRj+xeBpSEfezjk3ywkwX
         QLiMwPurn15tW/fCvcc6lVThs8zxv8UliXpRM2K70dvEXO5ejXm4mtGRMuBjfE4CxaAe
         HJ0T3M4Ev/Z12IWGyJOeB3ZHFnh3XuTMHxfoVBTi0G/a11XfLuBq/cpLrZfyyG++uxwL
         qM4eEzMPfIrrENniqyxVr6Y1mzoRko0VEQrNzq+q32+hoJFmL929y3/aOx9FXylwmDwO
         Nsc73MTw23z3V/yj7gyA2Y4+7lxPVWGnGz60yx/hpITGZN3Rz1DVfoLh/YN//dVuQNZK
         jU3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmZ+Py6Y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c304a7c70sor590923f8f.8.2025.04.03.08.18.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmZ+Py6Y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693526; x=1744298326; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otH5kJZDaqXFqi3K0/tLZ6a2mur9OK5+mhfeGaUByik=;
        b=FmZ+Py6YIn0NYuyWCOQwCZJL+ZFMjrhQyG7UfAC0VyzwMMmTnxvoEzwcABhmqFhTTJ
         qmwN2v5ZXK3ztPH3wJmOonVT4JmsS2kFX9ApSP+hpvVPAVVZbqARWwHoHLGtv7YaYAkk
         JzakMSq/9FLK7DIyT1uF5fDy/6RHJYwIpaNCk7vpeRQ+1SVlAlxwSeqzflLjtibdMFsy
         OKNf9vfK9+jPEQAUkoVIEV/+hkItFEobCnjzg7bl/Ru5Pd5luizLettBEtIYkPU/z1zw
         0oYMRgOApiREmKa182JPMO+nOEMWa3CRbjRLm+Ze/e7YUb9cGRaeaWcp0ggGovXne0H8
         YjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693526; x=1744298326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otH5kJZDaqXFqi3K0/tLZ6a2mur9OK5+mhfeGaUByik=;
        b=Q3DUaU4OPDacmoW98uErYrfM0jp9Lw9OnRwYlD8rmrO0omlRVOAtfRWYgyOJgwA1rZ
         ExE/q2CxwLltAO3YdMEYPljBJ3Y97nobkGudyOrSoxReLvRwwSVXOjLCSiCu0X8SY3mA
         48vwBS2aOVkWm3pyvKszYVZvkv1JLmwxJRz6hjFL4+Y+DGa6dVxPGXQMXrtV/CNbulD5
         2fZTJm8NTKqV5Th6yPJbhqDc/OWQh9bSGPD/J8dQOb10+avlYnN6gUZJjBrCE/qVPnh3
         UHoAFpNB9AN2FpMIyaFNSPyYpgGdpkmpZqHDY0pwIrTaMebqu2uapuAiV3kGD4W8hzxX
         AzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoiePAZLl1iN5afyxBRcNmNcfKysRWQP8NQzqMRtqHgqmwhkzGDoyfj6TkYyDlHLxMplqIN0E+wzlCNQ==@linaro.org
X-Gm-Message-State: AOJu0YwKcRJcwEP9j71XDXfKrFecNHqfR8ro0zp2uRBhmie4FGA06Y4B
	lA1dyuSRKkSHQdepfFhfKEMywH+9/Zz5ADSJ+cMn4TLR9Juhn/RMwyD/ew/oOxXySQ==
X-Gm-Gg: ASbGnct+kBJhZGgws955ewTGdjFpfKIqy2VIFlfmwLoRssaSE4K/GrmCAkd7FGaK1Eh
	5QbnfoD9tlDLQtq6GiXRVkOzkauUy2wIwEuHkwfIT8zZAPMvndMVLQSqAIUnHZ1SbYVYwTulIx1
	0lPbiCwUxAFVmZ9Dlokv2S8a7m67xiYTqDkZssriqmAAC0TZR2lPobUHjjfitt9oJXFd5E0QHLQ
	SZDvfZP/Injm0yYR5/WbHBLaBn4BpKQv3LdtZQtjz/ZCIlXcBrocudM07IBeLrJV22vXRE/5sr6
	hsiAVB+Gvgu4iQmXH3er8bqT83OKJpruTxORsd+PizvpE3Tiz+bGTDCb6u88bU49yVGVKVACPAZ
	YCzxRcjaBNC9cr80wKD4=
X-Google-Smtp-Source: AGHT+IHoC2ABwdCihgWB9S8Qq/GhhLEkiEXJhNqBUtphXBgPIEXlYdIM/RzIDba7lPE6rjWOQxTheg==
X-Received: by 2002:a05:6000:250f:b0:39c:1f10:c736 with SMTP id ffacd0b85a97d-39c1f10c765mr13657417f8f.43.1743693525801;
        Thu, 03 Apr 2025 08:18:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a732asm2084187f8f.30.2025.04.03.08.18.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:18:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0 v2 02/14] tests/functional: Add a decorator for skipping tests on particular OS
Date: Thu,  3 Apr 2025 17:18:17 +0200
Message-ID: <20250403151829.44858-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0PyNhJVRFyLB

Since tests might be failing on some operating systems,
introduce the skipIfOperatingSystem() decorator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/qemu_test/__init__.py   |  2 +-
 tests/functional/qemu_test/decorators.py | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
index 45f7befa374..af41c2c6a22 100644
--- a/tests/functional/qemu_test/__init__.py
+++ b/tests/functional/qemu_test/__init__.py
@@ -15,6 +15,6 @@
 from .linuxkernel import LinuxKernelTest
 from .decorators import skipIfMissingCommands, skipIfNotMachine, \
     skipFlakyTest, skipUntrustedTest, skipBigDataTest, skipSlowTest, \
-    skipIfMissingImports
+    skipIfMissingImports, skipIfOperatingSystem
 from .archive import archive_extract
 from .uncompress import uncompress
diff --git a/tests/functional/qemu_test/decorators.py b/tests/functional/qemu_test/decorators.py
index 1651eb739a7..b6a1d41c55c 100644
--- a/tests/functional/qemu_test/decorators.py
+++ b/tests/functional/qemu_test/decorators.py
@@ -5,7 +5,7 @@
 import importlib
 import os
 import platform
-from unittest import skipUnless
+from unittest import skipIf, skipUnless
 
 from .cmd import which
 
@@ -26,6 +26,19 @@ def skipIfMissingCommands(*args):
     return skipUnless(has_cmds, 'required command(s) "%s" not installed' %
                                 ", ".join(args))
 
+'''
+Decorator to skip execution of a test if the current
+host operating system does not match one of the permitted
+ones.
+Example
+
+  @skipIfOperatingSystem("Linux", "Darwin")
+'''
+def skipIfOperatingSystem(*args):
+    return skipIf(platform.system() in args,
+                  'not running on one of the required OS(s) "%s"' %
+                  ", ".join(args))
+
 '''
 Decorator to skip execution of a test if the current
 host machine does not match one of the permitted
-- 
2.47.1
