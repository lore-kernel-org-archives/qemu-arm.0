Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1430863ejo;
        Tue, 12 Dec 2023 22:41:22 -0800 (PST)
X-Received: by 2002:a9d:7a4d:0:b0:6d9:f4dd:190f with SMTP id z13-20020a9d7a4d000000b006d9f4dd190fmr7547427otm.60.1702449682448;
        Tue, 12 Dec 2023 22:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449682; cv=none;
        d=google.com; s=arc-20160816;
        b=i1Ta0U0rxReC+EqkXfPsSE/eWALAr5RzAk79S4O4jhHf941iIz7//AjPGbIadXBWvs
         COTOhE3WQ7bOXFiNuI8KLCEqTZqoiJCo7tgcWeQEpqBbDMED4Gdawe7/mYYNaYEoNMM4
         jLQdhDLkCJJV+kY/4Z3JUhXmRGt3+hK+pgZmosuAZYa2aGpWJKun4xGUyMYWh8N9XR7s
         FOBX0tZhB5cZ6We597TBI5NelZ0UlsQyjJzlsRke5/R6Yxte0V6c7mhsoe++Z9x5HMia
         WK1kQ7CSj7Teglkz1ZDzq7cUFw3X7ypoB/rrwQ1rfbsClyswyOrRBWeuNmLTxD1f1Fkk
         92Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:dkim-signature;
        bh=L/+A66pL25kn3XYpcz1nOENcvzH/cRI26qShJ+fqNCw=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=nm9Ji/dDX2kcCrMYqKJXSB3VfX/V8wKZycYPmGNH7QYHTb50kuf6b/qTSvrvfOgaKY
         f34n5XNFy0UUEbgPEUFcZQkD5q8Bp51oWMnv33HSYlcAIWsCp9z2c6m3N6Dim92MndHV
         7ZHyCGmYHQB2tA8T2a/gbI3tIC34yXVw0FDFpANXZSrteZTfRfu9AkGlRFPxwf4FRrtG
         bxK21CZqdwq4JoATDqb4jLSKw7LQsjqPUUC52bM2HWQGS0U7uwve2786aj9FKCD0PcvX
         D2TBrpcUnwWMRGCnih38+cLS5+wF6BDC3Z5MfRGBTz/8lNGUBNQE9+008JahZfm1vgV9
         pV2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=1AnonZTo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e13-20020a9d63cd000000b006d8184e111dsor7227052otl.8.2023.12.12.22.41.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:41:22 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=1AnonZTo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449682; x=1703054482; darn=linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/+A66pL25kn3XYpcz1nOENcvzH/cRI26qShJ+fqNCw=;
        b=1AnonZTo/hGFv2muD6weXXQODMQZ5jrk2tEVns4zAerUc7xUKf9dOD8ckLLAPX3WVq
         Bk6nOPt1GjtaXCMB4Z+qLzVJXLpzbd/dPGZ2aPV1cBw31EXjLRZNVfQau24JbaH+RiWA
         QBQ/+jZywrrTDCKf4EI4OkC1I3DJfmyzae0uK4pRVZPQVVNGo9yCOzRzmpM5mb77hbm4
         iEHeGGroONNlqC+3Uk5IvWht006H0ri5Fw+3XGffNUv1KyI8yGhaWC2Xg02COqTCsPNV
         2T11vh9rhw4J4K5CNv+QqRBQJerpy0K4lUiyuX4LrFaGkevSgOq6ryXElbsz8ebTgtUQ
         qViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449682; x=1703054482;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/+A66pL25kn3XYpcz1nOENcvzH/cRI26qShJ+fqNCw=;
        b=fJOKmxrKuUSS7YAe8GwzYvN+qI9dj8ejxws+Dtaca4PE73Dma7GC1jVWKbM1FylE45
         FtePjKyoMr4CAK2E3rcphqtdlGO27mqb3mRDDkV9snHxMaeSCWBZucrh3QKu2vlwflzm
         1sMwvfcNeDqYhkQnu6lmAM0NXHssjvR/35hiE+OE0tybmti5zTI0ayGVkQzzntXhMwU0
         YZDzxHjQH+7LbcJe7qWaSgu3pksezEyS4oWx+aFQF7xVUEw9j5pnn+wsVdCRS1CG0l0X
         uLI2HyRrwNYECzo8KD4H8DALDSdi7A9iMpGeND9bTtRhrEo1LH1VB2p2B7QH/xSvi+iL
         FKVQ==
