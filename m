Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1861080lfc;
        Sun, 17 Oct 2021 00:49:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySGYjKVFcxTKi5nYV1zbwyr1n1QovSpjhB52uZZ5fn+r+XhoBMR7G7bYirVI9GR4v8//Yk
X-Received: by 2002:a02:cac6:: with SMTP id f6mr14052329jap.81.1634456979101;
        Sun, 17 Oct 2021 00:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634456979; cv=none;
        d=google.com; s=arc-20160816;
        b=drG9KbpH3RSU/s4CW/B/AUQgean6a1spFUQf87ijYY4Y0Z8BT491Xe6YOtTF4iqUhV
         J3Bv8iTAmc+9khz9NaKYE6lIXA8DHd8JsEwHx/KNOwtPG9RqxXP/BYCahtmJEhVa0bbX
         vgT8vX3c0qvDiGbKd9sL7uTHcJhEttSZmjuTcBpSTg6fokoHS8W7D2I8FTsn6Rukxh6X
         2fjIOVwd5wBZJOYG/AU9vUPX5AIkULoVXkEtFlkC0IAUrzg9yaGgSCQmjP9ylX8pSTLp
         PaUbDvZiteH2BNpgXE5HIQ85WVTQo0pFvM032K1eaMKlZd6fn04XibNEd21ZWEWUBUCM
         Xszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:date:cc:to:from
         :subject:message-id;
        bh=l9xFuEbb/ch1ILXG5J5I8jg+IWK+uhqSChf7WcfQTbw=;
        b=yK2jpXPAkQ5fsdhjbwFQshxTeEn1Rehn6JTnfTQpPZ4jV7qpE6qw4mrju2aK4tv9ZK
         Ip6/M742vhUTy9+MbtEaY1GxEUXfqnUgBKxkWlLNjEhEHosEEPYmFB4ZTrRWEOZ9m/N6
         I01EdIp3SCAAM+aWAwnsBBq6cm5KhTg7rLw+wo0ctAG01Y6lvmrTai1JvRs5hStXcTif
         bGyWsoY0O+VKLlj0YNkgEzN6zoo6vBUEUbNQDWs2nvEtJYTCuaWreA6POke8BMLDUFwP
         p4y6oBcJxE1Hc3iY6tRaGoIEFRFI+ijgeD7fjl2mAy+w9uSUkkmjt20+tlHvz4z5nFog
         bxVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org. [63.228.1.57])
        by mx.google.com with ESMTP id m6si11096629ild.161.2021.10.17.00.49.38
        for <alex.bennee@linaro.org>;
        Sun, 17 Oct 2021 00:49:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) client-ip=63.228.1.57;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19H7mafh021692;
	Sun, 17 Oct 2021 02:48:37 -0500
Message-ID: <436e3f7b8f6d989a01ad0d8b9b226cbcbe0208c0.camel@kernel.crashing.org>
Subject: [PATCH 2/2] hw/misc/bcm2835_property: Add dummy Get/Set GPIO virt
 buf messages
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Date: Sun, 17 Oct 2021 18:48:36 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: y9uZ9Stn7gdp

Without these the RaspiOS kernel tries to ioremap some bogus address
and dumps a backtrace in the console at boot. These work around it.

The virt-gpio driver still fails to initialize but much more cleanly

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 hw/misc/bcm2835_property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index b958fa6a5c..62037c0630 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -274,6 +274,13 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
 
+        case 0x00048020: /* Set GPIO virt buf */
+            /* fall through */
+        case 0x00040010: /* Get GPIO virt buf */
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            resplen = 4;
+            break;
+
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
             stl_le_phys(&s->dma_as, value + 12, 0x003C);

