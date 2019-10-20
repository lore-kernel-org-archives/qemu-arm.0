Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3786578wrm;
        Sun, 20 Oct 2019 15:58:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUeg2AvY/1zntBDxitOAciXjXrjwrTnoN3uTibp5b2dF5wiWd2fYvI9H5aQcJShoHMPKqm
X-Received: by 2002:ae9:e50e:: with SMTP id w14mr20358130qkf.389.1571612327263;
        Sun, 20 Oct 2019 15:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571612327; cv=none;
        d=google.com; s=arc-20160816;
        b=btOWBvSJHp62Hv+ZpcijdxrMdL4BwX1CB+DvmJiC3VRRqEDLxGT5p6efNjD0AlX8MV
         JK0vwbSJmGF1nJAPcv43XQIxjdMhHYHHfe+TTXHWZZm2iYWbh2Bxbp01wNrJlpFWcH2f
         5yt4AMrzS0wlQRA9Eb94Fh3vRYXL3cGr6NnUZhj1dzRq7mQvTDBV98K7+C7+TH9Ja8mZ
         JK/fMpFTZdC4SQBzv4/b5hbPtRIpM0AYTwDA+H8P20P/0bCOBIS3U9/OMcNr5ectreu0
         ead8zYvNOw2n8rL9VVgZWysEjkdNd5XlaU8j1+ihgKMJYqLkRWGuS8fdCPg8MPGs6As+
         ywmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HKUywiLzAmwUUS3Ko1h1jc3EGAJrhz3L5AmjE57NQ9I=;
        b=Ogq8IqqFNJCGBIAVKHrUR5OUNgm45oKbkxkT2Tc7gJT0+trkR+A11HjHuAo1SDaIy1
         iCWzMuumWsUeHV5f3YJtopbc1EoQDHR77HzHZ/XNeEMFp/JN250Izo7Wuv+1Ius0aqAN
         tGHuvwjovlReSpDQrLkP2SNHalzbTnu+uZuIq3p4ZRvMdsLNrXvVUgKr9GLD9NniS0Xt
         84ShWpd4RrW0KylXGKLGdLB2f+o9RAS1iGVke+jg6Llw+cTLjnscnW4dz4sGQ9KT26BY
         gAPRo75Sno9mXowEGsTS0mcRpRwnJKGW20OtnOHTpTy4GP9po/xoGXyx04+lYGIuwOjY
         17vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Xu/BvkDr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si13602135qkb.282.2019.10.20.15.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 15:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Xu/BvkDr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMK9u-0007g7-4i
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 18:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMK9H-0007Ah-JM
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMK9F-0000ar-Be
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:58:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32369
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMK9D-0000Zh-Ov
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKUywiLzAmwUUS3Ko1h1jc3EGAJrhz3L5AmjE57NQ9I=;
 b=Xu/BvkDr9no3sJSQs9u1+MqiSoIgBnf9a1a7hmqz6N/UPnya/5uQt/D4nXNrw7ElZusu5Q
 6BTHlFh20vDLzl9goebBfbHc9Eb5i2u0dbpL1DSkeVBYlCl3rm5vLZXpuHn5R3j2YxoNKR
 vDbBawpbtZ1pzP1m/HeP5JBNVvIl+lU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-_FO5TgCTP4quFIedys1ZHg-1; Sun, 20 Oct 2019 18:57:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE4651800D9B;
 Sun, 20 Oct 2019 22:57:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45FF260C18;
 Sun, 20 Oct 2019 22:57:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 02/21] hw/arm/mps2: Use the IEC binary prefix definitions
Date: Mon, 21 Oct 2019 00:56:31 +0200
Message-Id: <20191020225650.3671-3-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _FO5TgCTP4quFIedys1ZHg-1
X-Mimecast-Spam-Score: 0
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
X-TUID: oYcDAQK2vn8/

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/mps2-tz.c | 3 ++-
 hw/arm/mps2.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6b24aaacde..f8b620bcc6 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -38,6 +38,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -458,7 +459,7 @@ static void mps2tz_common_init(MachineState *machine)
      * call the 16MB our "system memory", as it's the largest lump.
      */
     memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 0x01000000);
+                                         NULL, "mps.ram", 16 * MiB);
     memory_region_add_subregion(system_memory, 0x80000000, &mms->psram);
=20
     /* The overflow IRQs for all UARTs are ORed together.
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 10efff36b2..d002b126d3 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -146,7 +147,7 @@ static void mps2_common_init(MachineState *machine)
      * zbt_boot_ctrl is always zero).
      */
     memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 0x1000000);
+                                         NULL, "mps.ram", 16 * MiB);
     memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
=20
     switch (mmc->fpga_type) {
--=20
2.21.0

