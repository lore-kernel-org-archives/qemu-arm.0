Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4800466wro;
        Mon, 29 Oct 2018 15:32:59 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fKLRfSjrowVRv5HxHaOQvgAB8P3qvotF/8wjkBQ/HsSBHr7K9i9ryeqTRmZ56fHBkE6YE1
X-Received: by 2002:aed:39a9:: with SMTP id m38-v6mr269061qte.222.1540852378951;
        Mon, 29 Oct 2018 15:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540852378; cv=none;
        d=google.com; s=arc-20160816;
        b=gwPo3EY9xcJ9atgi9ukH//7Yf1sbpxTPgR99Hl+djQSjB7xnYzOs8TeOFqiR5CHYhw
         /FLD1f1VTueHGYrNL+tsX6tb+4bbRiRaIqcqMcHqJgzOxLFmTW+xJ0YLdW7BlNuQdaco
         V+eNUI6QXcrzHQtOwON2o6rzMlfpHlb7IEZHGxSTCQDTYGwb9vRXctS9lTCRkY5eIRFQ
         zs14kkue3A/YuMMwjOCyoi2NOWErvRsUgagi+Sq4UZIrio6AZUGGqVSSuUlInTMyGIIH
         GDd6eLzVC/HjUF1S/wzdmwnqAfW7jmkfWrtZMSagpK3QLhTlNIIm+BI+wo4L+6wVVmhj
         jgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=DJVuh2ssoDhAE5HKM8GW4gEpOYmp7/v8mEn8s/40R2U=;
        b=c09B29lrvrPIoCWTUjubKc+EFnB3FCH483J/LbYApGZIlxmBQUneFGwg7Z9//0i9Qf
         wbZOXsfeQ0ZV4WDF9SgDTaSitq8ioQ3bKaNldbrjouw00fihABIgd1IkYTa2QcFMgsMX
         RgyWv55bnMana6AVzzvxO40XkbrX/a0voxs5jkzRnevg3yg/ZFzVqdJHsRFnuauuXylE
         zNaK+DY9L7cN51Gr/313ReOZp5YBJcT65l0uF8FVJNWPVBoJTBRthCO8+g3gMFddqSPP
         WMEnBFYen96HgAEeqDV8VQ3Jv9pNZA0mPmzihL+oY59flGiZV89C5YpWcKViY3yZp8Id
         0z/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j80si540816qkh.96.2018.10.29.15.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 15:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHG5i-0007nX-Dm
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 18:32:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG5U-0007eK-2H
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG5Q-00066x-Um
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:32:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHG5Q-000659-PX; Mon, 29 Oct 2018 18:32:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71B7C3082129;
	Mon, 29 Oct 2018 22:32:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1EC8194AB;
	Mon, 29 Oct 2018 22:32:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>,
	Guenter Roeck <linux@roeck-us.net>, Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 29 Oct 2018 23:32:04 +0100
Message-Id: <20181029223207.31878-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 29 Oct 2018 22:32:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] hw/arm: Enable USB OHCI/EHCI on Allwinner A10
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b+g5CjANumV0

Hi, this series intend to salvage previous work from Guenter Roeck [1].

A similar series from Icenowy Zheng was later reviewed by Gerd Hoffmann:
https://lists.gnu.org/archive/html/qemu-arm/2017-01/msg00345.html [2].

I reviewed patches 1 and 3, Gerd already reviewed patch 2 ([2]), if he
agrees to add his R-b tag again, this series is fully reviewed.

Regards,

Phil.

[1] https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06302.html

Guenter Roeck (3):
  arm: allwinner: Enable USB OHCI
  usb: ehci: Add support for Allwinner A10
  arm: allwinner: Enable USB EHCI

 hw/arm/allwinner-a10.c   |  9 +++++++++
 hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++
 hw/usb/hcd-ehci.h        |  1 +
 3 files changed, 27 insertions(+)

--=20
2.17.2

