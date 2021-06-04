Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l16sm9378070wmj.47.2021.06.04.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 644F61FFD3;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v16 62/99] target/arm: remove kvm-stub.c
Date: Fri,  4 Jun 2021 16:52:35 +0100
Message-Id: <20210604155312.15902-63-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yNWoXfaS46/y

From: Claudio Fontana <cfontana@suse.de>

the functions used in machine.c are now protected via
if (kvm_enabled()), so the stub is not needed.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm-stub.c | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 target/arm/kvm-stub.c

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
deleted file mode 100644
index 56a7099e6b..0000000000
--- a/target/arm/kvm-stub.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU KVM ARM specific function stubs
- *
- * Copyright Linaro Limited 2013
- *
- * Author: Peter Maydell <peter.maydell@linaro.org>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_arm.h"
-
-bool write_kvmstate_to_list(ARMCPU *cpu)
-{
-    abort();
-}
-
-bool write_list_to_kvmstate(ARMCPU *cpu, int level)
-{
-    abort();
-}
-- 
2.20.1
