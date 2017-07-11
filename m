Received: by 10.25.44.15 with SMTP id s15csp5006037lfs;
        Tue, 11 Jul 2017 08:42:05 -0700 (PDT)
X-Received: by 10.55.98.137 with SMTP id w131mr605549qkb.175.1499787725599;
        Tue, 11 Jul 2017 08:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499787725; cv=none;
        d=google.com; s=arc-20160816;
        b=YZ+Hr8IdgB8piY6SaCt8lkQgIgnaNbKA++ig9UFmH19mZmc22PhAqg03fppGTWSQzu
         6wSmaKbO7cmMdGrU7VBRuEPDX8FfwBwb0rGdMqkjQZmGu5ZwE7+MHrGy49kCZ05WUNFa
         RjA8TXMZDlOsCjtU79XMS3pt21WWX5RHaVa1w8q1GUpig09N09jP9mJe5iEWyvfZvxBf
         wppfbQ1HLz2YtvHzS8mkTHV+NaNIdKgqR0L28fg6/m7XAXPM80nIjcrdNZ7nc5kcUQRA
         tEFe9u0t/Me9BEN6rT7aWKDmtc17lGGGkqtx5yvmojUXxKJluZwr3axKC536Ze/333k/
         6QmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/oDr9UZ2SJ8Hm2FaewITxS+pcooaGVqFS2PFTENxso8=;
        b=oHPZAbFZuPZQf2xZJKvCCX44KXIfXGZg1+xsdDElc2hJJTBlJ3JY5gIbNUbJTnIIij
         7sNiuDb1ypc/savsijsHyxS0YxjeTCsbBeOOZ++hruZFx9u/j38wNcBXmAohYNQqdhvg
         O7tkHpryUqadhIFfB8BWwzsgBILI4fPmoHS2Tbg3DvAk2VZD+X+0gbSPTJbl7SzJ04Ti
         oLH66RZn4KQ96uuD1sUVPwekSawIdTR+rjfTcuNVaUL+mCy5Vx757p2dsguwr60kooWS
         YhjfB2jH1Je5ZSxFJuY/i2Zn4FZp8dTWepwzxAxQ8SHiame2OaYN4HZXhA9P2ScooEyn
         AmzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=R+ASPb6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 26si232082qkx.206.2017.07.11.08.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=R+ASPb6A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUxID-0006yn-TD
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:41:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dUxI9-0006yQ-7c
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dUxI5-0001Mm-9k
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:41:37 -0400
Received: from mail-wr0-f170.google.com ([209.85.128.170]:32998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dUxI5-0001Lz-15; Tue, 11 Jul 2017 11:41:33 -0400
Received: by mail-wr0-f170.google.com with SMTP id r103so4383412wrb.0;
	Tue, 11 Jul 2017 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/oDr9UZ2SJ8Hm2FaewITxS+pcooaGVqFS2PFTENxso8=;
	b=R+ASPb6A+jYTvs8RiH/RKAMmspYqBR41K76oxi/KZIm5R+bzdxAFS4p8TH93GVuqeE
	SEKSCgo9/xDlmqa1HfSwzsaordOe32HtxFlbRajn9WnRQJgsQLkZdKgDan9A7DDIoIRd
	XH5u0w1xQY/sIbtt4xJWV5f7nIdjC5kY1jU2cVY5nRdCrf950m4MxrsnScj2VIwooET5
	sj7tpMxdpKtvjthwJcmrIT7cyG94MphybxIAPOBUm1zC5ZwUDahHuzQ2uGNpnpWQzdfy
	03rvGdUc45ozTt8u9F+nroV2dhPWUMnKpVj55T0DvbzSBU+9U+VFEj65BsnYTfjzkBxz
	WB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/oDr9UZ2SJ8Hm2FaewITxS+pcooaGVqFS2PFTENxso8=;
	b=G0BRm6UL759VR9TG0MAxj15yf3CHAANB0iVwuZP3YziyZHsC942+ebAwafCFObUTO6
	mbMVrT11iP2utY1LvsCxY9lDEq8XPsc7GRvaj7h1rsXr84nu1Pt408POIfM/kNqenK1O
	x4NE66v6TPhIFo2XHx3Q0WzQJuJDhNcmc23BGf7AUdaa5SZc9D19MxdpHNSq2fH/H5bV
	gKYe3/5jX1BUjhctyfJ4IPcxvHTFKAj8yvj/z0OaifApHMpYaW2ig7XDF11oSGYviLr7
	SklYLNrtfDCgIF9719Q2mxO2fPS1nmT+6Jn6uhFWOX1cQjNetQXvfbhQlbLYT5dLkqS2
	JGzQ==
X-Gm-Message-State: AIVw110++b92/DvrFXjZydbuXlie6P+WVUl5niwI2nBF3/DvFiZCsYWm
	2/d5cpTxgsZ4J+HMvsUFr8C2sQvlKdpL
X-Received: by 10.28.51.11 with SMTP id z11mr3181549wmz.115.1499787631433;
	Tue, 11 Jul 2017 08:40:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Tue, 11 Jul 2017 08:40:00 -0700 (PDT)
In-Reply-To: <CAFEAcA_DyoTE+idUtiWOB4ptA-TMcmU2WRYWjo2Lwt7+RD8xEQ@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
	<CAFEAcA_DyoTE+idUtiWOB4ptA-TMcmU2WRYWjo2Lwt7+RD8xEQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jul 2017 17:40:00 +0200
Message-ID: <CAKmqyKOW1s7zbLFD2E+X+5--Gk0sBmK_mdbEaPDVD-C4JUxrKA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.170
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] hw/char/cmsdk-apb-uart.c:
 Implement CMSDK APB UART
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x+fKVouStN8M

