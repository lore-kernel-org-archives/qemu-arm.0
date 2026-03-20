Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7524C10987A1
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 15:52:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3c85-0007YO-3X; Fri, 20 Mar 2026 11:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c82-0007WU-An
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:14 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c7z-0005V7-5j
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:14 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b941762394aso244691966b.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 08:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774021869; x=1774626669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5A29bmhPdP4a5ill44kTkdJ53yf5zB+hEJbcpDnFIqI=;
 b=WJ7mn4tM+lWw61xGyWiZk7DXD/4gOET/4CY1qLzJYIhi4l0rXdaXgYC63FYwtgtJbA
 eusT/ReKx7urL0sduT7b27fdRZYgNcewH8Nf6e8q4BDMukqkF03lTbwv0RcbLcGAQqEN
 TOE4LSKv342iwN4ypC8Z3QEZFM84USCO5rIJ4y6d8KOW5jzRCFFxiJngHse13KNXG2za
 J+pKKjGX+YK1ClXpGy6n2l92bQrtN62smd01h2F3nw/0qAkyLsq9O9eg4nkwAnpmApM1
 1hn4abqptSEhWM+9OqYj3MYRn7fJ5R/VjabSSgQIJ9S30bH5PVZnFiaYGcowkW8qeN8w
 9TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774021869; x=1774626669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5A29bmhPdP4a5ill44kTkdJ53yf5zB+hEJbcpDnFIqI=;
 b=eBuyKtVMPURF0h3K2D5D/vkUXTufPHuKEoCTmUDfY9SbvHDbu371snv47/5Z+jyUEW
 rqqSzffDzDuUE3NMVtUBwHcvdV7elSxGRXHDjxR4NTSMFzNDrUz+0Iv2dPlYITP0hYRK
 sDTmURSMp2vqLWtj7SVncshTUZhrOO2e5fN0zGxu9XlHbgcOTHqUENlCqovVJLDR8FK0
 +jfEWqsdaeKJSokrdtYAKkxC2N1pcMYLxWiGR2XFA8cxUUOOZg0FjyIUKEW/kbYq6YzP
 IlxUfbPDkVw/9jKCOcE8Omt15ZqkqHqPCRIdQUb9usaDyR48vdCpNe82C7myun2chTeY
 5qJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgXzauluPKhkRzA//B3M/dHJPnAoTjA9zC2KEm3GgUZ91d8ra50YEJtyxgirtm9fm1iqvi9wBFWw==@nongnu.org
X-Gm-Message-State: AOJu0YzbmioDRMC6vgFyhajPr6btohPpeLvsOAE2gvBnamNYDnFvbRLK
 MpjLF9MxiCT9JRe1xlNRioPsal3btnAdm5sGLOiABZUPp3Bla2SHAz01nknY0UoGYHU=
X-Gm-Gg: ATEYQzzqGvJsr5vPKUOzhGn8bsoNZYY+m6zMk+jTN7/TmeHq6/lRAEuJFWJQ3kcRf5d
 zqa59Bdc9YjtN2BUNjyYxj90g8xtsAjk7xNbLUtBTPKp4NLoA/j+FsIpF0WXp7B6TEv/JWTwz9x
 2UhUNwMPO52B4sVbR1RsSUnhUBIu8L6SaDTuq99UCEcQ10oHGvxT7/5W3Yf9D48k5cGFxOLKjuI
 GVwzLMNhI+FCbyEct27MWOv0T5mNuTMWMRLjo0W4i9zqFsSKq99SCe08AjEoy1sjUxjGL0z+rAy
 Wm51b3MGds6+IERlkY+QdRTcsTrMdy5y1+fufwRTzv8qnSDl6WHP3NEBITW6nN2OmNnic33r+sX
 htFe6ftm3v5Q6J8VD1VHDY9uFynKTopgONjDaLn6B8EgGzazgtVxAH1ohX9sPxg4Rp0HXxKz2h1
 QRC7S6mAr0BC/zUEPau/H3UnI=
