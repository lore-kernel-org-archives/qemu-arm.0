Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136481njd;
        Mon, 21 Apr 2025 22:28:04 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:224:2384:5b40 with SMTP id d9443c01a7336-22c535a7e46mr256364725ad.24.1745299684553;
        Mon, 21 Apr 2025 22:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299684; cv=none;
        d=google.com; s=arc-20240605;
        b=cTsS3vUXH/U8q0cZnsTQ+e/eixLW/S9cLfd5g+T3TkSc6CZy1sTNp33zjyw68wJGfd
         ZcT/amf87ZMDKFTGRGktJP9fEIxzF20eiL7KNqrYHUHRueIEd+ZZQRDfVjrrckjeOAUz
         I4GssVwxe9LEYOJrthxkWy+Vvku0tGgRrjFTWSlyV54z3pgnOmxlYz5oz1PnwPjLujqQ
         WXcTnBdDihY7CJ02TcIXr5IBSABUJ6VVtjZgH6DrchX4/9/WnLn2KMmock88T8EjC+GL
         mY1s21y/Qr94y/BwdnHZMYncx7zZHcS+NxDBYOYSmmyaWuzPdNer0zFYq9jKP4CL2jfP
         wqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LlssLeV8PwZvAQFxPCo+Tq04KcXHAkZ9FCrXDlrN+HU=;
        fh=gywMlq4F+eGA3pswPOqLzkynKvvr+6q2mhCEYV7crZQ=;
        b=UYhjx95EqU7eskPlS1O2IZeerqVIrRrNR+SF46vjWpvmxiB7Km6QtoAgDXi+SnSf1V
         sktm+86cq4zC8oxj+Sri9CUeUTu3U/RlNHjku1NnLLIX+pdzlUHQbMoeYxGpoaUVm9Sg
         t7NvQ6rb0HnVEJcq8INKuHwQ/RIgb1M6HO1COlV7HCnHU7ECpebqUiRZcWLdO9BOtocC
         a1X6H+fUYnsi6DMNAaOiqGdBATP8p2znp4s1ll7+KdMQj5ew9K9pEIx0NvfeKpa6T0+g
         VcXdyRH8UyAZglBL7ichdQuO3g41l89TBu6K4mxaWAH5lWWI6uAh2aT1ec7DoNivpSML
         Rsvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AryCCU8h;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d995a5sor52423825ad.16.2025.04.21.22.28.04
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AryCCU8h;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299684; x=1745904484; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LlssLeV8PwZvAQFxPCo+Tq04KcXHAkZ9FCrXDlrN+HU=;
        b=AryCCU8hH0ifAEustRAXm2zBqWfFWX5UuaSYt7wMcA+6l0QcO7nrzpfbAASLxFnEd4
         lVwCEr9mgy3Yr0iUDSaU7F27IaxGwGHq9jdHH19TEVLNawQ2ccMHl46IwnSRgNE2JTWl
         D8McL6ivwI7pTi27ioO45tLS6DQyB9hWCJKzKadOWbTWUwvKHNUxem8LXtibwngei6pW
         sY3m9mIPjRK74U4PrCnZdLzeNKGGGEAtS9AOkz6g5F4wnaBteQtda44orUltduPx3bqR
         26msXXkASOJzPyopjWF3EGwG7DMdgIfXi9Eco6HhrSe9hjCNkpnoLqWdk9chwunzpDqb
         wGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299684; x=1745904484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlssLeV8PwZvAQFxPCo+Tq04KcXHAkZ9FCrXDlrN+HU=;
        b=T0nZD4iHTWuoWZudg7Fd6hs1lEO1RCBUqNU7uG2a2bh6CV7ITp1vcxqGrVpoV9m6bO
         UQhU8bwTW0K89E+VRqCZF5Ihx6mu0UhNXr5OFgLNhdNASGjj7Ljsw2+AlUQbH8nUHX0d
         yA8X9uJEhxALnaK7nf0Hb1DVuterxxuo9sfKkvvsOUrMHUZV+L6yN55L73xUhU6iXDR2
         lW4apIy8kWoxPBY8bEws7SZsNre2ubeJBIZ6jn0TO3+665i0FsaS5dDeuWQ8rGFCCGq6
         uzRV3ADAwrAUQqMC/osqdllkj8qy2DgTqC596IG00ACMw4cdYONUGP37gS761EwSDcWB
         9tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5SCqC/uM67YWNQV8yxo0aO9Z54rzrJReE85xIDOk7QMvUxFPXTJ77lyfjtSuWvHdT8Z9ZXW0XJ/04h2woQfq0JBM=@linaro.org, AJvYcCUJCiAbMs3n9Xii6u1UnM9hk2q5rchdpvCPLVIZncdMp8rIC/K63qQBSo5fLprn+8Lj1jNFS3Xhdo4ulNydTdvZIg==@linaro.org, AJvYcCUrVntlbUE7NLY6sUold+3oKSPz3tfkETYhTCvKx+VoNZMygsc/5zbiuQuA6s/w+bGlF2eFcbHF@linaro.org, AJvYcCWVffVct4Zu83wprhDScYUQ97HbeEXmYYvI8LU/R48fBbSmM5FznbY3gj/qV4PXdvAlNW7+0EEgnZ16WFAA@linaro.org
