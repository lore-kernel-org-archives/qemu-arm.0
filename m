Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2209083lfe;
        Sat, 21 Mar 2020 07:42:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv9PsyQI4sHO6P2gyexBz9K7cThSC9S1AyaLdZaMbG6V7PbhS0Z0j+923A5tD3eJ5+WU6kb
X-Received: by 2002:ad4:458d:: with SMTP id x13mr12586478qvu.155.1584801747330;
        Sat, 21 Mar 2020 07:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801747; cv=none;
        d=google.com; s=arc-20160816;
        b=CAmYRdvN/bAF3csKdIUmeRwllAqaJODCjTOrF634MKcgL9LbiA1zYw01tL5uOLQrB6
         BsLbGVE5gDW3z2NMi7S+DGelDNDKqPtdLxqkc+UmhQgTRvGMtfMzkNWQCajAQvDXRLSz
         MI+nMizYahKpkEdKzes93y1Fn6TcZfQsDhjXYDkdP7oOyPr3dy6LyQhWAmo/ekYiviGS
         xs5ehjxA+RYJn+AJQXZeUltEfv6QKXL3p1AKaPbzt4/rPt3PV8YBAPxKnOiPhSO0oNCz
         F1jmankqk8fCxiYGXFPElhiKrNk/XsQc5Mm6uYv1/pq2J+SoB9s7/V6XF9fYysOfd98/
         EiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HG9aIClnSQgwbfwrNWlQigZ+p9jo+t2veKUaX85pzII=;
        b=E1dTSHlpXO6PskRIBCyxe2PEmJ5MLqaE/e3jShBCgY6ij8VK1my9c6rU2FpPpuy4mT
         HieCkDYY2fhgOO474twi6kzhsN7ngE0FxJGEF13nV9nVzxAIsqtmokIAH4EI6cgbocOZ
         mp/Bk12fyPoiX0D0mTEQCskA/9opLz1AO/1nn+HBlZAwloJqslC1TjU9kUf4KVomGvUs
         Fjp2m6/RAVOSTzHRzJcalMmnCJmeuMOCyymfwP8vRkLXU00xxsjV+vbVbeJot7JYp+r+
         8GcdCHjKeXYCfmzNp+DUrHBZgkqbsgC1SnYl+8JGhuR3CtBg6x6w6y1aQBzKv/cE+2Ks
         LhMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=alEv05n2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si5182762qto.241.2020.03.21.07.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=alEv05n2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfKU-0005wp-Mg
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJo-000596-F1
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJn-0007PW-95
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:44 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41569)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJn-0007OV-5L
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HG9aIClnSQgwbfwrNWlQigZ+p9jo+t2veKUaX85pzII=;
 b=alEv05n2sfcCenreaQ42B7wM3I9K2QyGTYZ/MOk7pImV/CRtija0xP0/vTgOt924/374W/
 hjzjKpX3p9ZcA4DNLwdbhllifUP3ywBB28RsAa8H1xW0BeLH4ckw7OrvOTki6Q1JQJJKos
 aUSHudgDfdfkUbKKzOpK4AOInkioVWg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-ECWmYhZgP16I_peaEPbebg-1; Sat, 21 Mar 2020 10:41:40 -0400
X-MC-Unique: ECWmYhZgP16I_peaEPbebg-1
Received: by mail-wm1-f72.google.com with SMTP id p18so2558363wmk.9
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eqn1OJZAYDlLgDc90kBVx1WWSAviOqkIwIwDScG0wiQ=;
 b=NMjsYZCv4dK5AW6AVf3YtT/jffasZu/pH9pK/pMWsPAW9kbxHHEBecyKWuUVewgqo0
 1jez930bFpwv9Ihp7VVfGrQhZN/7qi0mz3itqm85saXvfazWGnpcpSMUHQAyEcf/3/QG
 bpi6nNWyPXWBF+tJ27LNgWbNPj1dsd9oKYFIPvxFnHiTJFAyUgi/dHmTQ62BSE+FJ0Ai
 eHmPeWSLCREx7jNIB+A11nOyiKdzh33CSL3wMV6nQbtAfP/d+ypOzootPt9B9vys0SjW
 4nFp/nbYKUkXpSibPVXd1ABus8mz6zTklXsTnU84/M6o07Mj0lAdZbXbkvG/E12tW9bD
 JFGg==
X-Gm-Message-State: ANhLgQ0us8BitkDmZD+eHL7DmOfUTBeU9+Lxm4qe9KPDKOWP9TKzwnbM
 puMgYBF9VosXxJeRfvzPNyr3WAggvqxklnItPs0aH8wD5+pYOH9ALKGSjLyN7xfyAW1fGpAt6LV
 QzX2KR5cHefBq
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr16372088wmm.3.1584801699577; 
 Sat, 21 Mar 2020 07:41:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr16372067wmm.3.1584801699378; 
 Sat, 21 Mar 2020 07:41:39 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id a13sm14020382wrh.80.2020.03.21.07.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 04/11] hw/input/adb-kbd: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:03 +0100
Message-Id: <20200321144110.5010-5-philmd@redhat.com>
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
X-TUID: b7YsKxh2Fxas

Since commit 5a1f49718 the 'olen' variable is not really
used. Remove it to fix a warning reported by Clang static
code analyzer:

    CC      hw/input/adb-kbd.o
  hw/input/adb-kbd.c:200:5: warning: Value stored to 'olen' is never read
      olen =3D 0;
      ^      ~

Fixes: 5a1f49718 (adb: add support for QKeyCode)
Reported-by: Clang Static Analyzer
Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Remove 'olen' (Zoltan)
---
 hw/input/adb-kbd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 0ba8207589..a6d5c9b7c9 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -195,9 +195,7 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
 {
     KBDState *s =3D ADB_KEYBOARD(d);
     int keycode;
-    int olen;
=20
-    olen =3D 0;
     if (s->count =3D=3D 0) {
         return 0;
     }
@@ -216,7 +214,6 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
     if (keycode =3D=3D 0x7f) {
         obuf[0] =3D 0x7f;
         obuf[1] =3D 0x7f;
-        olen =3D 2;
     } else {
         obuf[0] =3D keycode;
         /* NOTE: the power key key-up is the two byte sequence 0xff 0xff;
@@ -224,10 +221,9 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
          * byte, but choose not to bother.
          */
         obuf[1] =3D 0xff;
-        olen =3D 2;
     }
=20
-    return olen;
+    return 2;
 }
=20
 static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
--=20
2.21.1

