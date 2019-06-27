Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694294wru;
        Thu, 27 Jun 2019 13:28:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwW7TgGnBchyxkX3xqX83AOYDvifcN4eAq9FCAWtZhYtCdAGv0Nz5ccKrwJ+bGXSChMkwpt
X-Received: by 2002:ac8:3271:: with SMTP id y46mr4934387qta.185.1561667318134;
        Thu, 27 Jun 2019 13:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667318; cv=none;
        d=google.com; s=arc-20160816;
        b=faY4JsfXQKAn2AQRznABG8NbBJHLlWwluB6MmT2RuthU6HHPoCWdhrUV0TXAOGtRXX
         lxUw7MpVnrEyuPY/KJyqKNafqZDRUjuzO0vsVkLU78yIHa7T4pCMERrhj/jHMGmOfMRZ
         R04jUCOj9M1SbThRzrZ6cM8b18Pzo72GTnvHXaQHyB+26ZHG+WIfQ0QrPBLK7QFOwZEo
         DfwRCdha1WK8YYQU92AI4PgvsznmQrtrgk1jPkyHKLeEYYzfERp3lBtjpMT8E961EHhX
         oiJZl7dfebWnI2Eg2gB7+IC/1CCTIanRjrsdR+9NMOv+N/2i1JFd0lElynAEXMKuUuaJ
         pVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gnetpuT3jJpr77c4Zh2SqY1KWJ9hPcgEYXDrLEVW5Dk=;
        b=dKo4Nim2oJUo72UJN1jlg/X1mEbRbKEyEPKKCFSuCYfDWZj4MXUZnHlTO5tOHYQYcd
         qHSv9cOZ5XHP8EPv2RicQEsAiYcolf+LbKriFNDILVzx5N5uo4tqdc7Npzll77iwoTfj
         XvzGUJjPeZDt7oUrD4diUjDdyVrBme/5QLfIlT4biEJY5ea4vdaEz4NgA3i5fdbX0lRJ
         sLQR38pUdfB/0rAouAuzacnJBRfanWPujPAxQgfK7/t95EYAY3Jl39XGJBaalhyu5Oab
         D7Dik+OUR9miZt0XzP9mi+AlM+EyQlsImNNrJkH8OTjBBStlApWxFp8EKyGvqTcyoczS
         FboA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d10si165860qvj.141.2019.06.27.13.28.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D2A53083391;
	Thu, 27 Jun 2019 20:28:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DC2600CC;
	Thu, 27 Jun 2019 20:28:27 +0000 (UTC)
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
Subject: [PATCH v5 07/28] hw/block/pflash_cfi02: Simplify a statement using fall through
Date: Thu, 27 Jun 2019 22:26:58 +0200
Message-Id: <20190627202719.17739-8-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 27 Jun 2019 20:28:37 +0000 (UTC)
X-TUID: WW5b0XAdDSNY

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index e9eea0ec08..9e8c28af8f 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -239,10 +239,10 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
         case 0x0E:
         case 0x0F:
             ret = boff & 0x01 ? pfl->ident3 : pfl->ident2;
-            if (ret == (uint8_t)-1) {
-                goto flash_read;
+            if (ret != (uint8_t)-1) {
+                break;
             }
-            break;
+            /* Fall through to data read. */
         default:
             goto flash_read;
         }
-- 
2.20.1
