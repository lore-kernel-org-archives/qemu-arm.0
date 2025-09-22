Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877AECAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 05:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ZMQ-00082A-Lr; Mon, 22 Sep 2025 01:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v0ZMN-00081m-7h
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 01:45:11 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v0ZMH-0004jC-Ng
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 01:45:07 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b54a2ab01ffso2801013a12.2
 for <qemu-arm@nongnu.org>; Sun, 21 Sep 2025 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758519901; x=1759124701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+RZlZ+q1dIe7KsFxNLgETNIWtWzp25LkrQSbiUq3K1o=;
 b=y9PbuhCHgwwjxZOeiindayG/58kY8wxsZ7iMc7i3LUYs78zMy0h0QJT9ewB+/HQE/q
 HqK4tqKnq6SQ6NODXO/vWmz0m26tXvQoeFMnfo9+E8zbZPpc7Mx8yvvEEbhqMyvNBkAM
 R5DNpzln93VUl/XQi/2q6UOmiQIWvgRUrih84Rbaa12ZrjUx5WNSoWlKkHB00REj4/I/
 vfgt2V4Tsxsn6nEETCLXxeECxlGsZ5FSn3me2mbNjUWryRagzndWcwulDJoWUgwyo2Ev
 IHfG+j9hwHp8DFwLRMkA9Md//i9W9sb3wUm2hu5dN1gm5OBGeukQ/eiBnrWytPy/dCt1
 4gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758519901; x=1759124701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RZlZ+q1dIe7KsFxNLgETNIWtWzp25LkrQSbiUq3K1o=;
 b=VLFDmLKKxztAuGFfViRVXmfEkGTfT432YucEJ7dN0lh4AcIQlkEiuyeuM1ZAcEwi1K
 8QbJy5f6jQBS8K/zTIOfMDEa+Q4F+e+RDcIU4E6rp5sfYvTzIrrnPbI+/4N8Jl2n5spT
 u5RQq59YRpDAWN4Us+9wK7+sP6czIj1CQBcc1PFlVQskEYfNsictWwOu/+5K3/sWottB
 0ieBfhalL8f0H0kLfXjfylivXXArgUqnFYwDN16C3f7XDbwMW4gqQxt9C1/A6Gl6fBo4
 vI3hSJYWQdlNYbqhj2OqYK6p/rrrvMqGJPib0r0AHG0HzC1KxM2B4hxZv9BUscd7Ulv0
 JkGA==
X-Gm-Message-State: AOJu0Yxb0wtDQDxvLgHKHS5Ds1V5+E58GuMXaNmVjjoWDkfFBALZNMvk
 svLuZRgKj3pC//mfnwbNnJm/HCoa0R8ZtTKIfMOMy4wHQu6Kk5nGojG5apBtHgkq6F4=
X-Gm-Gg: ASbGncvyV1V8xZdRYR0nqW9dxgmnMoo1KvBCkYgneDHMWaS+EWHJdcDjqixAeJS9XNS
 b4RxT6QMhMS/ccSXNXObV/FigzQ2xv9W8P8ugNLVUjCL+0fF71650CkrDcLRaQU/ttOGuD5SXIS
 IEXclU+AMB0VLDkC0ZNMlex4Aige79xLsNLvUj1+S+9nMmJ/AnaXKCoQ8fdo3V09zxqfLJjaTyL
 +WzzAm5jm5K9Ld9PNshH0HTLmNeBZa9rc6r/So19houECf8A7qwRaupjAtIbn+7x65VDYDRc4ox
 ocFqqmkiQ/qCuKEx6X5TMtrSfSQ2ajL0qo/Vj8ovSntJYiqxY4w/SYHD+E1COT8bfNyKoGB+a4H
 H/Zwjkk16LIGJcDaWKU/MFs6pcTRs1InNvrJGQr3+Ptk2QTp5hYsnTsjEfsWmXCX0tepNSEP7
X-Google-Smtp-Source: AGHT+IHgW/UU4zrJVPuDF2vM9PZWv7AVqIxguJh2thLLJbPy+UV5U5IrITvZ2Ug8s8wmmuM9V23rAA==
X-Received: by 2002:a17:90b:1a8c:b0:32e:7270:94b1 with SMTP id
 98e67ed59e1d1-33097fefdf9mr15267752a91.14.1758519901253; 
 Sun, 21 Sep 2025 22:45:01 -0700 (PDT)
Received: from gromero0.. (200-162-224-93.static-corp.ajato.com.br.
 [200.162.224.93]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b551c279cd5sm7691377a12.3.2025.09.21.22.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 22:45:00 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v3 0/4] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
Date: Mon, 22 Sep 2025 05:43:47 +0000
Message-Id: <20250922054351.14289-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x531.google.com
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

tests/functional: Adapt reverse_debugging to run w/o Avocado

The goal of this series is to remove Avocado as a dependency for running
the reverse_debugging functional test.

After several rounds of discussions about v1 and v2, and experiments
done by Daniel and Thomas (thanks for all the experiments and comments
so far), I've taken a new approach and moved away from using a runner
for GDB. The changes, I believe, are much simpler now.

This new series uses GDB's machine interface (MI) via the pygdbmi module
(thanks Manos and Peter for the inputs). pygdbmi provides a controller
to start GDB and communicate with it through MI, so there is no longer a
risk of version clashes between libpython in GDB and Python modules in
the pyvenv, as it could, in theory, happen when GDB executes the test
script via -x option.

