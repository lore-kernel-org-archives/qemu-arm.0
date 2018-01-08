Received: by 10.28.173.206 with SMTP id w197csp2621224wme;
        Mon, 8 Jan 2018 07:54:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBouAjYn+IFh/wc+3brtKn31/lwjwU0UVua3oRD+IXaOvQzT8GVXUvgB2022zFLRhH9+8qZ2e
X-Received: by 10.37.216.144 with SMTP id p138mr11233093ybg.61.1515426869536;
        Mon, 08 Jan 2018 07:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426869; cv=none;
        d=google.com; s=arc-20160816;
        b=IQluYHDS5EMgk8e4dkmgPU611YtJuXVdQDhHH+N1uTUHf0zwqwT5xLBiN7XQYeaEMO
         y0RZ2MtedD4UvYbeA/N742XYFQURCB8gDx4wTrpH4tcUIfybrTVlLshQ+fxbNF87sEJG
         mcf79f7Um8VqL+fujz6qPzOWgu9WF1tU+E0eVdwudSTLsuMCNn+VluH67YML4HBL9Nbu
         /fQwyoWlN5QZ69ltuT1e6IAbKF5LYE6twwPBrU+nbU8I4MTtEBzSl69e1HL2drIs+3aL
         uzn79g2NAdqafwWb23tU24YJ+FsnbA5fsr+GosowU8GNnTvimpg0R2KdiTWtbQesIwft
         UpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OoS2yqXSmLhI1DroCQbSJIrXVyuwogG1ulUTy17/uAs=;
        b=Q6oTmteNXsZXnaUuiBeZIv9Z/7uSVs2/Nd5wsvsOMzjLv8RPLjKbX4ZOkyxw9d1bSP
         aRkpZOqn0SuompmYAFhZUdjB85Ceaexbn4dv19ptaw/O6gPSLD0w1ycWtKEHjrnTQgqT
         2bkkpfhLK1k0A/zaSPEfrvA3m60MAEe45ygOa8MijXzCbHsBbSsPgv4RC3eLd3NnqwF0
         UJbORlpZnAt6VJTk2p7wc4IOmZTAOXf2ib5kef1dMOzZ4hlA4jO+R1cnGi8H0GgaWwYj
         /jlFGCQ9mED3ze+HAIEiNwoY+H59l6gVocfc5ERk9Ep1l9OdkkbqnHzlKQDlpVCd5LoL
         TLhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZbBqZBby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r127si2495739ywb.768.2018.01.08.07.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZbBqZBby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZkq-0002Qv-Ue
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:54:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbl-0002Yy-DM
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbi-00083y-8Z
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:05 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbg-00082C-30; Mon, 08 Jan 2018 10:45:00 -0500
Received: by mail-qk0-x242.google.com with SMTP id d21so3644267qkj.3;
	Mon, 08 Jan 2018 07:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OoS2yqXSmLhI1DroCQbSJIrXVyuwogG1ulUTy17/uAs=;
	b=ZbBqZBbyG0/Wlag6xJu36XViNuoFRZBSku0KZKnu7IvcBRfmk9qEbbgwHctQCodEkv
	LDzpPTKap0RhkjpiTEPrbrR8zG2ZXlAlNjXZIGQ27G3HLRPTeDqtdSbIUEQlP8b4MwSs
	9CooDluDxp9gY8nKlbhq7mMcDwJasd9JO2FlnHPvVoenfeEeBdnJd/qlXHTdq3MWA/Gl
	4vmBKEeRMYNB7GSD1Kd0ZalQe1qMXXh24oMSN4KUQYQ/9+oGvo/up70On4ksiXOpNATY
	mALCLtY3KEjC7CJck8Fb5skWMZHz1XN30EQnRPsoy5tzJ07crdAEUsN9GeClk8cLb+AW
	tmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OoS2yqXSmLhI1DroCQbSJIrXVyuwogG1ulUTy17/uAs=;
	b=UTLErE6QRpbtfQYh7NzytsPLgPYaL6cYlQDBWTj2NMZPCTYhAbrtIkDmcI105ooOgi
	EMFqVrK3V0GdHQJuOcSbXcvKF/Nm7IIyNZiTkXjFJGTF4l/5fqDs7hE2xNHqccH1ni8F
	knQ9joKqxt9lWh0olTx+allLGJ+1eyZWxmpn1f5SpzFNjwnM2WDKFA8YelZ6caWpsq1w
	wyhNTdE6tDKfbDdVh+WCKAY+iZQQcGVxiHOPD4YEENeYs6hj6n9FxmQk5kxDl71K9cPb
	ST0tuWPxY/Rtul6Jad2pLfT/czIDTZM5ynGoXOFatBk3Eg/kc4L42WF0ArHcJ/tnj62/
	6gBA==
X-Gm-Message-State: AKwxytfZKageQJwaIRY3zpr0SvPAhnGDqSO7BezyvqY+PiqwZ+EXn7CO
	DJU3KYh1EYc1Vaq3UvBd/OU=
X-Received: by 10.55.17.143 with SMTP id 15mr15966858qkr.148.1515426299540;
	Mon, 08 Jan 2018 07:44:59 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:51 -0300
Message-Id: <20180108154303.6522-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v5 19/31] hw/arm/bcm2835_peripherals: use the
 "brcm, bcm2835-sdhci" device
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yI1L5eusC1Gh

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..6a9fd79bcf 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -18,9 +18,6 @@
 /* Peripheral base address on the VC (GPU) system bus */
 #define BCM2835_VC_PERI_BASE 0x7e000000
 
-/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
-#define BCM2835_SDHC_CAPAREG 0x52034b4
-
 static void bcm2835_peripherals_init(Object *obj)
 {
     BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
@@ -91,7 +88,7 @@ static void bcm2835_peripherals_init(Object *obj)
     qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
 
     /* Extended Mass Media Controller */
-    object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
+    object_initialize(&s->sdhci, sizeof(s->sdhci), "brcm,bcm2835-sdhci");
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
     qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
 
@@ -255,20 +252,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
     /* Extended Mass Media Controller */
-    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
-                            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
-    object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
-                             &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
     object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.15.1

