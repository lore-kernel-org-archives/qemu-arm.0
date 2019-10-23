Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1215742wrq;
        Wed, 23 Oct 2019 10:59:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxikHYB/qS/GotZHKnGEKn/1tKd3b3K1HtYT9gRR4PUdiB1lptqev+umphYq+rf6ksYuxdC
X-Received: by 2002:a0c:ecc5:: with SMTP id o5mr10464388qvq.19.1571853581064;
        Wed, 23 Oct 2019 10:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571853581; cv=none;
        d=google.com; s=arc-20160816;
        b=G8isHEJBdMU+Bs3XGHux9aZqbSraPbr9zFs3NlmflXQiFOalfPVqochitOrnI2Vu6h
         x6nWoIi4G45zRVsle5+y0VslfKw89qXOhADs7Br2X0/St5f8VMoqfHPehWB/T2pKlCfT
         5t005hgOiwjh1x9xuzj6fMOTpzB5GXVGf9/cmPh33u752vFp8h52oUGJNIyV62K4t0u8
         34MK7T85hGloIc7Mi2M7V1PrK4dJ1qUB4TdJF7ojgb+zZfv2psCHFj/tC42FA1LFm6ns
         tDSvPwUfAVskmI4kIEXbd/t/clh9HWwpWftAVx5MvJpobGMEUWRTUu428OJOzLO3v1r8
         XcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zfAfvfn2NYgPOsG/TtKLv7pUl16aLJ11n4/0NbxENhs=;
        b=yIAscQNsZMwgASy3aqHT8NO/MsqnsFah3iIIEdciB9L3Br0qkrZdP87Oo+2m1c9UEz
         +gUCJE0XpU47w0zoFgi1H2p6FiXU8MS54r3GO8sMfF1NM0PozQPG39ilubsUpACY7TbL
         m50nhI1+ejRrH1oiMTWoAH7QeNkwMTe/786NBa9PPM7K5p9W69KKxyCzAGkqdHrvhLZE
         gkQ+Si7arh+xcTmSopvAZhQLR9NX1IRDKGBw5x6o/yUDHq0eAkgUmhqu3BN7gyKXM3EW
         KRHXoOzZ78oohkFuj6O558y2KtxU/ZNh6EVej7V8ls5+8c7FZreSBZOUN2Kmy9II8NLH
         UIGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vr626uTb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b27si3149545qvf.197.2019.10.23.10.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 10:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vr626uTb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNKv5-00089d-Q5
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 13:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWN-0004c8-UM
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWM-00021L-JA
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32383
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWM-000200-FA
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfAfvfn2NYgPOsG/TtKLv7pUl16aLJ11n4/0NbxENhs=;
 b=Vr626uTbIcpI0FEbhC1N7HaO2oCapaWKWWzKEh8jsccF8mDcbWvUo49ZD+CLqtJpL0UUea
 YEyCW24yC183I6ClVBwrCplEkXlNlvRtcUYLlKenMxvgb54r8kXkHJoOIgdwUVLFWpbOu3
 u0hvUXiL7t7mXD9qp4IDprzD6kFnqbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-bP8vp91vPQeRl637whQmtw-1; Wed, 23 Oct 2019 13:33:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F7B6107AD34;
 Wed, 23 Oct 2019 17:33:57 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E832D6012D;
 Wed, 23 Oct 2019 17:33:51 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/33] serial-mm: add endianness property
Date: Wed, 23 Oct 2019 19:31:36 +0200
Message-Id: <20191023173154.30051-16-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bP8vp91vPQeRl637whQmtw-1
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
X-TUID: fEjMR4fwDYZK

Add a qdev property for endianness, so memory region setup can be done
in realize.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c         | 2 ++
 include/hw/char/serial.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index c28cfc94fd..2f7667c30c 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1081,6 +1081,7 @@ SerialMM *serial_mm_init(MemoryRegion *address_space,
     qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
     qdev_prop_set_chr(DEVICE(s), "chardev", chr);
     qdev_prop_set_int32(DEVICE(s), "instance-id", base);
+    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
=20
     qdev_init_nofail(DEVICE(s));
     qdev_init_nofail(DEVICE(self));
@@ -1102,6 +1103,7 @@ static void serial_mm_instance_init(Object *o)
=20
 static Property serial_mm_properties[] =3D {
     DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
+    DEFINE_PROP_UINT8("endianness", SerialMM, endianness, DEVICE_NATIVE_EN=
DIAN),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 759c85976d..2d0802a909 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -86,6 +86,7 @@ typedef struct SerialMM {
     SerialState serial;
=20
     uint8_t regshift;
+    uint8_t endianness;
 } SerialMM;
=20
 extern const VMStateDescription vmstate_serial;
--=20
2.23.0.606.g08da6496b6

