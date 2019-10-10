Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2362419wrm;
        Thu, 10 Oct 2019 06:16:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjP29OTkWYQLwrmWpZIhTE+APiYsuTyKWkwihrdAUIvRU0lewIplblZYHG6LDTiAiwbRm5
X-Received: by 2002:a17:906:6d82:: with SMTP id h2mr7963350ejt.127.1570713373789;
        Thu, 10 Oct 2019 06:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570713373; cv=none;
        d=google.com; s=arc-20160816;
        b=F14jkLnq8tcQURbiEFA5TjlkSpF4Ao7uEdTfJf+0bBj99+VDzSuQUeWCgdi6L0RobO
         KaOgZ7fxiP2xfEJ6k6mDDmZPT6lrGE6vm6jN+eQxy3GGmgl8PXeGf18SJeqrwJJ3Xk6s
         Bo7k7JHpGVg0vfPKIx/HoosvM3lPusimtUvSGa7Bqf1DcTRbEZInabSG3nY3ImT7C5s5
         Q/haARS8VBKRfqRauQNKg8RbQe+cuOuLBw/kzjBLUNTwhbFbE6KivPdRDuiG9DUvADBm
         es63sgoHQeg+VF8Gygb8xRp40dGuVnWohkhQkna1JdUHet4PcZrFtD+HnxQOZjzIhw/Q
         1M9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=JXPpTJzGlcoCjh66jbYW0bFM9iVB1JH/APiwuDf/D9Q=;
        b=UPZUEHadYlerxGeaFUAy8/RAIKCn3SM/RTq/hEsB35OciuGqlbvrzeC9XTXqKVsXwy
         4Cf1/xVEL2cnM0tbTVQ3zsPYPWkKZ+EVkxTw1LMZ6Xt5vZPWaB4uyuRcPaz6vFZ9Lv5u
         VPMIXcSCbUNaqLS8XseDa323YnFXuvHQiWsfJijCieCCE60zm/Kr9AVFE+CJ3CJbwFWD
         0RNcOUxBkZpCClfPoc2Zwl6VrA60J5TJ4RHMomV4/BVS2lctYgPYbtGeXR17d2x9tp+D
         h3pCR6L04ePNcq1VrVJMZWpOmma+FGlLyJraoYEY+cKdIXWZeSQhSgoaRUOghl6DgGtz
         RAUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si3384384eda.277.2019.10.10.06.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYIe-0007Zu-9B
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYIO-0007W2-9P
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYIL-0001sW-Lt
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:15:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYIH-0001qr-Gw; Thu, 10 Oct 2019 09:15:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A6ED308C38C;
 Thu, 10 Oct 2019 13:15:45 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB6960167;
 Thu, 10 Oct 2019 13:15:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] hw: Convert various reset() handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:19 +0200
Message-Id: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 10 Oct 2019 13:15:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v37DsUjN4N1M

Only patch 3/8 is missing review:
- hw/ide/piix: Convert reset handler to DeviceReset

Since v2:
- Fixed PIIX_IDE conversion (Li)
- Added more R-b tag.

Since v1:
- Removed the pci-host devices
- Removed the vmcoreinfo conversion (elmarco) but add a comment.
- Added Igor's R-b tag.

Following the thread discussion between Peter/Markus/Damien about
reset handlers:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
I started to remove qemu_register_reset() calls from few qdevified
devices (the trivial ones).

Regards,

Phil.

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01677.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06367.html

Philippe Mathieu-Daud=C3=A9 (8):
  hw/acpi/piix4: Convert reset handler to DeviceReset
  hw/isa/piix4: Convert reset handler to DeviceReset
  hw/ide/piix: Convert reset handler to DeviceReset
  hw/ide/sii3112: Convert reset handler to DeviceReset
  hw/ide/via82c: Convert reset handler to DeviceReset
  hw/isa/vt82c686: Convert reset handler to DeviceReset
  hw/input/lm832x: Convert reset handler to DeviceReset
  hw/misc/vmcoreinfo: Add comment about reset handler

 hw/acpi/piix4.c      |  7 +++----
 hw/ide/piix.c        |  9 ++++-----
 hw/ide/sii3112.c     |  7 +++----
 hw/ide/via.c         | 10 ++++------
 hw/input/lm832x.c    | 12 +++++-------
 hw/isa/piix4.c       |  7 +++----
 hw/isa/vt82c686.c    | 11 ++++-------
 hw/misc/vmcoreinfo.c |  4 ++++
 8 files changed, 30 insertions(+), 37 deletions(-)

--=20
2.21.0