On Tue, Jul 11, 2017 at 5:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 11 July 2017 at 16:12, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Implement a model of the simple "APB UART" provided in
>>> the Cortex-M System Design Kit (CMSDK).
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>>> +} CMSDKAPBUART;
>>
>> This should be CamelCase.
>
> Yes, but CamelCase where all the words are all-uppercase
> (as with CMSDK, APB and UART) is indistinguishable from
> all-uppercase. (Compare the way we say "PCIIORegion" rather
> than "PciIoRegion".)

Good point, I feel like it just looks strange being all caps though.

>
>>> +/* This is a model of the "APB UART" which is part of the Cortex-M
>>> + * System Design Kit (CMSDK) and documented in the Cortex-M System
>>> + * Design Kit Technical Reference Manual (ARM DDI0479C):
>>> + * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
>>
>> I can't find the spec from this site. Is it possible to link directly
>> to the guides? I have found a few dead links from some of these
>> marketing focused site.
>
> It's the link with the big blue button "Cortex-M System Design Kit
> TRM". I didn't want to link directly to the TRM, because that is
> (currently) an infocenter.arm.com URL which may eventually go
> away as content migrates to developer.arm.com. (The DDI document
> reference number is unique and sufficient to find the document
> in future even in the face of broken links.)
>
>>> +static void uart_update_parameters(CMSDKAPBUART *s)
>>> +{
>>> +    QEMUSerialSetParams ssp;
>>> +
>>> +    /* This UART is always 8N1 but the baud rate is programmable.
>>> +     * The minimum permitted bauddiv setting is 16, so we just ignore
>>> +     * settings below that (usually this means the device has just
>>> +     * been reset and not yet programmed).
>>> +     */
>>> +    if (s->bauddiv < 16 || s->bauddiv > s->pclk_frq) {
>>> +        return;
>>> +    }
>>
>> This seems like it should deserve a guest error print.
>
> As the comment says, that would cause us to print a spurious
> warning every time the device was reset.

I just see this being hard to debug. What about if not printing if
baud rate is 0 but guest error otherwise?

Or can this not be called from reset?

>
>>> +static int uart_can_receive(void *opaque)
>>> +{
>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>> +
>>> +    /* We can take a char if RX is enabled and the buffer is empty */
>>> +    if (s->ctrl & R_CTRL_RX_EN_MASK && !(s->state & R_STATE_RXFULL_MASK)) {
>>> +        return 1;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static void uart_receive(void *opaque, const uint8_t *buf, int size)
>>> +{
>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>> +
>>> +    trace_cmsdk_apb_uart_receive(*buf);
>>> +
>>> +    if (!(s->ctrl & R_CTRL_RX_EN_MASK)) {
>>> +        /* Just drop the character on the floor */
>>> +        return;
>>
>> Doesn't this also deserve a guest error print.
>
> It's a can't-happen case because uart_can_receive() won't
> return 1 if the EN bit is clear. Checking again here is
> perhaps unnecessary paranoia, but it's not a guest error.

Ah good point. Maybe that is worth stating?

Thanks,
Alistair

>
>>> +    }
>>> +
>>> +    if (s->state & R_STATE_RXFULL_MASK) {
>>> +        s->state |= R_STATE_RXOVERRUN_MASK;
>>> +    }
>>> +
>>> +    s->rxbuf = *buf;
>>> +    s->state |= R_STATE_RXFULL_MASK;
>>> +    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
>>> +        s->intstatus |= R_INTSTATUS_RX_MASK;
>>> +    }
>>> +    cmsdk_apb_uart_update(s);
>>> +}
>>> +
>>> +static uint64_t uart_read(void *opaque, hwaddr offset, unsigned size)
>>> +{
>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>> +    uint64_t r;
>>> +
>>> +    switch (offset) {
>>> +    case A_DATA:
>>> +        r = s->rxbuf;
>>> +        s->state &= ~R_STATE_RXFULL_MASK;
>>> +        cmsdk_apb_uart_update(s);
>>> +        break;
>>> +    case A_STATE:
>>> +        r = s->state;
>>> +        break;
>>> +    case A_CTRL:
>>> +        r = s->ctrl;
>>> +        break;
>>> +    case A_INTSTATUS:
>>> +        r = s->intstatus;
>>> +        break;
>>> +    case A_BAUDDIV:
>>> +        r = s->bauddiv;
>>> +        break;
>>
>> You used pasrt of the register API but not the second part. This seems
>> like a greaet device to use the register API on.
>
> I really don't like the register API. The field definition
> convenience macros are fine, but I prefer to define devices
> with read and write functions with switches, I think it's
> clearer, and it's easier to see where you want to put a breakpoint
> to be able to step through register reads and writes, and so on.
>
>>> +    case A_PID4 ... A_CID3:
>>> +        r = uart_id[offset / 4 - A_PID4];
>>
>> I think this is the one you already found in the cover letter.
>
> Yep. (Same in both timer and uart.)
>
>>> +    switch (offset) {
>>> +    case A_DATA:
>>> +    {
>>> +        s->txbuf = value;
>>> +        if (s->state & R_STATE_TXFULL_MASK) {
>>> +            /* Buffer already full -- note the overrun and let the
>>> +             * existing pending transmit callback handle the new char.
>>> +             */
>>> +            s->state |= R_STATE_TXOVERRUN_MASK;
>>> +            cmsdk_apb_uart_update(s);
>>> +        } else {
>>> +            s->state |= R_STATE_TXFULL_MASK;
>>> +            uart_transmit(NULL, G_IO_OUT, s);
>>> +        }
>>> +        break;
>>> +    }
>>
>> Why is this case inside braces?
>
> I probably had a local variable in there at one point which
> I ended up not needing. I'll delete the braces.
>
> thanks
> -- PMM
