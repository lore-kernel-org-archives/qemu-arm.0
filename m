Received: by 10.28.173.206 with SMTP id w197csp4073134wme;
        Tue, 16 Jan 2018 07:22:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBotVsCaiVXV+u/z3yS2Od6xkqKnV1DOUvfjKhG87TWFUWVFKe4ZXzJoc6I2gw8p5H9qcuTPu
X-Received: by 10.37.217.144 with SMTP id q138mr32667051ybg.519.1516116136049;
        Tue, 16 Jan 2018 07:22:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516116136; cv=none;
        d=google.com; s=arc-20160816;
        b=nSdX91OJvLgk0Yd67/L/rMegHKvWAUEV9pzhlolxwdhBBOUucTP4B0O83qrTr3tUAC
         GuFmfpVpJua4rtvc9LkuAK99XMAEdkbB6ROy0Boh03bik7TPrPg9BRAHtnY7H0EcoKBG
         Vu4b/qKigjvY+xMpoJULeg8nion8u7jF/rds8/5m7596i1vgWzy45DPIXnUTA/W9+fRc
         F2/DOd6aIQZAH4/qQuw41Xac0OeEypnLbN5Z+wd5la/cV2+tl9a+jWu+TeQHcIVRaJMM
         k99ounX2EGrtmzIXAz7GujtjJLMWh1tg2qCdzlNeXh16VjvzGT0JbEGzRLkxjNJILOVf
         d0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ot+9afH696GefLEJGKzuRUXbjXYe5TyokeOVm2tQe8E=;
        b=FdS1Ar2SQ2Gqjqid8YGKifua8JvaCqLdKnkhNS11of2DIkfKiNvvPFqZ0re9WEUTuf
         u1Yq2TRYH5V7syWZ24Vu2bVI+8wYTixFNz3ogcyFU/i67yb0+aDR/VAcQSQZYB940yOM
         LxK7sqyJvo/JcAvn7n1nllu0TyaLPFxzgpzvYOvGPsnqCxE97pKGj4ybvXuGfQhTMfie
         nR7dOjHOV6S81vDTZil9q/gdfWmsVo2cK0FRBqeXowvFwmGeIGaJYfd2lP7sRpvljKoy
         UOUsgYn8YE6UmT4hDXRrGdFfgvxi+G40beRVPhlTR1NTbgdKnuZZqh4PuRHMQoUf0rdx
         8DXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HqZQga/F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f192si583584ywh.121.2018.01.16.07.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:22:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HqZQga/F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebT43-0006Z5-DE
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:22:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSKT-0000S1-9S
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:35:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSKN-00057G-Ld
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:35:09 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:40591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSKN-00056q-Ft
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:35:03 -0500
Received: by mail-ot0-x241.google.com with SMTP id d10so13757373oti.7
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 06:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ot+9afH696GefLEJGKzuRUXbjXYe5TyokeOVm2tQe8E=;
	b=HqZQga/Fmoo1Qxdv0cZf1AFUi0ul3EWdOLi3JseO+8BxG0phYUBRETfClYJ96dj4et
	QD0SVSkEqGq4cfGZJUDf1ZXpeRTD+SSRjaMPNof9EJZSbFW6MKAgiIP7w4/fOt1zXFxU
	VGfZJeIk14/4OI1r5RpZHmyhPMn0KgSjtCkuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ot+9afH696GefLEJGKzuRUXbjXYe5TyokeOVm2tQe8E=;
	b=emH/BhEqyNWBgvhoYUOU9ubHEhl9/0IX9O7yKRUtQvgUJMZxHekFFkDGyJkH1zV1Fy
	+/2qpyII6PCtNdKOQnZYWzOQ2oDDX6yejN67MAXAOySrXA6IlOpaGGqOkCi8IIiuEQHa
	PueFgg8G1Qn/MG6VwqZ+4xy3vh7lSXgLi+RocXyldDazRMrYEOHuvur8Oo1GoCx7GU98
	2ZgNLwbUixBB0OdkhNcDTraydjzeRid6wI7uve7M3+xiidCKBcSMxDqR17+up3X6sc87
	9KwVmqrRLKB8ISYYZVtqQpej45WNouOroEXB4dcc9J+lSNLfFrCUfXo6VXvTtLzD/2Zl
	xgOQ==
X-Gm-Message-State: AKwxytcCElSr4yTWEGWqO+/Gupxdj9H7kH5PARyxMBxDWO/2H6ftNSnw
	s3eB02B1IisMuCFtsYH11qAFZdS5Rx5UaOVLWl1q0Q==
X-Received: by 10.157.2.8 with SMTP id 8mr4494335otb.116.1516113302746; Tue,
	16 Jan 2018 06:35:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:34:42 -0800 (PST)
In-Reply-To: <20180116013709.13830-10-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:34:42 +0000
Message-ID: <CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v4 09/14] pci: Add support for Designware IP
 block
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NbEDaGfjrHWn

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add code needed to get a functional PCI subsytem when using in
> conjunction with upstream Linux guest (4.13+). Tested to work against
> "e1000e" (network adapter, using MSI interrupts) as well as
> "usb-ehci" (USB controller, using legacy PCI interrupts).
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  default-configs/arm-softmmu.mak  |   2 +
>  hw/pci-host/Makefile.objs        |   2 +
>  hw/pci-host/designware.c         | 618 +++++++++++++++++++++++++++++++++=
++++++
>  include/hw/pci-host/designware.h |  93 ++++++
>  include/hw/pci/pci_ids.h         |   2 +
>  5 files changed, 717 insertions(+)
>  create mode 100644 hw/pci-host/designware.c
>  create mode 100644 include/hw/pci-host/designware.h

I'm not familiar enough with our PCI code to be able to review
this, I'm afraid. MST and Marcel are our PCI subsystem maintainers --
could one of you have a look at whether this seems to be a correct
implementation of a pcie host controller ?

I did notice it seems to be missing device state save/load support.

thanks
-- PMM
