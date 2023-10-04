Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2514030ejb;
        Wed, 4 Oct 2023 02:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOThan03NwSOJ+pGjUN5rX/fspK2Am5btxDCykbgMFlvXKfdt1wkyzUN2iVTafwH1fi9Nv
X-Received: by 2002:a05:620a:2907:b0:773:c6a1:a4e0 with SMTP id m7-20020a05620a290700b00773c6a1a4e0mr1988669qkp.2.1696410438887;
        Wed, 04 Oct 2023 02:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410438; cv=none;
        d=google.com; s=arc-20160816;
        b=gp7UVAPcfDOi8vjSGbgT9lpUMz3c+OijAVcQZQgHQrvQBst7ynLDomWkC+kbhPLC9N
         HkcG6wN+hb3IPFKjMSxoEu5mNx9n/9zaSrfNxf5XgYVrJ4zeOCLXEeD1MwO4a18Es6Wm
         yNB82NhMn3ezJHRHBJ0T4C2hS2QG7Q2xYqvTCWJR5hLmBKUpU+lcyNhh61DNFoZcx9Yt
         Z3zUEGfxOdrZ1tz0t9bPZ9uLcw2LhW7AvWB7filKAhCymeOr+mLE5fjyyIcNE4b6uhvA
         KhInl7vpqOpjGOqx5fX2Vcwv1QbCFXgqM48Hd8gGeapOWNbHb+tGouQps2XVg1zHinXE
         VM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qNBSS5i6sU4lyaj8Yfkc45yB1bV/cBSP3bR/QJlwa/s=;
        fh=6CgllM1fbvnSF0RL7ce3v2OCeAvpLM5D4zatCNKduko=;
        b=yZ2VnmKtRbjDAl1V/NARmTj9GVSwmpJUPzWiLlPjon+IWMEZEqKe29PHfnU2dQxK9u
         cqiUIGZVE72V04C8OIJ2tpIiLAQJzyWjFF6WhnuESbHjYi5cyDajLTHcYsaqCyC3Hs2h
         s5QAKVM40BrLnTCk0sr4aFVRGFaFR6sRMmQVLDFdqTuPTTzX7j2ud3Vn1dz7VZ0yIMa8
         EUULLN8ZYDCW1M5OUt0nwbfxDnWM2squaRaVDyeFexqwUpVcfWEMUr9yr2y5yzZyfSx0
         LXx90dx9stFG4DhYPFK+uQpbEp8DtGFa1u8N1Wjvqe1fRrWpL5TvDk42foPJufhokRYA
         n04g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aufznRQh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05620a090d00b0076cc34b44c1si1297024qkv.292.2023.10.04.02.07.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 02:07:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aufznRQh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnxqL-000068-Oe; Wed, 04 Oct 2023 05:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxq6-0007jj-NE
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:06:43 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxpy-0007H7-5A
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:06:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3247d69ed2cso1866555f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410392; x=1697015192; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qNBSS5i6sU4lyaj8Yfkc45yB1bV/cBSP3bR/QJlwa/s=;
 b=aufznRQhp6pTADROYYqbNIfDqbK4vGlwKZA57FgDKhmxzh2zL+PBjlKkDTjKNYuMic
 yp76kMoRaYZJ0hC9zlU/Lf1nmDvvXe28GNC9LR0EpX5YD7Ban5FjPFPi6NGrgqht4Aym
 6552gg0F268MQpZrhXXd2JwdfYO7HtkCQb8zDAlY1DDbUQAGWGVmldbM4QRhyTEQX0F9
 HhQWAbB9ix5t1vBZ1+DlwkCrVwCKM7DSlYuaV3+FFlvCcX7mbvPc8qBqrYwx5tY+WY9R
 /QXmVwhgmfVfc3X4/5FA8lGny2XGI/pJeT59DfsbVCXIorg3saTgVPVQoQeuKCpB3zrc
 Mu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410392; x=1697015192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qNBSS5i6sU4lyaj8Yfkc45yB1bV/cBSP3bR/QJlwa/s=;
 b=wzqWGCx0qXSSLM6cHNeWoNQe4CRuhXtUVCRhB4RtJjrOrevW5ZLyTlbJlW5V57qlgI
 kRP875xW89QF15lz59/Lb2JxsU8Ojtx8IQfdds/BsyckQI3t5KX9q5j8RfkFJENnZdLM
 KrruwRtbGD6sNLAfoCAeLy6//pFo2H06Ch7VfWjj7sHMaGh6KskR8R1k0PVXad3KMYf/
 cNKoGWZfEtlFgW+JDqNRx/dihinPItKlZkWMGldeGe21+LT5nFAcYrtmVGAVtHrFiiuT
 0TjlbplshJ6Jx7q2roVMbG4AR0idk+iVotoDfgnwIeiEztO8B8gvbpM7mmR3OfTcmjNv
 IJZw==
