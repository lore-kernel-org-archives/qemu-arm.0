Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp800131lfg;
        Mon, 24 Feb 2020 13:30:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVLPSIHgBJ8ynHXjKNKeVFamXMsfFwGR2qn0d5O3oXb/5kSpnLAeRFxGD5cQ3D79WgTUwQ
X-Received: by 2002:ac8:5154:: with SMTP id h20mr51347682qtn.43.1582579802839;
        Mon, 24 Feb 2020 13:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579802; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLzX3nkZOYn1bx8QaQJJFoXzZzMAfZxeD5SV5F+MVv2hSgC8i5cOsn+3YFDW9IIjcS
         ahskS8pcv/BeoOqGjsrX8CCYsEgihqJclsikfNqHpofBXVteMVOyE0FpFsJ4fOLEhRRF
         u3CGN81bbFkXZLgt17JgJPEPm+QMLtk9nL4xt1/lmEqMcL9vqGnR4iGXsLWnRcEGykL6
         WL8mF/+oKut5Ujs4lCvy8CuTxsI/d0Ij6m6lPz1XuAW77mu1V0nnD+3FzXkepjgnhkEd
         xo3hbz1NBcv6bqgKoYcKXCggFss9QqxIa/0D3l9jUh96hpDXc8FTzfhw24MoiH8imMlp
         FgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1VSR9kygTTReaCRIBAeG2Orj1G8eqxnIXlzuyJCEoZ4=;
        b=VjGoUDjmZFaJWfcT8uJgC3k19TYUXceQOq2yClbyp3fmaC4QGj9n0h09IPvlnZm0P1
         XlZtR3EWtqeAXYSYHJnbkqrXSHhEDz/4Z8Rq4DQqMmAvb2+NhBABQl8mv79Q+XGNx3q2
         2YxdrzIvNZDOVurEsJYjLdRuiaGVhGk9KXF5C5i45tLDh0jTzuetj0JEuLBBul37LGXN
         2ib34tyR7KylSuJUxVk3hFzfTnW7W/4gvKPBkxRuFNx7CCE4aLcVS/uhnQPEZqaNLeNx
         +xf/ecCCnMyBYtoLCIEktQSHj7ew/YMXosWEZi+vT9QRNaUei7I8wcKYVmrJMpnZtcFv
         O6Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B2X1L++B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si6237490qtd.283.2020.02.24.13.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B2X1L++B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LIg-00050Z-9h
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KrY-0007CT-Uc
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:02:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KrX-0007fs-RV
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:02:00 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49945
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KrX-0007fS-LX
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1VSR9kygTTReaCRIBAeG2Orj1G8eqxnIXlzuyJCEoZ4=;
 b=B2X1L++BEQctj/a4pfjIJO48EcV4w20W0dzyZlZ2z/DmSnifSgq5+pqcuSnz3Q5vZk6vgE
 en/UUDK2rikn5RFc7eSsrBChfkiVB6NnSoj+8wlazYW38J/QtVgi9NUKSbKXZ4KkboGLqJ
 mt4UVypmOP1cO6MYfeC32oUu/WEN8DA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-KtlOQdrDNIqNkAe5mYpYMw-1; Mon, 24 Feb 2020 16:01:55 -0500
X-MC-Unique: KtlOQdrDNIqNkAe5mYpYMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F682800D50;
 Mon, 24 Feb 2020 21:01:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8005C297;
 Mon, 24 Feb 2020 21:01:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 26/32] hw/display: Let devices own the MemoryRegion
 they create
Date: Mon, 24 Feb 2020 21:55:27 +0100
Message-Id: <20200224205533.23798-27-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Xlr/qSjkgq6

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/g364fb.c | 3 ++-
 hw/display/macfb.c  | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 55185c95c6..adcba96e34 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -477,7 +477,8 @@ static void g364fb_init(DeviceState *dev, G364State *s)
=20
     s->con =3D graphic_console_init(dev, 0, &g364fb_ops, s);
=20
-    memory_region_init_io(&s->mem_ctrl, NULL, &g364fb_ctrl_ops, s, "ctrl",=
 0x180000);
+    memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &g364fb_ctrl_ops, s,
+                          "ctrl", 0x180000);
     memory_region_init_ram_ptr(&s->mem_vram, NULL, "vram",
                                s->vram_size, s->vram);
     vmstate_register_ram(&s->mem_vram, dev);
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 8bff16d535..b68faff4bb 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -362,8 +362,8 @@ static void macfb_common_realize(DeviceState *dev, Macf=
bState *s, Error **errp)
         return;
     }
=20
-    memory_region_init_io(&s->mem_ctrl, NULL, &macfb_ctrl_ops, s, "macfb-c=
trl",
-                          0x1000);
+    memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
+                          "macfb-ctrl", 0x1000);
=20
     memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram"=
,
                                      MACFB_VRAM_SIZE, errp);
--=20
2.21.1

