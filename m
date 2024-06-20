Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f600cde92sm708227466b.205.2024.06.20.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:22:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F14C35F7B1;
	Thu, 20 Jun 2024 16:22:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	Cameron Esfahani <dirty@apple.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/12] maintainer updates pre-PR (gdbstub, plugins, time control)
Date: Thu, 20 Jun 2024 16:22:08 +0100
Message-Id: <20240620152220.2192768-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 7H7sg+CUWQh+

Hi,

This is the current state of my maintainer trees. The gdbstub patches
are just minor clean-ups. The main feature this brings in is the
ability for plugins to control time. This has been discussed before
but represents the first time plugins can "control" the execution of
the core. The idea would be to eventually deprecate the icount auto
modes in favour of a plugin and just use icount for deterministic
execution and record/replay.

v2
  - merged in Pierrick's fixes
  - added migration blocker
  - added Max's plugin tweak

I'll send the PR on Monday if nothing comes up. The following still need review:

  plugins: add migration blocker

Alex.

Akihiko Odaki (1):
  plugins: Ensure register handles are not NULL

Alex Bennée (7):
  include/exec: add missing include guard comment
  gdbstub: move enums into separate header
  sysemu: add set_virtual_time to accel ops
  qtest: use cpu interface in qtest_clock_warp
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  plugins: add time control API
  plugins: add migration blocker

Max Chou (1):
  accel/tcg: Avoid unnecessary call overhead from
    qemu_plugin_vcpu_mem_cb

Pierrick Bouvier (3):
  qtest: move qtest_{get, set}_virtual_clock to accel/qtest/qtest.c
  contrib/plugins: add Instructions Per Second (IPS) example for cost
    modeling
  plugins: fix inject_mem_cb rw masking

 include/exec/gdbstub.h                        |  11 +-
 include/gdbstub/enums.h                       |  21 +++
 include/qemu/qemu-plugin.h                    |  27 +++
 include/qemu/timer.h                          |  15 ++
 include/sysemu/accel-ops.h                    |  18 +-
 include/sysemu/cpu-timers.h                   |   3 +-
 include/sysemu/qtest.h                        |   2 -
 accel/hvf/hvf-accel-ops.c                     |   2 +-
 accel/kvm/kvm-all.c                           |   2 +-
 accel/qtest/qtest.c                           |  13 ++
 accel/tcg/plugin-gen.c                        |   4 +-
 accel/tcg/tcg-accel-ops.c                     |   2 +-
 contrib/plugins/ips.c                         | 164 ++++++++++++++++++
 gdbstub/user.c                                |   1 +
 monitor/hmp-cmds.c                            |   3 +-
 plugins/api.c                                 |  47 ++++-
 plugins/core.c                                |   4 +-
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
 accel/tcg/ldst_common.c.inc                   |   8 +-
 contrib/plugins/Makefile                      |   1 +
 plugins/qemu-plugins.symbols                  |   2 +
 stubs/meson.build                             |   2 +-
 32 files changed, 377 insertions(+), 67 deletions(-)
 create mode 100644 include/gdbstub/enums.h
 create mode 100644 contrib/plugins/ips.c
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)

-- 
2.39.2
