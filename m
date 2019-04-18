Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp946043wrx;
        Thu, 18 Apr 2019 11:27:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD75XCTrGbMJRCInwchcYFlB9wSXBjBHIOm+XVlNMIOc0dh8Xymm4j86vDwcGSbe4/HpZO
X-Received: by 2002:a05:6000:1:: with SMTP id h1mr3093367wrx.263.1555612051066;
        Thu, 18 Apr 2019 11:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555612051; cv=none;
        d=google.com; s=arc-20160816;
        b=gHig3NJY5k9iF6kf3viMaXV3okZkCRstAS031DUPAP6PzMUfl7EsodkXvqCrMXnT6G
         McgLJ0HgIyK2U5ufu/ItTC/ZJioszXKqG9OgqIfW+gzYU8ckm4MluaaEOZ94Q5u9PxQa
         dCRItJdDtbE4oKh8ERVZb8WwsvffisejljYetB6XDILMAqHei3rmg+YbGNMDZVckkU+Q
         0VKRnLNi1IJ8b2IUVZ9snRSLd6IvKryVz/og28yoTVZqGYdyju0J4g8VThyxaC+qDk3X
         rynbjUPtnmNJ6esdpN9KVmaUeI3mKawer3TIiJMZLcoDi5VLovxcIz5r+Efan7AiACCQ
         GXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bBgOVDs0BDbiWk0zVSjFDXkh4MUGVmOs+GjzGMh8eiQ=;
        b=UR80VHTpO/Yqilz7eMHV9aLR44nP9DIT0Rsb7B7RxUS1chBt+DlvV0NdReBBnUESZa
         +qZoPi3ro2kBWUwV7sBMCpKSAdRRmd80hLUCG7UEVA8APVbJF1r6WfrjfL84HPqPx4T0
         MCjbuUTQhXIt5zq39woMh9c+I/Z5JcAnMmUGjUQbwQtS9wbyvGBCP5uxcogIhCgeMzfa
         BMWtNNq7l/d/OZnEEvIA36jdIleeCwB1xT7Ly1EQkwqOwWXWkh3YdX1tm6M2TWnAcFfk
         Rp7S13M90+sJ+tX4Ziyqx63dDxREWH/phj1sq5J9pDus3Q2Dv28GQR7ICZ2FjL6vOTGF
         1+pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si1993484wrj.412.2019.04.18.11.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBkw-0006ny-4B
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:27:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBQ1-000613-0z
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPz-0003wg-Fo
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:05:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBPt-0003tF-Vg; Thu, 18 Apr 2019 14:05:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A61EC5859C;
	Thu, 18 Apr 2019 18:05:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2611D1001DC8;
	Thu, 18 Apr 2019 18:05:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:55 +0200
Message-Id: <20190418180057.3593-28-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Apr 2019 18:05:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-QEMU-4.1 v5 27/29] hw/arm: Express
 dependencies of the xlnx-versal-virt machine with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdrZ6BMxstE5

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 32e4cc50e5..22be1e1231 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -291,6 +291,10 @@ config XLNX_ZYNQMP_ARM
=20
 config XLNX_VERSAL
     bool
+    select ARM_GIC
+    select PL011
+    select CADENCE
+    select VIRTIO_MMIO
=20
 config FSL_IMX25
     bool
--=20
2.21.0

