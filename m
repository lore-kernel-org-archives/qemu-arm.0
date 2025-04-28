Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783221njd;
        Sun, 27 Apr 2025 23:39:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3944:b0:2ee:d433:7c50 with SMTP id 98e67ed59e1d1-309f7e67f93mr13314916a91.23.1745822381788;
        Sun, 27 Apr 2025 23:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822381; cv=none;
        d=google.com; s=arc-20240605;
        b=LK5vIOnEiStivMPjMJJ4WSV6j/dtYDSbXZdCaI5/sKrd0VI4OftMc38OdqBFbDDBkV
         KLM5TVkUnYV/A3aNCd4Zey90XIftL47+7jJQu1isr5+FjoCYx1rYgVqIwdf1+fkpbVsy
         YWSGmGN7468Pce1Hu4XKrU//tre2frE+RHrfusXStV4phi3WvCT3vu/WKLlhRxW7hEGM
         w2vQysiXRFhNCHH6vW1h7i9C0ThkNHft30zvPEl1aLlYbvAOmTopWeoT/LngNG7jr/Ge
         4NgWsrDCVNTa/aI+UE1F5K2kx2bNI4n308IAlizaSYdb2z2j4lLmz+4gmqnxB+AEXuWg
         k3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=dK6O7z60HbSeZt8wVKmalny4ZAGsn1II5uWKl1TPKnE=;
        fh=7qKPKD1/2JJo0LOwHQ0ctfeSk/aLIyoxfV3u9VC8MbY=;
        b=Wpf7axdkIdPy7CkwT8ZLB1ZNzwpSQMYZglu95CFR6HHC9n0lb/yqvDJgFlwKadefg+
         ky5mTtA6IdTieZgwNXfwoJ5I4pbJeRg+XwzvTcysunWjtlFotJ5cIpui/Li3fvoYNp8q
         BooLoSl2qy3lak5V5o8CIZXRCASdclc9NVqFg8NkS1nzCh9oeR5SwsN7Pl7oL62OeVtW
         aal2qHoTlaXZHO60UajfD8o1NdOag0dCMCB6f3mue8nlRjM3B3jv59hDAlSnYaUfJzzO
         wepz/AcWYGE88bGv7lhGwzbB35KVNW2912pCDSi+gNCNe/W54sxi1pW9NmGjgmfR8+wB
         n6kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=J7ggDpcV;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f8dacsor61339715ad.11.2025.04.27.23.39.41
        (Google Transport Security);
        Sun, 27 Apr 2025 23:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=J7ggDpcV;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822381; x=1746427181; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dK6O7z60HbSeZt8wVKmalny4ZAGsn1II5uWKl1TPKnE=;
        b=J7ggDpcVofAzW0QQsDgIrgnHMq8Qd2GN4BJPMl5XW79bTlGxRMkLkwd8LlRLvsoRjU
         8AJGuaHQTmLGXcbrv86OIqFOjf0jyCYXwCAoFj7M0RLDRKfYjwmceQW7QPzCu+hUI/zn
         buG5V8lP9kbSl8aoKiU2+she9TUuaAjzu9piJ87epxH9OcOWFq0S5gobcWAyvWrgEWaU
         B/FyiBs9a7JujSmrDf24xHha0rqHeRsSePoCvvIuckYEgQD6PwUytljVjrbfXnOWEPZm
         j+BX6xnIOrOdlW7/9OS5+L1ZcllHM9sV9Tg3RvwNb+lspFzNBjsI9L3koEiTSw9zqukU
         mJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822381; x=1746427181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dK6O7z60HbSeZt8wVKmalny4ZAGsn1II5uWKl1TPKnE=;
        b=jW1ot+loLU1pjnLPNY/vmEGUB2bM1HJMH8Tll6FrKDsd4sqUp+9VCa90nYwfRnD6fP
         p9JnCUwnHlpiyU4dijzSFLgkHL4YfYyXGYtVcsOG6DGiUgpkEmbWE9MJFmfBrQQ+BX1p
         x7Kut3CylX3Gv8cyQTVy5OEgrQbamg4qSgaqwjZ4oxJOQGOI1S7+eAsSDOoy4InPXgcR
         zXfIoFvyFIsUP36EqzebWxlJ7do1p4fBJsBVMs6mNUy9j2tR/jyFx9XInyjzns+Dtr5h
         EhE07EY0umGovTFPFMXAodPxh7E6sXvG+X66JFeJqma+TFUeQs8+QKtE7y7f2ByXAJAy
         4Jqw==
