Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp879072njc;
        Fri, 20 Jun 2025 06:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXP17lzkr/YRW/x0/7m3TMg3+QuQgwfN3bAMIfkUOxzRBSh5OqwNmaerEKEe4dxU3gh5lY6V+H9PE4ldA==@linaro.org
X-Received: by 2002:a05:6000:1888:b0:3a5:8600:7cff with SMTP id ffacd0b85a97d-3a6d12fb1f9mr2359623f8f.1.1750424975081;
        Fri, 20 Jun 2025 06:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424975; cv=none;
        d=google.com; s=arc-20240605;
        b=Ga2HT2yTBE5rsuBWBUXvh8+BunqkbxtUvM+9PJWhnqt4PFyc1Rcl+SVt19IiUPiDHK
         7rFREW4+wdq50gPlYl4chaFkz9Rtp8+vrppCRUd4ToZR4Gbg5jlqcV8t86l0hNafvTlK
         9tVQ0oAzDLVDZOpdaS7jUN4+AHsDjM5tTnFoQ715KNAWuu9/j3YbHWDbkpdXFUCTOJSg
         KoXDDAhnfMvo1y+9WuAjqAKVwZdiEqgDyLoDYzfEgoEJqHOz79/HAJiL19/PFKX1yUgO
         TaAWtMRjqXuG9pOOvfM6RqnqotmkB15koH4WspJG1qU7rCNCWCKjapAu5bLB+wVZgI4s
         uB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ML487RZEtX6RDPbX3JUchrWHyom2/STG3MUfjQAASi4=;
        fh=PcaXBtU0SCDnT8OK/BCZJRJ9HzKEC3YG5oztVtnf3c8=;
        b=jP979ZiJCpr09D0e9oUQUx+wP1GrNH0pzlRvuO56G3CajOgC/518r7rZYp3kL5q7LJ
         DNkah0TRW0GHnCRSAri/WWURzd0SLVULBQLMO30Xm3DMQ7IOGLWImUQf4OL45H0n6h/y
         c9NNhvDIXAwQi8mMIJ8Ds1frANt2YDy2krWeXGvrNSgbq7aAIa4p7QTDRY3KncSM0CR3
         ux5hl9vtM9VWi5xyZpvTcoHu+OWBWyskN5TGQlAGL5dvIiCsBhgdD9OhMAyXs587Rihv
         uxjRHcT27o3cABDdcExsbLa04fnVU8qKdh/psqqgf+PqzDnob3CQmh2H82Fgw/lC57I2
         OxwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1T+fWHg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453662e16f4sor2713995e9.5.2025.06.20.06.09.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n1T+fWHg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424974; x=1751029774; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML487RZEtX6RDPbX3JUchrWHyom2/STG3MUfjQAASi4=;
        b=n1T+fWHgGPKq5agH1PwkNTlmu0v4HpuxTb1qAN2gQYwpUoyL3uesORT7C0nswz2V7O
         cocVPusSAO5jkJtPslcRHpfM2tJi/p3yAo+XyHeEnm3cTqBmD3oJ3M/OM8tcb/fylH7e
         lkW6+uY9CcNLSolVHMHR+525l9Wx5M0ELg/csANVZGF3nnzumKV60MysMGAeFm6SWT9h
         Z3DpmzqldfbkR04768x7zLhzwlxy4APaqKmBvzJzGMRVPn1qUFP2KzK1Q9UBleK3eCGT
         qdLKUtBUMsQYx08FYCxh/VoYYgViOi2RiVWrVY10tv+7FRS45PiXqmz0FREqkQ13NZir
         Va/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424974; x=1751029774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML487RZEtX6RDPbX3JUchrWHyom2/STG3MUfjQAASi4=;
        b=LaACbaNS8knrEo67Lob1A2+eW3YqUx4/WBdarrjmyRQibu9l5x/zgIgsv4cQXkoptw
         PLmPpdBmToa2l7mpHWPINZWMlgz2SVrA2CQtxHldcnuIIyho0haAFJuzUcRTaIpH0lTq
         jcXxgcUGrdj82IBiprJTevU3Xa9pugd8NMIl07I+3/aa3eRb/HIjieD3qfJ9Q0fDNVq0
         OCFCv7fdarkd1rKn3A+N84hvCknukbPB4yZjaqBoWtzYULAFjNPQUamS73jBECrVDoUx
         4Z1Pdgb+rYVjbUCphGC+HAUcbRg/5av3f1kXF4PhezkuMYVzq7N/mWvTVVCFpqCdkiyo
         ybuA==
