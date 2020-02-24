Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp801999lfg;
        Mon, 24 Feb 2020 13:32:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyU9m9bZ47NmHpqLUfHbM1+ZwYmYY0dU8i27ldNGrn2vw1HRYiCYCBbRXkM7gChedJ+SJf1
X-Received: by 2002:ac8:7103:: with SMTP id z3mr50469390qto.172.1582579929107;
        Mon, 24 Feb 2020 13:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579929; cv=none;
        d=google.com; s=arc-20160816;
        b=OCSisITvyUJAowRr+qG22mmXsYiPzDLmno/GyDslS2+KbBM4CbPllomEOHZN1JdaE5
         emYyg8386cyFoyvuMfp9X95aUNxAw6UL8IjClRDilTCygvqKjTGpSZNPzR+nAYl/lD40
         eaObhNsNO2aEdcGcAKzYzdptlmvw/fOerUEQDIcepXQt27pziQ9FTFS2lHdmbE++rwLP
         IAaWSFRqDsvF1vWKippbrHYlsStc2fkBDBAa1iWAAaJXWRWDQouJ1vHby8MCgnzzvUzA
         /BLn+ZBEvx3sQoSdDBuWS8HG+b9X+apw+Y1Jk+9zDVZJWAOr23cd3riCCwpsfL9GjDGS
         DsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P3w8ivNIF4UpJrLwaBVmXn62pv0y3fxnEFqqunnHBT8=;
        b=nvb7HAtH/ZddShcpiHG/eZIndy84hmEEDIvh4uvIBMeVYan8I4SwJ6N5ukzILrIGHX
         Hmzvu2bPmBL40ZLhtayG4a/5CAxNtkoWaE4xVflhc/WuP3lNER0BJmEeh/YuKbAUPa4+
         0Rv9shlrT24hNXm0IwiBgO4mjTKs6V6Qx7vu8XJtvdtboNCPI/v5i2mmmEfb1aURKMib
         iZJpfrEB9KBfqph38pSeXMbxFhI7LI7YxE2zzxe+q61spJvu7oQvWMEycaTLLTopYy1C
         DksyyRj2OdG5ApzNkzGi+uXrGGBi8Oj3dx8Z0IDBiqsuxTzCnq3AFC7PBNuabiJQ/OV+
         7Egw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g+gOxBA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si4812957qko.16.2020.02.24.13.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g+gOxBA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LKi-0000py-Gx
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Koe-0002kn-2E
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kod-0005SV-0I
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:58:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23622
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Koc-0005Rv-Qo
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3w8ivNIF4UpJrLwaBVmXn62pv0y3fxnEFqqunnHBT8=;
 b=g+gOxBA+vuocRT5jXP0K3LzBfzLr9iY+7sXZB2HNy/CV/70D8xokdF2odCHE1Y43kOR/k3
 WJ+f3DheJMI07+mE+VB7A4RDj1a2zM158KpBLlDY0s+onrKz3q1I4DDpNnrv5Iokd/BFBR
 NQ9eW7BV5rhkq3m6EJYm86o35oh3ykA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-dY66F7eDPRuLuatE5Zg2QQ-1; Mon, 24 Feb 2020 15:58:56 -0500
X-MC-Unique: dY66F7eDPRuLuatE5Zg2QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7DA91005512;
 Mon, 24 Feb 2020 20:58:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD7EE5C651;
 Mon, 24 Feb 2020 20:58:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 12/32] hw/riscv: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:13 +0100
Message-Id: <20200224205533.23798-13-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Do9nL1LETYPB

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/riscv/sifive_e.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 8a6b0348df..6f6360a619 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -208,9 +208,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
=20
     /* Flash memory */
-    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
-        memmap[SIFIVE_E_XIP].size, &error_fatal);
-    memory_region_set_readonly(&s->xip_mem, true);
+    memory_region_init_rom(&s->xip_mem, NULL, "riscv.sifive.e.xip",
+                           memmap[SIFIVE_E_XIP].size, &error_fatal);
     memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
         &s->xip_mem);
 }
--=20
2.21.1

