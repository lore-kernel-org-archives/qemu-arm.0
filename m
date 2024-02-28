Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s28-20020a05600c319c00b00412a38e732csm1867729wmp.35.2024.02.28.03.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 03:57:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 05ECF5F8CE;
	Wed, 28 Feb 2024 11:57:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 01/29] tests/tcg: update licenses to GPLv2 as intended
Date: Wed, 28 Feb 2024 11:56:33 +0000
Message-Id: <20240228115701.1416107-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228115701.1416107-1-alex.bennee@linaro.org>
References: <20240228115701.1416107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N3PU34tGW1iO

My default header template is GPLv3 but for QEMU code we really should
stick to GPLv2-or-later (allowing others to up-license it if they
wish). While this is test code we should still be consistent on the
source distribution.

I wrote all of this code so its not a problem. However there remains
one GPLv3 file left which is the crt0-tc2x.S for TriCore.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240227144335.1196131-2-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/semicall.h b/tests/tcg/aarch64/semicall.h
index 8a3fce35c5f..30d4de9a549 100644
--- a/tests/tcg/aarch64/semicall.h
+++ b/tests/tcg/aarch64/semicall.h
@@ -1,10 +1,10 @@
 /*
  * Semihosting Tests - AArch64 helper
  *
- * Copyright (c) 2019
+ * Copyright (c) 2019, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index ad8ac51310b..624937c5577 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -1,10 +1,10 @@
 /*
  * Semihosting Tests - ARM Helper
  *
- * Copyright (c) 2019
+ * Copyright (c) 2019, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/tests/tcg/multiarch/float_helpers.h b/tests/tcg/multiarch/float_helpers.h
index 309f3f4bf10..c42ebe64b9e 100644
--- a/tests/tcg/multiarch/float_helpers.h
+++ b/tests/tcg/multiarch/float_helpers.h
@@ -1,9 +1,9 @@
 /*
  * Common Float Helpers
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <inttypes.h>
diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
index f8c88f32dc5..11d0650cb06 100644
--- a/tests/tcg/riscv64/semicall.h
+++ b/tests/tcg/riscv64/semicall.h
@@ -1,10 +1,10 @@
 /*
  * Semihosting Tests - RiscV64 Helper
  *
- * Copyright (c) 2021
+ * Copyright (c) 2021, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/tests/tcg/multiarch/arm-compat-semi/semiconsole.c b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
index 1d82efc589d..1e2268f4b75 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
@@ -1,10 +1,10 @@
 /*
  * linux-user semihosting console
  *
- * Copyright (c) 2019
+ * Copyright (c) 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #define SYS_READC       0x07
diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index 8627eee3cf7..f609c01341a 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -1,10 +1,10 @@
 /*
  * linux-user semihosting checks
  *
- * Copyright (c) 2019
+ * Copyright (c) 2019, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #define SYS_WRITE0      0x04
diff --git a/tests/tcg/multiarch/float_convd.c b/tests/tcg/multiarch/float_convd.c
index 0a1f0f93dc5..58d7f8b4c58 100644
--- a/tests/tcg/multiarch/float_convd.c
+++ b/tests/tcg/multiarch/float_convd.c
@@ -1,9 +1,9 @@
 /*
  * Floating Point Convert Doubles to Various
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <stdio.h>
diff --git a/tests/tcg/multiarch/float_convs.c b/tests/tcg/multiarch/float_convs.c
index 2e4fa55324d..cb1fdd439e3 100644
--- a/tests/tcg/multiarch/float_convs.c
+++ b/tests/tcg/multiarch/float_convs.c
@@ -1,9 +1,9 @@
 /*
  * Floating Point Convert Single to Various
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <stdio.h>
diff --git a/tests/tcg/multiarch/float_madds.c b/tests/tcg/multiarch/float_madds.c
index 4888f8641f4..a692e052d5b 100644
--- a/tests/tcg/multiarch/float_madds.c
+++ b/tests/tcg/multiarch/float_madds.c
@@ -1,9 +1,9 @@
 /*
  * Fused Multiply Add (Single)
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <stdio.h>
diff --git a/tests/tcg/multiarch/libs/float_helpers.c b/tests/tcg/multiarch/libs/float_helpers.c
index 4e68d2b6598..fad5fc98933 100644
--- a/tests/tcg/multiarch/libs/float_helpers.c
+++ b/tests/tcg/multiarch/libs/float_helpers.c
@@ -5,9 +5,9 @@
  * floating point constants useful for exercising the edge cases in
  * floating point tests.
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 /* we want additional float type definitions */
diff --git a/tests/tcg/i386/system/boot.S b/tests/tcg/i386/system/boot.S
index 9e8920cbfe0..28902c400d8 100644
--- a/tests/tcg/i386/system/boot.S
+++ b/tests/tcg/i386/system/boot.S
@@ -2,12 +2,12 @@
  * i386 boot code, based on  qemu-bmibug.
  *
  * Copyright 2019 Doug Gale
- * Copyright 2019 Linaro
+ * Copyright 2019, 2024 Linaro
  *
- * This work is licensed under the terms of the GNU GPL, version 3 or later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
         .section .head
diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
index dac9bd534d7..7213aec63b2 100644
--- a/tests/tcg/x86_64/system/boot.S
+++ b/tests/tcg/x86_64/system/boot.S
@@ -1,16 +1,16 @@
 /*
  * x86_64 boot and support code
  *
- * Copyright 2019 Linaro
+ * Copyright 2019, 2024 Linaro
  *
- * This work is licensed under the terms of the GNU GPL, version 3 or later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
  * Unlike the i386 version we instead use Xen's PVHVM booting header
  * which should drop us automatically into 32 bit mode ready to go. I've
  * nabbed bits of the Linux kernel setup to achieve this.
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
         .section .head
-- 
2.39.2
