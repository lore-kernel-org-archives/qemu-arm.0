Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp412534ejs;
        Wed, 16 Aug 2023 07:52:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:338d:b0:13a:8082:5324 with SMTP id yy13-20020a056a21338d00b0013a80825324mr2604444pzb.44.1692197537586;
        Wed, 16 Aug 2023 07:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197537; cv=none;
        d=google.com; s=arc-20160816;
        b=vDZ4MQBKtpsnXVlVragdDSSBZ3zphUhJ4KtjiFzSbYvnT4wg6K+KO8osTErLpvdt5W
         BPUqMMd4LvmIugoHbwsmUkC0/NjeCgtwEZ9i5Z7UY9gjruAgtTlWny94XJSmi+LmPK49
         Mm9cL7uxVx+d14b7Es4KgbZyswiy/OlTgrKCiBaColSlGxsu41AXHx5k7SU4m5e2xQjd
         BXlrzsGxijWXWk1H+qYd305nEWaMrZ/xWmaRC2YX+gSgWY6B4/R53FIndgKiOajUqpB3
         IeRVdiLgWbf1mjM3fQcs9xYCKrONZHd+X51yBOnj7zTVNCyOAaZ4n6HC1dNGCjruzMNZ
         A07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=W0rSNwdLjlElfA7zuCnyHSIvAK4ETDAw7tBQmQ+jB9k=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=FBpDlYu5IMs8yrwDccbTlYJRRWDOO0jZhQCbJSuSJhzwCX3mxa1gmJf8mD30RbZXi6
         fzmqgktjlLvIYYq/768R6DHFipIdW8Jyc6F6qcP3H79x1ZX+ztuyjzWpnqptlk91W3Gk
         dLI0vodjmh+Vn2mlHnYT6lJieO/zpoOybKnkMixw+pH9lD3nUgQyATMzHImu0VDRDztY
         +93wfSG/91jee4rlyCFQF30hcSjNpEZ6TN7stt/RcRl08S1gmH18x10oBvI8L7YcMsAB
         DpVRH1XOseMiPK2fPHzucKuvbAMwVSUn8t03ZmvQ0gd2nrkofS//5pYybqZM/hs/ADFq
         PPMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=OXKMgn60;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s11-20020aa78bcb000000b006687b0b8bc0sor8552600pfd.12.2023.08.16.07.52.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:52:17 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=OXKMgn60;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197537; x=1692802337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0rSNwdLjlElfA7zuCnyHSIvAK4ETDAw7tBQmQ+jB9k=;
        b=OXKMgn60fOvwk7rMNzHSZ8egKujrEhXM7lbKONC10lHbrqjK6W5zLhcOMk8zH0I5Ya
         t8N461z1fItSIv5V1K2zrTDLLPckjBl/+46N+b70MVs4Z5P5TzZoxp9PdKvPWe8xMma8
         /42yvQCjz73NCiBPwV0NhFTgJMLs2FD/Xv3F6/cMJItFb5Jl4daWhslXiOvH7qAQ/44k
         mmOY2w8swK01ZS0sEs1SjcPaghmLeFfdSHXr/wuTb1SxRpvu635GrLqcg1mPVa0NtzDo
         DExo1Sv2eRQMCKlwvClxae+zLTDZylY+FYfb5QYSNY+QRmETNPyC7YVENndPzAP1pumL
         kG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197537; x=1692802337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0rSNwdLjlElfA7zuCnyHSIvAK4ETDAw7tBQmQ+jB9k=;
        b=TxKxnQvCSiNOVwfl95z1vWErpBillEYbmUxgE9H2W+JzedbPjB3VJjLiUXkvivt2IY
         nXbZVpHJFV0gIFvtXRaA/VBVWZcHvqrD3TRaVPX8sYfVLuYR1I1r+Ojz472WxysuZ4I2
         yABQb0E9P9ybMdFOC051vUrq0E2LWNAh49s6TR+3w5CVm1he1eDg+GfYSeYiccwYptDf
         IkqPuS4duPjeESWALzmBuOH68oKpfFfJshAVefTuv3IxRJkQknR/O1iikibGlEEyMoFy
         UusmQ4XDjyFyb4KIarwmlz/FkSK2buB4f8ssZRkD0lINECowy+aipfWGVETIRf21G72D
         N3/w==
X-Gm-Message-State: AOJu0YxtSwiQ8Vhdp5RydaSAIDFRezIsbQePk7N4lCnwgLE6zYKNQHej
	qzfb3kFurMyEDjFwt605Vnt3Qw==
