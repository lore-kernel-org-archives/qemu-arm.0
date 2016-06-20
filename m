Received: by 10.25.21.96 with SMTP id l93csp1464171lfi;
        Mon, 20 Jun 2016 07:01:14 -0700 (PDT)
X-Received: by 10.37.73.130 with SMTP id w124mr8308293yba.169.1466431273902;
        Mon, 20 Jun 2016 07:01:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x21si18566496ywd.191.2016.06.20.07.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 07:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEzlJ-0004O8-6D
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 10:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bEziD-0001UK-Ds
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 09:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bEziA-00058K-FH
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 09:58:00 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bEzi9-00057t-7i
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 09:57:58 -0400
Received: by mail-vk0-x230.google.com with SMTP id u64so196326141vkf.3
	for <qemu-arm@nongnu.org>; Mon, 20 Jun 2016 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g4Ixkp0osqmBjKnprvaqOw6ZfhluRABJrXMHw1LGGnE=;
	b=PhPgRmGjfwm55m/HD+mJnJOZTi1BW8mtnKP4LGveP7GmO8Q2oZstBx4k8vSTeNp6jC
	MoUzRhvNzpYbtNr0n58WdC/1Fs9S7Kp7b5VIXflRQOIX4i7IYwopkQRm2fqn773pLoA6
	/lESaOTnUgbUn1JBPdTCvyoBkK4WaLdpQsoIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g4Ixkp0osqmBjKnprvaqOw6ZfhluRABJrXMHw1LGGnE=;
	b=meYua2uOuRYAWWRd3lhRr5qjypGBV9msmXAqh7CIdpKsX1T3TXya85pcF1Wt9TvJKn
	DBWRpGPKNSDzllVD9KLzCKYTBxXnCAKi+vu9qQab6tMujFkHt7VdWPIbUahPn/0C24of
	0N2pWsbcbsgsaGeviJ8NPdJZCU4iS650OhxYwXbwx7dC+L4ovMhUO5CcPxwsMLgm5kWH
	XzB96dvIm5zlrebmFE5hVd38R16VV4cATxna3DFsmZSL8FZwua4KAsXw8BHc4ArkMwpx
	WIxK+worRGfyAfpsmX3ia0pCUywrM3rqBcGyKkisL9CPR1/RWqgkpN8UDBEOOVxGn+wa
	X9qg==
X-Gm-Message-State: ALyK8tI2PXzY0Gl9TVYBbupUdEt26iuZUjSWyq2Uea7NTTi338sbF9247UCtelkUannrguX/zXfr/4ApObOuR+GX
X-Received: by 10.176.64.69 with SMTP id h63mr6539430uad.125.1466431076392;
	Mon, 20 Jun 2016 06:57:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.193.141 with HTTP; Mon, 20 Jun 2016 06:57:37 -0700 (PDT)
In-Reply-To: <1466394273.4344.25.camel@aj.id.au>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
	<1466063287-19350-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
	<1466394273.4344.25.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 14:57:37 +0100
Message-ID: <CAFEAcA_=5Dvg9R1o67b-5MuMZWtWbobywA+XzKuR-TeTCWfN0Q@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxNkDsYyf2aj

On 20 June 2016 at 04:44, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2016-06-17 at 15:22 +0100, Peter Maydell wrote:
>> +static Property aspeed_scu_properties[] = {
>> +    DEFINE_PROP_ARRAY("reset", AspeedSCUState, num_resets, reset,
>> +                      qdev_prop_uint32, uint32_t),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
>> This seems like a very unwieldy way of specifying the reset values
>> for this device. Are they really all fully configurable in the
>> hardware? It seems unlikely. I'd much rather see something that
>> looks more like what you might plausibly be configuring when wiring
>> up the SoC, which might be some version/revision numbers and/or
>> some particular tweakable parameters.
>
> Right. I left out some context which may clear things up: We are
> working with two SoCs at the moment, the AST2400 and AST2500 (hopefully
> the AST2500 patches will be sent to the list soon). I wanted to
> abstract the configuration to cater for the differences in register
> values between the SoCs, less so for wiring the one SoC up in a
> different fashion. For what it's worth, out of 86 registers defined in
> the IO space between the two SoCs, 37 take the same value and 49
> differ.

I think there are a couple of plausible ways you might model this:

(a) just have a single property for "revision" which corresponds
to the revision of this bit of silicon IP within the SoC; the
model of the device itself then knows what the reset state is
for this revision of the device.
(b) ditto, but also have some configurable flags where relevant
(ie approximately where it's the same IP rev within the SoC
but it's been configured by tying down different config lines;
for instance hw/dma/pl330.c has a collection of properties
which match the configurable knobs for the hardware.)

You might or might not have enough visibility into the thing to
know which of these is closest to what the real hardware is doing;
if not then it's a matter of taste, looking at what is varying
between the two and what isn't, etc. But "board level specifies
all the register reset values" is definitely far too broad
and generalised an API, I think.

> Separately, the qdev array approach was lifted from your commit
> 9c7d489379c2 hw/vexpress: Set reset values for daughterboard
> oscillators.

You'll notice that we only configure the specific things
that need configuring with interfaces specific to those things
(eg "daughterboard clocks" and "daughterboard voltages" are
separate), not a single "have a complete set of register values" API.

> Another approach would be to set the members of the SCU's
> reset array directly as we know the type. That seems less convoluted
> but my gut instinct was that wasn't how we should be configuring the
> devices. Is qdev the right way to go in the SCU's case?

We should definitely use qdev rather than poking directly at
the device's internal state struct.

thanks
-- PMM
