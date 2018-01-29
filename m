Received: by 10.28.71.27 with SMTP id u27csp1445380wma;
        Mon, 29 Jan 2018 02:30:55 -0800 (PST)
X-Google-Smtp-Source: AH8x227e3Z3PWtZckdKAnJbTflQbuFu8ExF8k+m03BrRdIcuEAakMPClfvamkQWws4X/s0TgyWf1
X-Received: by 10.37.39.71 with SMTP id n68mr16591591ybn.44.1517221854955;
        Mon, 29 Jan 2018 02:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517221854; cv=none;
        d=google.com; s=arc-20160816;
        b=cCSPe9NeW+tfbFTw5VV2ZushjoVNnJbIfiDLAvZAFnR3rOALB7Ymgofaia9SwBm9k7
         Gk60c1UDt2BCV56rdNA4Nwwroyu50gsLtWf8rSd0T8F8P7MQ/aXJfDkg1tvvqTWzf29k
         o22ZMgCQUubvLVEyrlEc5Na8IfF7MbfrBH0o+MafC6jPIpFEMll+jqjn39/o4b4HEFIC
         FLgdSae2YpbH6EPjJpouDxyI+Niryj0SIgmLiOTdcNbFclmi9kXUNMibuGgRquTgX87N
         atnOmyVcTQRl2fgaUfDURljXqlFYFDxn39vJp6u7Vm2eYPRnSTM1SOZx9tYgp+hWhsO0
         pw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=zNx5MhDXWJYK3BYMMPpkAE88O+biQH14Ktf1Km8Um5o=;
        b=JEbyha410EVIneyxg6FtCGOQyhetT+UTxemOop6peY/tvw8luvYjiBIQPg2xI0A9WM
         wPw0/xS+r6wffiMz9QYj90hfxJnxYMT4CuReq/3kFB0R0CDBUWVyQj9AiKDJ2h3VO3bR
         30EVrg+XRcaOssucuKHpr3+riz4wTdLAbq7aYcnrfyGvWWcHZFKJVuZNreFquZGumzt+
         hdasX45Iv+UYQYeu7mmNK4PWZrGa8WJh/mzgIi1g8+Zs5wcgkIvO8Dby+tzPQvoavO5z
         7ebWE1VSjJtgyzbkJCPzXZ9WvEu0PQ+4U2ZBWaf9RuRJzK1gOgN6JUDDpW7voeTe+9CM
         V8tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m186si2036659ywb.96.2018.01.29.02.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jan 2018 02:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eg6iE-0005V5-Dp
	for alex.bennee@linaro.org; Mon, 29 Jan 2018 05:30:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eg6gr-0004D1-5f
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 05:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eg6gn-0006ym-7Q
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 05:29:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45484)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eg6gn-0006y9-1u; Mon, 29 Jan 2018 05:29:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 943DE461DC;
	Mon, 29 Jan 2018 10:29:23 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-180.brq.redhat.com [10.40.204.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C85DA7A02B;
	Mon, 29 Jan 2018 10:29:19 +0000 (UTC)
Date: Mon, 29 Jan 2018 11:29:17 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180129102917.3olxduibcwdqgqls@hawk.localdomain>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
	<CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 29 Jan 2018 10:29:23 +0000 (UTC)
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
Cc: Rob Herring <rob.herring@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
	"Chenxin \(Charles\)" <charles.chenxin@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Wei Xu <xuwei5@hisilicon.com>, Linuxarm <linuxarm@huawei.com>,
	"Liuxinliang \(Matthew Liu\)" <z.liuxinliang@hisilicon.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	tiantao6@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
	"Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>, Daode Huang <huangdaode@hisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RlWsHSu3Wpse

On Fri, Jan 26, 2018 at 06:01:33PM +0000, Peter Maydell wrote:
> On 26 January 2018 at 17:33, Wei Xu <xuwei5@hisilicon.com> wrote:
> > On 2018/1/26 17:15, Peter Maydell wrote:
> >> The pl011 code should call qemu_set_irq(..., 1) when the
> >> guest enables interrupts on the device by writing to the int_enabled
> >> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
> >> VGIC should report the interrupt to the guest.
> >>
> >
> > Yes.
> > And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
> > When writing to the int_enabled, not sure why the int_level is set to
> > 0x20(PL011_INT_TX) but int_enabled is 0x50.
> >
> > It still call qemu_set_irq(..., 0).
> >
> > I added "s->int_level |= PL011_INT_RX" before calling pl011_update
> > when writing to the int_enabled and tested it also works.
> 
> No, that's not right either. int_level should already have the
> RX bit set, because pl011_put_fifo() sets that bit when it gets a
> character from QEMU and puts it into the FIFO.
> 
> Does something else clear the int_level between the character
> going into the FIFO from QEMU and the guest enabling
> interrupts?

As part of the boot process Linux restarts the UART a few times. When
Linux drives the PL011 with the SBSA driver then the FIFO doesn't get
reset prior to being used again, as the SBSA doesn't specify a way to
do that. I'm not sure if this issue is due to the SBSA attempting to
be overly simple, or something the Linux driver can deal with. See
this thread for a discussion I started once.

https://www.spinics.net/lists/linux-serial/msg23163.html

Wei,

I assume you're using UEFI/ACPI when booting, as I don't recall this
problem occurring with the Linux PL011 driver which would be used
when booting with DT.

Thanks,
drew
