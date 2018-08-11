Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp783835wru;
        Sat, 11 Aug 2018 02:09:49 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzY20j1joQbmBTb6BMU2VyoydAHBBYIYpTrVRsH5lJlC/+cWVj4U4y1PWKC6/FIhVULq35z
X-Received: by 2002:aed:35bd:: with SMTP id c58-v6mr9491212qte.155.1533978589239;
        Sat, 11 Aug 2018 02:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533978589; cv=none;
        d=google.com; s=arc-20160816;
        b=1GDlYbMi6i0eYrb/vy+IywdlLxqtRNhBfHsGQqRfibtJcMgiHNHzxHFhIVNwfKHHW+
         gO8K2gGe948apXC69sPySuiZ2GLFWwG7wrzqSP17Uw43T1QcZADwB/ED8t49/VdDxeWc
         dmaHsLMgTr/Hsjj2nTPGR++N83arMKlh2yGBENKyLcJnFuSnHMZ2tua1b9wsvWm7ZTua
         ndwUKeN/yOALlzEWvynKgY25pRtWPnIwlvikaldf119Av7ACQfIhZkyFI439stN66/aY
         bv9vjMzi48o/AG/MICYkbXUaU5tOH+OLuM7wVM3M5O+L0iOjynRgzsGQ7b3epdgJk2Z3
         HmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6pORg9qvjCUjTQTTGC/oS+yCWIxTQc9ZJCnSVpMX0cc=;
        b=YPAJch+2McdHmKGOpCV3rpX866Z6gqZA8Spev5X+oqPyCxk776LMpZGiadNdIBBZL5
         OckZER9BygEvrd9B4NrLdRQYPWBGyhOJJuDcz5ZJ1R28fto58ki1rkDir/vE9DVGrQMY
         1/EGIYEu0nAqbZEbci/OQieu+20I1uf5Fcps6pz9VU9Q7MThD6MDup99RJ8tkaczixgK
         opEbaU1ssELDwUvaxIfzkfVB8UDKcs8SDDpKYds47CwNmQm3k4+sksU2uaQMnAA9NswC
         4mU2ack03P6NgJ6tSc5UJNJ+C0sopQU+K818kfBT1TJAwCN2PZ+iiniZFcOMhzESg3sy
         +OPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6-v6si973555qvf.69.2018.08.11.02.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Aug 2018 02:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1foPu8-0006Vz-Mm
	for alex.bennee@linaro.org; Sat, 11 Aug 2018 05:09:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtB-0005sz-V3
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtB-0001Gv-2t
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:49 -0400
Received: from steffen-goertz.de ([88.198.119.201]:34708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1foPtA-0001Gc-TA; Sat, 11 Aug 2018 05:08:49 -0400
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com
	[80.187.80.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 83F7B4BBAF;
	Sat, 11 Aug 2018 11:05:40 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2018 11:08:34 +0200
Message-Id: <20180811090836.4024-6-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180811090836.4024-1-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH 5/7] arm: Improve error propagation in nRF51 SOC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 990UkBRaXuXE

This patch takes care that errors that occur during
instantiation of the cortex-m0 cpu are properly propagated.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 2265d30352..88a848de8b 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -66,8 +66,17 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
     }
=20
     object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "me=
mory",
-            &err);
-    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+                            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized",
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
=20
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memor=
y, -1);
=20
--=20
2.18.0

