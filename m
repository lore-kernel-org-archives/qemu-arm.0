Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp772974wrx;
        Fri, 1 Mar 2019 07:50:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzhUIh63PN5vBYOOc8I4BHgKMMz8oyvYeHnktS4rqdajq4iCos6IjZDXLmdJkCoV9kvYbz
X-Received: by 2002:a0d:e850:: with SMTP id r77mr4187097ywe.291.1551455415884;
        Fri, 01 Mar 2019 07:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551455415; cv=none;
        d=google.com; s=arc-20160816;
        b=LTEkeFxdgEHFMuPP3UnW3KnKgEX9Dt+Smvx1C1dO6D8ykh6lSmhgomKvMkYrqBCT38
         mGtZuts5+RjjJlqlog7ydIn7cyW7nWVDaLlySGAE2mrWhVkYp6/MhuRoqA2yMoxctMKN
         omwhN9xldktO5E9SI6JBD5F/fb8dlCB6jkGjN0XiKHy7bmuyGCI2SJpNTAdcmMgSwkd6
         b2VqZ5orNnsSPStOdTd4PamDVkfSfevc2w2meB3JvjX1dQJHogHuchRFF6m5YjSCQrJM
         HOfmwK0Zv8qqHhLU9U0xOo9AYMjYLDzJpH/Ayf/xnTmPHkX2h5RGXMHozYm8i7kLVxXO
         GDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=isd3hk6Lvxyt86bjHFNOa1KOhf2/X9CcdXWIi2Q1wg0=;
        b=xGCHc0+NPFiauAP4acXq5VDApxkP+MhvG3ah/Clrzjm37jLlk1DP3FNhxm0F56V+gh
         gTwsa2AhhGEqg5MfwvON15RkfmFldZgRIcJBFa67wNz2l7Tww9gADF01OKjLZZFKZsfu
         jaLqR/ukyPHRxdCUtswIh+Z8A6scOMIyA/BFbfivrSDaff2tMAAUo15LiYYmuKlqExR5
         f2hLnGUby7aBCcU/p+s+lwcnbK4h1I9hywzZBrF6p9RGIFw8cXCGMGan8cUvYwLrkLqF
         jwx7I8/SuwltGMs5a2vD2YTxQFTJnm6XIk4de7CF9q0Ierdl6KFC3eZQf05sdnQrDpLp
         nigw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si10886428ywb.467.2019.03.01.07.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 07:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkQR-0007d4-9F
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 10:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkN7-0004uY-2f
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkIr-0007bx-Lx
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:42:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzkIr-0007b1-G5; Fri, 01 Mar 2019 10:42:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF5A4A5DA7;
	Fri,  1 Mar 2019 15:42:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DDEA60C66;
	Fri,  1 Mar 2019 15:42:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 Mar 2019 16:42:15 +0100
Message-Id: <1551454936-205218-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 01 Mar 2019 15:42:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] numa: deprecate 'mem' parameter of '-numa
 node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NNy6OrviAPe9

The parameter allows to configure fake NUMA topology where guest
VM simulates NUMA topology but not actually getting a performance
benefits from it. The same or better results could be achieved
using 'memdev' parameter. In light of that any VM that uses NUMA
to get its benefits should use 'memdev' and to allow transition
initial RAM to device based model, deprecate 'mem' parameter as
its ad-hoc partitioning of initial RAM MemoryRegion can't be
translated to memdev based backend transparently to users and in
compatible manner (migration wise).

That will also allow to clean up a bit our numa code, leaving only
'memdev' impl. in place and several boards that use node_mem
to generate FDT/ACPI description from it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 numa.c               |  2 ++
 qemu-deprecated.texi | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/numa.c b/numa.c
index 3875e1e..2205773 100644
--- a/numa.c
+++ b/numa.c
@@ -121,6 +121,8 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
 
     if (node->has_mem) {
         numa_info[nodenr].node_mem = node->mem;
+        warn_report("Parameter -numa node,mem is deprecated,"
+                    " use -numa node,memdev instead");
     }
     if (node->has_memdev) {
         Object *o;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 45c5795..73f99d4 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -60,6 +60,20 @@ Support for invalid topologies will be removed, the user must ensure
 topologies described with -smp include all possible cpus, i.e.
   @math{@var{sockets} * @var{cores} * @var{threads} = @var{maxcpus}}.
 
+@subsection -numa node,mem=@var{size} (since 4.0)
+
+The parameter @option{mem} of @option{-numa node} is used to assign a part of
+guest RAM to a NUMA node. But when using it, it's impossible to manage specified
+size on the host side (like bind it to a host node, setting bind policy, ...),
+so guest end-ups with the fake NUMA configuration with suboptiomal performance.
+However since 2014 there is an alternative way to assign RAM to a NUMA node
+using parameter @option{memdev}, which does the same as @option{mem} and has
+an ability to actualy manage node RAM on the host side. Use parameter
+@option{memdev} with @var{memory-backend-ram} backend as an replacement for
+parameter @option{mem} to achieve the same fake NUMA effect or a properly
+configured @var{memory-backend-file} backend to actually benefit from NUMA
+configuration.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-- 
2.7.4

