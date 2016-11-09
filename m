Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l19sm700880wmg.5.2016.11.09.06.58.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 06:58:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E93293E0494;
	Wed,  9 Nov 2016 14:57:57 +0000 (GMT)
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
Subject: [PATCH v6 15/19] target-arm/cpu: don't reset TLB structures, use cputlb to do it
Date: Wed,  9 Nov 2016 14:57:44 +0000
Message-Id: <20161109145748.27282-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161109145748.27282-1-alex.bennee@linaro.org>
References: <20161109145748.27282-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: d1tGoYlRUC0+

cputlb owns the TLB entries and knows how to safely update them in
MTTCG.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 99f0dbe..990bcb1 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -122,7 +122,13 @@ static void arm_cpu_reset(CPUState *s)
 
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
