Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp478881wrt;
        Thu, 22 Nov 2018 02:05:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W5aZ7+Al03Me7JlFv5u66m47uVaO3ypIOZDzXO6vPPLPmIHyF67KgoQC8OHyXu2nmYLQSj
X-Received: by 2002:a25:8002:: with SMTP id m2-v6mr114595ybk.429.1542881153294;
        Thu, 22 Nov 2018 02:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542881153; cv=none;
        d=google.com; s=arc-20160816;
        b=dc1Mww5g8cfVAzjn53OAhGbFoGNSBJa0kiEIV7gB5d343RgUCAG9XBN6rVvjpoousB
         ge4P4nAdSYbX/vXOhkxIUA3AByQymF73JiISTaxjRBBC1Ia+JJN3j3BVZje4pFGVW95g
         krMyrrYKAlIDjHaMQUuA0dbqmrbqmyr6GV4M3Dhh/qxJizPk/ZZxF0gGehH/u1BX/YmZ
         iLW5n1k2/mF8/LoCLMYh9UvrteCsR162s3Nr8G6IfQ4pqoBXcBz9t787JzV3bhR6o5VZ
         t+JsOdp5U3dsMahi0jdU96O1aII3Xx7YVh9qL0c0UjMG96sqJOobl60uQ4bB76qfgin8
         Y0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=616SeAV1CdHydpFJjnS7/OlHGP7MYLRANqYP+TRoAyo=;
        b=Wi9IrgqgatlalF7UNs6RD/Tb10LxN+46WSYLlN1451/C7ngSFsCdRQpZM+3Onp6ABH
         3lQkqJETtdv5KBSDG+s+S4tsky6/5YNm2VQThoVTQ4U3BhdQbQg6KPT319tAaW6M5XKg
         IJoW45JfDagIJiG7uPHaMaWVS00RcxiQiICT2I8oO2PCiIbviU+Dcip9//mfhskWbW2J
         BLgdfEGl1m2324lsku6iqDbA63hAb89jKgitTN04Ef+gCJFmjJJ7rPjealCjkl4ciWrH
         52gXv0Xh/vBerT3vP9VENBCabOzUrBzJykOPVZSr/unESevdGwgXPl9G9yd6BfO4D/kb
         ekHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ih05lzQ6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 123-v6si29580713yww.373.2018.11.22.02.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 02:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ih05lzQ6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPlrs-0008QJ-OS
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 05:05:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gPlqi-0007ya-Nk
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 05:04:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gPlmq-0001V6-Ia
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 05:00:41 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gPlmn-0001OD-2f; Thu, 22 Nov 2018 05:00:37 -0500
Received: by mail-pl1-x644.google.com with SMTP id b22-v6so9033577pls.7;
	Thu, 22 Nov 2018 02:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=616SeAV1CdHydpFJjnS7/OlHGP7MYLRANqYP+TRoAyo=;
	b=Ih05lzQ6wJqgo0wcJCtHwr6by2V1aUrLVLTeCwSe18ufJf+eifzSqYftXAY62zU9KP
	XVTK2rE+eqLolvyBYoEiCWXfsJVJdaxuOLzUIwSRQqAHW08vjPZctl8PQJ8hUtiBNPi8
	LPJNpD1VYVoHY4jA7V542fD0585QYi0P0rc9xoMeyB6DxMJR0xLvumr3kYPncUAilxBf
	/XzZ0aP9BCePV4p9N3qRQoQH7uarpvFxDfGwY+FwbgLh4Mca0GCOXk1WV0oNFOmIG4gH
	vSb74aRZhG08UIbwjoUED3PpFnRMVFb8nC5NiahbuOkpE+SYrApUOJRLfIO6XPyYNChb
	0RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=616SeAV1CdHydpFJjnS7/OlHGP7MYLRANqYP+TRoAyo=;
	b=nHkbp6yVpp5S2JonVLhNyBZfHNNyDN0oIZ4HfmFB2cmFa9SSSvn2FKwm1F1oZxIwVX
	1lKQE5rtjp4UFtg49vDa10Ww5lpoSVLVaZgCZPOPH01tUPrU6fL2GOb0pszX2KyvGLxc
	LyNx5oX5S180JSAaQ8m66jcwtdGUcuLNafsYLf3MgvE08smFfC9ipcp+7qk5Iryk4LkZ
	Cy0cGGE2S0pgf5C/hsiagn7v4qaOd4fEOO4J9y2s4pz+t/pgeV7gxBMLLFQSrkDoNEHW
	oDVnTvwPZPJzTSdFSbnixGk2/Wsq+xhyWVaD40d33Jhaf0UJU3BFIOAR/7TK8/FXoUJK
	R42Q==
X-Gm-Message-State: AA+aEWYAdyB4NCt6AH3aQ6gj30d+/58n1po0jkSbAuUy9qPsYhGFQwYd
	a8WFcYoPgTFZbG44ozss7rQ=
X-Received: by 2002:a17:902:7402:: with SMTP id
	g2mr10414521pll.198.1542880835699; 
	Thu, 22 Nov 2018 02:00:35 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id
	f64sm111708638pfh.0.2018.11.22.02.00.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 02:00:35 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: jan.kiszka@web.de,
	peter.maydell@linaro.org
Date: Thu, 22 Nov 2018 02:00:25 -0800
Message-Id: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH] hw: arm: musicpal: drop TYPE_WM8750 in
 object_property_set_link()
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
Cc: Li Qiang <liq3ea@gmail.com>, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org, maozhongyi@cmss.chinamobile.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4VMlrOWTfCvs

The third argument of object_property_set_link() is the name of
property, not related with the QOM type name, using the constant
string instead.

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 hw/arm/musicpal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9648b3af44..726ae29394 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1696,7 +1696,7 @@ static void musicpal_init(MachineState *machine)
     dev = qdev_create(NULL, TYPE_MV88W8618_AUDIO);
     s = SYS_BUS_DEVICE(dev);
     object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
-                             TYPE_WM8750, NULL);
+                             "wm8750", NULL);
     qdev_init_nofail(dev);
     sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
     sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
-- 
2.11.0

