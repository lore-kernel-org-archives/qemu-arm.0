Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba316dc67sm530082666b.43.2025.02.19.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:00:09 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1DFFB5F760;
	Wed, 19 Feb 2025 15:00:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] testing/next (aarch64 virt gpu tests)
Date: Wed, 19 Feb 2025 15:00:05 +0000
Message-Id: <20250219150009.1662688-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: mn9CvmMwIIoe

Hi,

As I was looking at the native context patches I realised our existing
GPU testing is a little sparse. I took the opportunity to split the
test from the main virt test and then extend it to exercise the 3
current display modes (virgl, virgl+blobs, vulkan).

I've added some additional validation to ensure we have the devices we
expect before we start. It doesn't currently address the reported
clang issues but hopefully it will help narrow down what fails and
what works.

Once I've built some new buildroot images I'll re-spin with a while
bunch of additional test binaries available.

Alex.

Alex Bennée (4):
  tests/functional: move aarch64 GPU test into own file
  tests/functional: factor out common code in gpu test
  tests/functional: ensure we have a GPU device for tests
  tests/functional: expand tests to cover virgl

 tests/functional/meson.build              |   2 +
 tests/functional/test_aarch64_virt.py     |  71 -------------
 tests/functional/test_aarch64_virt_gpu.py | 123 ++++++++++++++++++++++
 3 files changed, 125 insertions(+), 71 deletions(-)
 create mode 100755 tests/functional/test_aarch64_virt_gpu.py

-- 
2.39.5