X-Received: by 2002:a17:907:c903:b0:b96:e593:fd1e with SMTP id
 a640c23a62f3a-b982ee996a0mr177005566b.0.1774021869154; 
 Fri, 20 Mar 2026 08:51:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f42c8fsm167210366b.9.2026.03.20.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:51:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B6B525F82D;
 Fri, 20 Mar 2026 15:51:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 0/8] testing/next: gdb-multiarch, check-tcg, docker,
 vbsa tests (pre-PR)
Date: Fri, 20 Mar 2026 15:50:59 +0000
Message-ID: <20260320155107.2143191-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

This is the current status of my testing tree. The gdb-multiarch and
filtering changes should be pretty uncontroversial. I've also picked
up some stray testing patches that where hanging around on the list.

I'll roll the PR on Monday.

v3
  - gdb-multiarch tests should work now Phillipe's stuff is merged
  - grabbed Thomas' ncat and opensuse patches

v2

  - mostly tweaks to the vbsa test (see inline comments on commit)
  - dropped the zip and send_key patches

Alex.

Alex Bennée (3):
  tests/tcg: allow filtering of TCG tests
  tests/functional: allow tests to define decompression target
  tests/functional: add VBSA linux tests

Matheus Tavares Bernardino (1):
  tests/tcg/multiarch/linux-test: use portable alternative for dirent64

Thomas Huth (4):
  tests/lcitool: Remove python3-sqlite3 from the list of needed packages
  tests/lcitool: Update openSUSE to version 16
  tests/docker: Update the opensuse-leap container file to version 16
  tests: Replace ncat with socat in migration test and drop ncat from
    containers

 configure                                     |   1 -
 tests/tcg/multiarch/linux/linux-test.c        |   5 +-
 .../ci/setup/debian/debian-13-ppc64le.yaml    |   1 -
 .../ci/setup/ubuntu/ubuntu-2404-aarch64.yaml  |   1 -
 .../ci/setup/ubuntu/ubuntu-2404-s390x.yaml    |   1 -
 tests/Makefile.include                        |   8 +-
 tests/docker/dockerfiles/alpine.docker        |   1 -
 tests/docker/dockerfiles/centos9.docker       |   1 -
 .../dockerfiles/debian-amd64-cross.docker     |   1 -
 .../dockerfiles/debian-arm64-cross.docker     |   1 -
 .../dockerfiles/debian-armhf-cross.docker     |   1 -
 .../dockerfiles/debian-i686-cross.docker      |   1 -
 .../dockerfiles/debian-mips64el-cross.docker  |   1 -
 .../dockerfiles/debian-mipsel-cross.docker    |   1 -
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 -
 .../dockerfiles/debian-riscv64-cross.docker   |   1 -
 .../dockerfiles/debian-s390x-cross.docker     |   1 -
 tests/docker/dockerfiles/debian.docker        |   1 -
 .../dockerfiles/fedora-rust-nightly.docker    |   1 -
 .../dockerfiles/fedora-win64-cross.docker     |   1 -
 tests/docker/dockerfiles/fedora.docker        |   1 -
 tests/docker/dockerfiles/opensuse-leap.docker |  35 +++--
 tests/docker/dockerfiles/ubuntu2204.docker    |   1 -
 tests/functional/aarch64/test_virt_vbsa.py    | 122 ++++++++++++++++--
 tests/functional/migration.py                 |   4 +-
 tests/functional/qemu_test/testcase.py        |   9 +-
 tests/lcitool/mappings.yml                    |  58 ---------
 tests/lcitool/projects/qemu.yml               |   2 -
 tests/lcitool/refresh                         |   2 +-
 tests/tcg/Makefile.target                     |  12 +-
 30 files changed, 156 insertions(+), 121 deletions(-)

-- 
2.47.3


