Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AFCC982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:56:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lOt-0007pu-Qx; Wed, 16 Sep 2026 04:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOo-0007ky-IT
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:51 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOk-0004yZ-GW
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:49 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485b1d2874aso441612f8f.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548824; x=1790153624; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PqU7zmqi9sCRWx52rpoAkvDkzojSDVWmHlCN7bfz3sQ=;
 b=py/6I3XxoD7NL3amLT4G58DyjPXIYQm0fqtIifnRVVlvBe4Q+xwUBh9mlesSyK4vJB
 mAv4pC83ToDfBePDXwXmqrRjRoRdAP4wZJ0axqwWPKaxKdk010c9V8SYEPKQvs+dYeRI
 p4JBQBcwuhwTVFjp7vhHdKEskhecwZmsUX1GPfGdUff4gR74tQCTafZTHU+k4xmIu9UD
 O1k5AxcgtH5NiemgWEyx+ouqEjUAg6uWv8f7mSn3hNMzQuBP4FR+c4rfrqOZtR0nt70y
 SZhhdi9Kn8i0tKxtL+K9dcoa7FFkiPuTdCOIYoN6ab+5IdRhOTdjGmP7yKs/5ia96ttu
 yBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548824; x=1790153624;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PqU7zmqi9sCRWx52rpoAkvDkzojSDVWmHlCN7bfz3sQ=;
 b=N/wp6oidVTxqfOoaoEd1ihApQ/WI8jcz+ny97kRrMXHqfEvWunL3Fu6AE6Zg1wqzTO
 ewgC6/dqGiw2C+h+Cu1zVY5TU3uGc9QvG1Vhz36gjxbU5b9WWW2byQg+uLlCfNM5EvWa
 iuIbAzncRx/ZDoLXNvQB8f91xLwCJlZsicHDm9G6q2nOtnMWmotrCSjSXLWs2KRiPciK
 TOeBbtSqC5oJxSltKY1K3+6w8ZZk/eLUZcF1hdT5yT6+Te4EAXBL84cJb/WmflYDPOGj
 A0hPC2mMhuXmG6S+qYbgaqoV2hK9KeCDU9OeKS/zgnzrTqMgpGmPGs/BOMaYAZKM9jOi
 TJRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByof7chhU/U2NznIjdYzlSWCIa3BG4z5ZRtYfUPym1V96Q8OYixpEih/M2PfHatUnZzsNPrpNGUBA==@nongnu.org
X-Gm-Message-State: AFuF++k8H/NmrIXUbCNHFuZ8gqeJ+MOD2QkVPqmHJw6rci8SQe5mT/KV
 vqQ/myP1jrXO42gDkaHEN0GE4bz5bA7tSbJQPPxAsalnz4cAoZJmSO1w56/Z9lKUx/Y=
X-Gm-Gg: AYBFou0EGY8Rdbr1MBDvHLVdWlIhafbSjDlo/DWW+5bLZur2uTpCiNnTgAyO0VyXsMN
 HH4fc2Ioz3CqFvY7MJ+cJJ8ZSpwmG2mHvV9/M77i3bCWhKjxub+1wa8nZBEH5WlyNrcZFRtYYc8
 zG1/SBi7wlEXmWZzgY1/TgRzXsLk0igL/Mm0FvL+hAfa7u9LgBksbwiUdGg/b9bnBDB/gUxGi3q
 Nmc5Fv0+R9zjAD9a7lLSmrYou2oyJctUQBMEER2YwBTyLLXJbdHh9OtrILVsR72IIPNLXbBFKqP
 vHchLFEgpBEnQTLbukCGjEFlL0xmL/7ZouGdCl4UIUcny/r0LmYLR2/gBPqcjTchG77ruNnug3c
 ebu52ZRQjIwhlMUDA2eScdupJW/k8uWbwdF9k9DDOIYSsVsPfR4wOA4GSNn+zflBDFJir1Cb9QK
 s9M4ZqSxDJ56ZFXoBpNfoTOwyU8x277jN5TnFLQIOgzhePicMQjSMWV6H9U/Cuwjqy+iERMoE=
X-Received: by 2002:a5d:5888:0:b0:487:c5e:4572 with SMTP id
 ffacd0b85a97d-4870cf03182mr4514723f8f.11.1789548823999; 
 Wed, 16 Sep 2026 01:53:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27a41sm5305754f8f.18.2026.09.16.01.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6884A5F8A6;
 Wed, 16 Sep 2026 09:53:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Warner Losh <imp@bsdimp.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 00/17] testing: various docker clean-ups post meson tcg
 conversion
Date: Wed, 16 Sep 2026 09:53:23 +0100
Message-ID: <20260916085341.1692742-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

I've still got Ilya's s390 test image patches to look at but I'm
sending v2 because enough people are hitting issues.

I also need to look at the timestamp stuff that Pierrick has suggested
to see if that improves the caching from the registry.

The following still need review:

  tests/tcg: add console property to docker image custom target
  scripts/make2mtest: add docker dependencies for check-tcg-% targets
  tests/docker: fix brown bag typo for docker-ccache
  tests/docker: swap --quiet for --verbose
  tests/docker: add container registry to configure and use
  tests/tcg: use --add-current-user when building containers
  configure: re-purpose the tcg test compiler configs for vdso building
  Revert "tests/tcg/meson.build: implement ./configure -cross-cc-* options"

Please test and review.

Alex.

Alex Bennée (15):
  Revert "configure: remove cross_cc and gdb detection logic"
  Revert "tests/tcg/meson.build: implement ./configure -cross-cc-*
    options"
  Revert "tests/tcg/meson.build: implement ./configure containers
    options"
  configure: re-purpose the tcg test compiler configs for vdso building
  tests/tcg: prefix meson built docker tags with qemu/
  tests/tcg: use --add-current-user when building containers
  tests/docker: add container registry to configure and use
  tests/docker: remove used _read_qemu_dockerfile
  tests/docker: strip remaining caching logic from docker.py
  tests/docker: add specific command to parser
  tests/docker: swap --quiet for --verbose
  tests/docker: fix brown bag typo for docker-ccache
  gitlab: update the @user id mapping file
  scripts/make2mtest: add docker dependencies for check-tcg-% targets
  tests/tcg: add console property to docker image custom target

Daniel P. Berrangé (2):
  configure: correctly honour --disable-containers
  tests/tcg: improve check for working cross compilers

 configure                               | 491 +++++++++++++++++++++++-
 tests/tcg/test_cc.c                     |   6 +-
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
 meson_options.txt                       |  95 +----
 scripts/coverity-scan/run-coverity-scan |   2 +-
 scripts/gitlab-map-update               |   2 +-
 scripts/meson-buildoptions.sh           |   3 +
 scripts/mtest2make.py                   |  35 +-
 tests/docker/Makefile.include           |  16 +-
 tests/docker/docker.py                  | 188 ++++-----
 tests/tcg/meson.build                   |  72 +---
 21 files changed, 627 insertions(+), 311 deletions(-)

-- 
2.47.3


