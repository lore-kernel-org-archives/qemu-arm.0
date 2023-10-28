Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id iv8-20020a05600c548800b003fefaf299b6sm3769631wmb.38.2023.10.28.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 799495F7A4;
	Sat, 28 Oct 2023 11:33:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Brad Smith <brad@comstyle.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Subject: [PATCH 15/17] semihosting: fix memleak at semihosting_arg_fallback
Date: Sat, 28 Oct 2023 11:33:09 +0100
Message-Id: <20231028103311.347104-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z8S/RjtVG+zP

From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

We duplicate "cmd" as strtok may modify its argument, but we forgot
to free it later. Furthermore, add_semihosting_arg doesn't take
responsibility for this memory either (it strdup's the argument).

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <03d81c56bfc3d08224e4106efca5949d8894cfa5.1697801632.git.quic_mathbern@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/config.c b/semihosting/config.c
index 249a377ae8..56283b5c3c 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -113,12 +113,13 @@ static int add_semihosting_arg(void *opaque,
 void semihosting_arg_fallback(const char *file, const char *cmd)
 {
     char *cmd_token;
+    g_autofree char *cmd_dup = g_strdup(cmd);
 
     /* argv[0] */
     add_semihosting_arg(&semihosting, "arg", file, NULL);
 
     /* split -append and initialize argv[1..n] */
-    cmd_token = strtok(g_strdup(cmd), " ");
+    cmd_token = strtok(cmd_dup, " ");
     while (cmd_token) {
         add_semihosting_arg(&semihosting, "arg", cmd_token, NULL);
         cmd_token = strtok(NULL, " ");
-- 
2.39.2
