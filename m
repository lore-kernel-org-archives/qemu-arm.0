Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3809882wrt;
        Fri, 19 Oct 2018 06:18:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60/AdlUacleYVrccSbP74wFqv2PdElbacT9U8i2o/ZaeWMIJfxXUJ4gOWGGDsBZpqh4jCpW
X-Received: by 2002:ac8:18e9:: with SMTP id o38-v6mr33968724qtk.256.1539955089190;
        Fri, 19 Oct 2018 06:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539955089; cv=none;
        d=google.com; s=arc-20160816;
        b=PpHdiCBUjt6pKZRnpPoYEPGHTp8mmT4dQReoI78rVHmcw340GdcEj+EGEILjVnWaWk
         5yER0BvNbY1cD/HrK9TbmBW2E8Xowmx1IssXCwqsnen6a6z0ZTgkWNJgF6B2jkSnTyFs
         QMcr6LAM+Op1m4VjEbrsevtc3ezUxbhcgMHnpeZwyJ+E6sMLeQE3FCYFHPiLlzItfbm6
         9ofmh+lYp7VjF5Agp/BH6Cm+G++emZ0Tz+fmT2wNrNTHnlQsnulTiRRgst+s3ox2cL1y
         V6GTerAwsRhEofYqerJdt0seBCgKpRIcuHDeR3r6G9cRKn1w1f3XY9W2qowhw/ai3Bsl
         lr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=w0rydFxZnE41D6/mio08RQUW/6xQDl83AvZuiDYyjfU=;
        b=oNZJ0pQrs53y4fcKAX+N4goWUl5o1DeITC+vN1OXuupHaG1afaIpFvCvxz6QeONZMa
         /WhPzASL1NM8LVIA0SRqEZyO5F/CD36325czv9YkxnRXKvOWDxa105AtfO4sS/xlJ0OX
         tqOOONBj9U+MUdrUhfa9nvfOKcYQFQ83f/pWZlWBzh4l9Lh+4szyoGAA6UMXKZrY9xQ7
         5T013rK2T10Nq7aW8XaY0WwylpR/mwkT0h56uTxI3DRl9z/fZQNuaGRykw2CYElPvmQh
         qBXX+IDmc3yysH5vY4P3PbjdkVk2AuuPafjkxqjEX+yJRMP9/yOgOxBrSo0bBR4hFVC0
         0TJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y53si299015qvh.56.2018.10.19.06.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:18:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDUfI-000205-DJ
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbi-00084v-AL
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 09:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbh-00063E-Ju
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 09:14:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gDUbc-0005wY-Dx; Fri, 19 Oct 2018 09:14:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D63380E7E;
	Fri, 19 Oct 2018 13:14:19 +0000 (UTC)
Received: from thuth.com (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C93B72A2CC;
	Fri, 19 Oct 2018 13:14:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:14:05 +0200
Message-Id: <1539954845-26716-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1539954845-26716-1-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 19 Oct 2018 13:14:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 5/5] configs: Add a CONFIG_SMC37C669 switch for
 the "smc37c669-superio" device
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +68GQfszGRSP

This device is not user-creatable and currently only used for the
"alpha" target. So if the user does not want to compile alpha-softmmu,
we should also not compile this device. Add a proper config switch to
be able to compile this more flexibly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/alpha-softmmu.mak | 1 +
 hw/isa/Makefile.objs              | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
index bbe361f..eb58b40 100644
--- a/default-configs/alpha-softmmu.mak
+++ b/default-configs/alpha-softmmu.mak
@@ -19,3 +19,4 @@ CONFIG_IDE_CMD646=y
 CONFIG_I8259=y
 CONFIG_MC146818RTC=y
 CONFIG_ISA_TESTDEV=y
+CONFIG_SMC37C669=y
diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
index 83e06f6..9e106df 100644
--- a/hw/isa/Makefile.objs
+++ b/hw/isa/Makefile.objs
@@ -1,9 +1,10 @@
 common-obj-$(CONFIG_ISA_BUS) += isa-bus.o
-common-obj-$(CONFIG_ISA_BUS) += isa-superio.o smc37c669-superio.o
+common-obj-$(CONFIG_ISA_BUS) += isa-superio.o
 common-obj-$(CONFIG_APM) += apm.o
 common-obj-$(CONFIG_I82378) += i82378.o
 common-obj-$(CONFIG_PC87312) += pc87312.o
 common-obj-$(CONFIG_PIIX4) += piix4.o
 common-obj-$(CONFIG_VT82C686) += vt82c686.o
+common-obj-$(CONFIG_SMC37C669) += smc37c669-superio.o
 
 obj-$(CONFIG_LPC_ICH9) += lpc_ich9.o
-- 
1.8.3.1

