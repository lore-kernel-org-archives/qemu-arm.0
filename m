Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC68C88E57
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGmd-0006D6-OA; Mon, 26 Jan 2026 02:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGeF-0002k5-DO
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:05 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGe6-00043e-SG
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:04:28 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-81f4e36512aso4128699b3a.3
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411048; x=1770015848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7O39ywSfouytz8uRpwByNYEYOxsQRGON1bJCEMrR230=;
 b=eT8kFJOxS2smcJSkvbwFnH9yR2NNndAAtKZEp+6hheJLInmJOBmixHG6FHNbDehUNE
 sJD9Vvs7x77cm2fP+p60GK8IGx7bsxI9efv4ww+fIG2sxcluuBYvnXpWSQJ4Y9l7EdXB
 NrxQsbl3cdn3U+Co8S9cepY/5YeNMNy2oW145swRqYA6DUDxJSyXiWM0Tk9vEh9OQ9+C
 /9Bv7n0dVYmhF4nbkh8CdN2oDyrpuLTPQRYTtvwpCQasP+uuEoC8C5P8+hrwDU6yP/Vs
 sLm6R0L7piA5KAtymPjSGoml9xck+gBN2Y6UkWSA/Qiz8Et0kWzc7bhIhBb6sy+9Qw15
 K7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411048; x=1770015848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7O39ywSfouytz8uRpwByNYEYOxsQRGON1bJCEMrR230=;
 b=ut7q6WbyLO79Oru/ZzUzeO15+IsMe9K6HViIFdWLVYyu5ctT0z2rztuijMYzKsnx4o
 zD7iBBMtJ3Nhq2rJFwxT1a6LTt2uYI9cB9mJZeh8dQmxA0K6qJDoWqRdNF1ewXUvrNO+
 2y94ptux6asTDl4HMoQewWBWOYldiFlR9BW4Hq+odxoggmX6LFXrZX48WSRnUut0acBr
 W29R0SbOmQQuhx7rmYxpimoHsvCIOeqe++9ZSi0Erm18Wg6uBIvvMbYPzlzXbM1npMTI
 NyY6lhQ/cT+BbKmIgnLdWiMpXyrtlmiGSE8TvQMP0m8how5nOz7798mLspgrBhbbR5EC
 rDYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUevmnXt9GNwvfPte5EP8A5rdDHNxXNVJHodbniQ6hjaLYtXGII+ryUlTI/7gTx4mtxk42IZy/+jQ==@nongnu.org
X-Gm-Message-State: AOJu0YzRu29jbY7iBLkoohVhxyOcd8A9WgFsUIiAHjBR3utbxtWtDrL8
 GEAJYveUEDdPAmjTZiWv+nq3QHC7EgCOkWGTVTClyNgJ7r1AwTSKtPVT
X-Gm-Gg: AZuq6aI8Kuq6XkXl/H6Q0UltHF2UEbhhdg7bdSYJ5JbcJ85lc50sORN+XAMmb8tx69g
 JWDpcv0szm9rUdZVdXWXcZEEQkAlxUWvimw59C7Sn+/VeJH6YGmVeJnuxSVm6VRr2mK6seAvw0t
 9cdiQm5yXfuf/bKbz1n3EI+iui5k7cVzLIAfVz5CcMtob0riLtEksJwfmWxxsDw9ciIz6xokhXc
 7Xt3xg492JDZD1AnooYyV0n0Xf1Z0xUM7NFsazJF/Smc5BwKwyMjYWd/F35AAAP3LFwCmIDRFAm
 8LkmvZNfFSGxOwSoB/Ja2IVhPxTGWcRi0Ipz13BQxJi8cYE3zoA99Rmqi/jvlMHekwkMrka/SD6
 h7hxX37Acu7klwAIr8ucMlX4QIgnOPQ0zeFxLFAzTos5j7ZHFhGZZReJ39iNq/cgMk0koK2sA/4
 DF9rl4ePW5HAWTFvqO7d3iV4FG0FAl2dE8hZLOYaDv6Q==
X-Received: by 2002:a05:6a00:17a2:b0:81f:3957:2772 with SMTP id
 d2e1a72fcca58-823411bfe6amr3592529b3a.3.1769411048119; 
 Sun, 25 Jan 2026 23:04:08 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:04:07 -0800 (PST)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 00/33] wasm: Add Wasm TCG backend based on wasm64
Date: Mon, 26 Jan 2026 07:03:13 +0000
Message-ID: <cover.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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

V4:

- Rebased on the recent tree.
- Removed tcg-target-reg-bits.h as the 32bit support has been removed and
  TCG_TARGET_REG_BITS is no longer needed.
- Renamed the tcg/wasm directory to tcg/wasm64, aligning with the names of
  other backends.
