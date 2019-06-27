Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695158wru;
        Thu, 27 Jun 2019 13:29:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8wfDeh539xnAnexf6vljkQBH0KxqVAuB8ar+4kpnX/t5Nova7hfeg1biWPo7y9DpmkxxG
X-Received: by 2002:a37:9b01:: with SMTP id d1mr5227710qke.46.1561667390048;
        Thu, 27 Jun 2019 13:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667390; cv=none;
        d=google.com; s=arc-20160816;
        b=l5+oNLaCJqwvpzlQGBkR1P7UR6EeY5kN3jeNhiKbJU8Gt47z5MG/oubLjQe2MMF2Q1
         fnkZ62Ke8hm5eJHopNgphpXMQNpxWCxcRBuCeYtl5NfTl6qkowTbR3ntPjl4DQGnMCTu
         i9nt/x82FLv1p4S7/7ogB9nm+xAsA7TLbp8QpCgp+/Ms/seNBd5lXgNmhmsanYymnTIG
         vtHyRxmKWeFqEAWO1iCLRHW6m85LOuVniUyFMLGg3bCC1Z5Y1vELvwNrjwzvW/5DqRcE
         j7zzHDB8WzwGvb/IT0CEhufz8xubjYJolD9lZC1UWGTLr3OATNYU/90M9F5b1odCOLFZ
         i38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ySNl0YJjnHvZ28UGaexGRAdHABrjJycAWPHbMeVzmnQ=;
        b=SlR0iVQ8qQm6dGSNi8JhR1Hc8QXOBrN+AGXeSX9jLHvqjMxJEwlcT+RojpkHzVOXQ0
         ZErtA9L8yZy5zemXWXNsnUtlSY9RfXOj6wqOfU9W7t8OdhgssPZZ/AlGripxQDT/tmXc
         Ud/BfxwgwueYcSbgFNJfGgDfPgNl/r9Ss5h5lfDsvvzLVm7kZalCJmeLl262pFJOVauw
         OZaxhRPb91a3ixpXos3sOcREZNkoUXY6wtmWXZ5etBdfndiEsBC/AoGVYExF4+zLCEP0
         Q7rXtTK4dEmkI02XBXia7C3CkN2qF2VwKZf5PR+OEAj/KormSBNXZHt9UbUVYnjLY2hQ
         2lFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z9si99269qth.213.2019.06.27.13.29.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02E6F307D859;
	Thu, 27 Jun 2019 20:29:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E0C600CC;
	Thu, 27 Jun 2019 20:29:43 +0000 (UTC)
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
Subject: [PATCH v5 17/28] hw/block/pflash_cfi02: Document 'Page Mode' operations are not supported
Date: Thu, 27 Jun 2019 22:27:08 +0200
Message-Id: <20190627202719.17739-18-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 27 Jun 2019 20:29:49 +0000 (UTC)
X-TUID: L1+go9kxAfwD

The 'page mode' feature entry was implicitly set as zero
(not supported). Document it exists, so we won't discard
it if we squeeze the CFI table.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 23d05a6308..01d9c5d75a 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -637,7 +637,9 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x0a + pri_ofs] = 0x00;
     /* Burst mode not supported. */
     pfl->cfi_table[0x0b + pri_ofs] = 0x00;
-    assert(0x0b + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
+    /* Page mode not supported. */
+    pfl->cfi_table[0x0c + pri_ofs] = 0x00;
+    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
 }
 
 static Property pflash_cfi02_properties[] = {
-- 
2.20.1
