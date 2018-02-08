Received: by 10.28.71.27 with SMTP id u27csp2532881wma;
        Thu, 8 Feb 2018 12:52:45 -0800 (PST)
X-Google-Smtp-Source: AH8x227ZLXEt/8AtR1XGgz10YklnyD6jQLIPVRZ9r1cKF8CXp5UhBs2bbA72xIok/tVptq2iCscr
X-Received: by 10.37.198.197 with SMTP id k188mr280608ybf.62.1518123165012;
        Thu, 08 Feb 2018 12:52:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518123165; cv=none;
        d=google.com; s=arc-20160816;
        b=Soj713450RI3V1XFD8CQHmA1+pvZlavXXgpdELNW5kOTAVdvD7Ey8ltwggOFChaXhi
         i12Oz090RhvgziOAxomYpLJhz/+vAY5BwCq+hWC6E27HXZxSDxrT3YouBtYcyLXaguyT
         mDiWZgT943fOJB+7PIK/cAlx6rzNzuSPHGezy4pZkziv6fmg4qhkWZdwfLrCGqnngEZI
         Vx25xbOvg3X+POjt1awSgXNpvxRxATTt7XSxMZFtTNpTFc4XRqMYM1/5nCU6FIz1GrW4
         rSG0/eINPf9vB59y/ZFSk1uUvWPp6/N8bavAgvWLfIG0h+c8M8+nqipqSGZg66xhUroV
         ONDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JiQGPdQ1JsOwOGzTiu0RGmNrztjYZOzJ3zIpcWe7lEE=;
        b=PLJ7AbnEr6I15AtU09P9Q0qXZ+FHeYgbAssuXBuHQYZeRiy2Ti+e9w1WwtxJgqJiQ1
         SJib+ul0gdk2VLQPQaIvzGuHsl2QYKwOsqoajMNBDcmEYNOdXYqDxyWHyWV1bovx66hC
         5wv8o9YDGwKPQg8WUJx3hN9mq6m97p2JRqEENWshrU9vO8mXIVIJ8rCh2xzRhTn1VUJz
         Wlp8MoOgTbwt7UMrvUyDIoCcSaF9E1i6JIGHDnz6ZfXTTJaaIn2wvxGySLH8qwbOkZgn
         6+iH3nWz49fvRlJHj2o5EwVG2aQ0ygxaUQlT/usAJGZZuaB8gv28WMP4GAMgPm+om4rA
         MpMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XA64Rc2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si137090ybm.210.2018.02.08.12.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 12:52:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XA64Rc2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejtBU-0008Ex-6p
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 15:52:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejt2A-0007tl-Ig
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 15:43:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejt29-0000oi-Gb
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 15:43:06 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejt29-0000oU-B0; Thu, 08 Feb 2018 15:43:05 -0500
Received: by mail-qk0-x242.google.com with SMTP id d144so536818qkg.13;
	Thu, 08 Feb 2018 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JiQGPdQ1JsOwOGzTiu0RGmNrztjYZOzJ3zIpcWe7lEE=;
	b=XA64Rc2LoyWeMXLA3v0TwvyP8q67MKZYJJ9oO3wsc1Ctwqo9+bSYyFxAOjwXaCdGkR
	doToZC8uMoKowLKt0z+lbIQl2heP9yEE+Xsatf+DQnbI3QLy5CSDOBeDRJTR5swBEYv8
	8qJdFXjwhgaUbPvE6KdI4KTNaazenDO+NxdAW2xpfPJSm6hYb/2Qaw4NZjxePC+2pUmv
	QlOe5f6cPZbLnhHwLhh6mj99m6zwU9n0q2RTjpCdPbzjqA+yyIa20Wvr7h1m9II/9rlk
	lfSiMBuZDoZNUiK20xrYX/bLZ8X5/CS/rFPewQ/xxvOH9DXnvlYZvs/0c0DK8hn0SrOQ
	Gqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JiQGPdQ1JsOwOGzTiu0RGmNrztjYZOzJ3zIpcWe7lEE=;
	b=WEJzL8RdhFQuQjZegRIEcwKoztbS2fF6MrR0egDDDC2YR1TTw53doe0IgQ/ay9souU
	qujh88kns6eryek/XNNn5REE7iOBN0ufXZk5ILNuH0UaAkMe7LY4flOmAzTG/zKWHKTx
	ILcmDwCR9/whuZXAutxpZ4YZDqKi/An9HUbqB3v0yQubLoMMcTdVWhx0kZAHSTH9YnHJ
	SyZtsS7qu6Bo0hAYCga6aUclkJZ4CEiHU5EBovLJfsUNf+LOSr+8kIBcXZVkG6drBR2F
	xLLJbhr4LOWXPTiYKuxFa+xFIWoXE6GaCJOg15EYgYrxR4b31ozroxV64B/FJE6ZE0kU
	YIYg==
