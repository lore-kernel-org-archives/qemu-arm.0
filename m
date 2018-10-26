Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880688wro;
        Fri, 26 Oct 2018 08:31:49 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cEwDT4pIbq3af47XCOHHeSxn8p/voxSuPTNO5iEFTO/7Xt9Bie+27s+jkCNu/5570y6e1m
X-Received: by 2002:a5d:514c:: with SMTP id u12-v6mr5764285wrt.299.1540567909264;
        Fri, 26 Oct 2018 08:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567909; cv=none;
        d=google.com; s=arc-20160816;
        b=zAknEF87DWcV2Z30MEJ3kP2aIEEMfDFHBSr0WdozJ9S1CeOsrm/jNpdaOhjl9W+kXa
         1b5GyJODd6sFjI69jE1c3tsgTZ3lk2kap1hlmv+L1epkXCMi4niF+rG9t6YYIXt4mgbo
         uQvmiAuqlbqJ279C9yV48/RE32Ehq1I84yB/gpm/XHB9F1H7Y2ApQ/PO89HTs44i5+84
         qsAJ9RfTsulQLfgxbWoW9eF099f3BAymZM+zQfBQZedCbkVXL56W6RW3F5en7f6NTyWB
         EtwGdSC9XFKbkiF9rOq80L9XIdnD+A9oKpTRY8i/AL8E3VF+roMs3YLl6Y6/2TRR4u4Z
         ZJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=VEJOdkzMdVdSdvzExUC6ZjoTXIcn9moqGhUh7veLONg=;
        b=Xj9niUA3jLnP2f1v/m5Oq8s1gEttmZuq4njWRWqfGlqSUln1nsYz1FJnSUGRfyrJTl
         z9NGcoAUYOw1um4vCWPzmRXs8VqC70+gmATR/P0pVNv+nUbzB+nCEhEbpoAPA2gBZfhx
         ioyeJPCoamsSnlRTBkwwjUOJvjaFDFvDX8OixHLCY2DCksxT2LJ5LNhe12t62zCSp19g
         i3xBSAjOdcls7YMDWwW2mwgW/sEJWBjT9TenMsxuXG21EvbfrpWWY0ZPdGFJULZ1hVmu
         LZlfrh/H4Th3lZGlr3NCLrheq2zaTifaWt69TKLiWOlc0MD4Wg8Cg1oF6eqglAWowfHl
         /mPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id n2-v6si3612160wmn.138.2018.10.26.08.31.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:31:49 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqZE0-1flLyM3MpM-00malX; Fri, 26 Oct 2018 17:31:39 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqZE0-1flLyM3MpM-00malX; Fri, 26 Oct 2018 17:31:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 00/20] Trivial patches patches
Date: Fri, 26 Oct 2018 17:31:05 +0200
Message-Id: <20181026153125.24738-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lYLc1dx4To2RSwjjCvunpxVW/UC94x9ZcQQD10Npw1/m6/TQTJu
 4bLxzIwBRhh1RckGCgaJWrNiEDLCE3nva/OQycJVuz/m6orNEK44F9UGVuWzdTUqr1xXch7
 KiQXh/lwhpPO5r3Wee/YAB7yi0Xs9ExTkGXkeiynF8MHDveAUhNgSbsc/Cfb2YpB89R3xry
 YX1OUniZ2Kei65SOoc1zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:TwBvokqDqs8=:7NNa5we2tf8XWjjxtO1SsF
 q8ps1V/D/qgqSAu5kQL7PRFhn2hPIV7EsNLYh4nrqicfdEkSmwCJUfWs4EsT2PlpAUNxFYG47
 jWhN4gwDfASFyZEZ5XSB4oqJasKzRtsh8W+Ni3cqmFFdgNyJDWwAxnu4gTwtCNXMnJK5+SKCv
 P8r2QD7gof6hlPbacyTmiCgHC/Fe/qs65olEfbwwkrUs2KBMWEe0CP0FYcRs8taiX6L8W5ilY
 0bZhRz5nY/sJqYauaACnqEIZHbOy8ES4NpQsN5wbKPDxDYY+FXxnLEk9Ak2Y+XCORFsfktIKk
 cHoBlXDC1dr1D1W9biSO4f/FP7UwZpmNSu58UTEiSaZIdi9a7WfdjTPUJrtT48XcWr4pyOMDU
 zwr5i2woMbgJte7wPSXwR2dv7aMr+B90iHJeNaYOrPq7e1LDGkA6aUlv5PplZ3z3iPwuu/Sx0
 s6WaeqUFeJnjadcLDr0DP54a8VDO2p35yrTn7eu82e9i6T0YBGNZK3BhJpeiLvGAW9BFdIVQB
 +8MWVyLHaLtxEHgSFps7KPBZBdne20HuDzFmcC89k1XivU8k/OiPJxZW0Y5YtmfxQcdZyJlP2
 eMk5a4saeXGlcdOOgz8rIHi3b3NTvyuP5c/2n0L18GJ5ABDMhubGlXoFdDvEqyCrr79h9DrT6
 i4i1gKiyZFrKLfsPwG11vv2kUePyK+QELr9l3NIYj0oxzDY93tM5zRyuymcjR3NXi9t3H+pyU
 TZ3F5x1V5PY3ur36
