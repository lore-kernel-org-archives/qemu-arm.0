Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3998969wrv;
        Mon, 15 Jul 2019 03:55:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwJ7JmveyA4mbY7uVvqp8+1osLe8zcrpJTBS8DpqELDZ61cmF6YllcF8zGL29jaCWg7eZg
X-Received: by 2002:a50:b155:: with SMTP id l21mr22588912edd.186.1563188107929;
        Mon, 15 Jul 2019 03:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563188107; cv=none;
        d=google.com; s=arc-20160816;
        b=C64wZw0b4PuOxzC76zEJ8lHSo/qpyOrVDowXZgwVX+HDaCxWrGz4IK6nexN5pdliDy
         VMKqwJXGohKXOP/C0Bl8HZFcT+FswVi2l1Peu0Ofis3o8cazB2gqFpohjVWZz3kUR166
         YPB5UQL0Gs1ZVxBvmFswtqDJGhmn3bcGQ38U/AlaLV7On7lAa9MrnbqAWl9aui5lDWCC
         CZ0uWO7lzUmHWdnjkvuEaHtqWnElKM7HoBxV00GwtiRSZtwianAnOS3dpZmI+4Y7SYT/
         pGWHtBkTyvZrQ3ZgplB6ZT4HX//zy1LFQ7zmnHMU+INnwhedwuOuDuBcUSyGHJ1cuS0Y
         +OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date;
        bh=eTK/V6H1D4s5/u4qgoY+MV+UI9WY/MD/32tjNoh++UU=;
        b=feJAkESGVo5RtrpJhldSJyPdlAUClWzvnS5y2emSzxapD7Sauqlf1WWkaNuxrh34Sd
         ui5gwMOHJZP9F/6O0/UCJNJv9L03GOv3mTSlZ9pTLJ5z/Ih7uJrb2JkztOddz3gT5tAq
         PUip/samGKB/cV/TBMRYJHIOvJ0cWuwIgtg3ZaflukcSIoV0AoGBrrj14KITKznPwNXj
         +J0xibi3bZIhro0QCnJA1m62N9oEbOLUHhLMBliUE13JxQBdF96fQQXkRmUVmtmS9ZHa
         XHAJCsB0YJXk6nxYQKTqKEU6uE9NwKCc6QSDCJGImjHGe4UegJuxRfzk/DOOYmHr8Q2o
         j6mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si9564539eds.64.2019.07.15.03.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 03:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmydO-0004Wj-Mi
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 06:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42083)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hmydK-0004UW-Ce
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hmydJ-0006y8-AS
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:55:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:56909)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1hmydI-0006rd-V5; Mon, 15 Jul 2019 06:55:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1A1387456CC;
 Mon, 15 Jul 2019 12:54:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EF6987456B4; Mon, 15 Jul 2019 12:54:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EB19674569D;
 Mon, 15 Jul 2019 12:54:51 +0200 (CEST)
Date: Mon, 15 Jul 2019 12:54:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
In-Reply-To: <20190715095545.28545-3-philmd@redhat.com>
Message-ID: <alpine.BSF.2.21.9999.1907151251210.6546@zero.eik.bme.hu>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-3-philmd@redhat.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-295164879-1563188091=:6546"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH-for-4.2 2/3] hw/usb/Kconfig: Add
 CONFIG_USB_EHCI_PCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IRpRyzv23fqI

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-295164879-1563188091=:6546
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jul 2019, Philippe Mathieu-Daud=C3=A9 wrote:
> The USB_EHCI entry currently include PCI code. Since the EHCI
> implementation is already split in sysbus/PCI, add a new
> USB_EHCI_PCI. There are no logical changes, but the Kconfig
> dependencies tree is cleaner.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/usb/Kconfig       | 9 ++++++---
> hw/usb/Makefile.objs | 5 +++--
> 2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index 564305e283..495c6f2d48 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -19,13 +19,16 @@ config USB_OHCI_PCI
>
> config USB_EHCI
>     bool
> -    default y if PCI_DEVICES
> -    depends on PCI
>     select USB
>
> +config USB_EHCI_PCI
> +    bool
> +    default y if PCI_DEVICES
> +    select USB_EHCI
> +
> config USB_EHCI_SYSBUS
>     bool
> -    select USB
> +    select USB_EHCI

Isn't this making USB_EHCI effectively the same as USB so maybe you don't=
=20
need to keep that around any more. Can you just add select USB to=20
USB_EHCI_PCI and USB_EHCI_SYSBUS and delete USB_EHCI?

Regards,
BALATON Zoltan
--3866299591-295164879-1563188091=:6546--
