Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7064036lff;
        Wed, 15 Jan 2020 07:29:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYwmi/lem+n1EuNsAdXB/iuh0m93+qkhYWbaoJCT80SArp13+NHL1c8+2QFVXSGCudfEUE
X-Received: by 2002:a05:6402:1cbb:: with SMTP id cz27mr30780148edb.227.1579102183161;
        Wed, 15 Jan 2020 07:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102183; cv=none;
        d=google.com; s=arc-20160816;
        b=AfHZLvKlE8xnLp+8b5ENtbFjIP38zl8DiGDkkLkhy98EjZ9wKGXIv/0Z/oRRWfbYFA
         8C3dLmqNM4nb+XqNqcBle65dDctTjQp/UuGnDsEnDp7gzDjFU6EshM1UM4QJ9dF0vW9/
         WFxdypKPVytBWvyN+euw1sN7F1jmTWVJP4bAXot3BXJ526q2eotFBEthtD3gIxvFYOBn
         SMHvem3Md1GLNz+wYC/RvGXDIkxBZf6xXzC+qcZavgS9mFoaI1pJnR9CLmrsj38sNyv+
         F3GNTlfWCQGalZy/sSX7YgY2qLVWF2eDUvySHIjt02buObjeH7SiMNk3vkX/OoACQGxm
         X0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8ODLpJU94JTJhdOHhtazz1hAq2uT3SVP1na6pCS2/ck=;
        b=0pLo+dJmY3S9FQU0VmNgE24CftLocqaL56/XSh6HaebfgK0tDgHoBzuEYIv10/JhsK
         DVQoenejvEp8ZVxMDDAxZu3qYPHlxq9TSpP5qWqtkcqAEYidpaUJiygOQAFD1JSCa2nu
         dI9zaZhPM6bVCQpjeCnFZKqmfDd1YqOo4MT7WNmq/1V+GrMK5ewDKcVqCJxZ4qPv9Dt6
         llFfwX4g49jX3uBeMnNGlXzY6/jkQfsoAFRTmhnjks5XF2ER+nyCrOm0eTStTqfFw7os
         QpwPmc+45wJO6EvUY7BOflJwyVve40LHLA5jqx+wf8bB3DN1R+WFocd5ENNfHj0dSfvD
         eiRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dy4gM8DR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv18si11292498ejb.18.2020.01.15.07.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:29:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dy4gM8DR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkc1-00026K-Rs
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKN-0008EW-Ik
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKM-0008Tu-Df
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58664
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKM-0008TX-9i
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ODLpJU94JTJhdOHhtazz1hAq2uT3SVP1na6pCS2/ck=;
 b=Dy4gM8DReyW5A1hx/oSTH3T6T+VI+kG+6Ya3WefwVGExEQnlswHxCpy8xvjPZWUr70V5FS
 IWdVHVvY75EO8EZIBZ0z1Y/qk3m5o7SYJ1LKjO/ED3hIdcd2XXrWo6PoJXEKdlmOL6OS+u
 34uKnv2BXPDkicZFdENUTSDkNBUbuP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-okyN9i-9OMegX3VphwdfHA-1; Wed, 15 Jan 2020 10:11:22 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020B0903B06;
 Wed, 15 Jan 2020 15:11:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFA7F2898B;
 Wed, 15 Jan 2020 15:11:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/86] arm:xilinx_zynq: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:50 +0100
Message-Id: <1579100861-73692-36-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: okyN9i-9OMegX3VphwdfHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alistair@alistair23.me,
 edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T2qkrJiQkXct

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: edgar.iglesias@gmail.com
CC: alistair@alistair23.me
---
 hw/arm/xilinx_zynq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index df950fc..0ef9688 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -160,7 +160,6 @@ static void zynq_init(MachineState *machine)
 {
     ARMCPU *cpu;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
     DeviceState *dev;
     SysBusDevice *busdev;
@@ -190,9 +189,7 @@ static void zynq_init(MachineState *machine)
     object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);
=20
     /* DDR remapped to address zero.  */
-    memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(address_space_mem, 0, ext_ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     /* 256K of on-chip memory */
     memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
@@ -318,6 +315,7 @@ static void zynq_machine_init(MachineClass *mc)
     mc->no_sdcard =3D 1;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->default_ram_id =3D "zynq.ext_ram";
 }
=20
 DEFINE_MACHINE("xilinx-zynq-a9", zynq_machine_init)
--=20
2.7.4

