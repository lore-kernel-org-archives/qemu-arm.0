Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2683489wrh;
        Mon, 6 May 2019 10:49:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyR7Vy9EFGGngnfx4G8FazS3/LJxwoIOLjjqsKi0VYiWaw7Xo+Tx1mBiCamTysg5m1IpeQl
X-Received: by 2002:a05:600c:2101:: with SMTP id u1mr7587877wml.36.1557164995765;
        Mon, 06 May 2019 10:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557164995; cv=none;
        d=google.com; s=arc-20160816;
        b=kwlNxmijpKHFyjP2wi1KEHmVUl2F1FI91P58PE2fjWGE+KF49szXhcSfzmkjzttW00
         E3+/oKTB/FVoVrmao0k19UljLswnBDkKphA/1W50icRsF1GhUOzGajXzbNgdXbQIniMy
         feRg6ONJvUiY71s+PaMdEB2kTmA2ZJauKYv6dINbv3YgjisHVSt/4gGLVBUWRubvKIfh
         u/VCzfFRRBA0KjXjQCMSj1Q4FzA1KvvXGZG42KVDXCmRKlCiD+wXeaq3xCaArmsKAVIQ
         Pvjr3n/mn0S9pCcwf98xCfX4F7N+/h9gy4cwoJh7NTr+N+Fd+MyMosqckq6eUYO3zrrw
         gPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2div2YVLjVe7DwdMLbNY+nkm3nkpzeNz5eXH0qLyY8k=;
        b=qOXf70J1UxqYBKsWBPSYsEizMkgsxtD04eHj2JcVPB9zNYgWIW2p4719zPpRzbkPjf
         hg8j2pkcOhJGeFLJHUXO78TmeCFyREcyfqxqLzPRoQBX1Zz7S4B2JNvUqvZgwInusOCV
         D+tyUck13v4E8f/JfkKDafaGkHRDiJXbrl2lCMomXBpjWlLCpfm+yasTWkH+US3L3/ae
         vZgITHjDYRwqO/TmIIQWyX+/K69ZcWVMbawsYNFX9WDjBe+gRhQ+jYZXBe7o97Tq96Xq
         dxm+L9FwUkrsEYau/m57pp5F8TLUMEk3r11h39jUHEKRxPvGSHx5DrNOF77qi5x8tFYZ
         62HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HO/a2KJO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si8499280wre.118.2019.05.06.10.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 10:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HO/a2KJO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNhkP-0006g5-VO
	for alex.bennee@linaro.org; Mon, 06 May 2019 13:49:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVQ-0001HU-Ak
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVO-0001X4-Cx
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:24 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hNhVM-0001TG-Gp
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:20 -0400
Received: by mail-pf1-x429.google.com with SMTP id t87so6557708pfa.2
	for <qemu-arm@nongnu.org>; Mon, 06 May 2019 10:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2div2YVLjVe7DwdMLbNY+nkm3nkpzeNz5eXH0qLyY8k=;
	b=HO/a2KJObdqAqpfzLvR4kxvp/QT1f95D5xt+K0LIV2VzAmNoQrgm2U+Nb2uCf6ok6p
	yN33eYIsJXEMa86FMzwRDP162tq0K7ekCNjWz9cOGIOkeG/onWyEg4nEJGAXrkw460tS
	NOSp1OhPx2HiQ9GQAkxvRiGX4f+tuL5IXORfBo1QJ+G4iJR+U3OivNRjq9vrDvSriY8v
	dLij5r9lDV1F5g6q7TqaGK/4pGnx/duV/MfxhsjPjcXBmgD7RKOPbeUaIj154olp8win
	XrtNK5cif//1qeYt0l/YvCjKD4GRFKh7boWflcS9pGWDkuwDHwYfRu+GwoFgVdmC1L8e
	adNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2div2YVLjVe7DwdMLbNY+nkm3nkpzeNz5eXH0qLyY8k=;
	b=bw5LSfH0SmkOzxKuA6yR8WCqMm9jNqQUNKE0jlPLWbpvnpSReEv/pnXBGVZxxg/g6X
	g+47AqwECvK5/bdsDNCT2gsChr4lB7SvT7jvoEbprh3tfm83hGKsHDm3AGLXNmzuNWc5
	CmN0iwZIMOieGTJmxnB4OexsqF/ejVk3F6oofY5THt7490QUQc/EQxGjTIcK29R4K/V8
	rVe2u7NwaMHfuYrQUN1l5GZc+GG0+Ci2SjkXojtmb+3qXvqGkT32bCAhqr+ob+h9Rf4i
	MCKmE661T+cWHbCPRIvvlEccND6eslb4y0UpOxQr0aMS0sMpftB8PFT+nbud+IAsThad
	X71A==
X-Gm-Message-State: APjAAAU7oXsc6mvtEuZ/TUGJY1AalbJ+7KRo5bnlfeeQz2TYVF1KT1qm
	WRqHgvwRfKrfqyqKSBpuxi0dIQ==
X-Received: by 2002:a62:2703:: with SMTP id n3mr10803121pfn.199.1557164058577; 
	Mon, 06 May 2019 10:34:18 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	k9sm2268839pfa.180.2019.05.06.10.34.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:34:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 10:33:48 -0700
Message-Id: <20190506173353.32206-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506173353.32206-1-richard.henderson@linaro.org>
References: <20190506173353.32206-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-arm] [PATCH v4 19/24] hw/misc/bcm2835_rng: Use
 qemu_guest_getrandom_nofail
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jzFveYNvyr3R

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of rolling our own error handling locally.

Cc: qemu-arm@nongnu.org
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/bcm2835_rng.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index 4d62143b24..fe59c868f5 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -9,30 +9,26 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qapi/error.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 #include "hw/misc/bcm2835_rng.h"
 
 static uint32_t get_random_bytes(void)
 {
     uint32_t res;
-    Error *err = NULL;
 
-    if (qcrypto_random_bytes((uint8_t *)&res, sizeof(res), &err) < 0) {
-        /* On failure we don't want to return the guest a non-random
-         * value in case they're really using it for cryptographic
-         * purposes, so the best we can do is die here.
-         * This shouldn't happen unless something's broken.
-         * In theory we could implement this device's full FIFO
-         * and interrupt semantics and then just stop filling the
-         * FIFO. That's a lot of work, though, so we assume any
-         * errors are systematic problems and trust that if we didn't
-         * fail as the guest inited then we won't fail later on
-         * mid-run.
-         */
-        error_report_err(err);
-        exit(1);
-    }
+    /*
+     * On failure we don't want to return the guest a non-random
+     * value in case they're really using it for cryptographic
+     * purposes, so the best we can do is die here.
+     * This shouldn't happen unless something's broken.
+     * In theory we could implement this device's full FIFO
+     * and interrupt semantics and then just stop filling the
+     * FIFO. That's a lot of work, though, so we assume any
+     * errors are systematic problems and trust that if we didn't
+     * fail as the guest inited then we won't fail later on
+     * mid-run.
+     */
+    qemu_guest_getrandom_nofail(&res, sizeof(res));
     return res;
 }
 
-- 
2.17.1

