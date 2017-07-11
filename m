Received: by 10.25.44.15 with SMTP id s15csp5133013lfs;
        Tue, 11 Jul 2017 10:29:05 -0700 (PDT)
X-Received: by 10.55.191.66 with SMTP id p63mr1269135qkf.212.1499794145690;
        Tue, 11 Jul 2017 10:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794145; cv=none;
        d=google.com; s=arc-20160816;
        b=Mj5ot52UMTCEUWqb3Nc8x2WwLlgII6G07jMrEHLZbaGMewrnQSLGptihba0yBvwVB7
         3MY316Pb0Tu5MJKA7VzYiakvCo4oDIIol7xUtFjkgf6uMoV3j78TmHtabm9HW58gielA
         0+3hWwGd4d7w9Vv+KZ4Z1MbHxIOYP9Kx47WR12sOYZ5gYALjw7ErVGACjYpNZVYcWdPF
         jQjVjtvUA/Fv5Ii/wKJBiz8uShUXNJOWxiLH1qHeGvF23Fvk9CpqlX7MoqNk8RUMYoGE
         UlE8AIkzPgtYp3IrymNAd335XHLhsSI6baho2pXmMGyug9oFe21QzAtCCCoGmJqRxORb
         QvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ov7FHGBOvuIInNzKIu654lYzqXshrZqpcCbShmDRpgA=;
        b=TNo91KZnlaW2NswxohyIp4e8H3c+9Qg7mOTxXs7zLiEPBNq8QIC1TJ/5Tx5zqgk+M/
         AjZlHlcjgeW3UDZlpOKNWKdisyE2CtdzOCLOScU1L63J0YJjmQAaosAAPiIdpsH8sSUF
         6WVh8hc3sj8l4mSYvWqZ5c0FvkKDHQJ0lznJPeWrzi8mnH6YCctZyi/KSOtyE1pIdUJm
         Eq0tiaWm8oEythzh5deafxHJeaF+daSQnCAP8a4CoQB9SdF15GugHyWKxe9glAjT4DCo
         6Zjjtlm4dIrc11acL81gdtX3HXUKqw0EbtNAs4w2d2uTMKgQ5u0wA+nDgCE7iNSLvXjV
         MzZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=U1T+KmZx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s55si454829qtb.326.2017.07.11.10.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=U1T+KmZx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUyy6-0006JS-Vr
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:29:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUyJb-0008U3-2G
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 12:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUyJY-0005zX-0h
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 12:47:11 -0400
Received: from mail-wr0-f173.google.com ([209.85.128.173]:33699)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUyJX-0005z8-Q8
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 12:47:07 -0400
Received: by mail-wr0-f173.google.com with SMTP id r103so6852335wrb.0
	for <qemu-devel@nongnu.org>; Tue, 11 Jul 2017 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ov7FHGBOvuIInNzKIu654lYzqXshrZqpcCbShmDRpgA=;
	b=U1T+KmZx+hFlvrPTTmR1Lo5UBAi3UDhvtmeoNnwRJ/DED2TqR5mgPR9J/Ixt+NIroQ
	6HF58q8z7FpBd6XTtWFH5WgKS7dSDqRJdTRkyDZ19MSi8mEodNiakMMKUQgo97lKw+lx
	+HkadmF8lJ6kxXnX9BybKWMN+o7p2IxdJG7pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ov7FHGBOvuIInNzKIu654lYzqXshrZqpcCbShmDRpgA=;
	b=ZXY8jNx2Jv2M5CYUSqEplIgwHXn8lwKVfDEksY36Zi/rtv87YWyJcqdnoH4ia9aj86
	+C30U6l5EyEQr9I+r9jQ/nMVg/Yq52RaKNggfH0qzWw/nEfXUbUrqed/myYZOjmwtH5z
	y89fLzwtlURDDhtRvC/U6x4A+xvjGMV+w2NHVd2Qm1FqhjcaygwgfFCVwRLg/lWEA3z5
	f5tnfGzByoP/lJzsayank1CT0WBxYVcRNFmkFNjLx9Vx3eHIoVZVDk14SrNaOSpJtwfV
	XmadIDFqFCojCjINSlEePaEsAQukYEvSCPzGha8t6OAI1SlSKG8+JEsfQdrZ/Dns9j0w
	5g8g==
X-Gm-Message-State: AIVw1114yxcWOQDpdwJQ/rUK+JeevAKXIUVxyaVT/atOFhBL/wueH9mC
	bdaGekpJW5lBxK8HsiD4Ml4TFqbFWyA/