- Added `scripts/run-emscripten.mjs` for quick testing of the Wasm-compiled
  QEMU on Node.js in the terminal. Please see the "Running QEMU on Node.js"
  section for usage

V3:

- Fixed init_wasm_js to correctly cast pointers to Numbers when passing the
  arguments to the getInt32 and setInt32 methods.
- Lowered the the maximum number of instances (MAX_INSTANCES) to avoid the
  out of memory error in recent versions of FireFox.

V2:

- Reorganized commits to implement the backend incrementally from a clean
  state.
- Removed the andc, orc, eqv, nand and nor operations to rely on default
  expansion.
- Removed the bswap operations to use default expansion.
- Removed the extract and deposit oprations to use default expansion.
- Updated the sextract to emit only when the corresponding Wasm instruction
  is available
- Removed the not operation to rely on default expansion.
- Fixed the neg implementation to "ret = 0 - arg"
- Added Wasm implementation of the mb operation using the atomic.fence
  instruction.

V1:

This patch series adds a TCG backend for WebAssembly. Unlike eariler
attempts [1], it is implemented using Emscripten's wasm64 target to support
64bit guests.

# New TCG Backend for Browsers

A new TCG backend translates IR instructions into Wasm instructions and runs
them using the browser's WebAssembly APIs (WebAssembly.Module and
WebAssembly.instantiate). To minimize compilation overhead and avoid hitting
the browser's limitation of the number of instances, this backend integrates
a forked TCI. TBs run on TCI by default, with frequently executed TBs
compiled into WebAssembly.

# Overview of build process

To compile QEMU with Emscripten, the following dependencies are required.
The emsdk-wasm-cross.docker environment includes all necessary components
and can be used as the build environment:

- Emscripten SDK (emsdk) v4.0.23
- Libraries cross-compiled with Emscripten (please see also
  emsdk-wasm-cross.docker for build steps)
  - GLib v2.84.0
  - zlib v1.3.1
  - libffi v3.5.2
  - Pixman v0.44.2

The configure script supports --cpu=wasm64 flag to compile QEMU with 64bit
pointer support.

emconfigure ./configure --cpu=wasm64 \
                        --static --disable-tools \
                        --target-list=x86_64-softmmu
emmake make -j$(nproc)

If the output needs to run on wasm32 engines, use
"--enable-wasm64-32bit-address-limit" flag.

emconfigure ./configure --cpu=wasm64 --enable-wasm64-32bit-address-limit \
                        --static --disable-tools \
                        --target-list=x86_64-softmmu
emmake make -j$(nproc)

Either of the above commands generates the following files:

- qemu-system-x86_64.js
- qemu-system-x86_64.wasm

Guest images can be packaged using Emscripten's file_packager.py tool.
For example, if the images are stored in a directory named "pack", the
following command packages them, allowing QEMU to access them through
Emscripten's virtual filesystem:

/path/to/file_packager.py qemu-system-x86_64.data \
                          --preload pack --export-es6 > load.js

This process generates the following files:

- qemu-system-x86_64.data
- load.js

# Running QEMU on Node.js

The Wasm-compiled QEMU can run on Node.js using the `run-emscripten.mjs`
script.

node ./scripts/run-emscripten.mjs --preload ./load.js \
     ./qemu-system-x86_64.js -- \
     -nographic -m 512M \
     -L pack/ \
     -drive if=virtio,format=raw,file=pack/rootfs.bin \
     -kernel pack/bzImage \
     -append "earlyprintk=ttyS0 console=ttyS0 root=/dev/vda loglevel=7"

Node.js 24 or newer is needed to run wasm64 binaries. Also note that QEMU's
"quit" monitor command doesn't work as of now because of the Emscripten's
atexit issue [3]. Send SIGINT or SIGTERM to the node process to exit QEMU.

# Running QEMU on browsers

On the browser envronment, emscripten allows passing arguments to the QEMU
command via the Module object in JavaScript:

Module['arguments'] = [
    '-nographic', '-m', '512M',
    '-L', 'pack/',
    '-drive', 'if=virtio,format=raw,file=pack/rootfs.bin',
    '-kernel', 'pack/bzImage',
    '-append', 'earlyprintk=ttyS0 console=ttyS0 root=/dev/vda loglevel=7',
];

The sample repository [4] (tcgdev64 branch) provides a complete setup,
including an HTML file that implements a terminal UI.

[1] https://patchew.org/QEMU/cover.1747744132.git.ktokunaga.mail@gmail.com/
[2] https://patchew.org/QEMU/cover.1754534225.git.ktokunaga.mail@gmail.com/
[3] https://github.com/emscripten-core/emscripten/issues/26040
[4] https://github.com/ktock/qemu-wasm-sample/tree/tcgdev64

