Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D033DCA1002
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 15:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuCBV-0004pZ-PD; Thu, 04 Sep 2025 11:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uuCBD-0004kL-HC
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 11:47:22 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uuCB2-0008Eq-0C
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 11:47:19 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-5448c576e3bso501460e0c.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757000821; x=1757605621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yOnn6Do8LsxgzKBiy5sUOxzwN39PLAw+R39zZvac568=;
 b=sfNhacjAkBkw8hiSysSVUhPmR9eBU/qHN2ECHjbTwkHS1sH56BwHliBuHAhKRZZ/AD
 QxrN6Y3ut8cn71GF3DYM0Flvn14BEZ8AP26p8JuO0j1ez6bMGw0gfI4+ahMCEG0+fQkj
 n5QNXB3Qkma9MsHZPRyMx4SEVKNxsglRJmQHngp87cPF1uC9l25O/H0OYMmORYXTiS+G
 3LY3Fc5jNn5UJeICTFSm7NLvH39+KQLhvWxI8RBJVgpdvVkANJ7qPPVrTrnFkSSITdep
 LeZEmT11zaMlRx3iJUJ0PSFyBLrvfBqnOh0pRY4dPC8oDlknG/GTf1CSoT3trY6vFSof
 0I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757000821; x=1757605621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yOnn6Do8LsxgzKBiy5sUOxzwN39PLAw+R39zZvac568=;
 b=kmXon8yVKVNQeX+i0oWII4FNA/nG4BXVDcD5H7e9kT7IHqBvwwFk6BrfQgv/NLXGFW
 rrKMRnh5ofML+pjD4dcHZ/GGo1DX7A1MAX89CYHPI9w1fumAF3j7LqmIpsMz7Z7Bkpib
 QLs4MJAQoP3n2MiEvLCstLdlGv9uPTwmVSZYSFTdJl9o84KI2HnKD5y832gaw0mFohYN
 7iznK4BOWviJ31XfIdxkejYwaF+AgTcwTvOtEEgabBhbJE4N4naYZf/hiWWvSRM1Lr/G
 JRVNg8VNOg2OxRPun3TWub+lbXvY1kA2/JmBs2fhkmJ1GU0ezpebva3uztBEluuYrGuC
 oOKg==
X-Gm-Message-State: AOJu0Yw/rExCABxiokCGmMcEOfaXwrZu39/zS85Musi8npy8wFEQGyOw
 tYL5RvHv8WKtgY4BOCvk9I45NwSe79CR4/V4wfTiUX5b4Qh2Jf2c0mSBUf14Pm7uk4k=
X-Gm-Gg: ASbGncu+WfWBZaeGEhB+jEUNs7RdstTD0BTKwdzFdqU/EXEPC/JuotUea/FIip99kzP
 Fk8f2eefDMB3WG34MYuhJN/GTO0fZ80fbrngK80Q1EYHQE7iKLnzFH576A/oDAo0m1nQoYVFc2Q
 ycZ2xSgQ1Z8cswDREWzomDzyp8ktO6Bwsafhm3mPrycX9ioWBVl0hCq4AzAbqXsN0LEasIS4Ijd
 Y+VW0ZaWOQ2zDHncPB7R5lyah3qzlje6oykZdQfSoTywWWxlbTxNgFwNhXexhTeWLjDn+JZv2uN
 k/9hPwBoFztgHr3PSZSgmmUg85T+WoyP1i2hFop/XpLbl7AxcyQFBdVZecobm3tcxixP9tyJ7B2
 Y6L+OmLwPjitD2pmkje5HFlrrIsrC
X-Google-Smtp-Source: AGHT+IHftDoYZXHsuXOj2+6WgECV2XuLyqyUT95Yi8tEyi96bcM5933K9sC7GJPAkA7ArYel1kbXJg==
X-Received: by 2002:a05:6122:1350:b0:544:9414:105f with SMTP id
 71dfb90a1353d-544a018f69fmr5941514e0c.2.1757000820705; 
 Thu, 04 Sep 2025 08:47:00 -0700 (PDT)
Received: from gromero0.. ([186.215.58.133]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-544a666da0csm6497022e0c.28.2025.09.04.08.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 08:47:00 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	1844144@gmail.com,
	gustavo.romero@linaro.org
Subject: [PATCH v2 0/5] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
Date: Thu,  4 Sep 2025 15:46:35 +0000
Message-Id: <20250904154640.52687-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa35.google.com
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

The goal of this series is to remove Avocado as a dependency for running
the reverse_debugging functional test.

This test, the last one I’m aware of that relies on Avocado, requires it
because of the need for GDB to test reverse stepping, continue, etc.

In this series, we leveraged the run-test.py script used in the
check-tcg tests, making it a GDB runner capable of calling a test script
without spawning any VMs. In this configuration, the test scripts can
manage the VM and also import gdb, making the GDB Python API inside the
functional test scripts.

A --quiet option has been added to run-test.py so it doesn't print the
command line used to execute GDB to the stdout. This ensures that users
don't get confused about how to re-run the tests. One can re-run the
test simply by copying and pasting the command line shown by Meson when
V=1 is passed:

$ make -j check-functional V=1

or, alternatively, once the test run completes, the exact command found
in the 'command:' field of the build/meson-logs/testlog-thorough.txt
file generated by Meson. Both methods provide the correct environment
variables required to run the test, such as the proper $PYTHONPATH.

The test is kept “skipped” for aarch64, ppc64, and x86_64, so it is
necessary to set QEMU_TEST_FLAKY_TESTS=1 in the test environment to
effectively run the test on these archs.

On aarch64, the test is flaky, but there is a fix that I’ve tested while
writing this series [0] that resolves it. On ppc64 and x86_64, the test
always fails: on ppc64, GDB gets a bogus PC, and on x86_64, the last
part of the test (reverse-continue) does not hit the last executed PC
(as it should) but instead jumps to the beginning of the code (first PC
in forward order).

Thus, to effectively run the reverse_debugging test on aarch64:

$ export QEMU_TEST_FLAKY_TESTS=1
$ make check-functional


Cheers,
Gustavo

v2:
- Rebased on top of master, which split tests in tests/functional/<arch>
- No abrupt exit from GDB since it will throw an exception in recent GDB versions 
- Fixed report of passed/failed/skipped to Meson
- Improved detection of the GDB in meson.build by using GDB probed by ./configure
- Separate run-test.py changes to ease reviewing  
- Added --quiet option to run-test.py


Gustavo Romero (5):
  tests/guest-debug: Make QEMU optional in run-test.py
  tests/guest-debug: Format comments
  tests/guest-debug: Add quiet option to run-tests.py
  tests/functional: Support tests that require a runner
  tests/functional: Adapt reverse_debugging to run w/o Avocado

 configure                                     |   2 +
 meson.build                                   |   4 +
 meson_options.txt                             |   2 +
 scripts/meson-buildoptions.sh                 |   2 +
 tests/functional/aarch64/meson.build          |   7 +-
 .../functional/aarch64/test_reverse_debug.py  |  15 +-
 tests/functional/meson.build                  |  65 +++++++
 tests/functional/ppc64/meson.build            |   7 +-
 tests/functional/ppc64/test_reverse_debug.py  |  17 +-
 tests/functional/reverse_debugging.py         | 175 +++++++++---------
 tests/functional/x86_64/meson.build           |   7 +-
 tests/functional/x86_64/test_reverse_debug.py |  21 +--
 tests/guest-debug/run-test.py                 |  86 +++++----
 13 files changed, 253 insertions(+), 157 deletions(-)

-- 
2.34.1