X-Google-Smtp-Source: AGHT+IHOKyd1dvsv7YViEvK6Eahed+vlvkDlqbVmKYb2krh5jZ0FJauPiy7YjcrsJnjstk/iV3/fHQ==
X-Received: by 2002:a05:6a00:2d21:b0:67f:d4e2:3dd7 with SMTP id fa33-20020a056a002d2100b0067fd4e23dd7mr2241675pfb.21.1692197536983;
        Wed, 16 Aug 2023 07:52:16 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:52:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 00/25] plugins: Allow to read registers
Date: Wed, 16 Aug 2023 23:51:21 +0900
Message-ID: <20230816145155.21049-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xNGvLHj3iSHu

I and other people in the University of Tokyo, where I research processor
design, found TCG plugins are very useful for processor design exploration.

The feature we find missing is the capability to read registers from
plugins. In this series, I propose to add such a capability by reusing
gdbstub code.

The reuse of gdbstub code ensures the long-term stability of the TCG plugin
interface for register access without incurring a burden to maintain yet
another interface for register access.

This process to add TCG plugin involves four major changes. The first one
is to add GDBFeature structure that represents a GDB feature, which usually
includes registers. GDBFeature can be generated from static XML files or
dynamically generated by architecture-specific code. In fact, this is a
refactoring independent of the feature this series adds, and potentially
it's benefitial even without the plugin feature. The plugin feature will
utilize this new structure to describe registers exposed to plugins.

The second one is to make gdb_read_register/gdb_write_register usable
outside of gdbstub context.

The third one is to actually make registers readable for plugins.

The last one is to allow to implement a QEMU plugin in C++. A plugin that
I'll describe later is written in C++.

The below is a summary of patches:
Patch 01 fixes a bug in execlog plugin.
Patch [02, 13] introduces GDBFeature.
Patch [14, 17] adds information useful for plugins to GDBFeature.
Patch [18, 20] makes registers readable outside of gdbstub context.
Patch [21, 23] adds the feature to read registers from plugins.
Patch [24, 25] makes it possible to write plugins in C++.

The execlog plugin will have new options to demonstrate the new feature.
I also have a plugin that uses this new feature to generate execution
traces for Sniper processor simulator, which is available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb

V3 -> V4:
  Added execlog changes I forgot to include in the last version.

V2 -> V3:
  Added patch "hw/core/cpu: Return static value with gdb_arch_name()"
  Added patch "gdbstub: Dynamically allocate target.xml buffer"
  (Alex Bennée)
  Added patch "gdbstub: Introduce GDBFeatureBuilder" (Alex Bennée)
  Dropped Reviewed-by tags for "target/*: Use GDBFeature for dynamic XML"
  Changed gdb_find_static_feature() to abort on failure (Alex Bennée)
  Changed the execlog plugin to log the register value only when changed
  (Alex Bennée)
  Dropped 0x prefixes for register value logs for conciseness

V1 -> V2:
  Added SPDX-License-Identifier: GPL-2.0-or-later (Philippe Mathieu-Daudé)
  Split long lines. (Philippe Mathieu-Daudé)
  Renamed gdb_features to gdb_static_features (Philippe Mathieu-Daudé)
  Dropped RFC.

