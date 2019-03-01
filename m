Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp650561wrx;
        Fri, 1 Mar 2019 05:54:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3ODX4tX0+BhPJwo0CChY8hIjI2A7lDT6XDd36eyo81S9sAnY4VysQ7xzpYL3ueA7gEosN
X-Received: by 2002:a81:3dc8:: with SMTP id k191mr3614883ywa.139.1551448494107;
        Fri, 01 Mar 2019 05:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448494; cv=none;
        d=google.com; s=arc-20160816;
        b=Eq4Ka5QuqgIRoTqUCa1NnPLd+oenznb8dcf8rI5op6xdwe739Rknke9gBYcs0Bhkmg
         aLh9ur9ARn80h9prSB77lsaoMJElInC70hS/v/Pgfp+d8d5ZMbvgQKkufeNvQ7f+UJmW
         6/Rti4pJcSOV9hwn/nBQNLkm12GqVRb/FcB7XBUoHAXtJogsclsB1pe2R2MPp1jfh5fG
         uHVDruNan4dlkUiIB9wh+664WFSqsenn2V0j86jqK6s7g5UZ4ravTYPIK05bJFz6VgwT
         tSVZxFIH0sbSWzid3+RPDWS2zcI1Zwc/G4+ii7ARWKRpbatvLerDG5FpKrxdiZ2PNQPw
         Cmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3riYW7c+wgJOCEzGwdwt5wNkJhnk/VjzFMJBhD2k5nI=;
        b=wh1/lr2QIMXi1+9S4ED0ZblHOBqJKvzp9wEdNkg+0mSvyOxvtPswf57QeeyIL31gtG
         MuLhg8cfZ4rhQdGLwW9BFroRH+Ra/SrN9lRM5SD/xqSIrfL5iHYWUmJ0+jAGUKvG0I9q
         sV5O8CtAG4bv1GYVTDWfU3aqwqMLRtJbHu6/tmrqhkZEhAW1MVk7YWDtUEqu/iJ2iUV8
         GQaUO8l6rBhWJX+0RsnJNyjFPv8t4thJb8dwscIAf7bxdoAx1ssYiBVPmrghNyVN7dnF
         UxthbSOxpgMzDF0nuKD99GIMpLsyz/bJVsu8lrzdQ+Ej7cpNTeuGF/WGqeR/HE8PV/cf
         oXug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si9160489ywl.377.2019.03.01.05.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:54:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzicn-0000D8-Ht
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziWJ-0003Dt-EH
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziWG-00032M-Su
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:48:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gziWD-0002yL-EV; Fri, 01 Mar 2019 08:48:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02841308B473;
	Fri,  1 Mar 2019 13:48:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB415D704;
	Fri,  1 Mar 2019 13:47:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Fri,  1 Mar 2019 14:47:09 +0100
Message-Id: <20190301134709.4695-11-eric.auger@redhat.com>
In-Reply-To: <20190301134709.4695-1-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 01 Mar 2019 13:48:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v11 10/10] hw/arm/virt: Bump the 255GB initial
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
X-TUID: ObhE/mwLQ+YA

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
index ab70e4a657..aa06570050 100644
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

