Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b8sm5464966wmd.35.2021.06.04.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A236E1FFCE;
	Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 56/99] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Fri,  4 Jun 2021 16:52:29 +0100
Message-Id: <20210604155312.15902-57-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Avw5JchpiZZV

From: Claudio Fontana <cfontana@suse.de>

After this patch it is possible to build only kvm:

./configure --disable-tcg --enable-kvm

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index c09c89eeac..2d3fe4f643 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -917,11 +917,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
 
     if (cur_el < new_el) {
         /*
-- 
2.20.1
