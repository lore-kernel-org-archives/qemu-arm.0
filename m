Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178560njc;
        Wed, 16 Apr 2025 01:15:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1145:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-73c267003b0mr1288839b3a.9.1744791304612;
        Wed, 16 Apr 2025 01:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791304; cv=none;
        d=google.com; s=arc-20240605;
        b=RzeXNj5FMdltGXjRUukCRanCZJzgV41boiz32GdH4fxlX9Fyu32Kyot8PkzsituPPC
         8EqpNH642obXKtjAtmgCq1AfqIGwLE3Kptp7W5c+eYkyrXWQNz/Qec4Fd1ECAnxzOv6t
         3zwJoIem6ZDclIqIxoNQk9QVbTfx9mzQPSkVfSiNofSD6hOcsRWDWHLOVOmRweUr9rRE
         YRgvpUuwWi+ppyZozKLC9GTSH5yWjVfDbdTXNo74fjTcv8VeyC1rYDBB26qRKVoiYz4K
         zis1jdfS/Iw1SXMOtRRy06Sr9EKSMPd/6uTtetL62gsQbJZEJAFAmBn5DB8SpPYdogfE
         zA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ING2HGFiKOFyUXL5i8qkzkYCFauLgKvXn4yhvf3BVL0=;
        fh=LB6rcSuvGViFM9TJlOaqaRMFPZj0eohhySQem0Uv+L8=;
        b=XyYbNt82NYZyo+1/xyqBynB0z7ruHT4AsuRgZ0uahrUVSeRyqs65WqztVdzpsnS2Fo
         eBx7omR5c1a77TYCzuaHUGgcJAzDXTe9gZ/f7+npEYQT+k2MCz9hXV/ekw+3fUOpQtu2
         fOB4BQy8BMcW0FAvk4eCRqsSpSKHC+fqHZ4hd/SRoU9Kh/cf0AcM0gAX3TEwSp15wEcM
         xzQlqKOBQOZnxeBhzrMVQQAf17s6z25Y2Vv59seujzJ35rMX/Pm6wA8UUlsH7wRUkCA2
         CeH7cbiP8wyxAS3uvqpEbmj4kwMjB4my3vkB+T5wvljfkGZQx1eK57HIzAWbgxnXgWv/
         UV0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="JhlDpkS/";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1e60df9sor12551809b3a.7.2025.04.16.01.15.04
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="JhlDpkS/";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791304; x=1745396104; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ING2HGFiKOFyUXL5i8qkzkYCFauLgKvXn4yhvf3BVL0=;
        b=JhlDpkS/29wjNdxXGQpPDZyL4yoWA9XHLZ/5UZTb8mNegO2Tmg9tMVDk0t7pm4kBYq
         v25gq5PQJF6nr6uAcEe/OskzAmqZIvBSYiSjo2IloCiNoXOtA/M9XJqRWFTEeJvFA8Ve
         Rjr163eDmK1KFw5l4MhHegsSNp7MqkHLxxIEGbGDgDFUkAjjd8EJyanaiOosfKs34RbV
         SL0djJw2mpE03we7oQYmtemBtZJYqsXXjlE8Ed2nTdB1Gzcr1pD+HJ5bzxQGlNGv0PGf
         iimB602iu2zH8/n25dfM6qwLPszyjOpbTghcAYAP4krtJJom+1SFUEWgnnrJxXLTtCln
         VNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791304; x=1745396104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ING2HGFiKOFyUXL5i8qkzkYCFauLgKvXn4yhvf3BVL0=;
        b=iCP+lrZk6VJ64IdipopFnUzH8Ql1RXIjNrRsBx9FbDKmm7gO8t2gvKFFskPYC1yTm+
         FjsdqANtc3eIeeDf2VQjo/TpaFtVPDiPF+x4N56NgFRWZGJPECQF5mdoc2VOH9+W8Cmq
         QeeQXF5pHYSH2juU156CJegWXoL3XEyfl7NqsHxMc4fXRxKkTXYHleyi+a7zX7O55zav
         xNH1i7Vdy14N8jeOyV+G78ZNHTwJRCYZzxv43Qh3Wr3buP4ks2zEIbf658dZuQiiJD5d
         LfCGTw/nVff31f5flb4Xzk5XmrPnupqkcx6tZ5Z8vaM06YkODkTBuwjmAVNDs2EdNpjr
         AOfw==
