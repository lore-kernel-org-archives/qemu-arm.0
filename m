Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025052ejb;
        Mon, 31 Jul 2023 01:44:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:765:5ba6:a5ce with SMTP id i22-20020a05620a405600b007655ba6a5cemr11652761qko.45.1690793054699;
        Mon, 31 Jul 2023 01:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793054; cv=none;
        d=google.com; s=arc-20160816;
        b=IS3BxDd6RjKnhme1IdzU+xo1PSRAh7/t7SRmG7ZCVASsCDd4Pez20yN4ZF9Pzv9WWU
         rFZAF6y5jlDcMi3wKXRY0h1KrhYxndBBBDQDfgf7hrIR1wOSKe++4OiR2eoza6yYBM9P
         PLeEyYHD2j6yt4atgTM+4LOUpLiQTvM2cJYOlLV62mr1acDusSRcswTjRFoTzG0zXlta
         E9HgNvgUYHIe3sicS6wJzBVMBNhdkht6YF7uodxdEliUUYh35i5qpc1MCUOq9jLdsioC
         a4XgnWoNiRRRzMAkIZhouAWIMXmWjbwTnNeNSVnXVkoTjzHzXXltqBl6QalAlzgyueX2
         uKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CBn+i5nj20vvN0ekUr/AiX4JA2kgmu05HbHSUNBFeTE=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=h4+joEF/0iMrXSsHHHoFjEUonL0qwDySuU4OBJAnpvt4QcJDdkFN0rsnyScEiXoXWW
         9k/FQTg5l4zlev9FO+yBfWZdxnrpqtAB9jq54H3h4mwUy/tRKKUK3p9PoLqQA08Xt20L
         +8+ZyZP1W/nib+X8wMsC2aBQBv871nG1AKXFiX8XM+aEBV4lZqMo8tVCdcU70FMtKiRR
         RNU9LtMQbUCDYeXM1L4v3WnQO0vGRBNLiAdnFMNFwvpEJmtoIV/5tGvar2e64TaCt6c9
         IUaFt8WrTCHBTH4MWyEWteUVEAGkisU5ixCmOkdzB3TYay5WEMM5eCvyLP6VspmOdH7L
         3C/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=V9GBWiHm;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c64-20020a624e43000000b0066392cf5b21sor3441485pfb.9.2023.07.31.01.44.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:44:14 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=V9GBWiHm;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793054; x=1691397854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBn+i5nj20vvN0ekUr/AiX4JA2kgmu05HbHSUNBFeTE=;
        b=V9GBWiHm1vCm4A0HIEdbicQblVSB987/OTAQ55TLD+v23IHgofdMKY2WwzeTAUUjO0
         ZzUwN8RH6uXfKYThqw2k1aEKQ2EGBwRu6NmLu0eh+PNfGgvthJpE1AjdVpSQHLxtDkSv
         gmc4KgeSps1Xic6zekDFWnJraBIeSVVFMLFUiamgmMQbJ2cR7B77+kRZh1zYr+ZCsMcm
         7Mf/HmNEhHzFOqYPBiaJm+mUk15WKTK2JTv1N93SX1wIvr9n6kkNG18rioChyPDdBBzL
         Cdh59pEEwjZjuOPfxD1UA5YCLAg1QMFXcCeiSE98EgrALwiZaVB813HHZgL2M//TXtBr
         K0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793054; x=1691397854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBn+i5nj20vvN0ekUr/AiX4JA2kgmu05HbHSUNBFeTE=;
        b=Clt08SN4rxhLQEzq1dlKHZXtPVLvTwvN7WhqDYXZLWuFfv8kRKCn0KUSmdJHoOl6Mq
         29tgDUGESEkWSGDudwBNbb5ZGvAGrBc300WvavogholzLhQQ0PG5sQ+YYnLZ40vC+e7U
         ITzBxAtGzkRorq/Hqo8wAK/9OtJ6ZERyP54IQnXLcmZfgP5iaL68Ez3iuMWksI3dhN0C
         0o4IFfLLbflEYeQ+zMF2wSfo35o+pl+tzIK6jTWpXt4ymf0p+J0HZca/CfoAGu0cg1yB
         ImUtePHzvdRMSjKcMqsZSa4Df/hb1JM95d7WH2wQ3//0Zp6Q+BK1ITPb2p/WZD+lXRg6
         lUMw==
X-Gm-Message-State: ABy/qLYiRQTu3sXFT5uxBuUsSSgFolEoeP8iBAHYtPDHEulMvHGAwRbg
	p3EjO508EA/qst6Jv2UQvs4/VA==
X-Google-Smtp-Source: APBJJlHulO+9bai7HM3TBxkUIvH3l9LLnEnsQZGnhN06uQCpPeOidJV3P7w69UsLksZ6xmGGkGuiFg==
X-Received: by 2002:a05:6a00:1947:b0:680:6d16:8f8c with SMTP id s7-20020a056a00194700b006806d168f8cmr9407058pfk.32.1690793054114;
        Mon, 31 Jul 2023 01:44:14 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:44:13 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 00/24] plugins: Allow to read registers
Date: Mon, 31 Jul 2023 17:43:27 +0900
Message-ID: <20230731084354.115015-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8Q33ujtLE/yX

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
 contrib/plugins/cc.cc         |  15 +++
 plugins/qemu-plugins.symbols  |   2 +
 scripts/feature_to_c.py       |  98 +++++++++++++++++++
 scripts/feature_to_c.sh       |  69 --------------
 tests/tcg/Makefile.target     |   3 +
 79 files changed, 904 insertions(+), 529 deletions(-)
 create mode 100644 contrib/plugins/cc.cc
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.41.0
