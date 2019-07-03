Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp576474wru;
        Wed, 3 Jul 2019 02:41:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZXN1ft8ncgpH6LyezEyrP72JnpJ+2rvnXrpvNjH6p2BlD0bWVlptd//q99XjKuSoU1GPO
X-Received: by 2002:aa7:c619:: with SMTP id h25mr41097275edq.295.1562146866617;
        Wed, 03 Jul 2019 02:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562146866; cv=none;
        d=google.com; s=arc-20160816;
        b=P+HFA8eAEMqvEmiaoKxCqjkc5aGxtb3xQ44o7p41up9y+NJXhlODp+EO/k4nR/C7Lu
         5ONbwdqMS3WBPrmH/vvTm3Uk+I8bHtPG9AwI+YZek/0Zc1hKpCgH4wmXXFTZEJSkRbmi
         mqfpUwCSofVulRHrq6RoPzFjsowvKdWH0AtZ5Tsw5lABETwzUvAQXUD7f6V1W+7enmCr
         GxLWFY5Thp5wAqGJUmoRwZRmKtr7xFrjbumHFxc3boEsmg8ppHue5DOWWQbERLWRiRPo
         AKIbQRMdm4X7NRDdDe7JtwUqt49U4a7yYpLea7bHVQeiwRN8LuvINToDmkjIP4nocMfw
         ej3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=/svyc5FZINpnM1ayxe/pkS88wLI9MPQ7yxo1MIVXFCc=;
        b=K0Ut0/P7P9Oo7xcQq++Xd+0BmtqLI84Ra4xOqbFQSQpytyUh9ZWZ25+exEtiLG9Nvw
         HIggfYZsnCCpO6eeiC4E2qoyiEqF+eVPttzphAdr7uxdXFHMb3sx/8amJo5DB6HGm81l
         fz4Io/oxShYLgPXO5khMnhpr6CKlVh35LSQVgo1oNExJ8eLyMTvKuZLmJLiyP0PolFZL
         aIqKyZu3lILrtbolRBQ7fhLzn4wEDUJ0kHQ7J+GMDuQ7vXXPPFUqT6++ZjUcnjfyiED1
         IJYVOIyFRevC5L5ABnkJYP886BMRiz21+4CQkHYQOit04ogNnPpBVLgTInINptLpuQSN
         a4qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si1234996ejh.194.2019.07.03.02.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 02:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiblB-0002bk-Oj
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 05:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hib2Q-00048J-Hv
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hib2P-0003s8-5q
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53236)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hib2P-00030Z-0c; Wed, 03 Jul 2019 04:54:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C59BD30C0DDA;
 Wed,  3 Jul 2019 08:54:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7973E5945E;
 Wed,  3 Jul 2019 08:54:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5E9AC16E18; Wed,  3 Jul 2019 10:54:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 10:54:12 +0200
Message-Id: <20190703085416.21837-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 03 Jul 2019 08:54:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 0/4] Vga 20190703 patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3cTiwDS2Fmib

The following changes since commit 506179e42112be77bfd071f050b15762d3b2cd=
43:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190702=
' into staging (2019-07-02 18:56:44 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20190703-pull-request

for you to fetch changes up to 0a87fd693d4e955a6877a2166b65bb7b7192aaaa:

  Add ati vgabios to INSTALL_BLOBS. (2019-07-03 10:52:15 +0200)

----------------------------------------------------------------
vga: virtio fixes, bitbang i2c asan fix, install ati vgabios.

----------------------------------------------------------------

Gerd Hoffmann (2):
  virtio-gpu: fix unmap in error path
  Add ati vgabios to INSTALL_BLOBS.

Li Qiang (1):
  virtio-gpu: check if the resource already exists in virtio_gpu_load()

Peter Maydell (1):
  hw/i2c/bitbang_i2c: Use in-place rather than malloc'd
    bitbang_i2c_interface struct

 Makefile                     |  2 +-
 hw/display/ati_int.h         |  2 +-
 include/hw/i2c/bitbang_i2c.h | 38 ++++++++++++++++++++++++++++-
 include/hw/i2c/ppc4xx_i2c.h  |  2 +-
 hw/display/ati.c             |  7 +++---
 hw/display/virtio-gpu.c      |  9 +++++--
 hw/i2c/bitbang_i2c.c         | 47 +++---------------------------------
 hw/i2c/ppc4xx_i2c.c          |  6 ++---
 hw/i2c/versatile_i2c.c       |  8 +++---
 9 files changed, 61 insertions(+), 60 deletions(-)

--=20
2.18.1

