Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2209856lfe;
        Sat, 21 Mar 2020 07:43:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsqJLWQKYAoWI0deZu+N0vvlHXS93DQUmZ4Wref8z8fOZP+axnJZrCsSJIFqpgTt/KKJ9gJ
X-Received: by 2002:aed:2591:: with SMTP id x17mr13598245qtc.380.1584801792917;
        Sat, 21 Mar 2020 07:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801792; cv=none;
        d=google.com; s=arc-20160816;
        b=OB//51qKCZ/NsTApy9KIFvNo/EpZTRFuUAvQ5gY+sjRq1lClsa0JNpcH/pSiNmefUY
         RsKkhnnL3SjPWVb21JzP2wfJ+Pu7D0orooGxfwpx6cYv+qCLVMveOxjyaVGBaWOfwK0s
         G6O5H6aSIu9C97AhkjUaY7S1vnJet2wD00O3i6TV5VaPl3MHm+NzzJaPU2X0OMd/5HO5
         qRUvdUAe26uTxLYAGFGEl2Ed6bZZRcL43kbawFp1sn1uRml4WTWXdibSfjSyI9Ef4W3Z
         ElfFkF5uboTIXfo0XpIyTQSYC08u18lQM9ojA9IV40q8SSH7qtgDNjm4Vn0xaKoZ0LL9
         OGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wabz9ShZfSLuxIv0MTXDbxATC0FT6q8THWUJCXN/WkY=;
        b=08L47qUgbF73dJi3622LU/4H1PjO7xgrBXnqOajbdk8rOoh6j4KypjU+xgxyEm6H69
         2d7lg+tdwCcrcWRCsx7hq/Fe1qcH7/YvlvO3reH1VfkUpQghtgCcbekIC1YTSndMGBXU
         nlCfb7WIQ33EXaukjD3GXKxfqWg2gbTnaB3z1pcJYt9TaCGKVEM/cAF9N4BYlg5tYzuX
         fEHWefPEH340xmSaoR+U6EciEjBtXM65+M3NB1ZQzNDnaKZLj4oFP1ahlFVGzMxho2EC
         zDxAG4fBA+cv1zap8b1Nw+jriYT+MNUwFr59yxri9/U56zPfsboyhcRAckj9bT4RCS3A
         MCXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XZaZT9Kv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a58si5759721qtc.4.2020.03.21.07.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XZaZT9Kv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfLE-0007ag-AL
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfK6-0005jw-Q7
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfK5-0007d1-Le
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:02 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:50557)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfK5-0007ca-Hi
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wabz9ShZfSLuxIv0MTXDbxATC0FT6q8THWUJCXN/WkY=;
 b=XZaZT9Kv1kzu7sGM8bfJcaa0BGUWav1tr2dRp9uLV4k/w2LxoFp5hsF5HStBV99vEw6Wey
 7Z0joxoWn/asczC6AsCzFO4rhYt+3TdWJu/HOoSGJqJGms7rfH7frlBgT67M4u5H8lEje7
 /2sw0Z5cBo1y5knW3KG6F/PbA6qa/9w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-Jb-MjCzyNZy1YJ9lnYyTYA-1; Sat, 21 Mar 2020 10:41:59 -0400
X-MC-Unique: Jb-MjCzyNZy1YJ9lnYyTYA-1
Received: by mail-wr1-f70.google.com with SMTP id b12so4406214wro.4
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDep/UAh9LxMQ+p+ZbiwORp8mGO979hnIy8cu0Ibo6A=;
 b=pStX9HsJdo2G52sESHOIcYvJOJupEAex0uSG5O5eVFzR6Ge48D5QMMcDoSvP0v6JDu
 pzuxu3hY21f9lPkyMxpcXnIC/Dt8hur65Vt5gi/YljVCTuMlfrbUhCYSDzFDwHVpLPJ3
 9Sv3MJKNQJquK5ZJMdqrhGBnle7iAFJcIMl7NjbnUK8US70K2Mj2LnmkqGlZP/8+6MEc
 JBYPTsh/ltWOOniPpxDUdA3yzOHeNLuHV0Wmo5Ek7T8T0ZIO1/TY/oX5CMulfCrlmWPF
 V2b5xY1YUKxO2ZEGPa0nzSM5bkbFQ91GoZJTlUz2ubX10AxJF6f6zMkaquLZTgMNmIXW
 Ix+A==
X-Gm-Message-State: ANhLgQ3TjofDQpKXjxvOY3wbnmEAVbs9cXeGFm4mDg7iDiJ2o8aL+CXh
 ZWYcHUHkP19+JkCo5PINWN1b3IxdiI4p4Bx2V4Hk2b6bHNDFlSFUIlPYg1LV9gXNBZPP6ni6Pjq
 S9lwZFRGRnFe4
X-Received: by 2002:adf:b307:: with SMTP id j7mr18622695wrd.128.1584801718377; 
 Sat, 21 Mar 2020 07:41:58 -0700 (PDT)
X-Received: by 2002:adf:b307:: with SMTP id j7mr18622686wrd.128.1584801718221; 
 Sat, 21 Mar 2020 07:41:58 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l8sm12553155wmj.2.2020.03.21.07.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 07/11] hw/gpio/aspeed_gpio: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:06 +0100
Message-Id: <20200321144110.5010-8-philmd@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CcIYlRKP1V8p

Fix warning reported by Clang static code analyzer:

  hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during its=
 initialization is never read
      int set_idx, g_idx =3D *group_idx;
                   ^~~~~   ~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Do not declare g_idx in for() (Zoltan)
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 41e11ea9b0..bd19db31f4 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -714,7 +714,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offs=
et, uint64_t data,
 static int get_set_idx(AspeedGPIOState *s, const char *group, int *group_i=
dx)
 {
     AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
-    int set_idx, g_idx =3D *group_idx;
+    int set_idx, g_idx;
=20
     for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_idx++) {
         const GPIOSetProperties *set_props =3D &agc->props[set_idx];
--=20
2.21.1

