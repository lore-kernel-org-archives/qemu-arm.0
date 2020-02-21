Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2045628lfg;
        Fri, 21 Feb 2020 09:31:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmVwrrxfCJjio/PQiX0ZBk4c8y2oGV0+NYbDQoXIItau/+R7nBIkQCMzLWLjqnDn5hBgf/
X-Received: by 2002:a37:4ed3:: with SMTP id c202mr33710998qkb.219.1582306282736;
        Fri, 21 Feb 2020 09:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582306282; cv=none;
        d=google.com; s=arc-20160816;
        b=sug9x8NW5T9TsXhrI1GaphOYNLN1YlLUPhsRWg/5LUAd0RFes8CKgtqmY8qZI7XFGk
         QlVjCgoL2HKoqLXNngmtssdRRry56saFbiXIcbQAY+vQXUjgImCQwRThAxk/v4fADTiu
         PjL7jLJuTqLlOCptgZoqn5FFQavGF+M38LEtqjAzYPHMzhrdylofiaCuJRobJDpDCDUL
         uQ6hH1moloD43+rq8OzyK2tvAvNM4kLkc+2IYD+VUm0DKujG4KuIQUz5spG8aw5WswtQ
         C8p2yj5tX9Vya9XhudzF1N8RXp5ea7aZ26TqomqiQjdQqjGctl0G901Y87HoNl+zNLd+
         PcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zf2WsS+Rv67/jMvGBPvIRKzoIHeTqtx2fA55QRMOVeM=;
        b=pCSq/4vLRsf0XoB05cN3xkIUdOwzeUMlXEHt0y8EPxBRdYt8L+rngpLZO0iiZiipn+
         lFW9xpR6R1/A3o+zkBF/ss+IJsNWXekaKXQQ3Ry0l0AuyX0O/kmUra5eF7t8OAz+s2sO
         6OQ8Mena2Mb/I3N8VcEIXfRaJYPTXaD1JkMthled+9U8lFEKdkcug3a3zvrzl1LmWONj
         tEvCR2sQnoJQAMCuWODB1x8NOyJuWFZEQX2tNuMFukCPI5imTXaXNmKx0EerV3r65rMv
         EIc0YPcQN6YFE/s+zgt/iIl89TYE+AvzElnpmraUqV/TcubrsNdfMtOm/Zm3tLAQSWhn
         iB5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DKpV2Otj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si1783774qke.111.2020.02.21.09.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 09:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DKpV2Otj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5C94-0006RM-5e
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 12:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8l-00063P-P6
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8k-0007xk-II
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49708
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8k-0007xQ-Dp
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zf2WsS+Rv67/jMvGBPvIRKzoIHeTqtx2fA55QRMOVeM=;
 b=DKpV2OtjV/sbVml3RGpFRcxQApGv6u4u0FPsVne8cjUK4m2dNi4J/cvUWHgX8oWwuC1OHT
 x2ULsHizqX26gUTbGtvK5InnV5k12XrHobwtogowvEoBLVF51nYxkw6V33xe44V52IdvW0
 9vAva0+/GkhH0oJAN6Ay6IQz7muoUsw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-zCQYaCulNAiih7NAfwIo2A-1; Fri, 21 Feb 2020 12:31:00 -0500
X-MC-Unique: zCQYaCulNAiih7NAfwIo2A-1
Received: by mail-wr1-f72.google.com with SMTP id d15so1328017wru.1
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 09:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEZCU8SMVeWrFaW4f8SskHzoBJoLksHA5LudhJgZBAs=;
 b=g/k/H2jPh2vtMgSVYnK0ZQqDm6r7Z5gcb9DI0WHA90Z8qTsJy5bjElDgc4oI6eOwS6
 C83/iibblxvMnQedvwzylP4PTe0VKvRnOzoXR/bJ/c79iDj9rQRmx/8xlnAPB7nddRuN
 Q9gOvWA8Jds6pT7J1QbxA7HwBxyLuDeZeFH9x0FjaPw8iR55ZowR9AKfqMdFe2Gtzwh0
 Mhcrt+YohIy85yB89RpvjBU9EskPocY+KLy30cqZo8UihB0Bvk46z/FoNXdHDaBbl9uS
 ETTDUjL882/D5iBr7Az0Yo2gh5FIm4OAFUzA70EHxncOSFT5K9gdXXRt8eM7pYOZGiHg
 PErA==
X-Gm-Message-State: APjAAAWoxg+kidLei7w7uRepfJIYSXLTkSy9OTVFiSPMY4AaA2qINgOG
 MRA5iQAJnBz9tUeUNrp96g79QR66/xudnIVH9vefiHm2yBpgxoaidErMLn6zRb3fZ9gsOxN+S2J
 vr5TL1bSv0M8T
X-Received: by 2002:adf:edd0:: with SMTP id v16mr48855694wro.310.1582306259067; 
 Fri, 21 Feb 2020 09:30:59 -0800 (PST)
X-Received: by 2002:adf:edd0:: with SMTP id v16mr48855657wro.310.1582306258912; 
 Fri, 21 Feb 2020 09:30:58 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] hw/char: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:45 +0100
Message-Id: <20200221173049.18134-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200221173049.18134-1-philmd@redhat.com>
References: <20200221173049.18134-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: taXT1RnV30fW

To avoid orphean memory regions being added in the /unattached
QOM container, use the memory_region_owner_nonnull.cocci script
to set the correct ownership.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/char/serial.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 9298881af9..2ab8b69e03 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -997,7 +997,7 @@ static void serial_io_realize(DeviceState *dev, Error *=
*errp)
         return;
     }
=20
-    memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
+    memory_region_init_io(&s->io, OBJECT(dev), &serial_io_ops, s, "serial"=
, 8);
     sysbus_init_mmio(SYS_BUS_DEVICE(sio), &s->io);
     sysbus_init_irq(SYS_BUS_DEVICE(sio), &s->irq);
 }
@@ -1106,8 +1106,9 @@ static void serial_mm_realize(DeviceState *dev, Error=
 **errp)
         return;
     }
=20
-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[smm->endianness], s=
mm,
-                          "serial", 8 << smm->regshift);
+    memory_region_init_io(&s->io, OBJECT(dev),
+                          &serial_mm_ops[smm->endianness], smm, "serial",
+                          8 << smm->regshift);
     sysbus_init_mmio(SYS_BUS_DEVICE(smm), &s->io);
     sysbus_init_irq(SYS_BUS_DEVICE(smm), &smm->serial.irq);
 }
--=20
2.21.1

