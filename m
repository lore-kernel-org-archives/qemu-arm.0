Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z88sm497381wrb.26.2017.03.07.07.50.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Mar 2017 07:50:53 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 327093E3034;
	Tue,  7 Mar 2017 15:50:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v3 10/11] target/arm/helper: make it clear the EC field is also in hex
Date: Tue,  7 Mar 2017 15:50:53 +0000
Message-Id: <20170307155054.5833-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170307155054.5833-1-alex.bennee@linaro.org>
References: <20170307155054.5833-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3we0cPl7I1DP

..just like the rest of the displayed ESR register. Otherwise people
might scratch their heads if a not obviously hex number is displayed
for the EC field.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: KONRAD Frederic <fred.konrad@greensocs.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f4211b572..76b608f0ba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6857,7 +6857,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && !excp_is_internal(cs->exception_index)) {
-        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
+        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
                       env->exception.syndrome >> ARM_EL_EC_SHIFT,
                       env->exception.syndrome);
     }
-- 
2.11.0
