Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp946668wrx;
        Thu, 18 Apr 2019 11:28:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNCFe0ooDWxqujM4TnhZT3xrL+sBZCNyF1tf0oQevU5dVhiDEZgYrrhkSCStnEqDiKUfZb
X-Received: by 2002:adf:db8a:: with SMTP id u10mr2695088wri.82.1555612092078;
        Thu, 18 Apr 2019 11:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555612092; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqvZXKYL5hCu2v2Lvf5tt67IIiS+sbvThVwMTO7udJcnzdaaeJEkgutarkOvBx59nN
         rJOQTUmFRNced1/Fqz7Pam3m3pBI7yeWGeQcxJLrKYvYHUyMZKH0Awceqiy+pUt9E2NK
         CFcJSOMCEhzxxZT6wZye1KvRyeNxLb5q/Ofo1gTgPQHRpWzY1o4HF79JMyc64CNYcx9P
         B0prRYVQ8Jpd4I83M0zPyMnug0Isuz7DReNuelJ7aFrlMmcu3EjDddNaWSgGxQJCDwap
         +zyw2+nHLNV/aQOnoaY6bjIB4VDTlouIpi/QymJ2D1Ncorcj0hesxamSIjpzJfCF38Pj
         EmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DH0JJfu5f9UMSb/o24tK9p6TsbeCsvH37ltqZIwNfD8=;
        b=ZSkXvB9vscGPbIuj4/KDRxRe9EnRKiwsXPMsf/Vidbct3Und3Hy6eLI33pyH+1Lxo3
         u04Z/uUu1vr5WRZCx23fNzc5F5eEqR1H/KbnHgxc4ii28sZW9/a40tFrg7rWe2MhxGrF
         HAdVG4SfRoVFO7UB4btUaMhmZLWdYy/+SpXiVKSiiimxTmQL4zgtiSxc/gDRmWBkoJ3J
         1fZggPIYhBqwSs2v2wWpiqtkN4rxUKguw6i/HdSoMkCpBNPsBqMtf4GRQBhA49Jnpx7P
         Rc2tvpZPrp3EaDCHj3oD3nfN5ywgmBefGtROfu+KpSumCk0GjEA/fp8DlLrOgn4kbaI0
         NSNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si2090525wma.75.2019.04.18.11.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBlb-0007iQ-57
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:28:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBQ7-000632-1g
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:06:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBQ3-0003z6-GE
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:05:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12915)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBQ3-0003ya-4L; Thu, 18 Apr 2019 14:05:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08AAB3078DB7;
	Thu, 18 Apr 2019 18:05:54 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBEFC1001DC8;
	Thu, 18 Apr 2019 18:05:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:56 +0200
Message-Id: <20190418180057.3593-29-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 18 Apr 2019 18:05:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 28/29] hw/arm: Express
 dependencies of the musca machines with Kconfig
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
X-TUID: o/9jdOx9I21L

Dependencies have been determined with trial-and-error and by
looking at the musca.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 22be1e1231..eca8387050 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -75,6 +75,12 @@ config MAINSTONE
     select PFLASH_CFI01
     select SMC91C111
=20
+config MUSCA
+    bool
+    select ARMSSE
+    select PL011
+    select PL031
+
 config MUSICPAL
     bool
     select BITBANG_I2C
@@ -423,6 +429,3 @@ config ARMSSE_CPUID
=20
 config ARMSSE_MHU
     bool
-
-config MUSCA
-    bool
--=20
2.21.0

