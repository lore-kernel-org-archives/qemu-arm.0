Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3795946wrm;
        Sun, 20 Oct 2019 16:10:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlZ6Lv532H4zVH1PmMQpcrOxRA8n5ESSNmMju2rZKi2vJJi+ue3NdYA0jyOWN4pDe3U3go
X-Received: by 2002:a05:620a:627:: with SMTP id 7mr9612343qkv.322.1571613016254;
        Sun, 20 Oct 2019 16:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571613016; cv=none;
        d=google.com; s=arc-20160816;
        b=IvcNn83sHabUDvPyco8/YbqcKXRKJERQywdttkf2j8repwxAolbkc1d01isbkqYoER
         k82jU1xU+aD2GBrPD1PBW6L1/eL0Eh1aVSVQtlXt/zn7pnJLzaCrFA4OHQusnf+wp+dO
         9OpIyvc+sKux98n4C2TqnLN+Rmai3UYjvPFwO8FpUM5fP4HfN2kHlURNxoZYosFye25W
         sNz+65t0mDVf+iT/BBzq/qz1Ga7j3k/5vSQGudbG30zm7Nu0h7m/FRuFNre+oQS684kI
         h7GcZCgu4pcO5otvl4NJvE1BcqCRDumq9/HlAYSLd7b8COfnG7tsFqSJM74ZN5bUhFXW
         RsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oJns0xteOCGMi06yvZdYLF3R/VWIFKcbGV5jx0ClKro=;
        b=qWIqmvtrPNUU1lzyNr5I+2MopLB8fCNUFfLCD2sWNpTle3Bx2BVkYF0eruca9sJAYx
         77gkjR9w6Sr6vO8PooWK5jvtQfbFOaIjwtE0783jIM2QcbbxAIJA+UxtIF/KPUK3VvJE
         0GYLUvQVNbf+2ohR/rrkY4Ae0Ik8i9cuY1v1j4IdKa7+kwx+0qW1XZHNyegbg3N0mF//
         Rw1/7qDNCErozbSCsGBZL4ynEefVzWPlAbeIgm50AV96qusNbt0YEko6CaIlI3zS2NG7
         C2bgK96c8+60w8I3uDktsh5PyWwSKWBG+79bQdaydaREV0NA2hN/TD2m5787tQLwVdfe
         Bndg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UPIWQCRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c48si3581709qta.348.2019.10.20.16.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UPIWQCRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKL1-0001yN-CU
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKD0-0002Ot-7R
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:01:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKCz-00029Y-0r
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:01:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57288
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKCy-00029I-TF
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJns0xteOCGMi06yvZdYLF3R/VWIFKcbGV5jx0ClKro=;
 b=UPIWQCRL1/ZPSpNnAi9ODqZn5gJbaUR8EFh200KIsdYzwd5cWFIcROPlmSnK+Q3iCJGUDA
 c89bNYTEpG8qiAcVO3spdafx7wpUWzpZvM2kFRJ0Oj0psxSARk/tMoYa2c3cyewSfuSuUQ
 kLS4lMX6Qgj2JX94ZJMHkFVAWAU8GAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-yEmcAGV6Na2E9zoDVAEETA-1; Sun, 20 Oct 2019 19:01:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F03731005509;
 Sun, 20 Oct 2019 23:01:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4EB60C18;
 Sun, 20 Oct 2019 23:01:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 14/21] hw/hppa: Let the machine be the owner of the system
 memory
Date: Mon, 21 Oct 2019 00:56:43 +0200
Message-Id: <20191020225650.3671-15-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: yEmcAGV6Na2E9zoDVAEETA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: 4W3ZWhdj1aCi

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/hppa/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index dbe1ff0fe5..6703bfd351 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -96,7 +96,7 @@ static void machine_hppa_init(MachineState *machine)
=20
     /* Main memory region. */
     ram_region =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(ram_region, NULL,
+    memory_region_allocate_system_memory(ram_region, machine,
                                          "ram", ram_size);
     memory_region_add_subregion(addr_space, 0, ram_region);
=20
--=20
2.21.0

