Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f24-v6sm1927940wmc.0.2018.06.13.05.56.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 6EF5D3E1154;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 05/22] risu: add zlib indication to help text
Date: Wed, 13 Jun 2018 13:55:44 +0100
Message-Id: <20180613125601.14371-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BqNTRQYI2k6l

This is a simple aide-memoir as it can be tricky to determine this
with a simple statically compiled binary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
