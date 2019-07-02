Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3193758wru;
        Mon, 1 Jul 2019 17:14:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqsJgNXsk0o6B8J3OUGKm6Y7jukZtthnlK49CE78/4zGI/V9gPvW12mqygwcEj2e98GRmN
X-Received: by 2002:ae9:f019:: with SMTP id l25mr23623057qkg.473.1562026466149;
        Mon, 01 Jul 2019 17:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026466; cv=none;
        d=google.com; s=arc-20160816;
        b=NxKmPsA/yiA63TDpq42HQdAkuoOvEItRPWjK7kL+hNif/YKSjUnzBeV9hJL/tuU4+J
         CWN6lPichBi/Geuf3CI7gugvWg90EhwmBuMdniJ0XEEVfOjRVRgnMBiw+/goHlK3cxzf
         jqEv9hO+1bLZLTd/d6yqtow/wwsCa/xhrcfDBhYSG+vMujJteZd1BMmcMzOQWdJ4Tsoo
         tzL2HiaiTAX/IsfPKF+XcKeQASq7GctvmW4Odvvu4wKz5hBYyTZe8Lur3okhlidqVH2j
         tFXqTN9FJidcjxOgO+2xsp/wf7G2zDmLzHOp8HIuOShsGGVvxXdLKXDF+rGKAqyOLzKK
         Z71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8tt7XjCuli9/gOCMMHVVZ2RecH0CBXjQbNAN4b3dZSQ=;
        b=S8yaOIQHDeQwiqtxec5gPopSqO/lwrN9Kz+4uqEae9fljOyTZFG7jKQWTcwEB7WY7p
         kr9349o949x/3Lg54zjjBdLmbyuBQ3AWLIN9Sg5NOWLM2ykfame/U9SVs3t8huh8lJrS
         zvbDFxfUPYziT/ikhVkRzjruw7t58HbHlfWx22mV7SxSR91va+HYjOJqKx338TgQKa+c
         6Gqjnal/XWrntX8b+MCVZtYwNSEuEv/nkETid4XrA7YhBYQDgbbahqYWjbFbUDx9zdKG
         OjqviEL7+P0ULz4468mPwAQCQQbjStcl8I628L86JTSxpW3IABh9dK560wcn8p4fD+gB
         KpUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 51si69158qto.36.2019.07.01.17.14.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 215B530872CC;
	Tue,  2 Jul 2019 00:14:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A9881001B01;
	Tue,  2 Jul 2019 00:14:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Markus Armbruster <armbru@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	qemu-block@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [PATCH v2 3/9] hw/block/pflash_cfi01: Extract pflash_mode_read_array()
Date: Tue,  2 Jul 2019 02:12:55 +0200
Message-Id: <20190702001301.4768-4-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 02 Jul 2019 00:14:25 +0000 (UTC)
X-TUID: /t0Ponx5c7E7

The same pattern is used when setting the flash in READ_ARRAY mode:
- Set the state machine command to READ_ARRAY
- Reset the write_cycle counter
- Reset the memory region in ROMD

Refactor the current code by extracting this pattern.
It is used twice:
- On a write access (on command failure, error, or explicitly asked)
- When the device is initialized. Here the ROMD mode is hidden
  by the memory_region_init_rom_device() call.

Rename the 'reset_flash' as 'mode_read_array' to make explicit we
do not reset the device, we simply set its internal state machine
in the READ_ARRAY mode. We do not reset the status register error
bits, as a device reset would do.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 36 ++++++++++++++++++++----------------
 hw/block/trace-events   |  1 +
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 743b5d5794..33c77f6569 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -112,6 +112,14 @@ static const VMStateDescription vmstate_pflash = {
     }
 };
 
+static void pflash_mode_read_array(PFlashCFI01 *pfl)
+{
+    trace_pflash_mode_read_array();
+    pfl->cmd = 0xff; /* Read Array */
+    pfl->wcycle = 0;
+    memory_region_rom_device_set_romd(&pfl->mem, true);
+}
+
 /* Perform a CFI query based on the bank width of the flash.
  * If this code is called we know we have a device_width set for
  * this flash.
@@ -470,7 +478,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         case 0x50: /* Clear status bits */
             DPRINTF("%s: Clear status bits\n", __func__);
             pfl->status = 0x0;
-            goto reset_flash;
+            goto mode_read_array;
         case 0x60: /* Block (un)lock */
             DPRINTF("%s: Block unlock\n", __func__);
             break;
@@ -495,10 +503,10 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             break;
         case 0xf0: /* Probe for AMD flash */
             DPRINTF("%s: Probe for AMD flash\n", __func__);
-            goto reset_flash;
+            goto mode_read_array;
         case 0xff: /* Read array mode */
             DPRINTF("%s: Read array mode\n", __func__);
-            goto reset_flash;
+            goto mode_read_array;
         default:
             goto error_flash;
         }
@@ -525,7 +533,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                 pfl->wcycle = 0;
                 pfl->status |= 0x80;
             } else if (cmd == 0xff) { /* Read Array */
-                goto reset_flash;
+                goto mode_read_array;
             } else
                 goto error_flash;
 
@@ -552,15 +560,15 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                 pfl->wcycle = 0;
                 pfl->status |= 0x80;
             } else if (cmd == 0xff) { /* read array mode */
-                goto reset_flash;
+                goto mode_read_array;
             } else {
                 DPRINTF("%s: Unknown (un)locking command\n", __func__);
-                goto reset_flash;
+                goto mode_read_array;
             }
             break;
         case 0x98:
             if (cmd == 0xff) {
-                goto reset_flash;
+                goto mode_read_array;
             } else {
                 DPRINTF("%s: leaving query mode\n", __func__);
             }
@@ -620,7 +628,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                     " the data is already written to storage!\n"
                     "Flash device reset into READ mode.\n",
                     __func__);
-                goto reset_flash;
+                goto mode_read_array;
             }
             break;
         default:
@@ -630,7 +638,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
     default:
         /* Should never happen */
         DPRINTF("%s: invalid write state\n",  __func__);
-        goto reset_flash;
+        goto mode_read_array;
     }
     return;
 
@@ -639,11 +647,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)"
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
- reset_flash:
-    trace_pflash_reset();
-    memory_region_rom_device_set_romd(&pfl->mem, true);
-    pfl->wcycle = 0;
-    pfl->cmd = 0xff;
+ mode_read_array:
+    pflash_mode_read_array(pfl);
 }
 
 
@@ -758,8 +763,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->max_device_width = pfl->device_width;
     }
 
-    pfl->wcycle = 0;
-    pfl->cmd = 0xff;
+    pflash_mode_read_array(pfl);
     pfl->status = 0;
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 97a17838ed..d627cfc3f5 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -7,6 +7,7 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 # pflash_cfi02.c
 # pflash_cfi01.c
 pflash_reset(void) "reset"
+pflash_mode_read_array(void) "mode: read array"
 pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "offset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
 pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle) "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
-- 
2.20.1
