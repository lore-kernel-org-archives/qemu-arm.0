Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1861076lfc;
        Sun, 17 Oct 2021 00:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyVaaofHFJanuQVP5XGJArjiYC2s8dO/wRPZQPLIjCn/7E2e3b3bIbClzgdbmd5HWHK6B/
X-Received: by 2002:a05:6602:1605:: with SMTP id x5mr10091768iow.35.1634456977777;
        Sun, 17 Oct 2021 00:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634456977; cv=none;
        d=google.com; s=arc-20160816;
        b=cobt18cJoREx0aVjWaZf2aVjzFdX37bjmjNdurXkgtNXSUJRQk9bmgzpgskgEDGrPo
         e8b2MJo/6iAHbITNHxnOGu6WUhixLh7llPUzOdKNI11voz9Kwat7mo4ZzxCZY0WbX1mm
         xB2X/ZG1DDp74vkwSpsabf7k3gEqNulQAXIHVkz0hyGBfj7GYY9+OPMk/AwV4gUIADMG
         4u0S+Fj5fZvJX+kfvT/Kctv8roOwFE6O8/a5psnjVMPpZ+wDZRhwBHhM1WSMIlrW2sov
         nViT8Bs2Hlh55T01tPeGbmGBvq+drDkJNxcEyztKdy3na0EE6qBBeDHN5nJj/bU5/jt2
         tg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:date:cc:to:from
         :subject:message-id;
        bh=gleCQNvDITsB3emktn6JenIrCvZFXjDuy+mRYET6BkI=;
        b=x7VrYXfVl9CbBdRgR8bvQIByj9GWWXDbQktPsdlYPwZsPyeiO3tgLv4THuhhFfjF/g
         j6/YvDWYTvCF4c/pNZVvBCEFENqpOEpodS2nUoFIseVVrbERq25W6wrNfqkqqJEgezTP
         Ch5GWUCS3/8wH8RU+nQmjPJgAZQT2EwtrxJgSpEkEFi0p+cTMrrQruQQuyWmmZdCXGw2
         +nfAKmB5Da6H3uGy+qDfZFEnr1acz+xt2eRsVcIGXvs50kHxkVsrJtq1ea/gqyl0hs/j
         eLtbHpUi7O4NUW33JP6HFwaCfzhHsd9hF3t5s7alPPwTmdsD4tsLrCMyqy7hmB+FEip8
         4Stg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org. [63.228.1.57])
        by mx.google.com with ESMTP id y10si17146965ill.39.2021.10.17.00.49.36
        for <alex.bennee@linaro.org>;
        Sun, 17 Oct 2021 00:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) client-ip=63.228.1.57;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19H7mXLp021689;
	Sun, 17 Oct 2021 02:48:34 -0500
Message-ID: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
Subject: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Date: Sun, 17 Oct 2021 18:48:32 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: cfsPOBqVTH0+

The framebuffer driver fails to initialize with recent Raspberry Pi
kernels, such as the ones shipped in the current RaspiOS images
(with the out of tree bcm2708_fb.c driver)

The reason is that this driver uses a new firmware call to query the
number of displays, and the fallback when this call fails is broken.

So implement the call and claim we have exactly one display

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 hw/misc/bcm2835_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 73941bdae9..b958fa6a5c 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -269,6 +269,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+        case 0x00040013: /* Get num displays */
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */

