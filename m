Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1693872wru;
        Thu, 27 Jun 2019 13:28:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDTIF5egmQrpFptL6/n+hV4Q0K5PNbJYVjEATKJzMvmB96Cx3TTH51eTd40infuEH6jDc4
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr4639982qta.332.1561667282959;
        Thu, 27 Jun 2019 13:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667282; cv=none;
        d=google.com; s=arc-20160816;
        b=WADvHXIVHPSDtFsa+SvXCjDJ9bO2J15mRTkv4smrKw5eJdq2CU8nem0Dn7PjME5Ncl
         ntoG4Mb+4204i5wPGGkyj3ih7coCQqkUaakW9AT9HzU69ZADcc3Wh/lUkB0fmVsFk0NW
         Wzl+UZ3KqPJPZp//eokHBxI/GBIZpm/XVY8+GSIqdCEAFylulczND/NI7qh5kf88dLIA
         QXADoVdd9dXAA0Fy/0zNYtOr0SZtHponTfWX9g+7uSImTq6hM+POPXxAv9/6Okb5Hwd3
         2cnHeFqaOe25vWt7zivYhCjk/u8+I8w2ibmGx1XrPTry4XsJpkqlhklGKhggOQYylVhp
         jTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tAb4+HqyexEFKlcihUu01RMyYrDtoyloh7umzJZn8/k=;
        b=k1Pfnjg/nreEr6EnVJLgqXX2dVGO+vhkmsKFIAv9mX10ZFhJRWCvgthEeO69E0OKo5
         L/n2/C3laNx/c8C6goQMtGyopTKhJ6s/RT70ExolnKNgmluSw2dhhjWHEAdhkLCpHmYh
         P2EHktiV+ptQ8yX0UoU+JaDx4JOeL0CxD4AbMb5SWTIh0L9CkJclnCpXCdhNjsaKcVSd
         g/bSaZg8u4boQMBrD2yzV4H0sGSJA23wAZ9TuE+6cb2BVXMirI4KjggkD55/RunXqoNp
         PCgmj0/6I7y0D6SuTvsLLYvB8d7L8qFaFQFV1YHd778yCqAPeuSrKnMdKg7PAuIXNRQH
         Aqig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b51si181392qvh.162.2019.06.27.13.28.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D877E3082A28;
	Thu, 27 Jun 2019 20:27:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D735600CC;
	Thu, 27 Jun 2019 20:27:41 +0000 (UTC)
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
Subject: [PATCH v5 02/28] hw/block/pflash: Simplify trace_pflash_io_read/write()
Date: Thu, 27 Jun 2019 22:26:53 +0200
Message-Id: <20190627202719.17739-3-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 20:27:57 +0000 (UTC)
X-TUID: aECVZczRfBkZ

Call the read() trace function after the value is set, so we can
log the returned value.
Rename the I/O trace functions with '_io_' in their name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 5 +++--
 hw/block/pflash_cfi02.c | 6 ++----
 hw/block/trace-events   | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 35080d915f..74fc1bc2da 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -288,7 +288,6 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     uint32_t ret;
 
     ret = -1;
-    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
@@ -391,6 +390,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
 
         break;
     }
+    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->wcycle);
+
     return ret;
 }
 
@@ -453,7 +454,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
     cmd = value;
 
-    trace_pflash_write(offset, value, width, pfl->wcycle);
+    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index eb106f4996..f05cd507b3 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -145,7 +145,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
     uint8_t *p;
 
     ret = -1;
-    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle == 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
@@ -241,6 +240,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
         }
         break;
     }
+    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -267,6 +267,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
     uint8_t *p;
     uint8_t cmd;
 
+    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0 && cmd == 0xF0) {
 #if 0
@@ -275,11 +276,8 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
 #endif
         goto reset_flash;
     }
-    trace_pflash_write(offset, value, width, pfl->wcycle);
     offset &= pfl->chip_len - 1;
 
-    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d\n", __func__,
-            offset, value, width);
     boff = offset & (pfl->sector_len - 1);
     if (pfl->width == 2)
         boff = boff >> 1;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 97a17838ed..f637fe918e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -7,9 +7,9 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 # pflash_cfi02.c
 # pflash_cfi01.c
 pflash_reset(void) "reset"
-pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "offset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
-pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle) "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
+pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x cmd:0x%02x wcycle:%u"
+pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
 pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%02x"
 pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%04x"
 pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%08x"
-- 
2.20.1
