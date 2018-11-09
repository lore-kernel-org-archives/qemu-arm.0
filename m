Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q17-v6sm5985745wrw.17.2018.11.09.07.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:21:21 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 512E83E04A5;
	Fri,  9 Nov 2018 15:21:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 3/7] target/arm64: kvm debug set target_el when passing exception to guest
Date: Fri,  9 Nov 2018 15:21:15 +0000
Message-Id: <20181109152119.9242-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ry58Rth2jHVw

When we are debugging the guest all exceptions come our way but might
be for the guest's own debug exceptions. We use the ->do_interrupt()
infrastructure to inject the exception into the guest. However, we are
missing a full setup of the exception structure, causing an assert
later down the line.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2
  - tweak commit msg for grammar
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index c39150e5e1..46fbe6d8ff 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1000,6 +1000,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     cs->exception_index = EXCP_BKPT;
     env->exception.syndrome = debug_exit->hsr;
     env->exception.vaddress = debug_exit->far;
+    env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
     cc->do_interrupt(cs);
     qemu_mutex_unlock_iothread();
-- 
2.17.1
