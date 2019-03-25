Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711221wrx;
        Mon, 25 Mar 2019 04:02:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwos0ba2igrBlY2oV5+8IzcYmHQJWjTyT+kPdBnQuFEzWO4isUuKQpGcVw1aOcYTl3iyonT
X-Received: by 2002:a25:20c2:: with SMTP id g185mr19325643ybg.308.1553511772526;
        Mon, 25 Mar 2019 04:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511772; cv=none;
        d=google.com; s=arc-20160816;
        b=QYZFOF+1rv2HNXLzNnPd13/mOKA8JFieUbYtv1Yv2WpxHat4iI5kDYzh+duwqkmECR
         FgTpl5xB5SXZjyW0f6TAUsCPT8x2Fg919jII3X1QrF3qFAGZ1CCgDW7K7T9ctLjFmEBl
         JL1X8wldAO103dYMRjaYUikA2DRK5NMa35dbi2hta+diRV0/SZNZerfAFV4koPh5jbj3
         UHwKyFbha12xorJB3hN99hMA8T4Q6/YYC3wG6bjQiomvKTUunyBMHlUAfdlxH/KWQjeo
         6bVGy1LoujSzL+ltugwLAjlV1rnJo0tAAhm/IJJk+Ku2CFXluUa7CfCeO4lEJYQoj726
         fnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ze20Dq+UwSDd2RTWOSCoebIPVLgBolz1D30ILT9lA/s=;
        b=w/1PSC9DLEVvMUZd746+BIVvSWgXboOtqOve9lHUWHF0vDmVaIK2ltuesN2NP4HWmL
         iAIBt1z5L0C8xBtwXsPxlRaqnPX5ek74UjIeio+hYhStb5R8G9JE+lNaO30lin/0SnVO
         ntspO4lhU+RqTjBtPFZVK3ai+rjEi2bm04fPrnaRDXIyb8EnidHrxMC1zGpzd2brtspK
         7LchQyG2Rw0GgxvnM41k61z/lGIvIO1XGBwt3yn+oOZp7E4Gol0230M4xVBG/8rp7p28
         MCyVM+SR3nbXL1PeJkCYjIlGbhdcW43N/LgVQEyoJFWc3UaMTip3qJuoMKYGsWEZaEpR
         PYtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=a3txnkBe;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0AIFkiKL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=e0ryLl+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si8823157ybl.252.2019.03.25.04.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=a3txnkBe;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0AIFkiKL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=e0ryLl+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNT-00057G-Uw
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:02:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNA-00056p-IR
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-0007p3-7D
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:32 -0400
Received: from greensocs.com ([193.104.36.180]:38354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN8-0007oM-NK; Mon, 25 Mar 2019 07:02:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7A3177D78B8;
	Mon, 25 Mar 2019 12:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511747;
	bh=lGE7MCKyxHJ42vXlmDZmCJr5vSNbahRYjiwSWEk/jDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a3txnkBeDOFt7wL4yxzYPgsXQGhfzeMUwR0jr3bjbvmhj2WRprMDkBFwYWLT474QB
	EVUjIufTJBUvTrID+QNwTFtl7wNWKDaC9T8pAipCaRIyTEBfwaKMhPbrhYHP+qpoZj
	PgYY7scT4ivILuTawVWhI8h6Z0CIbpB/C/eo+7aw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=0AIFkiKL;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=e0ryLl+G
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzRRNh5PaNmb; Mon, 25 Mar 2019 12:02:26 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 930AE7D788E; Mon, 25 Mar 2019 12:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511745;
	bh=lGE7MCKyxHJ42vXlmDZmCJr5vSNbahRYjiwSWEk/jDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0AIFkiKL+nhWMc5jowrmbbptpixslzWj4kayvtcmQNGRQD9IokKGLZhj7iretteUN
	TbWGwFH4uP60hd5jyVupMV0YWi07yd8sa/D/HeAjb2A+GhQd1c8wT8SSyKhP8CtZnj
	rBLq1/odzcFUQhNj91ziSfw673SDCT6+OFC974zs=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 5CD477D78B4;
	Mon, 25 Mar 2019 12:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511743;
	bh=lGE7MCKyxHJ42vXlmDZmCJr5vSNbahRYjiwSWEk/jDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e0ryLl+GV9GWIRdr7PF5n5ix/9+MGs7u9JDN55sjyzRHf2Wy+z8h0usJSnJW2N4gr
	tzX+5MLEZ4jV2xKqgkXZE1wGC+rd59C6KY0507RO2yxP5DrfrWOCtUyjtaTkzveQc7
	UGDi2QT86aCXXCkd0Lx4l9UEe+0v03FaZklHZhZM=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:50 +0100
Message-Id: <126d324367f189b2f08df15ee1ff13add61add8a.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 07/17] convert qdev/bus_reset_all to
 Resettable
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KdV3n6KvxRyz

Change qdev/bus_reset_all implementation. It now triggers a warm reset
using the Resettable interface.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 8dae26d957..7adf234474 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -320,25 +320,9 @@ static void device_reset_exit_phase(Object *obj)
     }
 }
=20
-static int qdev_reset_one(DeviceState *dev, void *opaque)
-{
-    device_reset(dev);
-
-    return 0;
-}
-
-static int qbus_reset_one(BusState *bus, void *opaque)
-{
-    BusClass *bc =3D BUS_GET_CLASS(bus);
-    if (bc->reset) {
-        bc->reset(bus);
-    }
-    return 0;
-}
-
 void qdev_reset_all(DeviceState *dev)
 {
-    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_one, =
NULL);
+    qdev_reset(dev, false);
 }
=20
 void qdev_reset_all_fn(void *opaque)
@@ -348,7 +332,7 @@ void qdev_reset_all_fn(void *opaque)
=20
 void qbus_reset_all(BusState *bus)
 {
-    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_one, =
NULL);
+    qbus_reset(bus, false);
 }
=20
 void qbus_reset_all_fn(void *opaque)
--=20
2.21.0

