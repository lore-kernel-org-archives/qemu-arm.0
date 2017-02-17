Received: by 10.25.77.65 with SMTP id a62csp143809lfb;
        Fri, 17 Feb 2017 04:22:43 -0800 (PST)
X-Received: by 10.28.74.221 with SMTP id n90mr1814939wmi.114.1487334163394;
        Fri, 17 Feb 2017 04:22:43 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id j21si13131958wrb.212.2017.02.17.04.22.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 04:22:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cehYe-0003e0-Cz; Fri, 17 Feb 2017 12:22:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Marcin Chojnacki <marcinch7@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH] bcm2835_rng: Use qcrypto_random_bytes() rather than rand()
Date: Fri, 17 Feb 2017 12:22:39 +0000
Message-Id: <1487334159-19664-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: 6mxcJQrVbOZI

Switch to using qcrypto_random_bytes() rather than rand() as
our source of randomness for the BCM2835 RNG.

If qcrypto_random_bytes() fails, we don't want to return the guest a
non-random value in case they're really using it for cryptographic
purposes, so the best we can do is a fatal error.  This shouldn't
happen unless something's broken, though.

In theory we could implement this device's full FIFO and interrupt
semantics and then just stop filling the FIFO.  That's a lot of work,
though, and doesn't really give a very nice diagnostic to the user
since the guest will just seem to hang.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This patch sits on top of http://patchwork.ozlabs.org/patch/726744/
(though for review purposes I think it's pretty self explanatory).
The interesting question here is the failure case handling, where
we're a bit between a rock and a hard place because we don't have
a nice way to report it to the guest, but we don't want to return
a non-random value either...

We should probably improve crypto/random-platform.c to use
getentropy() if available, which would fix the "BSD or OSX
host and not using gcrypt or gnutls" case which I think is
the most likely cause of qcrypto_random_bytes() failing.

 hw/misc/bcm2835_rng.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index 2242bc5..bbe903d 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -9,8 +9,32 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
+#include "crypto/random.h"
 #include "hw/misc/bcm2835_rng.h"
 
+static uint32_t get_random_bytes(void)
+{
+    uint32_t res;
+    Error *err = NULL;
+
+    if (qcrypto_random_bytes((uint8_t *)&res, sizeof(res), &err) < 0) {
+        /* On failure we don't want to return the guest a non-random
+         * value in case they're really using it for cryptographic
+         * purposes, so the best we can do is die here.
+         * This shouldn't happen unless something's broken.
+         * In theory we could implement this device's full FIFO
+         * and interrupt semantics and then just stop filling the
+         * FIFO. That's a lot of work, though, so we assume any
+         * errors are systematic problems and trust that the check
+         * on init is sufficient.
+         */
+        error_report_err(err);
+        exit(1);
+    }
+    return res;
+}
+
 static uint64_t bcm2835_rng_read(void *opaque, hwaddr offset,
                                  unsigned size)
 {
@@ -27,7 +51,7 @@ static uint64_t bcm2835_rng_read(void *opaque, hwaddr offset,
         res = s->rng_status | (1 << 24);
         break;
     case 0x8:    /* rng_data */
-        res = rand();
+        res = get_random_bytes();
         break;
 
     default:
-- 
2.7.4
