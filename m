Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l10sm7192329wrm.2.2021.06.04.09.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B8E8E1FFCF;
	Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 57/99] target/arm: remove kvm include file for PSCI and arm-powerctl
Date: Fri,  4 Jun 2021 16:52:30 +0100
Message-Id: <20210604155312.15902-58-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Rx5I9uaIPyXl

From: Claudio Fontana <cfontana@suse.de>

The QEMU PSCI implementation is not used for KVM,
we do not need the kvm constants header.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-powerctl.h | 2 --
 target/arm/psci.c         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
index 37c8a04f0a..35e048ce14 100644
--- a/target/arm/arm-powerctl.h
+++ b/target/arm/arm-powerctl.h
@@ -11,8 +11,6 @@
 #ifndef QEMU_ARM_POWERCTL_H
 #define QEMU_ARM_POWERCTL_H
 
-#include "kvm-consts.h"
-
 #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
 #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
 #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..800c4a55d8 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "kvm-consts.h"
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "internals.h"
-- 
2.20.1
