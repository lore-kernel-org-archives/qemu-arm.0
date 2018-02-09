Received: by 10.28.71.27 with SMTP id u27csp1106412wma;
        Fri, 9 Feb 2018 08:09:53 -0800 (PST)
X-Google-Smtp-Source: AH8x224Jn+S0rO1z19dpflRcqdVurdDliVB+ZsKDeVbfVyznXOXxHOdqmPhe9RT8MlYb20v7bufS
X-Received: by 10.37.186.72 with SMTP id z8mr2112607ybj.33.1518192593780;
        Fri, 09 Feb 2018 08:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518192593; cv=none;
        d=google.com; s=arc-20160816;
        b=phm0xYHQH+7dp+5Ug7yEwJY5BbHsB+yHyE115amwiy1eSoWScWgAGRehPclZWWKbkj
         C2iLkOOAcJiw1b0EdgTHOjKBohohiH0JXWSAFw2esEiwjGJvlT3ttiYqp8D4OY93+zrF
         CEGjXXwLQ4jSNVLPFjF2yl7pmrqSMgw5sotHl03DxkCOs8q21M/FDEmwj9qoMI2z1JFY
         b3XkPI1XXwFlvAwVJZuK4BxITdKssNukUaj2YO6U8fKlfBz6dh4bqR9ptVJULAmvj8Ta
         HHCIhmfebb6ABz2UcVfB1H7zn20oN5rAoeHw9/ldTA/VmpGJ2orEV1GNjqndlgxkpyqy
         CImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ri/o25bTyo18O81Er9V9hGSgtYyCWkptvy+kChIMaR4=;
        b=iInMVDYXyMSME82Q3YrRIKmCBzvOldyQRaaLFHfPnhCrAtcD+Lct1ZTfmBNfRym/f2
         PAh+Ghc5vBe/vAdWFfFbGTwhKCoukuMgAg/xplrWOigQ6ra1UBf6nlZsAWIcpb+MLaw6
         NsvobFnkqdSxRFfnxuwboJYdSFYzag6lB5hOlbviiCXvPRziW9AoQTV/uHbHPFDpkEJv
         VklgKVpt9W4lE3bYqh2nxeg/ryGSoGVp4QXG9gVlaBKDT+F9s3Bo2fdyUyLNodisF7LC
         +67vYCRZWMh25LGx7dSjpPb0FntmsBrX8G292WwTc63rkpplf199AgRTCWgf5UdG98NX
         hzsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kIyPTR76;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k123si450073ywe.524.2018.02.09.08.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kIyPTR76;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekBFJ-0007nI-5b
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:09:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1ekBCF-00063i-P2
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 11:06:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1ekBCE-0000e1-Oi
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 11:06:43 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:41811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1ekBC8-0000bP-84; Fri, 09 Feb 2018 11:06:36 -0500
Received: by mail-qt0-x243.google.com with SMTP id a9so4538282qtj.8;
	Fri, 09 Feb 2018 08:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ri/o25bTyo18O81Er9V9hGSgtYyCWkptvy+kChIMaR4=;
	b=kIyPTR76Jd9vOmBY0KAyqHkjxfbJkTDuKNtJXNKk8u1iaMXOA0xMdY+w7OcrLxJSMv
	ZdxNhOhWSoaeSZfy/Ui5batE0C0N4l7mrztcZ3LXGtxFdQrtkFffLZ8YLomccrqbCOlG
	ZnH65DE7gHftw6Xp99InBf4mDrERhEGgeth0gfpve6wzQ3zUXPTy1UaXXCV2MBh0euSM
	bL1oqzZ5AhlTlk1E+8Hpyvqg5kbaFfYtMMLVeaEwjRMcjypRL+fmew+qOFH+6xSOXYOB
	GywzQRujdRgfvP+wH4PUXKqitg+MXPRl+qZcssDz82cCBj2uwBa75mrZxrfSaMXainUV
	0MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ri/o25bTyo18O81Er9V9hGSgtYyCWkptvy+kChIMaR4=;
	b=t/P4wJwbfaMhIvP+k7Hj/lIfbhh7bchFw71g75HanjdZF/iuogHH7o+dof8C78EFqz
	2AgUXUCMdxpM5iRjqtYyR/2lic8ZepkmCgyOesMihUHOdHq7RLvilP9hy1cjQlJ81ZJ4
	LA9UZ8QLZiVBBaX4DuGVK+h9iZfw4ONh4QX3SZddQkTRNj05EgEs5+5Mo/qxFYfjdBO6
	/bwQZBYiYM4mFytSZLTb/Tk+MU7q6epC5fhmfGw7R64ZXhuryZGyO/+DwBH8ws/Mjygw
	Yvt4n4m02kG5lN1fWrkQtN8jALcuwlFtwsaL+bhFlNoMLgQa0gL37dAs30JcDm+46RSf
	4etw==
X-Gm-Message-State: APf1xPAeUlh7RsjAbKWXzIndvQrT4ZrGj79Jnq3cne6lgEYa4LrM4lxW
	udOjVOkPocaCFbfE4U+DzQu8phFI2NkPmEmWNIA=
X-Received: by 10.237.43.225 with SMTP id e88mr5292450qtd.17.1518192395458;
	Fri, 09 Feb 2018 08:06:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.39.197 with HTTP; Fri, 9 Feb 2018 08:06:34 -0800 (PST)
In-Reply-To: <20180209085024.004b6f9e@w520.home>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-5-git-send-email-geert+renesas@glider.be>
	<20180209085024.004b6f9e@w520.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Feb 2018 17:06:34 +0100
X-Google-Sender-Auth: V-q40HhImQ7Cjp_S_z5Cx_sbQuQ
Message-ID: <CAMuHMdWaoutP+oFL0Vtw+Z-986_=3wLAu+58N9ZT7t+uZb1ycA@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pm1NQaE/HDfE

Hi Alex,

On Fri, Feb 9, 2018 at 4:50 PM, Alex Williamson
<alex.williamson@redhat.com> wrote:
> On Fri,  9 Feb 2018 16:17:35 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>>
>> Add qemu support for the newly introduced VFIO No-IOMMU driver.
>>
>> We need to add special handling for:
>> - Group character device is /dev/vfio/noiommu-$GROUP.
>> - No-IOMMU does not rely on a memory listener.
>> - No IOMMU will be set for its group, so no need to call
>>   vfio_kvm_device_add_group.
>>
>> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>> [geert: Rebase]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
>>  include/hw/vfio/vfio-common.h |  2 ++
>>  2 files changed, 50 insertions(+), 13 deletions(-)
>
> NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
> vfio devices with no-iommu (which provide no DMA translation!!!)
> transparently as if they might actually work like a regular vfio device
> is absolutely unacceptable.  Without DMA translation and isolation, you
> might want to think about another interface, I'm not keen on the idea

What if the device cannot do DMA?

There are other devices that cannot do DMA, but that can be useful to
access from a guest in an embedded system.
E.g. smart ADC monitor blocks that monitor and average several ADCs in an
automotive environment (drivers/iio/adc/rcar-gyroadc.c).

Should all such devices be paravirtualized?

> of corrupting vfio support in order to blink some LEDs.  Thanks,

This GPIO+LED prototype is just a proof-of-concept. There's no plan to
upstream it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