X-Gm-Message-State: AOJu0Yyk2sft25tRt86/GOh1MsBfhnjkpkT/Kj/N+wj5CReamhXDrEaj
 eypVbo0lFNGL6f03AlUltjyKuA==
X-Received: by 2002:a5d:460a:0:b0:321:521f:836f with SMTP id
 t10-20020a5d460a000000b00321521f836fmr1870415wrq.26.1696410392331; 
 Wed, 04 Oct 2023 02:06:32 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 v10-20020adff68a000000b003197869bcd7sm3501098wrp.13.2023.10.04.02.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:06:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Date: Wed,  4 Oct 2023 11:06:15 +0200
Message-ID: <20231004090629.37473-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rc6F4nTqGS4J

This series finishes the cleanup which remove the confusion
of using 'softmmu' when we really mean 'system emulation',
as opposition to 'user emulation'.

Now that Richard posted its "tcg: Allow softmmu for user-only"
series, this is particularly relevant:
https://lore.kernel.org/qemu-devel/20231003174356.1602279-1-richard.henderson@linaro.org/

Philippe Mathieu-Daudé (13):
  softmmu/trace-events: Fix a typo
  travis-ci: Correct invalid mentions of 'softmmu' by 'system'
  cpu: Correct invalid mentions of 'softmmu' by 'system-mode'
  fuzz: Correct invalid mentions of 'softmmu' by 'system'
  tcg: Correct invalid mentions of 'softmmu' by 'system-mode'
  accel: Rename accel_softmmu* -> accel_system*
  gdbstub: Rename 'softmmu' -> 'system'
  semihosting: Rename softmmu_FOO_user() -> uaccess_FOO_user()
  target/i386: Rename i386_softmmu_kvm_ss -> i386_kvm_ss
  hw/virtio/meson: Rename softmmu_virtio_ss -> system_virtio_ss
  meson: Rename softmmu_mods -> system_mods
  meson: Rename target_softmmu_arch -> target_system_arch
  system: Rename softmmu/ directory as system/

 MAINTAINERS                                   | 44 +++++++++----------
 docs/devel/build-system.rst                   |  4 +-
 docs/devel/qtest.rst                          |  2 +-
 docs/devel/testing.rst                        |  2 +-
 tests/tcg/s390x/pgm-specification.mak         |  2 +-
 meson.build                                   | 22 +++++-----
 accel/{accel-softmmu.h => accel-system.h}     |  6 +--
 gdbstub/internals.h                           |  4 +-
 include/qemu/atomic128.h                      |  4 +-
 .../{softmmu-uaccess.h => uaccess.h}          | 24 +++++-----
 include/sysemu/runstate-action.h              |  2 +-
 include/tcg/tcg-op-common.h                   |  2 +-
 softmmu/trace.h                               |  1 -
 {softmmu => system}/timers-state.h            |  0
 system/trace.h                                |  1 +
 tests/qtest/fuzz/fuzz.h                       |  4 +-
 accel/accel-common.c                          |  2 +-
 accel/{accel-softmmu.c => accel-system.c}     |  6 +--
 accel/tcg/user-exec.c                         |  2 +-
 cpu.c                                         |  2 +-
 gdbstub/{softmmu.c => system.c}               |  2 +-
 hw/core/cpu-common.c                          |  4 +-
 semihosting/arm-compat-semi.c                 |  4 +-
 semihosting/config.c                          |  2 +-
 semihosting/guestfd.c                         |  2 +-
 semihosting/syscalls.c                        |  2 +-
 semihosting/uaccess.c                         | 14 +++---
 stubs/semihost.c                              |  4 +-
 {softmmu => system}/arch_init.c               |  0
 {softmmu => system}/async-teardown.c          |  0
 {softmmu => system}/balloon.c                 |  0
 {softmmu => system}/bootdevice.c              |  0
 {softmmu => system}/cpu-throttle.c            |  0
 {softmmu => system}/cpu-timers.c              |  0
 {softmmu => system}/cpus.c                    |  0
 {softmmu => system}/datadir.c                 |  0
 {softmmu => system}/device_tree.c             |  0
 {softmmu => system}/dirtylimit.c              |  0
 {softmmu => system}/dma-helpers.c             |  0
 {softmmu => system}/globals.c                 |  0
 {softmmu => system}/icount.c                  |  0
 {softmmu => system}/ioport.c                  |  0
 {softmmu => system}/main.c                    |  0
 {softmmu => system}/memory.c                  |  2 +-
 {softmmu => system}/memory_mapping.c          |  0
 {softmmu => system}/physmem.c                 |  6 ++-
 {softmmu => system}/qdev-monitor.c            |  0
 {softmmu => system}/qemu-seccomp.c            |  0
 {softmmu => system}/qtest.c                   |  0
 {softmmu => system}/rtc.c                     |  0
 {softmmu => system}/runstate-action.c         |  0
 {softmmu => system}/runstate-hmp-cmds.c       |  0
 {softmmu => system}/runstate.c                |  0
 {softmmu => system}/tpm-hmp-cmds.c            |  0
 {softmmu => system}/tpm.c                     |  0
 {softmmu => system}/vl.c                      |  0
 {softmmu => system}/watchpoint.c              |  0
 target/m68k/m68k-semi.c                       |  2 +-
 target/mips/tcg/sysemu/mips-semi.c            |  2 +-
 target/nios2/nios2-semi.c                     |  2 +-
 target/riscv/vector_helper.c                  |  2 +-
 tcg/region.c                                  |  4 +-
 tcg/tcg.c                                     | 11 ++---
 tests/qtest/fuzz/fuzz.c                       |  2 +-
 tests/tcg/multiarch/system/memory.c           |  4 +-
 tcg/aarch64/tcg-target.c.inc                  |  4 +-
 tcg/arm/tcg-target.c.inc                      |  2 +-
 tcg/i386/tcg-target.c.inc                     |  2 +-
 tcg/loongarch64/tcg-target.c.inc              |  4 +-
 tcg/mips/tcg-target.c.inc                     |  4 +-
 tcg/ppc/tcg-target.c.inc                      |  4 +-
 tcg/riscv/tcg-target.c.inc                    |  4 +-
 tcg/s390x/tcg-target.c.inc                    |  4 +-
 tcg/sparc64/tcg-target.c.inc                  |  4 +-
 .travis.yml                                   |  4 +-
 accel/meson.build                             |  2 +-
 accel/stubs/meson.build                       | 10 ++---
 gdbstub/meson.build                           | 10 ++---
 gdbstub/trace-events                          |  2 +-
 hw/virtio/meson.build                         | 22 +++++-----
 scripts/checkpatch.pl                         |  2 +-
 scripts/coverity-scan/COMPONENTS.md           |  2 +-
 scripts/get_maintainer.pl                     |  2 +-
 {softmmu => system}/meson.build               |  0
 {softmmu => system}/trace-events              |  2 +-
 target/alpha/meson.build                      |  2 +-
 target/arm/meson.build                        |  2 +-
 target/avr/meson.build                        |  2 +-
 target/cris/meson.build                       |  2 +-
 target/hppa/meson.build                       |  2 +-
 target/i386/kvm/meson.build                   | 10 ++---
 target/i386/meson.build                       |  2 +-
 target/loongarch/meson.build                  |  2 +-
 target/m68k/meson.build                       |  2 +-
 target/microblaze/meson.build                 |  2 +-
 target/mips/meson.build                       |  2 +-
 target/nios2/meson.build                      |  2 +-
 target/openrisc/meson.build                   |  2 +-
 target/ppc/meson.build                        |  2 +-
 target/riscv/meson.build                      |  2 +-
 target/rx/meson.build                         |  2 +-
 target/s390x/meson.build                      |  2 +-
 target/sh4/meson.build                        |  2 +-
 target/sparc/meson.build                      |  2 +-
 target/tricore/meson.build                    |  2 +-
 target/xtensa/meson.build                     |  2 +-
 tcg/meson.build                               |  6 +--
 tests/tcg/Makefile.target                     |  2 +-
 tests/tcg/multiarch/gdbstub/interrupt.py      |  2 +-
 tests/tcg/multiarch/gdbstub/memory.py         |  2 +-
 tests/tcg/s390x/pgm-specification-softmmu.S   |  2 +-
 tests/tcg/s390x/softmmu.ld                    |  2 +-
 tests/tcg/xtensa/Makefile.softmmu-target      |  2 +-
 tests/tcg/xtensaeb/Makefile.softmmu-target    |  2 +-
 tests/unit/meson.build                        |  2 +-
 115 files changed, 188 insertions(+), 181 deletions(-)
 rename accel/{accel-softmmu.h => accel-system.h} (77%)
 rename include/semihosting/{softmmu-uaccess.h => uaccess.h} (75%)
 delete mode 100644 softmmu/trace.h
 rename {softmmu => system}/timers-state.h (100%)
 create mode 100644 system/trace.h
 rename accel/{accel-softmmu.c => accel-system.c} (96%)
 rename gdbstub/{softmmu.c => system.c} (99%)
 rename {softmmu => system}/arch_init.c (100%)
 rename {softmmu => system}/async-teardown.c (100%)
 rename {softmmu => system}/balloon.c (100%)
 rename {softmmu => system}/bootdevice.c (100%)
 rename {softmmu => system}/cpu-throttle.c (100%)
 rename {softmmu => system}/cpu-timers.c (100%)
 rename {softmmu => system}/cpus.c (100%)
 rename {softmmu => system}/datadir.c (100%)
 rename {softmmu => system}/device_tree.c (100%)
 rename {softmmu => system}/dirtylimit.c (100%)
 rename {softmmu => system}/dma-helpers.c (100%)
 rename {softmmu => system}/globals.c (100%)
 rename {softmmu => system}/icount.c (100%)
 rename {softmmu => system}/ioport.c (100%)
 rename {softmmu => system}/main.c (100%)
 rename {softmmu => system}/memory.c (99%)
 rename {softmmu => system}/memory_mapping.c (100%)
 rename {softmmu => system}/physmem.c (99%)
 rename {softmmu => system}/qdev-monitor.c (100%)
 rename {softmmu => system}/qemu-seccomp.c (100%)
 rename {softmmu => system}/qtest.c (100%)
 rename {softmmu => system}/rtc.c (100%)
 rename {softmmu => system}/runstate-action.c (100%)
 rename {softmmu => system}/runstate-hmp-cmds.c (100%)
 rename {softmmu => system}/runstate.c (100%)
 rename {softmmu => system}/tpm-hmp-cmds.c (100%)
 rename {softmmu => system}/tpm.c (100%)
 rename {softmmu => system}/vl.c (100%)
 rename {softmmu => system}/watchpoint.c (100%)
 rename {softmmu => system}/meson.build (100%)
 rename {softmmu => system}/trace-events (99%)

-- 
2.41.0

