Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c2sm3414429wma.39.2020.02.28.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 11:24:18 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AF0FE1FF90;
	Fri, 28 Feb 2020 19:24:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v2 3/4] accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32 bit hosts
Date: Fri, 28 Feb 2020 19:24:14 +0000
Message-Id: <20200228192415.19867-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228192415.19867-1-alex.bennee@linaro.org>
References: <20200228192415.19867-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: x01IcZl8pbo4

There is no particular reason to use a static codegen buffer on 64 bit
hosts as we have address space to burn. Allow the common CONFIG_USER
case to use the mmap'ed buffers like SoftMMU.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 accel/tcg/translate-all.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5b66af783b5..4ce5d1b3931 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -892,11 +892,12 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
     }
 }
 
-#if defined(CONFIG_USER_ONLY)
-/* Currently it is not recommended to allocate big chunks of data in
-   user mode. It will change when a dedicated libc will be used.  */
-/* ??? 64-bit hosts ought to have no problem mmaping data outside the
-   region in which the guest needs to run.  Revisit this.  */
+#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS == 32
+/*
+ * For user mode on smaller 32 bit systems we may run into trouble
+ * allocating big chunks of data in the right place. On these systems
+ * we utilise a static code generation buffer directly in the binary.
+ */
 #define USE_STATIC_CODE_GEN_BUFFER
 #endif
 
-- 
2.20.1
