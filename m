Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp781741wru;
        Fri, 27 Jul 2018 07:42:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeMwHO7qnFKixH0Q34O96/hFscCNEuyE0HFMFv1/gngr3JdEyzg5Iok3wBiEoiEI7WseXug
X-Received: by 2002:a37:3a45:: with SMTP id h66-v6mr6315335qka.118.1532702528385;
        Fri, 27 Jul 2018 07:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702528; cv=none;
        d=google.com; s=arc-20160816;
        b=YW03q6mAD7AzW4O8BU9MfYC7g0iqQV1kQK6DezU+XjsVi1lXbWy8jFaA53xhzmw2Tz
         1Y1739+9Tcso5PR0rpDX4Qk15sHyCafsXE5DbHbc7HGYrZKZMdIhIVie2tpGnhKVYtOu
         Cm6AGqaaaWAgIztJmrjuO6YsYTrUwICLNoWW3cLQeWbfrQ02meDviykFJaxqpm7cn23Q
         iNZQp0F8epughHaTxi0dXj9zDs2V1PFHe3H8JHa4HO5d4a8VaPX+0o+hmffasa22x+n3
         fd1HlN4YOxQnupcqNlyLFqPlzSLG20Xl8up+hwY8PaWA2cYOqj55jLqqyeuGWjeiXYCM
         wxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=jA6HSkaxih1YIIvAssa6dO6eTv2l6vUDzqJM98r1R28=;
        b=LyzLqoUBlpe+qAf9wPilhVQgZEk8wcSHSZ540lLUtXUxxvSGhBgXl/SC5GXg8antk1
         mzXnp/Ap3PelyxBin0tZ+RZEh/9haTY1mXbH+qi6C/4oPQdYoVVRz1Seb9k0qRnambXn
         vpMWRUAt83WEFo/Ve0+pli71RPNeGfnxtfiBOgvhuZBW0i7CwlDandQMvd0E8K9eZFW6
         10pLCwiI7/3ip24zZop63zbg3L+l1xrAInytBCa7mlvJmBWLfSCwL4Bya3GSiRJz5z/k
         algajj+YGu+n0dE+aa6Z1XRvbmm1ChagwWH3sntLerc4P+/iwtMbBDUs24V45ttaa9hL
         Hj7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BmGwER43;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wyuAMg87;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wyuAMg87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1-v6si3707510qvn.27.2018.07.27.07.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BmGwER43;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wyuAMg87;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wyuAMg87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3wV-0006Rk-S3
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:42:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sF-0003Ec-2L
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sB-0008DY-Tk
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:37:43 -0400
Received: from greensocs.com ([193.104.36.180]:50606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sB-0008Ae-Fb; Fri, 27 Jul 2018 10:37:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3ED5B443482;
	Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702251;
	bh=hTz2cBGR4g3rz6906UkiYcQqelpk1tHGFoiGUNsN8Wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BmGwER437dP0jV9qxrW30g7MkYd71nH/mhoKpslJ23OKKj/9MJeIIIQfDPd/ivZed
	AvUvGrgDTHWE5eTEdA44p5Df1l5Hc48UCryALbsqzS89gGxvnXaLWKTsaf0VSp29sa
	vKLZ4bnxtkpRHG/oGTIM4G8WiYsRsD2tH5Se5lLM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wyuAMg87;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wyuAMg87
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeX5WTX0vOB6; Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 53A6F4434A4; Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702250;
	bh=hTz2cBGR4g3rz6906UkiYcQqelpk1tHGFoiGUNsN8Wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wyuAMg87wxndpVAy3v+ltoMfi6sQg8HQS2KqXz7+i8p+4J4w4sAZUYE87QbwCu3aF
	lMfnZElEzxR/54xVVG+eZoFCP3XKx+SnMgDlxu0qXKDeyyW5f/dNSVUhsQnx/FG4zA
	4c3bZi7LiVKjYlgz4lL4doViB07pjHQJvICcJ2a4=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EC10642899A;
	Fri, 27 Jul 2018 16:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702250;
	bh=hTz2cBGR4g3rz6906UkiYcQqelpk1tHGFoiGUNsN8Wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wyuAMg87wxndpVAy3v+ltoMfi6sQg8HQS2KqXz7+i8p+4J4w4sAZUYE87QbwCu3aF
	lMfnZElEzxR/54xVVG+eZoFCP3XKx+SnMgDlxu0qXKDeyyW5f/dNSVUhsQnx/FG4zA
	4c3bZi7LiVKjYlgz4lL4doViB07pjHQJvICcJ2a4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:21 +0200
Message-Id: <2b92ae960dfc47149945c9e47f90b4433d8eee35.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 27 Jul 2018 10:38:41 -0400
Subject: [Qemu-arm] [RFC PATCH 2/6] qdev: add power/clock gating control on
 bus tree
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EF1HBL/wklc8

Add functions [qdev|qbus]_set_[power|clock]_all(_fn).
Theses allow to control power and clock gating along a bus hierarchy.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/qdev-core.h | 20 +++++++++++++++++
 hw/core/qdev.c         | 51 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 659287e185..607c367738 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -464,4 +464,24 @@ void device_set_power(DeviceState *dev, bool en);
  */
 void device_set_clock(DeviceState *dev, bool en);
 
+/**
+ * qdev/qbus_set_power_all(_fn)
+ * Enable/Disable the power of a tree starting
+ * at given device or bus
+ */
+void qdev_set_power_all(DeviceState *dev, bool en);
+void qdev_set_power_all_fn(void *opaque, bool en);
+void qbus_set_power_all(BusState *bus, bool en);
+void qbus_set_power_all_fn(void *opaque, bool en);
+
+/**
+ * qdev/qbus_set_clock_all(_fn)
+ * Enable/Disable the clock of a tree starting
+ * at given device or bus
+ */
+void qdev_set_clock_all(DeviceState *dev, bool en);
+void qdev_set_clock_all_fn(void *opaque, bool en);
+void qbus_set_clock_all(BusState *bus, bool en);
+void qbus_set_clock_all_fn(void *opaque, bool en);
+
 #endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index bb6d36eab9..24b90bd45f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1138,6 +1138,57 @@ void device_set_clock(DeviceState *dev, bool en)
     }
 }
 