X-Received: by 10.28.129.203 with SMTP id c194mr6938282wmd.120.1499791566561; 
	Tue, 11 Jul 2017 09:46:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 09:45:46 -0700 (PDT)
In-Reply-To: <CAKmqyKOW1s7zbLFD2E+X+5--Gk0sBmK_mdbEaPDVD-C4JUxrKA@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
	<CAFEAcA_DyoTE+idUtiWOB4ptA-TMcmU2WRYWjo2Lwt7+RD8xEQ@mail.gmail.com>
	<CAKmqyKOW1s7zbLFD2E+X+5--Gk0sBmK_mdbEaPDVD-C4JUxrKA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 17:45:46 +0100
Message-ID: <CAFEAcA8s+WJH+3Xt41WC7JMYG5Lqwj_d4Kg-zW7cXgwiw-5muw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.173
Subject: Re: [Qemu-devel] [PATCH 2/7] hw/char/cmsdk-apb-uart.c: Implement
 CMSDK APB UART
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 30s8ESYbuKdj

On 11 July 2017 at 16:40, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Jul 11, 2017 at 5:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 11 July 2017 at 16:12, Alistair Francis <alistair23@gmail.com> wrote:
>>> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> Implement a model of the simple "APB UART" provided in
>>>> the Cortex-M System Design Kit (CMSDK).
>>>>
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>>>> +} CMSDKAPBUART;
>>>
>>> This should be CamelCase.
>>
>> Yes, but CamelCase where all the words are all-uppercase
>> (as with CMSDK, APB and UART) is indistinguishable from
>> all-uppercase. (Compare the way we say "PCIIORegion" rather
>> than "PciIoRegion".)
>
> Good point, I feel like it just looks strange being all caps though.

Me too, but I didn't have any better naming ideas.

>>>> +static void uart_update_parameters(CMSDKAPBUART *s)
>>>> +{
>>>> +    QEMUSerialSetParams ssp;
>>>> +
>>>> +    /* This UART is always 8N1 but the baud rate is programmable.
>>>> +     * The minimum permitted bauddiv setting is 16, so we just ignore
>>>> +     * settings below that (usually this means the device has just
>>>> +     * been reset and not yet programmed).
>>>> +     */
>>>> +    if (s->bauddiv < 16 || s->bauddiv > s->pclk_frq) {
>>>> +        return;
>>>> +    }
>>>
>>> This seems like it should deserve a guest error print.
>>
>> As the comment says, that would cause us to print a spurious
>> warning every time the device was reset.
>
> I just see this being hard to debug. What about if not printing if
> baud rate is 0 but guest error otherwise?
>
> Or can this not be called from reset?

The thing is that the guest error really here is "enabled TX
but didn't program the baud rate". So if you want to flag it
up you'd want to do it in uart_write() at the point where
CTRL.TX_EN is written to 1, not in this function. I decided I
didn't really care enough to check and report that (we often
don't bother to track every possible guest mistake). It won't
make any difference to QEMU anyway except in the vanishingly
rare case that the user connects QEMU up to a real serial port.
I very nearly didn't bother to implement the set-params logic
at all (we don't have it on the pl011 and nobody's ever complained).

I can add the qemu_log on "TX_EN written as 1 and baud_div out
of range" if you think it's helpful though.

>>>> +static int uart_can_receive(void *opaque)
>>>> +{
>>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>>> +
>>>> +    /* We can take a char if RX is enabled and the buffer is empty */
>>>> +    if (s->ctrl & R_CTRL_RX_EN_MASK && !(s->state & R_STATE_RXFULL_MASK)) {
>>>> +        return 1;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void uart_receive(void *opaque, const uint8_t *buf, int size)
>>>> +{
>>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>>> +
>>>> +    trace_cmsdk_apb_uart_receive(*buf);
>>>> +
>>>> +    if (!(s->ctrl & R_CTRL_RX_EN_MASK)) {
>>>> +        /* Just drop the character on the floor */
>>>> +        return;
>>>
>>> Doesn't this also deserve a guest error print.
>>
>> It's a can't-happen case because uart_can_receive() won't
>> return 1 if the EN bit is clear. Checking again here is
>> perhaps unnecessary paranoia, but it's not a guest error.
>
> Ah good point. Maybe that is worth stating?

Mmm, something like:
    /* In fact uart_can_receive() ensures that we can't be
     * called unless RX is enabled and the buffer is empty,
     * but we include this logic as documentation of what the
     * hardware does if a character arrives in these circumstances.
     */

(Or we could delete this and the RXFULL check below it
entirely.)

thanks
-- PMM
