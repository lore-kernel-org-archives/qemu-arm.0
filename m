Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v129-v6sm1458686wme.45.2018.11.09.07.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:21:21 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3EC5F3E0467;
	Fri,  9 Nov 2018 15:21:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 2/7] target/arm64: hold BQL when calling do_interrupt()
Date: Fri,  9 Nov 2018 15:21:14 +0000
Message-Id: <20181109152119.9242-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fTtGTFOLC3xx

Fix the assertion failure when running interrupts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 6351a54b28..c39150e5e1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1000,7 +1000,9 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     cs->exception_index = EXCP_BKPT;
     env->exception.syndrome = debug_exit->hsr;
     env->exception.vaddress = debug_exit->far;
+    qemu_mutex_lock_iothread();
     cc->do_interrupt(cs);
+    qemu_mutex_unlock_iothread();
 
     return false;
 }
-- 
2.17.1
