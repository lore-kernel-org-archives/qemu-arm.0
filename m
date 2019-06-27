Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1696121wru;
        Thu, 27 Jun 2019 13:30:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylKIu1Zt0ZSUL9/ZufMJPFj0lIoryN7IQlluPOx4o7jlvs4Esdks36GzuF6HvtG1aLSBRg
X-Received: by 2002:a37:47d1:: with SMTP id u200mr5069375qka.21.1561667458422;
        Thu, 27 Jun 2019 13:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667458; cv=none;
        d=google.com; s=arc-20160816;
        b=tT2pdz8+v0IhcwcvlQCohQv/tg1XLQRdiK5gQfkrT5auIwLCznP/L2X3IQM0g1PvA0
         bAYOgUmwLxNwYunOdTKNW/hRyozt4iITJOFPGgiKmdFZMTf3CvM8NsMek5Rez1kKzXJI
         TFsFe1mINFIc5Nc2c5Me6daUbs/uqNWEFgF8v+IaPkPuzgJEQogNLEjH14QTYm1PmlX9
         zctR5ySsckGuNp85KA31IeSpz0ftOZ6fxmIekE+8f0kaB+REskQ9F9FvlKX5T2b1km+7
         citQS89hdcMaxI1EFFFFHhhPP+hOM2n6zd2Y/AOMLkf/dzk1Dgdg0FlQgYYLTrmKgFFy
         l9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=eN/P7p/6rQ6hmrdpB84Y479ramIoZycd/vtXQPZZbx0=;
        b=CTnudE0RRZJFr+PtiZVKgLwkAl80yb/vwpJ7U3GtawOH/lvPhftWPMq5IPYrBxBHF8
         GPVHAYNUZxIZDA0MNWf7J5AV/b0MWWrnUkdpmBFM7gy6Vs6MFGyJ4ZxyK0qo96DdnmQk
         P6smu7HoaMqRDtTZYnFvjTqed8dEYm/Pl3oG0llnHcaygBeFDG3xRyFhFZ/1vJ8x9Hao
         TFYVOSmRr7ScJVg54nMxRrIieABl0iL1HugCcCIO6R1vjDGelwnGW6mbAASkNl1TCVxr
         2xr6cvVO3rvgiFmshAo1x6C9U6nUB29WORp3agQEd+jVIsd8aTqitr71UdtWEPpQJowi
         MgpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z51si86802qth.367.2019.06.27.13.30.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8446830C5833;
	Thu, 27 Jun 2019 20:30:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6DD600CC;
	Thu, 27 Jun 2019 20:30:52 +0000 (UTC)
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
Subject: [PATCH v5 26/28] hw/block/pflash_cfi02: Reduce single byte/word write delay
Date: Thu, 27 Jun 2019 22:27:17 +0200
Message-Id: <20190627202719.17739-27-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 20:30:57 +0000 (UTC)
X-TUID: L/KxlR8xjwE5

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-5-stephen.checkoway@oberlin.edu>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
TODO: Why? To respect the datasheet? Which model is this?
---
 hw/block/pflash_cfi02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index b2d37c33bb..e9519cbae8 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -857,8 +857,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x1D] = 0x00;
     /* Vpp max (no Vpp pin) */
     pfl->cfi_table[0x1E] = 0x00;
-    /* Timeout per single byte/word write (128 ms) */
-    pfl->cfi_table[0x1F] = 0x07;
+    /* Timeout per single byte/word write (16 us) */
+    pfl->cfi_table[0x1F] = 0x04;
     /* Timeout for min size buffer write (NA) */
     pfl->cfi_table[0x20] = 0x00;
     /* Typical timeout for block erase (512 ms) */
-- 
2.20.1
