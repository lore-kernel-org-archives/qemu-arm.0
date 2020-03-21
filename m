Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2051191lfe;
        Sat, 21 Mar 2020 04:50:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvbCccDRI9bnTqSa1aQGZ8cOlU1MY6tXB29iSUsxJ35NUkf11pAB7oQwp8ixtIK2rwhTRft
X-Received: by 2002:a37:cc1:: with SMTP id 184mr12751739qkm.430.1584791408297;
        Sat, 21 Mar 2020 04:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791408; cv=none;
        d=google.com; s=arc-20160816;
        b=huUbJue8xuHQtzyE/t+HxAi4Jh9rtCvQFIQeD+55VhAAJjk3Rdc7OO58CtmyNBAITM
         u7x0j7r9gFL57Woq2CE1aNo28aeiy5LjygyMfSdR3niuUjcMIbwtvPcvDR9f8S5U80uq
         QvfvBsR1Gf4VDhkCzZkBAx1MGJtXj80gT5huz+JolGSXh49sK4sIBoCMxbOxwzbhVtH8
         BO6dU6bXsJYqJBevK7KHgD1gZWf2YKKs+cjkyKG6Zd6LDmMPzri1Dva7Ga7wWO07KOO2
         0rY25OfG6SUt/JtTH+cs0SFUeUcF57y2w4KyvLlCB+B3BUoV92MP/OxvZRrF92Dv+7+h
         EpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kQDd9EbUfb0uuK6iIsTzZMSp5qbZytglJrEh2QYroHU=;
        b=HSjhlgx0ptEgoF1oCx96lv4Kq1TvZUD5zjeOHMT7OBfcCS2J/dH4nwtNjagdUwjdOe
         GN8Qzd+z0K2XYFKwveCEGzfSJI3e+GMWNmUhBssECZ6O6KqcDLp4EjnxA08oDBk2hJeo
         38AAlcwMGdsdsXvjfeJvn44Bg4MDUCCKNgpULSvyux2cS8/OA2UZ7Zq80bOAVworr4/h
         Aby2GiAfC+DzHO78XMPcRqB+NM6h3vXuvjds9VXVo+AI40tQEu7fauP3bCckgeV6r+G2
         19YC/vB/3UJchLT4O3066KOkE99ycnNgGgZkwfp6IrR8XWbz/lG5XQkmm2uTny621Od8
         0Y4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LhhPvsHq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si5491089qtb.147.2020.03.21.04.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LhhPvsHq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcdj-0007DM-L0
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaW-0000zE-RS
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaV-0006RQ-SE
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:46:48 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:33888)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaV-0006R4-Ns
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQDd9EbUfb0uuK6iIsTzZMSp5qbZytglJrEh2QYroHU=;
 b=LhhPvsHqd+9gdTRral+5RxEjZBb55LkoxKF+M+4woFoWlVl+baD2C8ezh9bEWIunzAXSje
 O/orR9E5XjJosjOliB1f/hibVjX1f6VjNcsja31nVJ4ebaoLz4XzBg6dbHAM1v0SM7fqVZ
 KMeqTee5qLPCkZE4k7fTRcyuGG0l7OM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-9XMnFl3QMz24FJrC1AOHUQ-1; Sat, 21 Mar 2020 07:46:45 -0400
X-MC-Unique: 9XMnFl3QMz24FJrC1AOHUQ-1
Received: by mail-wr1-f70.google.com with SMTP id b12so4215754wro.4
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 04:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jHPzgLUxabSngeicFYbktzokTE6KbRJJJ5XQsCuGXA=;
 b=fFSjHh4f0tzltGK6FCynw8xMGYrJyqFIsBgy9zrOkgaibK6PmpxJBCw2qyDEaQOqno
 XXyM6siefXXfM7JdplhjLAXZXlCdHDaLRG8hNJy4WDvKOz6aeoFgOb8jATMqY2AtTUKv
 PZ+2BmHUy8XxtHefjwcOWkOcjI2vbBUzzMczw+BYx3paNhguMfd2rxiYSolc+Sqt6Pma
 yw6RZKZGAJA5PbA/YkHw+XmkTAnUJXcrDesVX3Pqay0bXUJVce5NuhfU9gC20s6RyXHO
 FvKQE7EyL9fpxN63FoGL235H3z7VXRT9rNBjTGmYTE1uz+xs+p5/HuYdzzBZlZ8eQID/
 GlWA==
X-Gm-Message-State: ANhLgQ0NON0Dl0x+4r0Y87OyDGiyuhEO6QeafGPrHEgGRlj0zaVGFFQS
 hSOL37MjtYdosEHgBfnVBjqqzJGrd+rxfwiJMfUjmmjy+dSap3QVW6/SX1fl0pEyyQ7+e1OTuQG
 fbcK0pKDmPz2dYCs=
X-Received: by 2002:a5d:66c2:: with SMTP id k2mr16786078wrw.408.1584791204442; 
 Sat, 21 Mar 2020 04:46:44 -0700 (PDT)
X-Received: by 2002:a5d:66c2:: with SMTP id k2mr16786051wrw.408.1584791204274; 
 Sat, 21 Mar 2020 04:46:44 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id i67sm13424296wri.50.2020.03.21.04.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 03/11] hw/i2c/pm_smbus: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:07 +0100
Message-Id: <20200321114615.5360-4-philmd@redhat.com>
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
X-TUID: cpSH0oLoANSL

Fix warning reported by Clang static code analyzer:

    CC      hw/i2c/pm_smbus.o
  hw/i2c/pm_smbus.c:187:17: warning: Value stored to 'ret' is never read
                  ret =3D 0;
                  ^     ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i2c/pm_smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 36994ff585..4728540c37 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -184,7 +184,6 @@ static void smb_transaction(PMSMBus *s)
                 s->smb_stat |=3D STS_HOST_BUSY | STS_BYTE_DONE;
                 s->smb_data[0] =3D s->smb_blkdata;
                 s->smb_index =3D 0;
-                ret =3D 0;
             }
             goto out;
         }
--=20
2.21.1

