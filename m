Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31ABCD5BB5
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I9-0004cr-Ld; Thu, 21 May 2026 09:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Ho-00047R-T6
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:06 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008PF-U0
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so44102155e9.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369461; x=1779974261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5HDNc110nMdpveWnNoW1zm1rNVEYkyn1K2P5WVdIFfU=;
 b=E4tkP4cqPJFD3BraIwp2XNtu2G8+gBPcZ4o6sbEHomm7m8ZcLJHMDlCiR9X9+xzwaU
 Gnfa04Eb7vL7Wd5pwpCPD2oaiz6o8b/1DIsz57xsH7UzeFXFpmjeRaAx4gLVttSik+Mh
 2s8WtEeBv++5RWv9HUVmEcB3lsTLpMXWP4DEDnMktTRD1/yMadJXy3UjLhEdqKfKJZ7r
 /CHc8pr5KZAQD06TKwdEKysVJKamt0ZnyXYucceNktc32PeCE90ECFi3mRR4EzXDytZs
 Al2N7qqrCrWVD8IuZ/kOsEISxDFGzU2DZVTI/8vFbyb3lsjrxtfzuaZbGqkCn3Warc43
 0gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369461; x=1779974261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HDNc110nMdpveWnNoW1zm1rNVEYkyn1K2P5WVdIFfU=;
 b=gdOGG34zdf1vOHPC3RLh6BWgxKCUKbtqtyIifV0zHhBLO77CEeSkG/93LzuqPO+X3D
 34FFjU7HIEVcWfZZRuGS4S+KcQ9/mwxqFLq7sZlYQgY83RK7MTSZTIY5EN7ZG3/4VHCf
 OGgYeAkwRgQj9quEqZ2jK8uFN2DejWRzbgCqLvFb5tUIZzsoPzDud9MZtiKKsNRDF7bG
 P883OsWrxFMdjoc7jjowXwUaVOHtkoqpdCwWFxNLjcCboVp/dujRrBEPxunW3KcyJabt
 eDabR3aZKDm2GYLRt+DvRMYZCG7nO6eRmLIRvqkfmOhEYCxKYuraYXFGVTF4HmllQlzN
 JplA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QAk3VgTbRahaPwpfjlTsu0rJWu5P88eWRjWJbVo7sWyssqs8jZR0U8Dh20LqUXxLjuI9mbsd7LQ==@nongnu.org
X-Gm-Message-State: AOJu0YzlUauHvLHx3I1gEEpxKH67hWN/wTC5CLnwfj5JDOUqq8IR8Ij/
 AzZjK70cUc5EhywfEKPQEDmKaVFY0rqRXLoUwf3N4nu6gqOfWnYT3K3NAOKsHA6lEOY=
X-Gm-Gg: Acq92OGY7gVEazchnqb+g5LQxr/QKpNA1qsrfenuNISOyNJij2KrqVF4ryveTINrq8x
 sqlNn9GtCOvTL6i0W7yzEN6fSKzK24iiE6idVEF43OW7kxUXr3jr5qEPa4ZWiLv2TPMYl1YTqyL
 7i+cNoPm4m2MeVH1yK0yraIkZE3x0rA0NiRZvC04mYRx+n23ybqoF89Y5HtrtT0PVysMQ5TAVx4
 qU0GImmoxXprLMisf8O5un3Jh/Bg2CFzDSnJLjpw9bB3VPrL4LV5XvVsrgL30jZXQYE2AcRKlJd
 9/I9PWYf/sLeOSq2j/x3RTLERSzjVQkjXhzj8K9CRQMhCEhIdwOGmB9NdEBLpwjh6TJuMoss9Ib
 mqIdBFVzi7HZBUYHFc5TCo3UOEUyartcfmANDrnbdRIBj6d9UhDE3QuxGFiQ3gE1m93gXxBylOO
 joeK8VovXqdMIjz076p4NgeFQ6pAylDp7jSw==
X-Received: by 2002:a05:600c:621a:b0:48d:50a:6ef4 with SMTP id
 5b1f17b1804b1-490360ae7e3mr31738935e9.11.1779369460791; 
 Thu, 21 May 2026 06:17:40 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa93d29csm3069201f8f.37.2026.05.21.06.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3F12B5F886;
 Thu, 21 May 2026 14:17:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 00/16] testing/next: various updates (MacOS, docker, gitlab)
Date: Thu, 21 May 2026 14:17:22 +0100
Message-ID: <20260521131739.540157-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

