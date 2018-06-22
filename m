Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y3-v6sm8625644wro.21.2018.06.22.07.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:08 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 912063E08E5;
	Fri, 22 Jun 2018 15:12:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 05/22] risu: add zlib indication to help text
Date: Fri, 22 Jun 2018 15:11:48 +0100
Message-Id: <20180622141205.16306-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BzRAxebBV85J

This is a simple aide-memoir as it can be tricky to determine this
with a simple statically compiled binary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/risu.c b/risu.c
index 616fc33..c684c90 100644
--- a/risu.c
+++ b/risu.c
@@ -39,6 +39,9 @@ size_t signal_count;
 #ifdef HAVE_ZLIB
 #include <zlib.h>
 gzFile gz_trace_file;
+#define TRACE_TYPE "compressed"
+#else
+#define TRACE_TYPE "uncompressed"
 #endif
 
 sigjmp_buf jmpbuf;
@@ -273,7 +276,7 @@ void usage(void)
     fprintf(stderr, "between master and apprentice risu processes.\n\n");
     fprintf(stderr, "Options:\n");
     fprintf(stderr, "  --master          Be the master (server)\n");
-    fprintf(stderr, "  -t, --trace=FILE  Record/playback trace file\n");
+    fprintf(stderr, "  -t, --trace=FILE  Record/playback " TRACE_TYPE " trace file\n");
     fprintf(stderr,
             "  -h, --host=HOST   Specify master host machine (apprentice only)"
             "\n");
-- 
2.17.1
