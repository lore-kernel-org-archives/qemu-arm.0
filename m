Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3449071wrx;
        Mon, 4 Mar 2019 02:18:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzw97Zu/98ZXuvZ4ePWJ3XQecYtof5+Pd+fr6VgpkMVR+v5tE9CF1LYInqIGyi2GkCL06zA
X-Received: by 2002:a25:5f42:: with SMTP id h2mr14215857ybm.277.1551694681170;
        Mon, 04 Mar 2019 02:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694681; cv=none;
        d=google.com; s=arc-20160816;
        b=qRBKJT3/0VYyW3tbNB+iCjSUnm+ISuSg6TQv9pfXoNOJlnu+FR5yQzAZY05LN3pOle
         6DQpBMYBBAVK1rWl4pKGq1aX+cY7Is04PgAmnBOv+6xazZRBGHQ1A3wFmWDWaORjGhiz
         LVaabDDXUT52OfMU+HnN7mv5suslq57cUe5JnyZmPceCRzO/DEI2HKFKhJibM32qFTZl
         Unm9oqoPbJtukM2m0r0kt77rOEIZJJGL/4hfuy1zyS0iZD/kk3lG3aSejrWkEfjSyzsJ
         xbdvvshZQzJNHu9zIVfxbETmOIcE4p0BII6aoXbEuFU+yEJuCSO8eY0+DluBApniGNd7
         nzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=s74x/Zqv67jrFizk3K6cSW1rpV1FdlMal7cC1JYyRhI=;
        b=BE0bKjmHFrUvSEzZZ/PjPM7J8VdP08t8J6zsV3V6Dx4FiXiNkHu2EC/Sw8eYk5vH1s
         hi0ceqK0FJ7j9nZYzLY1qE6OK+DJpXvxtcBZRO6EgRiVeTYcJua+Un84fbX8E/DRAQwa
         SbU2FfSrnyGSy7KypjpysAMfSgXpqyjSO2f3topIiAYUcpdfUi6bc9pWlyBLadrATQnB
         ljUkfUGO/8V8pOzNHvOj/6TAiNHEIo7aCc1fostqWtQM/pqxvUOI+96EWAbkPMdXF0x1
         deLZLWGqtefe9DIcmO+9xHcK8XJM9HJaEfZtm0CO2xqA7AoF8dUuF6Hv6m4Kxbey7hJx
         1MKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si2867775ywg.153.2019.03.04.02.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:18:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kfY-0004P8-Gf
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kdE-0002bX-Le
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:15:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kdD-0001FP-4p
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:15:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kdC-0001Em-Nz; Mon, 04 Mar 2019 05:15:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9037308425A;
	Mon,  4 Mar 2019 10:15:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD455C2EC;
	Mon,  4 Mar 2019 10:15:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:39 +0100
Message-Id: <20190304101339.25970-11-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 04 Mar 2019 10:15:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v12 10/10] hw/arm/virt: Bump the 255GB initial
 RAM limit
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtrn0Zi29Jo/

Now we have the extended memory map (high IO regions beyond the
scalable RAM) and dynamic IPA range support at KVM/ARM level
we can bump the legacy 255GB initial RAM limit. The actual maximum
RAM size now depends on the physical CPU and host kernel, in
accelerated mode. In TCG mode, it depends on the VCPU
AA64MMFR0.PARANGE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v11 -> v12:
- Added Igor's R-b

v7 -> v8:
- TCG PAMAX check moved in a separate patch

v6 -> v7
- handle TCG case
- set_memmap modifications moved to previous patches
---
 hw/arm/virt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d725daefdf..c7fb5348ae 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -95,20 +95,7 @@
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
+/* Legacy RAM limit in GB (< version 4.0) */
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
@@ -1516,12 +1503,6 @@ static void machvirt_init(MachineState *machine)
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

