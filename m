Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a752cb50dc7sm417579466b.101.2024.07.05.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:37:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B6DD35F92A;
	Fri,  5 Jul 2024 16:30:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 18/40] tests/tcg/arm: Use vmrs/vmsr instead of mcr/mrc
Date: Fri,  5 Jul 2024 16:30:30 +0100
Message-Id: <20240705153052.1219696-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705153052.1219696-1-alex.bennee@linaro.org>
References: <20240705153052.1219696-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sEErB5QhbOrk

From: Richard Henderson <richard.henderson@linaro.org>

Clang 14 generates

/home/rth/qemu/src/tests/tcg/arm/fcvt.c:431:9: error: invalid operand for instruction
    asm("mrc p10, 7, r1, cr1, cr0, 0\n\t"
        ^
<inline asm>:1:6: note: instantiated into assembly here
        mrc p10, 7, r1, cr1, cr0, 0
            ^
/home/rth/qemu/src/tests/tcg/arm/fcvt.c:432:32: error: invalid operand for instruction
        "orr r1, r1, %[flags]\n\t"
                               ^
<inline asm>:3:6: note: instantiated into assembly here
        mcr p10, 7, r1, cr1, cr0, 0
            ^

This is perhaps a clang bug, but using the neon mnemonic is clearer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240630190050.160642-14-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240705084047.857176-19-alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index d8c61cd29f..ecebbb0247 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -427,10 +427,9 @@ int main(int argc, char *argv[argc])
 
     /* And now with ARM alternative FP16 */
 #if defined(__arm__)
-    /* See glibc sysdeps/arm/fpu_control.h */
-    asm("mrc p10, 7, r1, cr1, cr0, 0\n\t"
+    asm("vmrs r1, fpscr\n\t"
         "orr r1, r1, %[flags]\n\t"
-        "mcr p10, 7, r1, cr1, cr0, 0\n\t"
+        "vmsr fpscr, r1"
         : /* no output */ : [flags] "n" (1 << 26) : "r1" );
 #else
     asm("mrs x1, fpcr\n\t"
-- 
2.39.2
