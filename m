Received: by 10.28.173.206 with SMTP id w197csp2621785wme;
        Mon, 8 Jan 2018 07:55:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBos51jbxKvKZUaoJsh13aeT8qnwcwgEPgDQZvQrQVNkq8o1devOYcxBj6BAdq/QkLhf8LvA5
X-Received: by 10.13.206.4 with SMTP id q4mr11053835ywd.305.1515426905164;
        Mon, 08 Jan 2018 07:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426905; cv=none;
        d=google.com; s=arc-20160816;
        b=sVPeMFRMs+UtIcIDHmfKlREMavoHTdqw6inWF2l/8SLO1VohSuWVJvicSfguvd34u2
         iBPJRS/wsD3TCeYcgp1sJ6j5/CHw7t39NKC5INRCQHp2BkqouNFpy8JCyylxdWfcFrUs
         TQheBNwlTM9N28/hwm5daDwnXC2WiRnbVp/rpCPzs1u5fsZX8706mWzSulIJu8sK4Hof
         FCBvsW2lMqlV+sV7hca75qgcaDiS0ehPICMukSzxASugdbrBI+E5kgNsCvOIXbTASHYr
         dd/unmkLzUCxP311g63s4tiRkmAtwb5H/DU0T3c5oTBl/j6PVkmKjsmmPT89vxSRn5eI
         t/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GqHB0CwKfOyZtj3a6K9/xpUJPYfxrSC9/8p3HUlvTI4=;
        b=q3cUuarLM86ceKbgcR3Mhrp2dn8EC/voLCM7pSrZcbd4AIx27upJ+jPpZWFl9j7+Np
         87dsuf0Bsu94eMPYhznRj55kfl4I98Rhp6U9ArKOGDZqrCBGhjDR1QMjXgckGIzq+cE2
         TrAnS416fNtlmtiUCrnVojbRW/pCfHHHwZcJp+l0eruG+bX2UDK6gso5W2eVaZShvx2j
         iJeN4LQ3NX7TdpYS9sGfioOOek1KhAO3E+z8grtJqUOSGyIr6Sq+gYeKMEhdhJHQI6KA
         OJ19M5szZzbABI7xBHxShj645NGmhHNQ8hWdAUbyCqYZJnCnPs9m0LI7uDTcLnUBSU6l
         2U+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cAuunGN2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d140si221978ybh.508.2018.01.08.07.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:55:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cAuunGN2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZlQ-0002ds-JU
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:55:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbv-0002nB-TU
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbu-0008Ip-Qz
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:15 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:39776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbu-0008IY-Lh; Mon, 08 Jan 2018 10:45:14 -0500
Received: by mail-qk0-x241.google.com with SMTP id r8so10337831qke.6;
	Mon, 08 Jan 2018 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GqHB0CwKfOyZtj3a6K9/xpUJPYfxrSC9/8p3HUlvTI4=;
	b=cAuunGN28j1p4j+SjNValmdvI5I5JgzgTdP3xI0NxHN0TZO4rnzd93d8PrnGTyctcZ
	PW7/4W8Xz1ZZkxVZUv77Ezqxq89jlMNGSGRJD+c52rIwTmWtiPc+7aO9wDXW2yuCpl0e
	HRY08hOenwB3DBzeczBywPJ/+rAFkh/0o7/QFW1b+f88egSuF5yCU3Fni3++drn4BFOA
	Ysu7dk4LNgmB3JdU4IU9w7KKyNPVZoSH8jFb2i/hGux+vKcUd5JlP8wS6uUvfxiSdxRx
	Qa85xdKiSRrJW6PdOeFkelHXhbpTu5AaufznfgHXvxeVgNEXz20wMTYPtAdhdOwFY8hT
	KoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GqHB0CwKfOyZtj3a6K9/xpUJPYfxrSC9/8p3HUlvTI4=;
	b=fk9ELV7iDURcg37s6tD39BpeUPfkhGvWq0BdvLgO3gmkd7TuCQz7OCroGHGYQDBnWZ
	ujEnzwrERSf/B/a/A3hJpQjTwTIn4M01vFOTrSUO2o/rEKeDgB3Gfh/utC5MDJPM8Ywm
	yfI/4t82Idg6Hz9qTRjMbJHymFDxvamjcuxQplspyS6UVNwAHY7xh+IvnNR84BVS2XM/
	JFljhxfcqbRlzQ8a+ch/AyrdkTJox+bjBQOnspjLj6f3nHHvwHh7BcVphfgIcvh+gAST
	aGC5QV+DQ3lPhxXeBCQnS7/LdCf2oFBU1Spfuc68IANcbizeGUnMVL5h8m2/BMz9dnZA
	sDWQ==
