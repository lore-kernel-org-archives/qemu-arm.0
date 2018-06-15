Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp989222wrq;
        Fri, 15 Jun 2018 08:33:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJZsFDauMxF5X98tklxjE3O76YnT2FeKynx7TuLB0hUW49kSMws5bPWbi+I9rp/KeFxoiP7
X-Received: by 2002:a37:a241:: with SMTP id l62-v6mr1687294qke.329.1529076834910;
        Fri, 15 Jun 2018 08:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529076834; cv=none;
        d=google.com; s=arc-20160816;
        b=L/TxkXKpHBhgidTuUkV7QFg8/Ks7QQFi385+817BMYL/HEnPVvMRQ2tBuFOrfibaJB
         FypKdGx5luVjD/xnK5XOYL9DS+AFexdoTYtVoNxGdvEFq+cFsdTAXPGNwVkxij0F/SrU
         MMh+ds8jje6Y8LDOANmRzQMdiEG0tsl2NHNPJl/89EcxmZ3nsu4xZbCqFxG/G2TaPkj6
         33yCI9dcN8YdmhXonzYFdl2nkOZbFzLLgxFDccxZ+aSBNnQ8WbvuggbpjuBqyykbLwUu
         OzjSxcFl2mdMEc+ipbLdqaDgUyN/q1Qkn5hHZ5fbBOyYCySpawQGrYpF1cpbawc2Ycwk
         /T1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pgBJzTCRWoQhD//WqXpktQm65oerLz/Z9rDoxCEvYcc=;
        b=WvrmQpQI5RZ/wwyE2mL23vhbK2OoPgih1P+Iql5e6+Fei0JA6O0pMW7Pyfim9tSP0v
         I2fJHdXmuucv4nmoMM86wBndKzU5Y5UzYPVxB+VByxr2vqHnlaC9vnKwMiwG0xEDEyqv
         hhobIgLgu4FUFwhSCmf6b378OKjXOkc58yqKK1sROPv8PjaqPjxhZElMg44rt7AKO3c4
         g3KAp2gdgo1uFAIHXokRPPFKtb/UB232r86QD2KWlQUJpdCk4w1cO+Nou4RoJTNMQ3SZ
         sY5LVHzzHnQVzFGIlF7ZZgbIF8clnZ6sqWVALQtu4ISDharY3VhmcBwySXhhYdWPtXjf
         srYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r139-v6si2728754qke.356.2018.06.15.08.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqja-0002ML-C8
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:33:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpio-0004l6-8D
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpil-0001IV-14
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:29:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55858 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpik-0001HW-S6; Fri, 15 Jun 2018 10:28:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73103F68AB;
	Fri, 15 Jun 2018 14:28:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1A3A2026612;
	Fri, 15 Jun 2018 14:28:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:29 +0200
Message-Id: <1529072910-16156-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 14:28:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 14:28:58 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 10/11] hw/arm/virt: Use 256MB ECAM region by
 default
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gnLVseU9EWSe

With this patch, virt-3.0 machine uses a new 256MB ECAM region
by default instead of the legacy 16MB one, if highmem is set
(LPAE supported by the guest) and (!firmware_loaded || aarch64).

Indeed aarch32 mode FW may not support this high ECAM region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 10 ++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 75a1a14..5a16e6c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1317,6 +1317,7 @@ static void machvirt_init(MachineState *machine)
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    bool aarch64 = true;
 
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1432,6 +1433,8 @@ static void machvirt_init(MachineState *machine)
         numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
                           &error_fatal);
 
+        aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
+
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
@@ -1490,6 +1493,8 @@ static void machvirt_init(MachineState *machine)
         create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
     }
 
+    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
+
     create_rtc(vms, pic);
 
     create_pcie(vms, pic);
@@ -1786,6 +1791,8 @@ static void virt_3_0_instance_init(Object *obj)
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
 
+    vms->highmem_ecam = !vmc->no_highmem_ecam;
+
     if (vmc->no_its) {
         vms->its = false;
     } else {
@@ -1823,8 +1830,11 @@ static void virt_2_12_instance_init(Object *obj)
 
 static void virt_machine_2_12_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_3_0_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
+    vmc->no_highmem_ecam = true;
 }
 DEFINE_VIRT_MACHINE(2, 12)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 085fdcc..9a870cc 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -98,6 +98,7 @@ typedef struct {
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
+    bool no_highmem_ecam;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.5.5

