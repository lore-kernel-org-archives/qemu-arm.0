Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D0CA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 14:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoNV5-0007Le-2H; Tue, 19 Aug 2025 10:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uoNV3-0007LO-Uz
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:39:45 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uoNV2-0007r3-8w
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:39:45 -0400
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-76e2eb9ae80so4196238b3a.3
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755614382; x=1756219182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HPEfj/wzsoNYio8S7SRrHlFpuN1xItsEVgaWBosMrFE=;
 b=B3+sUUqononp9nHCSjr+ezgc+LJTpp3qDZjMiZIRHfdIgvAHBdOicSUhbnxr2/rXXw
 3jLAYfjQ993gspy7lhnWcre5OXANCDMPaBIzk9nONokCYVEfbEgQAtlo/KEtRUoffAUS
 /9vB2crl+TaY6/1MZOL5lVW5wGie3fzTvSypUfr2SA20oV62Ey6cvKsrsuatlVgixQSS
 hWnOoXITE7L7YKhNoMIiN7JQYH+k+Gvy2OJyYjK6TuQzpHKoxcbq/5uaKIiJNNwH0J6T
 4GYOglb4eja1Jr5/a0OuoDrS55lAhHqpXGfS9W8ydp2KH8wX52fcaoAA0iUxIn98pezL
 m5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755614382; x=1756219182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HPEfj/wzsoNYio8S7SRrHlFpuN1xItsEVgaWBosMrFE=;
 b=OBvCnjZU1Z6l3CaQsxZH3FQ2CmSuZ+MS3OGSkqB2zrLeLutBoKzQnH1hcn+yXiwCfJ
 bYz03ajl5AVDxW4Htq24WF7af13Qe/ajgQyZF/dm6Ty3QNUKFd0Ck67ROIgvkNPpraIs
 pxdbYI/1P9yOSz3U2FAP8LruHUa1gRBwHjSK6FJ2fN7qnERCz8NCP7JFrH8MoQksMNn0
 9CAo5XRG6f0hDAk2LPcHXskHI+ZK3rW4x0VbTVNtU2bfRuKMbK5MXz+Ffo7FQzEwAQRo
 86tKaIg82lxAbDTapbtX//sVTqFIvI0MFL7ejQ/JokgBA1RcKfNWcLnm7Pe1wxwyLG/K
 V/fA==
X-Gm-Message-State: AOJu0YzZcvcz6CLZaZgca+DlraUs7W+IvSYWlw+YxPEf4cBu/vRlf3E5
 AMWGjX1U+itREN/VbYSSJtSLk1sgK7Aj6OEPz+5Qp6Leb5+qY3hC4XxMiGlvNUiqMZY=
X-Gm-Gg: ASbGncthnT0Hs9MZ3GxJz6Oj4GE6KXTAymqpdWzXGoS305EeJdXdvww5VcCpWHCGPlb
 bMAEJLISUKt6+jwYiJPSZq4OJw/NbDKNkjujwZIqid+HOmcHtBycny6N88ntY4sZ0dwFYyca2si
 wFS1geDPLKtgUUELb8em/cFLU36/L6NaNDV11yuTZaWpJTEmKzhzI9R3TCyvNT061Vf8wFdMpJj
 d15BG9d8J+I3gQgYwagM1BF0YPZjpRyCAZnnozNoadn3sRUIUlCfq4mRAAdITf0NaFA8BkKPk93
 Rmb3L+LKNg6SYko0zntmk8y0nXZmXwZnJAN7DWppD7BjIdxzkTDsll59rAsxrsjnwiNxqkiZ30s
 VvAByWyxdTbSacaG0rEM6GPf6pw6iFnsr0EusYAJYTtbuEMkvf62TnUm8QA==
X-Google-Smtp-Source: AGHT+IEP7RW4zw2I0e8d55L1ucIxjw6KOFYWrYQ2w9SOQkZns7vc0nLGZveOI60DzUdjg5yP889hCQ==
X-Received: by 2002:a05:6a00:2d15:b0:76c:c48f:d7ab with SMTP id
 d2e1a72fcca58-76e80ecd8eemr3518154b3a.13.1755614382061; 
 Tue, 19 Aug 2025 07:39:42 -0700 (PDT)
Received: from gromero0.. (201-1-50-181.dsl.telesp.net.br. [201.1.50.181])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d0d98dfsm2769781b3a.17.2025.08.19.07.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 07:39:41 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Cc: qemu-arm@nongnu.org,
	1844144@gmail.com,
	gustavo.romero@linaro.org
Subject: [PATCH 0/4] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
Date: Tue, 19 Aug 2025 14:39:12 +0000
Message-Id: <20250819143916.4138035-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x444.google.com
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
because of the need for GDB to test reverse stepping and continue.

In this series, we leveraged the run-test.py script used in the
check-tcg tests, making it a GDB runner capable of calling a test script
without spawning any VMs. In this configuration, the test script can
manage the VMs and also import gdb from the test script, making the
Python GDB API available inside the functional test.

The test is kept “skipped” for aarch64, ppc64, and x86_64, so it is
necessary to set QEMU_TEST_FLAKY_TESTS=1 in the test environment to
effectively run the test on these archs.

On aarch64, the test is flaky, but there is a fix that I’ve tested while
writing this series [0] that resolves it. On ppc64 and x86_64, the test
always fails: on ppc64, GDB gets a bogus PC, and on x86_64, the last
part of the test (reverse-continue) does not hit the last executed PC
(as it should) but instead jumps to the beginning of the code (fist PC
in forward order).

Thus, to run the reverse_debugging test effectively on aarch64:

$ export QEMU_TEST_FLAKY_TESTS=1
$ make check-functional 

Cheers,
Gustavo

[0] https://gitlab.com/qemu-project/qemu/-/issues/2921

Gustavo Romero (4):
  tests/guest-debug: Make QEMU optional in run-test.py
  tests/functional: Support tests that require a runner
  tests/functional: Mark main in QemuBaseTest class as a static method
  tests/functional: Adapt reverse_debugging to run w/o Avocado

 meson.build                                   |   4 +
 tests/functional/meson.build                  |  77 ++++++++-
 tests/functional/qemu_test/testcase.py        |   1 +
 tests/functional/reverse_debugging.py         | 158 +++++++++---------
 .../functional/test_aarch64_reverse_debug.py  |  19 +--
 tests/functional/test_ppc64_reverse_debug.py  |  17 +-
 tests/functional/test_x86_64_reverse_debug.py |  21 +--
 tests/guest-debug/run-test.py                 |  81 +++++----
 8 files changed, 223 insertions(+), 155 deletions(-)

-- 
2.34.1


