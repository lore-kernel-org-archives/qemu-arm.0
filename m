Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp598053wru;
        Fri, 27 Jul 2018 04:40:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpexlwnQeH8/mcK0eumg8coXbFiSYfIVXu2Wlv/ZXU+18RP7ipBodbholUqjPn5MhSAAr3B0
X-Received: by 2002:a37:a4d:: with SMTP id 74-v6mr5690251qkk.148.1532691602244;
        Fri, 27 Jul 2018 04:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532691602; cv=none;
        d=google.com; s=arc-20160816;
        b=cKjog8zn7loAxzim/kvJuSx4HC1Cvu8yswMMLfxW9jAMCMvJJhb5nohe8Mmyw/vs3C
         03rcgV9spFoTlulJaT94CDRc5x+hQ8TY93JW7q2UI5rwWDhp8VjXHBDHBXb8taBaz/yU
         S5m91vg/VkYOtYAzqZJktRtRfHuQIuh8f/VJS5RXY6RM1eR/mv97g16bsiuBEovuZgJN
         8sgp94sJXLUjBsgpfRR4zC6KYZbz1Fh3iasHORF5ojJ0zy8T0tuxLo3kZW0EPtT8LU60
         GliqtzfsTi96PzoWusRYfL3PPE0/WantqykoB7UNYTSURiuwlrxA4VVPhaUTrwq9hj6f
         VJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZFCeoPtcEdUt1Tv+0fBhQ3OdZ4WYUau2tv5lZ+/Q3Sw=;
        b=fI049Y/X8AQOr+dQdFrTa1Hj2ZLs8Ep+jP+4+WKM2c1TfhO3IXWGmpM2YyVMc5boRf
         szVMXTXHDTE4qIBgfhsfXnIcbKnG6NYzGcc+24Z2nq/pwWUe9QwUpm9Vuh2FN4XbxqQI
         tucBGQMuIcMBADNaQ2ZM8Mj5S15aBUIRLqo+ImPk/cZ+D+sWAgEda+C1ZXEueWJ32S9P
         Srs4lMoP1pkpQOeDCJGqllWN0mJOdxkI0vmc360SdJFIGvc4Resk0jX1eYKgyRZBb1Md
         fFKRk9xPNitfVvKyGsNws6ncRWx7ahUeTqcqHBk8uaWB5DL6zTAt83xIFd4H/gvLz3u9
         f+Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2-v6si778131qtg.400.2018.07.27.04.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 04:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj16H-0007Hc-On
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 07:40:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fj15N-0006Gb-DD
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 07:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fj15M-0004xx-FM
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 07:39:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fj15M-0004rg-8F; Fri, 27 Jul 2018 07:39:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fj15E-0002GR-Rq; Fri, 27 Jul 2018 12:38:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 12:38:54 +0100
Message-Id: <20180727113854.20283-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180727113854.20283-1-peter.maydell@linaro.org>
References: <20180727113854.20283-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 2/2] hw/arm/iotkit: Fix IRQ number for
 timer1
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e+k7v10iopCN

A cut-and-paste error meant we were incorrectly wiring up the timer1
IRQ to IRQ3. IRQ3 is the interrupt for timer0 -- move timer0 to
IRQ4 where it belongs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/iotkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index c76d3ed7435..8cadc8b1608 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -382,7 +382,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
         return;
     }
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
-                       qdev_get_gpio_in(DEVICE(&s->armv7m), 3));
+                       qdev_get_gpio_in(DEVICE(&s->armv7m), 4));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
     object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[1]", &err);
     if (err) {
-- 
2.17.1

