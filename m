Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp474955njc;
        Tue, 20 May 2025 05:52:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5628:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30e4dac971cmr31802215a91.2.1747745536028;
        Tue, 20 May 2025 05:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745536; cv=none;
        d=google.com; s=arc-20240605;
        b=Hw4LN3PGQftcbTL8W0IPSFiqY0wa05KvrTRG1wSfF/G3Ir7MwtkKUZ2bhsfR+cm4zV
         RStJDH1Du7Unmuu0o3IGd3OOuuVyi1Ce31UMuo7Td0yHWJNDweqixxsKHmI7HOa0K5T1
         e/SaOmhi2WkHMeVdB0oD2rT7aYuU8Y+YKlopVawnpzWY8h4L+MzmAZtbHGBsuViv7Xt2
         4m6z1PAgGAh3ZnCwKB6XdwpuYH1nIY8r3tCI44xuwgtJDGNUBWx+RZEOnn9JCSTRYJU8
         uarAfULDbMs6VR2dpcnaRdl6jDisob1AYEbuhaN6Kr2/7OGxZ81Kd/C+Um5+iHSpQt09
         Odcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6AOdg1AywyIl611ITWfSCCutnIjDg8eluRSR+NLR4ts=;
        fh=fak63leSdBu2dU3czJVz6xy0GPdHkwJlvxqBjFKFyFA=;
        b=EZtMVuC1zVQi8tFatortajJWQxlU3mfYtCzn6jIK0xFpKwsW2EvqbkUN6Z12lGs5sF
         w1SOv1TnpgsedVxPVjs/96H/kyJC2oWvvGBPZOMXcPnGm8YlPOqETDMM7PDwjjX52nrE
         C+/fvKnStQjD6tJl7+X7iVx+CBAS0H7kCH0QyjivuJGg1Lx0Z9AGpULsv7IdhvNkyI0Q
         pSXGRZc5XYHjsNQVnJ/pC+cNXPCG9YGL8mq6YzdvTadQ13f903qgYT2b+k8AJ1115lfD
         n6NtSMi8B+62PiaQYKE4I9ggPM36b5ZFz7+xdakTqVJOMT3zATWmW991HBLUmDeeK9bl
         o2ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jSSTZo1y;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26df3fc55bsor5816080a12.4.2025.05.20.05.52.15
        (Google Transport Security);
        Tue, 20 May 2025 05:52:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jSSTZo1y;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745535; x=1748350335; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AOdg1AywyIl611ITWfSCCutnIjDg8eluRSR+NLR4ts=;
        b=jSSTZo1yeCYVE/PS3j4Rp2Gh0e1Y+idzVVOPmAWJchW24fjCExVt6I1jAY9N8P6cRs
         qWUKkUbEjUhwLphW4rZt+d0t1oWT92QHhTCwwXBGeDsYoC/LZcI5LfJ5vOAarKEwV1Cp
         8RG5GDSEdiJ6jpbbkosUmdXcqoShvjRYwDFSgGi2fulgELeFkHiLBRsw8o/v/jeYLF61
         bi6lfRtiSIFotNPRgbZ6pX9KVCOJiXv4x1HOxOL972QPTGyC53A2bB88afwBS3/IMr9v
         LA0i7dcQ8o+k7/qZxKsFY5SsulRegXGcF7b3Jro3byzFi1OeRJtIOHa52uu2j/DJp/Af
         JN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745535; x=1748350335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AOdg1AywyIl611ITWfSCCutnIjDg8eluRSR+NLR4ts=;
        b=hH4aVcVSrJ+bzV/ENM1byyqsGBW6yWWoTmTyoY5X8As3+WlMX/UYF7fiyxzWxC8567
         brTAx/QMtKetBexhNIfs5wgyiNzobGezjY6ayz55cIlJP1du90EE2lVBZvmRGIFV6E8h
         1ITrXDv96cwPkxRQ7KSj2CVMxQl6N4PlRLmpxnYqcyUDgFO/MQ1+n17lrjx8X0nfNac0
         /K9jUKu97fWYmDJri408J16gikN9EBL8J1tz8NZV8N0a4MJfdSnMY+vP/69sNhrtr2AB
         8EBF0gjB9VLz4X0arbO7Ks+xqEeJN1sUKWZvFPJeMUX4jXy1AFVWGWzwa/pB7czXVXNk
         WuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61d2dQeAaM3DsvB+o9IpxP3l78SI4O3Ibw5ANVjLpIYxT4mtwvizc+0ARI5zHL69fB8xYc26hea6LelBOWduFLA==@linaro.org, AJvYcCWZk5YBO1VpKPdVsKVnV2G5K/THmd5XP7HE8wO9DKPebFoMLd4xwpRFT2NPB9msnZVRZYaN+bAY2mT8bHio8uYsT8o=@linaro.org, AJvYcCX/OXzAj9hRPGUAwdtWbNcgdXncjs41pSDwnknhsFUmxqvwQc27d4XkCGRr1h6RY0qBAWhampU=@linaro.org
