Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152596wrq;
        Tue, 12 Jun 2018 03:45:14 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLZiM4DeNVJp1bPz7Og+D/tIxwWIb6AgUi0uATmK3YgQHkGbLxR0SgvUM65IhCGnqU5PdE9
X-Received: by 2002:aed:3e8a:: with SMTP id n10-v6mr2857163qtf.126.1528800314336;
        Tue, 12 Jun 2018 03:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800314; cv=none;
        d=google.com; s=arc-20160816;
        b=dgKnwiMUqbx/3xQu2lH40KZ8X0TGekwV1REOG6MCJJ/mox5ZQXOr7tnL5W2eahRj6n
         p22L0TEZxylE0CkWGSZp4U39D2WERYalRTGmrvPKoFJll5ubZzKmjxYOBzatCw9A71vs
         sCLFJfIzxGhzy7vgvAv3VhrnFGmD3v2VTn41wg4F717HWVS0/lQV2W7QH3Am3ln9WA4I
         0gFC0A+x9gI6wVXvMr42tKZh23aRdm88n+XrbOcK1mCEs9vwky1l/jWwPly23WwmKF+8
         PFZOla63zkRa8mfOCsH9KT/kA0kniDSG1Prbukcoj7pzIRQZ+PS9PrEAIrzksp8kAmgp
         i9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SHv/vun7gizZXDKvJrXpYH1EMwNReIniSbaT2kEKrRE=;
        b=zRP/LFXdVArm7R821CxdqEtx6jML8QnWn7arTFLgrufbapSPU9Evt4Kvl2W9w+k/W8
         DEyWiEte/T6CB40NZAFCCUSRQbF4DUTsy8MjEH58pi6AwCt6eGS0uXqD7wSXG+XGuGUU
         gfhw9uxWex1c5arBTnSOZmGdE1kyl/yUKlPbHRf4wjP4X3I3zjcfQr8ei0rFMVuOLOce
         Gc/MAN01dj2kB3WKWmar+1aOxF5oovQA2g/nUK9bUdcnWaFgbLyO3svNHXYDEj0cLBaO
         S1mLgpy/ihcy4BxbL4IRfWlI1vgZFoJLthVZ97eXXdFvuLUcrLJPwwI5RzoXcHz7TYM2
         fk3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si8816qvn.258.2018.06.12.03.45.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnZ-0003Ah-Q3
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:45:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgn0-0002ng-Jq
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmv-0007rL-3P
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49298 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmu-0007qz-Uv; Tue, 12 Jun 2018 06:44:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B3B377885;
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B7D620284DE;
	Tue, 12 Jun 2018 10:44:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8859B24EF0F; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:25 +0200
Message-Id: <20180612104430.25745-4-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 3/8] usb/dev-mtp: Fix use of uninitialized values
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7LamgjNk2TuX

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This fixes:

  hw/usb/dev-mtp.c:971:5: warning: 4th function call argument is an unini=
tialized value
      trace_usb_mtp_op_get_partial_object(s->dev.addr, o->handle, o->path=
,
                                           c->argv[1], c->argv[2]);
                                                       ^~~~~~~~~~
and:

  hw/usb/dev-mtp.c:981:12: warning: Assigned value is garbage or undefine=
d
      offset =3D c->argv[1];
               ^ ~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20180604151421.23385-3-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-mtp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 560c61c7c1..b0ab6a7912 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1017,12 +1017,16 @@ static MTPData *usb_mtp_get_object(MTPState *s, M=
TPControl *c,
 static MTPData *usb_mtp_get_partial_object(MTPState *s, MTPControl *c,
                                            MTPObject *o)
 {
-    MTPData *d =3D usb_mtp_data_alloc(c);
+    MTPData *d;
     off_t offset;
=20
+    if (c->argc <=3D 2) {
+        return NULL;
+    }
     trace_usb_mtp_op_get_partial_object(s->dev.addr, o->handle, o->path,
                                         c->argv[1], c->argv[2]);
=20
+    d =3D usb_mtp_data_alloc(c);
     d->fd =3D open(o->path, O_RDONLY);
     if (d->fd =3D=3D -1) {
         usb_mtp_data_free(d);
--=20
2.9.3

