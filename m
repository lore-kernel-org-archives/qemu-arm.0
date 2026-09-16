Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51295C982C4
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:30:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6raY-00023z-IU; Wed, 16 Sep 2026 11:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raV-00022u-CX
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:19 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raT-0001Jw-EC
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:19 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so514343f8f.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789572615; x=1790177415; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3g11Ma0Ng7rU1yKy4jFfQkcxkWs6tLV67tZUKtn1NiI=;
 b=QeA0wirX8YqMLU/GwvgHerhYeGEPmR4TEk8Kgy5lbKfNd8jQwHGuI17Rjtt0zsoedQ
 yM3+3+/eEIN1zCdTn5s9XLwKyZRa33tfjUJU15QkfDgMwhS2ex47hBAtDydn9N3XBhZg
 HNlqmYaHWsff2HyMGHEH+RDrNdZ7O8pN9skv3iDfxO9EmWZUeJqIxZZOuUsFfbw3rrqy
 v97pe47VWbKHP6mIm+WHeKt9V32ODZJW1ZtKzOWK5zZjA79fNym6QJO8lHjRe9LaB2ne
 lv+88wSGICxWzhgH2wUSG4slIZGzwThngSFYZ38mWDSuCCn4tzamW3Zajup8w8Mvy++i
 yD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789572615; x=1790177415;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3g11Ma0Ng7rU1yKy4jFfQkcxkWs6tLV67tZUKtn1NiI=;
 b=uZWe+Tc4X23HlqsyrtffjNulzu8Z4rGcmVChbWZNgpR4oiie7BcYQShQ+H87tZaCDk
 zq6ppa9LJBR5l9CQ24fIUr3L1GruNdcMgdP7QJKBQi9EENkUn+JdszVlqiKavuvXvcHs
 XkX3yegysjNgTG3CZZOay+j4p66Nw730K+ZHrsOuPin7wq4NnE2ftPMzv8W1qhjtXO0q
 9QWz97fRhc7ZMgSf0BfozKB2J7/lbFEdObxLIBrxBgn7bpdqaQDLh05jpbzasc3gwC8E
 07mnt2/3bPUu42d5R5eZ/drZUOGNQc5L1vAeR1wXY9ZpMM2rLzUHVXj/WhV92C61LIXG
 u74w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZ7mmMf8nrjF/gXNKs0HABNiRzkw+enfHluxhUqWYgm/6lImAYbdWcZ2zIvw4v4P47pIJG4TV2kw==@nongnu.org
X-Gm-Message-State: AFuF++msMPi1qeMKN3WE5Q2GM4ClM86VsP6rctLRPq1qPtGGbEB2AhDO
 xH7eXCHVZbtwlwpwPOZhpc9pVwyj9rWJl0E/XfLKoOqjBslEFLHGLntKmQEnnVcNGbM=
X-Gm-Gg: AYBFou0WHjDVmStmqrwQkKq6QeP9oIDFLQXRVOH1H9y2A0jjkeMwJ6QMsdUrr/yylJI
 d8jW7QPx+f+p2T4GY2d+FDhebQBhf8f8676ptsYuhha0+gtQB4L8+v222MpInB3AXeSl+de8g6S
 B7U1S7331A0Lth3h7T4ltGFr6aS9gVdoUDl7QTwXaKA9VG6BVIiZ2Zhy32nozZTDqgH7YRguFJ6
 tkLrCYdFeHdua6Gqa+W2A/B7N+15Wlkx7h+yp+2KTqq/YZTioEdm5Hw3ZSCJlw7ASAbVZ0TlRS1
 9cdpqfaUP28RSRtRTU8ehhCZbZKBtR9xr1mJ2MOO4r6ZuOa+dcWsZx1tz//pXpjPzzxnqBwEUII
 ARGKivHGYnm5YGPJTGFLbNdxwwJwzvSu9U+2Jrs00tON6RWUwvIiajDZnUs2Qd3ToqqXebD4Ca8
 1Qxk0++Xh9hQ2s/+x/bXkobyoyScRhAXRrPqHwbmsBKZOLErEbiu67L7VNRfbx2lTCR15ivecOK
 pjienHcHQ==
X-Received: by 2002:a05:6000:26c7:b0:482:fd9c:3740 with SMTP id
 ffacd0b85a97d-4870cef826fmr4135025f8f.22.1789572615294; 
 Wed, 16 Sep 2026 08:30:15 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27a41sm7418692f8f.18.2026.09.16.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:30:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 34C99618BA;
 Wed, 16 Sep 2026 16:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>, Brad Smith <brad@comstyle.com>,
 Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 00/19] testing: various docker clean-ups post meson tcg
 conversion
