Received: by 10.25.159.19 with SMTP id i19csp1948810lfe;
        Thu, 14 Jan 2016 10:34:17 -0800 (PST)
X-Received: by 10.25.40.11 with SMTP id o11mr1463403lfo.71.1452796454327;
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id g3si3750687lfd.91.2016.01.14.10.34.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000lz-81; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/8] target-arm: support mixed 32/64 bit execution beyond EL0
Date: Thu, 14 Jan 2016 18:34:03 +0000
Message-Id: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-TUID: vuGpe2QBrnep

This patch series fixes the code for ARM exception entry and exit
so that we can support mixed 32/64-bit interprocessing for cases
beyond the current "EL1 is 64-bit, EL0 might be 32-bit or 64-bit".
This involves:
 * making arm_el_is_aa64() handle EL2 and EL3 and their associated
   register-width bits for controlling lower exception levels
 * making the do_interrupt entrypoint determine whether to do a
   32- or 64-bit exception entry dynamically rather than as a
   static property of the CPU class
 * handling exception return from AArch64 to AArch32 for all cases, not
   just where we're returning to EL0
 * fixing the code that picks the AArch64 vector entry point: this
   depends on the register-width of the EL below the target EL, not
   on the width of the EL the exception is taken from

The last two patches fix minor bugs noticed along the way.

PS: I've tested this for various images I have, but I don't actually
happen to have a setup for a 32-bit EL1 under 64-bit EL3 just yet :-)

These patches are written on top of the multi-ases work, though
there shouldn't be any dependencies I think beyond the possible
merely textual.

thanks
-- PMM

Peter Maydell (8):
  target-arm: Properly support EL2 and EL3 in arm_el_is_aa64()
  target-arm: Move aarch64_cpu_do_interrupt() to helper.c
  target-arm: Use a single entry point for AArch64 and AArch32 exceptions
  target-arm: Pull semihosting handling out to arm_cpu_do_interrupt()
  target-arm: Fix wrong AArch64 entry offset for EL2/EL3 target
  target-arm: Handle exception return from AArch64 to non-EL0 AArch32
  target-arm: Implement remaining illegal return event checks
  target-arm: ignore ELR_ELx[1] for exception return to 32-bit ARM mode

 target-arm/cpu-qom.h    |   2 -
 target-arm/cpu.h        |  33 ++++--
 target-arm/cpu64.c      |   3 -
 target-arm/helper-a64.c | 104 -------------------
 target-arm/helper.c     | 268 +++++++++++++++++++++++++++++++++++++++---------
 target-arm/op_helper.c  |  95 +++++++++++++----
 6 files changed, 319 insertions(+), 186 deletions(-)

-- 
1.9.1
