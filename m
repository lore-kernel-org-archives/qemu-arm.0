Received: by 10.28.71.27 with SMTP id u27csp99562wma;
        Mon, 29 Jan 2018 05:14:03 -0800 (PST)
X-Google-Smtp-Source: AH8x225yDev3iWmFz8UQqUG3md0QEMrCKCrv0RiO/00y9dYQZvcyhWBcHLsXv33RfRi2gdlVCITn
X-Received: by 10.37.83.2 with SMTP id h2mr17108624ybb.71.1517231643370;
        Mon, 29 Jan 2018 05:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517231643; cv=none;
        d=google.com; s=arc-20160816;
        b=RQpZCTme8L3nGL40WPblbSP34fGxDSaNv8LSiwvJdKTHbdAwTxdGOaTolikYrJGyRC
         BIfFpOwDnSPKS1nLxCfLJlWl35HABCkz2K1e8GGwserDfiWe7hpy0NcyDWtqdW5MSTuV
         6ZYKK9HJNw/tYLTiwEWm83OlUOvaMcDvivOLAApGxDeV6PGENgXBgAwBGD60O6mxhhZB
         B3wrtX+Ng6n5OJEpw8pvBTeIxOpS2jWmJoGJo+fK7pcnMImVVUB5QadllMonRtmmQLJu
         REcyhn17WZowNXmkqpHNsbp4UAHexQULXC+ENAvLK/fJkehiGhGwhV0hhToOMcADVERh
         BC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=efXhQolLweS4xfD/IIOd7/qxKe77Qy0SdlhSwNr/rxk=;
        b=YrSi94SZKM/WWxfpHpR8+n3JMfO+0htR12N3ce8nXD/V5vazAG522EHU6wiEeo1/nJ
         rrclNpe52mBXTstq2CNvdEfuMxssnbg7bx8XRXRQ+0noIdG8oQQcHdrPJqwgZ6Vo9SQw
         Myx1xNbTdJNSz0cB6TKWKo+7tfxbrxGLD/nuxOsPgec/fYE5umZkJBMHS8kbb4tRslwk
         7/+mLYsj85sgDZBDqmMOz2Df+SOE4H2qQecv0LryiKWlryywLrZE2928W3JzVRgjoU9k
         RtZG2h1FQ0ii3EJw8FHy12N2MOvTCnHJJsQxAH2KWayqFfBEaLtgVzzQMEIO4puoYw6g
         nK9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x14si957118ybf.403.2018.01.29.05.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jan 2018 05:14:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eg9G6-0001Ru-P9
	for alex.bennee@linaro.org; Mon, 29 Jan 2018 08:14:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eg90f-0005Uh-79
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 07:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eg90Z-0003u4-FP
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 07:58:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37680)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eg90Z-0003tG-6s; Mon, 29 Jan 2018 07:57:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 478D94A6F3;
	Mon, 29 Jan 2018 12:57:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ABD67C142;
	Mon, 29 Jan 2018 12:57:54 +0000 (UTC)
Date: Mon, 29 Jan 2018 13:57:52 +0100
From: Andrew Jones <drjones@redhat.com>
To: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <20180129125752.4wgsmzb5uxtnsfq5@kamzik.brq.redhat.com>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
	<CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
	<20180129102917.3olxduibcwdqgqls@hawk.localdomain>
	<5A6F0761.2010305@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5A6F0761.2010305@hisilicon.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 29 Jan 2018 12:57:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] pl011: do not put into fifo
 before enabled the interruption
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
	Rob Herring <rob.herring@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
	"Chenxin \(Charles\)" <charles.chenxin@huawei.com>,
	tiantao6@huawei.com, QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"Liuxinliang \(Matthew Liu\)" <z.liuxinliang@hisilicon.com>,
	qemu-arm <qemu-arm@nongnu.org>, Daode Huang <huangdaode@hisilicon.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XYocCKHdenqr

On Mon, Jan 29, 2018 at 11:37:05AM +0000, Wei Xu wrote:
> Hi Andrew,
> 
> On 2018/1/29 10:29, Andrew Jones wrote:
> > On Fri, Jan 26, 2018 at 06:01:33PM +0000, Peter Maydell wrote:
> >> On 26 January 2018 at 17:33, Wei Xu <xuwei5@hisilicon.com> wrote:
> >>> On 2018/1/26 17:15, Peter Maydell wrote:
> >>>> The pl011 code should call qemu_set_irq(..., 1) when the
> >>>> guest enables interrupts on the device by writing to the int_enabled
> >>>> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
> >>>> VGIC should report the interrupt to the guest.
> >>>>
> >>>
> >>> Yes.
> >>> And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
> >>> When writing to the int_enabled, not sure why the int_level is set to
> >>> 0x20(PL011_INT_TX) but int_enabled is 0x50.
> >>>
> >>> It still call qemu_set_irq(..., 0).
> >>>
> >>> I added "s->int_level |= PL011_INT_RX" before calling pl011_update
> >>> when writing to the int_enabled and tested it also works.
> >>
> >> No, that's not right either. int_level should already have the
> >> RX bit set, because pl011_put_fifo() sets that bit when it gets a
> >> character from QEMU and puts it into the FIFO.
> >>
> >> Does something else clear the int_level between the character
> >> going into the FIFO from QEMU and the guest enabling
> >> interrupts?
> > 
> > As part of the boot process Linux restarts the UART a few times. When
> > Linux drives the PL011 with the SBSA driver then the FIFO doesn't get
> > reset prior to being used again, as the SBSA doesn't specify a way to
> > do that. I'm not sure if this issue is due to the SBSA attempting to
> > be overly simple, or something the Linux driver can deal with. See
> > this thread for a discussion I started once.
> > 
> > https://www.spinics.net/lists/linux-serial/msg23163.html
> 
> I am not sure it is the same problem or not.
> I will check that.
> Thanks!
> 
> > 
> > Wei,
> > 
> > I assume you're using UEFI/ACPI when booting, as I don't recall this
> > problem occurring with the Linux PL011 driver which would be used
> > when booting with DT.
> >
> 
> I am using an ARM64 board, the guest is booted *without* UEFI but the
> host is booted with UEFI/ACPI.
> The command I am using is as below:
> 	"qemu-system-aarch64 -enable-kvm -m 1024 -cpu host -M virt \
> 	-nographic --kernel Image --initrd roofs.cpio.gz"

Hmm. This means you're booting the guest with DT, which means the
Linux driver is the PL011 driver, not the SBSA driver. I didn't
recall that driver having the issue, but maybe something changed.

Thanks,
drew

> 
> Thanks!
> 
> Best Regards,
> Wei
> 
> > Thanks,
> > drew
> > 
> > .
> > 
> 
> 
