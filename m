Received: by 10.25.44.15 with SMTP id s15csp1815616lfs;
        Thu, 13 Jul 2017 00:33:51 -0700 (PDT)
X-Received: by 10.237.48.65 with SMTP id 59mr3368814qte.10.1499931231429;
        Thu, 13 Jul 2017 00:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499931231; cv=none;
        d=google.com; s=arc-20160816;
        b=DpYMNiE87FEVXohf3+OTkg+P0W1iQrrYZvMNQBAf8TpJYXFL54sXU2Kjbe+pYWU/OL
         XlQnpINrRXCRtoUMGiCy2cAxEiT0/x7oG+kW7oOprx/+82bLyDtaD1F52N++8hRQoc+R
         +0NtaO6MLnxh7fH1WS5OzyPk/1x9xBzIWOdfN1sQ1YNUeeKkkOKP8iSARx76eTiiKrKN
         3CiNEETjPhAL30BDCdQsnd1HXmjRpXFoUzMqtsnMJSuVDplqRYwANLEWrthhtfVIhEbw
         fy32ptsQQtD86WRM+SGFOwZbncmppjCUzOJE1jH2SlZEv1HSjhLWZFVgbCRnx7JasqXn
         apBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q+R7qPgIFCLLLlIrEohv9RzTl1D9Kk/3c3jmjPZTTLo=;
        b=IiO0X8ZUJ7ZQ1G4wFFNh0vViBBZaDmhEbOr8r+N4Lxzu5PU28ui+JcDU+qP4kbf/Dh
         B1uH1i7/gLoCMDkouUifvh5CCkfQCgBefTV675Ib7zkMfG7Yz8RQWCj6C5KhVRmxY+Xw
         3v56FqxSBYvD+SE/2faoOBUWENp2kfd5HHpOfvpvjld1dHrp3soaqwk6JB2+63S/S8Vj
         Sz59rmeyDs6hJCvuziMST9N22Z19dlqoLeWRrFtKHeKepGdGGgx9roy0TpmjsfvGHVc1
         Wzr2gDReJ/fY9jgTwMYMwD6tk9ilyasFHWtbMoS8xP15PtTJY7U2HYg/GL6FWst7sOxH
         Xk3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Z68DJSyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h73si4608754qka.69.2017.07.13.00.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 00:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Z68DJSyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVYdA-0002SY-I5
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 03:33:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dVYcz-0002M3-K0
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 03:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dVYcw-00051s-Dz
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 03:33:37 -0400
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dVYcw-00050X-4B; Thu, 13 Jul 2017 03:33:34 -0400
Received: by mail-wm0-f50.google.com with SMTP id w126so14736695wme.0;
	Thu, 13 Jul 2017 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q+R7qPgIFCLLLlIrEohv9RzTl1D9Kk/3c3jmjPZTTLo=;
	b=Z68DJSyK2aLm3VUjoQYh4ESxvNCfLgFi/JhLk9FKm9Yjf4DnBIiGEi2NSfExgByRl2
	JfC6tLn3IgLvs92hHhJHxa7t8lXzUqyIoBieiHBkrABUwv+R2GVf9Pnb1EXtlCO+ZrKz
	zI17YydUMWeeMDMB5WBE9hhdzjsyAGnBaFxvz58YYJNv3DcU1O6kLNWfFL9tp7+KwCXK
	QI4hVGPjBpkg0S4ajGqt/n+onuhU3WcUTfafI8+74FgDX8EMuUGJVuia4kuYb6kyhvdE
	0z1iRe/tOAF7hQcITb9ifmayQm4j69esMrFilvrvdywI/Jc5WjT5Nfjt/tnYVOdIcGes
	D9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q+R7qPgIFCLLLlIrEohv9RzTl1D9Kk/3c3jmjPZTTLo=;
	b=nDhvasG6rj//M7E0jpIap9Q3CFwTnxLutH6H4aXvkHkzxseQ0ApaJ/ewkWtg7veKru
	FBRBVvmQUROUljp/NI7T0FCNLtKL4Z0wCPMbcCSKOdO2xhp3JHnF8DXXi2FYftfWKAYh
	eXGWFLsedK9uTOAdKAiSzuJ4ugfRckZiVHdI807WzIwFIF1osbwXtPkjeJN/mVjj7yqf
	OJCKNUznfItExQKcMa8OpRrRgwPX0Fh1nwGlFLveoGNvbN4yIba43RY3O9RuxHd0mS/F
	P4XyiQ4vSFhEh88BYrsqRKupPjkdWlJFxdMKkVIWZBFujbHd3D1KfiTLpEYMPIK1trM6
	RD3Q==
X-Gm-Message-State: AIVw110YdYFfaOj/iIAC9BTOjRIkxrGB1hC0I0av0z79XS49BxtN9eO9
	LNejsvQ+0W/09bo6ubFAtk1jTddBKrV+yUo=
X-Received: by 10.28.140.143 with SMTP id o137mr964076wmd.47.1499931152837;
	Thu, 13 Jul 2017 00:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Thu, 13 Jul 2017 00:32:02 -0700 (PDT)
