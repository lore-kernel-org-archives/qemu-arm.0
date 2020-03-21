Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2211973lfe;
        Sat, 21 Mar 2020 07:45:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs9Rai2Y2vCyQd5aDb/+4rlQD5K11vA3WvHKS0mI6Xr8HbA6930tPzJTbugXIwKG5JpTAVi
X-Received: by 2002:ac8:3671:: with SMTP id n46mr13771204qtb.33.1584801939556;
        Sat, 21 Mar 2020 07:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801939; cv=none;
        d=google.com; s=arc-20160816;
        b=uJ6W0W20vcvCRJC5EKXiwED2kwvXtIT9zopQCoAgOZwOtknvaHGfGb/X/+oopzY67V
         jF3tE4sNiIClSdoBs0NMLXqKxEayomB51Xc0Xr4+57vsf7/ab2KkSN4dT16ruUEQbA/b
         6fuvVp4dHpBS81TU9SCN9zaDEaqalSMmtAups1tavzjFAokMQT1xH70yXdPOT6nmV4vj
         pIveUcj5uAc4WLf/eV9zW63+dqiwS15eSCr5qW+uaEW7ar9z6JPKMyQgcshgWK18XtSR
         lNG7K6S2a9CDdwBFA77Jhk8rxLXF4sz0sz7+8ritrYycVcMwIOy06pOdMVGkBWdd5zeG
         qEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XvtpmJoV32BEyOe596XwKOYG0GxD3I0LNs6dD0KNAUs=;
        b=vXoGui/gQE67H4dtaAp552UbW4R+gAYHDY0ZkDFNfo4nQnv4H4iGFg7mJo2IoBZN/z
         PYf3gw63wFuDkwZBxFEwULjt6grsVmuRcZvB5Y46w745aIus4Ie3MGjQBb6aXphbmk18
         YWhDR8yQZIvgQb1gVk+NBz5qRrYtKuAJgsCOK0SZR8vfF/kWR13fLHG357lbiLVCDo+L
         WFxz1BDiTTZIR+fTe5niIC4QMoUndQ4VEcJdLSLbUER5BMw/399eZBFsQIAKe3WXcqLF
         fmxDy7+YuAzKVr2ypwvMvKhR1f4UnbhoBVyM1CmHYYD6++k5oKoefbB8u/3TsQJPt0/E
         ywzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwrWHyty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si5695646qtq.0.2020.03.21.07.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwrWHyty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfNa-0002wS-VV
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJu-0005Oz-8F
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJt-0007Up-77
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:50 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37517)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJt-0007UP-3t
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvtpmJoV32BEyOe596XwKOYG0GxD3I0LNs6dD0KNAUs=;
 b=PwrWHyty+z2be0trylMvwZNh5+qij8en53BGoIuCWa8yYFZZ4GmcIZZ0X++pVYc7MzFCWj
 /dlZQEy0mn/JU1s0yL2I+1txEy9kRxQxGIw0EbaWZiCkC7rjk8GDCIFD8pnZoKFHRmK0kj
 +bn4GRtLRx9/bPoA6fuW9Eces3pzWI8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-vmN0V0O9MROpspwZqhzAXw-1; Sat, 21 Mar 2020 10:41:47 -0400
X-MC-Unique: vmN0V0O9MROpspwZqhzAXw-1
Received: by mail-wr1-f69.google.com with SMTP id f13so4350867wro.23
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bL5NUrmTjbHjm3pvKXbJpPZgk/5XIoNG4lJHv7ZuRaU=;
 b=hLb5t7o5XFy+Xs239gQYJtEZxitI8Z4yS8eW1Wm13V1gLp4CMeMHZEFSio9UiyPRvc
 s+E7tlIqdAEE4/8t4XXog2lQtfaAFNLQX9ghkxdMftj3dXlFD7rgW8VlxCrwxnitVvdU
 B/izcX3XTPYq1YxcoHPHLUdx/wTK0Sn+QTuub1d7HTjiZjzBIT9voDMXiZnLRAh671Ta
 SNyqmIKth1uj6OZfGDxorE7DNm9DsnCOAdoPgDNJ+2f2s0wXnILaKQpqmqzdg2M65ERF
 jylkdUdmril+ba9zYQFXDdls4LHnq2XPF/LnUNu6qzBOhbo24U8dAmHPKOXix14Ievbp
 DJrA==
X-Gm-Message-State: ANhLgQ1S3tCZYZQIYNmtD6Ne7nt7pKkm8Td9NT2LO1BMJwAJDMN4qb7N
 cb5YCgO3BLsYCp1BwRugvsth3GMDbO2xS/L2l4GU4JQayimtX+Ewsec7p5+ppuWvK0g1i0Ghp6Y
 mXzmtAlrJliVs
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr17193366wmk.160.1584801705930; 
 Sat, 21 Mar 2020 07:41:45 -0700 (PDT)
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr17193337wmk.160.1584801705724; 
 Sat, 21 Mar 2020 07:41:45 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id n2sm14551205wro.25.2020.03.21.07.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 05/11] hw/ide/sii3112: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:04 +0100
Message-Id: <20200321144110.5010-6-philmd@redhat.com>
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
X-TUID: kaLpDEsNoVsp

Fix warning reported by Clang static code analyzer:

    CC      hw/ide/sii3112.o
  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
          val =3D 0;
          ^     ~

Fixes: a9dd6604
Reported-by: Clang Static Analyzer
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Fix the correct function (Aleksandar review)
---
 hw/ide/sii3112.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 06605d7af2..b2ff6dd6d9 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -42,7 +42,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr add=
r,
                                 unsigned int size)
 {
     SiI3112PCIState *d =3D opaque;
-    uint64_t val =3D 0;
+    uint64_t val;
=20
     switch (addr) {
     case 0x00:
@@ -126,6 +126,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr a=
ddr,
         break;
     default:
         val =3D 0;
+        break;
     }
     trace_sii3112_read(size, addr, val);
     return val;
@@ -201,7 +202,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr=
,
         d->regs[1].sien =3D (val >> 16) & 0x3eed;
         break;
     default:
-        val =3D 0;
+        break;
     }
 }
=20
--=20
2.21.1

