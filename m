Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510375dyb;
        Mon, 23 Jun 2025 05:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKL8K0BLlyYBCYblKXi9Pjke7R73pZviqYqQ7FSZs+SeJEPY1+y0VBpGFHDP0Qr8o1md3NoMZoQkidxA==@linaro.org
X-Received: by 2002:a05:600c:a08b:b0:453:8f6:6383 with SMTP id 5b1f17b1804b1-453698fea31mr103873165e9.15.1750681255776;
        Mon, 23 Jun 2025 05:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681255; cv=none;
        d=google.com; s=arc-20240605;
        b=iNko30stCengABZUSdl6GUehBjvMYWDjF8Hx/aD/FDoaZYb1HSaBC5b5/lOp0pNtUn
         +h25JxRjtPQReAfELUmmxDVYJkuAhpwlr95wAx9SbjIa0INxPTUK6rgfMC4PJH+CTzu8
         kBpj8YIE84pxAhxKMZvN4zgX22V/OJX8v0VHjygu+Imb26Dtx51Dok9U54GEqLJn5MmA
         L+JoqfQ0ZsjbChXaXAUnqMkt9MfNMEoT1h26oqVHTgYOJSadnKy8EJqbZIKvmBnsYDJm
         nfiH6SQtHfOXD0JQhbWp1NV2XxC9x78HKEZAHJlq2PvCv/e29K/APODkvEjYuOn6t4Er
         +jPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uYUPy6c9pCrsEaCpnIHygEtzD7GwjrL4VzsD7TAXMX4=;
        fh=EfZASTM8NNT2dEJEQKsrzsTEu5j/Ou+g4v9TyEsMDP0=;
        b=PJPlSJ1puPghshGJHqYrznH2jThTQZJKolUWlf/Q9Cqys5yraInLUkb4u8NhYF+nv2
         bnILJAXh+vDAfE0tNgJy5JQJLuN6u8T40Mi933W9Dqa+wM70bOsmxlJbob7+PE+7AhMM
         AhzlD8MaOc+mduYOISW14j7WdqlV0usmiPyG3Ui+MdNQttDGOdESim8UPr/BRsYySgWa
         6sHSAKg8bwhkaw6JQqG9uLNxmqncsdKTCjM969ktNFGi5t5fBK04yElQf6kdlJK0Z9qF
         2reOpx/vB50sJjsc/Sk5vcRKTjLQqY/gNUh/6ur+GgrzEicaYHBBdo9Dqzo8OoxUtKZN
         FqYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYaw3wLc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4536a37f960sor12898975e9.4.2025.06.23.05.20.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYaw3wLc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681255; x=1751286055; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYUPy6c9pCrsEaCpnIHygEtzD7GwjrL4VzsD7TAXMX4=;
        b=hYaw3wLcHrc9LfG6qOhOwAe9SbaekiwYRvB+d7u/yHO3OkGhpR1786bkEJjJeGuw+l
         +j5NPRE7iy+XTWNeXuEXjWab16dZwLj4werPR1u3js/vA/1V7HMCkgYcfygrhyEDNJ0d
         RKxs+38A3KV9qRR6WHjtc2KGFrW+SfJ14q+MnEL3JuVMdAbyVgL6QrMuYulrSXGSs6Ty
         hMAaVoDb9aL6D73xWaaT9x5xLvMSV7KYjSVfxbu/m4hv8DpRNY9OMbSUKAQ2LYAuwatV
         AFnQIEDNiNzUA9jd5WUqLfc6Ekb1U83fgg2UoUMn4LIOjuHvaMrXj2kjM/JGNnK0HS0c
         rYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681255; x=1751286055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYUPy6c9pCrsEaCpnIHygEtzD7GwjrL4VzsD7TAXMX4=;
        b=A0E6nx+xL2/YWJPZz5YUbdHnpyzHZ5YipH9qfiFhthkzSrgqE4rrKwU5KIwZ+d1PI6
         ZGNNBtI9ZZlPoYdTP9eca+7aDofCmnYNj8Z6ujyK30PWxGS0dnLbF++DYKkpyA2payRk
         Z8PX4dLng1/+SbmujINGjvSMTtd40XEZUkMimanvYVNVHhTGKKWIgsnlumUXVsr6R1cI
         sa6HnX5PsMU/zw+EfNrAbZiBYpCvV120t69NVmG36yLm7cSVPVQvj1hw7U0GfRjYplKO
         0fs/Czmhk7zU2P07OdDd5QgCxGUzt2BsrJGw9pOTRX0NMloCuquWBGbchoxEHdmo5uIi
         R7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW8McfdqUXIvYvlgymU0EpUIGIax7/ROVGWqU7GWNrO3aPQv/fCJ3w6EvAQXRyLlOcLpWT5eSIFC85fNQ==@linaro.org
X-Gm-Message-State: AOJu0Yz9BoDNgjnU/3L4GIFGd5BW0PzkNrUKXwZ9JrcTXbDJ3NJ6pIay
	pOtLJ/h0rMiABLDVwCf+Nvf846DcUHn5s5YHvS8DHIqiNtHFex8XtgyRlRtd/BBAXtdJ9OTAVt/
	VzZAt7vA=
X-Gm-Gg: ASbGncsfBxjyIodOiEsZBnxsccfe//s2oKpO5h2VkQWf6yKL5nd3c2VDeIbw2r9heFd
	qIAh9nO9+2lODP+t08M4ME3YDlFjnfmbtrTzq00vQZjUW8g9E2aMKCLJcCk+oMMxAvc0nb+KhTt
	hOOqEbisP6xnLkxGxdl9keTulmSX5KtkK7Eps6qdWIlx4DMNz4/mpjGl1Gz+29iWSmo9hJEFKS3
	osTvWmPRZLRMnUatm1MSoQ5hS5ob7l1PpojVGuzBl/ISEQPNFSg+cd/w/XGBKIsL0xt5FTX4NP6
	zfol7kbNFjaUfr4Ijmbxf7MrMv+DyFmny9wqQ16DUXi2eFJWkgfbape/8kWX0x54WzpDgWatnIW
	lEZPUUfqBJaiI9jV3lHCaknMHW0/o/yEgMh19dGO+S6i00qU=
X-Google-Smtp-Source: AGHT+IGT6YWtiD9z6rC4lmVWjBSvzyqzKhJAfYphN1oZr29sjiHZbaoLUEt5rTgirbEWO1WecJkvgA==
X-Received: by 2002:a05:600c:4512:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-4536e0da765mr56200145e9.21.1750681255141;
        Mon, 23 Jun 2025 05:20:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e2036094sm2263838f8f.99.2025.06.23.05.20.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:54 -0700 (PDT)
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
Subject: [PATCH v3 25/26] tests/functional: Add hvf_available() helper
Date: Mon, 23 Jun 2025 14:18:44 +0200
Message-ID: <20250623121845.7214-26-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SdzsNqpIAC2v

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
