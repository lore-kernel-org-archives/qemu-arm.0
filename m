Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j17sm3684717wrb.35.2019.07.12.04.18.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:50 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D58941FF87;
	Fri, 12 Jul 2019 12:18:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 4.1? v1 0/7] testing/next (docker, win-cross)
Date: Fri, 12 Jul 2019 12:18:42 +0100
Message-Id: <20190712111849.9006-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ruJy8JpFYufd

Hi,

This is my current queue for testing/next. I think they are all worth
it for 4.1 but it would be nice to get the Windows cross builds up and
running again.

The following patches need review
 patch 0001/tests docker add test misc for building tools doc.patch
 patch 0005/tests migration test don t spam the logs when we .patch
 patch 0006/tests dockerfiles update the win cross builds to .patch
 patch 0007/shippable re enable the windows cross builds.patch

Alex Bennée (4):
  tests/docker: add test-misc for building tools & docs
  tests/migration-test: don't spam the logs when we fail
  tests/dockerfiles: update the win cross builds to stretch
  shippable: re-enable the windows cross builds

Philippe Mathieu-Daudé (3):
  tests/docker: Install Sphinx in the Ubuntu images
  tests/docker: Install Sphinx in the Fedora image
  tests/docker: Install Ubuntu images noninteractively

 .shippable.yml                                |  9 ++++----
 tests/docker/Makefile.include                 |  6 ++---
 .../dockerfiles/debian-win32-cross.docker     |  4 ++--
 .../dockerfiles/debian-win64-cross.docker     |  4 ++--
 ...{debian8-mxe.docker => debian9-mxe.docker} | 11 ++++++----
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/ubuntu.docker        |  3 ++-
 tests/docker/dockerfiles/ubuntu1804.docker    |  3 ++-
 tests/docker/test-misc                        | 22 +++++++++++++++++++
 tests/migration-test.c                        | 19 ++++++++++------
 10 files changed, 57 insertions(+), 25 deletions(-)
 rename tests/docker/dockerfiles/{debian8-mxe.docker => debian9-mxe.docker} (56%)
 create mode 100755 tests/docker/test-misc

-- 
2.20.1
