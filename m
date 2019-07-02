Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3194213wru;
        Mon, 1 Jul 2019 17:15:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxglU7fuFqPsVrytZndjuSAq1AWBarbCa3HlaunVq5fr0pNvSYtnnAw+a80gSW03SloEHbL
X-Received: by 2002:ad4:5311:: with SMTP id y17mr4943992qvr.1.1562026508824;
        Mon, 01 Jul 2019 17:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026508; cv=none;
        d=google.com; s=arc-20160816;
        b=Mj9doxcR1B8PhXkXJTqf7SbrcVtYGGh0T/QgKZZDLv9Tg08RjXV3jl6g4H6N5fBjGi
         h2Gz6wJ49OiByteZLwdxRPAQ3VkJs9TK4eNW+BbJKB0qWQpLToJb/TgTXpTJtbF9m3kr
         xMEU7tCqS8MxIxeGdK+Q50hU5OmqRN+JxOigaILKgY8sH0+5prFxTq5EiNFcPfPA7IPS
         TXgyNOwI+HHV3ZroRfKehm9PFV7L2gSBO20W9SUdiCh9cR1PkDIDOzZXQPsFkn/qsDRE
         iX+3moLbuMC5EbK50Z2jvQKZSUBSp2p82TZqhCPgFUhvmIqDYkfSCg02RcL5VAFKFTGO
         rRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+9uPOMx3lla0bZZ7PEKTsA2k2/PWOvGPyBWEpYRfYEE=;
        b=Ymt3Pct3niJFKwPg30oQqRobWnk4Sp0LQyIUDh9fhiThSKGBSR/EbsKnbIFHdgFF2U
         55+WXhPCQJdUB75P6GekdTiNPrehOxecdr+ByKk7z45kDGeVO1F+BK1vgqustf3Q4lkI
         oSU3ODUgUNyS28jMH0G+6GYSGqg2Zn+LWBaliHtCKK4h5zv0rxfvKvW1ayQTLi1k6C6V
         octhTPpLOkm5WgX0C5IYdK0xZUfd1PaORZTz4gS1rz3dkGl5y/Xn7ZKPhvKY0TMW9IeF
         QWvGi7FMB3owmQZnh7FL2J0x+kPzBxi7BByHAvxHr0UVyej0pyvW1Ja9qLFxLjU3pcyt
         n2Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 4si9610387qkr.144.2019.07.01.17.15.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A60BFF74BC;
	Tue,  2 Jul 2019 00:15:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA1A1001B10;
	Tue,  2 Jul 2019 00:14:47 +0000 (UTC)
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
Subject: [PATCH v2 5/9] hw/block/pflash_cfi01: Add the DeviceReset() handler
Date: Tue,  2 Jul 2019 02:12:57 +0200
Message-Id: <20190702001301.4768-6-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 02 Jul 2019 00:15:07 +0000 (UTC)
X-TUID: 5ErYKBkl4+OV

A "system reset" sets the device state machine in READ_ARRAY mode
and, after some delay, set the SR.7 READY bit.

We do not model timings, so we set the SR.7 bit directly.

This pflash device is a child of TYPE_DEVICE.
The TYPE_DEVICE interface provide a DeviceReset handler which will
be called after the device is realized, and each time the machine
resets itself.

To avoid incoherent states when the machine resets (see but report
below), factor out the reset code into pflash_cfi01_system_reset,
and register the method as a device reset callback.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1678713
Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index dd1dfd266b..8d632ea941 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -763,8 +763,6 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->max_device_width = pfl->device_width;
     }
 
-    pflash_mode_read_array(pfl);
-    pfl->status = 0x80; /* WSM ready */
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] = 'Q';
@@ -852,6 +850,18 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x3f] = 0x01; /* Number of protection fields */
 }
 
+static void pflash_cfi01_system_reset(DeviceState *dev)
+{
+    PFlashCFI01 *pfl = PFLASH_CFI01(dev);
+
+    pflash_mode_read_array(pfl);
+    /*
+     * The WSM ready timer occurs at most 150ns after system reset.
+     * This model deliberately ignores this delay.
+     */
+    pfl->status = 0x80;
+}
+
 static Property pflash_cfi01_properties[] = {
     DEFINE_PROP_DRIVE("drive", PFlashCFI01, blk),
     /* num-blocks is the number of blocks actually visible to the guest,
@@ -896,6 +906,7 @@ static void pflash_cfi01_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = pflash_cfi01_system_reset;
     dc->realize = pflash_cfi01_realize;
     dc->props = pflash_cfi01_properties;
     dc->vmsd = &vmstate_pflash;
-- 
2.20.1
