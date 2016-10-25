Received: by 10.80.166.35 with SMTP id d32csp67479edc;
        Tue, 25 Oct 2016 15:30:55 -0700 (PDT)
X-Received: by 10.237.60.4 with SMTP id t4mr22561255qte.94.1477434655240;
        Tue, 25 Oct 2016 15:30:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i35si14784360qtb.75.2016.10.25.15.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 15:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzAFC-0005PG-LY
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 18:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzAE9-0005MJ-E2
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 18:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzAE8-0006wZ-6O
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 18:29:49 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:34677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bzAE5-0006uE-83; Tue, 25 Oct 2016 18:29:45 -0400
Received: by mail-oi0-x229.google.com with SMTP id t73so123464932oie.1;
	Tue, 25 Oct 2016 15:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=XWFOUXfLrNkf2YX2C3eg8VSx4BmNwJ5DoLUGhZOb/yI=;
	b=Vkupu28q4GLr3cVplaEBjuFRQA2PmqaS7NvhLqYRBpH3fE8hIOfSDSZdSkg/o5lejy
	yBP4zAoSGSOfiqUplue1PAtqrjFYn1RsgMu/iHIqb0szLKpJ67F+SncuHXwxd3KWrT6A
	XkWT3+Lf+C08DLcSju+gxOh9Z61+QyjUCWQTb6hVsZcPKHS3SIXxZlxXs6NKfjYHuDx3
	k7aSive3gm3W9vSGxabJ96QetZmbtTN4yG45Wugtor7K1N/p+W3lJv8uvYRLHuSOyoqO
	59mZ3n6q9wxp0c/3c7Rs4+uWAPI3zZzGWq1esxzU7dO+yVyV/jSKdIAMkPLrFn1mjuoX
	sjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=XWFOUXfLrNkf2YX2C3eg8VSx4BmNwJ5DoLUGhZOb/yI=;
	b=AJ0VBSLM/HztnMr5sVhagrPk6Cl+BIgRbnfDHC8bYA6ddTyDrUeHd8QxMdkkZoj0RW
	LBLcQoe6EmyO48qTOPpcQNCEv7XOy+IgXiCJAl25MeaftFIxPsMuN1vN5fxcisBOtKy4
	HyomfqCrPavM3IXHbUJ0NndMn5Cky+joUdHVAqTtRoUWxKjP0PZSNoUHIECnDM0wwz4/
	yB/dkV9SbHfT/s/5HTWmnq8Ya70pBvCpnEfZBpnJ23fLhQqKktRTR7gBJchU+g4gDuhO
	KEG7Y93EO7wCeoFdel888vhQRGnYCG+wbL1/vwpISHlX/o+Vw0MWh/MA2QRJpTABbFnj
	PKRA==
X-Gm-Message-State: ABUngvfhJ76ry9FF+BbZ5m3hBND4RkBeIUVyCvTUABgt6U/fcN7euq7p04rFEcMdi8F/OX2p86qw2nR+Gw1KkQ==
X-Received: by 10.157.40.151 with SMTP id s23mr6457724ota.68.1477434584459;
	Tue, 25 Oct 2016 15:29:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Tue, 25 Oct 2016 15:29:14 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610252318530.15276@wniryva>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
	<alpine.LFD.2.20.1610252318530.15276@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 25 Oct 2016 15:29:14 -0700
X-Google-Sender-Auth: Ojkd-F_Ia4b4Xtb2nZmz5-o1Igs
Message-ID: <CAKmqyKOHh2q-qMGvL3SxesD5Tx3yiWXddf390M8mwu7+2ZK8jQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-devel] [PATCH v2] char: cadence: check baud rate
 generator and divider values
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
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PdR8Q45GaXOs

On Tue, Oct 25, 2016 at 11:24 AM, P J P <ppandit@redhat.com> wrote:
>    Hello Alistair,
>
> +-- On Tue, 25 Oct 2016, Alistair Francis wrote --+
> | >   * Device model for Cadence UART
> | > + *  -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
> |
> | Can you say what page/section the UART spec is in the Xilinx TRM?
>
>   Chapter 19 UART Controller, page 585, 19.2.3 Baud Rate Generator.
>
> | I think it might also be worth noting that the datasheet is a Xilinx
> | datasheet that covers the Cadence UART. Others might be using the IP
> | as well and might get confused why you are referring to a Xilinx
> | datasheet.
>
>   Right, I'll add above section details in the comment.
>
> | > +    case R_BRGR: /* Baud rate generator */
> | > +        s->r[offset] = 0x028B; /* default reset value */
> |
> | Is this the correct behavior, or should the write just be ignored?
> | pg.587 of the TRM doesn't really make this clear, did you find this
> | somewhere else?
>
>   True, page 587 does not clearly mention if it should be ignored.
> But in Appendix B, Register details for 'Baud_rate_gen_reg0' says
>
>     0: Disables baud_sample
>     1: Clock divisor bypass (baud_sample = sel_clk)
>     2 - 65535: baud_sample
>
> | > +    case R_BDIV:    /* Baud rate divider */
> | > +        s->r[offset] = 0x0F;
>
>   Appendix B, Register details for 'Baud_rate_divider_reg0' says
>
>     0 - 3: ignored
>     4 - 255: Baud rate
>
>
> ie. values 0-3 are ignored. But should we avoid writing 's->r[R_BRGR]' &
> 's->r[R_BDIV]' for these values? That would lead to undefined values being
> using in 'uart_parameters_setup()', no?

I think your email crossed with Peter. Have a look at what he said.
That should clarify everything.

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
