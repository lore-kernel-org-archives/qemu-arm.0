Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2052577lfe;
        Sat, 21 Mar 2020 04:51:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvYYEOV7+LfXB3O4xWig+hc7br2UCQKJHfJDe82RhEL64mHmaLb2Q3o3dbADFTMnhzR+snV
X-Received: by 2002:a37:b17:: with SMTP id 23mr12942162qkl.326.1584791517153;
        Sat, 21 Mar 2020 04:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791517; cv=none;
        d=google.com; s=arc-20160816;
        b=OsT7xJJEcMPQ2V5iu884/xh1hnx+XcUO8esyuLMPyvuPGedRDPVjwFeMXDD691NtRW
         xdH/Fn960oheAV+nsXyGuZ9j+PayNI0WCdbarQYf6IhYUjSvtdewtkezbj01jxJZbPyH
         JeQlkcJav/1ohy3vbeqmJF1ulxSNE2nTlkrpYejuqpl3HSKSzavBgkzjuR5hYCkLnhY+
         j1G23wFiUSj1X+Ejp9ucnUE6zhKyrZ1iroFEUHQhmQ6N3y+bkq4+af0x3LlWOy6YKcoU
         okdEVTA/YH9BYOmJXBoJkcXz7Zuk8DqapQ1tHeyZexKc02pJCx2s2agua/iXpt96EzdC
         DuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c4GCDGuXxVBz+Q5fzhTo9pG6tPh9hgrqUC7e1TLGPOU=;
        b=v0evemCvkh4ujjcXalw561R0qN8fU8J9gW4BrF6aCHsqlLxMXFGgmGKDg/JLZjH+Kp
         INDhHcUwMbiHEW2Hzpp5lx/k6uG6W5kxCIJssT7IidnS4ZlTLX8ihqns/P6KZriN9+3O
         r6LNxqe8BLSQFvcEH/hDcnSY/5/Zrxl3mF48EvIdN5do7LmpXz00Cf3DhOYYnuFnNJ8y
         CFpSF05HW2q9TMzPAOMLYKtngP/Pdl4XbvoafDwpczV3AzSKgT8iZXEbtOq8/wRZxCHu
         5RrJbONpRQiAG5Tn+Z9X4ORwq4JAfk6Y0Iw1RS4lk4NXvUx2wtMsvCa/7g2Q3GV0kjZM
         cfZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="hPY3AvL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si5227870qtr.67.2020.03.21.04.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="hPY3AvL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcfU-0002VT-J0
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcai-0001Le-7U
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcah-0006ae-50
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:21483)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcah-0006aG-1l
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4GCDGuXxVBz+Q5fzhTo9pG6tPh9hgrqUC7e1TLGPOU=;
 b=hPY3AvL/rn5OmGMQn6XFbJUp9MOxmkHpe7cJH4dzYGQ0j30UQCT443H7iOlLVP6qsCc8AU
 oPW0bOxhRvOcRSxWgNGUECuXa2dXc2Mu2Gtt9Anlwqrn9lwmIOcLkbDVa5dYnGQodgl7ht
 tSXOXFv5v2fBmet2IGzIrJYZWs6emZc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485--yLcort2PHGRixcSt5MazA-1; Sat, 21 Mar 2020 07:46:57 -0400
X-MC-Unique: -yLcort2PHGRixcSt5MazA-1
Received: by mail-wr1-f70.google.com with SMTP id o18so767824wrx.9
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 04:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EI7aeJF1EJiZnbf/LHlroG4oQCKwaeGXEJr4kT4GssI=;
 b=OJzs3Ak+bznNkJUhuKVOoJ4T/TKfubwRcdDgvlUOAu7utbnV/Ju8D0OsrVcQ3cWezO
 Yon2d1dF4JjK73rKwwyHszisVv8zoPVauH74Gj8CWXFg+TanUFyIs/n6b31yVI4u/FQ7
 mR4TIV2KVcl5hwQnHJvTLvIjFk43XA9qRYuWD6054k52+qzJZX18ynnVllIQOTjQmiD0
 /WPD85dAKcWAWs+ybjKGJGhzIeyYIrumm8fQLtoNyIsKwLESR/5+PwPdDOyS03ZxlnJT
 jsswP7vqm/96d2Stdd1W0pgnhGpFtusmzfPIKn5S3qtvClVnhhz3NPXVfcqgFBKIHhbY
 Vahw==
X-Gm-Message-State: ANhLgQ3nXWf24Irp6+PiBlGv4nC1E7dyRQ1+hdiyFvEV06umKcx5CCTw
 /PKBvFQZNXd3su3ZYbSsZga3e49rMMPdo+DOiT78RzaBLyXFx2W+kwJSqWekKILZHBPVAeYDtnt
 Lx5A8cQBUdI5mBh8=
X-Received: by 2002:a1c:a950:: with SMTP id s77mr15599448wme.176.1584791215862; 
 Sat, 21 Mar 2020 04:46:55 -0700 (PDT)
X-Received: by 2002:a1c:a950:: with SMTP id s77mr15599432wme.176.1584791215666; 
 Sat, 21 Mar 2020 04:46:55 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id y189sm12549500wmb.26.2020.03.21.04.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 04/11] hw/input/adb-kbd: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:08 +0100
Message-Id: <20200321114615.5360-5-philmd@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
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
X-TUID: FEgz2dHkDIww

Fix warning reported by Clang static code analyzer:

    CC      hw/input/adb-kbd.o
  hw/input/adb-kbd.c:200:5: warning: Value stored to 'olen' is never read
      olen =3D 0;
      ^      ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/adb-kbd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 0ba8207589..b0565be21b 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -197,7 +197,6 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
     int keycode;
     int olen;
=20
-    olen =3D 0;
     if (s->count =3D=3D 0) {
         return 0;
     }
--=20
2.21.1

