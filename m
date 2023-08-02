Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp205816ejb;
        Wed, 2 Aug 2023 01:46:38 -0700 (PDT)
X-Received: by 2002:a05:6358:341b:b0:135:57d0:d173 with SMTP id h27-20020a056358341b00b0013557d0d173mr5804298rwd.20.1690965998441;
        Wed, 02 Aug 2023 01:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690965998; cv=none;
        d=google.com; s=arc-20160816;
        b=W0ANs9XJw121nzAYkxosx80nSvbn2XFFoGtFQWF+K70gZFIzHXYG0CGadgEo77/i++
         fX4q07ho45y/0i6mAd29MQDa8a7hcZuk+MOHM8R01TIATB6T3ifhFTtBqeVccfdvoMCD
         qBs5pO1ZKrzt9OGb0kgVDAmlqlWOCuf3Jy8NzEGRbRgdkDhB63EheEkZl3PJ8fJLqmNU
         i+u95QHCQkz09Q2Kzf0foQWehF+FWaW60x/gROfz7v7zgGbq9u5tP15F/Z+oqhiOHtKf
         TjGr8rfqfQCrcW8d9UgEFSphbH3biE2FIU5QO8qkT+KVXuaAPG01UV0zyfh0gGNRjObJ
         zY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=hZOMuO3rhFRWQN0XLBRdhTTdxZDt1LzSnd4CLS3vr3w=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=lPj7Y7RqriTrDbqVnJR1rWYpOP6D1ZJIBd5z50LJOCbwoJz6dRIdb1KKsomgnO27kG
         UpkpaJoTZJcO6mUxlvnKe7AFDseQ4fqwTnt18hJCp1NdW/XS5JAb4/Ug+2EK737eLJSw
         9cbPi03LokdF/QVSTowcbgmbcKib7QzEmoo77fiYRuTb0qlEQLiu0xPCRPco0yaDCgjE
         ZRz9odT8UDbTKuWpbU0DXalKrdFx6/9bNhNfSKvHSjuZ9P3WAaaliu2O2uIHZzi2U1D5
         Q0DRSsCY/8YZFMdq9em42LN62UKcX+AxPShz64C+mScu1NCAAzeG8JjA5rSxNHTLuSX3
         qgmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=A8q2HByu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l127-20020a633e85000000b0053f18935d7csor4451149pga.3.2023.08.02.01.46.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:46:38 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=A8q2HByu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690965998; x=1691570798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZOMuO3rhFRWQN0XLBRdhTTdxZDt1LzSnd4CLS3vr3w=;
        b=A8q2HByuW5srAU7i1rcsWieYkLXuX7hCOlNugUHyw/n0ZepSb4NaYWmI8BDn4u0BH1
         gRJbtrZo4MRQjy4hqGEXGPeoLK9kUV5W9Yyvmm8eiPzR8jWqLcWgvGWrQGYfdRMgpYfB
         xJS6iFaO8g/RcT3rJrAwnVQT2Vs2Pm6VIxVImA8ErjPekfqFSWekmJy8jUIiOaaVTTId
         I/rHblno7BiUyEk8AgBlF1n4DQLAYgFt9hdq4TPMYYnD06AYfhAeF9bii8Qy5ESeTReP
         PdcOFhr2E+H+/VH92gr7DRK68YiB9tpTS7u9o4U99RlGBtaMmw8ZGv5zxSrEd0co977l
         7FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690965998; x=1691570798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZOMuO3rhFRWQN0XLBRdhTTdxZDt1LzSnd4CLS3vr3w=;
        b=amdJUV0JFGV4ZRB+4voAjyGDpYfhvg9SGerwi+k4U9BOvbhzrBESceZAKmHiC4Mp4q
         nFnQYCUYze2Cix5TjCnwQGtoyinfh7YiEauZykyL5vYv9uzFNef+lc6V3ex8VvkkOBvt
         ZN5kiIk4QqZfpsiitq+tjhBlEj2cY2NrNa03Wb+8Z+Wp/dGE5jWsER3sykHewEVHNjOD
         n+tM2+5mZUmMOl0IwFJRXyogNNoGysZ6ZKXLOMVMGXV1xGSMdUzWWdbK+4ljeO3YaH9m
         woazaVEkOnL392H1flHXr6Pvh9ufytKVd7mkEG2uYGmaBlik+vFdmCxaij9KyJO1rCiS
         Ha3Q==
X-Gm-Message-State: ABy/qLbtDuaoh73clf6inr88p+DBomaDrVhsHr0AZLSiCA2ZoIppQI7h
	zRAf0sZ51wr5QJVRk1ZoFY5Ouw==
X-Google-Smtp-Source: APBJJlFi9Q9SFTPgm/rIiS6+HzOSG57M2ioiVuiuH1ZPp7jBzIwfQSvSQABez7mEqW30Ykp93KUeSQ==
X-Received: by 2002:a05:6a21:71c1:b0:13d:f217:d318 with SMTP id ay1-20020a056a2171c100b0013df217d318mr7519878pzc.49.1690965997824;
        Wed, 02 Aug 2023 01:46:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:46:37 -0700 (PDT)
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
Subject: [PATCH v2 00/24] plugins: Allow to read registers
Date: Wed,  2 Aug 2023 17:45:48 +0900
Message-ID: <20230802084614.23619-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AjBZXxRl7jF0

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
Patch [21, 22] adds the feature to read registers from plugins.
Patch [23, 24] makes it possible to write plugins in C++.

