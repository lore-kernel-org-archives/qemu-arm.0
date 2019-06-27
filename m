Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695379wru;
        Thu, 27 Jun 2019 13:30:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynkH0YAN0r9G/1vywggQIZBvMhM9UQ3duTyY0DRU0Nrbn3rxdRwPv1fnqkRgdfGNrmequP
X-Received: by 2002:a37:bf07:: with SMTP id p7mr3442278qkf.315.1561667407180;
        Thu, 27 Jun 2019 13:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667407; cv=none;
        d=google.com; s=arc-20160816;
        b=FDgt1PKBeUGI/hWihPXU4tWpRHmg6ixvvXgTJ0hNFw6ElsoTleB+KPX60UoeuIaqxJ
         34gGO6pZyxGYZSW/ST8JStEETI1jwsfDpjy9ejTYj22KzyEajCKfsFf5W3Q2Sv37BY4b
         N+CgooV5VDwQ/FdBzszc+QI3pOO9cEpDxplHpKXreVTuDUyRUq8cxo8OXh9Rex2/zhXK
         VqUjlnCBGd2+tt0trait0v7OV1CZkXhf6q1lzi4uskPBOg/20tSEWz+aVuROiHSQbhXl
         g01Dbq/Ldm03UHb5j9cprQn4s3JVTFG7EP/VYUBb/0u2xgwHMF4Uh6mVsP9I0oP/6G3t
         qLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zU6ZpG5DxWtAufKsCBc1JzgLfw6xRWx0aDmdeeUNjeE=;
        b=G8xvIXnxmPD6GuoHFs/vWolBHo1w9W6ZCUSs3lEapc6MI/lx2tKYwoxqNysrAmdu0e
         QhIuCwAWzE7hucJPuuzSSIu6GBmB894IfATcQep6m1ajZrY7zwbJx6SSyQFO+24bSuHj
         j9eWEcuBpcNZnGCvM+29NR6AGtNjpVBq8tHCMCLKIlMb69Qn2rL1r8F1EhRdDs+iJe31
         xQKxM6Nmmru24RwMY7XMlvVSLQJ9bNLPd4X26pHEIzbVT5O7BicvkfMVDWpxVm9og+yP
         AeOC8eH6IWAAIQNZiyVea4F5rnDa7u3rjjUg/ArMj+yTkzh9PPW3KCl4yvUGOXK4VZ5c
         pGAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x9si113712qta.147.2019.06.27.13.30.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 000B5882FF;
	Thu, 27 Jun 2019 20:30:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4920B600CC;
	Thu, 27 Jun 2019 20:29:55 +0000 (UTC)
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
Subject: [PATCH v5 19/28] hw/block/pflash_cfi02: Extract pflash_regions_count()
Date: Thu, 27 Jun 2019 22:27:10 +0200
Message-Id: <20190627202719.17739-20-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 27 Jun 2019 20:30:06 +0000 (UTC)
X-TUID: aHAsCAtfhPsM

Extract the pflash_regions_count() function, the code will be
easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 1f096ec185..a0d3bd60dc 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -157,6 +157,11 @@ static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
     pfl->rom_mode = rom_mode;
 }
 
+static size_t pflash_regions_count(PFlashCFI02 *pfl)
+{
+    return pfl->cfi_table[0x2c];
+}
+
 static void pflash_timer (void *opaque)
 {
     PFlashCFI02 *pfl = opaque;
@@ -192,9 +197,8 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
 static uint32_t pflash_sector_len(PFlashCFI02 *pfl, hwaddr offset)
 {
     assert(offset < pfl->chip_len);
-    int nb_regions = pfl->cfi_table[0x2C];
     hwaddr addr = 0;
-    for (int i = 0; i < nb_regions; ++i) {
+    for (int i = 0; i < pflash_regions_count(pfl); ++i) {
         uint64_t region_size = (uint64_t)pfl->nb_blocs[i] * pfl->sector_len[i];
         if (addr <= offset && offset < addr + region_size) {
             return pfl->sector_len[i];
-- 
2.20.1
