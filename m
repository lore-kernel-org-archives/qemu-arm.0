Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w8sm7616636wre.70.2021.06.04.09.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B876F1FFC7;
	Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 48/99] target/arm: remove now useless ifndef from fp_exception_el
Date: Fri,  4 Jun 2021 16:52:21 +0100
Message-Id: <20210604155312.15902-49-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: we5FnPSvdPSD

From: Claudio Fontana <cfontana@suse.de>

after moving the code of fp_exception_el to a sysemu-only module,
we can remove the #ifndef CONFIG_USER_ONLY.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 128616d90d..0d80a0161c 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -417,7 +417,6 @@ int sve_exception_el(CPUARMState *env, int el)
  */
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
-#ifndef CONFIG_USER_ONLY
     /*
      * CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
@@ -507,6 +506,5 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         /* Trap all FP ops to EL3 */
         return 3;
     }
-#endif
     return 0;
 }
-- 
2.20.1
