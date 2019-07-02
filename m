Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3195122wru;
        Mon, 1 Jul 2019 17:16:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycM9XmWMzZlYOSnmPWi0qbcKbw1GW00vah5AbsRg/B6lf/94S9jGsSfvMhUD3RH2M45ngv
X-Received: by 2002:ac8:1acf:: with SMTP id h15mr22805175qtk.67.1562026593340;
        Mon, 01 Jul 2019 17:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026593; cv=none;
        d=google.com; s=arc-20160816;
        b=q8Hh/ilJzuxc70w7qI4ItGJA5L6xKYeG2iM998yDXG72kVqSIcktNrY2IyAH1usosd
         n3f41b2o3+Py+geeRgRNlj8DQLLwSuA68EpKKEsjzErWLqAlXj7zrabPkAQlpOC1F4W4
         xwBE+xnqrjN8aCnjRSOctTxv7w5dKQXLEr9/NONMuvYzThvV2ZVxOADCWqgdwK9/kUEZ
         WnoXg5jrpcPacXHGZwCB/QkKssbwOXLViO3epYcSmzFkTLxGdwNNb2TJpKYpJNVYCWzw
         b6rXALfo63pwLONuAnNVpRnc1ju4ZP4cjaZ3wsuaDfFfHVqHGk5Hsy03w0P2+uifkmdo
         ETtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GbeHUC9Fz5aXlSZ+c7JvyNmjJqsPywCwavQXs8TrbS0=;
        b=ev+l/kg/15gVWnjk+ihYXks/okwpkmGCE1/pDJw5UgIomV/6zCmPzBrTfKoUExX1ri
         l/W0Vx+koTmYTfqUiAy0OzcBjFV2IjOKT4eR9s57GMM6KxrZuS8ZShbpmuHd0lcyp0YM
         n8C73Xuotrg4h05udwtcGuVEM/FxmIdUr3UbXVLVMu4RmS/J8zAvhczcnxfFRcxwoYMU
         2Mi0BAGjU9HV9+ZPaarC4uA0GaOT8fDkHwRLkUYRcP7AVuH1umwcWwNV2fv70vhqtykJ
         EEWVbFdrXsDJpWcXMn23YXo7bgQZRHa9UeQEKgv7m/LQZ+qWHLzioqV7PFcNQ0iNFQOZ
         UvJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x8si8921149qtf.386.2019.07.01.17.16.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39F236EB96;
	Tue,  2 Jul 2019 00:16:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC2361001B32;
	Tue,  2 Jul 2019 00:16:10 +0000 (UTC)
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
Subject: [PATCH v2 9/9] hw/block/pflash_cfi01: Hold the PRI table offset in a variable
Date: Tue,  2 Jul 2019 02:13:01 +0200
Message-Id: <20190702001301.4768-10-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 00:16:32 +0000 (UTC)
X-TUID: AcGXSNqmVs78

Manufacturers are allowed to move the PRI table, this is why the
offset is queryable via fixed offsets 0x15/0x16.
Add a variable to hold the offset, so it will be easier to later
move the PRI table.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index e891112b67..f65840eb2b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -762,6 +762,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
 
     /* Hardcoded CFI table */
+    const uint16_t pri_ofs = 0x31;
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] = 'Q';
     pfl->cfi_table[0x11] = 'R';
@@ -770,14 +771,17 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x13] = 0x01;
     pfl->cfi_table[0x14] = 0x00;
     /* Primary extended table address (none) */
-    pfl->cfi_table[0x15] = 0x31;
-    pfl->cfi_table[0x16] = 0x00;
+    pfl->cfi_table[0x15] = pri_ofs;
+    pfl->cfi_table[0x16] = pri_ofs >> 8;
     /* Alternate command set (none) */
     pfl->cfi_table[0x17] = 0x00;
     pfl->cfi_table[0x18] = 0x00;
     /* Alternate extended table (none) */
     pfl->cfi_table[0x19] = 0x00;
     pfl->cfi_table[0x1A] = 0x00;
+
+    /* CFI: System Interface Information */
+
     /* Vcc min */
     pfl->cfi_table[0x1B] = 0x45;
     /* Vcc max */
@@ -802,6 +806,9 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x25] = 0x04;
     /* Max timeout for chip erase */
     pfl->cfi_table[0x26] = 0x00;
+
+    /* CFI: Device Geometry Definition */
+
     /* Device size */
     pfl->cfi_table[0x27] = ctz32(device_len); /* + 1; */
     /* Flash device interface (8 & 16 bits) */
@@ -826,26 +833,30 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x2E] = (blocks_per_device - 1) >> 8;
     pfl->cfi_table[0x2F] = sector_len_per_device >> 8;
     pfl->cfi_table[0x30] = sector_len_per_device >> 16;
+    assert(0x30 < pri_ofs);
+
+    /* CFI: Primary-Vendor Specific */
 
     /* Extended */
-    pfl->cfi_table[0x31] = 'P';
-    pfl->cfi_table[0x32] = 'R';
-    pfl->cfi_table[0x33] = 'I';
+    pfl->cfi_table[0x00 + pri_ofs] = 'P';
+    pfl->cfi_table[0x01 + pri_ofs] = 'R';
+    pfl->cfi_table[0x02 + pri_ofs] = 'I';
 
-    pfl->cfi_table[0x34] = '1';
-    pfl->cfi_table[0x35] = '0';
+    pfl->cfi_table[0x03 + pri_ofs] = '1';
+    pfl->cfi_table[0x04 + pri_ofs] = '0';
 
-    pfl->cfi_table[0x36] = 0x00;
-    pfl->cfi_table[0x37] = 0x00;
-    pfl->cfi_table[0x38] = 0x00;
-    pfl->cfi_table[0x39] = 0x00;
+    pfl->cfi_table[0x05 + pri_ofs] = 0x00; /* Optional features */
+    pfl->cfi_table[0x06 + pri_ofs] = 0x00;
+    pfl->cfi_table[0x07 + pri_ofs] = 0x00;
+    pfl->cfi_table[0x08 + pri_ofs] = 0x00;
 
-    pfl->cfi_table[0x3a] = 0x00;
+    pfl->cfi_table[0x09 + pri_ofs] = 0x00; /* Func. supported after suspend */
 
-    pfl->cfi_table[0x3b] = 0x00;
-    pfl->cfi_table[0x3c] = 0x00;
+    pfl->cfi_table[0x0a + pri_ofs] = 0x00; /* Block status register mask */
+    pfl->cfi_table[0x0b + pri_ofs] = 0x00;
 
-    pfl->cfi_table[0x3f] = 0x01; /* Number of protection fields */
+    pfl->cfi_table[0x0e + pri_ofs] = 0x01; /* Number of protection fields */
+    assert(0x0e + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
-- 
2.20.1
