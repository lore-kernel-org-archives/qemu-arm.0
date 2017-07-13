Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k15sm4475296wre.9.2017.07.13.07.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jul 2017 07:19:29 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DA60A3E004E;
	Thu, 13 Jul 2017 15:19:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 0/6] arm: fixes for eret, isb and DISAS_UPDATE handling
Date: Thu, 13 Jul 2017 15:19:22 +0100
Message-Id: <20170713141928.25419-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YaaFyYrKXDKj

Hi Peter,

All reviews are now in and I've tested against AArch64 OPTEE xtest
suite and it fixes the hang. Apart from review tags there was one
minor tweak to gen_goto_tb so it always sets s->is_jmp =
DISAS_TB_JUMP;

I reckon these are ready to be taken into the ARM tree now.

Regards,

Alex Bennée (6):
  include/exec/exec-all: document common exit conditions
  target/arm/translate: make DISAS_UPDATE match declared semantics
  target/arm/translate.h: expand comment on DISAS_EXIT
  target/arm/translate: ensure gen_goto_tb sets exit flags
  target/arm: use gen_goto_tb for ISB handling
  target/arm: use DISAS_EXIT for eret handling

 include/exec/exec-all.h    | 29 ++++++++++++++++++++++++++---
 target/arm/translate-a64.c | 19 ++++++++++---------
 target/arm/translate.c     | 21 +++++++++++++--------
 target/arm/translate.h     |  5 ++++-
 4 files changed, 53 insertions(+), 21 deletions(-)

-- 
2.13.0
