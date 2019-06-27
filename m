Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694068wru;
        Thu, 27 Jun 2019 13:28:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqHx9eP3CogdStZRkwHw7LDr8wQpIjIhOBuNuQExXZ448y+PdceECiNep2oDz4DmQRWRmU
X-Received: by 2002:a0c:d013:: with SMTP id u19mr4931279qvg.136.1561667300874;
        Thu, 27 Jun 2019 13:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667300; cv=none;
        d=google.com; s=arc-20160816;
        b=Erhq21xeFybRsabissu4h35bu6r/n/LhJdt6h5avDzm+zdP/h9NnsKeljhF+hVdUEl
         Od4H9nmqTPZKQTgpGjBkKyZfIbMy3wWEoxgMykxDQTQkYTgpcDW4UUc92IToOx8pbbYj
         NesV9BbvWBw1yn4yVeEXOTe4hOC2k1SpcSuACAVwvegWoB5sM2TJGKIL0FHRc3LFjg7E
         piZypDOo2G6Z/1C6BhAaMR21idDYUzvAbldl/EAk32KpINyAvy48odmLa/aNAXyooI/9
         CqzAvEXj2QGmEfHvwyVTZUh22H1Obl/92rU6OnZPcEbgVjTCyeVVR5OHqUVL+nKe3nAm
         6Kpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=9DZp/uBjHYIbBCu4Z9b4qfiIyaGL0mnhNnZozsjj2sg=;
        b=MYqGBeGNys3LLwi2yu6BRRg+nRYsdxqV5vA9+PkDPVMDHVNo7ZrvlsaX4vx4AUDjuS
         24wnpRpYlBTlDA4paU3P00Rv+rKSWT1mqaHLpfgRcP//Eo73t0Pb1YPyCn3PerCOpHGM
         igXD5SU68wcFzi8fH5un4RpQb/3k0O3wPPWV+iJOk2L5aQyQrYN2vvw+toJQJ9zRwBjL
         fZIjoR45jORQHjpRStHpZ3oExUyeJKx2tE72axcQT596bxVS1iziiE0d3F2qEB/gIvK3
         BmVBK4gBySDpPQqGTT5qjwCMExIAxW+FPOB44s1JAEvPydmzE7SKKeHiSczrpy0JJohg
         MLPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l5si136154qkc.344.2019.06.27.13.28.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC7FF81F0E;
	Thu, 27 Jun 2019 20:28:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 424E8600CC;
	Thu, 27 Jun 2019 20:28:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 04/28] hw/block/pflash_cfi02: Fix debug format string
Date: Thu, 27 Jun 2019 22:26:55 +0200
Message-Id: <20190627202719.17739-5-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 27 Jun 2019 20:28:15 +0000 (UTC)
X-TUID: fBAlNkHCF8XE

Always compile the debug code to prevent format string to bitrot.
Delete dead code.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch, use PRIx32]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 6cdfc85264..43796e551a 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -47,15 +47,13 @@
 #include "hw/sysbus.h"
 #include "trace.h"
 
-//#define PFLASH_DEBUG
-#ifdef PFLASH_DEBUG
+#define PFLASH_DEBUG false
 #define DPRINTF(fmt, ...)                                  \
 do {                                                       \
-    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
+    if (PFLASH_DEBUG) {                                    \
+        fprintf(stderr, "PFLASH: " fmt, ## __VA_ARGS__);   \
+    }                                                      \
 } while (0)
-#else
-#define DPRINTF(fmt, ...) do { } while (0)
-#endif
 
 #define PFLASH_LAZY_ROMD_THRESHOLD 42
 
@@ -218,14 +216,14 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
         default:
             goto flash_read;
         }
-        DPRINTF("%s: ID " TARGET_FMT_plx " %x\n", __func__, boff, ret);
+        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx32 "\n", __func__, boff, ret);
         break;
     case 0xA0:
     case 0x10:
     case 0x30:
         /* Status register read */
         ret = pfl->status;
-        DPRINTF("%s: status %x\n", __func__, ret);
+        DPRINTF("%s: status %" PRIx32 "\n", __func__, ret);
         /* Toggle bit 6 */
         pfl->status ^= 0x40;
         break;
@@ -268,10 +266,6 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
     trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0 && cmd == 0xF0) {
-#if 0
-        DPRINTF("%s: flash reset asked (%02x %02x)\n",
-                __func__, pfl->cmd, cmd);
-#endif
         goto reset_flash;
     }
     offset &= pfl->chip_len - 1;
-- 
2.20.1
