Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1696367wru;
        Thu, 27 Jun 2019 13:31:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdFxO+tvgGezrqeTt+YKaK7nFCydb+sMlBKEHewNMT2FXcRE9KrBZUZCSd9CXpaUpoXXPZ
X-Received: by 2002:a05:620a:1285:: with SMTP id w5mr4984321qki.302.1561667473986;
        Thu, 27 Jun 2019 13:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667473; cv=none;
        d=google.com; s=arc-20160816;
        b=ldAU3DWDD7su/9RYBgl1zYzaq5Sw5gUD5KZPnYmWgq1Zps++7Nahk81hRh5tMxn+mY
         ag6KoblmkIo56R5laEA+lOV5hEFilEQUk6FqDlcYx86Bg2gDGP1QhKUgOupcy8y3EPOX
         +xvizwwyG5kBwt+GfOIbD0/ZSiSBlkQsO8yMnqZMqVMapORsfN7eehKTjz4T8Y7HWlzm
         amqxXde1qrOjdarZNY03ItyABKtjpHiTXwWrpuFnUghn1UFdbcAPeWtRm49WQGEoqDAn
         iLCHnk6Ff5WffcL9bCBIEN+Q+GV3n4eYbWEsK1YWwCR6Ulw8w+ocLrDYNN3daam8dB+p
         kdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=M/U8iRagTxF82PVldNVZ8xjuHY5NJeIYp37Qe7WGljU=;
        b=SoyuPa8rqkMHDoMCA+eShrUBLtyNGrkiII4IfimCL9CjhA8w6aAQZqss/ph1AMdTDm
         Y/Wo4XRiO5D+BQNbFJpr5GekhznkRprjfkbM6ATuADVqyNkamv18McygkgBpeJG5J9U+
         VVJUagAjEE7Y26/hlbqYWvIOdP+lpTCfzZNdQiKX25iTpazqdtXnOGAuAtlnQnkTA3hY
         wOJhXrPXWqQT/+kGcYVDiz6sNaYj5JtFxHIK5iTzv4QpiMuvT0uGaDoCDZ1buEPkCnsO
         8kpV7BrUDB3wQsOLaB/ax1IKR1cO2aR4DXYZiBIDLD3VNK5Dpj0OCAzzeIgP+PEPE1UQ
         5mAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s124si197679qkb.5.2019.06.27.13.31.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 138FB301D217;
	Thu, 27 Jun 2019 20:31:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E056C600CC;
	Thu, 27 Jun 2019 20:31:07 +0000 (UTC)
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
Subject: [PATCH v5 28/28] hw/block/pflash_cfi02: Reduce I/O accesses to 16-bit
Date: Thu, 27 Jun 2019 22:27:19 +0200
Message-Id: <20190627202719.17739-29-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 27 Jun 2019 20:31:13 +0000 (UTC)
X-TUID: Ef/Gdgq+O+SH

Parallel NOR flashes are limited to 16-bit bus accesses.
Remove the 32-bit dead code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index db9dc7d8fb..d1f28b02b9 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -317,8 +317,6 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     boff = offset & 0xFF;
     if (pfl->width == 2) {
         boff = boff >> 1;
-    } else if (pfl->width == 4) {
-        boff = boff >> 2;
     }
     switch (pfl->cmd) {
     default:
@@ -449,8 +447,6 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     boff = offset;
     if (pfl->width == 2) {
         boff = boff >> 1;
-    } else if (pfl->width == 4) {
-        boff = boff >> 2;
     }
     /* Only the least-significant 11 bits are used in most cases. */
     boff &= 0x7FF;
@@ -710,6 +706,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
 static const MemoryRegionOps pflash_cfi02_ops = {
     .read = pflash_read,
     .write = pflash_write,
+    .impl.max_access_size = 2,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
-- 
2.20.1
