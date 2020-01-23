Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp564391lfp;
        Thu, 23 Jan 2020 04:01:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8AYZOXA2RiN0U+rreb7Nf2LWDLGsRvkcG+Mt0O8NfgeeIWbcSEAM1NBIwCNHqeL+UIYiZ
X-Received: by 2002:a17:906:390d:: with SMTP id f13mr6620677eje.151.1579780902078;
        Thu, 23 Jan 2020 04:01:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780902; cv=none;
        d=google.com; s=arc-20160816;
        b=s1k29h44ZTIfCbUqzfBEOAojeW++e8Qd46ViAiQ1Z2DdMlAIDpy6mm4ClAEr4eqcKC
         1NxbYkK3oydhN7M42JFiH2Tv+XltyETIT2FTCBWEAaSlQczpIoSWq49g1tUyTUKlJkPa
         gwiXQjuoNPsFeYFdhJCtrF6PSycRtqfiRpFziay8XzG/FKDhCTkxujDBV3GBIiWxXYwr
         hnXAQfDhLlwqM7//fsDU7JTpGjFnouIOmI9GUn44MYjzwQZbmH3xz8VL/dL8B9rO4NiM
         +K5K3dGUXKvPS1e/anby7yPdL54QwNtkrSSoVFcwHh0h4B0Vc6KlrA3lqYlpXTcBQylF
         jeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q+DYCLbRiDz1yBO+kg4bP+MMjY4dOoVP9+YgWNNVdBE=;
        b=MsJClPX2IBXVWFP/cPryTNOG4u+uWlC1Sn7nRePbTlcP3EimDKFYh2nJKDJIdw2w5A
         1er7qVE6b2GCy8IzEcYh73vCrKhf4eqV/xTK5UCGMPb1KMRbgMuK9E2bxv5+Qkfmn8TS
         2lnDB/Z4Eadli9QW45B/HhfVNgrx+cACwsNcxUFAiBgxY4M72u6y0ZdVBP1f3ZvhB2x0
         wYMxL2Ykqc0ChtnOURIzH300zALvAxk6NgfrFA24tHiblDjk8hFoQAJSyzr1KLOuqVz3
         OojuQThRMx+z3EloWVGmtGfQF02RCMU1DStRd1Zow/CMMBYQAUiNYVkMQ/yd2wU1OAGf
         GSgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aZHFOsU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si1091103eds.50.2020.01.23.04.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aZHFOsU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iubB6-00048J-3n
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 07:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasG-00067B-ED
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasF-0004T3-7m
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42906
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasE-0004Sh-R6
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+DYCLbRiDz1yBO+kg4bP+MMjY4dOoVP9+YgWNNVdBE=;
 b=aZHFOsU3rtVoeH7pByagE4v7V89qYtaw82xbEZYOLfPvpRWd9oncpK3l615WGwIOW2YLtV
 GxNRcnph6vtLFlSuc/vZcgGA2E6d7NVEDuilHYAL2r8zv0Jx86rJF7n+Q9zho8u+EvOD9R
 CzbzDTIHgzzW7il1LekR9oF5it9HP3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320--2Q6AvqbN2KBvOM1wSCEMQ-1; Thu, 23 Jan 2020 06:42:02 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFA60107ACC4;
 Thu, 23 Jan 2020 11:42:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A0D5100164D;
 Thu, 23 Jan 2020 11:42:00 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 28/80] arm/sbsa-ref: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:53 +0100
Message-Id: <1579779525-20065-29-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: -2Q6AvqbN2KBvOM1wSCEMQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 radoslaw.biernacki@linaro.org, leif.lindholm@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FaQFXTv34UBO

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: radoslaw.biernacki@linaro.org
CC: leif.lindholm@linaro.org
---
 hw/arm/sbsa-ref.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9b5bcb5..1cba9fc 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -593,7 +593,6 @@ static void sbsa_ref_init(MachineState *machine)
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *secure_sysmem =3D g_new(MemoryRegion, 1);
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     bool firmware_loaded;
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
@@ -685,9 +684,8 @@ static void sbsa_ref_init(MachineState *machine)
         object_unref(cpuobj);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "sbsa-ref.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base, ra=
m);
+    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base,
+                                machine->ram);
=20
     create_fdt(sms);
=20
@@ -785,6 +783,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *=
data)
     mc->block_default_type =3D IF_IDE;
     mc->no_cdrom =3D 1;
     mc->default_ram_size =3D 1 * GiB;
+    mc->default_ram_id =3D "sbsa-ref.ram";
     mc->default_cpus =3D 4;
     mc->possible_cpu_arch_ids =3D sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props =3D sbsa_ref_cpu_index_to_props;
--=20
2.7.4