X-TUID: RNHYUcrRx5Di

The following changes since commit 808ebd66e467f77c0d1f8c6346235f81e9c99cf2:

  Merge remote-tracking branch 'remotes/riscv/tags/riscv-for-master-3.1-sf0' into staging (2018-10-25 17:41:03 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to 4b03da6e87c34793137a231b558231fd406c05e8:

  ppc: move at24c to its own CONFIG_ symbol (2018-10-26 17:17:32 +0200)

----------------------------------------------------------------
QEMU trivial patches collected between June and October 2018
(Thank you to Thomas Huth)

----------------------------------------------------------------

Cleber Rosa (6):
  tests/tcg/README: fix location for lm32 tests
  qemu-iotests: fix filename containing checks
  docs/devel/testing.rst: add missing newlines after code block
  scripts/decodetree.py: remove unused imports
  scripts/qemu.py: remove trailing quotes on docstring
  qemu-iotests: make 218 executable

Emilio G. Cota (1):
  linux-user: fix comment s/atomic_write/atomic_set/

Li Qiang (2):
  memory.h: fix typos in comments
  cpu.h: fix a typo in comment

Paolo Bonzini (1):
  ppc: move at24c to its own CONFIG_ symbol

Philippe Mathieu-Daudé (6):
  qobject: Catch another straggler for use of qdict_put_str()
  xen: Use the PCI_DEVICE macro
  tests/bios-tables-test: Remove an useless cast
  hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
  hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro
  milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of
    error_report

Stefan Weil (2):
  tests: Fix typos in comments and help message (found by codespell)
  configure: Support pkg-config for zlib

Thomas Huth (1):
  configs/alpha: Remove unused CONFIG_PARALLEL_ISA switch

yuchenlin (1):
  vga_int: remove unused function protype

 configure                             | 40 +++++++++++++++------------
 default-configs/alpha-softmmu.mak     |  1 -
 default-configs/ppc-softmmu.mak       |  1 +
 docs/devel/testing.rst                |  2 ++
 hw/display/vga_int.h                  |  1 -
 hw/net/milkymist-minimac2.c           | 14 ++++++----
 hw/nvram/Makefile.objs                |  2 +-
 hw/pci-host/piix.c                    |  2 +-
 hw/pci-host/q35.c                     |  2 +-
 hw/xen/xen_pt_config_init.c           |  8 +++---
 include/exec/memory.h                 |  6 ++--
 include/hw/intc/arm_gicv3_common.h    |  2 +-
 include/qom/cpu.h                     |  2 +-
 linux-user/qemu.h                     |  2 +-
 qobject/block-qdict.c                 |  2 +-
 scripts/decodetree.py                 |  2 --
 scripts/qemu.py                       |  2 +-
 tests/bios-tables-test.c              |  4 +--
 tests/docker/Makefile.include         |  2 +-
 tests/docker/docker.py                |  4 +--
 tests/guest-debug/test-gdbstub.py     |  2 +-
 tests/qemu-iotests/218                |  0
 tests/qemu-iotests/common.qemu        |  2 +-
 tests/qemu-iotests/common.rc          |  4 +--
 tests/tcg/Makefile.include            |  2 +-
 tests/tcg/Makefile.probe              |  2 +-
 tests/tcg/README                      |  2 +-
 tests/tcg/mips/mips64-dsp/subq_s_pw.c |  2 +-
 28 files changed, 63 insertions(+), 54 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/218

-- 
2.17.2
