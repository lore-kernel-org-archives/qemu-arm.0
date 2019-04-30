Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4418636wrh;
        Tue, 30 Apr 2019 00:41:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFG2qm7kiTh6HRoNMeC+XoSLcuvsPDFUAhmOhqDe3EzR4l0rvVBY88MKIVTA5ZQ8w+QfbF
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr2036467wmb.85.1556610062827;
        Tue, 30 Apr 2019 00:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556610062; cv=none;
        d=google.com; s=arc-20160816;
        b=vclmI7Z9T+uOzG3se6xPdekj0OXA3a7v5JI+1877mQVr8DJHNL9bSwK35cgPnjOm5t
         DgsHKC70e5xsK2j9J3RcNSLRqHklQm5+btzMoRoHSs75PVGw5c43TLLHlUBkrcIUWeTn
         carf0KizewIOQsblOJGjBRLMvdUUtsUOQT85EK23rguU9qFtWoGh/cuFJoT7QPQMqhBr
         CZ4cwMqlelU2DFcIzQ2oZr0Cp6xej11EmGkN9rrJARdDV7yaNw99cJGi/WgUalMdO/ZO
         fMHIisbCrsCZREAYsM7DyOy1LICgXbXx17LGcaqKLWNwN2QqiZF19njRJp3T+fj7Nm7R
         r41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jHP+ljXJEJNSfLdYybiCO0q8wAY/N0xKAICySc0IYmw=;
        b=NPNCeTD/lj/D4e8GpAqg1hsPbd2Ghr/QzEw5S++h2KIGzu5k3FZx+sDpiVNkQHAz1x
         V+6FDNIVQcUC6YrA46e3U+NJnbfQhRoc6dvlM8t3mqnPM1CMa8OwKMhftL9Sf/Go8Qqf
         hvB0nxsyHeP8shR/NJu4smJtqSm+K+qpDKEtKvris89ZpJ1wR/55VC0cTjDQlqjX7J5n
         LHety5AihXw5UyJDyypSHTjPmtaIOiDnV1MbNLcjwDXCY1V+bnTaK4vcm7RwAAc61VEE
         liQrRWQoKBPk2W3f/uC6bTly1G+cBnvVt8lq5y+NJvSvmbwR82rRu1jNk6xwCIiiYiFX
         IhVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si1217426wrr.42.2019.04.30.00.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNNt-0003KZ-Ui
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:41:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN3H-0001bN-Fl
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN3F-0006Mn-Jk
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:19:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10216)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN3D-0006Ip-N2; Tue, 30 Apr 2019 03:19:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B064AE6A72;
	Tue, 30 Apr 2019 07:19:37 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D952E100200A;
	Tue, 30 Apr 2019 07:19:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:14:04 +0200
Message-Id: <20190430071405.16714-30-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 30 Apr 2019 07:19:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 29/30] hw/arm: Express dependencies of the
 musca machines with Kconfig
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
X-TUID: wGZ8ES8zPf3/

Dependencies have been determined with trial-and-error and by
looking at the musca.c source file.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9609caef87..af8cffde9c 100644
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
@@ -427,6 +433,3 @@ config ARMSSE_CPUID
=20
 config ARMSSE_MHU
     bool
-
-config MUSCA
-    bool
--=20
2.21.0

