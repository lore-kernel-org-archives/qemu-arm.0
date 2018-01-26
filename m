Received: by 10.28.71.27 with SMTP id u27csp991254wma;
        Fri, 26 Jan 2018 10:03:33 -0800 (PST)
X-Google-Smtp-Source: AH8x224Y1qt6hEdephuUDtKO+USbs9PJ+Hj2H6IpXIeh7NXKOWRby8MGi/Ryfc4BWK1APrg9FpnQ
X-Received: by 10.37.53.213 with SMTP id c204mr11433555yba.70.1516989813593;
        Fri, 26 Jan 2018 10:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516989813; cv=none;
        d=google.com; s=arc-20160816;
        b=tC+fMD1X4WFjz0R8XfioP/sRur1DAXjOifeEyQUMzQ45s+FAswo0AJHfTP3flDfmZh
         5JcMEyMmtZ4EWy205ilbIuGeGz9Yz2OYOMBwq0HLEuqn1RJGuArm3kLLw4yza4gj7wcG
         W3m/9V97tRrOGZG6stk24oaExyFzs0SQsLLfyiuvSbTxenWl15+WXd2891ay+5pTOOjU
         vRw19wboVKT2WScmlrW2khtUWmLNF0b5BqkzK4z+nrKOTsPEUQA5NrpefYddAuOlJc1s
         J4fynci4vb4h06g/zqV/+1mursskNoXZGxKJ0xgfdfcahe9oPYCewwORHlncRPDeD9tC
         4V7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=j5S6Lep75XLvdgYF97tcp1sQ1ZKqJ2ZtmStXoEiZ9Z4=;
        b=vtezQQsPrMhbXA8d3t5aHVzue6FfwAKd85f0qQaUbD4jgMpeQp2xeCdLY10V25loG5
         h2w7crWFjK0lmdccpHX+r74vHwRmsue2GegQWQjFzsZdvA/vhzfUKeXKPAN8dpP2A+aH
         66bv82M9egpoiF3x3usDs1QbQrHmjSvPNrm7/Ta63hVlonIF7Y4f/ru4wjsHVmBWRaE8
         n8+QLNSI7p3+nitkqw1UylGwHoKPb639h6dl70bVYp2FtBBKXml+MrqTKk3BIapsjL20
         Lv3v41SWGzbR+OOnA50Xt9O9uAlHkPkWCttv5tC6YcTmpGjDK+weJlrgIbQx7GbuJlLK
         04zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQcYO5jf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si974230ywh.548.2018.01.26.10.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 10:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQcYO5jf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8Ld-0007XK-1i
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 13:03:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef8K3-0006oS-GM
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 13:01:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef8K2-0004W7-Ml
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 13:01:55 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:39234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef8K2-0004Vl-IO
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 13:01:54 -0500
Received: by mail-ot0-x235.google.com with SMTP id d9so1125668oth.6
	for <qemu-devel@nongnu.org>; Fri, 26 Jan 2018 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j5S6Lep75XLvdgYF97tcp1sQ1ZKqJ2ZtmStXoEiZ9Z4=;
	b=VQcYO5jfou/izY9V48z0++jXySqSIgP5sNoVTxFpQUuxYs/Ye3kZpxm3pl/XhDVNVZ
	M3p17HoEQMKmtvwf7PipEYksNA7oj4cjoeJzKmy0cTG5YdytMZIn7QDqIbWXo//tbI+0
	/fqxqCWzHfLZTrXw9hL0B5Cmd0G2/XgFGHfE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j5S6Lep75XLvdgYF97tcp1sQ1ZKqJ2ZtmStXoEiZ9Z4=;
	b=sEyJI4Fic4L/orPf129CSJUrxT1YzTuYVYDJ63GG5nYrJyakMh9ruDGnCY8aP8YA4f
	sqRI3sH/SdMUbcZ2N3mRSCoe1RsS1mgLxp/gSCNqmTCIMV/LzwsNeNwaeJarlMd/5zFW
	mtdl6pMSYhlodUU+j965EUX6f/n56SvdLgErUH0IqUGMfa2FTR9jh5HqBIGNqIq8x3iw
	g9JrqBGuRmceIFhxSmSHFWTJ/wCvECJOrbNAzbOEdJ/BGQ8d0kKecEiO2rbsvvrSnWQG
	KcqtmZvDhAYNiDeZcCme96pdQZLzUaXAyqcVwu5v2euJB7Vh6Tz652y3h5Pjiv49HqVk
	JPMA==
X-Gm-Message-State: AKwxytcJFTCBi7AUDYWt+oj8Tr9Ka3zJKrcvUBzkxUL0grC0w4BmHnRQ
	iqYWXjKhYhHVxRkA+0jJ7da5vwTEfE6qlGN2S90NLg==
X-Received: by 10.157.29.229 with SMTP id w34mr13962193otw.24.1516989713566;
	Fri, 26 Jan 2018 10:01:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 10:01:33 -0800 (PST)
In-Reply-To: <5A6B6671.8070408@hisilicon.com>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 18:01:33 +0000
Message-ID: <CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
To: Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] pl011: do not put into fifo
 before enabled the interruption
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vHVdd9urgXU5

On 26 January 2018 at 17:33, Wei Xu <xuwei5@hisilicon.com> wrote:
> On 2018/1/26 17:15, Peter Maydell wrote:
>> The pl011 code should call qemu_set_irq(..., 1) when the
>> guest enables interrupts on the device by writing to the int_enabled
>> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
>> VGIC should report the interrupt to the guest.
>>
>
> Yes.
> And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
> When writing to the int_enabled, not sure why the int_level is set to
> 0x20(PL011_INT_TX) but int_enabled is 0x50.
>
> It still call qemu_set_irq(..., 0).
>
> I added "s->int_level |= PL011_INT_RX" before calling pl011_update
> when writing to the int_enabled and tested it also works.

No, that's not right either. int_level should already have the
RX bit set, because pl011_put_fifo() sets that bit when it gets a
character from QEMU and puts it into the FIFO.

Does something else clear the int_level between the character
going into the FIFO from QEMU and the guest enabling
interrupts?

thanks
-- PMM
