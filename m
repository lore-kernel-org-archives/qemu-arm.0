Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2339655wru;
        Fri, 28 Jun 2019 03:40:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhQjEQtQwtgTKFmHUskfIzzDWAxMABW9CNlj9ZiLeeBSQc6ufWwGrEoJTBzKnluQEZWdU4
X-Received: by 2002:a17:906:3482:: with SMTP id g2mr7860309ejb.186.1561718433543;
        Fri, 28 Jun 2019 03:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561718433; cv=none;
        d=google.com; s=arc-20160816;
        b=No+JBnPCfMmpXQ0uzIybk/SMPAZXzhrNBI5agslt4yBXN+twokCcM/HKrsJo3ky/Jn
         S6RK9ran6D3Co9o+1iC+Uq8YrgKiDURiNgSSQyMln9+Sr4ddplldJV0ur6W3C6rg3v/n
         Ng5FRzNH0XzWJUkodMPw7Y2wxUair89wmuVRwA7ALhusjC2UcxoW4GqyeYnn3W8sH1iz
         gfUzKyX/QDF4ERPHp3i8MErBTyCGQBbI7sY6UFaTzhB2DJ2r35IlvlBrOMGzsk7RaQlR
         WpB3gjswfL+g3hD2189K80cEpGm6GeGDfZDUDujW9iObj6GuEEOmvCdMjbZldrmA2CZt
         cD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=Nmr6xREppz8mkyu52BONCE93lgA8toW/arpJKxBAhRU=;
        b=RQrcsp3j7bvO3cwoNzx5q/KqM261Kk9RBPRsiLvFSsea0Pj6AFbiK8DlRMvNOwr4KR
         0z1EDkqKogpnmW9SOs45tcIg0I4rhK8FiDA3TS3VH+2972vfWssEH/qjilZrSfkDGb7z
         7TBoOfnTmReYZVfDrU+OpZQiFnmp81sXNdkELIUeWp2n/HK++2FldKfID/F2FrVMlA/y
         hWFtrEPbOzZAMNpIP5yRU16IqBWvxLfPf0vgaJF3oeuI2533MEzMaYz3iWNgKhBhCy/c
         vP4bQeZpUENkEWcVp1dGfJsYPoCKHJNsaWIHyOP08KUVmhnfZ13RurUyWN3t8VmNO1ML
         //RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si1658810ede.62.2019.06.28.03.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 03:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgoIy-0002KI-FA
	for alex.bennee@linaro.org; Fri, 28 Jun 2019 06:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60491)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgoIm-0002Ew-Oo
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgoIl-000642-03
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hgoIi-00061W-S0; Fri, 28 Jun 2019 06:40:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE2B7308FED2;
 Fri, 28 Jun 2019 10:40:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10CE019C4F;
 Fri, 28 Jun 2019 10:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E478011AA3; Fri, 28 Jun 2019 12:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 12:39:51 +0200
Message-Id: <20190628103957.9504-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 28 Jun 2019 10:40:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 0/6] Vga 20190628 patches
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
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o3fb6YnOvNot

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeac=
de:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-=
2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20190628-pull-request

for you to fetch changes up to 263807f4e85e94f2d4e988d61d2fc0319b1dd36b:

  ati-vga: switch to vgabios-ati.bin (2019-06-28 10:49:36 +0200)

----------------------------------------------------------------
vga: ati fixes, add ati vgabios.

----------------------------------------------------------------

BALATON Zoltan (3):
  i2c: Move bitbang_i2c.h to include/hw/i2c/
  ati-vga: Implement DDC and EDID info from monitor
  ati-vga: Fixes to offset and pitch registers

Gerd Hoffmann (3):
  seabios: add config for ati vgabios
  seabios: add ati vgabios binary
  ati-vga: switch to vgabios-ati.bin

 hw/display/ati_int.h                 |   6 ++
 hw/display/ati_regs.h                |   6 +-
 {hw =3D> include/hw}/i2c/bitbang_i2c.h |   2 +
 include/hw/i2c/i2c.h                 |   2 -
 include/hw/i2c/ppc4xx_i2c.h          |   2 +-
 hw/display/ati.c                     |  99 +++++++++++++++++++++++----
 hw/display/ati_2d.c                  |  26 ++++---
 hw/display/ati_dbg.c                 |   2 +
 hw/i2c/bitbang_i2c.c                 |   2 +-
 hw/i2c/ppc4xx_i2c.c                  |   1 -
 hw/i2c/versatile_i2c.c               |   2 +-
 hw/display/Kconfig                   |   2 +
 pc-bios/vgabios-ati.bin              | Bin 0 -> 38912 bytes
 roms/config.vga-ati                  |   4 ++
 14 files changed, 127 insertions(+), 29 deletions(-)
 rename {hw =3D> include/hw}/i2c/bitbang_i2c.h (80%)
 create mode 100644 pc-bios/vgabios-ati.bin
 create mode 100644 roms/config.vga-ati

--=20
2.18.1

