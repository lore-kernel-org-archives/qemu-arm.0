Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357168wrh;
        Tue, 7 May 2019 01:20:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTA0cc6svOFkaOHBnNRh4604I7lGRRsaS8ysA9msAYr6OSmi9GUEKdF+VFvxqijwK6yZ80
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr19879242wmt.33.1557217226247;
        Tue, 07 May 2019 01:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217226; cv=none;
        d=google.com; s=arc-20160816;
        b=e6Ei9gkjvzmqukwRsX8byi6RkNzlGRp2XCuo9o6i9llp8hatH6kHloU9xyZCSY4bB2
         95oBcEA8IpFHvwLYsZp8nmu1azG2gR3M43YDWpb9zifAchD8/C67xJ/cFDgX/XH3eB5J
         q/fhi7oalOv+1USZ/atECtYpFEK0gmnRGa6hLt5EBGbILFFu1z/qwqGII1OUNhuVJHHR
         TRJXYn0BpLYbvfIVj+wjFZotAxFLgJ81tPW2vVULprv/ArG4OGMRo1xXu/+cWzoEUvqD
         sjig3umSwtMK2rDHCKrWS/XVI6ePf8t512jtmZORtAiuS64pFBXLi9csf8a7awXBGGmI
         SnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=4qj31a7I2py4DzXHKocN9W8fC7tx8OxjPjxs5z/85Uw=;
        b=cj3Zi2bxGBzXA5oXceeF3URDG1n6vHoyLrMIH6Kh2yONIPusY2wRB45VhpkrxQHA55
         Hofs75Kkq74adMn1iaFRBUitpYWS9y0sTrFEYqLu+aC9RKS5Q4h5xTJY9l176h/NPf3k
         uYLqEjJH14Q0Uvb4yF9d0r00c+MyjckJfDvhlHYmDzbJDzU86JP6QbzJxLyTgu0mnQl5
         scizBfV59vyho/Ue+kEq/9yh3/3FwNByGrmbII0r3iwFyJQHAOURsmnIqmE4dnbTv/dC
         lBhQkw5MAB/ZWHyv50y3tWbqtN2hC1BMoBJQIOs9LarwXCqD5M18VIfbYjkmQ4UZEh9n
         INOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25si8437895wmh.41.2019.05.07.01.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvKr-0000rz-9y
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:20:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKK-0000ci-0q
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKJ-00087T-2y
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKI-00086z-UQ; Tue, 07 May 2019 04:19:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DEC8AC08E;
	Tue,  7 May 2019 08:19:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 935EC60C4D;
	Tue,  7 May 2019 08:19:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7905811AA3; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:38 +0200
Message-Id: <20190507081946.19264-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 07 May 2019 08:19:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 0/8] Vga 20190507 patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yOZiQeIRe76l

The following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04=
f7:

  Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-re=
quest' into staging (2019-05-03 15:26:09 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20190507-pull-request

for you to fetch changes up to 6306cae275c7091aa4e785809d956b475bfedab4:

  i2c-ddc: move it to hw/display (2019-05-07 09:56:10 +0200)

----------------------------------------------------------------
vga: bugfixes for qxl, cirrus, ati.
vga: add "-vga help" support.
vga: move i2c-ddc to display.

----------------------------------------------------------------

BALATON Zoltan (1):
  ati-vga: Fix check for blt outside vram

Daniel P. Berrang=C3=A9 (1):
  qxl: avoid unaligned pointer reads/writes

Marc-Andr=C3=A9 Lureau (2):
  vl: constify VGAInterfaceInfo
  vl: add -vga help support

Paolo Bonzini (1):
  i2c-ddc: move it to hw/display

Philippe Mathieu-Daud=C3=A9 (2):
  hw/display/cirrus_vga: Update the documentation URL
  hw/display/cirrus_vga: Remove unused include

Prasad J Pandit (1):
  qxl: check release info object

 include/hw/{i2c =3D> display}/i2c-ddc.h |  0
 include/hw/display/xlnx_dp.h          |  2 +-
 hw/display/ati_2d.c                   | 12 +++---
 hw/display/cirrus_vga.c               | 10 +++--
 hw/{i2c =3D> display}/i2c-ddc.c         |  2 +-
 hw/display/qxl.c                      | 58 +++++++++++++--------------
 hw/display/sii9022.c                  |  2 +-
 hw/display/sm501.c                    |  2 +-
 vl.c                                  | 46 +++++++++++++++------
 hw/display/Kconfig                    |  5 +++
 hw/display/Makefile.objs              |  1 +
 hw/i2c/Kconfig                        |  5 ---
 hw/i2c/Makefile.objs                  |  1 -
 13 files changed, 84 insertions(+), 62 deletions(-)
 rename include/hw/{i2c =3D> display}/i2c-ddc.h (100%)
 rename hw/{i2c =3D> display}/i2c-ddc.c (99%)

--=20
2.18.1

