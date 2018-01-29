Received: by 10.28.71.27 with SMTP id u27csp122891wma;
        Mon, 29 Jan 2018 05:37:24 -0800 (PST)
X-Google-Smtp-Source: AH8x226h8bYcRfXSclk2glsPUbxw8bbELhboWVwANS015JfwiOUf3BvJLCGGOsyGqidBCeIgj+tR
X-Received: by 10.129.42.194 with SMTP id q185mr17668909ywq.232.1517233044869;
        Mon, 29 Jan 2018 05:37:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517233044; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/x2wdc5LvitNiFxzYqjzO2iW5A7HJhng+a/CHVsMlMm6KfcHu7qS22FwSbK70dw2t
         2YoyHuttdlsyWT0/7loDUeWo0rLu+OhOYSGpA37KMLUz3xVp4bJUups/zs7cU6gnUwpG
         R8wS1MS1O3Bayzgnzlm0BaQWlKDiQjtQWjfeyZV8omlGZ4RQtci5TCnvgNADY7TVu+D6
         hftNhMtX51fRn+91msLoVY//A8BKnNiRye1bTvLWK+7qS57APCUGwB68ryk+EK34LTo8
         r16LPrVuPZW5ISGnppyhjorapmNdceqrFeMuGUWkDompIZi+uXAQvIFMEsJTmCsk7kkf
         jB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kOK/UEKdaGgaggPpBId5CePn12+RoSHC35nfemV3NX4=;
        b=ZtgsjC+mjLCtGBx0M26eSkpv7gMklHAzzhcqiNJWU9VJmYPDFJ997JgvkwgqvPHIrt
         Ujgofqyi9R05DNlBRsqn5vokGxdB7NKSnxsVz96EqmCIU2ne+vDmObuaPS66c5vwRNS2
         MZThZsNSBmzB4pMz+pgVomBYtGvI5y2oaX1TaGtE/hF4Y/ACJgx1ltcKl49nhYgM+zM2
         j8TyXt0/Uafgd5IgDSa4t+DDEajfOB1IfpkJeJoH+CPsRUlD/jJSVtjW89Opau7gbCzU
         CjvISWre726ETlQzak6A9fYGySYIV9crGQ4+DNJAlt3uNEA8otpbUdyU/VAcUtWgaljG
         wa4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dvxqx+Ou;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si3031990ybj.768.2018.01.29.05.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jan 2018 05:37:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dvxqx+Ou;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eg9ci-000417-Ay
	for alex.bennee@linaro.org; Mon, 29 Jan 2018 08:37:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eg9cO-0003wr-SG
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 08:37:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eg9cF-0002Ad-E9
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 08:37:04 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eg9cF-000297-7U
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 08:36:55 -0500
Received: by mail-ot0-x241.google.com with SMTP id a7so3644909otk.9
	for <qemu-arm@nongnu.org>; Mon, 29 Jan 2018 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kOK/UEKdaGgaggPpBId5CePn12+RoSHC35nfemV3NX4=;
	b=dvxqx+OuYexsWHWOPBxqpMFSt3H4dxxdP8fJAUTH1aYc5od3HBEun05gpjm2YcRtbo
	/3mFXRrhBCoYaNxOwJW5aHoUs9PqJXXEeLgx08R9BipyIAYSybuD/4L5/4rqrtnWtfWF
	PVQ/xtueFxuRr01s1DIvOXRYg82GVFjVwroRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kOK/UEKdaGgaggPpBId5CePn12+RoSHC35nfemV3NX4=;
	b=fDE6xBLJ1gzmeIkoARvA/BIm1Ou1P7ebeyzniyyJgZMpSBZr6ipMgwhjiAcr3+vDgT
	6CkIS59f1LSR3kGKiPk0BQPmrahxbLQnqy09KpzCYPdSLD1LFby2CbzFzgYG3Bbf1Q55
	Nb1lh9Q40xrdzsJi2sUBgOhbvkdj8Qyc4Vpw1TJpz5fgoKrR7M/Hvdnq4YNw8aqlA8Qd
	HXX85OAwQyspFJCCWiHkX94iPSZa/cTML2MDxYrnKcIOZzXQeLAd3ddTlMq8IhTTHE/b
	pnRtIWI2uHCwJeyQER9TZybQRXj6f5i+853TintO9/2PwyEkTNA8qGhQZxUMTzTPNOxc
	0+5A==
X-Gm-Message-State: AKwxytcOtMmTESOhbNOKRytYuF3G+4++59+LljCxGxLWcglEwV3CCmyb
	IGaVtlqGHq3lFToaH6R+jlwtw8nzI7SsgLj19luYtg==
X-Received: by 10.157.52.215 with SMTP id t23mr19653540otd.54.1517233014214;
	Mon, 29 Jan 2018 05:36:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 29 Jan 2018 05:36:33 -0800 (PST)
In-Reply-To: <5A6F10F8.7000904@hisilicon.com>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
	<CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
	<5A6F10F8.7000904@hisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jan 2018 13:36:33 +0000
Message-ID: <CAFEAcA8fi5VgY4KZqG0_7BXjY81Qg+bGdyf8dcvUMy9wRZtvag@mail.gmail.com>
To: Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH] pl011: do not put into fifo before enabled
 the interruption
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
X-TUID: SdPzi0l/UXmF

On 29 January 2018 at 12:18, Wei Xu <xuwei5@hisilicon.com> wrote:
> On 2018/1/26 18:01, Peter Maydell wrote:
>> No, that's not right either. int_level should already have the
>> RX bit set, because pl011_put_fifo() sets that bit when it gets a
>> character from QEMU and puts it into the FIFO.
>>
>> Does something else clear the int_level between the character
>> going into the FIFO from QEMU and the guest enabling
>> interrupts?
>
> Yes. When the guest enabling the interrupts, the pl011 driver in
> the kernel will clear the RX interrupts[1].
> And pasted the code below to make it easy to read.
>
>         static void pl011_enable_interrupts(struct uart_amba_port *uap)
>         {
>                 spin_lock_irq(&uap->port.lock);
>
>                 /* Clear out any spuriously appearing RX interrupts */
>                 pl011_write(UART011_RTIS | UART011_RXIS, uap, REG_ICR);
>                 uap->im = UART011_RTIM;
>                 if (!pl011_dma_rx_running(uap))
>                 uap->im |= UART011_RXIM;
>                 pl011_write(uap->im, uap, REG_IMSC);
>                 spin_unlock_irq(&uap->port.lock);
>         }
>

This seems at first glance like a kernel driver bug to me -- if it is
explicitly killing off the pending interrupt without handling
it then it's naturally going to get stuck if characters come
in in the window before it does that.

(It wouldn't surprise me if there's something in the driver
init sequence that has the effect of clearing the FIFO on
real hardware but not QEMU, which would mean that on real
h/w the window where this can happen would be small, but it's
still there.)

thanks
-- PMM