Kohei Tokunaga (33):
  tcg/wasm64: Add tcg-target.h
  tcg/wasm64: Add register-related definitions
  tcg/wasm64: Add constraint definitions
  tcg/wasm64: Add relocation callbacks
  tcg/wasm64: Add and/or/xor instructions
  tcg/wasm64: Add add/sub/mul instructions
  tcg/wasm64: Add shl/shr/sar instructions
  tcg/wasm64: Add setcond/negsetcond/movcond instructions
  tcg/wasm64: Add sextract instruction
  tcg/wasm64: Add load and store instructions
  tcg/wasm64: Add mov/movi instructions
  tcg/wasm64: Add ext instructions
  tcg/wasm64: Add div/rem instructions
  tcg/wasm64: Add neg/ctpop instructions
  tcg/wasm64: Add rot/clz/ctz instructions
  tcg/wasm64: Add br/brcond instructions
  tcg/wasm64: Add exit_tb/goto_tb/goto_ptr instructions
  tcg/wasm64: Add call instruction
  tcg/wasm64: Add qemu_ld/qemu_st instructions
  tcg/wasm64: Add mb instruction
  tcg/wasm64: Mark unimplemented instructions
  tcg/wasm64: Add initialization of fundamental registers
  tcg/wasm64: Write wasm binary to TB
  tcg/wasm64: Implement instantiation of Wasm binary
  tcg/wasm64: Allow switching coroutine from a helper
  tcg/wasm64: Enable instantiation of TBs executed many times
  tcg/wasm64: Enable TLB lookup
  tcg/wasm64: Add tcg_target_init function
  meson.build: enable to build Wasm backend
  meson.build: Propagate optimization flag for linking on Emscripten
  .gitlab-ci.d: build wasm backend in CI
  scripts: Add a script to run the wasm-compiled QEMU on node.js
  emsdk-wasm-cross.docker: Bump up emsdk to 4.0.23

 .gitlab-ci.d/buildtest.yml                    |    4 +-
 MAINTAINERS                                   |    7 +
 configure                                     |    8 +-
 include/accel/tcg/getpc.h                     |    2 +-
 include/tcg/helper-info.h                     |    4 +-
 include/tcg/tcg.h                             |    2 +-
 meson.build                                   |   14 +-
 meson_options.txt                             |    3 +
 scripts/meson-buildoptions.sh                 |    5 +
 scripts/run-emscripten.mjs                    |   66 +
 tcg/aarch64/tcg-target.c.inc                  |   11 +
 tcg/loongarch64/tcg-target.c.inc              |   11 +
 tcg/meson.build                               |    5 +
 tcg/mips64/tcg-target.c.inc                   |   11 +
 tcg/ppc64/tcg-target.c.inc                    |   11 +
 tcg/region.c                                  |   10 +-
 tcg/riscv64/tcg-target.c.inc                  |   11 +
 tcg/s390x/tcg-target.c.inc                    |   11 +
 tcg/sparc64/tcg-target.c.inc                  |   11 +
 tcg/tcg-op-ldst.c                             |    2 +-
 tcg/tcg.c                                     |   21 +-
 tcg/tci/tcg-target.c.inc                      |   11 +
 tcg/wasm64.c                                  |  861 +++++
 tcg/wasm64.h                                  |  117 +
 tcg/wasm64/tcg-target-con-set.h               |   19 +
 tcg/wasm64/tcg-target-con-str.h               |   14 +
 tcg/wasm64/tcg-target-has.h                   |   14 +
 tcg/wasm64/tcg-target-mo.h                    |   20 +
 tcg/wasm64/tcg-target-opc.h.inc               |   20 +
 tcg/wasm64/tcg-target.c.inc                   | 2853 +++++++++++++++++
 tcg/wasm64/tcg-target.h                       |   61 +
 tcg/x86_64/tcg-target.c.inc                   |   11 +
 .../dockerfiles/emsdk-wasm-cross.docker       |    2 +-
 33 files changed, 4204 insertions(+), 29 deletions(-)
 create mode 100644 scripts/run-emscripten.mjs
 create mode 100644 tcg/wasm64.c
 create mode 100644 tcg/wasm64.h
 create mode 100644 tcg/wasm64/tcg-target-con-set.h
 create mode 100644 tcg/wasm64/tcg-target-con-str.h
 create mode 100644 tcg/wasm64/tcg-target-has.h
 create mode 100644 tcg/wasm64/tcg-target-mo.h
 create mode 100644 tcg/wasm64/tcg-target-opc.h.inc
 create mode 100644 tcg/wasm64/tcg-target.c.inc
 create mode 100644 tcg/wasm64/tcg-target.h

-- 
2.43.0


