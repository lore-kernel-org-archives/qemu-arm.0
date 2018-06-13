Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e2-v6sm3664201wro.97.2018.06.13.05.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:01 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 333DD3E106A;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 00/22] SVE support and various misc fixes
Date: Wed, 13 Jun 2018 13:55:39 +0100
Message-Id: <20180613125601.14371-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UmOwzGJpwWhY

Hi,

The core concept of the code hasn't changed much but I've done some
restructuring so we can still use an SVE enabled binary to run our
existing tests without having to regenerate everything. I've folded a
bunch of Richard's fixes into the relevant patches and also split some
patches up that make sense on their own. The code is also now smarter
about only worrying about SVE or SIMD to save on duplicating effort.

Thee are also a smattering of misc fixes for the build system, headers
and adding more feedback into help.

There are perhaps more #ifdef SVE_MAGIC's than I'd like but overall
I'm pretty happy with it. My main problem now is making sure I
generate patterns for an exhaustive coverage of the SVE instruction
set that we can fully exercise everything. Manually adding stuff to
aarch64.risu is more than a little error prone.

Alex Bennée (16):
  risu_reginfo_aarch64: include signal.h for FPSIMD_MAGIC
  comms: include header for writev
  build-all-arches: expand the range of docker images
  build-all-arches: do a distclean $(SRC) configured
  risu: add zlib indication to help text
  Makefile: include risu_reginfo_$(ARCH) in HDRS
  risugen: add --sve support
  contrib/generate_all.sh: allow passing of arguments to risugen
  risu: move optional args to each architecture
  risu_reginfo_aarch64: drop stray ;
  risu_reginfo_aarch64: unionify VFP regs
  risu_reginfo: introduce reginfo_size()
  risu_reginfo_aarch64: left justify regnums and drop masks
  risu_reginfo_aarch64: add support for copying SVE register state
  risu_reginfo_aarch64: add SVE support to reginfo_dump_mismatch
  risu_reginfo_aarch64: handle variable VQ

Richard Henderson (6):
  risugen: Initialize sve predicates with random data
  risugen: use fewer insns for aarch64 immediate load
  risugen: add reg_plus_imm_pl and reg_plus_imm_vl address helpers
  risugen: add dtype_msz address helper
  risu: add process_arch_opt
  risu_reginfo_aarch64: limit SVE_VQ_MAX to current architecture

 Makefile                |   5 +-
 build-all-archs         |  12 +-
 comms.c                 |   1 +
 contrib/generate_all.sh |  14 +-
 reginfo.c               |   6 +-
 risu.c                  |  51 ++++---
 risu.h                  |  12 +-
 risu_reginfo_aarch64.c  | 288 ++++++++++++++++++++++++++++++++++++----
 risu_reginfo_aarch64.h  |  31 ++++-
 risu_reginfo_arm.c      |  22 +++
 risu_reginfo_m68k.c     |  14 ++
 risu_reginfo_ppc64.c    |  14 ++
 risugen                 |   3 +
 risugen_arm.pm          | 243 ++++++++++++++++++++++++++++++---
 14 files changed, 639 insertions(+), 77 deletions(-)

-- 
2.17.1
