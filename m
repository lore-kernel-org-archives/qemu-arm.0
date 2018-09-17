Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3654853wrd;
        Mon, 17 Sep 2018 01:41:41 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda4CIrNmXqUnqYHjBaV07uMTO7OhKbb35qEeG5blwqnIgT2SBf6XFLG2/BhZWTZBf5eo1K/
X-Received: by 2002:aed:2385:: with SMTP id j5-v6mr17049387qtc.205.1537173701702;
        Mon, 17 Sep 2018 01:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173701; cv=none;
        d=google.com; s=arc-20160816;
        b=XrdXhANhFPD47fAKXQmuD6p9dJvvbLXEixafVMW6ehmGscz5Im0Qfebma5WIKpZLDB
         jrozWGnTpYkW0C3TDVadci9sSSH8V5a7Z7VEmKEiuKYk5qPjQQknM+R2Slcm3by65tkI
         Cd8OmLaHIALDZou6aVAPv+1gXaRZrMDQaK3ozEEcpKr1FmlY2/pQztqUNLKcomRZFihE
         SepT8GGKrGVw8GlDRb4tf1osybotLMt32MAhFRDCozMCCQzPBBqYQES5jFElmY05Irqx
         Zsc1QdiDeigev0B1uYEp8TZoPjvOXTtPOeOHR7H3Q+xBrsYrstvMaqx7I6kuBhAIxjjw
         ee5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=/72p14Lt0YYZoO0m2g13Kw4ImS5yg0a0umqTrSqbycY=;
        b=ZV//CZA+//sURxmb5FgsbccB25o5+zXUAZrjOIoPsG1af8jbgT52c8hhwSCYv86M3u
         ltLmommEnPG29z5qwJq8ha9rqeYS90KNUyRUx5zOBmE4rencqZhRXwDbjkp21C/JWkLx
         T99egFdAVZqsx6MtUW3QUpe/heKLUwHvTd1JMnFjPBPxBcSOkChzpp6DBHI4cUZhRJLd
         pMAaI3UclWxrklziPA+Avorot/3YOiPgOpI7BbsCU8FE3xsj9gKNwGiwG8/N+WW6NhOK
         SpcHTL9SqB/gpT0LoB1BiMEs3u4Ss2Asi7ejInMP9As98m/Mptyq5/GSTRQNJL89GWpM
         BnCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=R9XNEVBZ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qzUPl1XI;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=SHxOE7MZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q65-v6si8609216qkd.337.2018.09.17.01.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=R9XNEVBZ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qzUPl1XI;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=SHxOE7MZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6D-0006Ad-7J
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:41:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069H-RN
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5p-0005Us-Jc
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5o-0005TK-Vj; Mon, 17 Sep 2018 04:41:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0BF4E521AB4;
	Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173670;
	bh=AnN1kydemsdQzi0SUDrl/dMsn9qI3l7wu7DbVb6OtSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R9XNEVBZ7JcpgF64SEUTZdM2bInyKKrtiOaDLrkdhT/gRGQ/ReU4kp0rTns31EcKx
	cSp47tQyYcdQX3QVNcl2b+M/Sip5yEWCPzbBYSn0rzWlpTJWDAiJTJJ0mNcZEnGVz8
	QI5LCopDIFtxFrJGYozYQwRtGG7o1+Sva3nBzczs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qzUPl1XI;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=SHxOE7MZ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IJjXSQbtzCO; Mon, 17 Sep 2018 10:41:09 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 00647443480; Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173669;
	bh=AnN1kydemsdQzi0SUDrl/dMsn9qI3l7wu7DbVb6OtSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qzUPl1XIxbycVvBLcuzwH1EViyeO0cZgZr4GcN3ijmamggwf6c3zRygFlxqzF93oR
	sunXuvry41ZClLVQCo986WGJGGSeS+cvcUuj4qvli/qvcZyyQWPt/WDrHalw47iszB
	/+Cn0xAGrGeJ8rG/sj+5j65y5BRDZlu7J5exEioI=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 64C77443483;
	Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173668;
	bh=AnN1kydemsdQzi0SUDrl/dMsn9qI3l7wu7DbVb6OtSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SHxOE7MZcSfH0eQZ6qdFEEcFhsYgFrWWGccl3OIiZpqjDTVo7k208YPUi9bB2MXKn
	hmZJWe+beJDFybCDewoOT3E2j9vBJneOC2d+CgF9A0u/FWOprWa+cZQmPkCML7ghFd
	ne0lb38SE8yPqqu0VpiqBzy/28LnFZ7yQEWzkgjM=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:09 +0200
Message-Id: <20180917084016.12750-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 03/10] qdev-monitor: print the device's clock
 with info qtree
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: beca9qmKjf6I

From: Damien Hedde <damien.hedde@greensocs.com>

This prints the clocks attached to a DeviceState when using "info qtree" monitor
command. For every clock, it displays the direction, the name and if the
clock is forwarded.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 qdev-monitor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index 61e0300991..c6f07a49d2 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -682,6 +682,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
     ObjectClass *class;
     BusState *child;
     NamedGPIOList *ngl;
+    NamedClockList *clk;
 
     qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(dev)),
                 dev->id ? dev->id : "");
@@ -696,6 +697,11 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
                         ngl->num_out);
         }
     }
+    QLIST_FOREACH(clk, &dev->clocks, node) {
+        qdev_printf("clock-%s \"%s\"%s\n",
+                clk->out ? "out" : "in", clk->name,
+                clk->forward ? " FW" : "");
+    }
     class = object_get_class(OBJECT(dev));
     do {
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props, indent);
-- 
2.18.0

