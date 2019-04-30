Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 11sm1941265wmk.17.2019.04.30.09.52.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 09:52:37 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BCC911FF92;
	Tue, 30 Apr 2019 17:52:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	mark.cave-ayland@ilande.co.uk,
	cota@braap.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 05/15] tests/tcg/minilib: support %c format char
Date: Tue, 30 Apr 2019 17:52:24 +0100
Message-Id: <20190430165234.32272-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y6p1CYAxQIWL

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/minilib/printf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/minilib/printf.c b/tests/tcg/minilib/printf.c
index 121620cb16..d530b32be5 100644
--- a/tests/tcg/minilib/printf.c
+++ b/tests/tcg/minilib/printf.c
@@ -47,7 +47,7 @@ static void print_num(unsigned long long value, int base)
 void ml_printf(const char *fmt, ...)
 {
     va_list ap;
-    char *str;
+    char *str, c;
     int base;
     int has_long;
     int alt_form;
@@ -119,6 +119,10 @@ void ml_printf(const char *fmt, ...)
             str = va_arg(ap, char*);
             print_str(str);
             break;
+        case 'c':
+            c = (char) va_arg(ap, int);
+            __sys_outc(c);
+            break;
         case '%':
             __sys_outc(*fmt);
             break;
-- 
2.20.1
