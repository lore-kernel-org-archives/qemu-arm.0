Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p26sm3725420wmc.24.2020.02.26.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 10:10:21 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E8FF51FF8C;
	Wed, 26 Feb 2020 18:10:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v1 1/4] accel/tcg: use units.h for defining code gen buffer sizes
Date: Wed, 26 Feb 2020 18:10:17 +0000
Message-Id: <20200226181020.19592-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226181020.19592-1-alex.bennee@linaro.org>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WSII1K9eMnUU

It's easier to read.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a08ab11f657..238b0e575bf 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 
 #define NO_CPU_IO_DEFS
@@ -901,33 +902,33 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
 
 /* Minimum size of the code gen buffer.  This number is randomly chosen,
    but not so small that we can't have a fair number of TB's live.  */
-#define MIN_CODE_GEN_BUFFER_SIZE     (1024u * 1024)
+#define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
 
 /* Maximum size of the code gen buffer we'd like to use.  Unless otherwise
    indicated, this is constrained by the range of direct branches on the
    host cpu, as used by the TCG implementation of goto_tb.  */
 #if defined(__x86_64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #elif defined(__sparc__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #elif defined(__powerpc64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #elif defined(__powerpc__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (32u * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
 #elif defined(__aarch64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2ul * 1024 * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #elif defined(__s390x__)
   /* We have a +- 4GB range on the branches; leave some slop.  */
-# define MAX_CODE_GEN_BUFFER_SIZE  (3ul * 1024 * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
 #elif defined(__mips__)
   /* We have a 256MB branch region, but leave room to make sure the
      main executable is also within that region.  */
-# define MAX_CODE_GEN_BUFFER_SIZE  (128ul * 1024 * 1024)
+# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
 #else
 # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 #endif
 
-#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
 
 #define DEFAULT_CODE_GEN_BUFFER_SIZE \
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
-- 
2.20.1
