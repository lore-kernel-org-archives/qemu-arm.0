Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1293666wrq;
        Wed, 23 Oct 2019 12:10:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfKmdxpXJ57dwFqQIOGtySAWY/6gMqBKz2PyLHEaTksuRvGEXZJGUHOwhBPNfpqaiG1Thj
X-Received: by 2002:a0c:fa8a:: with SMTP id o10mr10431319qvn.7.1571857852756;
        Wed, 23 Oct 2019 12:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571857852; cv=none;
        d=google.com; s=arc-20160816;
        b=orApEDFn3noeSDK6XXmTGENjtS4wn1oyyCKXhE3bFx7QCrsSYYju64t/NIxRoieMpc
         +ufUVsA82kZkPROHRHVGyt3sKVi2LUvxVmlqNXDBS2JNrxlu6ptNm43kcrPJ11IObWDB
         bphNCubUMCSOApzaN7QsbR3oYeKdO0UKMnZPOdCZm5Wms7O210A8Hxc2cw4OmpoZGdJ4
         vZd0lagY021immJ/0VwA7fpgYfRs/77M6T5S9MEtf3SJ8gcQXx7pd+vWI7Mx9auCUiC9
         GeXRcWDM4qDyGcBGLjRYnNozuhTUiITsEAKEyhtiDtFxIQeMg6fY0Ll7FvdpQEQAWr6Z
         I66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YSTDB3NWoROI1vU6xHiF/rde0k4aF86IF2QLR7maaoc=;
        b=F+MUNWTkR3tuU32tGOP+4YqEWSvOA5nPcI0qRL709iMfUxu5MtE5X5fvBVMXQWL7C6
         /tAKNnOw0zq7hm7A+Mn8U6mKNyd4SQZMZ6GMb8AFS7zTWWrkzTQeXrGv4a0AkLFSc1GQ
         vZDCaZ62E572qi43WWvs5vRE3LY8jijXYTF8i817XkMDP+xDnGTM7DDiGLR3KITkB/dL
         kWIs8aOzZF+Lo2OgrMil6t4R9NmNHxcP29mkASlrH+qgNHJ7QEW6Qg02pUDJb2nun1Tk
         rh7IWq3MYc0Ku3Bs/iz5pnY96h5ATCSBLEQioZO0kvP/wAzpgL7+Gn1rjN85bSGuUCkb
         czEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JjWqE+bV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q187si18913535qkb.299.2019.10.23.12.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 12:10:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JjWqE+bV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNM1z-00017h-R3
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 15:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVw-0004EK-5F
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVv-0001sC-1s
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52773
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKVu-0001s0-U2
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSTDB3NWoROI1vU6xHiF/rde0k4aF86IF2QLR7maaoc=;
 b=JjWqE+bVaSmuNA+DEm90FLx3Jz6L/Q4m2BW4LFPBQXwtSAmiUVwVx3f2VaiLoBek33jBRq
 sxXmyv4teiSMU1Hn05xKXWsGmCT+HnJd78plA1KUvg3unDQdmAONFZu2aaMlWBAQcX+JmJ
 zK7RsLVQmoheEaRy/c4BnGSTB00Dr4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-XB3TaoAPOgi1rVkR-neq_w-1; Wed, 23 Oct 2019 13:33:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 802195E9;
 Wed, 23 Oct 2019 17:33:32 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0DB15DC18;
 Wed, 23 Oct 2019 17:33:23 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/33] serial: add "baudbase" property
Date: Wed, 23 Oct 2019 19:31:30 +0200
Message-Id: <20191023173154.30051-10-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: XB3TaoAPOgi1rVkR-neq_w-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: bL8+wc4DY/7/

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c         | 5 +++--
 include/hw/char/serial.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 09e89727a6..069d8715d0 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -988,7 +988,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     SerialState *s =3D SERIAL(dev);
=20
     s->irq =3D irq;
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
@@ -1070,7 +1071,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
=20
     s->it_shift =3D it_shift;
     s->irq =3D irq;
-    s->baudbase =3D baudbase;
+    qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
=20
     serial_realize_core(s, &error_fatal);
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 180cc7c24e..3dc618598e 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -58,7 +58,7 @@ typedef struct SerialState {
     CharBackend chr;
     int last_break_enable;
     int it_shift;
-    int baudbase;
+    uint32_t baudbase;
     uint32_t tsr_retry;
     guint watch_tag;
     uint32_t wakeup;
--=20
2.23.0.606.g08da6496b6

