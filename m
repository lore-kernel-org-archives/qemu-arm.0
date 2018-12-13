Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a1sm1062068wrw.76.2018.12.13.03.55.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Dec 2018 03:55:03 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 71ACD3E031D;
	Thu, 13 Dec 2018 11:55:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	mark.rutland@arm.com,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/2] Fix kvm guest debugging of AA32 guests on AA64
Date: Thu, 13 Dec 2018 11:55:01 +0000
Message-Id: <20181213115503.24188-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gOVCB4lYQpMp

Hi,

This is an attempt to fix debugging of AArch32 binaries when running
under KVM on AArch64 hardware. There are two parts to this, the first is
a handling the possibility of AArch32 software breakpoints with a
heuristic based on the current execution mode. The second part is
delaying the setup of aarch64 debugging until the shared arm_cpu_realize
function is run by which point we have parsed and decoded the actual
execution mode of the guest. This doesn't solve the problem of split
mode guests which switch between an AA64 EL1 and an AA32 EL0 though.

I still ran into a problem with single-step. Even with Mark's
single-step fixup series:

  To: linux-arm-kernel@lists.infradead.org
  Cc: kvmarm@lists.cs.columbia.edu,
  Subject: [PATCH 0/2] kvm/arm: make singlestep behaviour consistent
  Date: Fri, 9 Nov 2018 15:07:09 +0000
  Message-Id: <20181109150711.45864-1-mark.rutland@arm.com>

some instructions do single-step but sometimes the single-step doesn't
return leading to a runaway until it hits a breakpoint. I'm not sure why
this is the case because the SS state machine shouldn't be instruction
sensitive.

However these two patches at least make it possible to debug an AArch32
guest.

Alex Bennée (2):
  target/arm: kvm64 make guest debug AA32 break point aware
  target/arm: defer setting up of aarch64 gdb until arm_cpu_realize

 include/hw/arm/arm.h |  2 ++
 target/arm/cpu.c     |  4 ++++
 target/arm/cpu64.c   | 20 +++++++++++++++-----
 target/arm/kvm64.c   | 13 ++++++++++---
 4 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.17.1
