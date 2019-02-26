Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11492835wrx;
        Tue, 26 Feb 2019 12:50:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibj0K+lMvm1eEYnRLJO2CK0ZPs8xYntHe1P5cqwEP1/jqZiRN/k9FUNcxfK14EyeFKTWqyq
X-Received: by 2002:a25:c1c6:: with SMTP id r189mr20717912ybf.109.1551214235220;
        Tue, 26 Feb 2019 12:50:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214235; cv=none;
        d=google.com; s=arc-20160816;
        b=E+3kgAi7YHRfPaK0mx2i9ITKn4J1+m81wEiewChWlftr5DNwXLWuxvlH3SGC33eS8V
         uNitZYV6o6VfeRMlIjj/Ye/oC0WUbWgHC09F29/+dDCdnHWlqcZ8Re8D7D6G1fzO3krl
         CyMldG/9CGYEH0QMe2S3SqDp+JIxFquppXPYln5HltwvBNmNeCsPWeVz66Zl0uOKWv+A
         +GZy+SclYdGUKQQAG+moGv/tKkoHnlbsAr3PqYLnsg6y8OvvaryMxP43pxs0pdM1FZa2
         OUcIxtR/kkNmv3EeHus8cysjaj0tRci9QcGIFejPTSoH+ECPhiQTQ8RQyEHcI8NCVO+W
         MD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7HAMfyFKxBgwMi80sGCe+qTZZ60PqwZSubc5SN+I4bM=;
        b=qnCYtBsRUHJ/P6y5IHJKxyv6RKv4I/OwizEpVfaTrcGJUwbmw2u5MiTYYdqjuGzO42
         BR8Ux/SxLKI05td1JhKGILTbMEqCfTi28ZZGE0KHucRKLUw2gFjGA/B9c7wnlrGTBJb6
         1mz4ONUXLCxSLLrS9f/dzt7qpvW2DXt4F9NdI0kTJlBONTeFYvgJaU+9UbX88jX7W71x
         +2YeyFGZy9ImpKzKnqhHU5f9o/CU8RTCjtBPXvRlEHE3qgC8zX4vQU/mvnmV//qNUfaW
         5BBbmRmqXFZqu5qDAXXMcf4Gfqp3ypJQv6VajkrreWfodZT2W1x25I89KG/V7BaRp2Ub
         So2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p189si7090550ywe.106.2019.02.26.12.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:50:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:32966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjgQ-0000QL-IL
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjc7-0006Rh-BR
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 15:46:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjc5-0000jr-7V
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 15:46:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:23979)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjbj-0000Jl-Rt; Tue, 26 Feb 2019 15:45:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67EFC30BA2EA;
	Tue, 26 Feb 2019 20:45:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B16CA5D6A6;
	Tue, 26 Feb 2019 20:45:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:31 +0100
Message-Id: <20190226204439.2296-11-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 26 Feb 2019 20:45:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v9 10/18] hw/arm/virt: Bump the 255GB initial
 RAM limit
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RPJjiigYrD42

Now we have the extended memory map (high IO regions beyond the
scalable RAM) and dynamic IPA range support at KVM/ARM level
we can bump the legacy 255GB initial RAM limit. The actual maximum
RAM size now depends on the physical CPU and host kernel, in
accelerated mode. In TCG mode, it depends on the VCPU
AA64MMFR0.PARANGE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- TCG PAMAX check moved in a separate patch

v6 -> v7
- handle TCG case
- set_memmap modifications moved to previous patches
---
 hw/arm/virt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acce1f7ce1..b854438046 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -95,21 +95,8 @@
=20
 #define PLATFORM_BUS_NUM_IRQS 64
=20
-/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
- * RAM can go up to the 256GB mark, leaving 256GB of the physical
- * address space unallocated and free for future use between 256G and 51=
2G.
- * If we need to provide more RAM to VMs in the future then we need to:
- *  * allocate a second bank of RAM starting at 2TB and working up
- *  * fix the DT and ACPI table generation code in QEMU to correctly
- *    report two split lumps of RAM to the guest
- *  * fix KVM in the host kernel to allow guests with >40 bit address sp=
aces
- * (We don't want to fill all the way up to 512GB with RAM because
- * we might want it for non-RAM purposes later. Conversely it seems
- * reasonable to assume that anybody configuring a VM with a quarter
- * of a terabyte of RAM will be doing it on a host with more than a
- * terabyte of physical address space.)
- */
 #define RAMBASE GiB
+/* Legacy RAM limit in GB (< version 4.0) */
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
@@ -1519,12 +1506,6 @@ static void machvirt_init(MachineState *machine)
=20
     vms->smp_cpus =3D smp_cpus;
=20
-    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM",
-                     LEGACY_RAMLIMIT_GB);
-        exit(1);
-    }
-
     if (vms->virt && kvm_enabled()) {
         error_report("mach-virt: KVM does not support providing "
                      "Virtualization extensions to the guest CPU");
--=20
2.20.1