X-Forwarded-Encrypted: i=1; AJvYcCU3LFRoPhpCC4CpFRwkgJMO/6WqrtsY2DsZXhsufUGab3M65HxD9CNb/C4yIeRyYyDkpoVv9a26A1rzYwhJ23duwq0=@linaro.org, AJvYcCW+rSC2u0AHwU2KHD+Jo6NFwhXxD+n3h6C9gH7KTbGjLx6M54oJRmIawwwzn7Ge55dbdZZmLO92@linaro.org, AJvYcCWT3BsK/510rMMIZKY6Ym6de/Bn0cNqXEPC2+hQl4jprukGKqgxabAOTruyRq+ceJYv2meZtLm1mTWzZh8g@linaro.org, AJvYcCXsNDfJ7PPAKj+Uw0oB3ggBMCWGPmk7L5Stcq/jiV3H7x/U79gX/qd6EEkENX3QhGHEYb5xsAjL66b/w9Ivsp+8Qw==@linaro.org
X-Gm-Message-State: AOJu0YzsYcaFyIH4roQRk9UWnWmV0PxLglL7R7F89rA3u90dB/Ow/bxy
	iem0recaHkSNsB/e6aUSgX6+DwYN+g93Bkb7xZ8P1efpxoKNVjQs+VyZOUGB
X-Gm-Gg: ASbGncvyRHT29ykvwMgRAwCUaOrIRDFfsf2XyGcBvZpQqUvMihMs5eVk8Fsvze77MbJ
	5D0Sp0RTdKj7IHsi+qkOqfvsyfobvFRTYSy9hVAq2GFdF5DZqF/Gvzvf8ea6M/HtvpGt84roW4f
	EpLIPYp21P4hzf+4EZT/ivZhid8oacywQXY4daUCmDXpTgHurV2QE2h3pjTUvaN+HYprxzdS0p9
	SlWC4qSuuhZzKcSwO3cxgUbz1OfD4GsSaqoZsfHkpdaXQcKvACEiqEXM4Y5ebOY6ZTGoiYQZG4a
	RKRV8FwItNSZWyNsQfcdCI6GOeVPUXuflGwXg/TTk40Kn97cXk1Uq4BFrA==
X-Google-Smtp-Source: AGHT+IHAV4QzikLGi7SxmNgM9JTe3jUohlZ1WDwKBrs6Ev2Pjp40RsFBYFABVCha2SjKF/HNz2SXUA==
X-Received: by 2002:a05:6a00:801b:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73c266beee1mr1612181b3a.3.1744791303785;
        Wed, 16 Apr 2025 01:15:03 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:03 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 00/19] Enable QEMU TCI to run 32bit guests on browsers
Date: Wed, 16 Apr 2025 17:14:05 +0900
Message-Id: <cover.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HAlySTP2Zmym

This patch series is split from the original "Enable QEMU to run on
browsers" series, focusing solely on the essential code changes needed to
compile QEMU TCI with Emscripten. It also inclues fixes based on feedback
received in the original series, thank you for the comments.

# Supported features in this series

This patch series enables TCI interpreter mode with 32bit guest
support. While the original series included the non-TCI backend and 9pfs
patches, those components are not included here. They will be reintroduced
in follow-up series after the foundational patches have been merged.

# Emscripten-Based Coroutine Backend

Emscripten does not support couroutine methods currently used by QEMU but
provides a coroutine implementation called "fiber". This patch series
introduces a coroutine backend using fiber. However, fiber does not support
submitting coroutines to other threads. As a result, this patch series
doesn't support components like hw/9pfs, which rely on that behavior.

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

emconfigure configure --static --disable-tools \
                      --target-list=arm-softmmu --enable-tcg-interpreter
emmake make -j$(nproc)

This process generates the following files:

- qemu-system-arm.js
- qemu-system-arm.wasm
- qemu-system-arm.worker.js

Guest images can be packaged using Emscripten's file_packager.py tool.
For example, if the images are stored in a directory named "pack", the
following command packages them, allowing QEMU to access them through
Emscripten's virtual filesystem:

/path/to/file_packager.py qemu-system-arm.data --preload pack > load.js

This process generates the following files:

- qemu-system-arm.data
- load.js

Emscripten allows passing arguments to the QEMU command via the Module
object in JavaScript:

