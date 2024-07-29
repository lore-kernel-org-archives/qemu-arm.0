Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6359392bsm5837519a12.33.2024.07.29.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 740E55FA14;
	Mon, 29 Jul 2024 15:44:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Song Gao <gaosong@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 14/14] plugin/loader: handle basic help query
Date: Mon, 29 Jul 2024 15:44:14 +0100
Message-Id: <20240729144414.830369-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u7MbebaD07e+

As the list of options isn't fixed we do all the parsing by hand.
Without any named arguments we automatically fill the "file" option
with the value give so check if it is requesting help and dump some
basic usage text.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/loader.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/plugins/loader.c b/plugins/loader.c
index 513a429c57..ebc01da9c6 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
+#include "qemu/help_option.h"
 #include "qapi/error.h"
 #include "qemu/lockable.h"
 #include "qemu/option.h"
@@ -98,7 +99,12 @@ static int plugin_add(void *opaque, const char *name, const char *value,
     bool is_on;
     char *fullarg;
 
-    if (strcmp(name, "file") == 0) {
+    if (is_help_option(value)) {
+        printf("Plugin options\n");
+        printf("  file=<path/to/plugin.so>\n");
+        printf("  plugin specific arguments\n");
+        exit(0);
+    } else if (strcmp(name, "file") == 0) {
         if (strcmp(value, "") == 0) {
             error_setg(errp, "requires a non-empty argument");
             return 1;
-- 
2.39.2
