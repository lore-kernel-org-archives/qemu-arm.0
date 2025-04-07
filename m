Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6425691njd;
        Mon, 7 Apr 2025 07:46:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d2:b0:736:3979:369e with SMTP id d2e1a72fcca58-739e6ff6b1bmr15523324b3a.9.1744037213135;
        Mon, 07 Apr 2025 07:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037213; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1fpHDN7T2jASqqWJcY/v+nQaKsnJjZ5tCfdPLf5U1Jy3VsIZv/nmXZtKmKL2HXKCz
         qDvGgeZwpA4FrcR83BGwyn5CrHGpuR6/yhvbA5/o94cCPJc2rDF+ZLXhj4TsFYVs6VCl
         QhK9T5RA9SDV8hV+xqBI3TPcs2VNLLw2Ih04huRW//HMr9rZQfbkkuxWUG4NGlvL9jut
         /6z9OFudH1QlDvrNNHug0FwO8jFMx8iSCJxdA17Y4REAx1oAF66ErwunLuJdFh4MRW0E
         v5xdrd5PgSNBS0sLn+c5EgjnD5sSuNW304BYSdh3ryZ0JLNN34ATa8Y5D2tmipQ1rLEc
         tzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=7LIdU2kK//yLHKRwtXpESmYMpQAS4hvFafVc/W+LxT4=;
        fh=FTpKWhLy2b7hhdXjvTv6EJ9JyvYQuF8I6RCIZcnoSuA=;
        b=hSjJ1pUlJO2RwcBpvDWtJPB9jsn9O3iRTq1fuCNe4DuQgj8++EHRflKlHo+Z2s90Ry
         kq36F0E2LNg7o3ZOmLoeL+gTaQH8tN/rVYps829tmVsEpKjG8iUgRrHGK8iUo6sBIEVz
         sqRS7dnpasyKc1gRzm3Kx9I/hbRokdzDpQd524B6CpK7xhDN9AntcBatt+jIEqYc0pKa
         4pkSVG2qeAxErM6hd5zFG4FrTJWTFAVIdXUFIPPMVBjsqQLe6sK1xZq4l/EduVACt/CJ
         X3ypQeu6u3rK9mk8+D0OpG8kcjSDLfgDeApEyQaqdAYXCjKgdcuRodvT98yv2PagXpJ3
         q1fA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GQqAAllA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739dac2bd09sor5073299b3a.2.2025.04.07.07.46.51
        (Google Transport Security);
        Mon, 07 Apr 2025 07:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GQqAAllA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037211; x=1744642011; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LIdU2kK//yLHKRwtXpESmYMpQAS4hvFafVc/W+LxT4=;
        b=GQqAAllA4z2tToRQ6jarsCvtTyWvzvHx+dbpFeuWvO79QoyJSW2SVSm7DpzZ/XLZ9k
         RG8ZN+7Dq5vt/+jgKfS7p3I1XBES+LVc/rAy/ckHKo/Fcy5EYh5WBcHLcH3NxoDLBrjj
         NucoHmX6dJxyWD7DwcBp+25CM83UsuGJ3Bk+CYFw8lMjy63Z7aFrCqh3EYyeypdKgTF1
         mUJ5WrX8w2HwsgpogtQpijv+boWiMaW4DnukuxGeu5PmRIX4v1UxMrcSiC0qBX54JSQU
         j+rSrSHTIRJN9EGz/YkXfwdxzDyxYBR3GoxIm+fyb74ChlaN9zsanN95rKSjvq09ufR2
         X1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037211; x=1744642011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LIdU2kK//yLHKRwtXpESmYMpQAS4hvFafVc/W+LxT4=;
        b=shQ9ZSaQBwZ1L4hseDyj5oRvsQBVq4j3ql99IcDXxWnHu/+xqOOzgS6/XjL7IoJGwb
         BAmunCrWXzwQAWhSJggMfD3BeJU3L0T58qkuMkp6nfO578K5SGt8kTdc5zC8MXhn3RL+
         9msUe7ugSWtiKcqBxQzKUV0ACcYUTTGx7GgvU0gVowTupVStFOtwMO+Q9UrlMvi7n+IL
         uWfwUtsSO3RMEYlIFyECoaH/3KOB79e4eMoNyenbWRfgsgRH6ffqsw2ODOJi6SR44Cro
         /duX8hNCWTEnGqaXJpn0t++TcRTpNWYOIEps2rChiqKdb6XNIVVZESnN2i6awHEhtXPK
         Qk/g==