Date: Wed, 16 Sep 2026 16:29:53 +0100
Message-ID: <20260916153013.2134555-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This cleans up a few bits and pieces although doesn't totally solve
the issue of an apparent stall while meson builds the docker image.
However with these changes there should be no difference between the
meson build and the equivalent "make docker-image-foo" invocation.

We also finally get rid of the ill-advised magic caching support in
docker.py.

v4
 - added Illya's fixes for out of tree and s390x tests
 - tweaked the revert so --disable-containers still passed to meson
 - don't define tests if no compiler available to avoid excess SKIPs

v3

 - Update make2test to trigger docker build from Makefile.include.
 - add Daniels's suggested console: true patch
 - fixed up some unref vars from the reverts

v2

I've restored the configure based compiler checks for so we can build
roms and the vdso blobs again. It looks like we could never build roms
with container based images so I've left it for now. Unlike the vdso
build we can't trigger a container build through Makefile.prereqs.

TODO
----

I also need to look at the timestamp stuff that Pierrick has suggested
to see if that improves the caching from the registry.

The following still need review:

  tests/tcg: add console property to docker image custom target
  scripts/make2mtest: add docker dependencies for check-tcg-% targets
  tests/docker: fix brown bag typo for docker-ccache
  tests/docker: swap --quiet for --verbose
  tests/docker: add container registry to configure and use
  tests/tcg: don't define tests when missing compilers
  tests/tcg: use --add-current-user when building containers
  configure: re-purpose the tcg test compiler configs for vdso building
  Revert "tests/tcg/meson.build: implement ./configure -cross-cc-* options"

Please test and review.

Alex.

Alex Bennée (16):
  Revert "configure: remove cross_cc and gdb detection logic"
  Revert "tests/tcg/meson.build: implement ./configure -cross-cc-*
    options"
  Revert "tests/tcg/meson.build: implement ./configure containers
    options"
  configure: re-purpose the tcg test compiler configs for vdso building
  tests/tcg: prefix meson built docker tags with qemu/
  tests/tcg: use --add-current-user when building containers
  tests/tcg: don't define tests when missing compilers
  tests/docker: add container registry to configure and use
  tests/docker: remove used _read_qemu_dockerfile
  tests/docker: strip remaining caching logic from docker.py
  tests/docker: add specific command to parser
  tests/docker: swap --quiet for --verbose
  tests/docker: fix brown bag typo for docker-ccache
  gitlab: update the @user id mapping file
  scripts/make2mtest: add docker dependencies for check-tcg-% targets
  tests/tcg: add console property to docker image custom target

Daniel P. Berrangé (1):
  configure: correctly honour --disable-containers

Ilya Leoshkevich (2):
  tests/tcg/s390x: Provide the libc bits needed by the system tests
  tests/tcg: Fix building outside of the source tree

 configure                               | 494 +++++++++++++++++++++++-
 tests/tcg/s390x/libc/stdio.h            |  11 +
 tests/tcg/s390x/libc/string.h           |  12 +
 .gitlab-map-auto                        |   8 +-
 linux-user/aarch64/Makefile.vdso        |   2 +-
 linux-user/arm/Makefile.vdso            |   2 +-
 linux-user/hppa/Makefile.vdso           |   2 +-
 linux-user/i386/Makefile.vdso           |   2 +-
 linux-user/loongarch64/Makefile.vdso    |   2 +-
 linux-user/ppc/Makefile.vdso            |   2 +-
 linux-user/riscv/Makefile.vdso          |   2 +-
 linux-user/s390x/Makefile.vdso          |   2 +-
 linux-user/sh4/Makefile.vdso            |   2 +-
 linux-user/x86_64/Makefile.vdso         |   2 +-
 meson_options.txt                       |  92 +----
 scripts/coverity-scan/run-coverity-scan |   2 +-
 scripts/gitlab-map-update               |   2 +-
 scripts/meson-buildoptions.sh           |   3 +
 scripts/mtest2make.py                   |  35 +-
 tests/docker/Makefile.include           |  16 +-
 tests/docker/docker.py                  | 188 ++++-----
 tests/tcg/meson.build                   |  66 ++--
 tests/tcg/s390x/system/meson.build      |   2 +
 23 files changed, 659 insertions(+), 292 deletions(-)
 create mode 100644 tests/tcg/s390x/libc/stdio.h
 create mode 100644 tests/tcg/s390x/libc/string.h

-- 
2.47.3


