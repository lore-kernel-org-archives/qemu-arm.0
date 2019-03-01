Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp770312wrx;
        Fri, 1 Mar 2019 07:47:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmxv/paPxgcr4QX2jSxipCGEbJZHB+g07CWt9GQaw07gDxfmaDL5/+DBKKvBTVF6O21I/E
X-Received: by 2002:a25:b790:: with SMTP id n16mr4649155ybh.110.1551455249104;
        Fri, 01 Mar 2019 07:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551455249; cv=none;
        d=google.com; s=arc-20160816;
        b=I8lUGShxDriydSBO/9bIYMKVaAnCfEiwJ/wm4tk5uaXwE3YBGvmj62udqvLiGeezaI
         bi/I0U1dejgkDCBe468+h9p+ALgOAPmfC850CZt6bjoMiCkS6xj+DZiweVwQ5QWOfNzV
         BlhA32HyFtPTx1elGLg2Y3TcVVf1h1lg6TtYps9P3kiq6rYZyPC13oC4iNupA3vaY3Nt
         mMiQN3h9/4R/oUIVBXWU2Mkg5W3zk+lz/4Qpz01Wn2M1HJEPw6zvlwGASyGs8zqhv0dC
         S+vZA1Fqeapg/HKm9kC21INOhD0Oc+tF04yAGzZWi7MGqslXRuUsd+lw8RYWIzHagAOK
         5XQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=pCzdcMBvxX9n2qcya5YTgzt5yO/4UEG88ylUWiq6te4=;
        b=JAp83PdfvdQN21ImfwpSAAwBX8/dIxrhchTKv5XucM+qWsZm1gd3vqRUZgl81EDTAd
         f4fasLc5AsMJs91GLNZLqPKlhTo971qSKulfhzwTVrbmYla2o9J+crDX+76tYCgZN/YK
         xHI3M2FHQcV8/ztTwVY7oulDzylnEv/l+b0fJ+/6XBPJWIUIW9toNPBJdoIkH860MW6c
         PYdVCRQ/8tE+HglHCnuGLWkDnIcrn2VJK4wAmw+6Sp3xC6x7XzWeYKkVeDmFrJ72Y8l/
         HFKUxcStgmE9KTIOlL8VFj3o83xMDjqGSTIZj5A3F2qrcOPCANr3wQLM+qozflerZt+r
         LahQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u145si13129409ywe.244.2019.03.01.07.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 07:47:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkNk-0005OD-GU
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 10:47:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkN4-0004vs-H0
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:46:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkIt-0007eW-Ps
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:42:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzkIt-0007dj-Ja; Fri, 01 Mar 2019 10:42:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D27C7CF486;
	Fri,  1 Mar 2019 15:42:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0591C60BE0;
	Fri,  1 Mar 2019 15:42:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 Mar 2019 16:42:16 +0100
Message-Id: <1551454936-205218-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Mar 2019 15:42:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] numa: deprecate implict memory distribution
 between nodes
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
X-TUID: DKwXMxcdunX7

Implict RAM distribution between nodes has exactly the same issues as:
  "numa: deprecate 'mem' parameter of '-numa node' option"
only with QEMU being the user that's 'adding' 'mem' parameter.

Depricate it, to get it out of the way so that we could switch to
consistent guest RAM allocation using memory backends and possibly
memory devices later on top of that.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 numa.c               | 3 +++
 qemu-deprecated.texi | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/numa.c b/numa.c
index 2205773..6d45a1f 100644
--- a/numa.c
+++ b/numa.c
@@ -409,6 +409,9 @@ void numa_complete_configuration(MachineState *ms)
         if (i == nb_numa_nodes) {
             assert(mc->numa_auto_assign_ram);
             mc->numa_auto_assign_ram(mc, numa_info, nb_numa_nodes, ram_size);
+            warn_report("Default splitting of RAM between nodes is deprecated,"
+                        " Use '-numa node,memdev' to explictly define RAM"
+                        " allocation per node");
         }
 
         numa_total = 0;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 73f99d4..09bec7d 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -74,6 +74,13 @@ parameter @option{mem} to achieve the same fake NUMA effect or a properly
 configured @var{memory-backend-file} backend to actually benefit from NUMA
 configuration.
 
+@subsection -numa node (without memory specified) (since 4.0)
+
+Splitting RAM by default between NUMA nodes has the same issues as @option{mem}
+parameter described above with a difference that role of the user plays QEMU
+using generic splitting rule or a board specific one. Use @option{memdev} with
+@var{memory-backend-ram} backend to define mapping explictly instead.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-- 
2.7.4

