Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694974wru;
        Thu, 27 Jun 2019 13:29:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzs7/3PAc0m6jlK/tjWEBJC/McSNb00A+FZ50+RGj1iTumkC45y4luR+FKZ4u29bYnBKOcs
X-Received: by 2002:ac8:26d5:: with SMTP id 21mr4956736qtp.266.1561667374150;
        Thu, 27 Jun 2019 13:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667374; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1DysW+icUFQLmyBSElxkCb2kGUsY5hhDu70qSApgdqTGdhKUqxBEHMnkA+7Lfc42O
         6Pi6fsf5BGdF+18hjJeraQuYitQVyKZoQix2aT1yLx1HEuVTXSM5b/B8ohd64a3ipjvn
         UGcGbZg1GmACfo4DlC00/X+kabLwQR4MoE0AiqWNOgHjYF8pKndw5kga9Ct3mo9dZQZ0
         RR+AAfN0vaNYeCSxiXkqnsUSdvdAkPXqHSN0u9H/bBYKz4eVxQm1oJG3YkEvxrD/0rUJ
         +AciHDqvf7kYrJHVWnheShOBKqcJfjMfg3hBWFQSod/dBkFCLKRXfKYJl30Q8gnij0t9
         ZODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gSfJozNO7bL0GmT4ywPAm7V/Rp6Nt3GyeljN4WuiHG8=;
        b=GGXwSYqlyvWusX3FbcjuKswjMSLFv2ek9ajixn+U3ZXL6G4EV4ayfgJeOcd9SNznIn
         bMZpDsc8WPP8efC+CiZ4Tsl1P62tr5pZ6yjVs70+go8zG+bR2msiGQBDCV1MggzQPczV
         GtIi0UijjlXBcMHRwQqYJp13bXfER7VI/h1JSbqfBzFN0gXTQkb6+SuxNn1Y/Y9a1TXF
         KK4onmFrd4ltXhI7Pts1bWFjQCTLpMyVJJVH+cw6R5IruO4uWyjg/u0zDLfYcstFom6d
         ZT65U0tPws2n5eVUAKsWZ/AXLWla5602zCkXLy4xcsrFtP+77dZzDx9PfoOKSIhaCKfX
         tqMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x31si102003qtx.284.2019.06.27.13.29.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 277C737F46;
	Thu, 27 Jun 2019 20:29:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3BE6600CC;
	Thu, 27 Jun 2019 20:29:27 +0000 (UTC)
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
Subject: [PATCH v5 15/28] hw/block/pflash_cfi02: Document the current CFI values
Date: Thu, 27 Jun 2019 22:27:06 +0200
Message-Id: <20190627202719.17739-16-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 20:29:33 +0000 (UTC)
X-TUID: 7tF8ry0maoUt

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 1a794fa83c..f1bac480f5 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -550,6 +550,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->wcycle = 0;
     pfl->cmd = 0;
     pfl->status = 0;
+
     /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] = 'Q';
@@ -575,7 +576,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x1D] = 0x00;
     /* Vpp max (no Vpp pin) */
     pfl->cfi_table[0x1E] = 0x00;
-    /* Reserved */
+    /* Timeout per single byte/word write (128 ms) */
     pfl->cfi_table[0x1F] = 0x07;
     /* Timeout for min size buffer write (NA) */
     pfl->cfi_table[0x20] = 0x00;
@@ -614,17 +615,25 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x32] = 'R';
     pfl->cfi_table[0x33] = 'I';
 
+    /* Extended version 1.0 */
     pfl->cfi_table[0x34] = '1';
     pfl->cfi_table[0x35] = '0';
 
+    /* Address sensitive unlock required. */
     pfl->cfi_table[0x36] = 0x00;
+    /* Erase suspend not supported. */
     pfl->cfi_table[0x37] = 0x00;
+    /* Sector protect not supported. */
     pfl->cfi_table[0x38] = 0x00;
+    /* Temporary sector unprotect not supported. */
     pfl->cfi_table[0x39] = 0x00;
 
+    /* Sector protect/unprotect scheme. */
     pfl->cfi_table[0x3a] = 0x00;
 
+    /* Simultaneous operation not supported. */
     pfl->cfi_table[0x3b] = 0x00;
+    /* Burst mode not supported. */
     pfl->cfi_table[0x3c] = 0x00;
 }
 
-- 
2.20.1
