Received: by 10.28.173.206 with SMTP id w197csp3757163wme;
        Tue, 9 Jan 2018 06:27:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBouImVbOhUGgpWbHb+24hTh1bTkzoScVaRaYeAYNt0TayoWiueE8Hvba9cuMjNmoq4ME9I6H
X-Received: by 10.37.33.131 with SMTP id h125mr14246768ybh.89.1515508027336;
        Tue, 09 Jan 2018 06:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515508027; cv=none;
        d=google.com; s=arc-20160816;
        b=pLmmPblQhy24MWZxDs0e0zxQ17d4QZs1mrXswwDHIJG0HSZsBz3Nrd2PsCKB57hB3D
         37f/btibXtnDjvd5sZfaPuJakBpkWd8SXQwuXVQXLywHU52+V9C/SzAwY+TPlFTZckrm
         gqXevxH+8bNwMJjyJs2Uf01lBWWSHKaNX6ne7/rNDSH+P6cii45GKLKvMH+u2Gu1DCj9
         blkfPFcHg26okcjWLeoieRMbJ6GWZP+9ppp6ORKtLdiijUkdQ6adEJPOYFmnhCFDyVVZ
         uAccuzVoUkwvZHkJwPVDEfql7PW8oOnSdOndJf0YCrsWhkC4GviMy1eLax9vONsCzO/e
         LmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ngh+zFvgxOPwUdKWF/Yp2pTDs524HEcljXaX6jfQyqM=;
        b=YYnuDFmj0husZhiIAeaOK2q2ZwXZzA1IGzXowTxu7nEty1h/fCzzD5s8BQjxBQkSVl
         e3DJioUW1X650TKQmxUrsxktPlYgHxfTvGYWwUy7Qwf+Vt0046L6d8ye3weRRBmxXgGw
         kQ/ejIrut0cG9hjX1vrIZ86ec+aq98A3aBDOJJRldB7f8FkLrOJq8x9cV7Bmnm1ZDZr0
         SIH35in/UwIx2LBVZw57/vy/gvHZ8ZaMPhm5PojxlfwZoX0lgKOz36GdvzPufT+v0Ptu
         wpO2zqDpmlLY4UGsy1O3jQC81WUD6eaHeq6dstiMTBWv7ist+JBwkNEJ/IyuWnm/X9NZ
         dvrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si3161942ywi.241.2018.01.09.06.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:27:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYurq-0003i2-Po
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:27:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYurf-0003fD-ET
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYure-0001at-6f
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:26:55 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:45808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eYurd-0001Zz-TW; Tue, 09 Jan 2018 09:26:54 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eYuTT-0003eB-5y; Tue, 09 Jan 2018 14:01:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jan 2018 14:01:50 +0000
Message-Id: <1515506513-31961-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/4] hw/sd/pl181: Reset SD card on controller
 reset
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z1AC0UBTlRRb

Since pl181 is still using the legacy SD card API, the SD
card created by sd_init() is not plugged into any bus. This
means that the controller has to reset it manually.

Failing to do this mostly didn't affect the guest since the
guest typically does a programmed SD card reset as part of
its SD controller driver initialization, but meant that
migration failed because it's only in sd_reset() that we
set up the wpgrps_size field.

Cc: qemu-stable@nongnu.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1739378
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pl181.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 55c8098..3ba1f7d 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -480,6 +480,10 @@ static void pl181_reset(DeviceState *d)
 
     /* We can assume our GPIO outputs have been wired up now */
     sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
+    /* Since we're still using the legacy SD API the card is not plugged
+     * into any bus, and we must reset it manually.
+     */
+    device_reset(DEVICE(s->card));
 }
 
 static void pl181_init(Object *obj)
-- 
2.7.4

