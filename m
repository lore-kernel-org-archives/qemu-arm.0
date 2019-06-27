Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694712wru;
        Thu, 27 Jun 2019 13:29:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLc7lv+i1+O1/feJt5ElGLcNc+8N4qUh0Iwm8RTWV2416311+Kq8rQS3z4O6PnWlRmX+GZ
X-Received: by 2002:a05:620a:1404:: with SMTP id d4mr5344096qkj.228.1561667352608;
        Thu, 27 Jun 2019 13:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667352; cv=none;
        d=google.com; s=arc-20160816;
        b=THAW30GzMxrcLlPD5/8NYjP7gXk9Q4LIopnGwxJkuuHECnd56zCbztrUIhPSpyY5s0
         7c1mJB38grQKIKKPcFPlJkGM3cWxGeVOh9GqW0QM+3HPtofGBhdMNyItYAnGH6XHzCi9
         6zrHbnxbajJHCJQ3TzivPdWoRgD85pbBMy+VkaS31tzp7lyBBBeSjcLpLN9g75CIMccC
         8iwPXMle2h10kor8JLgEndhAIgkC7yCfZg9W3Y/y43CiPONaUeIhOIQJvuSlHnrOwTiM
         J/7SA41X6CN4n1RYZb2IPzS0Q+//ESNKaBCk9Ce/KpJVq6yuaLd7BHtDbxh53hHGwrAv
         zsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GESCko2PotiL949CtRUqSAAx797hYi9PhVhdvqFs4tU=;
        b=VZZxw45oZ+tC7VGRX00+48nN5D5MUXU8SHSsJZwtkEsiDdfkdp0RMTI3fnqeIPr6Pe
         PMV30vBg2c+0CH3I3tKY3+dDB5UQtFDKIDcz+iLwv7EqGcq36T28S4jXncZ4vD5vphX9
         L37uP0ryHLdt9ROikSkL7CIDH39u8uizp12SkSOsiOyq6tHKobQgHvxpQi2FB+OmWwpn
         U5VqOxwsfbDdHLTqx999ulKMVVR7rJ1HFVtm+1DiLjZnNJuVdQGNTGhi71qCELgIiSO+
         nYgJA+Z89m45DDbt/gZhwM+25ZdWCTB1B2h+sx9EizpJBRZtrogjGOlaHK3KoRl7umhZ
         Ca+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v54si177696qvc.169.2019.06.27.13.29.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0A163082B6B;
	Thu, 27 Jun 2019 20:29:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78D66600CC;
	Thu, 27 Jun 2019 20:29:06 +0000 (UTC)
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
Subject: [PATCH v5 12/28] hw/block/pflash_cfi02: Fix command address comparison
Date: Thu, 27 Jun 2019 22:27:03 +0200
Message-Id: <20190627202719.17739-13-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 20:29:11 +0000 (UTC)
X-TUID: yT274ycc9LaA

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

Most AMD commands only examine 11 bits of the address. This masks the
addresses used in the comparison to 11 bits. The exceptions are word or
sector addresses which use offset directly rather than the shifted
offset, boff.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190426162624.55977-4-stephen.checkoway@oberlin.edu>
[PMD: Prepend 'hw/' in patch subject]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c   |  8 +++++++-
 tests/pflash-cfi02-test.c | 12 ++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index e64dc69c6c..4be3837be5 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -281,11 +281,13 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     }
     offset &= pfl->chip_len - 1;
 
-    boff = offset & (pfl->sector_len - 1);
+    boff = offset;
     if (pfl->width == 2)
         boff = boff >> 1;
     else if (pfl->width == 4)
         boff = boff >> 2;
+    /* Only the least-significant 11 bits are used in most cases. */
+    boff &= 0x7FF;
     switch (pfl->wcycle) {
     case 0:
         /* Set the device in I/O access mode if required */
@@ -538,6 +540,10 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    /* Only 11 bits are used in the comparison. */
+    pfl->unlock_addr0 &= 0x7FF;
+    pfl->unlock_addr1 &= 0x7FF;
+
     pflash_setup_mappings(pfl);
     pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
index e7e16a8dd8..e090b2e3a0 100644
--- a/tests/pflash-cfi02-test.c
+++ b/tests/pflash-cfi02-test.c
@@ -21,8 +21,8 @@
 
 #define FLASH_WIDTH 2
 #define CFI_ADDR (FLASH_WIDTH * 0x55)
-#define UNLOCK0_ADDR (FLASH_WIDTH * 0x5555)
-#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AAA)
+#define UNLOCK0_ADDR (FLASH_WIDTH * 0x555)
+#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AA)
 
 #define CFI_CMD 0x98
 #define UNLOCK0_CMD 0xAA
@@ -190,6 +190,14 @@ static void test_flash(void)
     g_assert_cmphex(flash_read(6), ==, 0xCDEF);
     g_assert_cmphex(flash_read(8), ==, 0xFFFF);
 
+    /* Test ignored high order bits of address. */
+    flash_write(FLASH_WIDTH * 0x5555, UNLOCK0_CMD);
+    flash_write(FLASH_WIDTH * 0x2AAA, UNLOCK1_CMD);
+    flash_write(FLASH_WIDTH * 0x5555, AUTOSELECT_CMD);
+    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0000), ==, 0x00BF);
+    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0001), ==, 0x236D);
+    reset();
+
     qtest_quit(global_qtest);
 }
 
-- 
2.20.1
