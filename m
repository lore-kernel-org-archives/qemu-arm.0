Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l1sm22205092wrb.1.2019.09.10.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:34:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 544321FF90;
	Tue, 10 Sep 2019 20:34:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 3/4] elf: move elf_ops.h into include/elf/ and rename
Date: Tue, 10 Sep 2019 20:34:07 +0100
Message-Id: <20190910193408.28917-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910193408.28917-1-alex.bennee@linaro.org>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dCzA+BOOPT0G

Lets keep all the Elf manipulation bits together. Also rename the file
to better reflect how it is used and add a little header to the file.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/loader.c                            | 4 ++--
 include/{hw/elf_ops.h => elf/elf_ops.inc.h} | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)
 rename include/{hw/elf_ops.h => elf/elf_ops.inc.h} (98%)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index e0c6563e643..886179a4947 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -302,7 +302,7 @@ static void *load_at(int fd, off_t offset, size_t size)
 #define elf_word        uint32_t
 #define elf_sword        int32_t
 #define bswapSZs	bswap32s
-#include "hw/elf_ops.h"
+#include "elf/elf_ops.inc.h"
 
 #undef elfhdr
 #undef elf_phdr
@@ -324,7 +324,7 @@ static void *load_at(int fd, off_t offset, size_t size)
 #define elf_sword        int64_t
 #define bswapSZs	bswap64s
 #define SZ		64
-#include "hw/elf_ops.h"
+#include "elf/elf_ops.inc.h"
 
 const char *load_elf_strerror(int error)
 {
diff --git a/include/hw/elf_ops.h b/include/elf/elf_ops.inc.h
similarity index 98%
rename from include/hw/elf_ops.h
rename to include/elf/elf_ops.inc.h
index 1496d7e7536..a820bd821d5 100644
--- a/include/hw/elf_ops.h
+++ b/include/elf/elf_ops.inc.h
@@ -1,3 +1,12 @@
+/*
+ * Macro expansions for Elf operations. This is included in a
+ * compilation unit with appropriate definitions for SZ and elf
+ * headers to generate utility functions for reading 32 and 64 bit elf
+ * headers.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
 static void glue(bswap_ehdr, SZ)(struct elfhdr *ehdr)
 {
     bswap16s(&ehdr->e_type);			/* Object file type */
-- 
2.20.1