These patches are mostly dealing with the loss of the CirrusCI MacOS
images by porting to gitlab. I've had to fight a bit with the build
system to deal with the way MacOS has signed and unsigned versions of
QEMU. In the end I couldn't get the dependencies to work for check-tcg
so I've just called the check-tcg test runners directly.

There is also a fix for getting watchpoints working so we can have the
basic TCG gdb tests.

I've also included Phil's docker series which is already reviewed.

The following still need review:

  gitlab: add MacOS 26 job on gitlab runner
  gitlab: add initial MacOS 15 on gitlab runner
  ci: drop cirrus MacOS build
  accel/tcg: move jit thread manipulation into do_tb_phys_invalidate
  tests/Makefile.include: add binary dependency to run-tcg-tests-% rules
  tests/Makefile.include: fix typo in comment
  Makefile: include tests/Makefile.include before ninja calculation

Alex.

Alex Bennée (9):
  Makefile: include tests/Makefile.include before ninja calculation
  tests/Makefile.include: fix typo in comment
  tests/Makefile.include: add binary dependency to run-tcg-tests-% rules
  accel/tcg: move jit thread manipulation into do_tb_phys_invalidate
  ci: drop cirrus MacOS build
  gitlab: add initial MacOS 15 on gitlab runner
  gitlab: add MacOS 26 job on gitlab runner
  gitlab: update issue template for binary test cases
  MAINTAINERS: add a section for AI agents

Philippe Mathieu-Daudé (7):
  MAINTAINERS: Fix docker/dockerfiles/debian-hexagon-cross.docker path
  MAINTAINERS: Cover debian-loongarch-cross.docker with LoongArch
    section
  MAINTAINERS: Cover debian-xtensa-cross.docker with Xtensa section
  MAINTAINERS: Cover debian-tricore-cross.docker with TriCore section
  MAINTAINERS: Cover python.docker with Python library section
  docker: Remove LegacyKeyValueFormat warnings in non-generated files
  docker: Remove LegacyKeyValueFormat warnings in generated files

 MAINTAINERS                                   | 12 +++-
 Makefile                                      |  4 +-
 accel/tcg/tb-maint.c                          | 43 ++++++-------
 tests/lcitool/refresh                         | 24 +++++--
 tests/docker/dockerfiles/alpine.docker        |  2 +-
 tests/docker/dockerfiles/centos9.docker       |  2 +-
 .../dockerfiles/debian-all-test-cross.docker  | 10 +--
 .../dockerfiles/debian-amd64-cross.docker     |  2 +-
 .../dockerfiles/debian-arm64-cross.docker     |  2 +-
 .../dockerfiles/debian-armhf-cross.docker     |  2 +-
 .../dockerfiles/debian-hexagon-cross.docker   | 14 ++---
 .../dockerfiles/debian-i686-cross.docker      |  2 +-
 .../dockerfiles/debian-loongarch-cross.docker | 10 +--
 .../dockerfiles/debian-mips64el-cross.docker  |  2 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  2 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |  2 +-
 .../dockerfiles/debian-riscv64-cross.docker   |  2 +-
 .../dockerfiles/debian-s390x-cross.docker     |  2 +-
 .../dockerfiles/debian-tricore-cross.docker   |  6 +-
 .../dockerfiles/debian-xtensa-cross.docker    |  8 +--
 tests/docker/dockerfiles/debian.docker        |  2 +-
 .../dockerfiles/fedora-rust-nightly.docker    |  2 +-
 .../dockerfiles/fedora-win64-cross.docker     |  2 +-
 tests/docker/dockerfiles/fedora.docker        |  2 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  2 +-
 tests/docker/dockerfiles/python.docker        |  5 +-
 .gitlab-ci.d/cirrus.yml                       | 14 -----
 .gitlab-ci.d/{cirrus => }/macos-14.vars       |  0
 .gitlab-ci.d/macos.yml                        | 63 +++++++++++++++++++
 .gitlab-ci.d/qemu-project.yml                 |  1 +
 .gitlab/issue_templates/bug.md                |  4 ++
 scripts/coverity-scan/coverity-scan.docker    | 12 ++--
 scripts/git.orderfile                         |  4 ++
 tests/Makefile.include                        |  8 ++-
 34 files changed, 179 insertions(+), 95 deletions(-)
 rename .gitlab-ci.d/{cirrus => }/macos-14.vars (100%)
 create mode 100644 .gitlab-ci.d/macos.yml

-- 
2.47.3


