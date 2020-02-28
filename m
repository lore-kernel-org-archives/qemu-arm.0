Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z2sm5545260wrr.78.2020.02.28.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 11:24:18 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CF86C1FF91;
	Fri, 28 Feb 2020 19:24:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v2 4/4] accel/tcg: increase default code gen buffer size for 64 bit
Date: Fri, 28 Feb 2020 19:24:15 +0000
Message-Id: <20200228192415.19867-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228192415.19867-1-alex.bennee@linaro.org>
References: <20200228192415.19867-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7eOtqgGoHmYv

While 32mb is certainly usable a full system boot ends up flushing the
codegen buffer nearly 100 times. Increase the default on 64 bit hosts
to take advantage of all that spare memory. After this change I can
boot my tests system without any TB flushes.

As we usually run more CONFIG_USER binaries at a time in typical usage
we aren't quite as profligate for user-mode code generation usage. We
also bring the static code gen defies to the same place to keep all
the reasoning in the comments together.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

---
v2
  - 2gb->1gb for system emulation
  - split user and system emulation buffer sizes
---
 accel/tcg/translate-all.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4ce5d1b3931..78914154bfc 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -892,15 +892,6 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
     }
 }
 
-#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS == 32
-/*
- * For user mode on smaller 32 bit systems we may run into trouble
- * allocating big chunks of data in the right place. On these systems
- * we utilise a static code generation buffer directly in the binary.
- */
-#define USE_STATIC_CODE_GEN_BUFFER
-#endif
-
 /* Minimum size of the code gen buffer.  This number is randomly chosen,
    but not so small that we can't have a fair number of TB's live.  */
 #define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
@@ -929,7 +920,33 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
 # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 #endif
 
+#if TCG_TARGET_REG_BITS == 32
 #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
+#ifdef CONFIG_USER_ONLY
+/*
+ * For user mode on smaller 32 bit systems we may run into trouble
+ * allocating big chunks of data in the right place. On these systems
+ * we utilise a static code generation buffer directly in the binary.
+ */
+#define USE_STATIC_CODE_GEN_BUFFER
+#endif
+#else /* TCG_TARGET_REG_BITS == 64 */
+#ifdef CONFIG_USER_ONLY
+/*
+ * As user-mode emulation typically means running multiple instances
+ * of the translator don't go too nuts with our default code gen
+ * buffer lest we make things too hard for the OS.
+ */
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (128 * MiB)
+#else
+/*
+ * We expect most system emulation to run one or two guests per host.
+ * Users running large scale system emulation may want to tweak their
+ * runtime setup via the tb-size control on the command line.
+ */
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
+#endif
+#endif
 
 #define DEFAULT_CODE_GEN_BUFFER_SIZE \
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
-- 
2.20.1