X-Forwarded-Encrypted: i=1; AJvYcCUV7DnpIXCC2rHlCuVy6g5g4PBRsyxhxJk0VCFOusA19x0ldVljTx7Sq48HWaYeWvoCtswuLtiVljbS53u/PdtxlgI=@linaro.org, AJvYcCVHaYT4TWtv9YDrpdMSRUlwu+/D0SzKnOSnfB6xy7MJs5UHJDVXqk5BGQG1JDxWdvCo6xsdCFFcLeF6K9st@linaro.org, AJvYcCXi6L+YkAMvD/bUw5p38peHsSmTPS9YcPl+OFqS6R8JlvyLClsV34oV3I+zvp+fWtBGJu3MEy2T@linaro.org
X-Gm-Message-State: AOJu0YykTyz3lAUf7FGJJnwyggtDQ4oVzWNiBAdfKCjhZcLBqfPpLFl6
	Wt+Wp8HWoCZZaMUVWt9yJE0NNcumD3/M0ilEVdfh3ysq9RI+eunjcWgO+tdM
X-Gm-Gg: ASbGncto/kUVck1DeSzW0wZVZSModCuzcMnIzgnHIBiObgtW8/+UgrHRC/3xKtDggHs
	aG9fXeR/V5GAfGqm0VIZNywfYbTWJ2tvbsqMVSFi5poVuUZJ2FD/z6D3/lFfHCqYfHBWSXr+HEN
	7eT8z/azAtmEpEFCyPcLEYoZ1ZgxT5aJoc2S1FDbQ4vxMN0hYE2F0rOmgHoqrrhox1pZG0Mfrp7
	zhbsgjbqdf+3hjzVFHVUVzhDPPgLfsRT7n3hGQDlA5oNeHKWjXPSO54hT4LWGRc2jaZvZV+hvSk
	3M0dUJ4wBs8xvp7RHvxwOYE11pyko+BPaoVO2c2+kDtn8NSWswsioEKBwNPxtQ==
X-Google-Smtp-Source: AGHT+IGOpMd+zixBjwH+ZUX9bocsp8GVd//iJoCVWf/G57iHw/hiumEIqHCi5j6XW6VB9vzy8CNMlQ==
X-Received: by 2002:a05:6a00:18a1:b0:736:4a5b:7f08 with SMTP id d2e1a72fcca58-739e716248amr14323576b3a.22.1744037210463;
        Mon, 07 Apr 2025 07:46:50 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:46:49 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 00/10] Enable QEMU to run on browsers
Date: Mon,  7 Apr 2025 23:45:51 +0900
Message-Id: <cover.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6qKqmgovsLmm

This patch series enables QEMU's system emulator to run in a browser using
Emscripten.
It includes implementations and workarounds to address browser environment
limitations, as shown in the following.

# New TCG Backend for Browsers

A new TCG backend translates IR instructions into Wasm instructions and runs
them using the browser's WebAssembly APIs (WebAssembly.Module and
WebAssembly.instantiate). To minimize compilation overhead and avoid hitting
the browser's limitation of the number of instances, this backend integrates
a forked TCI. TBs run on TCI by default, with frequently executed TBs
compiled into WebAssembly.

# Workaround for Running 64-bit Guests

