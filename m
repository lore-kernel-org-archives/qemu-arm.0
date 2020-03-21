Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2053458lfe;
        Sat, 21 Mar 2020 04:53:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsTUIEWtn/kzDPogedaf3yBUswaJwkyfdboRt39Vu0GkP57l/FPqV/RJ7ceBwGfbgVm6lbP
X-Received: by 2002:a0c:eeca:: with SMTP id h10mr12577744qvs.206.1584791580769;
        Sat, 21 Mar 2020 04:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791580; cv=none;
        d=google.com; s=arc-20160816;
        b=vUIDh3j53UHLEqbDPfyzeIrXEMSDkEQXvJliLYBMHC9sWeEB/Gzq7Ejtb/D2yEEuPD
         QsnR9nSUHXfOUEoFfm9/esoggnrOrIfVyHmJwsV/fq1kW3gH6KZ6owEi/jCW6TwC0abL
         Ak7DQmj5CGVTMoiRRdQTGtvXhk+fmXpKWGRaZ0FCUQlDwnGXa3vejbYV6Asw9x34ZtV8
         lIxtCQYmKcwkZJVAnKFbjHDZi9H4azWupdVeB18Pgz5xlhGjFMd6dxu+brSAt7VBI9ly
         bLvf1lnMhxsya6x28yBXaxRGVYjFdekMd2yQiddWB8vNLZDoTrzCw8lH9GyKATJX1CSI
         ERnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TG3vD6dCJich6pAeWRU+T1xBswh8CnNUpTlBwJ1yiQM=;
        b=gngdJVW3Vs4co8JSPPWrbyPoi6ffi1TS+HRCQQI+mkOvIjoFI4JWH2Tu2n0dyqtDEs
         16z+HfzAswsYaVR3CxjkCTmI3Lv5fHsXfOhR2Hju8aAB97ENCx/+aMqml4mujvAEWor6
         n2ptTW6v/6ik3jgsXSt5h4oZh3tKlzqqdB8FnY7GTlnF8WCd+0EhDXKmyzXoscz1Cc6C
         jTIJW81fG5eaCkeyBdDwusCfesqWP97JGJhuKxSNr1nqmga/ThRvFg+cOfoA5dsYfGMo
         4+D07clpyiH/gM4qSc9b67gOiElaln5/woIFYS5oorhrLfmnB7im+JNa0+z6bHUb5rSU
         rLiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="G/DIaUlN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z68si5309214qkb.167.2020.03.21.04.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="G/DIaUlN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcgW-0004ij-5d
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbL-0002SQ-P8
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbK-00074w-Nu
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:40793)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbK-000749-Fm
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TG3vD6dCJich6pAeWRU+T1xBswh8CnNUpTlBwJ1yiQM=;
 b=G/DIaUlNUcP3dmQoQbnXQSSG1IHUz8N/mF9RtEXZB90/BhS3hIhDJQiSisNoHsXHxX2GKg
 NNM51iEjI2gsUQImxbMrHKNcRRZPe/IwcIx1iGfvyxm+YVTQGLYcuC+c2lcS/AsWMeZNBZ
 8KlmG1BxqQTfzldXFtOPtG3fgKUexQE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-uGZHt3z5MuqcIf1EHpMh-g-1; Sat, 21 Mar 2020 07:47:36 -0400
X-MC-Unique: uGZHt3z5MuqcIf1EHpMh-g-1
Received: by mail-wr1-f72.google.com with SMTP id f13so4162930wro.23
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 04:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAAolWyXSH1ZCqRxa+9EfzNPi+VU6uagizFc7cEyMYQ=;
 b=AAIS5Z28q2b5EmLxic7xXmBH52rRO+xJOF3z0r3l2brkHKt/z1WDABKXfdMjmR9MWX
 WF8MnxUm0vm1jFN5gDri1NBpC3Gz38/KiWXF7pbF0FrEzsIWFZcMRk/9Ogijr62n0fOB
 cqrfN6eRPZEKwPCgE4OKLzUsBDzS1aIFy7w0LU5ajvJb7q64BRp2U2WOzqwDJNiifOpm
 hq7RSxtfO8z6DcROenPkqIYakWufopH36+6MYzXbYRKWEgHnw6getV0yItZEfxMbsdQ5
 sTGFvU2PIrADSw671Os7c6owmdLEhow/vwk3sadnyT7KiVKkw4+HX0py9p858TDxu2Af
 WnWw==
X-Gm-Message-State: ANhLgQ0CwBj07HQF2/TAOPxDrBK6Ictz8lTMrXm6Ta8IAAsik6qlYa3d
 Ic7lBCTyvR3XJnPTgzQODvGTcbz2VVlOIuTHZtdpxi0eoh3iWv8zAHG7v1KB3XjT2OVZkMhpWI8
 /Wcs8mV8azua8
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10384657wru.404.1584791254911; 
 Sat, 21 Mar 2020 04:47:34 -0700 (PDT)
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10384613wru.404.1584791254676; 
 Sat, 21 Mar 2020 04:47:34 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id q13sm12849850wrs.91.2020.03.21.04.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 10/11] hw/timer/pxa2xx_timer: Add assertion to silent
 static analyzer warning
Date: Sat, 21 Mar 2020 12:46:14 +0100
Message-Id: <20200321114615.5360-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321114615.5360-1-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: boBoDYc8fZnC

pxa2xx_timer_tick4() takes an opaque pointer, then calls
pxa2xx_timer_update4(), so the static analyzer can not
verify that the 'n < 8':

  425 static void pxa2xx_timer_tick4(void *opaque)
  426 {
  427     PXA2xxTimer4 *t =3D (PXA2xxTimer4 *) opaque;
  428     PXA2xxTimerInfo *i =3D (PXA2xxTimerInfo *) t->tm.info;
  429
  430     pxa2xx_timer_tick(&t->tm);
  433     if (t->control & (1 << 6))
  434         pxa2xx_timer_update4(i, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
, t->tm.num - 4);

  135 static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, int=
 n)
  136 {
  137     PXA2xxTimerInfo *s =3D (PXA2xxTimerInfo *) opaque;
  140     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
  142
  143     if (s->tm4[n].control & (1 << 7))
  144         counter =3D n;
  145     else
  146         counter =3D counters[n];

Add an assert() to give the static analyzer a hint, this fixes a
warning reported by Clang static code analyzer:

    CC      hw/timer/pxa2xx_timer.o
  hw/timer/pxa2xx_timer.c:146:17: warning: Assigned value is garbage or und=
efined
          counter =3D counters[n];
                  ^ ~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/pxa2xx_timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index cd172cc1e9..944c165889 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -140,6 +140,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64_t=
 now_qemu, int n)
     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
     int counter;
=20
+    assert(n < ARRAY_SIZE(counters));
     if (s->tm4[n].control & (1 << 7))
         counter =3D n;
     else
--=20
2.21.1

