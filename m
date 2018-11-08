Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o130-v6sm7213212wmd.11.2018.11.08.08.33.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 08:33:32 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 22F1C3E04A5;
	Thu,  8 Nov 2018 16:33:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 3/6] target/arm64: kvm debug set target_el when passing exception to guest
Date: Thu,  8 Nov 2018 16:33:26 +0000
Message-Id: <20181108163329.19940-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181108163329.19940-1-alex.bennee@linaro.org>
References: <20181108163329.19940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tdlW6CDmMSPv

When we are debugging the guest all exceptions come our way but might
be for the guest's own debug exceptions. We use the ->do_interrupt()
infrastructure to inject the exception into the guest. However, we are
missing a full setup of the exception structure, causing an assert
later down the line.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v2
  - tweak commit msg for grammar
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 03b0f78831..bf7824d862 100644
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
