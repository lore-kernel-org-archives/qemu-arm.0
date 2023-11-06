Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c348100b003fe1fe56202sm13473371wmq.33.2023.11.06.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:51:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9458E655DF;
	Mon,  6 Nov 2023 18:51:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 01/22] default-configs: Add TARGET_XML_FILES definition
Date: Mon,  6 Nov 2023 18:50:51 +0000
Message-Id: <20231106185112.2755262-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N788Sw3ZT9ZO

From: Akihiko Odaki <akihiko.odaki@daynix.com>

loongarch64-linux-user has references to XML files so include them.

Fixes: d32688ecdb ("default-configs: Add loongarch linux-user support")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20231030054834.39145-6-akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231103195956.1998255-2-alex.bennee@linaro.org>
[AJB: remove base32 from list]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/targets/loongarch64-linux-user.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/targets/loongarch64-linux-user.mak b/configs/targets/loongarch64-linux-user.mak
index 7d1b964020..d878e5a113 100644
--- a/configs/targets/loongarch64-linux-user.mak
+++ b/configs/targets/loongarch64-linux-user.mak
@@ -1,3 +1,4 @@
 # Default configuration for loongarch64-linux-user
 TARGET_ARCH=loongarch64
 TARGET_BASE_ARCH=loongarch
+TARGET_XML_FILES=gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu.xml
-- 
2.39.2
