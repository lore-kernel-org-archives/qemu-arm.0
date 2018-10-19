Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3808495wrt;
        Fri, 19 Oct 2018 06:17:14 -0700 (PDT)
X-Google-Smtp-Source: ACcGV631/BAa3QS7JG5bhiiXlF1/PYO5QwWAOz5JXPQ9jw7kR6s2W0Vmo3ObImKMWijN62T2f3eN
X-Received: by 2002:aed:3305:: with SMTP id u5-v6mr33220691qtd.333.1539955034365;
        Fri, 19 Oct 2018 06:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539955034; cv=none;
        d=google.com; s=arc-20160816;
        b=j9jD0DNZHpbSLO1mr1SgUWFQjh5eaibjKJvvU5Hfm1RUVXASJ8aZbse2lgFBnmUb9k
         Lzaf8QrVKYO4TVZmCExkHk6w/WOt6IhhxCHdYWmwETNPlvHp5U8RK0qeMiQXpajsPbtY
         mGGSfBbODW6IN3E4BnEsvyT5c1EQugSDWhxaJ62h1LbdiR/1Xnnh0zNb93R6cGc0aUzl
         2e3qop8TJrl6P1+qRJ4g1kIv1spn1VsVN0X1dH1uoONfj9aK9AyavYfuRrV6cmV4lkso
         pqcaDvNgHmH/QpGGHLZ5pa24f6ccgcOGucrXVXjEPz1IPskKIcK+2PYBv4jyshdxAzgn
         H0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=bxRkAMu2s9ax1SX0x0UgRDQpBh+5ZjHfumPbkvUr7OY=;
        b=xYuHc/tauMNApI0Cmw0TrC/dJbbZnrCrHI2KRtlLQwz+KCSICGIYfqgPqi2j+5l0/B
         31u6Lmj3mOd0gk+Q0kkgn9UOX98rzrMJQlidZR1JJjcU5glOuHL0Tlm6G7weKPUL1kIz
         2ROZeZ/qnnxGlRVXCRuMbHlAo/QiDdm/ySrUZhR8wvXlY80mLxEZiq5k7QsVgM9dlOAS
         BwTFZRJCho0brtPxZQPxxt2K1X6mfRJM6oT0R6FLVRDWbIBAVnad64BoVP0K2y0ks5Ft
         2ey22uhvT3Y63pKjbN+RZDNzcvBZoxbPw0FRZPX+BCxoHy4tHQsntCtSz2d1eY8nLhrr
         jOVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si3051487qte.125.2018.10.19.06.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDUeP-0001bO-Qr
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:17:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbe-0007zW-06
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbc-0005xU-DL
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gDUbb-0005r1-ME; Fri, 19 Oct 2018 09:14:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87A7530E4E94;
	Fri, 19 Oct 2018 13:14:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D218B2A2CC;
	Fri, 19 Oct 2018 13:14:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:14:03 +0200
Message-Id: <1539954845-26716-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1539954845-26716-1-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 19 Oct 2018 13:14:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/5] configs: Add a CONFIG_REGISTER switch for
 the "register" device
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
X-TUID: 2q8Mi0eHLgY4

If the user only wants to compile targets that do not require the
"register" device, we should also not compile register.c. Add a proper
CONFIG_REGISTER switch to be able to choose this more flexibly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak        | 1 +
 default-configs/microblaze-softmmu.mak | 1 +
 hw/core/Makefile.objs                  | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index a3a3b66..6f2ffc1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -6,6 +6,7 @@ CONFIG_VGA=y
 CONFIG_NAND=y
 CONFIG_OR_IRQ=y
 CONFIG_SPLIT_IRQ=y
+CONFIG_REGISTER=y
 CONFIG_ECC=y
 CONFIG_SERIAL=y
 CONFIG_SERIAL_ISA=y
diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/microblaze-softmmu.mak
index 7fca8e4..b5c5659 100644
--- a/default-configs/microblaze-softmmu.mak
+++ b/default-configs/microblaze-softmmu.mak
@@ -10,3 +10,4 @@ CONFIG_XILINX_ETHLITE=y
 CONFIG_SSI=y
 CONFIG_SSI_M25P80=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_REGISTER=y
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index cafbe01..cb7c149 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
 common-obj-$(CONFIG_SOFTMMU) += loader.o
 common-obj-$(CONFIG_FITLOADER) += loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
-common-obj-$(CONFIG_SOFTMMU) += register.o
+common-obj-$(CONFIG_REGISTER) += register.o
 common-obj-$(CONFIG_OR_IRQ) += or-irq.o
 common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
-- 
1.8.3.1

