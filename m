Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694581wru;
        Thu, 27 Jun 2019 13:29:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaWuAE+B4j/DpVtawe3ncCWbjWKPUH8NUNnyE6+lnQ0KYv5rYUkg8sLOLSMNZ1tFbxQseu
X-Received: by 2002:a37:4a46:: with SMTP id x67mr5102118qka.294.1561667341456;
        Thu, 27 Jun 2019 13:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667341; cv=none;
        d=google.com; s=arc-20160816;
        b=OU6M/qYTK0ZE+ds7NUs/z3k5uhS5rY5Q96LP4WCZZdxB8CGXQY3GhKe2OgjSgLAXzc
         TfxiXeSKQ7YYCGktLK9C1sPcbnVb0ut3FbYDQE78N92uztGOSSSXODUPwqLFXfW0uFGN
         Pby5o9FEmTYFC86ED0o6zn7wY9p8vT3KKgvNBBxa1tKTD4gY8D2PiRZPOISKOJ7wS7sa
         U7hpGBDBsaJL1TTBhBlnf7iiq3MjdoPfeSLmyfdI109cDqvEObHDeUgFCTV8LQ7euo0y
         I9UGoKejBikuNOcy4n+t7Zh4ob82f4aVetT6aVvmwNmJaVa6weKdhyLj2od3TCIq4Av/
         OpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ughNA1SWmn3oUqzC2rw5Kmj1XYm357zg3MJyZ31YVs8=;
        b=Ep0b4VwJFCLZE91O6fAL92yfdagPxJSO9hgQvt9rhlIhZv0RanWEbLBJLNkyAXO+Oi
         2Wwcepf8igMpaFlqGX2DEt0xrudVAhp/iFi1fOxB56tBDoS6RnK3fp63Lm4PzEWM/zva
         97pnm4nPF5j4lg3Hi0VBKLXDm1RdB48Ejsw3OJgsAF7Pdy+qGM+Lh9vJxx2A37pnQ4Nn
         kQqSxQbfXnCYrbalP4kmhsDhRiZXgQ/hqw6TBgj/AFDLN3GWzlyg7ngp0ay4bG7kEham
         l/1UKOG0p24txwtMOQu5gFByvpgq7YQn3iHmeDCYVu8/YOzAcQlsUyicDFAPEAEwdYu6
         Ymxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c28si151699qkk.243.2019.06.27.13.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F51430BDE4B;
	Thu, 27 Jun 2019 20:29:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3DE5600CC;
	Thu, 27 Jun 2019 20:28:48 +0000 (UTC)
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
Subject: [PATCH v5 10/28] hw/block/pflash_cfi02: Extract the pflash_data_read() function
Date: Thu, 27 Jun 2019 22:27:01 +0200
Message-Id: <20190627202719.17739-11-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 27 Jun 2019 20:29:00 +0000 (UTC)
X-TUID: /+tealMVwUFj

Extract the code block in a new function, remove a goto statement.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch, remove the XXX tracing comment]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 49afecb921..c079a63880 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -165,12 +165,23 @@ static void pflash_timer (void *opaque)
     pfl->cmd = 0;
 }
 
+/*
+ * Read data from flash.
+ */
+static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
+                                 unsigned int width)
+{
+    uint8_t *p = (uint8_t *)pfl->storage + offset;
+    uint64_t ret = pfl->be ? ldn_be_p(p, width) : ldn_le_p(p, width);
+    trace_pflash_data_read(offset, width << 1, ret);
+    return ret;
+}
+
 static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
                             int width, int be)
 {
     hwaddr boff;
     uint32_t ret;
-    uint8_t *p;
 
     ret = -1;
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
@@ -194,15 +205,8 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
     case 0x80:
         /* We accept reads during second unlock sequence... */
     case 0x00:
-    flash_read:
         /* Flash area read */
-        p = (uint8_t *)pfl->storage + offset;
-        if (pfl->be) {
-            ret = ldn_be_p(p, width);
-        } else {
-            ret = ldn_le_p(p, width);
-        }
-        trace_pflash_data_read(offset, width << 1, ret);
+        ret = pflash_data_read(pfl, offset, width);
         break;
     case 0x90:
         /* flash ID read */
@@ -222,7 +226,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
             }
             /* Fall through to data read. */
         default:
-            goto flash_read;
+            ret = pflash_data_read(pfl, offset, width);
         }
         DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx32 "\n", __func__, boff, ret);
         break;
-- 
2.20.1
