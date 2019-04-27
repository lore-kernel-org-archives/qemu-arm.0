Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1709069wrh;
        Sat, 27 Apr 2019 07:15:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoF6oFKpmdlM1PNj95AYM4KIHquhatr4wraQaD+F+ypnAMK+TKIeWACyIUezJ7btOzoex0
X-Received: by 2002:a1c:a184:: with SMTP id k126mr11490817wme.71.1556374525815;
        Sat, 27 Apr 2019 07:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556374525; cv=none;
        d=google.com; s=arc-20160816;
        b=AyaSOJXxMR2O9EmWqGHoLOgWH3DJVpdMDQYRzL8rMfvPyf2PKuiu/ejBpE0oYp9zeG
         MgUNi6gH1ATNMAjnRKgY7is4y+UwKT/4vurxdqVK/6GOq07RDQH0QMBav3umsqs/iUyN
         aGIX9cMzKTHNSlI2W6Bwqsb5/a9swKDpPlXKxCpRsI9B9VHSjp5fXJ+yXcmKc8dL/pyo
         67zsJPghxzxhZoPInbHJj4ufue6DACSAZQW6Y/b4jxhO3ANvYc5dADd/K97uDNK02hP1
         jEb0KEQq4KcULvIO+JJOc4XI0goP46deVva3SjPA0UWHykyczgT/iMWpy44uv9m08ML+
         pbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=pe5OJC6rTih/PsPJthMZ9HMImPEHwp2w6l+3l9+4FdA=;
        b=TT/ODUcAzTBBp3r7VonwqsbfOhcMG323aGgqLQH+pZaPqQauZIEkVxMawPlr2kUVbK
         ZlCSBPGgDR7ZPMuO8smcNvc3SRDb6WYABWb+8fXAx1OLzCrbypQZ+URJDyJLe9lHuryr
         tGCm1h6SnJSyqykyGi01E0gh7gP9gkTYGLUc7uQ+FDutvpsxjdgZgyq7vnQYwCd8Hx7t
         oyOTuAXMP58sR58lIArYDoIgJ/8cBmBy5wl2ODAeGjb2tV127z24sZhCebSKM9aCBRY3
         IBuMn0lo5ujYNnEYQYeDVOiNeIjCkxpAnc+0Kh5V63WMnZf8yx8WTEjbmM4rIlWqdM8j
         OaLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si20815028wrm.178.2019.04.27.07.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Apr 2019 07:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hKO6u-0006EM-Pl
	for alex.bennee@linaro.org; Sat, 27 Apr 2019 10:15:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6g-0006E1-La
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 10:15:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6f-0000VC-Tz
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 10:15:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKO6f-0000UQ-ON; Sat, 27 Apr 2019 10:15:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36A8A3098487;
	Sat, 27 Apr 2019 14:15:08 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9361117DC8;
	Sat, 27 Apr 2019 14:15:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 16:14:56 +0200
Message-Id: <20190427141459.19728-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 27 Apr 2019 14:15:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] hw/microblaze: Kconfig cleanup
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y1/B//LsSqoo

Hi Edgar, Peter,

Few fixes while cleaning Kconfig, trying to optimize builds.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (3):
  hw/Kconfig: Move the generic XLNX_ZYNQMP to the root hw/Kconfig
  hw/intc: Only build the xlnx-iomod-intc device for the MicroBlaze PMU
  hw/dma: Do not build the xlnx_dpdma device for the MicroBlaze machines

 hw/Kconfig            | 3 +++
 hw/dma/Makefile.objs  | 1 -
 hw/intc/Makefile.objs | 2 +-
 hw/timer/Kconfig      | 3 ---
 4 files changed, 4 insertions(+), 5 deletions(-)

--=20
2.20.1

