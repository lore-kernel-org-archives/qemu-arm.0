Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2316091lff;
        Sat, 14 Dec 2019 07:57:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCCQcwIWH4SFZVN9e7QNswjTWWWHNaMXlp3G4PtpG4SL/jEk3aVy2eLYkNBxSMlr3Nh6mW
X-Received: by 2002:a9d:578a:: with SMTP id q10mr20422790oth.215.1576339035277;
        Sat, 14 Dec 2019 07:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576339035; cv=none;
        d=google.com; s=arc-20160816;
        b=LMKpPnQCsmbgJ3XQyzbfULN8XcZyebXS+dt1KnlVjtjeNQ6MEMzBpZ8axz8uqXaDiQ
         u5UW35pvwHTh1r4GW+M2WEAvCY3Q1l8lF6FTe4tPYCOtxYvhUpBboMWhK9lzcvRC4Xbo
         JrHfk9mlorc+j4U0CvwQZWjf40iLGEFemiaF2wcZwFTyhxPtdguc6Ypyaaqb5rShVBrY
         EzAC0zTpZJSNbOEpxMGaobI8t46+MgogM0HgmxR8zRHaTnMwI5WEdW6vBjbXcJLEVJ66
         ThbCJpW3sTRuAm1MqAkKEgzQ3KJ0FKcTH7J3YoYiOAKbc/RyHRGKf85a50GTYZgoAxU9
         U9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Os44yYqV4Qf/DGZHPDswJ/Ob+mUvkJTnaZl2qxMI8rM=;
        b=RJX7IGNyRHru9xUyLtTXCVUxZ+n/t9n1DCf9fmO5zG4WH5YQ5R9pm0plL1VlmUrv56
         YiN1RW4RvZRO1WcNpju8oBxdybZ7/BqMf2M8sqNf3RmK9uAN8y80sLS5wGsWaqdsM5hF
         nBJDlCYTJcd6PGLTMamtr7cvm6bD/ZdFZ5ODTo2Ckgl0zKcpdI7WfiYCPVat8n5yetrM
         Dt8F+GZTNEiUSh2ArRuhDvvEYiqlVPxj8xu/ydP0BUsLYJipevfOndJghk8ZfDVbO+UA
         KxyBAqR8YXZMaw7eNsSIJoKQLZD7XvrJgOPgdik1F8JMqJyer22abAiwWDuEDyeXhEDQ
         a7PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KGP3wgoE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a205si7330504oii.95.2019.12.14.07.57.15;
        Sat, 14 Dec 2019 07:57:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KGP3wgoE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfLNP5O (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 10:57:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47538 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725900AbfLNP5O (ORCPT
        <rfc822;kvm@vger.kernel.org>); Sat, 14 Dec 2019 10:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576339032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Os44yYqV4Qf/DGZHPDswJ/Ob+mUvkJTnaZl2qxMI8rM=;
        b=KGP3wgoEvvmp3AE87xjEmKV+IsRKcbJHi1WKTKrtUqiYkAWGfUVhE4kITZIKvvIW7YC0Rr
        7DUtxxDmJVKj1TE+dyH0laSOTUZBsMZur7SGXkEl4MVrE0kdFBV2pYAv4rA7V0+OCGjNei
        LdWj4kvUIrbJvgqlWMEvsK//fxhHbu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-BFIqEERuN2SIx64E6tImNQ-1; Sat, 14 Dec 2019 10:57:11 -0500
X-MC-Unique: BFIqEERuN2SIx64E6tImNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB26107ACC4;
        Sat, 14 Dec 2019 15:57:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E3EC45D6A7;
        Sat, 14 Dec 2019 15:56:47 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/8] hw/arm/raspi: Use memory_region_add_subregion() when priority is 0
Date:   Sat, 14 Dec 2019 16:56:08 +0100
Message-Id: <20191214155614.19004-3-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
References: <20191214155614.19004-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dgHS04gZxWcU

It is pointless to overlap a memory subregion with priority 0.
Use the simpler memory_region_add_subregion() function.

This patch was produced with the following spatch script:

    @@
    expression region;
    expression offset;
    expression subregion;
    @@
    -memory_region_add_subregion_overlap(region, offset, subregion, 0)
    +memory_region_add_subregion(region, offset, subregion)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/bcm2835_peripherals.c | 4 ++--
 hw/arm/raspi.c               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 17207ae07e..f792bd6bb1 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -160,8 +160,8 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
     for (n =3D 0; n < 4; n++) {
         memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
                                  "bcm2835-gpu-ram-alias[*]", ram, 0, ram=
_size);
-        memory_region_add_subregion_overlap(&s->gpu_bus_mr, (hwaddr)n <<=
 30,
-                                            &s->ram_alias[n], 0);
+        memory_region_add_subregion(&s->gpu_bus_mr, (hwaddr)n << 30,
+                                    &s->ram_alias[n]);
     }
=20
     /* Interrupt Controller */
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 6a510aafc1..3649b75449 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -187,7 +187,7 @@ static void raspi_init(MachineState *machine, int ver=
sion)
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram"=
,
                                          machine->ram_size);
     /* FIXME: Remove when we have custom CPU address space support */
-    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram,=
 0);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
=20
     /* Setup the SOC */
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ra=
m),
--=20
2.21.0
