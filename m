Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1401169wrq;
        Wed, 23 Oct 2019 13:51:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzM1eU3Ozk6TJPUB99Ug1ZmPfs8jYz+7hYjsP9SyBiUYUNGod5jzief95knCZIb8+lLTiPh
X-Received: by 2002:a37:4703:: with SMTP id u3mr10734799qka.140.1571863915867;
        Wed, 23 Oct 2019 13:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571863915; cv=none;
        d=google.com; s=arc-20160816;
        b=RsN+wvfetcaywRzgEr96iFlmRoseDvtuF/b2PkNuIIna7DLuDn4iZXrA1RmlDlJV/V
         g3b5BfF+u/MDYAWZBdmNuYLeWnxgO9M+Bj+MSizloblzndD8SNXqXgvK0NPj6+ob8JYB
         sO/eG+T3EE2oSj1JMyUuUgrH0C5UZ7fS/+YjfVMcYqbsQiGSPJaGbc3Fj+F+BTbKFrpW
         4wyQawdeStKurDKYrmOCDS/Dk0L2uZRpyx0/LdQQzjaZXVBF4X2o8q91GHSGFlgLad5n
         qwdZ5afywak1rhMrL04Y+VaCfujbkcB8RfVMVhKy/CHiPtjJIqOJW6WdZlAbTDsExW+g
         kwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ANOM+DENzs2RClux1nqzQgfztZmX7jOCZ0LMIkdZMSU=;
        b=C1ARktnF8IdkSVlgUt/ni63MCSkC7m6xR/5h2pdVNYw3uy9UdVNSYuCjai2zra4uFQ
         uTnXy06pRc28lYFvL8iQKs/cwFRwvMjU6ZS/esd+qPFsUIcap8F3t0JcXN6xJsLIMZAZ
         d29B5Ydfue8Vb5DnXvJL3rw24F1TFVKVwxw/loHD3JvlIzo5oSW/mt0hgdZnOd7Ijls/
         i9+kxz0zampECirlwWQwWrJJpfOC+8o9OzrkNG8iioNIpZS6wIVSBBdWF+Idn1D5inYq
         5MYLxQ86ybY3s4K9kHJRUcScKjQjhcsyrZYXAqTDIh5eQB3dSyIxpjhIpk8TC8bBAfI2
         wLYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="GTO/fWsE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si21262513qve.70.2019.10.23.13.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 13:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="GTO/fWsE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNNbn-00059c-6m
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 16:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKXG-0005a4-IA
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKXE-0002RT-IG
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:35:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30105
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKXE-0002RC-Bp
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANOM+DENzs2RClux1nqzQgfztZmX7jOCZ0LMIkdZMSU=;
 b=GTO/fWsEN7JvyKbvy14fvc+QTLKdh8aU2NEF5u5lEMbFwyPCfTM7GhTAGeOYFy+mG5yOYd
 4/jmugeeD9pKb/yFanDVz05XQNDuD0H1eRQ9znXXR0hD8qNWnwOQtOIhFyiTx/mHvxtYd3
 1Y2w8280ShHpms+YOzY5KKxGAm3QOM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-3UzCBIkHPnWQTv2HRZaJIg-1; Wed, 23 Oct 2019 13:34:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B33800D62;
 Wed, 23 Oct 2019 17:34:53 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB03600CC;
 Wed, 23 Oct 2019 17:34:51 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/33] RFC: mips/cps: fix setting saar property
Date: Wed, 23 Oct 2019 19:31:47 +0200
Message-Id: <20191023173154.30051-27-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3UzCBIkHPnWQTv2HRZaJIg-1
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
X-TUID: BDZ8KLbP+A/N

There is no "saar" property. Note: I haven't been able to test this
code. Help welcome.

May fix commit 043715d1e0fbb3e3411be3f898c5b77b7f90327a ("target/mips:
Update ITU to utilize SAARI and SAAR CP0 registers")

Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/mips/cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 1660f86908..c49868d5da 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -106,7 +106,7 @@ static void mips_cps_realize(DeviceState *dev, Error **=
errp)
         object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-pres=
ent",
                                  &err);
         if (saar_present) {
-            qdev_prop_set_ptr(DEVICE(&s->itu), "saar", (void *)&env->CP0_S=
AAR);
+            s->itu.saar =3D &env->CP0_SAAR;
         }
         object_property_set_bool(OBJECT(&s->itu), true, "realized", &err);
         if (err !=3D NULL) {
--=20
2.23.0.606.g08da6496b6

