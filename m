Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694359wru;
        Thu, 27 Jun 2019 13:28:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqdA8fl/4f4QNX/mq1qp0XlWfLDdSQDVcUy3r8dVdkEXerOMm4zky9BF/Faw7qNVPAygoX
X-Received: by 2002:a37:6f82:: with SMTP id k124mr5260335qkc.463.1561667323829;
        Thu, 27 Jun 2019 13:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667323; cv=none;
        d=google.com; s=arc-20160816;
        b=VQGjXNXBxcX7JuQXUzSqFOcAvQCttjlRZgJgKwi6IMB7u8U6+sy4/47Ag+GnCtkWoC
         W95UwvKFXVC4wNCB7nVNx3dIi04OGshz3wc9WD/1jwXcJZCs0iWesVEaLLFYOi/xja37
         Dn2rjYLWv+Y4SAF2geh8KIstPMk28RQCmgLlbfnsymuCGk3L1PL5+E8tt8ZRwNhusC83
         cXSknqR0S+W/CJ3RX1RFC1jJm4wtVa8MX2EUbXZKzRMfEi88JDGfkKhBlCvH/jngV7cu
         mClbLIoZVXtOuS4saQgb/y724nozApmxiyyM5T2kvRJylB5xRC77Zd+kj9ny8jDzLUzU
         UNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=FPMnrfh+iyT0/Ye8XFBa4GYcCEmxrrj8o/VNdtlbs0o=;
        b=g+f/9ZeOyosXXe2aPUiV51DFiDvO4gMPvZagCIq/Q8LCyoWC9LLPpfBiPyyIQqYVEw
         ZszcXAjoaHbmXKYuWCNnpeFLSuuyOj/eaW0ovC2TqJ55wz3kLbJXxCAl3E+2shjeDgnx
         DHF0rM6DrEfEYsyKrXHSsek6FzTpHIqR5jr59mxwfhNGrbvEWQZYnJh8O8h/AvZRDlfx
         L+G0PzZ8qmKv2Svq109muRVHR7Bs5fwgXqgPOya+sS+gcTlq4JfzmNVHCmn5gpE7Waq6
         CVUa9U+E8wHb0LEEnIGNW07cESTOguS2dUKg2/AT1o1LugrjiyLy4xYiG5YGxtGzeXs8
         Qt1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u31si106852qta.176.2019.06.27.13.28.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D05545277D;
	Thu, 27 Jun 2019 20:28:42 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A980D600CC;
	Thu, 27 Jun 2019 20:28:37 +0000 (UTC)
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
Subject: [PATCH v5 08/28] hw/block/pflash_cfi02: Use the ldst API in pflash_write()
Date: Thu, 27 Jun 2019 22:26:59 +0200
Message-Id: <20190627202719.17739-9-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 20:28:43 +0000 (UTC)
X-TUID: RqvzDZSLG4lx

The load/store API eases code review.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 9e8c28af8f..ae38ed0bae 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -365,38 +365,16 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
             goto check_unlock0;
         case 0xA0:
             trace_pflash_data_write(offset, width << 1, value, 0);
-            p = pfl->storage;
             if (!pfl->ro) {
-                switch (width) {
-                case 1:
-                    p[offset] &= value;
-                    pflash_update(pfl, offset, 1);
-                    break;
-                case 2:
-                    if (be) {
-                        p[offset] &= value >> 8;
-                        p[offset + 1] &= value;
-                    } else {
-                        p[offset] &= value;
-                        p[offset + 1] &= value >> 8;
-                    }
-                    pflash_update(pfl, offset, 2);
-                    break;
-                case 4:
-                    if (be) {
-                        p[offset] &= value >> 24;
-                        p[offset + 1] &= value >> 16;
-                        p[offset + 2] &= value >> 8;
-                        p[offset + 3] &= value;
-                    } else {
-                        p[offset] &= value;
-                        p[offset + 1] &= value >> 8;
-                        p[offset + 2] &= value >> 16;
-                        p[offset + 3] &= value >> 24;
-                    }
-                    pflash_update(pfl, offset, 4);
-                    break;
+                p = (uint8_t *)pfl->storage + offset;
+                if (pfl->be) {
+                    uint64_t current = ldn_be_p(p, width);
+                    stn_be_p(p, width, current & value);
+                } else {
+                    uint64_t current = ldn_le_p(p, width);
+                    stn_le_p(p, width, current & value);
                 }
+                pflash_update(pfl, offset, width);
             }
             /*
              * While programming, status bit DQ7 should hold the opposite
-- 
2.20.1
