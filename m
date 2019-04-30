Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4412250wrh;
        Tue, 30 Apr 2019 00:31:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwb8B+BEbLm3HKqL1wLjfM0/r9QGPM/3JjZ6QUCFMcfXjDht7CxYC2tgOhFOJj3KjuioREK
X-Received: by 2002:a1c:80c4:: with SMTP id b187mr2168618wmd.7.1556609497002;
        Tue, 30 Apr 2019 00:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609496; cv=none;
        d=google.com; s=arc-20160816;
        b=m1Ej3+vv0nv4Dtw80CizQKXBBs9PHlHwZt7DRwu82z45Kf4MORtP5zAxdtuFol/5Jx
         +GkkoNtlF5AmRc4b30Iibcn4ImBRRdW2LIJB4U1yv+SNOFmRiQaGLSDzgbYFR07Jfhbp
         aTp7NXfr6oUsGuCM69bGJuhx4fJ+Mw7i3G9wBiCOHkkBgyT/9Xi+O3hS4DP4YlVmKCqI
         jTviPAYQ+a26XMgbMQAaMh2LUeVliAEKb0GqY/xi8ndr3OC/yNy873OfhUt2/1WxR845
         0Ak6KDGEjLlGf/sSamfW72/bDVKz4TVDBEjVH0RFRfu6PTVuhhLz1SqmpDAI2eWJoaMY
         qdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=A4Ji2jobzRSF5eoAJxtNT9uy7Q7jDmWZxpg9YHBodmY=;
        b=hWoxr5umDIF6n/+8Z//fj84UzH21S4lai3HeuhnSPAb2tuwS0ezaX4ZA1V7n1NiUIk
         jvbIUO0krUv1zkY37OrQbQTVjUrIF43Xpl4h6auJy14UBQEFi7LlnCt0vNk0lyE1TNVb
         ycmgDQOiNrfFQCcg7OnDOMSuBRoZgzyg/Chu7q3SAvAs9O8BwmZ9zdFrFZDkYcqFpbiR
         zSxIlzVMlap8z3w/9IiyUD00UYKgk5ARUFdLv5bdYWdbH+pPToIlWAONZYddDR+GeoVP
         OR0H2ks5w0rENQjP7EiLVfgrxPGFFxuPbC35XICZZSmwYCDG/zZuk6Ck5dLBJpcODnLo
         +zpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si1037059wmj.188.2019.04.30.00.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNEm-0003pj-0c
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:31:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN37-0001T9-6N
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:19:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN36-0006E0-AB
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:19:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN35-00069i-At; Tue, 30 Apr 2019 03:19:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 876A33082E56;
	Tue, 30 Apr 2019 07:19:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8847F1000049;
	Tue, 30 Apr 2019 07:19:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:14:03 +0200
Message-Id: <20190430071405.16714-29-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 30 Apr 2019 07:19:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 28/30] hw/arm: Express dependencies of the
 xlnx-versal-virt machine with Kconfig
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
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Q4RU9O6Ak1d

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eff61efab9..9609caef87 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -293,6 +293,10 @@ config XLNX_ZYNQMP_ARM
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

