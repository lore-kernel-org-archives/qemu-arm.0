Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3193316wru;
        Mon, 1 Jul 2019 17:13:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9Nmo6yV9DT/vMd1K3JEkx7Mdm0ZxNRm9Q8cVuS0zZ4qugNDVOpzMc4NlYAFNPD7ONZWWK
X-Received: by 2002:ac8:5141:: with SMTP id h1mr23243686qtn.15.1562026427875;
        Mon, 01 Jul 2019 17:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026427; cv=none;
        d=google.com; s=arc-20160816;
        b=bmv/QR9t9WAJC++vKCDwgmSsZ6jhE1s5585Z/EHBUuV8clFAfYNC/FaBtx81XL9tR/
         ZcTODc1eWk0OUtvTRmUiTdqALcHVFTDcx1hNn7Z2kHSt1Kkn58mGlWAJYfLc0xHqAQh9
         fl9tJ4ALbhEZgX8uePbovv+YCuAoqxpnR7FyBEoHGmRmBlu9erIUu7hpKnbquuqIGIe2
         kwZGHxKMwNFhwYZWIsiohpn1M4UVpNMT3KcmfLiC8FzWvmPpTKpRJdtDMA6Tha5t3MKM
         FXC1rSgT/5jCjgW0mZeDyJBYlndwAz6VVdcxCBqyp6Y0TxcJZPifHogtbW/wRnc/3nbS
         2jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=3FGU6FgHH1A7OCHmpMMnBpu5KV8JbkTWCBi+V85+nPM=;
        b=Aq2PFCcq9PK7YpvC2ydhWnLocl4vFhFaRdaMdjCQA01xl3IbQXOLRTh00YCk3EKJ8m
         nhdU37nwJmMZYE9A9E/O9h1Z0MMpV982bA8YJL4S1sWBvz71YydI3IFF0lFA2+42WWMM
         lKRObKCuyWMCfLnzzaS3RZSEypCPytLoQYxswxYlSB/xh2ENz+cQ5DO+NjFsJ+AEHVQS
         /+JuInaDMyOY0iWooU+WWliL3G7NeAL0PpSVEd8L1Qd7Ra7rBnY03BJtMqBxIppT1YBR
         +1ZKd57VlkkjVoVckuiSavBz5gLob5MXW7Ag2Ps1m3vOpOwz4LQdiernZ8lJh3eopmYE
         zjyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u196si8848419qka.97.2019.07.01.17.13.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7C535AFE3;
	Tue,  2 Jul 2019 00:13:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED601001B10;
	Tue,  2 Jul 2019 00:13:27 +0000 (UTC)
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
Subject: [PATCH v2 1/9] hw/block/pflash_cfi01: Removed an unused timer
Date: Tue,  2 Jul 2019 02:12:53 +0200
Message-Id: <20190702001301.4768-2-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 02 Jul 2019 00:13:47 +0000 (UTC)
X-TUID: UFPMoZFpI2u0

The 'CFI02' NOR flash was introduced in commit 29133e9a0fff, with
timing modelled. One year later, the CFI01 model was introduced
(commit 05ee37ebf630) based on the CFI02 model. As noted in the
header, "It does not support timings". 12 years later, we never
had to model the device timings. Time to remove the unused timer,
we can still add it back if required.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Fixed commit description (Laszlo)
---
 hw/block/pflash_cfi01.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 35080d915f..dcc9885bf0 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -42,7 +42,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
-#include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qemu/host-utils.h"
@@ -90,7 +89,6 @@ struct PFlashCFI01 {
     uint8_t cfi_table[0x52];
     uint64_t counter;
     unsigned int writeblock_size;
-    QEMUTimer *timer;
     MemoryRegion mem;
     char *name;
     void *storage;
@@ -114,18 +112,6 @@ static const VMStateDescription vmstate_pflash = {
     }
 };
 
-static void pflash_timer (void *opaque)
-{
-    PFlashCFI01 *pfl = opaque;
-
-    trace_pflash_timer_expired(pfl->cmd);
-    /* Reset flash */
-    pfl->status ^= 0x80;
-    memory_region_rom_device_set_romd(&pfl->mem, true);
-    pfl->wcycle = 0;
-    pfl->cmd = 0;
-}
-
 /* Perform a CFI query based on the bank width of the flash.
  * If this code is called we know we have a device_width set for
  * this flash.
@@ -775,7 +761,6 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->max_device_width = pfl->device_width;
     }
 
-    pfl->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
     pfl->wcycle = 0;
     pfl->cmd = 0;
     pfl->status = 0;
-- 
2.20.1
