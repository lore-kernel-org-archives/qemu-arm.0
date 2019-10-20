Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3787073wrm;
        Sun, 20 Oct 2019 15:59:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRQp7JhtpLfL0HC3TJT526V/OlqoW7CWFpxb9HTqobrWgOo1bsvxtFj224ZXsOquRu4I2/
X-Received: by 2002:a05:620a:905:: with SMTP id v5mr18128211qkv.373.1571612379720;
        Sun, 20 Oct 2019 15:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571612379; cv=none;
        d=google.com; s=arc-20160816;
        b=ge1GtpuXyLnH0vyVosZeJ9cR54kDm/Xj5Lo2iyeBNfRqB2My1nhw8g210A42aQ+tvB
         L1eFQod5bSbm2exPYVmHS+bKgPDGztfiJ3lNBVyD+9tnVpaNB2x7u8p+x68gVnEas5cg
         XrTcEDQHT+yopkGUK4R4ool0bQPZyoAkILKwjS7V1W3xHIQGxf3PIWSMp+irb2C5tUY0
         0XwFy/Er88plbZ+1rAjp+Y+ScT9UlQ2IrpO9AXEpCvxyjMLO7h8E+sQK7GDy9qQuhlIE
         +nap2k8paz3r7xhn0V0BPcAyX/q4tGJqZ4xPxvbeBgtsLnllF74oG+yQk0pMywZ6jSkb
         IeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9kM0ZnwOs54aW1Vd94/zbuy9tIm0oHWHTjl2ZmeUSXo=;
        b=UM9sLNAn1BcNGEXvumjArjyQYx9TQSbhpYlWJFqmGnwvvEpuxasqRSFQ8lfPFgfhvc
         BPo3Ym0d447rogRcae8ZUaug4X7eMXjB3QF4DYPWpnmwE8EkQVmCYNNDIT9aeNR3cJz8
         q3F/AOUsbap7c2OR+wKKzO+dSdOvwhbGBWlB55x2dCb2Lv3skOsDKsIIOT4OZb3M8/0j
         DMmOIzH4QfHheYAuaYehYfZORJNZM11DYL3yMq1Wv4yQdq+45rmGZzdw0rdtRW+sXNox
         KyeC1sit1NAoId/RGzY5lABKsPL5MCzJWS4XlxkwAYSmweDI9O+7/l+bjF+vPmLbAhDI
         MkbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nvy9BnOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 55si6397623qts.279.2019.10.20.15.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 15:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nvy9BnOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKAk-0000Wf-R8
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 18:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKAU-0000S5-90
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKAT-00013c-5Z
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:59:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKAT-00013C-1a
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kM0ZnwOs54aW1Vd94/zbuy9tIm0oHWHTjl2ZmeUSXo=;
 b=Nvy9BnOF9t2nxqSc/d8xi3UdUqQlX2JXQQFkxHvLzTJEOViG6AUDAP0pFXigMgHVkEf71l
 LX3d9fJqgZwIeJdLTtYUk0KUT7AgAxdYgNrgK9iM10y4yxsK6zKkX/0NMILb4pPg6uNk92
 tugVSpSyKBOY/+3NM2hwtyaRnSkkNcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-gaImeOBIP5mikDC8J_QeaQ-1; Sun, 20 Oct 2019 18:59:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76584107AD31;
 Sun, 20 Oct 2019 22:59:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFD760C18;
 Sun, 20 Oct 2019 22:58:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 06/21] hw/arm/digic4: Inline digic4_board_setup_ram() function
Date: Mon, 21 Oct 2019 00:56:35 +0200
Message-Id: <20191020225650.3671-7-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gaImeOBIP5mikDC8J_QeaQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: HK54g6eTjqWr

Having the RAM creation code in a separate function is not
very helpful. Move this code directly inside the board_init()
function, this will later allow the board to have the QOM
ownership of the RAM.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/digic_boards.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 304e4d1a29..ef3fc2b6a5 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -53,12 +53,6 @@ typedef struct DigicBoard {
     const char *rom1_def_filename;
 } DigicBoard;
=20
-static void digic4_board_setup_ram(DigicBoardState *s, hwaddr ram_size)
-{
-    memory_region_allocate_system_memory(&s->ram, NULL, "ram", ram_size);
-    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
-}
-
 static void digic4_board_init(DigicBoard *board)
 {
     Error *err =3D NULL;
@@ -72,7 +66,8 @@ static void digic4_board_init(DigicBoard *board)
         exit(1);
     }
=20
-    digic4_board_setup_ram(s, board->ram_size);
+    memory_region_allocate_system_memory(&s->ram, NULL, "ram", board->ram_=
size);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
=20
     if (board->add_rom0) {
         board->add_rom0(s, DIGIC4_ROM0_BASE, board->rom0_def_filename);
--=20
2.21.0

