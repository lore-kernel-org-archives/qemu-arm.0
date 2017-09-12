Received: by 10.223.172.38 with SMTP id v35csp7099305wrc;
        Tue, 12 Sep 2017 07:02:33 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb51Wg8NuWPofHzl0FMngAXJIufBJbHDucACtC9WObc5n/YoBqZ4n5D83svKcaVgx74JYW+n
X-Received: by 10.176.81.185 with SMTP id g54mr12078116uaa.98.1505224953015;
        Tue, 12 Sep 2017 07:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505224953; cv=none;
        d=google.com; s=arc-20160816;
        b=u8hVfeisnvCIvh/Jn24bAj6XbL6/sErRK1HtaDmGMQL+DaMH8LziyV9hBRRbWW6KJx
         mNP5NtFhrfc6pmhfqLt7zRF1y/D4Qlgl4cY8EMuH4roZ+vjNzcCbZiVGtIt9Gw1cGkmS
         EXz04Bpkj4s+hYZCvruVRqR1Ybe1TaU22Xh0NLVvUe95ylB/caq9FsLOU/YY49ZVzAqS
         GGGyqcuBAtrvRoIY7qUscOP7uT/sy5qNeOrHHeD3ANsGEchlavU3uNiEiNrpuYyai68F
         g0c5VTT4YC2hFO4XIFfNlVobHuoG9MsdUl8KXQ7MdqTxOEZdXpcj/TiW4UA5tO93i5W5
         TPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=xtV36uK+R7PwjDU83w1LwkZg8wXjDGGcIAJc4/R9p4U=;
        b=K0pLeOUZlS70uiyyI2Ywht2kxcKeWrH/NK300rITA0I5iWpTXYJfAmpgqJrNLKd0fT
         2pfh/Y1jdu3GvHbjiD6AJlyVk9Qb61sHO7M1aJTZ1hKHpFF99UBtMqTxkgAP47qRUAcj
         qLn5jpPB944ffjSnOjEv1ttDEvE+yUANDpEzbv+9L+K5ovWcdESqNRJu0Nqc+S5X5Hvq
         D+lCB4UAc01Wf28LGKdSE0a16eNaEVolPFU8dwVCIPLdfBGi/qmd4Tk5d3BmNcbv5VIn
         w1X0f8TQa74Sk1IJGa8KjHjgzqmxZCYzUuy8xvTZt1icT7+QZIxoXCt1nRIBF7F3PBxb
         l4Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si1427819uac.340.2017.09.12.07.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drllm-0006Sx-Ks
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:02:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllI-00065Y-2G
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllG-0002R8-Kc
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drllG-0002QU-F5; Tue, 12 Sep 2017 10:01:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68485C04B317;
	Tue, 12 Sep 2017 14:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 68485C04B317
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA0017DF4;
	Tue, 12 Sep 2017 14:01:53 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 16:01:47 +0200
Message-Id: <20170912140149.7692-2-lvivier@redhat.com>
In-Reply-To: <20170912140149.7692-1-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Sep 2017 14:01:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
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
X-TUID: bAgKYmlGAokz

Running QEMU with
    qemu-system-ppc64 -M none -nographic -m 256
and executing
    dump-guest-memory /dev/null 0 8192
results in segfault

Fix by checking if we have CPU, and exit with
error if there is no CPU:

    (qemu) dump-guest-memory /dev/null
    this feature or command is not currently supported

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target/ppc/arch_dump.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 8e9397aa58..95b9ab6f29 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks)
 {
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    PowerPCCPU *cpu;
+    PowerPCCPUClass *pcc;
+
+    if (first_cpu == NULL) {
+        return -1;
+    }
+
+    cpu = POWERPC_CPU(first_cpu);
+    pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
-- 
2.13.5