In-Reply-To: <CAFEAcA8s+WJH+3Xt41WC7JMYG5Lqwj_d4Kg-zW7cXgwiw-5muw@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
	<CAFEAcA_DyoTE+idUtiWOB4ptA-TMcmU2WRYWjo2Lwt7+RD8xEQ@mail.gmail.com>
	<CAKmqyKOW1s7zbLFD2E+X+5--Gk0sBmK_mdbEaPDVD-C4JUxrKA@mail.gmail.com>
	<CAFEAcA8s+WJH+3Xt41WC7JMYG5Lqwj_d4Kg-zW7cXgwiw-5muw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Jul 2017 09:32:02 +0200
Message-ID: <CAKmqyKM7rR6n55Y+Fysomhjq26cQhJLj62oFYMDGdetmkwZVew@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.50
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
X-TUID: nnJxv1EMV7lH

On Tue, Jul 11, 2017 at 6:45 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 11 July 2017 at 16:40, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Jul 11, 2017 at 5:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 11 July 2017 at 16:12, Alistair Francis <alistair23@gmail.com> wrote:
>>>> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>> Implement a model of the simple "APB UART" provided in
>>>>> the Cortex-M System Design Kit (CMSDK).
>>>>>
>>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>
>>>>> +} CMSDKAPBUART;
>>>>
>>>> This should be CamelCase.
>>>
>>> Yes, but CamelCase where all the words are all-uppercase
>>> (as with CMSDK, APB and UART) is indistinguishable from
>>> all-uppercase. (Compare the way we say "PCIIORegion" rather
>>> than "PciIoRegion".)
>>
>> Good point, I feel like it just looks strange being all caps though.
>
> Me too, but I didn't have any better naming ideas.
>
>>>>> +static void uart_update_parameters(CMSDKAPBUART *s)
>>>>> +{
>>>>> +    QEMUSerialSetParams ssp;
>>>>> +
>>>>> +    /* This UART is always 8N1 but the baud rate is programmable.
>>>>> +     * The minimum permitted bauddiv setting is 16, so we just ignore
>>>>> +     * settings below that (usually this means the device has just
>>>>> +     * been reset and not yet programmed).
>>>>> +     */
>>>>> +    if (s->bauddiv < 16 || s->bauddiv > s->pclk_frq) {
>>>>> +        return;
>>>>> +    }
>>>>
>>>> This seems like it should deserve a guest error print.
>>>
>>> As the comment says, that would cause us to print a spurious
>>> warning every time the device was reset.
>>
>> I just see this being hard to debug. What about if not printing if
>> baud rate is 0 but guest error otherwise?
>>
>> Or can this not be called from reset?
>
> The thing is that the guest error really here is "enabled TX
> but didn't program the baud rate". So if you want to flag it
> up you'd want to do it in uart_write() at the point where
> CTRL.TX_EN is written to 1, not in this function. I decided I
> didn't really care enough to check and report that (we often
> don't bother to track every possible guest mistake). It won't
> make any difference to QEMU anyway except in the vanishingly
> rare case that the user connects QEMU up to a real serial port.
> I very nearly didn't bother to implement the set-params logic
> at all (we don't have it on the pl011 and nobody's ever complained).
>
> I can add the qemu_log on "TX_EN written as 1 and baud_div out
> of range" if you think it's helpful though.

I think it makes sense to add. It's one line of code and can possibly
be very helpful for debugging.

>
>>>>> +static int uart_can_receive(void *opaque)
>>>>> +{
>>>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>>>> +
>>>>> +    /* We can take a char if RX is enabled and the buffer is empty */
>>>>> +    if (s->ctrl & R_CTRL_RX_EN_MASK && !(s->state & R_STATE_RXFULL_MASK)) {
>>>>> +        return 1;
>>>>> +    }
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void uart_receive(void *opaque, const uint8_t *buf, int size)
>>>>> +{
>>>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>>>>> +
>>>>> +    trace_cmsdk_apb_uart_receive(*buf);
>>>>> +
>>>>> +    if (!(s->ctrl & R_CTRL_RX_EN_MASK)) {
>>>>> +        /* Just drop the character on the floor */
>>>>> +        return;
>>>>
>>>> Doesn't this also deserve a guest error print.
>>>
>>> It's a can't-happen case because uart_can_receive() won't
>>> return 1 if the EN bit is clear. Checking again here is
>>> perhaps unnecessary paranoia, but it's not a guest error.
>>
>> Ah good point. Maybe that is worth stating?
>
> Mmm, something like:
>     /* In fact uart_can_receive() ensures that we can't be
>      * called unless RX is enabled and the buffer is empty,
>      * but we include this logic as documentation of what the
>      * hardware does if a character arrives in these circumstances.
>      */
>
> (Or we could delete this and the RXFULL check below it
> entirely.)

I like the comment, it makes sure it is really clear.

Thanks,
Alistair

>
> thanks
> -- PMM