X-Forwarded-Encrypted: i=1; AJvYcCWkbXWQuC+O0/Uerpa6tJGet0tFKQovjTQ2E3rZC3kwOzK3M6ISxw3CT0AbzJ4x06NdLFFutActxtJegw==@linaro.org
X-Gm-Message-State: AOJu0Yx+ImChcD7klU8B0orOfDv3qj6gc4kcIp90/QPITJuED+RQAdDe
	gJX+wW6/7ipoL+N6J1tCNUHbdeYYm9XIiF12IkXw8p7IOzxD8JHDj9lfxCHJ+s69lXP0og==
X-Gm-Gg: ASbGncvP5IovMWhmK36kIh0H1TM9YVgPcTzB6c8GTSleaxVaaxfoFGJKVpWnwWbG2Mp
	o8qTx/icr5dnJFC0YWqfx0ddaGmXr4fAbE3aXHCxIrDTBvijS6TSr2lsdGdjppvsVjLzczBncn/
	6RE1gui/3bXkhXNxH5jKospkmgJtDT1p7QcU97RiH0XdctXJS7ZRVBYBwKazDOQ8KdsUXMOtRJQ
	z/tam0Gj7kZn8gBkUhfqlfyLCGdyX0c0ZvGhqrHoeVRYfTRQEn1PtcuQYT/dGEpgdfLmU9BGbqH
	FDAlU1tJFXzvDiCGuC92afmcbxbabUFCBwzOge88oHoMBSrNCfuNjgGRuFZIQFvf5i+csojigu6
	HPU1bPDei11SCoGFNH3BuLpgkeFhU9mrh6JEF
X-Google-Smtp-Source: AGHT+IFoaiSq8p/vZ15JMywutihLdhiyx/4+KTYgXl1gSeqr94tnRyEi672b3w+H0TV5kZSUiEuYRg==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr24577215e9.27.1750424974566;
        Fri, 20 Jun 2025 06:09:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45359a09ee6sm38434125e9.1.2025.06.20.06.09.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:34 -0700 (PDT)
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
Subject: [PATCH v2 25/26] tests/functional: Add hvf_available() helper
Date: Fri, 20 Jun 2025 15:07:08 +0200
Message-ID: <20250620130709.31073-26-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Zp5bvM4BFUVu

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 python/qemu/utils/__init__.py          | 2 +-
 python/qemu/utils/accel.py             | 8 ++++++++
 tests/functional/qemu_test/testcase.py | 6 ++++--
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index 017cfdcda75..d2fe5db223c 100644
--- a/python/qemu/utils/__init__.py
+++ b/python/qemu/utils/__init__.py
@@ -23,7 +23,7 @@
 from typing import Optional
 
 # pylint: disable=import-error
-from .accel import kvm_available, list_accel, tcg_available
+from .accel import hvf_available, kvm_available, list_accel, tcg_available
 
 
 __all__ = (
diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
index 386ff640ca8..376d1e30005 100644
--- a/python/qemu/utils/accel.py
+++ b/python/qemu/utils/accel.py
@@ -82,3 +82,11 @@ def tcg_available(qemu_bin: str) -> bool:
     @param qemu_bin (str): path to the QEMU binary
     """
     return 'tcg' in list_accel(qemu_bin)
+
+def hvf_available(qemu_bin: str) -> bool:
+    """
+    Check if HVF is available.
+
+    @param qemu_bin (str): path to the QEMU binary
+    """
+    return 'hvf' in list_accel(qemu_bin)
diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index 50c401b8c3c..2082c6fce43 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -23,7 +23,7 @@
 import uuid
 
 from qemu.machine import QEMUMachine
-from qemu.utils import kvm_available, tcg_available
+from qemu.utils import hvf_available, kvm_available, tcg_available
 
 from .archive import archive_extract
 from .asset import Asset
@@ -317,7 +317,9 @@ def require_accelerator(self, accelerator):
         :type accelerator: str
         """
         checker = {'tcg': tcg_available,
-                   'kvm': kvm_available}.get(accelerator)
+                   'kvm': kvm_available,
+                   'hvf': hvf_available,
+                  }.get(accelerator)
         if checker is None:
             self.skipTest("Don't know how to check for the presence "
                           "of accelerator %s" % accelerator)
-- 
2.49.0