The current implementation uses Wasm's 32-bit memory model, even though Wasm
supports 64-bit variables and instructions. This patch explores implementing
TCG 64-bit instructions while leveraging SoftMMU for address translation. To
enable 64-bit guest support in Wasm today, it was necessary to partially
revert recent changes that removed support for different pointer widths
between the host and guest (e.g., commits
a70af12addd9060fdf8f3dbd42b42e3072c3914f and
bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
Emscripten. While this serves as a temporary workaround, a long-term
solution could involve adopting Wasm's 64-bit memory model once it gains
broader support, as it is currently not widely adopted (e.g., unsupported by
Safari and libffi). Feedback and suggestions on this approach are welcome.

# Emscripten-Based Coroutine Backend

Emscripten does not support couroutine methods currently used by QEMU but
provides a coroutine implementation called "fiber". This patch series
introduces a coroutine backend using fiber. However, fiber does not support
submitting coroutines to other threads. So this patch series modifies
hw/9pfs/coth.h to disable this behavior when compiled with Emscripten.

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

Kohei Tokunaga (10):
  various: Fix type conflict of GLib function pointers
  various: Define macros for dependencies on emscripten
  util/mmap-alloc: Add qemu_ram_mmap implementation for emscripten
  util: Add coroutine backend for emscripten
  meson: Add wasm build in build scripts
  include/exec: Allow using 64bit guest addresses on emscripten
  tcg: Add a TCG backend for WebAssembly
  hw/9pfs: Allow using hw/9pfs with emscripten
  gitlab: Enable CI for wasm build
  MAINTAINERS: Update MAINTAINERS file for wasm-related files

 .gitlab-ci.d/buildtest-template.yml           |   27 +
 .gitlab-ci.d/buildtest.yml                    |    9 +
 .gitlab-ci.d/container-cross.yml              |    5 +
 MAINTAINERS                                   |   11 +
 accel/tcg/cputlb.c                            |    8 +-
 block/file-posix.c                            |   18 +
 configs/meson/emscripten.txt                  |    6 +
 configure                                     |    7 +
 fsdev/file-op-9p.h                            |    3 +
 fsdev/meson.build                             |    2 +-
 hw/9pfs/9p-util-stub.c                        |   43 +
 hw/9pfs/9p-util.h                             |   18 +
 hw/9pfs/9p.c                                  |    3 +
 hw/9pfs/coth.h                                |   12 +
 hw/9pfs/meson.build                           |    2 +
 hw/riscv/riscv_hart.c                         |    9 +-
 include/accel/tcg/getpc.h                     |    2 +-
 include/exec/tlb-common.h                     |   14 +-
 include/exec/vaddr.h                          |   11 +
 include/qemu/atomic.h                         |    4 +
 include/qemu/cacheflush.h                     |    3 +-
 include/tcg/helper-info.h                     |    4 +-
 include/tcg/tcg.h                             |    2 +-
 meson.build                                   |   30 +-
 meson_options.txt                             |    2 +-
 os-posix.c                                    |    5 +
 qom/object.c                                  |    5 +-
 scripts/meson-buildoptions.sh                 |    2 +-
 target/arm/helper.c                           |    4 +-
 tcg/meson.build                               |    5 +
 tcg/tcg.c                                     |   26 +-
 tcg/wasm32.c                                  | 1260 +++++
 tcg/wasm32.h                                  |   39 +
 tcg/wasm32/tcg-target-con-set.h               |   18 +
 tcg/wasm32/tcg-target-con-str.h               |    8 +
 tcg/wasm32/tcg-target-has.h                   |  102 +
 tcg/wasm32/tcg-target-mo.h                    |   12 +
 tcg/wasm32/tcg-target-opc.h.inc               |    4 +
 tcg/wasm32/tcg-target-reg-bits.h              |   12 +
 tcg/wasm32/tcg-target.c.inc                   | 4484 +++++++++++++++++
 tcg/wasm32/tcg-target.h                       |   65 +
 .../dockerfiles/emsdk-wasm32-cross.docker     |  145 +
 util/cacheflush.c                             |    3 +-
 util/coroutine-fiber.c                        |  127 +
 util/mmap-alloc.c                             |   18 +
 45 files changed, 6561 insertions(+), 38 deletions(-)
 create mode 100644 configs/meson/emscripten.txt
 create mode 100644 hw/9pfs/9p-util-stub.c
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
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker
 create mode 100644 util/coroutine-fiber.c

-- 
2.25.1
