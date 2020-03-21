Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2217204lfe;
        Sat, 21 Mar 2020 07:51:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuRzLS/tVizz+KElBKWD8GPsS/U1MdmvTW8qsSuqZz+fox43AcC01jYCf2IsjzUlhobvSR9
X-Received: by 2002:a37:6044:: with SMTP id u65mr1035275qkb.246.1584802290365;
        Sat, 21 Mar 2020 07:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584802290; cv=none;
        d=google.com; s=arc-20160816;
        b=SQXSHOuOHcw6BIZ61VbhvU3/kdYI+JtsI712qoa5C2t7YwRD/R6+O3QdYtXcxzzliv
         GHIvH6Z13EDYaN9rHa5KZ717vB4kTxcs03fC46q9/IKd5TBRR8NaezMADumVLnTc63ub
         uCfMkyUJzEdVNDpQy7a7j45eEj5jfkDmLP2NQzTFneGIzS71jIm+UPHwLCf4mf5mX+KY
         ugmkaHfHBV21xZH6lBUkuWprxg3iHKQtyKCeadPqiJFrl4PXdi85EKU8I1mHR7reJcUX
         I1vepuVJDigrb1MmfW6FtpphosFOr9MRK4HCtMHHO7gnE2DX0CLec4NWdj8qlGjiZIMN
         WWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TG3vD6dCJich6pAeWRU+T1xBswh8CnNUpTlBwJ1yiQM=;
        b=p2mUmCZEbhY5zzIUVh4Mp3qx8lmb9ouARuLiDwHuWYjmlaxQE9NQC2TlPxnOfPJILO
         jBzVuAsd2mkcbLYBFTRLrB/VfAM67IVbRtVqgLWkHn9E+IIfFPM2BVesK8EQrv4uhQe+
         +ZV25dwBfrBRtIekdHsYU+pZ7DkGUbd74nLpbSUqRdyRx7YqLr7oFrdxn/gmKDQXcjP3
         yyyl2kKXAw1yrEsL1czb1dIIR4SVNaN9UjiOdFYOUDS0bdkmDBpVL2h35F4bYs3wUlwt
         VSN3DDb3eVF0ymI906WR/f4KLSJp8lL6xIXHOq6v5jdMJ08pem9XQ3b20yy2MbOth7xR
         A39g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="f73Fq9/M";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28si6048437qtm.259.2020.03.21.07.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="f73Fq9/M";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfTF-0002r8-K4
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfKS-0006GQ-Aw
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 10:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfKP-0007xV-TN
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 10:42:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:35161)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfKP-0007wT-Lt
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 10:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TG3vD6dCJich6pAeWRU+T1xBswh8CnNUpTlBwJ1yiQM=;
 b=f73Fq9/MIQv8adz/ZgYmdwv/FqPikMBkNM4np1GwS6MkLvUUZeJQZOd0XVs0mhfgT50Az8
 zCiPih4HsFYrlOOweUzR356hxUKHdymRGkdWuq1AXl0H8Xc+oCJP+S1K3O//K8qengtI1V
 xh4oOBv7KVBXAooiRqLrxmWWYEnChac=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-t5f1oDRDOd24NVLSDon0sw-1; Sat, 21 Mar 2020 10:42:19 -0400
X-MC-Unique: t5f1oDRDOd24NVLSDon0sw-1
Received: by mail-wr1-f71.google.com with SMTP id w11so4360338wrp.20
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 07:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAAolWyXSH1ZCqRxa+9EfzNPi+VU6uagizFc7cEyMYQ=;
 b=NdP4xVoJezNLcG4yNQVSmdtDRUnEENrFFzW6U4DRMOT/XLYxLuYxt2uTNwG/GUtqi1
 +24IHzxl5fLPXfV8YpVAjYkLc5JEa42Oq8pYUYNXj5t+uvsHxgF/fi0ccAp92Amv2eSx
 Y6Yl4pPfQ8JmZgX2xA7xutap5wQ1ANq111ZESiEbKyFPVOa5bjvEpWCF1FGc61lruhsC
 49fESKhjbo0LDqmFioVeI8BEQVVKh9GC8MzbqqVlSiwc9ik3STbKe9k8ERolWvNgGmMF
 q8G+InYooMhaRJ2JopO12V7ulmz5jOu+wpfhoo8W70CROeHHpjpDnP9p8lfQnWyopU71
 sOYw==
X-Gm-Message-State: ANhLgQ3JIX0dLSQ8HS2DlN8d0FlbaaCRneOcQN/Pc+cXT1QgSsic/SVw
 Znh7x3B3smZ+icDnUsj71PcIrlwqfVnPLJGBsJJPyEV+09pCT6zlD94wvmmoEtjFjke+290M9ph
 0j+f5RyVWDffxzn0=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr18118308wru.426.1584801737792; 
 Sat, 21 Mar 2020 07:42:17 -0700 (PDT)
X-Received: by 2002:a5d:6992:: with SMTP id g18mr18118265wru.426.1584801737585; 
 Sat, 21 Mar 2020 07:42:17 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id k84sm13063251wmk.2.2020.03.21.07.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:42:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 10/11] hw/timer/pxa2xx_timer: Add assertion to
 silent static analyzer warning
Date: Sat, 21 Mar 2020 15:41:09 +0100
Message-Id: <20200321144110.5010-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VhJQvUtSDeWh

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

