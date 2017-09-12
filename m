Received: by 10.223.172.38 with SMTP id v35csp7098915wrc;
        Tue, 12 Sep 2017 07:02:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAyvwepPwggrBQ9Lhre+MUE23g8TxTS8WVJTlC/NlyjSMLNNa7lY1KkYzKMgxAdoa2amAvA
X-Received: by 10.31.156.21 with SMTP id f21mr10341665vke.152.1505224941291;
        Tue, 12 Sep 2017 07:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505224941; cv=none;
        d=google.com; s=arc-20160816;
        b=XROSl0hZ3jjbx4FwJWVJYz2NdzbHbh1AuDzabMzqgUrg8qMwHIcTCuxeBhngHr+g+z
         V35Uos0h2HShLEWcWYMFEpiggg1q40awZrALlfR8IElYnSj2JEh7eIroQ0uozckDmWZ2
         E9crv3XoZ1yCL8FDNBwOL6EGcz7w5iubdoWIB1BzugvZ/Hk7A58a0/quK6OVX1cfkmpc
         OZ2xjWA39dPNRTfP+qNHrDRABm38e6/3iD1IzbjwVNGMDp8ebPoNf+DiZt5+nIMgaR9T
         +CwRSPnd66zCERsEPyabnbhPVzfLfIL6OiBcFsX0/wc3hDpYWBZMWLhkVQL9zwl0mJXY
         aABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=DdnqBucXKxKFl2IPMxVo0nRhFrH/9nTHRCU4eZmWZaY=;
        b=rXkUwvLR6AdCnjRc1pLnAO0xhAQZug9h6D8E4e1isXj8bOmr8B2gdvgwWT3DrYFIIN
         cQuwdrSbA7nPeT+PbDxNRA+aWk5KlnKIWn1Ek/UzNKte422qwqrJGiypupdZL94ZStKd
         eAwixwdvji/4X69MPG3yKNqAMM8swIJ56l4T/w8xm5FX2++kEbS4Q/LvGNGXAv7Y1Oa+
         YRw4Mm/lLBwSBbZub6kkr+ZnPR4qIIF6MTv0lItr4ZMSHGKVtnga+7kyAXHUOY8cac0b
         sF9dU7vZiEGYCco0iA9YDzuvUzhEf0X14r/B1PnjK7sIYACr0WeFA00X5b5GwV6iwauk
         VsNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w123si4956016vkg.229.2017.09.12.07.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:02:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drllb-00068v-1k
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllK-00065p-OG
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllJ-0002WQ-NQ
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drllJ-0002Ul-Hd; Tue, 12 Sep 2017 10:02:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C6F74ACA5;
	Tue, 12 Sep 2017 14:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6C6F74ACA5
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA9D160BEB;
	Tue, 12 Sep 2017 14:01:57 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 16:01:48 +0200
Message-Id: <20170912140149.7692-3-lvivier@redhat.com>
In-Reply-To: <20170912140149.7692-1-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 12 Sep 2017 14:02:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
X-TUID: ZhTLrxfCRxN9

Running QEMU with
    qemu-system-aarch64 -M none -nographic -m 256
and executing
    dump-guest-memory /dev/null 0 8192
results in segfault

Fix by checking if we have CPU, and exit with
error if there is no CPU:

    (qemu) dump-guest-memory /dev/null
    this feature or command is not currently supported

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target/arm/arch_dump.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 1a9861f69b..9e5b2fb31c 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -273,11 +273,18 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const GuestPhysBlockList *guest_phys_blocks)
 {
-    ARMCPU *cpu = ARM_CPU(first_cpu);
-    CPUARMState *env = &cpu->env;
+    ARMCPU *cpu;
+    CPUARMState *env;
     GuestPhysBlock *block;
     hwaddr lowest_addr = ULLONG_MAX;
 
+    if (first_cpu == NULL) {
+        return -1;
+    }
+
+    cpu = ARM_CPU(first_cpu);
+    env = &cpu->env;
+
     /* Take a best guess at the phys_base. If we get it wrong then crash
      * will need '--machdep phys_offset=<phys-offset>' added to its command
      * line, which isn't any worse than assuming we can use zero, but being
-- 
2.13.5