Akihiko Odaki (25):
  contrib/plugins: Use GRWLock in execlog
  gdbstub: Introduce GDBFeature structure
  gdbstub: Add num_regs member to GDBFeature
  gdbstub: Introduce gdb_find_static_feature()
  target/arm: Move the reference to arm-core.xml
  hw/core/cpu: Replace gdb_core_xml_file with gdb_core_feature
  gdbstub: Introduce GDBFeatureBuilder
  target/arm: Use GDBFeature for dynamic XML
  target/ppc: Use GDBFeature for dynamic XML
  target/riscv: Use GDBFeature for dynamic XML
  gdbstub: Use GDBFeature for gdb_register_coprocessor
  gdbstub: Use GDBFeature for GDBRegisterState
  hw/core/cpu: Return static value with gdb_arch_name()
  gdbstub: Dynamically allocate target.xml buffer
  gdbstub: Simplify XML lookup
  hw/core/cpu: Remove gdb_get_dynamic_xml member
  gdbstub: Add members to identify registers to GDBFeature
  hw/core/cpu: Add a parameter to gdb_read_register/gdb_write_register
  gdbstub: Hide gdb_has_xml
  gdbstub: Expose functions to read registers
  cpu: Call plugin hooks only when ready
  plugins: Allow to read registers
  contrib/plugins: Allow to log registers
  plugins: Support C++
  contrib/plugins: Add cc plugin

 MAINTAINERS                   |   2 +-
 docs/devel/tcg-plugins.rst    |  18 ++-
 configure                     |  15 ++-
 meson.build                   |   2 +-
 gdbstub/internals.h           |  10 +-
 include/exec/gdbstub.h        |  51 +++++++--
 include/hw/core/cpu.h         |  17 ++-
 include/qemu/qemu-plugin.h    |  69 +++++++++++-
 target/alpha/cpu.h            |   6 +-
 target/arm/cpu.h              |  37 +++----
 target/arm/internals.h        |   2 +-
 target/avr/cpu.h              |   6 +-
 target/cris/cpu.h             |   9 +-
 target/hexagon/internal.h     |   6 +-
 target/hppa/cpu.h             |   6 +-
 target/i386/cpu.h             |   6 +-
 target/loongarch/internals.h  |   6 +-
 target/m68k/cpu.h             |   6 +-
 target/microblaze/cpu.h       |   6 +-
 target/mips/internal.h        |   6 +-
 target/openrisc/cpu.h         |   6 +-
 target/ppc/cpu-qom.h          |   3 +-
 target/ppc/cpu.h              |  15 ++-
 target/ppc/internal.h         |   2 +-
 target/riscv/cpu.h            |  10 +-
 target/rx/cpu.h               |   6 +-
 target/s390x/cpu.h            |   2 -
 target/s390x/s390x-internal.h |   6 +-
 target/sh4/cpu.h              |   6 +-
 target/sparc/cpu.h            |   6 +-
 target/tricore/cpu.h          |   6 +-
 target/xtensa/cpu.h           |   6 +-
 contrib/plugins/execlog.c     | 150 +++++++++++++++++++------
 cpu.c                         |  11 --
 gdbstub/gdbstub.c             | 203 ++++++++++++++++++++++++----------
 gdbstub/softmmu.c             |   2 +-
 hw/core/cpu-common.c          |  16 ++-
 plugins/api.c                 |  40 +++++++
 stubs/gdbstub.c               |   6 +-
 target/alpha/gdbstub.c        |   6 +-
 target/arm/cpu.c              |  12 +-
 target/arm/cpu64.c            |   8 +-
 target/arm/gdbstub.c          | 184 +++++++++++++-----------------
 target/arm/gdbstub64.c        |  96 +++++++---------
 target/arm/tcg/cpu32.c        |   3 +-
 target/avr/cpu.c              |   4 +-
 target/avr/gdbstub.c          |   6 +-
 target/cris/gdbstub.c         |   9 +-
 target/hexagon/cpu.c          |   5 +-
 target/hexagon/gdbstub.c      |   6 +-
 target/hppa/gdbstub.c         |   6 +-
 target/i386/cpu.c             |  13 +--
 target/i386/gdbstub.c         |  10 +-
 target/loongarch/cpu.c        |   8 +-
 target/loongarch/gdbstub.c    |   8 +-
 target/m68k/cpu.c             |   7 +-
 target/m68k/gdbstub.c         |   6 +-
 target/m68k/helper.c          |   6 +-
 target/microblaze/cpu.c       |   9 +-
 target/microblaze/gdbstub.c   |   6 +-
 target/mips/gdbstub.c         |   6 +-
 target/nios2/cpu.c            |   6 +-
 target/openrisc/gdbstub.c     |   6 +-
 target/ppc/cpu_init.c         |   9 +-
 target/ppc/gdbstub.c          |  90 ++++++---------
 target/riscv/cpu.c            |  27 ++---
 target/riscv/gdbstub.c        |  95 +++++++---------
 target/rx/cpu.c               |   4 +-
 target/rx/gdbstub.c           |   6 +-
 target/s390x/cpu.c            |   8 +-
 target/s390x/gdbstub.c        |  34 ++----
 target/sh4/gdbstub.c          |   6 +-
 target/sparc/gdbstub.c        |   6 +-
 target/tricore/cpu.c          |   4 +-
 target/tricore/gdbstub.c      |   6 +-
 target/xtensa/gdbstub.c       |   6 +-
 contrib/plugins/Makefile      |   5 +
 contrib/plugins/cc.cc         |  17 +++
 plugins/qemu-plugins.symbols  |   2 +
 scripts/feature_to_c.py       | 102 +++++++++++++++++
 scripts/feature_to_c.sh       |  69 ------------
 tests/tcg/Makefile.target     |   3 +
 82 files changed, 1044 insertions(+), 679 deletions(-)
 create mode 100644 contrib/plugins/cc.cc
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.41.0