The execlog plugin will have new options to demonstrate the new feature.
I also have a plugin that uses this new feature to generate execution traces for
Sniper processor simulator, which is available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb

V1 -> V2:
  Added SPDX-License-Identifier: GPL-2.0-or-later (Philippe Mathieu-Daudé)
  Split long lines. (Philippe Mathieu-Daudé)
  Renamed gdb_features to gdb_static_features (Philippe Mathieu-Daudé)
  Dropped RFC.

Akihiko Odaki (24):
  contrib/plugins: Use GRWLock in execlog
  gdbstub: Introduce GDBFeature structure
  gdbstub: Add num_regs member to GDBFeature
  gdbstub: Introduce gdb_find_static_feature()
  target/arm: Move the reference to arm-core.xml
  hw/core/cpu: Replace gdb_core_xml_file with gdb_core_feature
  target/arm: Use GDBFeature for dynamic XML
  target/ppc: Use GDBFeature for dynamic XML
  target/riscv: Use GDBFeature for dynamic XML
  gdbstub: Use GDBFeature for gdb_register_coprocessor
  gdbstub: Use GDBFeature for GDBRegisterState
  gdbstub: Simplify XML lookup
  hw/core/cpu: Remove gdb_get_dynamic_xml member
  gdbstub: Add members to identify registers to GDBFeature
  target/arm: Fill new members of GDBFeature
  target/ppc: Fill new members of GDBFeature
  target/riscv: Fill new members of GDBFeature
  hw/core/cpu: Add a parameter to gdb_read_register/gdb_write_register
  gdbstub: Hide gdb_has_xml
  gdbstub: Expose functions to read registers
  plugins: Allow to read registers
  contrib/plugins: Allow to log registers
  plugins: Support C++
  contrib/plugins: Add cc plugin

 MAINTAINERS                   |   2 +-
 docs/devel/tcg-plugins.rst    |  18 +++-
 configure                     |  15 ++-
 meson.build                   |   2 +-
 gdbstub/internals.h           |   8 ++
 include/exec/gdbstub.h        |  30 +++---
 include/hw/core/cpu.h         |  15 ++-
 include/qemu/qemu-plugin.h    |  69 +++++++++++++-
 target/alpha/cpu.h            |   6 +-
 target/arm/cpu.h              |  37 ++++----
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
 target/ppc/cpu.h              |  15 +--
 target/riscv/cpu.h            |  10 +-
 target/rx/cpu.h               |   6 +-
 target/s390x/cpu.h            |   2 -
 target/s390x/s390x-internal.h |   6 +-
 target/sh4/cpu.h              |   6 +-
 target/sparc/cpu.h            |   6 +-
 target/tricore/cpu.h          |   6 +-
 target/xtensa/cpu.h           |   6 +-
 contrib/plugins/execlog.c     | 140 ++++++++++++++++++++-------
 cpu.c                         |  11 ---
 gdbstub/gdbstub.c             | 100 ++++++++++++--------
 hw/core/cpu-common.c          |  16 +++-
 plugins/api.c                 |  40 ++++++++
 stubs/gdbstub.c               |   6 +-
 target/alpha/gdbstub.c        |   6 +-
 target/arm/cpu.c              |   6 +-
 target/arm/cpu64.c            |   4 +-
 target/arm/gdbstub.c          | 172 ++++++++++++++++++----------------
 target/arm/gdbstub64.c        |  55 +++++++----
 target/arm/tcg/cpu32.c        |   3 +-
 target/avr/cpu.c              |   4 +-
 target/avr/gdbstub.c          |   6 +-
 target/cris/gdbstub.c         |   9 +-
 target/hexagon/cpu.c          |   5 +-
 target/hexagon/gdbstub.c      |   6 +-
 target/hppa/gdbstub.c         |   6 +-
 target/i386/cpu.c             |   7 +-
 target/i386/gdbstub.c         |  10 +-
 target/loongarch/cpu.c        |   4 +-
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
 target/ppc/gdbstub.c          |  62 ++++++------
 target/riscv/cpu.c            |  21 +----
 target/riscv/gdbstub.c        |  68 +++++++++-----
 target/rx/cpu.c               |   4 +-
 target/rx/gdbstub.c           |   6 +-
 target/s390x/cpu.c            |   4 +-
 target/s390x/gdbstub.c        |  34 +++----
 target/sh4/gdbstub.c          |   6 +-
 target/sparc/gdbstub.c        |   6 +-
 target/tricore/gdbstub.c      |   6 +-
 target/xtensa/gdbstub.c       |   6 +-
 contrib/plugins/Makefile      |   5 +
 contrib/plugins/cc.cc         |  17 ++++
 plugins/qemu-plugins.symbols  |   2 +
 scripts/feature_to_c.py       | 102 ++++++++++++++++++++
 scripts/feature_to_c.sh       |  69 --------------
 tests/tcg/Makefile.target     |   3 +
 79 files changed, 910 insertions(+), 529 deletions(-)
 create mode 100644 contrib/plugins/cc.cc
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.41.0