X-Gm-Message-State: AOJu0YzE0NbJvEPUfKZbET/YXoSrAp448u51q0zJAipHi8XaHJ/8/mJm
	O/M7xk+WmGSRT/yQY7GMfauKHg==
X-Google-Smtp-Source: AGHT+IH2OTmYiIudtuFvD5Um4b50Ij9KMAYBOovuQxiygKn3tZ2V4jzdlFUgdATkzDUMEeKHUgsMuA==
X-Received: by 2002:a05:6358:7f13:b0:170:2c2d:9d8f with SMTP id p19-20020a0563587f1300b001702c2d9d8fmr11021942rwn.1.1702449679908;
        Tue, 12 Dec 2023 22:41:19 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id px6-20020a17090b270600b002609cadc56esm10280169pjb.11.2023.12.12.22.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:41:19 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v17 00/14] plugins: Allow to read registers
Date: Wed, 13 Dec 2023 15:40:59 +0900
Message-Id: <20231213-gdb-v17-0-777047380591@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPtReWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDM11FJSSM
 xLz0lN1M1OAAkpGBkbGhkaGxrrpKUm6xiaWKUkGKYmWxmlGSkCVBUWpaZkVYGOiY2trAYTvJsR
 WAAAA
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: WaegLwwSNIJu

Based-on: <20231213-riscv-v7-0-a760156a337f@daynix.com>
("[PATCH v7 0/4] gdbstub and TCG plugin improvements")

I and other people in the University of Tokyo, where I research
processor design, found TCG plugins are very useful for processor design
exploration.

The feature we find missing is the capability to read registers from
plugins. In this series, I propose to add such a capability by reusing
gdbstub code.

The reuse of gdbstub code ensures the long-term stability of the TCG
plugin interface for register access without incurring a burden to
maintain yet another interface for register access.

This process to add TCG plugin involves four major changes. The first
one is to add members to GDBFeature necessary for register
identification.

The second one is to make gdb_read_register/gdb_write_register usable
outside of gdbstub context.

The third one is to actually make registers readable for plugins.

The execlog plugin will have new options to demonstrate the new feature.
I also have a plugin that uses this new feature to generate execution
traces for Sniper processor simulator, which is available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb

The below is a summary of patches:
Patch [01, 09] changes to use GDBFeature for dynamic XMLs.
Patch 10 adds members useful to identify registers to GDBFeature.
Patch 11 makes registers readable outside of gdbstub context.
Patch [12, 14] add the feature to read registers from plugins.

V16 -> V17:
  Rebased.

V15 -> V16:
  Added new plugin_dyn_cb_subtype and plugin_gen_cb to remove the global
  translator state change.

V14 -> V15:
  Added kdoc comments to include/exec/gdbstub.h.
  Changed to use g_array_append_val() in gdb_register_feature().
  Separated the CPU flags from event bitmap.

V13 -> V14:
  Fixed RISC-V CSR register numbers.

V12 -> V13:
  Rebased to "[PATCH v4 0/5] gdbstub and TCG plugin improvements".

V11 -> V12:
  Rebased to "[PATCH v2 0/3] gdbstub and TCG plugin improvements".

V10 -> V11:
  Fixed QEMU_PLUGIN_CB_RW_REGS.

V9 -> V10:
  Rebased to "[PATCH 0/4] gdbstub and TCG plugin improvements".
  Dropped patch "plugins: Support C++".
  Removed the unnecessary QEMU_PLUGIN_VERSION change.

V8 -> V9:
  Rebased to "[PATCH 00/25] October maintainer omnibus pre-PR (tests,
  gdbstub, plugins)".
  Added patch "target/riscv: Move MISA limits to class".
  Added patch "target/riscv: Remove misa_mxl validation".
  Added patch "target/riscv: Validate misa_mxl_max only once".
  Added patch "plugins: Use different helpers when reading".
  Moved contrib/plugins/cc.cc to tests/plugin/cc.cc.

V7 -> V8:
  Rebased to "[PATCH v3 00/12] gdbstub and TCG plugin improvements".
  Clarified that initialization and exit hooks affect TCG state.
  Simplified by adding the core feature to gdb_regs.

V6 -> V7:
  Rebased to "[PATCH v2 00/11] gdbstub and TCG plugin improvements".
  Replaced functions to get register identifiers.

V5 -> V6:
  Rebased to "[PATCH 0/8] gdbstub and TCG plugin improvements".

V4 -> V5:
  Corrected g_rw_lock_writer_lock() call. (Richard Henderson)
  Replaced abort() with g_assert_not_reached(). (Richard Henderson)
  Fixed CSR name leak in target/riscv. (Richard Henderson)
  Removed gdb_has_xml variable.

