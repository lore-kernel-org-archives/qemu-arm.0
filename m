Received: by 10.223.172.38 with SMTP id v35csp5601946wrc;
        Mon, 11 Sep 2017 07:21:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDBudZTp5v/0znRxo8yroXEASUMxgY0L6VJb/DKIJpgNnjBlRq3DvZAKMqwCNL1myOjk6TB
X-Received: by 10.55.99.88 with SMTP id x85mr14843143qkb.258.1505139690630;
        Mon, 11 Sep 2017 07:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505139690; cv=none;
        d=google.com; s=arc-20160816;
        b=Og6a7JThTjEz1Y8vFiDVXICV8g1MywiSznQJ/bIqZjKzamHKoo0weOgrU9SbnlaMkF
         H7Upy80HgA+2NnYhPxjle5clB2lSRdFYvCPcNZfB+7Y6NqJrRqrM42LaA47iywtavIAG
         rxzDz2xgnVJUmnA+NTSoeblknVu0FVk5mf42FpqMKOs6IGfxVGio4SekqRejc8ayCmep
         WAoDuM2Dc0mVKZujEz4F6UT4WUyZatY7Waf5dK0ZMcKcpyDkLInK3oXc4gl9GQ48SrHs
         +T9UnUPt+ZlqV1YhEwW0ULGsj2aBFzjwZTR51XYpbfHMcYMa5JF3ktTsw0gtXVwcPnv7
         QZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=5GvsCrc73N3xNs8ZMsk6k4OUGBDuiLZRumd1NiKD0Ys=;
        b=bm9Y1A1Fz7UuGRhcHxEq+pnx29PtdWej9GD7kPNa+4CSGI3m/8mHJf8wxGTm2FyC8I
         jav93V5+QxcQ4qAuSqE7rhEXvw9e/6zS1NmzTZugLcvO1ZZiBNlmneJhGxF7U4r8uqUb
         tC/AOQLbRjujymNrw0p/dZ84LNY+6mbsmViw2v5aDeD0E2mkeBy4bSf0KFBMwB22T4Nj
         qelpO2pBCIBGVBwbULlU77AH3irbB8ZHTi4jC39piA+AHXg9miNx5ZhsmxVa0IgJz6PD
         XvYDun7D9mefG7Md+pq+tOm4zuRRsdQgtue2RwUAP+7WMADFxeUoc1ntV/g/mERDlMBg
         eTog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b87si7456314qkh.480.2017.09.11.07.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPaa-0007d8-Dz
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:21:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaJ-0007Vk-5y
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaD-0001kB-8V
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drPaD-0001jm-2M; Mon, 11 Sep 2017 10:21:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FF487B5B7;
	Mon, 11 Sep 2017 14:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0FF487B5B7
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F4008649CC;
	Mon, 11 Sep 2017 14:21:00 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 16:20:54 +0200
Message-Id: <20170911142056.15643-2-lvivier@redhat.com>
In-Reply-To: <20170911142056.15643-1-lvivier@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 11 Sep 2017 14:21:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7sPCpl4wRLr

Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
fixes the problem for i386, do the same for ppc.

Running QEMU with
    qemu-system-ppc64 -M none -nographic -m 256
and executing
    dump-guest-memory /dev/null 0 8192
results in segfault

Fix by checking if we have CPU.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/arch_dump.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 8e9397aa58..dcb7b19950 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -224,17 +224,22 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks)
 {
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
 
-    if ((*pcc->interrupts_big_endian)(cpu)) {
-        info->d_endian = ELFDATA2MSB;
+    if (first_cpu) {
+        PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+        PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+
+        if ((*pcc->interrupts_big_endian)(cpu)) {
+            info->d_endian = ELFDATA2MSB;
+        } else {
+            info->d_endian = ELFDATA2LSB;
+        }
     } else {
-        info->d_endian = ELFDATA2LSB;
+        info->d_endian = ELFDATA2MSB;
     }
+
     /* 64KB is the max page size for pseries kernel */
     if (strncmp(object_get_typename(qdev_get_machine()),
                 "pseries-", 8) == 0) {
-- 
2.13.5

