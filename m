Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695108wru;
        Thu, 27 Jun 2019 13:29:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTl9awdCT/jMo0+3wu2pg/e1tejEAlQgSvvAVjDiaiibVa74HQsnj7UZ6bD9EfQ2caRrRJ
X-Received: by 2002:a37:a882:: with SMTP id r124mr5295186qke.398.1561667384367;
        Thu, 27 Jun 2019 13:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667384; cv=none;
        d=google.com; s=arc-20160816;
        b=uLz77Gz/qJhjC2h63Z7mC4bJEImw+UqfLu+upzin67Ul00JSNJQarrIZRMrIzFVIXm
         JKjwCX++a2w2Yk2U8PeTJuWycSMXSjZlh4ThttZqkM7lEW/cD5Yr/Gy/+43dbqyjpjlZ
         Jaglfb8utoB+9FTF0Nqtry9L+PA60QBxOF/5Bg6hpW7Rdwv1cJ2YFaP+gMIYQETa6UJf
         Bb4vtWPwjJvMfachVQCvkzGd4YxDGN1mEFE5LjnXIu79PWVr4WBsH4NQa/5CqjLGf0aZ
         3AS5sAvYUmkVjjPR0GiH2tTc4t/G3qu9gqSVT9cYxe3ZO+H/uwp6Ro08+SgF+DJpGfGI
         ir0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8kRWfp4Md1mkEAcv+MUXxPtMyh5mj0MP0NtAduyRxuM=;
        b=XS1ShWFGlUtw+vC9EYfY4KsaDQpC1tHdkTRbsuIh14nAB4YR5UZgMDbhIx8mmjQ/GO
         32L4pqReIxl7VVYNiWTnabvR02fi2xr7StMhChmXarJ1mocF6UECSZuTbarLjHLnx9vN
         Ewef5I4lHF/WAQUjRQZNAsT2lNJeOAmFZCjjUJb8Ad08uxgDvcVpWzFUQ8WKGM/z6JWF
         XFxA3M+gtz5/4yhlh0TRKXhq0t6UxhNZheE9EOQAjExmVo/IMAdKohvrN0eTWTiAoOWg
         sDd5bhxo/boD6iXMqi9njTtKU8jg77pTnbzaXcYjRDuOQSFGIaWZButq34yXlL4juiBs
         6siw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t127si140347qkb.323.2019.06.27.13.29.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FE2488305;
	Thu, 27 Jun 2019 20:29:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9685E600CC;
	Thu, 27 Jun 2019 20:29:33 +0000 (UTC)
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
Subject: [PATCH v5 16/28] hw/block/pflash_cfi02: Hold the PRI table offset in a variable
Date: Thu, 27 Jun 2019 22:27:07 +0200
Message-Id: <20190627202719.17739-17-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 27 Jun 2019 20:29:43 +0000 (UTC)
X-TUID: YpuB3aMDe4OS

Manufacturers are allowed to move the PRI table, this is why the
offset is queryable via fixed offsets 0x15/0x16.
Add a variable to hold the offset, so it will be easier to later
move the PRI table.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index f1bac480f5..23d05a6308 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -552,6 +552,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->status = 0;
 
     /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
+    const uint16_t pri_ofs = 0x31;
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] = 'Q';
     pfl->cfi_table[0x11] = 'R';
@@ -560,8 +561,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x13] = 0x02;
     pfl->cfi_table[0x14] = 0x00;
     /* Primary extended table address */
-    pfl->cfi_table[0x15] = 0x31;
-    pfl->cfi_table[0x16] = 0x00;
+    pfl->cfi_table[0x15] = pri_ofs;
+    pfl->cfi_table[0x16] = pri_ofs >> 8;
     /* Alternate command set (none) */
     pfl->cfi_table[0x17] = 0x00;
     pfl->cfi_table[0x18] = 0x00;
@@ -609,32 +610,34 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x2E] = (pfl->nb_blocs - 1) >> 8;
     pfl->cfi_table[0x2F] = pfl->sector_len >> 8;
     pfl->cfi_table[0x30] = pfl->sector_len >> 16;
+    assert(0x30 < pri_ofs);
 
     /* Extended */
-    pfl->cfi_table[0x31] = 'P';
-    pfl->cfi_table[0x32] = 'R';
-    pfl->cfi_table[0x33] = 'I';
+    pfl->cfi_table[0x00 + pri_ofs] = 'P';
+    pfl->cfi_table[0x01 + pri_ofs] = 'R';
+    pfl->cfi_table[0x02 + pri_ofs] = 'I';
 
     /* Extended version 1.0 */
-    pfl->cfi_table[0x34] = '1';
-    pfl->cfi_table[0x35] = '0';
+    pfl->cfi_table[0x03 + pri_ofs] = '1';
+    pfl->cfi_table[0x04 + pri_ofs] = '0';
 
     /* Address sensitive unlock required. */
-    pfl->cfi_table[0x36] = 0x00;
+    pfl->cfi_table[0x05 + pri_ofs] = 0x00;
     /* Erase suspend not supported. */
-    pfl->cfi_table[0x37] = 0x00;
+    pfl->cfi_table[0x06 + pri_ofs] = 0x00;
     /* Sector protect not supported. */
-    pfl->cfi_table[0x38] = 0x00;
+    pfl->cfi_table[0x07 + pri_ofs] = 0x00;
     /* Temporary sector unprotect not supported. */
-    pfl->cfi_table[0x39] = 0x00;
+    pfl->cfi_table[0x08 + pri_ofs] = 0x00;
 
     /* Sector protect/unprotect scheme. */
-    pfl->cfi_table[0x3a] = 0x00;
+    pfl->cfi_table[0x09 + pri_ofs] = 0x00;
 
     /* Simultaneous operation not supported. */
-    pfl->cfi_table[0x3b] = 0x00;
+    pfl->cfi_table[0x0a + pri_ofs] = 0x00;
     /* Burst mode not supported. */
-    pfl->cfi_table[0x3c] = 0x00;
+    pfl->cfi_table[0x0b + pri_ofs] = 0x00;
+    assert(0x0b + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
 }
 
 static Property pflash_cfi02_properties[] = {
-- 
2.20.1
