Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3808040wrg;
        Tue, 14 May 2019 03:01:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcckaA1CvAZVtKQpYSmBut7GsoK2sOgVHqYfuzr988/PC6JiyhPp++DADmFxAMuM39AlG8
X-Received: by 2002:a50:abe5:: with SMTP id u92mr29741950edc.164.1557828118747;
        Tue, 14 May 2019 03:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828118; cv=none;
        d=google.com; s=arc-20160816;
        b=Od3ThgQuwFoQBK2NaZPUdOdAVLe0VwU84fxAQ5o+QJPz/NvSiJJsD8TdBRwuKojTnq
         MmJ3IgzF/c1CUkNbh/Kth1jkv3iNJPnxRto+JCs1TbX8ipEb4tkDwO/KiaDVw/84M+zP
         yjxa0ZXWShSzgcQmslzczkmgxCC0IU8WwMkGYixFIWJik+mp9Q3PiyHazHNoTptx68tK
         W0njvH3OPvi1tcfAaxzstH1xUT0Nf2sDMh7Y3879rhSeVHf1vLfMxprw7jsnveZZSwpO
         fmuR2Gl2bcQjwGdiwQlBA4I1NVD5aWO0ECP67SiaGlR6DvUsnnwTMdimUk+q9fzhQ+NL
         bkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DaaXMSxjdekLBIdSmBUC+/2fpnK1z8D7nNZfVC/Yhi0=;
        b=IqKYu6c4GFUwlP/fjheCZhO5Qe1p2oDtXJ2TQzsqoGI8sLYJtwCcyW44eSLMrk7B0H
         5/y6o7JJL4loGTCDjr5P1shkDkrkw+3k52VbgiqzKRGqAVGsX4oXc0GWSv3eGeplYItp
         9rlA23SXfr4cOFUtVLp/8lnnq/9H9NJK0MaFCPbY1vjzPH3IgEOtSV14ovu/z8dJqsGj
         6ynNLEIUsaTxwUM6kS7boeynscVY8b/vjvfZUJLo2JrKMiwRHwG/5Yyp9iQUKcZQ47tI
         dlRBma+Id3MzPsqUxJ1hBU00xKJ8GmOkG3fNnFD8WwIdbvzCHa1GvJpf9e7dPFCuxlk9
         lPTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e53si10340502ede.391.2019.05.14.03.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUFx-0007Zy-RY
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:01:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEf-0006Tz-QY
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEa-0003S7-WF
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQUEa-0003PZ-QA; Tue, 14 May 2019 06:00:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16A29883B8;
	Tue, 14 May 2019 10:00:32 +0000 (UTC)
Received: from thuth.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2790E5C207;
	Tue, 14 May 2019 10:00:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:00:16 +0200
Message-Id: <20190514100019.13263-2-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
References: <20190514100019.13263-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 May 2019 10:00:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/4] hw/core: Add a config switch for the
 "register" device
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKm/kyQ9T/4m

The "register" device is only used by certain machines. Let's add
a proper config switch for it so that it only gets compiled when we
really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 hw/dma/Kconfig        | 1 +
 hw/timer/Kconfig      | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index c2a1ae8122..d11920fcb3 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -9,3 +9,6 @@ config FITLOADER
=20
 config PLATFORM_BUS
     bool
+
+config REGISTER
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index a799c83815..d493a051ee 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D machine.o
 common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
 common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
-common-obj-$(CONFIG_SOFTMMU) +=3D register.o
+common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_SOFTMMU) +=3D or-irq.o
 common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 751dec5426..5c61b67bc0 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -16,6 +16,7 @@ config I8257
=20
 config ZYNQ_DEVCFG
     bool
+    select REGISTER
=20
 config STP2000
     bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 51921eb63f..f575481210 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -36,6 +36,7 @@ config TWL92230
=20
 config XLNX_ZYNQMP
     bool
+    select REGISTER
=20
 config ALTERA_TIMER
     bool
--=20
2.21.0

