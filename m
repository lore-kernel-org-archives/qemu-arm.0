Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440683wro;
        Tue, 30 Oct 2018 04:24:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fXiP01nHwpN1DKJr+03HxsmFQ3nZ/fbuITyrSzHkcbEHa1eLArWJfzMysSUt1bQmHFqr00
X-Received: by 2002:a1c:84cd:: with SMTP id g196-v6mr1432235wmd.38.1540898669250;
        Tue, 30 Oct 2018 04:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898669; cv=none;
        d=google.com; s=arc-20160816;
        b=eQ/oM60vgQZhkQIV9111bMMMyaqD4RUDMkR81ZLtT5KluXvKOw2ZRSwtlU3YUsd6Pf
         CXIMcENORAcSgpRhowgstCoVpweCaGRcnYvRhqcS9MWJk77IhmVtYPTcBVYb3fiouIoe
         kvMPOeGIzG9hV0WVGImCjJ86CyzMLEoRyNUGOhigv5gg3JtkdPozJtlq7gvr9+Tyfpuv
         wQK+08WOERk1W7HS4W7MHDA9ydaoPfYide16MhiTj+xIxhL3JuikDoXqRr0suHloFbXm
         G41+DBi2QtbsJ8nXN/1YL1+viV/C6Zkhi+sMZSIDAhJjdDQnf9iYL5mfXsO5NLk5Vaah
         tIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=EPZ2GUCGosQ1ySkIyW34izKvV9bDJ+qZtZvtQU1BVUM=;
        b=xukK3QeDQOfJKIrG+P+ArrPm+e9XrAgvrYApAToBnVP0K9iVQe2s3ZgfMo+d/FgpgZ
         5PEb5QyTcAjvLaixi/1gbkuUyMNOKQHgX4pvQeTyhHeWlihmcGQWa1QE0TbR5vX3wVnP
         DwXFXq+uUldxoSnHvn4QfN9Uo1wBMwmqu6xOVKkJ+fsg8VUj/w4y1qKutQXDviprghd4
         nb/gOLti6oYfFe9KaudXicjf5EGBYbegxxlYB5ZSFdSmAxUihyAySnfdzuzJLR8Zjdft
         X5E7XRwf5trCkPZ4Fmvj/MrLRCHRdChmexxaDgUlsjcXvX3hqSiEbXd/5sZfNB3SCofX
         qR0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id c16-v6si2811149wrn.225.2018.10.30.04.24.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:29 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAOeB-1gOpZx1zcB-00BvGL; Tue, 30 Oct 2018 12:24:26 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAOeB-1gOpZx1zcB-00BvGL; Tue, 30 Oct 2018 12:24:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 20/20] milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of error_report
Date: Tue, 30 Oct 2018 12:23:37 +0100
Message-Id: <20181030112337.17973-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q5LxrzvdYU7CPNsTLmGXXcTjoHWS7tXgOUNrLn6WUBVWOyJHjX4
 58/MogZSaPYGsRQWWABAyYmkkq4GP4kTSBoX+BW8xORZbw9lnsftm0ULdRZVfyzPHvBfkVX
 im0zJo8hI/KqAI1lgVRGV+pAQltLLBEgS7mpqxBUTnMctLi4AA45imQ6ctGdfhsQfXau6wS
 maYGw3ZIKpvCBF1VfQoPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:7TFd7E5ROws=:B4993IzhonnCusVI0tYSqj
 oK4t//8Dukd/+oJducnR5RFvmCYRSEaVEbLsC4ZmEuEBZgyRWltcIR1lu2F8v2ZjwYB2JknH6
 GsPdi4itO5Erwp9m+K+HRu+jWmQLpZMzrPj9749Kk6W/pUF3n7fUYBR3vcLVe/q94VlSn3r/G
 AAkn/tk20nLGuE6rsbVb6z4F3sI1xNZmBuKWm0+vFrO3fndTto5s+am2PctR10ypxG2iT0Kev
 fSxN8W4MrqjLJfe0G2dROfSA5HgKL1ZxGVCDtmMT8nXH9GPhRiwx02k1SE4P4s9PIzJ8cMag2
 EbWY+nTlE9ccICMPQSC05/sOAYj4QuA7kpQSA+PsNTYPaJ7F+xvc/O6ZCkV4gCQOxNnBqIBYx
 jBJ4WkuaHZZgXEBCnp2FNktnVWx2EUVQBm3FQBogC7uYb8aKeWZzqgpBdZalh0fuOvcD2NolC
 /cK4AghL6ZPqyiefJJndsrUdEj2hsEtcWsQyt1P89IecFc6F9dJ7AbP2mh/3Km2O5BVuAVUWO
 AFA8nwytpwTIyg6gO2IGxHvFRpFQ+x7B4J8A6+WaEjgUsZjk3Fli64vK3ct5bCA/WJ4X+J2e0
 +AV2ac23Rf+NNlPxMNjNTRCTv0iXAK9kkzj7PQMERjYAUrvRjN8DuLKyzGRVi7x4UsPH3uFl0
 UMaSxu2UYm85aPUAngv4wCBbWS/dguGcFXRMTXulLxNh5tcATdAYn5GCSEvAVVcHdk1bD69X9
 qEaOjjIeMk4CJVII
X-TUID: MX/YZg0ui+3U

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

qemu_log_mask(GUEST_ERROR) is more appropriate:

  $ qemu -d help
  Log items (comma separated):
  guest_errors    log when the guest OS does something invalid (eg accessing a non-existent register)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
Message-Id: <20181029130034.26750-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/milkymist-minimac2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 3eaa19dfde..664ac34f25 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -30,6 +30,7 @@
 #include "hw/sysbus.h"
 #include "trace.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
 
 #include <zlib.h>
@@ -214,7 +215,8 @@ static size_t assemble_frame(uint8_t *buf, size_t size,
     uint32_t crc;
 
     if (size < payload_size + 12) {
-        error_report("milkymist_minimac2: received too big ethernet frame");
+        qemu_log_mask(LOG_GUEST_ERROR, "milkymist_minimac2: frame too big "
+                      "(%zd bytes)\n", payload_size);
         return 0;
     }
 
@@ -347,8 +349,9 @@ minimac2_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     default:
-        error_report("milkymist_minimac2: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_rd%d: 0x%" HWADDR_PRIx "\n",
+                      size, addr << 2);
         break;
     }
 
@@ -413,8 +416,10 @@ minimac2_write(void *opaque, hwaddr addr, uint64_t value,
         break;
 
     default:
-        error_report("milkymist_minimac2: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx
+                      " = 0x%" PRIx64 "\n",
+                      size, addr << 2, value);
         break;
     }
 }
-- 
2.17.2
