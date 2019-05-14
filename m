Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3808459wrg;
        Tue, 14 May 2019 03:02:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyp25FdjuNX55DZsqinGFZwjvfxXcbFs8/cP23FpN43P6kXW6NariSAGut2I8irkjqMVV6Y
X-Received: by 2002:a17:906:5217:: with SMTP id g23mr22102496ejm.9.1557828143464;
        Tue, 14 May 2019 03:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828143; cv=none;
        d=google.com; s=arc-20160816;
        b=lXZ4h1a7+ftcMNQw2tSGLcpxaEUVlMhMnvrBElo6FQrd4/P2Y4HpT4xfHkh4OoHKVk
         aXtkoCVcVdBV/YH67buIO7LktdXNRCdAG+2VqfbB5jHQi88MNKtdhWHxYu2bq1EA/ika
         GW0+g/qbyWoHzFq/im3SnmZd+5xy/l9wU6A9zFcgCvJh2xXKnfbv3rZIiYNsBbSgg9qs
         80Z+xmzcetZUSQwZ0u40MtpDg5N4ZPEfzPP/6hX/BHm1hQJUc65X7VaTm1naKOXlNzsn
         wssCe4JeN491gQDvyeqhgZX6ixIY9SdN1uhKmUq5kqu5aZ4Ksv3YsksP7ksTHV0WvXj8
         7/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2dSz2LfIlplSon7LNC8+vnAiH43v9txFNtvH9v50gVw=;
        b=Ej1jB27vncHAB6xmLqLgffTARPTjeTJeI0BsqNA2FWQjbfjre4NTHM5Bz/zpRnE917
         jnBrrEqounD0z40vbOY+NhyMJaUsv/Zh4okg3Vz2SNZ+l/x2wywgKiyjcC5ngPxGnJc5
         /bLBCEj1pVnYfM1bz7/4AY2mU744aIoRHRZTMpXtEQ/dWY9RTLr5oEUO9h09pGFoT1Ko
         RBAHGzfkA6HnjDed2k8ikzHTxahv4B6AQW9eAchL2EVtMHjcebFuQ3OFw3WCdoILPfN3
         EPJs/TXmYM25aU7b7LHXAy/bYtqbvIhL68sPAyTN/o0YXCh+w7ncPHr3j7jIUZ/trqIf
         FzCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si3792095ejj.37.2019.05.14.03.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUGM-0007rC-Gx
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:02:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEp-0006b6-6p
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEk-0003ty-3F
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQUEj-0003sa-SW; Tue, 14 May 2019 06:00:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BF0889C3A;
	Tue, 14 May 2019 10:00:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 621545C54A;
	Tue, 14 May 2019 10:00:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:00:18 +0200
Message-Id: <20190514100019.13263-4-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
References: <20190514100019.13263-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 10:00:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/4] hw/core: Add a config switch for the
 "split-irq" device
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
X-TUID: soETqNdPQppU

The "split-irq" device is currently only used by machines that use
CONFIG_ARMSSE. Let's add a proper CONFIG_SPLIT_IRQ switch for this
so that it only gets compiled when we really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 1 +
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0bb3bbe9d3..ac1e94f63a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -426,6 +426,7 @@ config ARMSSE
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
     select OR_IRQ
+    select SPLIT_IRQ
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index 984143456a..fffb3d62b2 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -15,3 +15,6 @@ config PLATFORM_BUS
=20
 config REGISTER
     bool
+
+config SPLIT_IRQ
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index dd2c2ca812..d8c908da14 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -18,7 +18,7 @@ common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
 common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_OR_IRQ) +=3D or-irq.o
-common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
+common-obj-$(CONFIG_SPLIT_IRQ) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) +=3D generic-loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
--=20
2.21.0