X-Gm-Message-State: APf1xPAYv1xcgcfbMwlRLFkxLSS8LGr6VAL+FH0VISQLjWu1IVU6CAjU
	esSLS901GwA4xJGUub5PiOGYLYV8AMOiVgiC9Rg=
X-Received: by 10.55.191.65 with SMTP id p62mr446439qkf.191.1518122584477;
	Thu, 08 Feb 2018 12:43:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Thu, 8 Feb 2018 12:43:03 -0800 (PST)
In-Reply-To: <20180208223323-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-11-andrew.smirnov@gmail.com>
	<20180208194226-mutt-send-email-mst@kernel.org>
	<CAHQ1cqGZHie0sYudPGr-15LOEjMRT05=0+tsViKfCJBnN96Nag@mail.gmail.com>
	<20180208221121-mutt-send-email-mst@kernel.org>
	<CAHQ1cqHGfTYyKuMEDGPWnHBbWYV2sMrqfHU6oJV3NQSv0Xi0Qg@mail.gmail.com>
	<20180208223323-mutt-send-email-mst@kernel.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 8 Feb 2018 12:43:03 -0800
Message-ID: <CAHQ1cqHxUZTFiXpzdKWk1MA9QuqHC0Ljs0-uBkWZbYsNn6ix8Q@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH v5 10/14] pci: Add support for Designware IP
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wplblDR2O9Tk

On Thu, Feb 8, 2018 at 12:33 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Thu, Feb 08, 2018 at 12:22:53PM -0800, Andrey Smirnov wrote:
>> On Thu, Feb 8, 2018 at 12:11 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
>> > On Thu, Feb 08, 2018 at 12:03:04PM -0800, Andrey Smirnov wrote:
>> >> >> +#define PCIE_PORT_LINK_CONTROL          0x710
>> >> >> +
>> >> >> +#define PCIE_PHY_DEBUG_R1               0x72C
>> >> >> +#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
>> >> >> +
>> >> >> +#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
>> >> >> +#define PORT_LOGIC_SPEED_CHANGE         (0x1 << 17)
>> >> >> +
>> >> >> +#define PCIE_MSI_ADDR_LO                0x820
>> >> >> +#define PCIE_MSI_ADDR_HI                0x824
>> >> >> +#define PCIE_MSI_INTR0_ENABLE           0x828
>> >> >> +#define PCIE_MSI_INTR0_MASK             0x82C
>> >> >> +#define PCIE_MSI_INTR0_STATUS           0x830
>> >> >> +
>> >> >> +#define PCIE_ATU_VIEWPORT               0x900
>> >> >> +#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
>> >> >> +#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
>> >> >> +#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
>> >> >> +#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
>> >> >> +#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
>> >> >> +#define PCIE_ATU_CR1                    0x904
>> >> >> +#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
>> >> >> +#define PCIE_ATU_TYPE_IO                (0x2 << 0)
>> >> >> +#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
>> >> >> +#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
>> >> >> +#define PCIE_ATU_CR2                    0x908
>> >> >> +#define PCIE_ATU_ENABLE                 (0x1 << 31)
>> >> >> +#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
>> >> >> +#define PCIE_ATU_LOWER_BASE             0x90C
>> >> >> +#define PCIE_ATU_UPPER_BASE             0x910
>> >> >> +#define PCIE_ATU_LIMIT                  0x914
>> >> >> +#define PCIE_ATU_LOWER_TARGET           0x918
>> >> >> +#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
>> >> >> +#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
>> >> >> +#define PCIE_ATU_UPPER_TARGET           0x91C
>> >
>> > Can you avoid a PCIE prefix for this btw?
>> >
>>
>> That's how those constants were named in Linux kernel, but yeah, I'll
>> add a prefix to them.
>>
>> Thanks,
>> Andrey Smirnov
>
> In that case you should not copy it into your file.
> Stuff from linux kernel should be imported into standard-headers.
>

Just to be sure we are on the same page, this is the file I am talking about:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/dwc/pcie-designware.h?h=v4.15

you want me to put it in standard-headers/linux and get those
constants from there?

Thanks,
Andrey Smirnov
