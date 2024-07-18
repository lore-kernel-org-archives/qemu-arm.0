Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24a770dbsm8213773a12.4.2024.07.18.02.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 597175FDC6;
	Thu, 18 Jul 2024 10:45:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Anton Johansson <anjo@rev.ng>
Subject: [PATCH 14/15] target/xtensa: Restrict semihosting to TCG
Date: Thu, 18 Jul 2024 10:45:22 +0100
Message-Id: <20240718094523.1198645-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WuS4Yeu7ccYt

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The semihosting feature depends on TCG (due to the probe_access
API access). Although TCG is the single accelerator currently
available for the xtensa target, use the Kconfig "imply" directive
which is more correct (if we were to support a different accel).

Reported-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240717105723.58965-8-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/xtensa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
index 5e46049262..e8c2598c4d 100644
--- a/target/xtensa/Kconfig
+++ b/target/xtensa/Kconfig
@@ -1,3 +1,3 @@
 config XTENSA
     bool
-    select SEMIHOSTING
+    imply SEMIHOSTING if TCG
-- 
2.39.2
