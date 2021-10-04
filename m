Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q10sm14357977wmq.12.2021.10.04.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2CE6F1FF99;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [PATCH  v1 2/7] hw/misc/bcm2835_property: Handle the 'domain state' property
Date: Mon,  4 Oct 2021 14:47:36 +0100
Message-Id: <20211004134742.2044280-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QnC1VyQGaAZm

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The kernel is happy with this change, so we don't need
to do anything more sophisticated.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/misc/bcm2835_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 791c7554ec..b089e47584 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -133,6 +133,14 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        case 0x00030030: /* Get domain state */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: 0x%08x get domain state NYI\n",
+                          tag);
+            /* FIXME returning uninitialized memory */
+            resplen = 8;
+            break;
+
         case 0x00038002: /* Set clock rate */
         case 0x00038004: /* Set max clock rate */
         case 0x00038007: /* Set min clock rate */
-- 
2.30.2
