Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s3sm14457226wrm.40.2021.10.04.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 16AD61FF98;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [PATCH  v1 1/7] hw/misc/bcm2835_property: Add FIXME comment for uninitialized memory
Date: Mon,  4 Oct 2021 14:47:35 +0100
Message-Id: <20211004134742.2044280-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: svNQ/fHsD5mK

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are returning unintialized memory, this is probably unsafe.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/misc/bcm2835_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 73941bdae9..791c7554ec 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -61,6 +61,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x get board model NYI\n",
                           tag);
+            /* FIXME returning uninitialized memory */
             resplen = 4;
             break;
         case 0x00010002: /* Get board revision */
@@ -75,6 +76,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x get board serial NYI\n",
                           tag);
+            /* FIXME returning uninitialized memory */
             resplen = 8;
             break;
         case 0x00010005: /* Get ARM memory */
-- 
2.30.2
