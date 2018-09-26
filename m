Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j27-v6sm6139787wmc.17.2018.09.26.04.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 04:20:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id CEDC73E0489;
	Wed, 26 Sep 2018 12:20:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	omair.javaid@linaro.org,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 3/4] target/arm64: kvm debug set target_el when passing exception to guest
Date: Wed, 26 Sep 2018 12:20:47 +0100
Message-Id: <20180926112048.17778-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926112048.17778-1-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M2/HuAmJ8ajl

When we are debugging the guest all exception come our way but might
be for the guests own debug exceptions. We use the ->do_interrupt()
infrastructure to do this however we are missing a full setup of the
exception structure causing an assert later down the line.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 346e1f1a73..9ceff1884c 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -984,6 +984,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     cs->exception_index = EXCP_BKPT;
     env->exception.syndrome = debug_exit->hsr;
     env->exception.vaddress = debug_exit->far;
+    env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
     cc->do_interrupt(cs);
     qemu_mutex_unlock_iothread();
-- 
2.17.1
