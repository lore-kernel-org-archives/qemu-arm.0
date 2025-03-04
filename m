Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51e1sm8997174a12.61.2025.03.04.14.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:29:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7D44360858;
	Tue,  4 Mar 2025 22:24:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 21/32] plugins/loader: populate target_name with target_name()
Date: Tue,  4 Mar 2025 22:24:28 +0000
Message-Id: <20250304222439.2035603-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z2MuKw0yZvgL

We have a function we can call for this, lets not rely on macros that
stop us building once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250226140343.3907080-17-alex.bennee@linaro.org>
---
 plugins/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/loader.c b/plugins/loader.c
index 99686b5466..827473c8b6 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -297,7 +297,7 @@ int qemu_plugin_load_list(QemuPluginList *head, Error **errp)
     struct qemu_plugin_desc *desc, *next;
     g_autofree qemu_info_t *info = g_new0(qemu_info_t, 1);
 
-    info->target_name = TARGET_NAME;
+    info->target_name = target_name();
     info->version.min = QEMU_PLUGIN_MIN_VERSION;
     info->version.cur = QEMU_PLUGIN_VERSION;
 #ifndef CONFIG_USER_ONLY
-- 
2.39.5
