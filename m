Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1693895wru;
        Thu, 27 Jun 2019 13:28:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz81bRxBxxHpAI5e720sQLuKfZdRBYp8j0TCv0T1SJnvYxY8zOHYrNDfxl/7swlIqyWaDjo
X-Received: by 2002:ac8:30d2:: with SMTP id w18mr4951024qta.296.1561667284917;
        Thu, 27 Jun 2019 13:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667284; cv=none;
        d=google.com; s=arc-20160816;
        b=CQw4ndJYHLMJNV6Uxju/7sLZ81S+FLHrCqZpno5MpSgqdviKuoWmIIFHV24Y8XTLFb
         OGVdFpyYuEIr9cALR00pJ+VTplmKGlb5/mWtX7dLmfkqkX2IVfzwbKp66TTc+Ep0m22I
         qf6EVFuIIxVHier4qbL0pHQQaZlMNX5xfVI4WO+j06ut7LXEqDNHPUFno1p5c9AI6tFq
         mQL8VnE65Z51MIkSI1Q0JSe4+yy3buWvcIezcweTZ4v/unOKNmtacXCqviUheBB+7rEu
         Ybb0fH6IiAV6pLtLyQ9KEiJjpYD+iKF/m05PJfLqMssA7OI4zluA4eSiTjcyC9J6x71J
         PGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=l/AEYLVEznqc+6VQjpci2M7bzNea5+QqT+OVsVbEViw=;
        b=NbtehUFS16VektGA7MV1ijGv6R1dM0STxnvv/5thEE/ISd4uv/mAwermT9z8mgVkA1
         eOL2nnT2R7y7uJ1peOgTjXjwxBTU4Gwspf3uq0HKYY3Qt3ApM5VIcmdxu5OnU+CDEHEB
         rgq1ECj+smj2DvjUdDdpXHCOhOJwFHNhkFZtt8WpyQCwUMK6/SBE1vUudcCZ+nlEFi41
         6lDM6nIvAzNI8WJvEnG6SZF6ZIii18PvUZ0e5dNf7CrV/cATyN3vKHuTb6GK+8mRQaHC
         7jfcQJcd1w0HCZJouxqqdoyo+wZLaUjn/Jf8dNE4f2Pb01u4ZRBUxYlQnVmAVo3Y7pOr
         nCrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f188si182887qke.127.2019.06.27.13.28.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAEFB3083391;
	Thu, 27 Jun 2019 20:28:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 542C36012D;
	Thu, 27 Jun 2019 20:27:56 +0000 (UTC)
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
Subject: [PATCH v5 03/28] hw/block/pflash: Simplify trace_pflash_data_read/write()
Date: Thu, 27 Jun 2019 22:26:54 +0200
Message-Id: <20190627202719.17739-4-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 27 Jun 2019 20:28:04 +0000 (UTC)
X-TUID: hLIhR0UnTY69

Use a field width format to have a single function to log
the different width accesses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 6 ++----
 hw/block/pflash_cfi02.c | 6 ++----
 hw/block/trace-events   | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 74fc1bc2da..db4a246b22 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -248,7 +248,6 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
     switch (width) {
     case 1:
         ret = p[offset];
-        trace_pflash_data_read8(offset, ret);
         break;
     case 2:
         if (be) {
@@ -258,7 +257,6 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
             ret = p[offset];
             ret |= p[offset + 1] << 8;
         }
-        trace_pflash_data_read16(offset, ret);
         break;
     case 4:
         if (be) {
@@ -272,12 +270,12 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
             ret |= p[offset + 2] << 16;
             ret |= p[offset + 3] << 24;
         }
-        trace_pflash_data_read32(offset, ret);
         break;
     default:
         DPRINTF("BUG in %s\n", __func__);
         abort();
     }
+    trace_pflash_data_read(offset, width << 1, ret);
     return ret;
 }
 
@@ -415,7 +413,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
 {
     uint8_t *p = pfl->storage;
 
-    trace_pflash_data_write(offset, value, width, pfl->counter);
+    trace_pflash_data_write(offset, width << 1, value, pfl->counter);
     switch (width) {
     case 1:
         p[offset] = value;
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index f05cd507b3..6cdfc85264 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -172,7 +172,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
         switch (width) {
         case 1:
             ret = p[offset];
-            trace_pflash_data_read8(offset, ret);
             break;
         case 2:
             if (be) {
@@ -182,7 +181,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
                 ret = p[offset];
                 ret |= p[offset + 1] << 8;
             }
-            trace_pflash_data_read16(offset, ret);
             break;
         case 4:
             if (be) {
@@ -196,9 +194,9 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
                 ret |= p[offset + 2] << 16;
                 ret |= p[offset + 3] << 24;
             }
-            trace_pflash_data_read32(offset, ret);
             break;
         }
+        trace_pflash_data_read(offset, width << 1, ret);
         break;
     case 0x90:
         /* flash ID read */
@@ -343,7 +341,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
             /* We need another unlock sequence */
             goto check_unlock0;
         case 0xA0:
-            trace_pflash_data_write(offset, value, width, 0);
+            trace_pflash_data_write(offset, width << 1, value, 0);
             p = pfl->storage;
             if (!pfl->ro) {
                 switch (width) {
diff --git a/hw/block/trace-events b/hw/block/trace-events
index f637fe918e..13d1b21dd4 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -10,10 +10,8 @@ pflash_reset(void) "reset"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
 pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x cmd:0x%02x wcycle:%u"
 pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
-pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%02x"
-pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%04x"
-pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%08x"
-pflash_data_write(uint64_t offset, uint32_t value, int width, uint64_t counter) "data offset:0x%04"PRIx64" value:0x%08x width:%d counter:0x%016"PRIx64
+pflash_data_read(uint64_t offset, int width, uint32_t value) "data offset:0x%04"PRIx64" value:0x%0*x"
+pflash_data_write(uint64_t offset, int width, uint32_t value, uint64_t counter) "data offset:0x%04"PRIx64" value:0x%0*x counter:0x%016"PRIx64
 pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
 pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
 pflash_device_info(uint64_t offset) "Read Device Information offset:0x%04"PRIx64
-- 
2.20.1
