Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1675554wrh;
        Sat, 27 Apr 2019 06:30:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxO81h36XYlUkoqGSg2tym9gOJmkPGcU2p7T4mq/5XzyyZADJDPA4ZcvL1gur1WThILFgqa
X-Received: by 2002:a5d:4348:: with SMTP id u8mr9587914wrr.129.1556371856226;
        Sat, 27 Apr 2019 06:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556371856; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTyIQkQUTE9DEFVqIac5AHD8IvP6g6A0ZR/L6atOosPsI7mk8GG70nUgevgTYC3wWn
         FU8Hjbax0+PBXgsc0HRhtaxl9NLFV5dAIjI3I3wuqwW42iIKEUB0AeWVwu0nKPsOryTv
         gTcfILkAQe2eeFeSSboF1Mif7mOFjNKMkdP7pRan/WEWzqHze8ABmWPDlpkdczHGAkDB
         99wPo3qq1h8uFRkLnZNW3QrQn6DTnNtG9vcYTSiCikv2c40iknjt6n4hNqrNuIeRF8D0
         uWS9zGISLTe0I5uk/cbA8wSwkyD9WjZGuOJPk2VogdXLk6RtN0XkDWYCMgaz8vxZXmii
         HE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=c82OD9b33mArWiralVzQedXqXgt+PY+OZxrG3YxURNU=;
        b=QzlWKA3FoJXSjFcQrRKYutoT/rFFDjFdoaHXtzcbtZQHVSUOWYl52lqb63/Nevyov1
         wOLGtdWZoyBpL2GGHT/GPsqcgc0EussWLmJq9KDtRV5Y2+SqhEzXWjMKJZWanO2O2aey
         wkpdc7+pbiNDjcxUSBs25ml7uRDtrG9Rdn2p8ayXDoM0INyCAZYrpHVbY1iQVyiAywAF
         Rk9XVn5ifG/G2wZCevnaFNhf3fVa12ipULwbHHATyMdj6AyYzS3Y7O1qjV2IE4Rd6igw
         gMjnpd1hnLrBXc4QH+Jc4G0LRZ3EDxqH1SRpZM1v/ju5ezQkEBqo+OWbM25aXK3yyGMX
         Blbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si17697631wrn.78.2019.04.27.06.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Apr 2019 06:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hKNPr-00062M-Aa
	for alex.bennee@linaro.org; Sat, 27 Apr 2019 09:30:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKNPb-00061z-Nb
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 09:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKNPa-000243-VQ
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 09:30:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKNPZ-00021g-JI; Sat, 27 Apr 2019 09:30:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7612130BC73E;
	Sat, 27 Apr 2019 13:30:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B50B65ED4D;
	Sat, 27 Apr 2019 13:30:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 15:30:28 +0200
Message-Id: <20190427133028.12874-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sat, 27 Apr 2019 13:30:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/dma: Compile the bcm2835_dma device as common
 object
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F3X9XZ/DZzM/

This device is used by both ARM (BCM2836, for raspi2) and AArch64
(BCM2837, for raspi3) targets, and is not CPU-specific.
Move it to common object, so we build it once for all targets.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/dma/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 79affecc390..8b39f9c6004 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -14,4 +14,4 @@ common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
=20
 obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
+common-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
--=20
2.20.1