X-Gm-Message-State: AKGB3mKPiZf3YPkD+cvGBvRf3cPuzQGq5JSE3IdqazzgFqP7fqxhBvkv
	PqbcolJEDVXGfIfD1+3dtE8=
X-Received: by 10.55.91.69 with SMTP id p66mr16969991qkb.247.1515426314062;
	Mon, 08 Jan 2018 07:45:14 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:54 -0300
Message-Id: <20180108154303.6522-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v5 22/31] sdhci: add the generic Arasan SDHCI
 8.9a PHY
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3nJ4bxph5dcH

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/arasan_sdhci.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/sd/arasan_sdhci.c b/hw/sd/arasan_sdhci.c
index c6d96b2583..11160baa22 100644
--- a/hw/sd/arasan_sdhci.c
+++ b/hw/sd/arasan_sdhci.c
@@ -49,6 +49,42 @@ static void arasan4_9a_sdhci_realize(DeviceState *dev, Error **errp)
     }
 }
 
+/* Compatible with:
+ * - SD Host Controller Specification Version 3.00
+ * - SDIO Specification Version 3.0
+ * - eMMC Specification Version 4.51
+ *
+ * Host clock rate variable between 0 and 208 MHz
+ * Transfers the data in SDR104, SDR50, DDR50 modes
+ * (SDR104 mode: up to 832Mbits/s using 4 parallel data lines)
+ * Transfers the data in 1 bit and 4 bit SD modes
+ * UHS speed modes, 1.8V
+ * voltage switch, tuning commands
+ */
+static void arasan8_9a_sdhci_realize(DeviceState *dev, Error **errp)
+{
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_GET_CLASS(dev);
+    Object *obj = OBJECT(dev);
+    Error *local_err = NULL;
+
+    object_property_set_uint(obj, 3, "sd-spec-version", &local_err);
+    object_property_set_bool(obj, true, "suspend", &local_err);
+    object_property_set_bool(obj, true, "1v8", &local_err);
+    object_property_set_bool(obj, true, "64bit", &local_err);
+    object_property_set_uint(obj, 0b111, "bus-speed", &local_err);
+    object_property_set_uint(obj, 0b111, "driver-strength", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    cc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
 static void arasan4_9a_sdhci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -58,15 +94,31 @@ static void arasan4_9a_sdhci_class_init(ObjectClass *klass, void *data)
     dc->realize = arasan4_9a_sdhci_realize;
 }
 
+static void arasan8_9a_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCICommonClass *cc = SYSBUS_SDHCI_COMMON_CLASS(klass);
+
+    cc->parent_realize = dc->realize;
+    dc->realize = arasan8_9a_sdhci_realize;
+}
+
 static const TypeInfo arasan4_9a_sdhci_info = {
     .name = "arasan,sdhci-4.9a",
     .parent = TYPE_SYSBUS_SDHCI,
     .class_init = arasan4_9a_sdhci_class_init,
 };
 
+static const TypeInfo arasan8_9a_sdhci_info = {
+    .name = "arasan,sdhci-8.9a",
+    .parent = TYPE_SYSBUS_SDHCI,
+    .class_init = arasan8_9a_sdhci_class_init,
+};
+
 static void arasan_sdhci_register_types(void)
 {
     type_register_static(&arasan4_9a_sdhci_info);
+    type_register_static(&arasan8_9a_sdhci_info);
 }
 
 type_init(arasan_sdhci_register_types)
-- 
2.15.1

