Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003f42ceb3bf4sm2936982wmj.32.2023.05.19.10.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:04:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9C6BA1FFBB;
	Fri, 19 May 2023 18:04:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Mark Burton <mburton@qti.qualcomm.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 0/8] plugins/next: bugfixs and iops based time control RFC
Date: Fri, 19 May 2023 18:04:46 +0100
Message-Id: <20230519170454.2353945-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: YQkVjE8RS+Da

Hi,

There are a couple of bug fixes in here but also the RFC for exposing
time control to the plugin. Its very rough and ready and I've not done
very many tests on the stability of the time slowing down but reducing
the iops value does seem to at least get reflected in slower dhrystone
scores.

Alex.

Alex Bennée (8):
  plugins: force slow path when plugins instrument memory ops
  plugins: fix memory leak while parsing options
  plugins: update lockstep to use g_memdup2
  sysemu: add set_virtual_time to accel ops
  qtest: use cpu interface in qtest_clock_warp
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  plugins: add time control API
  contrib/plugins: add iops plugin example for cost modelling

 include/exec/cpu-all.h                        |   2 +-
 include/hw/core/cpu.h                         |  17 ++
 include/qemu/qemu-plugin.h                    |  19 ++
 include/qemu/timer.h                          |  15 +
 include/sysemu/accel-ops.h                    |  18 +-
 include/sysemu/cpu-timers.h                   |   3 +-
 include/sysemu/qtest.h                        |   1 +
 accel/qtest/qtest.c                           |   1 +
 accel/tcg/cputlb.c                            |   4 +-
 accel/tcg/user-exec.c                         |   6 +-
 contrib/plugins/cache.c                       |   2 +-
 contrib/plugins/drcov.c                       |   2 +-
 contrib/plugins/execlog.c                     |   2 +-
 contrib/plugins/hotblocks.c                   |   2 +-
 contrib/plugins/hotpages.c                    |   2 +-
 contrib/plugins/howvec.c                      |   2 +-
 contrib/plugins/hwprofile.c                   |   2 +-
 contrib/plugins/iops.c                        | 260 ++++++++++++++++++
 contrib/plugins/lockstep.c                    |   4 +-
 plugins/api.c                                 |  22 ++
 softmmu/cpus.c                                |  11 +
 softmmu/qtest.c                               |  26 +-
 ...t-virtual-clock.c => cpus-virtual-clock.c} |   5 +
 target/arm/tcg/sve_helper.c                   |   4 -
 tests/plugin/bb.c                             |   2 +-
 tests/plugin/insn.c                           |   2 +-
 tests/plugin/mem.c                            |   2 +-
 tests/plugin/syscall.c                        |   2 +-
 util/qemu-timer.c                             |  26 ++
 contrib/plugins/Makefile                      |   1 +
 plugins/qemu-plugins.symbols                  |   2 +
 stubs/meson.build                             |   2 +-
 tests/tcg/aarch64/Makefile.target             |   8 +
 33 files changed, 433 insertions(+), 46 deletions(-)
 create mode 100644 contrib/plugins/iops.c
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)

-- 
2.39.2
