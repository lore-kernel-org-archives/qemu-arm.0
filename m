Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p184sm3845454wmg.3.2016.10.27.08.19.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Oct 2016 08:19:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 736973E04CC;
	Thu, 27 Oct 2016 16:11:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	mark.burton@greensocs.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v5 30/33] target-arm/cpu: don't reset TLB structures, use cputlb to do it
Date: Thu, 27 Oct 2016 16:10:27 +0100
Message-Id: <20161027151030.20863-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161027151030.20863-1-alex.bennee@linaro.org>
References: <20161027151030.20863-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: x1FFMwTtnF3B

cputlb owns the TLB entries and knows how to safely update them in
MTTCG.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 1b9540e..ff8c594 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -121,7 +121,13 @@ static void arm_cpu_reset(CPUState *s)
 
     acc->parent_reset(s);
 
+#ifdef CONFIG_SOFTMMU
+    memset(env, 0, offsetof(CPUARMState, tlb_table));
+    tlb_flush(s, 0);
+#else
     memset(env, 0, offsetof(CPUARMState, features));
+#endif
+
     g_hash_table_foreach(cpu->cp_regs, cp_reg_reset, cpu);
     g_hash_table_foreach(cpu->cp_regs, cp_reg_check_reset, cpu);
 
-- 
2.10.1