X-Forwarded-Encrypted: i=1; AJvYcCU+uUDirhCPBmBwdgYZbZpeyXoRDYNYOIfibs3ONqh+T4C/qPtblRB0BVSP6aprXfyr8QDYykFkMfmYz42jYd7fwGo=@linaro.org, AJvYcCVYIFA1B3L+jJYyF+5WQ+q8IwloxB/Esl+tgXQmjjO5BByWtEqPxTsRi9rTn9GpHvnXjSXBJuCNdl5vyRNK@linaro.org, AJvYcCW/NqOsFawtlDJKTzaF5u3Fkf4LC1Y6qDwdhybHXJ0eNKXKwS3K6Hs5qaJ/eTx39iZ2j9coaBUh@linaro.org, AJvYcCWJ7xsjHh4lpkwly1TXtMcie+WrCGlHUMT/aRVJ0UwERHemiXL2wdswS4WpsTM+OBPZlpnwF7jFQYhL6UKZ4nRCKQ==@linaro.org
X-Gm-Message-State: AOJu0Yw/Nq794YtgNt4ZzZpG6UeHS7T8nieMLX/nvi223RafT649Rywn
	Hkue6T4cibs9XNjVB5MgnMq5vmzccOByK5SPDScE1r+J4rDrvkpUVsO/lqXx
X-Gm-Gg: ASbGncuUIC21RdD+f46VF9RN4K0cFNAEmSnjAx1IqBz7jCWZAXREs1MCuhhQ+yO2q8Z
	lh2uu33sKESbsWZLLQF/+1YaSFInHvZuKBMtxhY76iac23X9/UaDjCtWS6xxbhKbL71EtRA1R2v
	g7XLwPYPPg+nvkx0cUFMcUd+XEY9iCcDn3IPZJxUC1AgzUxaNCZLqAOAWFybuwr8fP8Cyj8YA4M
	9pMyKfUTSv9Fm/l1llp5l8UjcFhY6/AmoxV3IXfn9m7p3BcMms67nw66mRROn2zf4C8b0cuDJJk
	tPoHSvG9KEwfQzrsNALRRnrzGvC1S2XDUdEi0g==
X-Google-Smtp-Source: AGHT+IHPd7IjtWljONhKaRHyhvOAjolgIljZ6M+cmIGcBSZiB7onlO9bQZ2wvguMrsXMbppPtLQsow==
X-Received: by 2002:a17:902:f683:b0:223:62f5:fd44 with SMTP id d9443c01a7336-22dbf62c38emr164470995ad.40.1745822380908;
        Sun, 27 Apr 2025 23:39:40 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:39:40 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
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
Subject: [PATCH v3 00/20] Enable QEMU TCI to run 32bit guests on browsers
Date: Mon, 28 Apr 2025 15:38:49 +0900
Message-ID: <cover.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xLwcR9JT9XLz

V3:

- Fixed the argument type of cpreg_key_compare to use gpointer instead of
  void*.
- Fixed the multiline comment to ensure it starts with "/*" on a separate
  line.
- Fixed the commit message to remove a confusing link in the
  util/cacheflush.c patch.
- Resolved patch conflicts against the latest upstream master branch in the
  gitlab CI configuration patch.
- The patches 01, 02, 03, 06, and 07 are included in this series sololy to
  ensure successful builds. They have already been picked up by the pull
  requests, so please ignore them.

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
 include/glib-compat.h                         |   7 +
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
 40 files changed, 710 insertions(+), 66 deletions(-)
 create mode 100644 configs/meson/emscripten.txt
 create mode 100644 include/system/os-wasm.h
 create mode 100644 os-wasm.c
 create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker
 create mode 100644 util/coroutine-wasm.c

-- 
2.43.0
