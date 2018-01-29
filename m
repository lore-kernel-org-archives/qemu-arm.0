Received: by 10.28.71.27 with SMTP id u27csp1481309wma;
        Mon, 29 Jan 2018 03:11:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224VWiO2cKOBhKTHB8tq8jlPi93giStZ9EkkXBb5i8HJQprq9IUiwvkMaeWObTwQXezYmszD
X-Received: by 10.37.215.85 with SMTP id o82mr8973654ybg.374.1517224272879;
        Mon, 29 Jan 2018 03:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517224272; cv=none;
        d=google.com; s=arc-20160816;
        b=N65n1qDLXCzrZ2Pd/MUgDldd5l2JVte/E6eC640NeXM9HBwgwIjtVl8k/ybfOD+N0j
         kxp89N6J1C6bBBjBv5XpuOFKBGX63cr6zuqSQC3fSeYe7HC/DvSUf/nfQbYtq2j7MQQw
         P3uiOw0FF2/PD7aritqa3EXFkAOi0vcUouHVDS4ZWRN/xcL8468oQGmv74klFTvuwie7
         WWrH15C7L6e25jAKCQwefBuC8QLsRFAMXv4eJ+sAOMlU8YH7cSo4CeSaxIuBemMbGIJD
         MIA2J+PN9+kMeXHW4EHyJHTiAiTX+gMuemBJ9lOl6viwbk7FSeWx/CXJXLTPjw2zVMDk
         dWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1lQiHn75lNuqDjt3ucR1pc5AABfZpkwlGRnStYyAu1U=;
        b=llox9fsqGz3eXAUQU9SwZ6ZXIi7jDS59FsDZstwUjnIAkiA1gpX99jHO/VWEqNXAX5
         +MhZWW0wTJrbe8rH07T6ck6YCHrnxWqsAivGr0o28+iYlRbzlCt8kkp/qCJVdg4rrdLK
         HOW49l7hL8vRsaEb6f+OCsupXkH7q6AdrS6n5ufthgMtSm0nhNsYdnRPGXEmPBBVtQo3
         knUchGpN1Ga1Hn8K4/1ymiQXx0HbUOzt3TTams8g0snYVYYSm/SuuvUxdtEkWdRGI0OJ
         dtk1YKTX/Z76dXox13SnE30/iUm0j++9FGhH+H29GRcYBDu2Z9jHQtYWCjJYYy2AA+zd
         60xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HdWJWAh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si2076877yws.623.2018.01.29.03.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jan 2018 03:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HdWJWAh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eg7LE-0004nB-A8
	for alex.bennee@linaro.org; Mon, 29 Jan 2018 06:11:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eg7L3-0004kq-FH
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 06:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eg7Kt-0004J0-RT
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 06:11:01 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:33710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eg7Kt-0004Hu-LA
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 06:10:51 -0500
Received: by mail-ot0-x241.google.com with SMTP id d7so6171907oti.0
	for <qemu-arm@nongnu.org>; Mon, 29 Jan 2018 03:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1lQiHn75lNuqDjt3ucR1pc5AABfZpkwlGRnStYyAu1U=;
	b=HdWJWAh3QLVS8Ell/KrntvKo2w4q7ycFZJk7w+CJKd/R0HCtk0ybna5GpqmtZlSxfS
	U4prJSkr+x6DSCE0jhLSVcGG9wekWTp2WlrCxGSZR5zMml/vIsFh24hv1CtnakT5hDVN
	vB8uRfUf+NYl1VehBDh4VMBSWhd3o2nYk8ij8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1lQiHn75lNuqDjt3ucR1pc5AABfZpkwlGRnStYyAu1U=;
	b=TlIalgLH5uggTpJaO0HpvuBmC6QHE2UOOa76G3EdRRCe9PkfEcIHtNqTCve9ByenVt
	rdl3Jh+ZqWKQonCg7C7iTp7KKqHaDfe+rhXkg4/wEKEgXokk5LJyjE7sPLvpZ0mnjVvE
	agZE9sZt3t+83jneBokFAjkxTlDMF2TGi8oRINbrjQ4Vps7VL7x+oBPMMnOpUfTpz7FG
	kx0f0XJyR0ZcaeeK4qCR9I+1mr8j1JhwxAyTjXxK0Peg7MiLqm1ruozDi2f9Tgn3vRW2
	GZvYKU1ZA0yCS2kzMYHfS9HLhhjXe2LlGiVfjtdigN1naQIduJz+yJelWofzSp9ZHUdW
	1yxQ==
X-Gm-Message-State: AKwxytcpthnlIGPs+iYtaMsbG7q9JXi5bW61kZVsBchoCxrshWfRZO7C
	s8Q92ADb76HvQJcgVv+06DaFTVLvpBxV2imwe3Vn4A==
X-Received: by 10.157.52.215 with SMTP id t23mr19370363otd.54.1517224251004;
	Mon, 29 Jan 2018 03:10:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 29 Jan 2018 03:10:30 -0800 (PST)
In-Reply-To: <20180129102917.3olxduibcwdqgqls@hawk.localdomain>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
	<CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
	<20180129102917.3olxduibcwdqgqls@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jan 2018 11:10:30 +0000
Message-ID: <CAFEAcA9y=T0Pd_Zv5zSjT0ZhiKmD__zrS+fP7AU0AC5j_v6c+g@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
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
X-TUID: CRq78UwwBqXB

On 29 January 2018 at 10:29, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Jan 26, 2018 at 06:01:33PM +0000, Peter Maydell wrote:
>> On 26 January 2018 at 17:33, Wei Xu <xuwei5@hisilicon.com> wrote:
>> > On 2018/1/26 17:15, Peter Maydell wrote:
>> >> The pl011 code should call qemu_set_irq(..., 1) when the
>> >> guest enables interrupts on the device by writing to the int_enabled
>> >> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
>> >> VGIC should report the interrupt to the guest.
>> >>
>> >
>> > Yes.
>> > And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
>> > When writing to the int_enabled, not sure why the int_level is set to
>> > 0x20(PL011_INT_TX) but int_enabled is 0x50.
>> >
>> > It still call qemu_set_irq(..., 0).
>> >
>> > I added "s->int_level |= PL011_INT_RX" before calling pl011_update
>> > when writing to the int_enabled and tested it also works.
>>
>> No, that's not right either. int_level should already have the
>> RX bit set, because pl011_put_fifo() sets that bit when it gets a
>> character from QEMU and puts it into the FIFO.
>>
>> Does something else clear the int_level between the character
>> going into the FIFO from QEMU and the guest enabling
>> interrupts?
>
> As part of the boot process Linux restarts the UART a few times. When
> Linux drives the PL011 with the SBSA driver then the FIFO doesn't get
> reset prior to being used again, as the SBSA doesn't specify a way to
> do that.

Right, but the FIFO not being cleared shouldn't be a problem --
if the FIFO is still full then the int_level should still
indicate that so that when the Linux driver enables interrupts
it takes an interrupt (and the handler should then drain the
FIFO by reading characters from it).

It seems likely that there's a bug in QEMU's pl011 model (this doesn't
happen with real hardware PL011s, I assume) -- but we need to find
out what the divergence from the hardware is, rather than making
changes which happen to fix the symptoms without having first
nailed down what the underlying cause is.

thanks
-- PMM
