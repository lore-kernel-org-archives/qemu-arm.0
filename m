Received: by 10.28.71.27 with SMTP id u27csp1033576wma;
        Fri, 9 Feb 2018 07:08:28 -0800 (PST)
X-Google-Smtp-Source: AH8x226gogFVoDRcLe3E7fZfXBDLLzg4fFENEjclGYUaL2A6vCA3pHcBPMM+UqPPhkcazhE2TnW6
X-Received: by 10.129.27.12 with SMTP id b12mr2046650ywb.489.1518188908148;
        Fri, 09 Feb 2018 07:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518188908; cv=none;
        d=google.com; s=arc-20160816;
        b=coC4Ko8OTuVrq21Ry9DgMvN47kYkJJDpXrdG/ZAaIdZwpUTJXLIZ8CJ8ppfxAuhRwH
         ufRU+679yZHx23NISZP4HDcovIFkJKGbxZKsfbiJlbAL0iWMExk/DPP+Tpd3qgO+QmCt
         QxHK/OhHjWd2BqZVYf1wJWknEvrfRDWsAUITh29MxObDLFb4II2JDEYJ21OUdcg0j1HB
         0Zc4V4rfqEyLyAO9TlGVjODzsMgaP96fjWFevkq3gnkJH08pRtT7aHKM1Se4vrnm0C4r
         ZREDhxHgNBzHb3W534kR9SxdwsOpOe/f7J5ZDtOZtPwFEvJd7yMISMu68CYEtMo6WcDO
         sNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
        b=CQ7qdXG3zNhN8rBPayOiNFkMAi2NyFcL8MOrDrtnZyjzZW58y5LJaxhD3ztfW0lZgu
         LKfM9KfcNyu+KtkcHNA7zUAfqZfczfHtGN6KdrGhaAS+wQJ1+PQV5CxU0f15FrJU684o
         k6QZ27QbMVL4JS1J3uSlyOuIJvI0vi9eBpGtMMbVeNGeAtrvjcX6yZf9LSs+/Y40SzYW
         4O1PGX72ye51nXA/ENB1/PK5+QmPqk6T9gSMdKses5dVU+XfQc4FZjG6uFmZGa/xqUio
         nX8nPS4EWROxQgpiHWmPbgVoV0agX/fdR8m62SCGvbSkBsexWVM6y0At3bt5teORDVRg
         oo9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C/tUbwqw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y188si430468ywc.710.2018.02.09.07.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C/tUbwqw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAHr-0003y2-EL
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:08:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5Y-0002Yu-LI
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5X-0005im-ST
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:44 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5X-0005iX-NW; Fri, 09 Feb 2018 09:55:43 -0500
Received: by mail-qt0-x241.google.com with SMTP id d14so10837249qtg.1;
	Fri, 09 Feb 2018 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
	b=C/tUbwqwI9SGlIyKoSQLDPwFKN3X/+13ghWT8ECdlr+F4I6uV293x+34IBajxrUgZs
	WK467xwGW49lUKhO2GXxPdpgX6mh5tpZHrQpIKJFxfHPT++1FgKVY1v9M4XJEuxxHOlL
	D1dEkCFN9c8udY8X6Di1dSkYLVuwOBp/I894g9Jtb4Fynv9QlZ+T1we7sbbVYxK/m0Yb
	JHi10IZ1Mgo5uEWp7EOPUur/x4qUd51jOKFWj+yeI0OYdt8IL+w+yNmn9UmLwBImQLng
	nwKJxbcAi8mTktMq4S2jbnRlVGtuVnxg2uaPmRQMMxovXHwopSN622xX4vzTuuZ2ft1g
	IyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KFpgQEhaZBgnPE0U5fVE+w0zSSdDn/i3ICfYlKUYVZU=;
	b=dW5FLOTOI7slsT5YKndOi2/L/+Rbhzwg5RoEm7kZewCOhvQTAUAjI1tddk80wuRf3E
	iVvWAO20NPNN5Ms4pQflTWD5pK+3a7uy0BQTDdfAw/7qwSIoGkXoEiLi5Sasjgd/gVaX
	kBCj83iWDvc9kkHmJXXRp/zwzCM4FYk1ovPSIsCR0IOMRSHy6RiQ5ZuK0TF0YiLtY3HJ
	2aLQkBS8EGgTxapFXueABaG0ZyPx3RhQM9hzfTzFZtQX36gTcZbXnRqsLPJQht+SX+Oj
	eKsnbda/GzHSrEqxeN6zlHU2r0+aYtxKPcZVCOd/0EGLno4ghKdYkI1MXRbBwxe8OYhP
	bQjA==
X-Gm-Message-State: APf1xPD4sFmO+IqI82I11D66/oTCvAykDf+JekQX4upzTy4uHE5+hJLY
	9agedHYbw+GU1GhaT8hIuMg=
X-Received: by 10.200.46.73 with SMTP id s9mr4936541qta.317.1518188143138;
	Fri, 09 Feb 2018 06:55:43 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:23 -0300
Message-Id: <20180209145430.26007-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v12 23/30] hw/arm/bcm2835_peripherals:
 implement SDHCI Spec v3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3i6v2uFVcv8t

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/bcm2835_peripherals.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..ca971e83e0 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -254,14 +254,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
-    /* Extended Mass Media Controller */
-    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
-                            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
+    /* Extended Mass Media Controller
+     *
+     * Compatible with:
+     * - SD Host Controller Specification Version 3.0 Draft 1.0
+     * - SDIO Specification Version 3.0
+     * - MMC Specification Version 4.4
+     *
+     * For the exact details please refer to the Arasan documentation:
+     *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf
+     */
+    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
+                             &err);
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.16.1

