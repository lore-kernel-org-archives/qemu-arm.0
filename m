Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1187421wrq;
        Wed, 23 Oct 2019 10:33:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4VUs6zQbdVcE7fmCyHiUyXx40aBIc1Xmtv9yepCUlZDFUzAp0BiVKDflIwbcsbn5QUaMn
X-Received: by 2002:a17:906:6bcd:: with SMTP id t13mr23000810ejs.231.1571852017898;
        Wed, 23 Oct 2019 10:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571852017; cv=none;
        d=google.com; s=arc-20160816;
        b=fA4KH8gnIChPPB4/QfZ4S99QaZ2azBJZWwK2g1giZ46FG506It8I75kPRTbCY12wIP
         Lj+aYyxucd3ThNA/0j6TgwRbbQ2iQ6jZZQwskl5w00/pjzeq3gR+M+StGm6limcIUKJ6
         gQpeYSBhEvR/EBLhdGwFG9AjzOX289VhVJlDmvP3W6yhQ/9LKdBwA+Xbja97iImKHCZL
         DA60E0z4eU3ZSNGODoTGMDLRLK6XsarTHCtTAmP21HvxxJj1nsVqufb4bKeXbVY3cCK6
         S3BcF0KTK4V0Qu+VPHbQ2kEPjAW1vFFrzaw6lRj7WnBqZXE9cxdH0BqshQHbIsGXGsWO
         xkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6RTteADGfpM4YBMydoONN1yiclwUwAxdyyctis1vQqE=;
        b=Eeurw66vSUJ1Yd19oT9ZgoStxVVqGtM3XuedeSpiEA/MeRx1nsZ5C0zB4QlNxavTez
         LBs1Q3kEH5ICnie6n6oURuMvEtZvnPaeQK4ABaXzo6rWfTLvR138lMmSweUqq2HkGzPt
         f2DoVV3mx9ivQtVsq4y7IaHSEiAS1KE+h5BHDvWbrfAfN3PDXSlaqMBwi13SJNsnrU6F
         3fBxhzNaK0WL9vvLjmePdDKD+i21NriwuZ8jVxQiBQqS/zUKBO/3GpThzJV5m1HPq5iT
         JA39Ou1RH/4dMcpqFrv9iCFC7nkv7Jx9q0PUabzEUtICVurx7dde6DATmX9J4rA83bs/
         sUdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h+J3ytDX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si16418952edj.220.2019.10.23.10.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 10:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h+J3ytDX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNKVs-0003fF-6J
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 13:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58867)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVK-0003ad-MC
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVI-0001eK-HS
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:02 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23223
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKVI-0001eA-E9
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571851979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RTteADGfpM4YBMydoONN1yiclwUwAxdyyctis1vQqE=;
 b=h+J3ytDXOmKY0rm+Rg7nuU7prMLfK/NBsBlWX2IxuA5/1XrTFoiNGSJAOEXY+kGYUi2q8O
 SR4NxaiAPk0N+M/tmezUzQZisSZqFA1KyYs1q+TbcuWv7TewTINTYuP2FyEiFFScM2xcCN
 DK9qJjdJrw5SiF+70myy4WRUckWVw2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Dna11Fl4OdaSv9tgO5c6Iw-1; Wed, 23 Oct 2019 13:32:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31F031800E01;
 Wed, 23 Oct 2019 17:32:53 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4956D6CE40;
 Wed, 23 Oct 2019 17:32:41 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/33] sysbus: remove outdated comment
Date: Wed, 23 Oct 2019 19:31:24 +0200
Message-Id: <20191023173154.30051-4-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Dna11Fl4OdaSv9tgO5c6Iw-1
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
X-TUID: 5I1sSbhn/WfA

The init callback is no more since commit
817a17fc60f44e29a1944b60d32f45ea127f0cf9 ("core/sysbus: remove the
SysBusDeviceClass::init path")

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/sysbus.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 2eb0484388..c4a1c0adfa 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -24,10 +24,6 @@ typedef struct SysBusDevice SysBusDevice;
=20
 /**
  * SysBusDeviceClass:
- * @init: Callback function invoked when the #DeviceState.realized propert=
y
- * is changed to %true. Deprecated, new types inheriting directly from
- * TYPE_SYS_BUS_DEVICE should use #DeviceClass.realize instead, new leaf
- * types should consult their respective parent type.
  *
  * SysBusDeviceClass is not overriding #DeviceClass.realize, so derived
  * classes overriding it are not required to invoke its implementation.
--=20
2.23.0.606.g08da6496b6

