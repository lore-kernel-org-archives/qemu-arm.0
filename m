Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y128-v6sm5013297wmy.26.2018.09.26.04.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 04:20:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id BBFF43E0442;
	Wed, 26 Sep 2018 12:20:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	omair.javaid@linaro.org,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 2/4] target/arm64: hold BQL when calling do_interrupt()
Date: Wed, 26 Sep 2018 12:20:46 +0100
Message-Id: <20180926112048.17778-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926112048.17778-1-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 18TqUl2soGCm

Fix the assertion failure when running interrupts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 80ad07ed0c..346e1f1a73 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -984,7 +984,9 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
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
