Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp946499wrx;
        Thu, 18 Apr 2019 11:28:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGUymWMlVpxlrMwgYRX8Ia2EUhVg7/7eLdYO35ahfo2oL+jwiqCq1mRVxjqlXN7yLJxzZt
X-Received: by 2002:adf:f48f:: with SMTP id l15mr21679218wro.248.1555612080542;
        Thu, 18 Apr 2019 11:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555612080; cv=none;
        d=google.com; s=arc-20160816;
        b=Cx3ezYdWJ9GQDsCZQ2D/8OacF3UswsPKq8y5JeZVVB3A4NyA+y6uofezafROYegqyj
         vrsacjqMh8wBenV6SFgc12MKS6fpXTSJMQfLYheM1dF5pKiGzSD05LgRyryx9SEpwBsQ
         BpggYJtngrfXTb/3u8OLINQZU7L5nIUN1MH5qn+Gmq9F6t4/xqytba4nTAjhZq7IWaW3
         bTNkIPzhnIzQqkWLk4gQBdvwucGaONk5lagG2DyRzcQWgIzzCY1OyYBJgJJBmFX6emrg
         xfWNAGpW67szWkhg4apUIoMrl1ZD760KCKrlSoBdrcJWasZj8rIiryN64Wq3xDdSy2wF
         IR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=p6A056RmxyCUpVTy298YFHn3D/E04V2BiINMprErA3I=;
        b=P//ZT+A8b1TyPgFLKPP2XBAePT992i/QcJldGclVYL/uf6MskjD00a+f7/SRedCb/4
         Bi6etkIMibOWje4X78LeJ7MQtVwFk2iA9HvIp5Gv9L495HnnDDV8rnjafPTwRCYXPJLb
         7kdptzsw6NpzAyMGd1HCbSYc8P9+++yC0/Z0ThJTy6EhLC+Qp2PA1xc4WU1hUyOCAlID
         wZ/sEPim/Trc01GOB9Y727tW1c3STw6aGLNfpPYZzkn6P5sAfcop7F0MoMz/WyoYcbD6
         9PaAfHMTOtNo2FjRp7z/Bm1iJDg244gAeByJB7W6X46GOol3sfYsWUk697cQeph4V+Jb
         Qing==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a194si2048873wmd.192.2019.04.18.11.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBlP-0007Z4-Gj
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:27:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBQG-00068i-1U
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBQA-00042E-Hl
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:06:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBQ8-00040n-Ct; Thu, 18 Apr 2019 14:06:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AE5364368;
	Thu, 18 Apr 2019 18:05:59 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5195B1001E9E;
	Thu, 18 Apr 2019 18:05:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:57 +0200
Message-Id: <20190418180057.3593-30-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Apr 2019 18:05:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 29/29] hw/arm: Remove
 hard-enablement of the remaining PCI devices
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJ+66BnhsmJu

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 233937f394..f23ecfd5c5 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -36,14 +36,6 @@ CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
 CONFIG_MICROBIT=3Dy
-
-CONFIG_VGA=3Dy
-
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
-
-CONFIG_PCIE_PORT=3Dy
-CONFIG_XIO3130=3Dy
-CONFIG_IOH3420=3Dy
-CONFIG_I82801B11=3Dy
--=20
2.21.0

