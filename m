Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m8-v6sm5027797wrr.50.2018.06.22.07.12.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 5635C3E00E9;
	Fri, 22 Jun 2018 15:12:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 00/22] ARM SVE support for RISU
Date: Fri, 22 Jun 2018 15:11:43 +0100
Message-Id: <20180622141205.16306-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 68YdJjv0RWH2

Hi Peter,

Not much different from v3 apart from the last SVE register dump patch
is now fatter with stuff that was from the handle variable VQ series.
The binary format has stayed the same and we have a current test set
for SVE at:

  http://people.linaro.org/~alex.bennee/testcases/arm64.risu/sve-all-short-v83+sve.tar.xz

Unless you have any comments I reckon these are ready to be merged.

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
 risu_reginfo_aarch64.c  | 308 +++++++++++++++++++++++++++++++++++-----
 risu_reginfo_aarch64.h  |  31 +++-
 risu_reginfo_arm.c      |  22 +++
 risu_reginfo_m68k.c     |  14 ++
 risu_reginfo_ppc64.c    |  14 ++
 risugen                 |   3 +
 risugen_arm.pm          | 243 ++++++++++++++++++++++++++++---
 14 files changed, 649 insertions(+), 87 deletions(-)

-- 
2.17.1
