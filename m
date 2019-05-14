Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c9sm12598826wrv.62.2019.05.14.08.53.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:05 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E24A31FF87;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [RFC PATCH  10/11] target/mips: convert UHI_plog to use common semihosting code
Date: Tue, 14 May 2019 16:53:00 +0100
Message-Id: <20190514155301.16123-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aDO8yM+GwAdQ

Rather than printing directly to stdout lets use our common
semihosting code. There is one minor difference in that the output
currently defaults to stderr instead of stdout however this can be
controlled by connecting semihosting to a chardev.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/mips/mips-semi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/mips/mips-semi.c b/target/mips/mips-semi.c
index eac8374fb34..35bdfd7c77e 100644
--- a/target/mips/mips-semi.c
+++ b/target/mips/mips-semi.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/softmmu-semi.h"
 #include "hw/semihosting/semihost.h"
+#include "hw/semihosting/console.h"
 
 typedef enum UHIOp {
     UHI_exit = 1,
@@ -329,13 +330,12 @@ void helper_do_semihosting(CPUMIPSState *env)
         p2 = strstr(p, "%d");
         if (p2) {
             int char_num = p2 - p;
-            char *buf = g_malloc(char_num + 1);
-            strncpy(buf, p, char_num);
-            buf[char_num] = '\0';
-            gpr[2] = printf("%s%d%s", buf, (int)gpr[5], p2 + 2);
-            g_free(buf);
+            GString *s = g_string_new_len(p, char_num);
+            g_string_append_printf(s, "%d%s", (int)gpr[5], p2 + 2);
+            gpr[2] = qemu_semihosting_log_out(s->str, s->len);
+            g_string_free(s, true);
         } else {
-            gpr[2] = printf("%s", p);
+            gpr[2] = qemu_semihosting_log_out(p, strlen(p));
         }
         FREE_TARGET_STRING(p, gpr[4]);
         break;
-- 
2.20.1
