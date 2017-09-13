Received: by 10.223.172.38 with SMTP id v35csp1104157wrc;
        Wed, 13 Sep 2017 07:20:59 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC2Dnl0hhqhZ/B8E9fJW1e3VlnGA2d8WFEW7j8EGQ/2NYEL9BMWE3AHXqwmg7Yc4UMLMSpJ
X-Received: by 10.200.23.82 with SMTP id u18mr9241364qtk.68.1505312458863;
        Wed, 13 Sep 2017 07:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505312458; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl5y0ch2lnojss+xvQztOebkgm6rhV10YabpGbHFPXwh0gnpbDG6S2aOtbRueRycs3
         yCeItn/uTHBJDcvH4xlzhsjNWsrJripg4v/rDNfn7q5izC5QNS3X/HAYQJNZ2x8GDdld
         cGrLgujkI+MbtK9ZPlhx+X70gxRucYwoNmIW6zllxHDemeG04rnLCUiZlsihjGAIbO+m
         IoLk+DiA6yXGMuumGJTvuLUxK0HG4AtIZF200tOHTgZZUXQvfIcY3o+Ean6b5LdUudcN
         UFkSzTnhyBKswGSthq2vRn5poeTX9uNrs4Ny41mk1FbiJTGPMtTMFhi8kJ8QIkHYwc+5
         L8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=SQ0CFZZZ8HK/2tf2LYQcc4Lerd7iMb5CgLayupLzz6c=;
        b=lkNb3cM3V2/0bHchuCiVXoKp1mSwaJNR5u2OAzVTCSRZXp0YwEYCnLEfP1EEFPD8V2
         9vmTs2hBLPGiKcHR1enSurrORo0x2vTgShWV3OIuIE41dt7DuRbgHh+e/wlrBCS5LSwF
         eVjI7lB72+b+TgaoygRVSyhm83Q4auZ47jDCto+0GGSz7jZNbpCqwvdVUi0hEKeJ0+Tw
         stpDQO/iYjYxwzgznnwhggtlwQjwLx0ZmraEE2HfC/+KD40UYUX3NSBF50CqHgoLnc1+
         OS27yOvcvCyIaHfv9H+yTav5S+EB14Kw7LQQXrgznsNYlWIWLp0J1HQYkA2IJ9igbm6d
         tTzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h67si3575808qkd.190.2017.09.13.07.20.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:20:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8XA-0004aA-Jm
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8X4-0004Zu-C1
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8Wz-0003Mi-N7
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds8Wz-0003MC-6J; Wed, 13 Sep 2017 10:20:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFB3A5D5EA;
	Wed, 13 Sep 2017 14:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DFB3A5D5EA
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC1117F48;
	Wed, 13 Sep 2017 14:20:41 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 16:20:33 +0200
Message-Id: <20170913142036.2469-2-lvivier@redhat.com>
In-Reply-To: <20170913142036.2469-1-lvivier@redhat.com>
References: <20170913142036.2469-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 13 Sep 2017 14:20:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 1/4] hmp: fix "dump-quest-memory" segfault
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
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mCepSKsb9Zu8

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
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