X-Gm-Message-State: AOJu0YxX7LxTrEktU1XeLMZODFq5vDRlSOuDD+AvKrFB5mTN4MWfdXF6
	s76tJTrTkxUD8Tizw2ZWXOs5QPAhpWo/vLMqWgqXif49edobCeyPFsTX
X-Gm-Gg: ASbGncv3YvzGp+uKxWxIWuR2n0Gv/9GSrqSYc1mP4fyEW7SYJhG7Q24+mYRGGHBOmPS
	LKjxHwYlaxDJ5HrzXQZ/ep46n0R2C2ZSQjAxCdOJdiBBsaS0k7jtPfAfz3mNqUZiu2kwDUM0tT2
	AhdjXgO59bVYxlCie6k+VuIH2fjCEUJE+JdWJ8clQvU93hAnBeuCxq5DUB5L4qZnQ7W1eNp+EOc
	jWBnwtNPvuPrGsf7Nf7/bAQgQ4oAHljvLQRCQ8LaUqrkw6ryAcZWYqKqwCKI3CVMSEnCKmGj4dJ
	AeB8QFQcKlKqOcepJoMfp8oex/xiJIS9B5eCf8g+MNL8sG+ncgQ=
X-Google-Smtp-Source: AGHT+IHnHoG1pdY+DSlUAYQ+x5iFiPPLD8vIXKhLgYXpLwBJk0GbWd59nDqGjbHkpkx+fbgBr+HeZA==
X-Received: by 2002:a17:90b:2e85:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-30e7e770523mr21483641a91.14.1747745535218;
        Tue, 20 May 2025 05:52:15 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:52:14 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 00/33] tcg: Add WebAssembly backend
Date: Tue, 20 May 2025 21:51:02 +0900
Message-ID: <cover.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TPqB3XbLyFzS

This patch series is split from the original "Enable QEMU to run on
browsers" series, focusing solely on introducing a TCG backend for
WebAssembly. This implemention is based on the latest master which already
includes the essential changes required to compile QEMU (in 32bit TCI mode)
using Emscripten.

# New TCG Backend for Browsers

A new TCG backend translates IR instructions into Wasm instructions and runs
them using the browser's WebAssembly APIs (WebAssembly.Module and
WebAssembly.instantiate). To minimize compilation overhead and avoid hitting
the browser's limitation of the number of instances, this backend integrates
a forked TCI. TBs run on TCI by default, with frequently executed TBs
compiled into WebAssembly.

# Workaround for Running 64bit Guests

