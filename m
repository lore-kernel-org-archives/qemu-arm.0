Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3194687wru;
        Mon, 1 Jul 2019 17:15:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwI5er0Tin2Dj3ZsYM8Nk/pNFApq/Fxd0E4qZeTtnECdwWTFX4MEneZtTPsdt8WV91i0u2H
X-Received: by 2002:a37:a9c3:: with SMTP id s186mr23287284qke.190.1562026550013;
        Mon, 01 Jul 2019 17:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026550; cv=none;
        d=google.com; s=arc-20160816;
        b=pxIfF7LyNkgx8B3e7xcX53nWRm84MQcFj0iX6VWMogV8JyKsapxQEEbSODEjANMuCM
         uK1c1C/5GzAz8JV8HQxEC7FBaKSyl+H2vPsXwnLcy2eQJiiGWB9bBuXmetnd0al+aZXr
         Ctah1G+QoEbnbAScRdzD1HNwqQT7NLCgXW+CvPGSywN4r4WX1bf/ZnhcFZNwSsd2UT8T
         2oNvRz9Oi4/Q0p9+x8HDJKcjt458Sj2UXCC4+CsEiTNPzdSAbPpiy8uctWe7FdMszsXX
         GzGeJbYdpgm2Ei6w0YNooAIvtudI4O6csS2PDBPHl05mSiK1JnMBOKwExTYRPyf61Vva
         f/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=X9Tno+rhStFo7yztu/2kwIvKR/zTdLZZ13qf8CnPW+k=;
        b=uaUXtQptebUJNnS8i4neMUIy5hqRWuyZafs8QHLO5TJTzrl9i0Fu29GSfKRogh6cyL
         bkMy6lFECZZZiKwfvDG2pMg0Nk2cKHAq2mHMrIFGINB7CRIDTUvYmys9yOdND/D4GzSY
         GKQebeZSNbP5ZSBiwwwQmDovXMcbvvtwnAIrdO9L0xZ1BKdPKmfJL6iEKjeh2HP2HMyf
         XYj5e4TTVS0oLmKUE++rRfOpWKYqwvnUZGDEuHsI3jP5Gl6MFuAlVF3RiC2iPqyUbOBJ
         /Gw/GFgG+RRWbMi2R3NVvPBvDmdjdsKbrXDHOAQpGsXywzsjUhNb6MfrQfOv5vZrBMit
         MuDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h14si8779453qtc.229.2019.07.01.17.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3E2C30860DE;
	Tue,  2 Jul 2019 00:15:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E552A1001943;
	Tue,  2 Jul 2019 00:15:28 +0000 (UTC)
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
Subject: [PATCH v2 7/9] hw/block/pflash_cfi01: Improve command comments
Date: Tue,  2 Jul 2019 02:12:59 +0200
Message-Id: <20190702001301.4768-8-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 02 Jul 2019 00:15:49 +0000 (UTC)
X-TUID: hFkD2x/oTik6

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index c1b02219b2..f50d0a9d37 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -208,11 +208,11 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
      * Offsets 2/3 are block lock status, is not emulated.
      */
     switch (boff & 0xFF) {
-    case 0:
+    case 0: /* Manufacturer ID */
         resp = pfl->ident0;
         trace_pflash_manufacturer_id(resp);
         break;
-    case 1:
+    case 1: /* Device ID */
         resp = pfl->ident1;
         trace_pflash_device_id(resp);
         break;
@@ -456,11 +456,11 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
     case 0:
         /* read mode */
         switch (cmd) {
-        case 0x10: /* Single Byte Program */
-        case 0x40: /* Single Byte Program */
+        case 0x10: /* Single Byte Program (setup) */
+        case 0x40: /* Single Byte Program (setup) [Intel] */
             DPRINTF("%s: Single Byte Program\n", __func__);
             break;
-        case 0x20: /* Block erase */
+        case 0x20: /* Block erase (setup) */
             p = pfl->storage;
             offset &= ~(pfl->sector_len - 1);
 
@@ -516,8 +516,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         break;
     case 1:
         switch (pfl->cmd) {
-        case 0x10: /* Single Byte Program */
-        case 0x40: /* Single Byte Program */
+        case 0x10: /* Single Byte Program (confirm) */
+        case 0x40: /* Single Byte Program (confirm) [Intel] */
             DPRINTF("%s: Single Byte Program\n", __func__);
             if (!pfl->ro) {
                 pflash_data_write(pfl, offset, value, width, be);
@@ -528,7 +528,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             pfl->wcycle = 0;
         break;
-        case 0x20: /* Block erase */
+        case 0x20: /* Block erase (confirm) */
         case 0x28:
             if (cmd == 0xd0) { /* confirm */
                 pfl->wcycle = 0;
-- 
2.20.1
