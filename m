Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b207sm1255545wmb.0.2016.06.03.13.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2016 13:40:35 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E8F333E2F23;
	Fri,  3 Jun 2016 21:40:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org,
	bobby.prani@gmail.com
Cc: mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Spyridakis <a.spyridakis@virtualopensystems.com>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC v3 09/19] target-arm/arm-powerctl: wake up sleeping CPUs
Date: Fri,  3 Jun 2016 21:40:18 +0100
Message-Id: <1464986428-6739-10-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1464986428-6739-1-git-send-email-alex.bennee@linaro.org>
References: <1464986428-6739-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Yl/7MYkyUS1r

Testing with Alexander's bare metal syncronisation tests fails in MTTCG
leaving one CPU spinning forever waiting for the second CPU to wake up.
We simply need to kick the vCPU once we have processed the PSCI power on
call.

As the power control API is for system emulation only as is the
qemu_kick_cpu function we also ensure we only build arm-powerctl for
SoftMMU builds.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
CC: Alexander Spyridakis <a.spyridakis@virtualopensystems.com>
Message-Id: <1439220437-23957-20-git-send-email-fred.konrad@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

---
v3
  - re-base caught arm_powerctl re-factor
  - include cpu.h header for kick definition
  - fix Makefile.objs to only build for softmmu
---
 target-arm/Makefile.objs  | 2 +-
 target-arm/arm-powerctl.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target-arm/Makefile.objs b/target-arm/Makefile.objs
index f206411..847fb52 100644
--- a/target-arm/Makefile.objs
+++ b/target-arm/Makefile.objs
@@ -9,4 +9,4 @@ obj-y += neon_helper.o iwmmxt_helper.o
 obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
 obj-y += crypto_helper.o
-obj-y += arm-powerctl.o
+obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
diff --git a/target-arm/arm-powerctl.c b/target-arm/arm-powerctl.c
index d452230..4baa051 100644
--- a/target-arm/arm-powerctl.c
+++ b/target-arm/arm-powerctl.c
@@ -166,6 +166,8 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, entry);
 
+    qemu_cpu_kick(target_cpu_state);
+
     /* We are good to go */
     return QEMU_ARM_POWERCTL_RET_SUCCESS;
 }
-- 
2.7.4
