Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p81sm6836306wrc.61.2017.11.08.07.32.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 07:32:46 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A42133E009E;
	Wed,  8 Nov 2017 15:32:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/2] fixing translation time segfaults
Date: Wed,  8 Nov 2017 15:32:43 +0000
Message-Id: <20171108153245.20740-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: axGb3pUcnbJr

Hi,

This is a follow up to the patch I posted yesterday. I've made some
clean-ups to the comments and logic as suggested from the review.
Additionally I've added a clean-up patch which tidied up all the
call-sites which no longer need to check retaddr/pc before calling
cpu_restore_state.

Alex Bennée (2):
  accel/tcg/translate-all: expand cpu_restore_state addr check
  target/*helper: don't check retaddr before calling cpu_restore_state

 accel/tcg/translate-all.c                  | 52 +++++++++++++++++-------------
 include/exec/exec-all.h                    | 11 +++++++
 scripts/coccinelle/cpu_restore_state.cocci | 12 +++++++
 target/alpha/mem_helper.c                  | 12 ++-----
 target/arm/op_helper.c                     | 17 +++-------
 target/i386/svm_helper.c                   |  4 +--
 target/lm32/op_helper.c                    |  7 ++--
 target/m68k/op_helper.c                    |  7 ++--
 target/microblaze/op_helper.c              |  7 ++--
 target/moxie/helper.c                      |  4 +--
 target/nios2/mmu.c                         |  7 ++--
 target/openrisc/mmu_helper.c               |  7 ++--
 target/s390x/excp_helper.c                 |  4 +--
 target/tricore/op_helper.c                 | 11 ++-----
 target/unicore32/op_helper.c               |  7 ++--
 15 files changed, 77 insertions(+), 92 deletions(-)
 create mode 100644 scripts/coccinelle/cpu_restore_state.cocci

-- 
2.14.2
