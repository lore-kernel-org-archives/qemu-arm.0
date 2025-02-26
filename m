Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86ca0asm5841115f8f.32.2025.02.26.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BBF8C60689;
	Wed, 26 Feb 2025 14:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 19/25] plugins/plugin.h: include queue.h
Date: Wed, 26 Feb 2025 14:03:37 +0000
Message-Id: <20250226140343.3907080-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3vXqN6gSmy+X

Headers should bring in what they need so don't rely on getting
queue.h by side effects. This will help with clean-ups in the
following patches.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250225110844.3296991-6-alex.bennee@linaro.org>
---
 plugins/plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/plugins/plugin.h b/plugins/plugin.h
index 30e2299a54..9ed20b5c41 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -13,6 +13,7 @@
 #define PLUGIN_H
 
 #include <gmodule.h>
+#include "qemu/queue.h"
 #include "qemu/qht.h"
 
 #define QEMU_PLUGIN_MIN_VERSION 2
-- 
2.39.5
