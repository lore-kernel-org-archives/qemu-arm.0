Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id hh8sm12802167wjc.42.2016.03.18.09.18.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Mar 2016 09:19:00 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 131663E0520;
	Fri, 18 Mar 2016 16:18:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Spyridakis <a.spyridakis@virtualopensystems.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC v1 05/11] target-arm/psci.c: wake up sleeping CPUs
Date: Fri, 18 Mar 2016 16:18:46 +0000
Message-Id: <1458317932-1875-6-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458317932-1875-1-git-send-email-alex.bennee@linaro.org>
References: <1458317932-1875-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ISufVOldxTtP

Testing with Alexander's bare metal syncronisation tests fails in MTTCG
leaving one CPU spinning forever waiting for the second CPU to wake up.
We simply need to poke the halt_cond once we have processed the PSCI
power on call.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
CC: Alexander Spyridakis <a.spyridakis@virtualopensystems.com>
Message-Id: <1439220437-23957-20-git-send-email-fred.konrad@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target-arm/psci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target-arm/psci.c b/target-arm/psci.c
index c55487f..8e937d8 100644
--- a/target-arm/psci.c
+++ b/target-arm/psci.c
@@ -212,6 +212,8 @@ void arm_handle_psci_call(ARMCPU *cpu)
         }
         target_cpu_class->set_pc(target_cpu_state, entry);
 
+        qemu_cpu_kick(target_cpu_state);
+
         ret = 0;
         break;
     case QEMU_PSCI_0_1_FN_CPU_OFF:
-- 
2.7.3