Also, as Daniel pointed out, the overall test output is pretty bad and
currently does not allow one to easily follow the sequence of GDB
commands used in the test. I took this opportunity to improve the output
and it now prints the sequence in a format that can be copied and pasted
directly into GDB. For instance, the test output for STEPS = 4 is:

TAP version 13
# $ set debug remote 1
# $ target remote localhost:62464
# Remote debugging using localhost:62464
# 0x0000000040000000 in ?? ()
# $ set debug remote 0
# $ print $pc
# $1 = (void (*)()) 0x40000000
# $ stepi
# 0x0000000040000004 in ?? ()
# $ print $pc
# $2 = (void (*)()) 0x40000004
# $ stepi
# 0x0000000040000008 in ?? ()
# $ print $pc
# $3 = (void (*)()) 0x40000008
# $ stepi
# 0x000000004000000c in ?? ()
# $ print $pc
# $4 = (void (*)()) 0x4000000c
# $ stepi
# 0x0000000040000010 in ?? ()
# $ reverse-stepi
# 0x000000004000000c in ?? ()
# $ print $pc
# $5 = (void (*)()) 0x4000000c
# $ reverse-stepi
# 0x0000000040000008 in ?? ()
# $ print $pc
# $6 = (void (*)()) 0x40000008
# $ reverse-stepi
# 0x0000000040000004 in ?? ()
# $ print $pc
# $7 = (void (*)()) 0x40000004
# $ reverse-stepi
# 0x0000000040000000 in ?? ()
# $ print $pc
# $8 = (void (*)()) 0x40000000
# $ print $pc
# $9 = (void (*)()) 0x40000000
# $ stepi
# 0x0000000040000004 in ?? ()
# $ print $pc
# $10 = (void (*)()) 0x40000004
# $ stepi
# 0x0000000040000008 in ?? ()
# $ print $pc
# $11 = (void (*)()) 0x40000008
# $ stepi
# 0x000000004000000c in ?? ()
# $ print $pc
# $12 = (void (*)()) 0x4000000c
# $ stepi
# 0x0000000040000010 in ?? ()
# $ break *0x40000000
# Breakpoint 1 at 0x40000000
# $ break *0x40000004
# Breakpoint 2 at 0x40000004
# $ break *0x40000008
# Breakpoint 3 at 0x40000008
# $ break *0x4000000c
# Breakpoint 4 at 0x4000000c
# $ continue
# Continuing.
# Program received signal SIGINT, Interrupt.
# 0xffff45a2feaa2050 in ?? ()
# $ print $pc
# $13 = (void (*)()) 0xffff45a2feaa2050
# **** Hit replay-break at icount=3691561, pc=0xffff45a2feaa2050 ****
# $ reverse-continue
# Continuing.
# Breakpoint 4, 0x000000004000000c in ?? ()
# $ print $pc
# $14 = (void (*)()) 0x4000000c
# **** Hit breakpoint at the first PC in reverse order (0x4000000c) ****
ok 1 test_reverse_debug.ReverseDebugging_AArch64.test_aarch64_virt
1..1

As can be observed above, the TAP protocol is respected, and Meson
correctly displays GDB's test output in testlog-thorough.txt.

Because the pygdbmi "shim" is so thin, I had to write a trivial GDB
class around it to easily capture and print the payloads returned by its
write() method. The GDB class allows clean, single-line commands to be
used in the tests through method chaining, making them easier to follow,
for example:

pc = gdb.cli("print $pc").get_add()

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

or even, to run only the reverse_debug test:
$ ./pyvenv/bin/meson test --verbose --no-rebuild -t 1 --setup thorough --suite func-thorough func-aarch64-reverse_debug


Cheers,
Gustavo

v1:
https://patchew.org/QEMU/20250819143916.4138035-1-gustavo.romero@linaro.org/

v2:
https://patchew.org/QEMU/20250904154640.52687-1-gustavo.romero@linaro.org/

v3:
- Use pygdbmi instead of run-test.py or any other GDB runner
- No changes in meson.build, except to set QEMU_TEST_GDB in the test env. 
- Improved test output to show all GDB commands used in the test


Gustavo Romero (4):
  python: Install pygdbmi in venv
  tests/functional: Provide GDB to the functional tests
  tests/functional: Adapt reverse_debugging to run w/o Avocado
  tests/functional: Adapt arches to reverse_debugging w/o Avocado

 configure                                     |   2 +
 meson_options.txt                             |   2 +
 .../wheels/pygdbmi-0.11.0.0-py3-none-any.whl  | Bin 0 -> 21258 bytes
 pythondeps.toml                               |   1 +
 scripts/meson-buildoptions.sh                 |   2 +
 .../functional/aarch64/test_reverse_debug.py  |  13 +-
 tests/functional/meson.build                  |   6 +
 tests/functional/ppc64/test_reverse_debug.py  |  15 +-
 tests/functional/reverse_debugging.py         | 308 +++++++++++-------
 tests/functional/x86_64/test_reverse_debug.py |  19 +-
 10 files changed, 217 insertions(+), 151 deletions(-)
 create mode 100644 python/wheels/pygdbmi-0.11.0.0-py3-none-any.whl

-- 
2.34.1


