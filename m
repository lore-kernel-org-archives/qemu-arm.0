Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp812351lfg;
        Mon, 24 Feb 2020 13:46:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4GqAOJjzJbyP7gZuFJ3b2HUY4w2BSwn5nd9/IWn6ugpqqTKRUf8OApiMJRyRik8nGHoSd
X-Received: by 2002:ac8:33f8:: with SMTP id d53mr49675035qtb.86.1582580763696;
        Mon, 24 Feb 2020 13:46:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580763; cv=none;
        d=google.com; s=arc-20160816;
        b=TwgT+4pmSgNbSLzc7r9F/hCV/820W39C5Tf13WqSs7W4TThPXORkeHbSt+/lbO/3kE
         hpXAeYOVKZ11FXA4oNEPPcJiEKiABL4J1a0Ryp2KNIr9apyAIId05lyB7GjS7kaKeceo
         6OigoeBfQq3iDIHwMMrDFNOjgXxELKJI6K77W3PcbeOdnVGUn6oZPN8Wmso/1k4JxQ1r
         DkNmF0jZALbPY0cygWErIJmzZvZ6EbWNTQwBufrpBxOTjpFWOmPZ5K6cl3LwferX/P/7
         kyr9q9E4a6o8HqMCEBx/Y/mw2D2CnjSDQbxDj8jonEr43+TqCs7AyL9+kXUVZWQsNUQp
         TPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d82MUeKk+/4B02rjdl6yI9CuL1FxqpOnif29vr+0CBA=;
        b=TjQDaP9oaAp418n3z7CrLkaQJ9bnqwyNr6jisNz1mLhf4OL+xUrU7LY8+CLYA1qX+U
         M+VNXq6oGWYWUI4D5RBm6+35BP5aAyTlL2/be2qmweb1SZDuarp6my8MeMR81+UzWOb+
         FP7lq1n5YYDIiQnmP4w8L+t/rliCai+8sjS3+Mhb1vXV1Jc/HExjU6nMJeukKhPlWYRd
         AShQ/L3rXOBrht9XQKqe2xhTK+bheBEHozGExy8iUfC8WTkNAB7vex+nOsygVWx66buA
         xGAc4gPTzTw6yQ29PGK6DPJVnJtAO/o8ITgLdODqqF3PhmSeLN6+0Ohn2LSdCZEm0Hti
         aowg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XCWLZKaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si6446050qtn.378.2020.02.24.13.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:46:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XCWLZKaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LYB-0008US-31
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KrO-0006zg-2B
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:01:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KrM-0007Xi-SI
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:01:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52727
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KrM-0007W5-Ib
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d82MUeKk+/4B02rjdl6yI9CuL1FxqpOnif29vr+0CBA=;
 b=XCWLZKaaeOk/lAcvUL2fZQSXiRaMHsKj4eG2GR2WAdb5N4+YocVZFkya8NbIDuepZX1RlR
 3faClZixKRIWybCvl3u5kku6CYfdAvjvpRtHMfT3me+p95qOsPKMIC94fuD8/dE6I6E1xP
 Q0oaluHA9Ou86BgKhIXWtBOwdbi//Bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-B2jLMgkmPbOAS-FuawXTqw-1; Mon, 24 Feb 2020 16:01:45 -0500
X-MC-Unique: B2jLMgkmPbOAS-FuawXTqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09EEB1005512;
 Mon, 24 Feb 2020 21:01:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 588485C54A;
 Mon, 24 Feb 2020 21:01:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 25/32] hw/core: Let devices own the MemoryRegion
 they create
Date: Mon, 24 Feb 2020 21:55:26 +0100
Message-Id: <20200224205533.23798-26-philmd@redhat.com>
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
X-TUID: fPk9GmidwFuE

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/platform-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 22c5f76dd0..d494e5cec1 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -187,7 +187,8 @@ static void platform_bus_realize(DeviceState *dev, Erro=
r **errp)
     d =3D SYS_BUS_DEVICE(dev);
     pbus =3D PLATFORM_BUS_DEVICE(dev);
=20
-    memory_region_init(&pbus->mmio, NULL, "platform bus", pbus->mmio_size)=
;
+    memory_region_init(&pbus->mmio, OBJECT(dev), "platform bus",
+                       pbus->mmio_size);
     sysbus_init_mmio(d, &pbus->mmio);
=20
     pbus->used_irqs =3D bitmap_new(pbus->num_irqs);
--=20
2.21.1

