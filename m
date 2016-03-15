Received: by 10.25.208.211 with SMTP id h202csp741477lfg;
        Tue, 15 Mar 2016 11:14:28 -0700 (PDT)
X-Received: by 10.140.195.203 with SMTP id q194mr31495885qha.45.1458065668485;
        Tue, 15 Mar 2016 11:14:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si27453596qge.102.2016.03.15.11.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 11:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aftUB-0006Kl-Tx
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 14:14:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aftU9-0006KS-QI
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 14:14:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aftU4-0005t4-Ri
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 14:14:25 -0400
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233]:34968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aftU4-0005sv-Iv; Tue, 15 Mar 2016 14:14:20 -0400
Received: by mail-lf0-x233.google.com with SMTP id l202so1802005lfl.2;
	Tue, 15 Mar 2016 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=4AvHSlhcxnUjSQ8iRxXK4VGOraM8ekkBMBz2X3+mxXk=;
	b=m5hobeApeMGcCceNcmMtXVHEtS7hY31mfZdcwulkypToyvLnsjeUf6ba9up/Vhz4c3
	ymIBwVEVThc4a+i9Ex/MC89WV6PZ89rX6q4iXc+QLnaF3BeVgjKGEkMsAg3rfhU6SHPO
	kTnVfCotvewsavh3OOyPjVi9N3Xfr24Pzea6eh3FskkBYp0MQ+6S8P0vSdmQ1nzwIs5Q
	LBcQRg9J4hEf8/etojpnFkk25KTyfvlbxozyslZ5DFrsCiwbeWCm6c2pOmbTXQLexH4c
	8d6sFgFi9WIkfbbsOa/OUT0z8RcOMXN74GkfI76HXpX+epkzAnnLM/u+4G+QG/ragAdn
	+uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4AvHSlhcxnUjSQ8iRxXK4VGOraM8ekkBMBz2X3+mxXk=;
	b=BzaA+QYMoIXSWeXeatOHWKB2vdh7fF3XtXx+C9VDLf/gPybIS5TvGjAGMT0jT/1DfK
	Zsx2Hsh/WWgFTwNJnnZqiteVOs/7ZawpAZnmDHrC68ZbR9d+lPcFvUwjLO9o87K9Wv9Z
	P8VLFxf9D9Q4/c5mY9bQtve3rDSTSVk/fgQlIJN3SvBH7T1fI9qoFIXERrMTi+iRMfc4
	Yc7i+WJZ8JyAZ6IeQL1w9H9ugcknc9LnxEHtA6IwzJvpXKPY5wq3faqZTrv/XZ4FKzxY
	bSFGZ+aO/I0ulRAWyhEkH8IEQxyn+oFXfnA2BewGAltX0gVHCihjRmYkfhyxgRIpv4bS
	CuIw==
X-Gm-Message-State: AD7BkJIIhijEm3N/c5cPTnHYpUAA+Wb+PHv9HaPnAYTM5IRh1QVdejVrlSwODd/DORWPYg==
X-Received: by 10.25.145.201 with SMTP id t192mr8255778lfd.82.1458065659444;
	Tue, 15 Mar 2016 11:14:19 -0700 (PDT)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	f184sm4519212lfe.6.2016.03.15.11.14.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2016 11:14:18 -0700 (PDT)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
	<1457928832-31026-2-git-send-email-andrew@aj.id.au>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56E850F9.5080307@gmail.com>
Date: Tue, 15 Mar 2016 21:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457928832-31026-2-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::233
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Jeremy Kerr <jk@ozlabs.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [Qemu-arm] [PATCH v4 1/4] hw/timer: Add ASPEED timer device
	model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 26JUCiql1Hhr

Hello Andrew,

14.03.2016 07:13, Andrew Jeffery пишет:
> Implement basic ASPEED timer functionality for the AST2400 SoC[1]: Up to
> 8 timers can independently be configured, enabled, reset and disabled.
> Some hardware features are not implemented, namely clock value matching
> and pulse generation, but the implementation is enough to boot the Linux
> kernel configured with aspeed_defconfig.
>

[snip]

> +static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
> +                                   uint32_t value)
> +{
> +    AspeedTimer *t;
> +
> +    g_assert(timer >= 0 && timer < ASPEED_TIMER_NR_TIMERS);

This would never fail, wouldn't it?

[snip]

> +static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
> +                               unsigned size)
> +{
> +    const uint32_t tv = (uint32_t)(value & 0xFFFFFFFF);
> +    const int reg = (offset & 0xf) / 4;
> +    AspeedTimerCtrlState *s = opaque;
> +
> +    switch (offset) {
> +    /* Control Registers */
> +    case 0x30:
> +        aspeed_timer_set_ctrl(s, tv);
> +        break;
> +    case 0x34:
> +        aspeed_timer_set_ctrl2(s, tv);
> +        break;
> +    /* Timer Registers */
> +    case 0x00 ... 0x2c:
> +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS), reg, tv);
> +        break;
> +    case 0x40 ... 0x8c:
> +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv);
> +        break;


[snip]

> +static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
> +{
> +    QEMUBH *bh;
> +    AspeedTimer *t = &s->timers[id];
> +
> +    t->id = id;
> +    bh = qemu_bh_new(aspeed_timer_expire, t);
> +    assert(bh);
> +    t->timer = ptimer_init(bh);
> +    assert(t->timer);
> +}

I'm wondering why do you need those asserts, it's very unlikely that this code 
would fail. Have you had any weird issues with it?

-- 
Dmitry
