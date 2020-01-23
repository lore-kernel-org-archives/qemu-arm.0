Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp558352lfp;
        Thu, 23 Jan 2020 03:54:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqy6mH7STwWOWLgb8SrYO4zVjXhSFhGSsvMIAzeKjfgpZVhJUvCx/GlFvIL+erbvnqmQbpgT
X-Received: by 2002:aed:304e:: with SMTP id 72mr15335455qte.113.1579780495493;
        Thu, 23 Jan 2020 03:54:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780495; cv=none;
        d=google.com; s=arc-20160816;
        b=phVcn0rAHbKwr6ZsjBXB5YnWrzhyVAjM7VHvGLIE9ZUiBnsnakM0kopM+9j8VJ+SiN
         k3h9t084Wojae1MJ9XvAEUnOLKblemgT+IaK0iRk/wJV6l+E5r1nS3AnhRyu3Q4iAVUx
         bpzPZ7pQuqZv8xmHPV9zsR2E7FM5Z+qN5nKLZAnF4jrca2+fGP/qyQNO85+0JYYjhFtf
         cri5KsiBtxzMeqr8HTBKaWZp9n82xAVqVw3LKAiB4oK7Ge8iPRmjAIioivAfwIq8w7xO
         HU+6Wh5XHc/gOOFZ/6qj200fTIwmhqNb8ZNoc7WCmLIRksHkaVpNeRgLkcF26Iqh4lb2
         J65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H6yPGedwPZJHkoGitXSsrKhGgvtgF2cct2LVHl7Satc=;
        b=TSsF7fflURdTEVSkxELgmuE4yUOzQtzd8Xs69rL2FJCfZFkbHm1wrTcR/mRdGYevVg
         ZS0/NFvFzqbHsIU7JhYIIybpnCPT0fEOOunAvK/K2IFHXFjuR0GNPVOwXOwmXtITPse9
         nm3V2bSgde/5gHjOLQTZrEZ9+MTpaMumxaMA6Bv42TAkjlgRmdOCCQJiDVhp4bvr9PiY
         FZWSmjiLb1pbjcvZAFtzL8UqwHFLr12PIMmwbVYOLb0d/QgzfE/XpcOPBGhWoJoNM5B1
         4k5DGezzFhUVoFGIp+g8KNrp+2Gxg8sTq7aeDMug//JrLpJtHz3ImZd3LYqIPkWJ1R9M
         EryA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aMvtZ2UR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a203si1378572qkg.311.2020.01.23.03.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:54:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aMvtZ2UR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub4Y-0003j2-7q
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34867)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarV-00057r-RX
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuarU-0003vD-5m
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:25 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47283
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuarU-0003ul-1j
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6yPGedwPZJHkoGitXSsrKhGgvtgF2cct2LVHl7Satc=;
 b=aMvtZ2URp4DEDb7idff2dR9myY2kQb9Yy+X/tL45a7rMXGOWhKwbW/Dm2o0Ncrd7T4x4yB
 3u3fsoEiGRPlw4PXp1eMCOXJQgwxJfJMCSEsVs9HObFjIfoR5wotri3ZOedvVUD8hkukaG
 wMbu8HcLVg5033ik4gamjsAJVPv51xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-Dg9IJNvUOCC3iP2AEUMKvQ-1; Thu, 23 Jan 2020 06:41:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1B2610120A3;
 Thu, 23 Jan 2020 11:41:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE6B100164D;
 Thu, 23 Jan 2020 11:41:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 08/80] arm/aspeed: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:33 +0100
Message-Id: <1579779525-20065-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Dg9IJNvUOCC3iP2AEUMKvQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mAgWfeD8Ahi/

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
CC: clg@kaod.org
CC: peter.maydell@linaro.org
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: qemu-arm@nongnu.org
---
 hw/arm/aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c8573e5..7b956f9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -35,7 +35,6 @@ static struct arm_boot_info aspeed_board_binfo =3D {
 struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram_container;
-    MemoryRegion ram;
     MemoryRegion max_ram;
 };
=20
@@ -184,6 +183,7 @@ static void aspeed_machine_init(MachineState *machine)
=20
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
                        UINT32_MAX);
+    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
=20
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
                             (sizeof(bmc->soc)), amc->soc_name, &error_abor=
t,
@@ -219,8 +219,6 @@ static void aspeed_machine_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
-    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size)=
;
-    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_SDRAM],
                                 &bmc->ram_container);
@@ -397,6 +395,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
+    mc->default_ram_id =3D "ram";
 }
=20
 static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data=
)
--=20
2.7.4

