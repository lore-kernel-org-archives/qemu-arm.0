Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3790420wrm;
        Sun, 20 Oct 2019 16:03:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwujhQEaBXMYMJhZL89KNoJLg+zYXsKRShFVD3SZSlI+61jVfGonREpmJOSrMUvoIGn7Jgt
X-Received: by 2002:a0c:8b5b:: with SMTP id d27mr7791833qvc.29.1571612607914;
        Sun, 20 Oct 2019 16:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571612607; cv=none;
        d=google.com; s=arc-20160816;
        b=H58/1Ogoa0uYXwWJ6PwJcLsC3oeGdquv/YN05By1dYAkmFIzQuxl5orNLPizV1dQ2E
         qfJs+cn+y3+8kHVqpD28iAygTLwwPoDLqC9PGzTglGYNd4uMSDic0KEdmBmY2wZhHUnh
         yN9alHYrpWylaDFvBv3ju385ckAEzYbToKpHHNXCiPQf/wU5J2Vl9EA8lf4UeQORX0kS
         SJLEmsk4/uxbTBFa+ptdD9waxfxlqayAFpLOEhatHUKrQHC5EivjcuXwnrIVa4A+kSaH
         CWJ7xVCaCIb1mWN2JTVTMNEeSURBdAkd0vw9q/0hdUAbHG3etZQsPWBnvA2gjWd7ir9S
         BaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8nN+Go+RSeTcnebYfeK3H4Ap4eDouNzPwOB+9HqRbY8=;
        b=PDLsPKWf4ha7UvEVEYpTwNH3Y0FHNaGGPFN3LEJrzKS8pL6bvq3sMMh+GPo1Zs+LqI
         ZMO3x3lyvMi/MfyGttf0YeGXpbAQK8Qf1eguCjFvK2k/e2idhyczbnu16lZQL/9SOI/Y
         47/kXMBOBcKz76eBZJFW8CMjYYW+vZHibC/DOaj6cyd5iXjHSUJLCq0pOXakOY3NWDvM
         D68d04go6UfCOmMn5LYGZSlrml+qtmgWDExAnDAuM9OiImDkPnlrh1/xyJVrFjDEqgi0
         g0EEiCEwJ9UFdv8z7SD7N/lX7LNyCwz5Agb1zexC7jdjbF8ONRcePcMsctvyElI9DkVC
         zrWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IWx8b6tu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si12144061qtq.258.2019.10.20.16.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IWx8b6tu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKEQ-0003iv-LI
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKDb-0003CI-Nr
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKDZ-0002Q0-5s
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:02:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20933
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKDZ-0002Pn-24
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nN+Go+RSeTcnebYfeK3H4Ap4eDouNzPwOB+9HqRbY8=;
 b=IWx8b6tuoij9LUnhsKLxnS8RgsmdTvqvNjpgxnzlXcxpMH6L2BRfCqYmwGODnbNYVmduNU
 tHAkoTRzP583MUmj0uDCHgPo7CURg7HidEmGdRXBBrOGJw2pEB6RJaTbbVYE3NbTZaeeq4
 WF9jTlE3GhPaybXFND4A9pYHbXnoYVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-FaWxuisfM2eB3mh1V5C4NQ-1; Sun, 20 Oct 2019 19:02:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84688107AD31;
 Sun, 20 Oct 2019 23:02:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97A5060C18;
 Sun, 20 Oct 2019 23:02:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 16/21] hw/lm32: Let the machine be the owner of the system
 memory
Date: Mon, 21 Oct 2019 00:56:45 +0200
Message-Id: <20191020225650.3671-17-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FaWxuisfM2eB3mh1V5C4NQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wEUHgvmg0+KO

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/lm32/lm32_boards.c | 4 ++--
 hw/lm32/milkymist.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 5ae308bfcf..50b607e0cc 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -107,7 +107,7 @@ static void lm32_evr_init(MachineState *machine)
=20
     reset_info->flash_base =3D flash_base;
=20
-    memory_region_allocate_system_memory(phys_ram, NULL, "lm32_evr.sdram",
+    memory_region_allocate_system_memory(phys_ram, machine, "lm32_evr.sdra=
m",
                                          ram_size);
     memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
=20
@@ -200,7 +200,7 @@ static void lm32_uclinux_init(MachineState *machine)
=20
     reset_info->flash_base =3D flash_base;
=20
-    memory_region_allocate_system_memory(phys_ram, NULL,
+    memory_region_allocate_system_memory(phys_ram, machine,
                                          "lm32_uclinux.sdram", ram_size);
     memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
=20
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 460d322de5..ee2eb1877e 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -116,7 +116,7 @@ milkymist_init(MachineState *machine)
=20
     cpu_lm32_set_phys_msb_ignore(env, 1);
=20
-    memory_region_allocate_system_memory(phys_sdram, NULL, "milkymist.sdra=
m",
+    memory_region_allocate_system_memory(phys_sdram, machine, "milkymist.s=
dram",
                                          sdram_size);
     memory_region_add_subregion(address_space_mem, sdram_base, phys_sdram)=
;
=20
--=20
2.21.0