V3 -> V4:
  Added execlog changes I forgot to include in the last version.

V2 -> V3:
  Added patch "hw/core/cpu: Return static value with gdb_arch_name()".
  Added patch "gdbstub: Dynamically allocate target.xml buffer".
  (Alex Bennée)
  Added patch "gdbstub: Introduce GDBFeatureBuilder". (Alex Bennée)
  Dropped Reviewed-by tags for "target/*: Use GDBFeature for dynamic XML".
  Changed gdb_find_static_feature() to abort on failure. (Alex Bennée)
  Changed the execlog plugin to log the register value only when changed.
  (Alex Bennée)
  Dropped 0x prefixes for register value logs for conciseness.

V1 -> V2:
  Added SPDX-License-Identifier: GPL-2.0-or-later. (Philippe Mathieu-Daudé)
  Split long lines. (Philippe Mathieu-Daudé)
  Renamed gdb_features to gdb_static_features (Philippe Mathieu-Daudé)
  Dropped RFC.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Akihiko Odaki (14):
      target/arm: Use GDBFeature for dynamic XML
      target/ppc: Use GDBFeature for dynamic XML
      target/riscv: Use GDBFeature for dynamic XML
      gdbstub: Use GDBFeature for gdb_register_coprocessor
      gdbstub: Use GDBFeature for GDBRegisterState
      gdbstub: Change gdb_get_reg_cb and gdb_set_reg_cb
      gdbstub: Simplify XML lookup
      gdbstub: Infer number of core registers from XML
      hw/core/cpu: Remove gdb_get_dynamic_xml member
      gdbstub: Add members to identify registers to GDBFeature
      gdbstub: Expose functions to read registers
      plugins: Use different helpers when reading registers
      plugins: Allow to read registers
      contrib/plugins: Allow to log registers

 docs/devel/tcg-plugins.rst   |  10 +-
 accel/tcg/plugin-helpers.h   |   3 +-
 include/exec/gdbstub.h       |  44 ++++++++-
 include/hw/core/cpu.h        |   7 +-
 include/qemu/plugin.h        |   1 +
 include/qemu/qemu-plugin.h   |  50 +++++++++-
 target/arm/cpu.h             |  27 ++---
 target/arm/internals.h       |  14 +--
 target/hexagon/internal.h    |   4 +-
 target/microblaze/cpu.h      |   4 +-
 target/ppc/cpu-qom.h         |   1 +
 target/ppc/cpu.h             |   5 +-
 target/riscv/cpu.h           |   5 +-
 target/s390x/cpu.h           |   2 -
 accel/tcg/plugin-gen.c       |  43 +++++++-
 contrib/plugins/execlog.c    | 120 ++++++++++++++++------
 gdbstub/gdbstub.c            | 173 +++++++++++++++++++-------------
 hw/core/cpu-common.c         |   5 +-
 plugins/api.c                |  32 +++++-
 target/arm/cpu.c             |   2 -
 target/arm/cpu64.c           |   1 -
 target/arm/gdbstub.c         | 230 ++++++++++++++++++++++---------------------
 target/arm/gdbstub64.c       | 122 ++++++++++++-----------
 target/avr/cpu.c             |   1 -
 target/hexagon/cpu.c         |   4 +-
 target/hexagon/gdbstub.c     |  10 +-
 target/i386/cpu.c            |   2 -
 target/loongarch/cpu.c       |   2 -
 target/loongarch/gdbstub.c   |  13 ++-
 target/m68k/cpu.c            |   1 -
 target/m68k/helper.c         |  26 +++--
 target/microblaze/cpu.c      |   6 +-
 target/microblaze/gdbstub.c  |   9 +-
 target/ppc/cpu_init.c        |   7 --
 target/ppc/gdbstub.c         | 114 ++++++++++-----------
 target/riscv/cpu.c           |  15 ---
 target/riscv/gdbstub.c       | 139 ++++++++++++++------------
 target/rx/cpu.c              |   1 -
 target/s390x/cpu.c           |   1 -
 target/s390x/gdbstub.c       | 105 ++++++++++++--------
 plugins/qemu-plugins.symbols |   3 +
 scripts/feature_to_c.py      |  14 ++-
 42 files changed, 836 insertions(+), 542 deletions(-)
---
base-commit: 651f18e5def549b67df934e38c474963b884ccc7
change-id: 20231213-gdb-349db0da93f2

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>
