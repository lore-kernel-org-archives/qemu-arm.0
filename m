Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A29C88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:18:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6Zb5-0007PX-Hg; Tue, 15 Sep 2026 16:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZc-0006sK-7n
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:18 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZY-0003Hf-Jd
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:11 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so1165835e9.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503367; x=1790108167; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pHFY1cp6lVYR5+9BavgB1dY8AC6tgWQtsQcFOdmzCz4=;
 b=lkSs5HRKMaEEZQQ16W58XRPEe3yEOvP5BN5qqBg7bsUA/7S8TNCy6bFLA3Xh341yyv
 KrBsd0lF59Pxk8BvGsas0MxirSL16xWrV7BmQhq9j8KkzF4RStDAqnN3r2KrUGISdaDP
 oA1vYnCOmtASf6J20uYTF18L1aVeWwwu3oFYcs/eMATXje/AkOMqPTdgtc8+nHxU/p72
 g1IUW8r706UdB+hbV89klf4TnEqIvRHwj41JtIV0VV9NBr1uEyfG6tTJiXiFH0RSyxgB
 Dy7PEeoUOcYHlzvcw10VILbd+5dciO0aFbXF/W2UfwcWaa49Z3grRpgC9sYZYCQRcmwa
 V58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503367; x=1790108167;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pHFY1cp6lVYR5+9BavgB1dY8AC6tgWQtsQcFOdmzCz4=;
 b=olAHptvJGIfN1LPwT1toU3mKYDul36XPavgbsPlUIfxBonogGDvzFOnvKzS2E0Tf0G
 4mdDE4Uc181IrShcuW7/+oHO4uqt4faK8oR+/W2YsGFYgH+reRvz4rY5Un141ncAbWTw
 bWUEYOBuppAxV48tlh5SgxZWeF9FOUnI1b5xqbzm7alTtKOaaghuwgHw4lnMqV+HSUjR
 vQxsS35peWy1Hq2DY32y1lOC3jy4TOl0AuRqWMdpRDxb65xlKwc1cOI+ZCxrUqLLLTdH
 rzmIHGYtIoELbbYGHtd1r3r1YGUk/OPF54dAfF3WBroFS67Yu9lSt8Hb0z/EIvzURRhE
 xp0A==
X-Forwarded-Encrypted: i=1;
 AKwUvBweg8ArZxHbbCGv31KSn5ggAznAK0+nTaBtFX1lCDAHyI6VjW35JKd35Vc0J4PRg0fBNCyTSJ5NaQ==@nongnu.org
X-Gm-Message-State: AFuF++mMyqC6JvDowXkP/t0Sf1zOfY4OtL2jJnhky0+5WEoI++TfjCjh
 6p/0vEyUcLRe3vi6PfX//Xoz6ifb2Og2w68VptxMmewLZHKD5waOhUoIjAWnLdLbsOA=
X-Gm-Gg: AYBFou0KL+QL0cgv4Uz0Leu22W23myqG4a40DpZI1Fw2bG7zYgaAZaWaxNhanKMfsdp
 q9LxN2K1yuEyyfkx3Y0tH5lafpJej1LWXN+A+c5jgGFD6l+TwLb9ut5b5f+jqFMkpXPlWvAjudn
 utayfKhPAWvmmkOZztkwCEL00kOCqex9h4v+CN6g+NaDv2ZxL8/6hHDblVLpbEcypmpgG5x9yeG
 a7nV6FOQU23REUrQ/69IPVt6vx6s7/saF1nYcz32MK1OfZQJTBRA2+7Y80sVwNqgutu9ru1xNTL
 muSOkrhE2rVO5ZL++6iauj50y7CkmIQMPnX55firbtBctsS+xvRVi6GLNLcU/u/Gb9qVF/+SLB/
 bxXhprZbaomhqvx7ghsKoMABipNlaelw7swK32uqfEe1CMHcGgGyMdejEz/CC9tYkd8eWqhiug9
 IxkT9GX3AqiiOz4kxp2QBJcUiet954aI+YO1BzGO/32u09tYo4iJFmLibGC64ePjp415PCklA=
X-Received: by 2002:a05:600c:4e0e:b0:49d:1d7e:4085 with SMTP id
 5b1f17b1804b1-49e7a66ac51mr104283615e9.22.1789503366926; 
 Tue, 15 Sep 2026 13:16:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83fc3da0sm11163615e9.1.2026.09.15.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9A7F05F825;
 Tue, 15 Sep 2026 21:16:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 00/15] testing: various docker clean-ups post meson tcg
 conversion
Date: Tue, 15 Sep 2026 21:15:45 +0100
Message-ID: <20260915201601.1207839-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

v2

I've restored the configure based compiler checks for so we can build
roms and the vdso blobs again. It looks like we could never build roms
with container based images so I've left it for now. Unlike the vdso
build we can't trigger a container build through Makefile.prereqs.

TODO
----

I've still got Ilya's s390 test image patches to look at but I'm
sending v2 because enough people are hitting issues.

I've got a very hacky patch which fishes the docker image names out of
the custom commands and exposes them via Makefile.mtest which will
trigger the containers to be built outside of meson although meson
will still attempt to build (and find everything cached).

I also need to look at the timestamp stuff that Pierrick has suggested
to see if that improves the caching from the registry.

Please test and review.

Alex.

Alex Bennée (13):
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
 tests/docker/Makefile.include           |  16 +-
 tests/docker/docker.py                  | 188 ++++-----
 tests/lcitool/libvirt-ci                |   2 +-
 tests/tcg/meson.build                   |  71 +---
 20 files changed, 595 insertions(+), 306 deletions(-)

-- 
2.47.3


