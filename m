Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm3193275e9.36.2025.01.16.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:09 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0191A60859;
	Thu, 16 Jan 2025 16:03:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 06/37] semihosting/console: Avoid including 'cpu.h'
Date: Thu, 16 Jan 2025 16:02:35 +0000
Message-Id: <20250116160306.1709518-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RI4GxcVxV4kn

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The CPUState structure is declared in "hw/core/cpu.h",
the EXCP_HALTED definition in "exec/cpu-common.h".
Both headers are indirectly include by "cpu.h". In
order to remove "cpu.h" from "semihosting/console.h",
explicitly include them in console.c, otherwise we'd
get:

  ../semihosting/console.c:88:11: error: incomplete definition of type 'struct CPUState'
     88 |         cs->exception_index = EXCP_HALTED;
        |         ~~^
  ../semihosting/console.c:88:31: error: use of undeclared identifier 'EXCP_HALTED'
     88 |         cs->exception_index = EXCP_HALTED;
        |                               ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250103171037.11265-5-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/semihosting/console.h | 2 --
 semihosting/console.c         | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index bd78e5f03f..1c12e178ee 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -9,8 +9,6 @@
 #ifndef SEMIHOST_CONSOLE_H
 #define SEMIHOST_CONSOLE_H
 
-#include "cpu.h"
-
 /**
  * qemu_semihosting_console_read:
  * @cs: CPUState
diff --git a/semihosting/console.c b/semihosting/console.c
index 60102bbab6..c3683a1566 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -18,14 +18,15 @@
 #include "qemu/osdep.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
+#include "exec/cpu-common.h"
 #include "exec/gdbstub.h"
-#include "exec/exec-all.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "qemu/main-loop.h"
 #include "qapi/error.h"
 #include "qemu/fifo8.h"
+#include "hw/core/cpu.h"
 
 /* Access to this structure is protected by the BQL */
 typedef struct SemihostingConsole {
-- 
2.39.5
