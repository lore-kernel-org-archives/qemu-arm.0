Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp136910wrq;
        Tue, 22 Oct 2019 09:29:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNNsWbKau+iKv3H3c+I8r+HSbfs4EaZ10qsOI0kKpKH1nXofMJkvPIvxufxSKg+6K2QZW5
X-Received: by 2002:a50:ed10:: with SMTP id j16mr32171831eds.227.1571761797471;
        Tue, 22 Oct 2019 09:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571761797; cv=none;
        d=google.com; s=arc-20160816;
        b=TB3KmOT8Yth43tfBmpsUqpYbKHlHBicuOXDlQuz9DrD+/W6S8/PGSs+18fgE6/4hy6
         jh3DWzM1GLwwaIl9d2oIqmpHI43pbr4z/g2lel1mldxzDjAsZI9yyHtiQBOKb3jSyOs3
         TabwNAyME8FGn2tfmxuBm7HhyOJP3U9KB3NcgF3nTtb6hj6Z3DCrQsV9atvq6QwEux01
         IykB1h2qnaULB/k0Di9BBtvBGjBaO5wNL1+chCzE8Nflwu9nkYAQ/JUTS1xMB0H4lvdV
         tOiNfrxcFUAQXhT48JdvPSDOOYKjQDWaDM2gMNwdNAQuz25M8xKVZswnEOpeIigAzkW+
         xYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=89Zo2A2N2T1L7Eo/D/HcuXY8WnhlbrmU/BS7ldbzPes=;
        b=fm7IePfvQxTzIzD03ofmtMqJxyinnlM56jAvoQEZh7mcH78AGteIbzLpJMmYEHNnJs
         ogB10LT2l0jw8HUrUEitHhdgHSNgsXi9dXwcw2H6gpgOyfIRWTeasGESSF0OJpkmrwoN
         aHpBjgDMRAhqy3HOvqMzVgpEZ1nDRUW6Fz/+iKAKZ7kqPJT0w+jViZHNfJ2BCFXqRyVl
         ujWbpCPZd4K/gBw1WLOXCoSF+oZHcXj9LQJLBks2sU/PSjuLldIotSAzflUKD/2RENzE
         ukELmczUT/cRv8eUgVCVdio8jv6gC2pCvgfdiM1REWSX0U53V8Rk/MiyfCmeDD4pf5TT
         xcUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ywk8CDKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si12662509edh.358.2019.10.22.09.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ywk8CDKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMx2i-0007jM-7L
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwE-0007DX-2F
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwC-0007PO-LZ
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24211
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwwC-0007Ov-Hq
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89Zo2A2N2T1L7Eo/D/HcuXY8WnhlbrmU/BS7ldbzPes=;
 b=Ywk8CDKqYiwfv6HfD1ddxcJzHsMCu6YD+Hcaz71PbvMFlGe5IcwArUl97XO1FJw82zZdzb
 jiR+TonxQFWLkcCkb3ZLn6SrEjGVXFigKNhACyrJ3zqSTZRPZtk0EIYwRpR/nL4oF0XNf8
 +bCyzQynYiMWDVhhOJALUOMX7Pu81To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-VjPIc05rNO2t1yDblpAyQg-1; Tue, 22 Oct 2019 12:23:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBE89107AD31;
 Tue, 22 Oct 2019 16:23:02 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA1D5DC18;
 Tue, 22 Oct 2019 16:22:57 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/28] serial: add "baudbase" property
Date: Tue, 22 Oct 2019 18:21:18 +0200
Message-Id: <20191022162137.27161-10-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: VjPIc05rNO2t1yDblpAyQg-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: THhSe8frxyd/

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c         | 5 +++--
 include/hw/char/serial.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7bc7c4370b..0ae52ec60c 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -988,7 +988,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     SerialState *s =3D SERIAL(dev);
=20
     qdev_connect_gpio_out_named(dev, "serial-irq", 0, irq);
-    s->baudbase =3D baudbase;
+    qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
     serial_realize_core(s, &error_fatal);
     qdev_set_legacy_instance_id(dev, base, 2);
@@ -1002,6 +1002,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
=20
 static Property serial_properties[] =3D {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
+    DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -1079,7 +1080,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     SerialState *s =3D SERIAL(dev);
=20
     qdev_connect_gpio_out_named(dev, "serial-irq", 0, irq);
-    s->baudbase =3D baudbase;
+    qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
     qdev_prop_set_uint8(dev, "regshift", regshift);
=20
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 613879ced8..ecbd3f1b40 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -57,7 +57,7 @@ typedef struct SerialState {
     qemu_irq irq;
     CharBackend chr;
     int last_break_enable;
-    int baudbase;
+    uint32_t baudbase;
     uint32_t tsr_retry;
     guint watch_tag;
     uint32_t wakeup;
--=20
2.23.0.606.g08da6496b6

