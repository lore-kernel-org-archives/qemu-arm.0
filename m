Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3805256wrt;
        Fri, 19 Oct 2018 06:15:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61NlBNWrr8lIRkKWY0NrwSXbGYU4jLMH53RDpQu+qhSbD5O4V5W/OSpDxOWJtdCRoOwLT0r
X-Received: by 2002:a0c:8a08:: with SMTP id 8mr25667883qvt.203.1539954909267;
        Fri, 19 Oct 2018 06:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539954909; cv=none;
        d=google.com; s=arc-20160816;
        b=dO4Jie12xHilma6oo7YXdDY5l5OabDGMxgPpsP2F2JZyj8QtEbKEVMcNJJ/JDX2MyR
         h+hFuwVQvFcokpuVqosYWAqpNNwSQp1F1RqQZsTYw15wq0/Y5CfOhDf7qmf9ZGARMI4r
         DsV9U3IDv/JKSXqX8qugm2n/qGW7eztcsOyVi6XzN9vPIu9BRWjl15ze8s83a9E+QPd0
         Gr/pr42AUW4sTKzWn01FkgaMw+BwYwC45tFkhwkIPAkdXU46e0amFrw06V6foq11sSQ2
         cWa1UNUtQms2mkxcADuRsM18FL2X0p/FnC95d1qLkW6dtMcihIX5Vdaj0ClVVdUjrV17
         TI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=SqBIiA0TZVU1gNNvAe1VVSJN7LWUsIr65YAL2xPUhis=;
        b=eHoWT15Js7dijM1OOmA9ek6OaUnQHbUQx0gFn/QtTGOF8PT/QXr5GOZwkJEmoaq4/p
         cXJ0FUeniouKdG4ynd/BbtE51zaNcOUrCTlAAYv8+aZ+IEU1PQYTgjBBt0Sy29rbZUIM
         a9di2ljTgk1h3ql5tBewR8vOGNfirCq167t9xv4Hq47LsAaZm+ASzbEq66SiBuu00STy
         bmVF0BPWspm47ZZgfVGZ3VusrQGJLXHm/0FfB80ssiywLjAaAune36p55rTlX7QQSX3L
         zoCa/10wXaWsqaS7gsq9EeQ10ywqYVvJniMvjUuEfGBQT8rphBzjkc2yl9b5N7hVvq4x
         hsig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17si9814249qvg.55.2018.10.19.06.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDUcO-0008FC-Hf
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbe-00080q-TE
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 09:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbe-0005yk-1d
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 09:14:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gDUbW-0005mM-8D; Fri, 19 Oct 2018 09:14:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 898FE307D913;
	Fri, 19 Oct 2018 13:14:13 +0000 (UTC)
Received: from thuth.com (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D72242A2CC;
	Fri, 19 Oct 2018 13:14:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:14:02 +0200
Message-Id: <1539954845-26716-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1539954845-26716-1-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 19 Oct 2018 13:14:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/5] configs: Add a CONFIG_SPLIT_IRQ switch for
 the split-irq device
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
X-TUID: KHZ5IDJKkXkY

If the user only wants to compile targets that do not require the
"split-irq" device, we should also not compile split-irq.c. Add a proper
CONFIG_SPLIT_IRQ switch to be able to choose this more flexibly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/core/Makefile.objs           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index dc6a581..a3a3b66 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -5,6 +5,7 @@ include usb.mak
 CONFIG_VGA=y
 CONFIG_NAND=y
 CONFIG_OR_IRQ=y
+CONFIG_SPLIT_IRQ=y
 CONFIG_ECC=y
 CONFIG_SERIAL=y
 CONFIG_SERIAL_ISA=y
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 29b5cfd..cafbe01 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -18,7 +18,7 @@ common-obj-$(CONFIG_FITLOADER) += loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
 common-obj-$(CONFIG_SOFTMMU) += register.o
 common-obj-$(CONFIG_OR_IRQ) += or-irq.o
-common-obj-$(CONFIG_SOFTMMU) += split-irq.o
+common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) += generic-loader.o
 
-- 
1.8.3.1

