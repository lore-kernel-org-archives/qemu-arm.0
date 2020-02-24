Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp808596lfg;
        Mon, 24 Feb 2020 13:40:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2poccwITLwWEpk+wocUbOgkRFyvxiJ/Mt1ZpmqUrUSXIdflI2CnDW9Jb2vb8TR7cnP3QB
X-Received: by 2002:a37:816:: with SMTP id 22mr52031674qki.455.1582580458548;
        Mon, 24 Feb 2020 13:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580458; cv=none;
        d=google.com; s=arc-20160816;
        b=oBoIebulx2dOB+zABVN1ta7KhwTUAzhcCYqzeugR55bsGBcDLsNacJvxpKsxqh2hDt
         fdp2vX4xAAz3UIez605kmhVzqHHGcxot0hm7w8/u9sOmpL00X47I3HlX3LfewA8B08R5
         Puawn+OJ6TkX4cNA5WmX6ylciZn3FW369GfcIphFRlcNpdkItO2mJYaviM/FmIUpbZlk
         sTdDTdPA1JJ31vwQz5aGL3vFUqJm1JKPT1x+DwZbPJaFu1ZpkF28O0LFge1WJh0FrD9A
         Y8QUEzdN4YDPWlnjm6K7ZU2i9l4gkmZArO1kaC///6lxAQXpiiAu2nI8BOLY0kS4B1wY
         czcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XVZvi/YHzEh7ylVqPr697ez8p22nG0yVmTeif46TOmw=;
        b=wE8m/hLORo7Gc36c0wBWAAZQ6qriNyVDgFLHgDlW6D1ACPToxJAS854qbrdAR/j36y
         S2eR/XTWqZmpW/dMnHTRKkRZhFkBH5qpEo6zBT9yZf8lUzqLJF8V2bP65yUZCSQiAQ+E
         e078+IpOgzF2kbvelM+M/iFYjeAFrGhKJXHJeZDHjGgZ5Af0JcEgW35jd4/wJn2yYvu7
         1OaZYPHmPZwHZoLm6MQwEHajHLuIyjlr7zN+UvKgqfB9Yu0isPzFIHLuMGDZ6UYDYMKw
         +mom3g+RdQKBKT4toRw1imeZjQ5b3883Jj3hIO0/Na7VcmRVtM9cDvFe7bRNGvZa6JTn
         TN0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GVjEjLkS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si5908624qvl.43.2020.02.24.13.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GVjEjLkS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LTF-0008A3-TQ
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Ksa-0000rq-GJ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:03:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KsZ-0008Mz-Dy
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:03:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60004
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KsZ-0008MZ-90
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVZvi/YHzEh7ylVqPr697ez8p22nG0yVmTeif46TOmw=;
 b=GVjEjLkSAYax+3SkaKU2LD9cbg01D2jhmPn6OfR/bnaodN/XqFt6hVkpR8QuPNJOBRjNeU
 iWHap0aqrI4e7hvzTvuzWGKqbn6ihNuYwFHOhICD3U1eC9SS6JaIPjwvtuzqiaUnSodmFX
 DYxMUb13tXRORZBr15voWVapBslYz1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-v-AiIWesPt2X2quRXpPcbw-1; Mon, 24 Feb 2020 16:03:01 -0500
X-MC-Unique: v-AiIWesPt2X2quRXpPcbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9C21801E6C;
 Mon, 24 Feb 2020 21:02:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CEBA5C21B;
 Mon, 24 Feb 2020 21:02:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH RESEND v2 31/32] hw/net/milkymist-minimac2: Let devices
 own the MemoryRegion they create
Date: Mon, 24 Feb 2020 21:55:32 +0100
Message-Id: <20200224205533.23798-32-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: XqtYQX22M6KU

Avoid orphan memory regions being added in the /unattached QOM
container.

Note this change break the migration of the LM32 milkymist machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/milkymist-minimac2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 1ba01754ee..9582b5f8a3 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -473,9 +473,9 @@ static void milkymist_minimac2_realize(DeviceState *dev=
, Error **errp)
     sysbus_init_mmio(sbd, &s->regs_region);
=20
     /* register buffers memory */
-    memory_region_init_ram_nomigrate(&s->buffers, OBJECT(dev), "milkymist-=
minimac2.buffers",
+    memory_region_init_ram(&s->buffers, OBJECT(dev),
+                           "milkymist-minimac2.buffers",
                            buffers_size, &error_fatal);
-    vmstate_register_ram_global(&s->buffers);
     s->rx0_buf =3D memory_region_get_ram_ptr(&s->buffers);
     s->rx1_buf =3D s->rx0_buf + MINIMAC2_BUFFER_SIZE;
     s->tx_buf =3D s->rx1_buf + MINIMAC2_BUFFER_SIZE;
@@ -506,8 +506,8 @@ static const VMStateDescription vmstate_milkymist_minim=
ac2_mdio =3D {
=20
 static const VMStateDescription vmstate_milkymist_minimac2 =3D {
     .name =3D "milkymist-minimac2",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, MilkymistMinimac2State, R_MAX),
         VMSTATE_UINT16_ARRAY(phy_regs, MilkymistMinimac2State, R_PHY_MAX),
--=20
2.21.1