+static int qdev_set_power_one(DeviceState *dev, void *opaque)
+{
+    device_set_power(dev, *((bool *)opaque));
+    return 0;
+}
+
+void qdev_set_power_all(DeviceState *dev, bool en)
+{
+    qdev_walk_children(dev, NULL, NULL, qdev_set_power_one, NULL, &en);
+}
+
+void qdev_set_power_all_fn(void *opaque, bool en)
+{
+    qdev_set_power_all(DEVICE(opaque), en);
+}
+
+void qbus_set_power_all(BusState *bus, bool en)
+{
+    qbus_walk_children(bus, NULL, NULL, qdev_set_power_one, NULL, &en);
+}
+
+void qbus_set_power_all_fn(void *opaque, bool en)
+{
+    qbus_set_power_all(BUS(opaque), en);
+}
+
+static int qdev_set_clock_one(DeviceState *dev, void *opaque)
+{
+    device_set_clock(dev, *((bool *)opaque));
+    return 0;
+}
+
+void qdev_set_clock_all(DeviceState *dev, bool en)
+{
+    qdev_walk_children(dev, NULL, NULL, qdev_set_clock_one, NULL, &en);
+}
+
+void qdev_set_clock_all_fn(void *opaque, bool en)
+{
+    qdev_set_clock_all(DEVICE(opaque), en);
+}
+
+void qbus_set_clock_all(BusState *bus, bool en)
+{
+    qbus_walk_children(bus, NULL, NULL, qdev_set_clock_one, NULL, &en);
+}
+
+void qbus_set_clock_all_fn(void *opaque, bool en)
+{
+    qbus_set_clock_all(BUS(opaque), en);
+}
 
 Object *qdev_get_machine(void)
 {
-- 
2.18.0