X-Gm-Message-State: AOJu0Ywl0V3HrJtnxLCbQnh2arNi41pwrzEjLIraagBK2sTEm97GFw77
	j8n4eY2t/EMY2ZJEiK+kFXY0nog3Hrgm2zk+uJ02BBSZSraCRty3
X-Gm-Gg: ASbGnctlvbVDW4MRAuP3G3QWAglIteq0k1HuVg9FFbfJarMM7bVYkLelZ4Q4xZl2V5E
	W+ERFk8pufB1qy+eGNn0YL7ZPtZqJyCS+URIYt+uAgR7rMnJa6mdPWX74LZy2S8oQpOsSYPN5Px
	cTa1/Rjqd5MwmOOZBAvWjpNinaxgGjmisRxX54w8hJQFTSDNURGYtdff3GsA4U4xfsfySrGdH9p
	q+AujKaJ3wPQBIzovHisepuft0EnrZ+qel3hn5uT3q8QLbwpmogCBQb+esgkfDJfs6O/r/Ix5ZB
	tgumT1Khv82vtBypvjgDbvBrXmNgLRpxL7WxInCdv7fQ9qotvIjAuyovGXs=
X-Google-Smtp-Source: AGHT+IHud7/aqNVHqUlvMR9p9zobEuKDbwSSH92PhK7xD8g7kXzvl6OyVxAU7dXMRh4D5ulA2ZsBwg==
X-Received: by 2002:a17:903:320e:b0:22c:33b2:e410 with SMTP id d9443c01a7336-22c53379f1emr210419905ad.2.1745299683567;
        Mon, 21 Apr 2025 22:28:03 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:02 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 00/20] Enable QEMU TCI to run 32bit guests on browsers
Date: Tue, 22 Apr 2025 14:27:04 +0900
Message-Id: <cover.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ta1gVLhqR107

V2:

- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.
- Fixed typo in the comment in include/glib-compat.h: s/insted/instead/
- In util/cacheflush.c patch, added an explanation for the change to both
  the code comment and the commit message.
- Split the block/file-posix.c hunk that adds "#include <sys/ioctl.h>" into
  a separate commit and revised the commit message to clarify the purpose of
  the patch.
- Removed the Emscripten-specific stub of copy_file_range in
  stubs/emscripten.c. Instead, updated the type of the existing
  copy_file_range stub in block/file-posix.c to match the declaration in the
  Emscripten headers and avoid a compilation error.
- Moved the change that was incorrectly applied to os-posix.h into os-wasm.h
- Split MAINTAINERS file change to each commit that adds new files.
- Unified two consecutive #ifndef macros into a single condition in
  qemu-options.hx.
- Instead of porting mmap-alloc.c to Emscripten, this version excludes the
  file entirely. The rationale is described in the commit message.
- In meson.build, added a check to ensure TCI is enabled for the wasm build.
- Split the Dockerfile addition from the previous 18th patch into a separate
  commit.

V1:

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

Kohei Tokunaga (20):
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
  block: Add including of ioctl header for Emscripten build
  block: Fix type confict of the copy_file_range stub
  include/qemu/osdep.h: Add Emscripten-specific OS dependencies
  Disable options unsupported on Emscripten
  util: exclude mmap-alloc.c from compilation target on Emscripten
  util: Add coroutine backend for emscripten
  meson: Add wasm build in build scripts
  tests: Add Dockerfile containing dependencies for Emscripten build
  gitlab: Enable CI for wasm build

 .gitlab-ci.d/buildtest-template.yml           |  27 ++++
 .gitlab-ci.d/buildtest.yml                    |   9 ++
 .gitlab-ci.d/container-cross.yml              |   5 +
 MAINTAINERS                                   |   9 ++
 backends/meson.build                          |   6 +-
 block/file-posix.c                            |   8 +-
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
 include/qemu/cacheflush.h                     |   7 +
 include/qemu/osdep.h                          |   8 +-
 include/system/os-wasm.h                      | 104 +++++++++++++
 meson.build                                   |  29 +++-
 meson_options.txt                             |   2 +-
 os-wasm.c                                     | 119 ++++++++++++++
 qemu-options.hx                               |   4 +-
 qom/object.c                                  |   7 +-
 scripts/meson-buildoptions.sh                 |   2 +-
 system/memory.c                               |   2 +-
 system/physmem.c                              |   9 +-
 system/vl.c                                   |   8 +-
 target/arm/helper.c                           |   4 +-
 target/i386/cpu.c                             |  11 +-
 target/ppc/cpu_init.c                         |   4 +-
 target/s390x/cpu_models.c                     |   4 +-
 .../dockerfiles/emsdk-wasm32-cross.docker     | 145 ++++++++++++++++++
 tests/tcg/plugins/mem.c                       |   4 +-
 tests/tcg/plugins/syscall.c                   |   4 +-
 util/cacheflush.c                             |   4 +
 util/coroutine-wasm.c                         | 127 +++++++++++++++
 util/meson.build                              |   4 +-
 util/oslib-posix.c                            |  28 ++++
 40 files changed, 709 insertions(+), 66 deletions(-)
 create mode 100644 configs/meson/emscripten.txt
 create mode 100644 include/system/os-wasm.h
 create mode 100644 os-wasm.c
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker
 create mode 100644 util/coroutine-wasm.c

-- 
2.25.1