Module['arguments'] = [
    '-nographic', '-m', '512M', '-machine', 'virt',
    '-L', 'pack/',
    '-global', 'virtio-mmio.force-legacy=false',
    '-device', 'virtio-blk-device,drive=d0',
    '-drive', 'file=pack/rootfs.bin,if=none,format=raw,id=d0',
    '-kernel', 'pack/kernel.img',
    '-append', 'console=ttyAMA0 root=/dev/vda loglevel=7',
];

The sample repository[1] provides a complete setup, including an HTML file
that implements a terminal UI.

[1] https://github.com/ktock/qemu-wasm-sample/tree/tcidev

# Additional references

- Original patch series "Enable QEMU to run on browsers":
  https://patchew.org/QEMU/cover.1744032780.git.ktokunaga.mail@gmail.com/
- A talk at FOSDEM 2025:
  https://fosdem.org/2025/schedule/event/fosdem-2025-6290-running-qemu-inside-browser/

Kohei Tokunaga (19):
  hw/core/loader.c: Fix type conflict of GLib function pointers
  qom/object.c: Fix type conflict of GLib function pointers
  system/vl.c: Fix type conflict of GLib function pointers
  target/arm/helper.c: Fix type conflict of GLib function pointers
  target/i386/cpu.c: Fix type conflict of GLib function pointers
  contrib/plugins: Fix type conflict of GLib function pointers
  hw/net/can: Fix type conflict of GLib function pointers
  target/ppc: Fix type conflict of GLib function pointers
  target/s390x: Fix type conflict of GLib function pointers
  include/glib-compat.h: Poison g_list_sort and g_slist_sort
  util/cacheflush.c: Update cache flushing mechanism for Emscripten
  block: Update block to compile with Emscripten
  include/qemu/osdep.h: Add Emscripten-specific OS dependencies
  Disable options unsupported on Emscripten
  util/mmap-alloc: Add qemu_ram_mmap implementation for emscripten
  util: Add coroutine backend for emscripten
  meson: Add wasm build in build scripts
  gitlab: Enable CI for wasm build
  MAINTAINERS: Update MAINTAINERS file for wasm-related files

 .gitlab-ci.d/buildtest-template.yml           |  27 ++++
 .gitlab-ci.d/buildtest.yml                    |   9 ++
 .gitlab-ci.d/container-cross.yml              |   5 +
 MAINTAINERS                                   |  10 ++
 block/file-posix.c                            |   6 +
 configs/meson/emscripten.txt                  |   8 +
 configure                                     |   7 +
 contrib/plugins/cache.c                       |  12 +-
 contrib/plugins/cflow.c                       |  10 +-
 contrib/plugins/hotblocks.c                   |   4 +-
 contrib/plugins/hotpages.c                    |   4 +-
 contrib/plugins/howvec.c                      |   4 +-
 contrib/plugins/hwprofile.c                   |   8 +-
 hw/core/loader.c                              |   4 +-
 hw/net/can/xlnx-versal-canfd.c                |   4 +-
 include/glib-compat.h                         |   6 +
 include/qemu/cacheflush.h                     |   3 +-
 include/qemu/osdep.h                          |   8 +-
 include/system/os-posix.h                     |   3 +-
 include/system/os-wasm.h                      | 105 +++++++++++++
 meson.build                                   |  25 ++-
 meson_options.txt                             |   2 +-
 os-wasm.c                                     | 119 ++++++++++++++
 qemu-options.hx                               |   4 +-
 qom/object.c                                  |   7 +-
 scripts/meson-buildoptions.sh                 |   2 +-
 stubs/emscripten.c                            |  13 ++
 stubs/meson.build                             |   4 +
 system/vl.c                                   |   8 +-
 target/arm/helper.c                           |   4 +-
 target/i386/cpu.c                             |  11 +-
 target/ppc/cpu_init.c                         |   4 +-
 target/s390x/cpu_models.c                     |   4 +-
 .../dockerfiles/emsdk-wasm32-cross.docker     | 145 ++++++++++++++++++
 tests/tcg/plugins/mem.c                       |   4 +-
 tests/tcg/plugins/syscall.c                   |   4 +-
 util/cacheflush.c                             |   3 +-
 util/coroutine-wasm.c                         | 127 +++++++++++++++
 util/mmap-alloc.c                             |  18 +++
 39 files changed, 697 insertions(+), 58 deletions(-)
 create mode 100644 configs/meson/emscripten.txt
 create mode 100644 include/system/os-wasm.h
 create mode 100644 os-wasm.c
 create mode 100644 stubs/emscripten.c
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker
 create mode 100644 util/coroutine-wasm.c

-- 
2.25.1
