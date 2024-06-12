Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c855b959bsm5045462a12.38.2024.06.12.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:35:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2563B5F893;
	Wed, 12 Jun 2024 16:35:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	Alexander Graf <agraf@csgraf.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cameron Esfahani <dirty@apple.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/9] maintainer updates (gdbstub, plugins, time control)
Date: Wed, 12 Jun 2024 16:34:59 +0100
Message-Id: <20240612153508.1532940-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 29lAU/+Zs7bx

Hi,

This is the current state of my maintainer trees. The gdbstub patches
are just minor clean-ups. The main feature this brings in is the
ability for plugins to control time. This has been discussed before
but represents the first time plugins can "control" the execution of
the core. The idea would be to eventually deprecate the icount auto
modes in favour of a plugin and just use icount for deterministic
execution and record/replay.

Alex.

Akihiko Odaki (1):
  plugins: Ensure register handles are not NULL

Alex Bennée (6):
  include/exec: add missing include guard comment
  gdbstub: move enums into separate header
  sysemu: add set_virtual_time to accel ops
  qtest: use cpu interface in qtest_clock_warp
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  plugins: add time control API

Pierrick Bouvier (2):
  qtest: move qtest_{get, set}_virtual_clock to accel/qtest/qtest.c
  contrib/plugins: add ips plugin example for cost modeling

 include/exec/gdbstub.h                        |  11 +-
 include/gdbstub/enums.h                       |  21 +++
 include/qemu/qemu-plugin.h                    |  25 +++
 include/qemu/timer.h                          |  15 ++
 include/sysemu/accel-ops.h                    |  18 +-
 include/sysemu/cpu-timers.h                   |   3 +-
 include/sysemu/qtest.h                        |   2 -
 accel/hvf/hvf-accel-ops.c                     |   2 +-
 accel/kvm/kvm-all.c                           |   2 +-
 accel/qtest/qtest.c                           |  13 ++
 accel/tcg/tcg-accel-ops.c                     |   2 +-
 contrib/plugins/ips.c                         | 164 ++++++++++++++++++
 gdbstub/user.c                                |   1 +
 monitor/hmp-cmds.c                            |   3 +-
 plugins/api.c                                 |  39 ++++-
 ...t-virtual-clock.c => cpus-virtual-clock.c} |   5 +
 system/cpus.c                                 |  11 ++
 system/qtest.c                                |  37 +---
 system/vl.c                                   |   1 +
 target/arm/hvf/hvf.c                          |   2 +-
 target/arm/hyp_gdbstub.c                      |   2 +-
 target/arm/kvm.c                              |   2 +-
 target/i386/kvm/kvm.c                         |   2 +-
 target/ppc/kvm.c                              |   2 +-
 target/s390x/kvm/kvm.c                        |   2 +-
 util/qemu-timer.c                             |  26 +++
 contrib/plugins/Makefile                      |   1 +
 plugins/qemu-plugins.symbols                  |   2 +
 stubs/meson.build                             |   2 +-
 29 files changed, 357 insertions(+), 61 deletions(-)
 create mode 100644 include/gdbstub/enums.h
 create mode 100644 contrib/plugins/ips.c
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)

-- 
2.39.2