The current implementation uses Wasm's 32bit memory model. This series
explores supporting TCG 64bit instructions while relying on SoftMMU for
address translation. To enable 64bit guest support in Wasm today, it was
necessary to partially revert recent changes that removed support for 64bit
guests on 32bit hosts (e.g. commits a70af12addd9060fdf8f3dbd42b42e3072c3914f
and bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
Emscripten. The reverting is partial and addresses only pointer width
differences between hosts and guests since the Wasm backend supports 64bit
word operations. While this serves as a temporary workaround, a long-term
solution could involve migrating to Wasm's 64bit memory model once it gains
broader support, as it is currently not widely adopted (e.g. unsupported by
Safari and libffi).

# Overview of build process

This section provides an overview of the build process for compiling QEMU
using Emscripten. Full instructions are available in the sample
repository[1].

To compile QEMU with Emscripten, the following dependencies are required.
The emsdk-wasm32-cross.docker environment includes all necessary components
and can be used as the build environment:

- Emscripten SDK (emsdk) v3.1.50
- Libraries cross-compiled with Emscripten (refer to
  emsdk-wasm32-cross.docker for build steps)
  - GLib v2.84.0
  - zlib v1.3.1
  - libffi v3.4.7
  - Pixman v0.44.2

QEMU can be compiled using Emscripten's emconfigure and emmake, which
automatically set environment variables such as CC for targeting Emscripten.

emconfigure configure --static --disable-tools --target-list=x86_64-softmmu
emmake make -j$(nproc)

This process generates the following files:

- qemu-system-x86_64.js
- qemu-system-x86_64.wasm
- qemu-system-x86_64.worker.js

Guest images can be packaged using Emscripten's file_packager.py tool.
For example, if the images are stored in a directory named "pack", the
following command packages them, allowing QEMU to access them through
Emscripten's virtual filesystem:

/path/to/file_packager.py qemu-system-x86_64.data --preload pack > load.js

This process generates the following files:

- qemu-system-x86_64.data
- load.js

Emscripten allows passing arguments to the QEMU command via the Module
object in JavaScript:

Module['arguments'] = [
    '-nographic', '-m', '512M', '-accel', 'tcg,tb-size=500',
    '-L', 'pack/',
    '-drive', 'if=virtio,format=raw,file=pack/rootfs.bin',
    '-kernel', 'pack/bzImage',
    '-append', 'earlyprintk=ttyS0 console=ttyS0 root=/dev/vda loglevel=7',
];

The sample repository[1] provides a complete setup, including an HTML file
that implements a terminal UI.

[1] https://github.com/ktock/qemu-wasm-sample

# Additional references

- A talk at FOSDEM 2025:
  https://fosdem.org/2025/schedule/event/fosdem-2025-6290-running-qemu-inside-browser/
- Demo page on GitHub Pages: https://ktock.github.io/qemu-wasm-demo/

Kohei Tokunaga (33):
  tcg: Fork TCI for wasm32 backend
  tcg/wasm32: Do not use TCI disassembler in Wasm backend
  meson: Enable to build wasm backend
  tcg/wasm32: Set TCG_TARGET_INSN_UNIT_SIZE to 1
  tcg/wasm32: Add and/or/xor instructions
  tcg/wasm32: Add add/sub/mul instructions
  tcg/wasm32: Add shl/shr/sar instructions
  tcg/wasm32: Add setcond/negsetcond/movcond instructions
  tcg/wasm32: Add deposit/sextract/extract instrcutions
  tcg/wasm32: Add load and store instructions
  tcg/wasm32: Add mov/movi instructions
  tcg/wasm32: Add ext instructions
  tcg/wasm32: Add bswap instructions
  tcg/wasm32: Add rem/div instructions
  tcg/wasm32: Add andc/orc/eqv/nand/nor instructions
  tcg/wasm32: Add neg/not/ctpop instructions
  tcg/wasm32: Add rot/clz/ctz instructions
  tcg/wasm32: Add addc/subb instructions
  tcg/wasm32: Add br/brcond instructions
  tcg/wasm32: Add exit_tb/goto_tb/goto_ptr instructions
  tcg/wasm32: Add call instruction
  tcg/wasm32: Add qemu_ld/qemu_st instructions
  include/exec: Allow using 64bit guest addresses on emscripten
  tcg/wasm32: Set TCG_TARGET_REG_BITS to 64
  tcg/wasm32: Set mulu2/muls2 as unimplemented
  tcg/wasm32: Add initialization of fundamental registers
  tcg/wasm32: Write wasm binary to TB
  tcg/wasm32: Implement instantiation of Wasm binary
  tcg/wasm32: Allow Asyncify unwinding from TB
  tcg/wasm32: Enable instantiation of TBs executed many times
  tcg/wasm32: Enable TLB lookup
  meson: Propagate optimization flag for linking on Emscripten
  .gitlab-ci.d: build wasm backend in CI

 .gitlab-ci.d/buildtest.yml       |    2 +-
 MAINTAINERS                      |    7 +
 accel/tcg/cputlb.c               |    8 +-
 include/accel/tcg/getpc.h        |    2 +-
 include/exec/helper-head.h.inc   |    6 +
 include/exec/tlb-common.h        |   14 +-
 include/exec/vaddr.h             |   11 +
 include/qemu/atomic.h            |    4 +
 include/tcg/helper-info.h        |    4 +-
 include/tcg/tcg.h                |    6 +-
 meson.build                      |   16 +-
 tcg/aarch64/tcg-target.c.inc     |   11 +
 tcg/arm/tcg-target.c.inc         |   11 +
 tcg/i386/tcg-target.c.inc        |   11 +
 tcg/loongarch64/tcg-target.c.inc |   11 +
 tcg/meson.build                  |    5 +
 tcg/mips/tcg-target.c.inc        |   11 +
 tcg/ppc/tcg-target.c.inc         |   11 +
 tcg/region.c                     |   10 +-
 tcg/riscv/tcg-target.c.inc       |   11 +
 tcg/s390x/tcg-target.c.inc       |   11 +
 tcg/sparc64/tcg-target.c.inc     |   11 +
 tcg/tcg.c                        |   23 +-
 tcg/tci/tcg-target.c.inc         |   11 +
 tcg/wasm32.c                     | 1096 ++++++++
 tcg/wasm32.h                     |  119 +
 tcg/wasm32/tcg-target-con-set.h  |   21 +
 tcg/wasm32/tcg-target-con-str.h  |   11 +
 tcg/wasm32/tcg-target-has.h      |   22 +
 tcg/wasm32/tcg-target-mo.h       |   17 +
 tcg/wasm32/tcg-target-opc.h.inc  |   15 +
 tcg/wasm32/tcg-target-reg-bits.h |   12 +
 tcg/wasm32/tcg-target.c.inc      | 3985 ++++++++++++++++++++++++++++++
 tcg/wasm32/tcg-target.h          |   76 +
 34 files changed, 5569 insertions(+), 33 deletions(-)
 create mode 100644 tcg/wasm32.c
 create mode 100644 tcg/wasm32.h
 create mode 100644 tcg/wasm32/tcg-target-con-set.h
 create mode 100644 tcg/wasm32/tcg-target-con-str.h
 create mode 100644 tcg/wasm32/tcg-target-has.h
 create mode 100644 tcg/wasm32/tcg-target-mo.h
 create mode 100644 tcg/wasm32/tcg-target-opc.h.inc
 create mode 100644 tcg/wasm32/tcg-target-reg-bits.h
 create mode 100644 tcg/wasm32/tcg-target.c.inc
 create mode 100644 tcg/wasm32/tcg-target.h

-- 
2.43.0
