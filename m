Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58720esm23260055e9.40.2025.02.26.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6580960920;
	Wed, 26 Feb 2025 14:03:46 +0000 (GMT)
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
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 25/25] MAINTAINERS: remove widely sanctioned entities
Date: Wed, 26 Feb 2025 14:03:43 +0000
Message-Id: <20250226140343.3907080-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: caxPrsIG8TTa

The following organisations appear on the US sanctions list:

  Yadro: https://sanctionssearch.ofac.treas.gov/Details.aspx?id=41125
  ISPRAS: https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50890

As a result maintainers interacting with such entities would face
legal risk in a number of jurisdictions. To reduce the risk of
inadvertent non-compliance remove entries from these organisations
from the MAINTAINERS file.

Mark the pcf8574 system as orphaned until someone volunteers to step
up as a maintainer. Add myself as a second reviewer to record/replay
so I can help with what odd fixes I can.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250221161443.2321327-1-alex.bennee@linaro.org>
---
 MAINTAINERS | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1911949526..9cdfe19115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2529,8 +2529,7 @@ F: hw/i2c/i2c_mux_pca954x.c
 F: include/hw/i2c/i2c_mux_pca954x.h
 
 pcf8574
-M: Dmitrii Sharikhin <d.sharikhin@yadro.com>
-S: Maintained
+S: Orphaned
 F: hw/gpio/pcf8574.c
 F: include/gpio/pcf8574.h
 
@@ -3627,10 +3626,10 @@ F: net/filter-mirror.c
 F: tests/qtest/test-filter*
 
 Record/replay
-M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
+R: Alex Bennée <alex.bennee@linaro.org>
 W: https://wiki.qemu.org/Features/record-replay
-S: Supported
+S: Odd Fixes
 F: replay/*
 F: block/blkreplay.c
 F: net/filter-replay.c
-- 
2.39.5
