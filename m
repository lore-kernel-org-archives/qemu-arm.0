Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3194929wru;
        Mon, 1 Jul 2019 17:16:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwS4/X9LS7zIRnnqMjqb2mbpMJaENjTigXwXbO6QLFgfGor+wY7mM3S0LPusi8dRRL0Bn0n
X-Received: by 2002:a37:9f14:: with SMTP id i20mr22914334qke.211.1562026571218;
        Mon, 01 Jul 2019 17:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026571; cv=none;
        d=google.com; s=arc-20160816;
        b=tUcGgyqrT9AqMKvGTlJYbbBjlxx0ChS+fFmcjRSKAVt95iYqm4ESoINsWLeSpcKO54
         dmZ/oe41Acm9y32OTLqHTLd3bD9iPU0+b39v6eSAtfheCDv9jqFpxWxxSFE+nxBF6Ige
         +TbvY2UgeNDujbMI14axdAdSkpeLGQO+Kt3uIwqqVcbFx09S6Edvd0kFPvn+fGao7jIr
         ihCkdWyJmXtPtyef55dBc7LPTL7k7rFQZWE0Yoq2M7zlQS8MwPi049cqsTQup8HqE+vz
         mVTFWxtPi5oK8qDxBeJtg0HHT5xSXF875wZaMrPFQPsgNAfpRK9ih3HU9KKowm4thzz8
         nYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+fs5NFGmtxZXrh05oNdxW4WVgrpCzSSjQXjZX5dBLr8=;
        b=AM03/znJhxAq+VF98ygDb5uR+izhW7GmCyA21/oVhirS54awu6+nccnOFy0z+F2ca3
         BOkUahxDC3cdhl4an3evH0WH8y0r/fHpF41S8RQ+qxkZ3pMweTCgJIXmR/Gt/Eu1yVYu
         w5zU9sl33U1+hvmuEa5z7kGZcLIPm/ji4OzMoPvtpIug6r+2X0uthNlnEeljE8nT8W7o
         GqO/hSBz3z0HW++1KZEYm2Q9ibfEXyihFiJMR+zGuM8XPKTCuC+D2a3TBWx5EY4mUqr/
         CwxtppIjlGs+uBoZIy2ICuxt0myeilU/rvIr78NddZZcc90azeycrtjG58fj2qdI1KXw
         nbYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l44si8382864qtb.303.2019.07.01.17.16.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34A80300C033;
	Tue,  2 Jul 2019 00:16:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C07B31001281;
	Tue,  2 Jul 2019 00:15:49 +0000 (UTC)
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
Subject: [PATCH v2 8/9] hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
Date: Tue,  2 Jul 2019 02:13:00 +0200
Message-Id: <20190702001301.4768-9-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 02 Jul 2019 00:16:10 +0000 (UTC)
X-TUID: gGxQLeOPD4OP

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index f50d0a9d37..e891112b67 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -286,7 +286,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid state, "
+                      "wcycle %d cmd 0x02%x\n",
+                      __func__, pfl->wcycle, pfl->cmd);
         pfl->wcycle = 0;
         pfl->cmd = 0xff;
         /* fall through to read code */
@@ -631,7 +633,9 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         break;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state\n",  __func__);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid state, "
+                      "wcycle %d cmd (0x02%x -> value 0x02%x)\n",
+                      __func__, pfl->wcycle, pfl->cmd, value);
         goto mode_read_array;
     }
     return;
-- 
2.20.1
