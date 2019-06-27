Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1696031wru;
        Thu, 27 Jun 2019 13:30:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfp2uHQCcoy2gtCb4klxZx+joFQoBnE2UiLvhVmESJ3Xz4rWBz7WX2IsW4su5ZOLGQKkt8
X-Received: by 2002:a0c:add1:: with SMTP id x17mr4932856qvc.81.1561667452802;
        Thu, 27 Jun 2019 13:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667452; cv=none;
        d=google.com; s=arc-20160816;
        b=HDqrD/TzWPUV+g+pmBNlBISYeF0gvYgahmCeB16UHBnMIPuqJWJ1OeyFrjQvgdcX5I
         X0yarTrN6rZMnlNU0l2SJBgB1q1abykjrPP9MpZ9I9KWjUeUfEMd5oAjoRfoUg/QAqPC
         2ZXQLrEWcWhDrLU4n9N4hZHMEsHiZ5/N80jkLruIm3PiIS5XIjGd73eZZDfrM5F3oIKu
         hGGYMlHT+Ub+oQBPbj00Ob6iIv2lyaoMx3LvLwLG8IRXCJ6AHwjZprmEoWM2WDnl5ecQ
         yfzKcVWOhBeGSswhL1RaN0Ky+vx7hV4boUjth4ZEqIu7QPdWYEYg6Pc66vu+LcSmTgwE
         dN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DeTfNzFmuBWrTtW6mpI6HGrROV2uHmRKfHTVmT0h6jY=;
        b=jytsFes6LehqvTG1H8OIZvBS2fEOWXNRqB+wGn/aXqJctKLZKjS38s3fRozq+W9Pc+
         CVxok99jpgVkxrPR4Yq4aMK5nCw/Qe7sOYDsOCxQ1fL6NjqbIQvzmUkl6H9PX2HmSTlS
         Cp+KJBCbdBJaILaxZW0oTfbxoryHT2rkzqA8mD64LDQZOh0Jxh63Xbjmpjb4VxT9c/HG
         76VURY6fTxn7EfVk2sOFsNrs71VgOsczmu6pvuo+dryDAC+2k5/Zi9XK9U4I9ilPpeTI
         d4HofCpLJT837GfJ8k0y4pcBfwMKzxTTjbEa5QB7GSem2YRgrTJIQ8hqWkF7ZiXKt+bb
         cI8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z141si165881qka.70.2019.06.27.13.30.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E282630BB523;
	Thu, 27 Jun 2019 20:30:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0AD6600CC;
	Thu, 27 Jun 2019 20:30:46 +0000 (UTC)
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
Subject: [PATCH v5 25/28] hw/block/pflash_cfi02: Use chip erase time specified in the CFI table
Date: Thu, 27 Jun 2019 22:27:16 +0200
Message-Id: <20190627202719.17739-26-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 27 Jun 2019 20:30:52 +0000 (UTC)
X-TUID: QE1hxX79Uvu/

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

When erasing the chip, use the typical time specified in the CFI table
rather than arbitrarily selecting 5 seconds.

Since the currently unconfigurable value set in the table is 12, this
means a chip erase takes 4096 ms so this isn't a big change in behavior.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-11-stephen.checkoway@oberlin.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
TODO check not zero
---
 hw/block/pflash_cfi02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index a3665da3b8..b2d37c33bb 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -617,9 +617,9 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 pflash_update(pfl, 0, pfl->chip_len);
             }
             set_dq7(pfl, 0x00);
-            /* Let's wait 5 seconds before chip erase is done */
+            /* Wait the time specified at CFI address 0x22. */
             timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                      (NANOSECONDS_PER_SECOND * 5));
+                      (1ULL << pfl->cfi_table[0x22]) * SCALE_MS);
             break;
         case 0x30:
             /* Sector erase */
-- 
2.20.1
