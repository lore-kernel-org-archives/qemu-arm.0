Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694648wru;
        Thu, 27 Jun 2019 13:29:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwTkyMUoyz5xm9Bs1TqEKX4nKGmUu0wRfAVVcjVO4dQVNYo+wckYx3TgAfgECn9Q/4O8yP
X-Received: by 2002:a0c:95c9:: with SMTP id t9mr4444204qvt.84.1561667347067;
        Thu, 27 Jun 2019 13:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667347; cv=none;
        d=google.com; s=arc-20160816;
        b=WYt/lgGgbMzwx5UhWO/PUu8qngIQB1UpZa/YoZnRGpPm5iXehEfTQdGq3KegynU+q8
         wxlyFqfIBTiayEz1Vrx3suHQybX5V0MghLUvLPOzAppCZH+3cU0K6Jw7CjYnWinnHdio
         Fenuh5r7PXOwJqXCgkNXQgWirtqotw5zj4RB5qqGRJONzdVnz6CzGtexEWM0cEs+sJN1
         eFL3E3NDWf+Jju9DcbtJSpw5DAo71/Zm7xuAKceafwydyu2hxjDIvgSwNW4DZ3KF5SB1
         3v6jPfN5RGT01liFLcuKfCV+BkfQ2jpXvNSOEtF52vaMf64Jvau+J8eWNqicZCiW0He7
         08ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=sy7FYQ7PvaqzlxgPGDbcNU9j8G8z9tXxJuJH4MHkRt4=;
        b=KndW37cQvug7CQ/nNKhtFuDJkBVr9qD8cbInUGWIOotWRAhzcaoJcypE0M7cp2PWCG
         NAKUJAP+FAclY4dBVBF3yiWaGzz/MQWndsv5fZnKQ7c5V1duGLlpj3X4GM0AICG/phf/
         c6fhP/M1Uwvr/5WIcMY4Z+Jv9Fr/JjO19QuSpRibGI8kvNxI5ceAgFuytIhszN/parI3
         fITV7z5WTeZ8Woq8nguIoTzuZ6srq756aaihsVVb3FcXO3mTB9ptkxJOt2wg5DqBgjlK
         zRx6AvLMlGOHYeVLeHLwuBi04MBWzobR8wLSW3Ns0zoBmTDGPjMz0rnVTYZ/RMweeqW2
         rPaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g28si98688qte.205.2019.06.27.13.29.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F7F13058F5B;
	Thu, 27 Jun 2019 20:29:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA31B600CC;
	Thu, 27 Jun 2019 20:29:00 +0000 (UTC)
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
Subject: [PATCH v5 11/28] hw/block/pflash_cfi02: Unify the MemoryRegionOps
Date: Thu, 27 Jun 2019 22:27:02 +0200
Message-Id: <20190627202719.17739-12-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 20:29:06 +0000 (UTC)
X-TUID: yQss9LHFAQPB

The pflash_read()/pflash_write() can check the device endianess
via the pfl->be variable, so remove the 'int be' argument.

Since the big/little MemoryRegionOps are now identical, it is
pointless to declare them both. Unify them.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch to ease review]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 60 +++++++++++------------------------------
 1 file changed, 15 insertions(+), 45 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index c079a63880..e64dc69c6c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -177,11 +177,11 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
     return ret;
 }
 
-static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
-                            int width, int be)
+static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
 {
+    PFlashCFI02 *pfl = opaque;
     hwaddr boff;
-    uint32_t ret;
+    uint64_t ret;
 
     ret = -1;
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
@@ -228,14 +228,14 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
         default:
             ret = pflash_data_read(pfl, offset, width);
         }
-        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx32 "\n", __func__, boff, ret);
+        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, boff, ret);
         break;
     case 0xA0:
     case 0x10:
     case 0x30:
         /* Status register read */
         ret = pfl->status;
-        DPRINTF("%s: status %" PRIx32 "\n", __func__, ret);
+        DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
         toggle_dq6(pfl);
         break;
     case 0x98:
@@ -253,8 +253,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
 }
 
 /* update flash content on disk */
-static void pflash_update(PFlashCFI02 *pfl, int offset,
-                          int size)
+static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
 {
     int offset_end;
     if (pfl->blk) {
@@ -267,9 +266,10 @@ static void pflash_update(PFlashCFI02 *pfl, int offset,
     }
 }
 
-static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
-                         uint32_t value, int width, int be)
+static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
+                         unsigned int width)
 {
+    PFlashCFI02 *pfl = opaque;
     hwaddr boff;
     uint8_t *p;
     uint8_t cmd;
@@ -477,39 +477,9 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
     pfl->cmd = 0;
 }
 
-static uint64_t pflash_be_readfn(void *opaque, hwaddr addr, unsigned size)
-{
-    return pflash_read(opaque, addr, size, 1);
-}
-
-static void pflash_be_writefn(void *opaque, hwaddr addr,
-                              uint64_t value, unsigned size)
-{
-    pflash_write(opaque, addr, value, size, 1);
-}
-
-static uint64_t pflash_le_readfn(void *opaque, hwaddr addr, unsigned size)
-{
-    return pflash_read(opaque, addr, size, 0);
-}
-
-static void pflash_le_writefn(void *opaque, hwaddr addr,
-                              uint64_t value, unsigned size)
-{
-    pflash_write(opaque, addr, value, size, 0);
-}
-
-static const MemoryRegionOps pflash_cfi02_ops_be = {
-    .read = pflash_be_readfn,
-    .write = pflash_be_writefn,
-    .valid.min_access_size = 1,
-    .valid.max_access_size = 4,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static const MemoryRegionOps pflash_cfi02_ops_le = {
-    .read = pflash_le_readfn,
-    .write = pflash_le_writefn,
+static const MemoryRegionOps pflash_cfi02_ops = {
+    .read = pflash_read,
+    .write = pflash_write,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
@@ -537,9 +507,9 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 
     chip_len = pfl->sector_len * pfl->nb_blocs;
 
-    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl), pfl->be ?
-                                  &pflash_cfi02_ops_be : &pflash_cfi02_ops_le,
-                                  pfl, pfl->name, chip_len, &local_err);
+    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
+                                  &pflash_cfi02_ops, pfl, pfl->name,
+                                  chip_len, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
-- 
2.20.1
