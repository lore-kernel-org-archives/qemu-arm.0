Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3804393wrt;
        Fri, 19 Oct 2018 06:14:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63plfqw7aJPIDEbq9ujiBJYH/R6kZTgmbYNK/zQ2mL/jIMOmU0kIGOz2X0YwVvXRWCOQkJr
X-Received: by 2002:ac8:3397:: with SMTP id c23-v6mr32915965qtb.190.1539954872636;
        Fri, 19 Oct 2018 06:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539954872; cv=none;
        d=google.com; s=arc-20160816;
        b=HRiGJGSlVHkBv6V7Z1hKUjPfqIf6CzSfDdnNdX3vt7ZiqBLrP4ovHCSwAPrzB325Vs
         G2KLIrpa2b7+Y14YoCdGG0Xr08LyRH8I1G6kxYEhmn7n64pe8zTU253KFU7um7CnfnjT
         9pItljETLUlztSryJiQD2H6mR585NnuzCsYfQ7O+aqw4JwB8939CpmZpuutgkh3i8lRV
         PYsYkvRwWcVb1+o5km5VBAndZ74J8QaYsFsjam7lCHzvr65UG7eR3Q7RaY0A4yaijhxY
         x2mIxjgPmzmeShtZuTyN75tpN2E3FsLeQNUWcTi6mOqGGGGrQA/JrQBU4XyCgMIn/vAk
         4TCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=9ShRzrx3aq+MmOkAluMihAGnV+V6OFrIAbktN6X14/s=;
        b=RJ1+59/gPSGpW2NjdzNubwtu88il9sy2o0+rhT46s122jyZydnajI09tYxIK7KaGPJ
         3QhBu18RJwIPYXmBImwTD3BXTm00HhAFNDjkZdEkXJ0Wcx3L3PXINseflsupWAgAiv/a
         /ty8yDetBtUN4MGzo8AuzJ9b/bfyN5HHQRpZsznb2j9OVpIyemmmObdRHopTnK+e2TIx
         suzXuvoSB2st+MzY9alpHJS6u95QFDpKlzHgJ0tuYsy8NYWG+DzOgjUp3V9vm4ZL9Nof
         LunoYQQjbC5h5NlPb/vPU607kpgDBiwbbFGW60W0vTk+1cK/6FlukQNKByECVPEnTlFv
         YxDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si508963qti.99.2018.10.19.06.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDUbo-0007s3-2n
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:14:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbV-0007rO-87
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbU-0005lC-Hh
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gDUbU-0005kp-Bn; Fri, 19 Oct 2018 09:14:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E0587F7B2;
	Fri, 19 Oct 2018 13:14:11 +0000 (UTC)
Received: from thuth.com (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD1AB5DD6B;
	Fri, 19 Oct 2018 13:14:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:14:01 +0200
Message-Id: <1539954845-26716-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1539954845-26716-1-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 19 Oct 2018 13:14:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/5] configs: Add a CONFIG_OR_IRQ switch for the
 or-irq device
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u597cAgu1SZS

If the user only wants to compile targets that do not require the
"or-irq" device, we should also not compile or-irq.c. Add a proper
CONFIG_OR_IRQ switch to be able to choose this more flexibly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 1 +
 default-configs/ppc-softmmu.mak | 1 +
 hw/core/Makefile.objs           | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2420491..dc6a581 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -4,6 +4,7 @@ include pci.mak
 include usb.mak
 CONFIG_VGA=y
 CONFIG_NAND=y
+CONFIG_OR_IRQ=y
 CONFIG_ECC=y
 CONFIG_SERIAL=y
 CONFIG_SERIAL_ISA=y
diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
index 3181bbf..83235af 100644
--- a/default-configs/ppc-softmmu.mak
+++ b/default-configs/ppc-softmmu.mak
@@ -68,3 +68,4 @@ CONFIG_PC87312=y
 CONFIG_PCSPK=y
 CONFIG_IDE_ISA=y
 CONFIG_CS4231A=y
+CONFIG_OR_IRQ=y
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index b736ce2..29b5cfd 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) += loader.o
 common-obj-$(CONFIG_FITLOADER) += loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
 common-obj-$(CONFIG_SOFTMMU) += register.o
-common-obj-$(CONFIG_SOFTMMU) += or-irq.o
+common-obj-$(CONFIG_OR_IRQ) += or-irq.o
 common-obj-$(CONFIG_SOFTMMU) += split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) += generic-loader.o
-- 
1.8.3.1

