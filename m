Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e190sm20162141wma.15.2016.04.05.08.32.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Apr 2016 08:32:36 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 5398A3E0587;
	Tue,  5 Apr 2016 16:32:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Spyridakis <a.spyridakis@virtualopensystems.com>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC v2 06/11] target-arm/psci.c: wake up sleeping CPUs
Date: Tue,  5 Apr 2016 16:32:19 +0100
Message-Id: <1459870344-16773-7-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1459870344-16773-1-git-send-email-alex.bennee@linaro.org>
References: <1459870344-16773-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7vAVlj0nOS1W

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
2.7.4
