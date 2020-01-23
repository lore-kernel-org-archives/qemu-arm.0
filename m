Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp571827lfp;
        Thu, 23 Jan 2020 04:08:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBO2UOEVESpkMJkAd8TU+zynRPGaYWSKCJYyI2SLUV1zCM74LRS8+c9CxznYptnieBNSnn
X-Received: by 2002:a05:6402:1742:: with SMTP id v2mr6173180edx.171.1579781288087;
        Thu, 23 Jan 2020 04:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579781288; cv=none;
        d=google.com; s=arc-20160816;
        b=nW5vPB/6S1dlEIi9NGjcIZER7vqmi6l9NNNdPHaN3nPs5xu6ITs5hT4O6Usodo3B+m
         W1Qk4srdSng7amVpjyRFAUT2MkfDZsEyLMizVrZqn4jcsyz1zpibWrgGBt3ikYBSSLfo
         k6+uH4Olky1IIpqJSFTECrXcL6oqAL+kDURndika+OXJnydpCshQ4Zwl6Hy0qjYFb6RJ
         Prl7EgxMM1Va6s9WRfYKgi07kWQiDdjHNO9L7koOWEbw1yKoZ8DqpAAGH9fEjKyqrZDj
         r7kPQLcesC2gaH5jsaAs97sjFyWcv0qmxaq+/gnKMfideHwJHS0SpLUIkL25H+5xaEhz
         aOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dU4A1ol9+RV1MxN3TNqpKB5fZBZ1daE0CVda99LGnPU=;
        b=v6z4G7By144cpBX074UDtalUv/wvsnMVUOFmbmki3HSaz95kC64dU1aeUIIgWaL39s
         fK0DdWZzB9tCBWDUk9VqYVYIiE2qXx+dqF+MOB5PTyp5YBDg5P0Us17HnjO9PbG7AZJq
         PaEUA5dgd1mObd+mr0yZFveFgzsf+moQTuj/FOOrT83bdMcDLgKhEg3U37t6BIntcUuc
         6QpBTUhe1MGkqWdaw5T9JK2Iy/Dyvr4CzmJf7hQQOjfLw7QcgrblehDE7X9Xqryydpm+
         5M810Y4lfJsCfbFNu33Qd81QP6HQRue0zVNjrRriIhVa6m8A/GWWPjJ23pbsp3k2V4DT
         vh3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GGLwuGfp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si1085671edj.12.2020.01.23.04.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GGLwuGfp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iubHK-0003Pf-FT
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 07:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasM-00069u-L6
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasK-0004Uf-8G
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34051
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasJ-0004UI-JZ
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dU4A1ol9+RV1MxN3TNqpKB5fZBZ1daE0CVda99LGnPU=;
 b=GGLwuGfpZjouJzCGIuueqNcwZBopTH7k4JXZpTtFQbnHnEygih4NcmkvdSZMVRvOyQtm95
 yBSDB1ROV3S454o/FsSzqqmfnJ8RoOE/EVqWHPmiZZllA3SgVtU0jCR6u0o2cU1oBbNAOp
 IvKjC+mVJB5oMLfQNvr2zaM4ZNrWtZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-br9DgDl_PZS2KVDAd85Mrw-1; Thu, 23 Jan 2020 06:42:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 182038010D6;
 Thu, 23 Jan 2020 11:42:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE5410016E8;
 Thu, 23 Jan 2020 11:42:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 31/80] arm/virt: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:56 +0100
Message-Id: <1579779525-20065-32-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: br9DgDl_PZS2KVDAd85Mrw-1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o4IFAcmBM/kE

memory_region_allocate_system_memory() API is going away,
so replace it with memdev allocated MemoryRegion.
The later is initialized by generic code, so board only
needs to opt in to memdev scheme by providing
  MachineClass::default_ram_id
and then map memory region provided by
  MachineState::ram_memdev

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
---
 hw/arm/virt.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f4..e2fbca3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1512,7 +1512,6 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *secure_sysmem =3D NULL;
     int n, virt_max_cpus;
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     bool firmware_loaded;
     bool aarch64 =3D true;
     bool has_ged =3D !vmc->no_ged;
@@ -1701,9 +1700,8 @@ static void machvirt_init(MachineState *machine)
         }
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
+    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
+                                machine->ram);
     if (machine->device_memory) {
         memory_region_add_subregion(sysmem, machine->device_memory->base,
                                     &machine->device_memory->mr);
@@ -2053,6 +2051,7 @@ static void virt_machine_class_init(ObjectClass *oc, =
void *data)
     hc->unplug_request =3D virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported =3D true;
     mc->auto_enable_numa_with_memhp =3D true;
+    mc->default_ram_id =3D "mach-virt.ram";
 }
=20
 static void virt_instance_init(Object *obj)
--=20
2.7.4

