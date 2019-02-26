Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11094639wrx;
        Tue, 26 Feb 2019 05:54:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaExvOT0DNZkM25mCA5oX/aYYhdMxusdqk7YzmoEUtEDfw8HCT1AErcYXRyBqCwum9kVNtV
X-Received: by 2002:a25:760e:: with SMTP id r14mr17137638ybc.17.1551189272539;
        Tue, 26 Feb 2019 05:54:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189272; cv=none;
        d=google.com; s=arc-20160816;
        b=q8QRdKlLUt2CIM9wPNSpWkFZ8PK5mUWoy+69J9IJDDjs+kEVt/EI6BphCUa/AUorUG
         qxKDoY9VhrgmB0WIQIVuRKJunfxt0F96ijyCX5oJ1ga0dZ/BCBluAP1Y+NxCK1pqMrnu
         /5lHBymxOjzfduZcwZhUhgv4nG1EyoM8UVXdhBpr76jGADSIN2OTXrBaO9IC6MPmrLb7
         YuHu8tgFTY0bPR5bEykQuU1wU3zMz2xlig0OSGMh9akseUeRN/it+iqijgw57OgXJsGl
         u7Cnnfe6247NTqposoi7yA+AnwBwoITfrBSq2kS4L8vYdvGp7DMoFiEAs2O3J5VQzqGC
         p1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6+nIo0vMOrowDYxgh7owz5j9fdsBpv3YxZUCCOTJp7g=;
        b=BD+k1tFix2z0B/Vu+Txd+xmuytn4Z9kp4aW+pwIM6tCSyT8S92l9BiTiuIzecKK0h1
         H3C/VIDn8lg3n70+9fP1vjXE76TM89U2VmWpUhy4pwzNq6l/2VM0KliGzW302f5e3Bgy
         dKNTTOhCKRMz792XkLQDRv91JzJdwDmuFiITf9rYtMOH/sd8uwC/67GjfSyS4ug5FUtp
         eNPiNszyP7gWFX1mxlIYqlUuYDnpp5v/atp4XeaIEjdWCJ9B0aMx5AoM1n1qrFVpdpxL
         OHkxxZo3UuddjtSQjOFZtMmE+2/5+cugQR6HKls0wFzKXYoby7zIgzoHqOFd7EL0RP0o
         BERQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si6873407ybg.240.2019.02.26.05.54.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:54:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydBo-0002jW-1E
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:54:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8f-0000J1-3Y
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:51:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8e-0007Ey-4s
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:51:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8d-0007E2-Uh; Tue, 26 Feb 2019 08:51:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A14530044F6;
	Tue, 26 Feb 2019 13:51:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F6D35F726;
	Tue, 26 Feb 2019 13:51:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:06 +0100
Message-Id: <20190226135014.31854-11-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 26 Feb 2019 13:51:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 10/18] hw/arm/virt: Bump the 255GB initial RAM
 limit
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
X-TUID: Hg/Rrb5RH+Jo

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
index 17a34574ae..aa77b54beb 100644
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
@@ -1511,12 +1498,6 @@ static void machvirt_init(MachineState *machine)
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

