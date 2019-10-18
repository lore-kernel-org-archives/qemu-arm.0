Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1098277wrm;
        Fri, 18 Oct 2019 08:53:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwio492qFqc3ONIYC/o94Me0+WGZX7/sTb+J7d9Hwkexw2TnhT1wsKKR7QJOUvQ4LsuDjE4
X-Received: by 2002:a17:906:8317:: with SMTP id j23mr9159856ejx.314.1571414010131;
        Fri, 18 Oct 2019 08:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571414010; cv=none;
        d=google.com; s=arc-20160816;
        b=keciyOgndc5a03zRIVIyNwumnXICCtbuFJ3cykQlBtDxPvUJBLZBHkDTa56SjIAM8W
         8Vb/ZIDGzrr9bQBylStE9lItGEKhenwqzBVVjFZO4ret78f+xT8lk7NY3DRP/48jPmq6
         4kCWh9ERFqU4+BSBD8EutPtSmUm5Fq/em9wAMzhpjjaIodVmq0WFRamqrE1gsSlvaNul
         JhXOQ+P5a/kV+a44krZ1HaVMqzELoZ8ge7SPDtgHbsTkI6SrUC0UI5gfTT12zvkB9BWn
         496yTQnBCkQRW67forD2zGC1yobnnDpeSCdpqcIj6FxbRWDiSfh6MPuv/3rw+q6K190E
         L+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=cxgSnVlxD7sCrghNHAVIsxKI7FgLqxbxJQHFwrSKLrE=;
        b=Vi6NKIjQ9DjyMc633PyACSEVSn/vjLE4mEfdDPlWF0DyQSqMa5tb0PG8ZK0odIG6fR
         ZZk2qBgLPCegHPSGmhaiV4/PawwDR4Ou2DzjtcjthMM95/1o2zP8u86SFFgeThydtijJ
         L0T3FXg6H5dv4osEL31BoAfkTTgotOj4qeGkZc/mZYW+SXmT9RWC8xhKAVbV7qRy2D32
         V/ikoWlx8pkxj5cMWnsfHtY5QzC8d4xPqvPPSsAV31Am1NpwCNHAkXp/M3NzHqgHRFNV
         7LbSGSKjFgOBfxLW2HuW9ng+3gXgVl27oDRAtKCtZwRkUi3yDKqFSI63wxW+XbpLoHSx
         sotg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z33si4548204edz.314.2019.10.18.08.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUZE-0003iI-Ok
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPO-0000fZ-A2
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPN-0006zR-3C
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:43:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2801)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUPM-0006yr-Tq; Fri, 18 Oct 2019 11:43:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06BEC88FFF7;
 Fri, 18 Oct 2019 15:43:16 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E349F600C4;
 Fri, 18 Oct 2019 15:43:09 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] RFC: mips/cps: fix setting saar property
Date: Fri, 18 Oct 2019 17:42:05 +0200
Message-Id: <20191018154212.13458-8-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 18 Oct 2019 15:43:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: wxXX/rXyWcD8

There is no "saar" property. Note: I haven't been able to test this
code. Help welcome.

May fix commit 043715d1e0fbb3e3411be3f898c5b77b7f90327a ("target/mips:
Update ITU to utilize SAARI and SAAR CP0 registers")

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/mips/cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 1660f86908..c49868d5da 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -106,7 +106,7 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
         object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-pr=
esent",
                                  &err);
         if (saar_present) {
-            qdev_prop_set_ptr(DEVICE(&s->itu), "saar", (void *)&env->CP0=
_SAAR);
+            s->itu.saar =3D &env->CP0_SAAR;
         }
         object_property_set_bool(OBJECT(&s->itu), true, "realized", &err=
);
         if (err !=3D NULL) {
--=20
2.23.0.606.g08da6496b6

