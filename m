Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4228173wro;
        Mon, 29 Oct 2018 06:38:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ejT4fHx5+zh8xD+QOwQvpFVHWBc7e1TJ4W/lcKoZStC6iHu0jaXyUMDkYf0LVQySKHPuHu
X-Received: by 2002:aed:32e2:: with SMTP id z89-v6mr7985501qtd.106.1540820291546;
        Mon, 29 Oct 2018 06:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540820291; cv=none;
        d=google.com; s=arc-20160816;
        b=YYOZHirY17ojJbE9SXctp0kLnhdx4yMI3faQdw12qmy9d6u567+ls4PhwRfCx2JH2c
         clCtcvfWVyuY/1C9XX9QPR/5yErQ6T/vMnN/0qVOf+FZZ5kW6qxsYipchJUUX8JR2eRv
         dq2YEXaKI+IiyOvHouR3hcEzvhv2jCuGo55vOXwoEyRJwr+y8Tz+m/U+ntCqVLQEi87f
         /R5BzzPSua/BdnH7YueruuDIBLMD1f+tBu3GidvLRHN1EjZjraKWOw+2Bp9orzyWA9x3
         M3jorFAKw8ToCzEUyVA9wSXCKEtx3CU5CNmjmrdVcDkUnv6EnI8rtmY9gV718Ke9GjiG
         gtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2X08bFvayi+PpGvNve1zgC+UCK1M9MY0+MJ2AJ+gftg=;
        b=qz5UvYM9v9gIvRes2wYgFxhxiN59dqPv2+R096HfD6ceGqA5pl4/M2gvLdeOFlbMxw
         FcMggsrcYarnxaa7b00aKCJDAB3AyN6+r9A8UpN4jef++NTcu3ympXDFBym31qAw3W/U
         xvT/MdVF+lALL+W9Pcs3uISF58daaCmloIVxeHaqeHhcyvtcJNWrHHUgKx9+oAmpUJT1
         6u5bfplMigx3mp32H8kJuXEKGNvj3hzyAYfn965XWUJvU7dAe8ywZ3cwU1dwDH5f6sjQ
         GPqw6FpW0+TW3cRN9+kiNCFird8DancLTxtgikFPx6c7HeuFR7U05yISXA+jkOhD1hgB
         61kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l65-v6si6678464qkc.26.2018.10.29.06.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7kB-0001Ov-2n
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jq-0001Ae-36
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jk-0004ck-9s
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gH7jk-0004Vd-1Y; Mon, 29 Oct 2018 09:37:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59ED6AD899;
	Mon, 29 Oct 2018 13:37:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB4C608FA;
	Mon, 29 Oct 2018 13:37:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A4007B3E01; Mon, 29 Oct 2018 14:37:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 14:37:19 +0100
Message-Id: <20181029133722.12415-2-kraxel@redhat.com>
In-Reply-To: <20181029133722.12415-1-kraxel@redhat.com>
References: <20181029133722.12415-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 29 Oct 2018 13:37:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 1/4] hw: AC97: make it more QOMconventional
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@163.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KBdt4nBiGITy

From: Li Qiang <liq3ea@163.com>

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20181013060809.52496-1-liq3ea@163.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/ac97.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 337402e9c6..d799533aa9 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -123,6 +123,10 @@ enum {
=20
 #define MUTE_SHIFT 15
=20
+#define TYPE_AC97 "AC97"
+#define AC97(obj) \
+    OBJECT_CHECK(AC97LinkState, (obj), TYPE_AC97)
+
 #define REC_MASK 7
 enum {
     REC_MIC =3D 0,
@@ -1340,7 +1344,7 @@ static void ac97_on_reset (DeviceState *dev)
=20
 static void ac97_realize(PCIDevice *dev, Error **errp)
 {
-    AC97LinkState *s =3D DO_UPCAST (AC97LinkState, dev, dev);
+    AC97LinkState *s =3D AC97(dev);
     uint8_t *c =3D s->dev.config;
=20
     /* TODO: no need to override */
@@ -1389,7 +1393,7 @@ static void ac97_realize(PCIDevice *dev, Error **er=
rp)
=20
 static void ac97_exit(PCIDevice *dev)
 {
-    AC97LinkState *s =3D DO_UPCAST(AC97LinkState, dev, dev);
+    AC97LinkState *s =3D AC97(dev);
=20
     AUD_close_in(&s->card, s->voice_pi);
     AUD_close_out(&s->card, s->voice_po);
@@ -1399,7 +1403,7 @@ static void ac97_exit(PCIDevice *dev)
=20
 static int ac97_init (PCIBus *bus)
 {
-    pci_create_simple (bus, -1, "AC97");
+    pci_create_simple(bus, -1, TYPE_AC97);
     return 0;
 }
=20
@@ -1427,7 +1431,7 @@ static void ac97_class_init (ObjectClass *klass, vo=
id *data)
 }
=20
 static const TypeInfo ac97_info =3D {
-    .name          =3D "AC97",
+    .name          =3D TYPE_AC97,
     .parent        =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof (AC97LinkState),
     .class_init    =3D ac97_class_init,
--=20
2.9.3

