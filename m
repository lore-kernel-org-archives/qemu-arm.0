Received: by 10.25.44.15 with SMTP id s15csp4994582lfs;
        Tue, 11 Jul 2017 08:34:01 -0700 (PDT)
X-Received: by 10.237.41.225 with SMTP id o88mr663925qtd.27.1499787241177;
        Tue, 11 Jul 2017 08:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499787241; cv=none;
        d=google.com; s=arc-20160816;
        b=BqeRfMT0cTmQ6zXgsbaqx5m2MT8lBfVQluRlHMzk2O1bQSbt6Z3BSMxIJyJ3STx8AE
         CrvRYnG955ohr7SlzxoGIV11iJmIgBjx1/heFwmpzkGygAQJXZvGPPDdRbG/59Rh1U5P
         qkxgBlduJLeUp9qvdxW5WRitHymHNvkOdV/IKByX8SnAxe7fwvRji9/HaFF+62sB/lry
         MEk8wwbaQ/cQRBvw41rQapTPSKU5zfpnDUk18adruVsddHWJQGvGuULaoYrjtRm/4HBn
         Tx5wCTFIBFvQtE+E2GJCfmU48iEfP066+tALV/2d9Ao362yc8XwoXhLZLxz/HPmir91T
         cY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6RqdusOHaRxoBEjd+IhEiXlOvd5D3MQXqax0o8Usu3Y=;
        b=JAEHkZSnILPq8JIiv/vaBQwBBsjYBYop+rC9pumIxnbmZrCjHxyB0I+ZpVWRcc/2No
         JPiQVA+hnQ1d5DAkZZTzRybGlpfEufViVqJqkx7Ne2hicrBbWVraoXif777j2neEYc8E
         AwnqH5LD5plElCcOaxSrhX6LvJsRp0oh7AWJWyVq7DQksy4Ll619AZ2OoOOF0TTOpZNy
         xBz/ImoJoCVAjuymXtIJWd/8AlFh8YcdJTX0QiUUyCRt5/oj6+9BYHXJR2Eb2+4AGPE6
         AZMX5o25m2rDW0RZjwybJBM97ZVz25TDIteCUSVvPVLzZgXjOfr5pE21DWhXi/Fr100J
         /0zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=J5cjgyG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t14si216035qtg.251.2017.07.11.08.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:34:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=J5cjgyG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUxAk-0004Z4-CU
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:33:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUxAh-0004XR-5V
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUxAf-0005y4-PW
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:33:55 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:35241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUxAf-0005xe-Dt
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:33:53 -0400
Received: by mail-wr0-x22e.google.com with SMTP id k67so4008948wrc.2
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6RqdusOHaRxoBEjd+IhEiXlOvd5D3MQXqax0o8Usu3Y=;
	b=J5cjgyG90kQDJ89l+gQRwJq+C17jQ8GdBcMnFoQ2R4YlVhVAKdxfFj0q6srhrSzL46
	p1HoBAo3mNFC7GFAyYaklwdPIxvBJblJKseol+vDDGjqmRC9PClGl2rPaLhZzTjtz3uZ
	En8WvQ4RuUU50Sf8p/AEssAL4+nbCmltdkbDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6RqdusOHaRxoBEjd+IhEiXlOvd5D3MQXqax0o8Usu3Y=;
	b=CFsquUgz02yg/rIr3QBBW1HOPZWPBfkNfnbOb3dGur5QH9rR6xD6SXwyvh3oPGsD0g
	asyNlsPzaGujcLzpPvfHm5BlMO7NPauKqJHG40yr6D8vP1hRrH7Ie4gYozOsm796n/BZ
	4Vb0ez060ba5le0+htlbA71B4gs1YawSNQo2ywWQQnpCaFzoMKUSEX50ZrJ1gftm9g7x
	aCAn+SxbnVVVdEFEwy6IPrRFaW9neMzurerX04ZEBqU7dC2ugbrQgPiyTJDMCTQ+5Iec
	Sznt5XbuSX1qmZuKi+y4jrNQkrW8pp+R1FwDFVf1+WVAyeWw1vGjESWcN103MVFCJ3eo
	N0Gg==
X-Gm-Message-State: AIVw1123Sng6V/DbRDGl9RaW69apG8c/KN3V5qwXW5Vrs9neFuJuzQA9
	q3hVClbLN3oNsrHYQOOyQSS6JbmExLv0
X-Received: by 10.28.126.87 with SMTP id z84mr3126641wmc.65.1499787232045;
	Tue, 11 Jul 2017 08:33:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 08:33:31 -0700 (PDT)
In-Reply-To: <CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 16:33:31 +0100
Message-ID: <CAFEAcA_DyoTE+idUtiWOB4ptA-TMcmU2WRYWjo2Lwt7+RD8xEQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
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
X-TUID: z3piqpAOa6jo

On 11 July 2017 at 16:12, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Implement a model of the simple "APB UART" provided in
>> the Cortex-M System Design Kit (CMSDK).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +} CMSDKAPBUART;
>
> This should be CamelCase.

Yes, but CamelCase where all the words are all-uppercase
(as with CMSDK, APB and UART) is indistinguishable from
all-uppercase. (Compare the way we say "PCIIORegion" rather
than "PciIoRegion".)

>> +/* This is a model of the "APB UART" which is part of the Cortex-M
>> + * System Design Kit (CMSDK) and documented in the Cortex-M System
>> + * Design Kit Technical Reference Manual (ARM DDI0479C):
>> + * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
>
> I can't find the spec from this site. Is it possible to link directly
> to the guides? I have found a few dead links from some of these
> marketing focused site.

It's the link with the big blue button "Cortex-M System Design Kit
TRM". I didn't want to link directly to the TRM, because that is
(currently) an infocenter.arm.com URL which may eventually go
away as content migrates to developer.arm.com. (The DDI document
reference number is unique and sufficient to find the document
in future even in the face of broken links.)

>> +static void uart_update_parameters(CMSDKAPBUART *s)
>> +{
>> +    QEMUSerialSetParams ssp;
>> +
>> +    /* This UART is always 8N1 but the baud rate is programmable.
>> +     * The minimum permitted bauddiv setting is 16, so we just ignore
>> +     * settings below that (usually this means the device has just
>> +     * been reset and not yet programmed).
>> +     */
>> +    if (s->bauddiv < 16 || s->bauddiv > s->pclk_frq) {
>> +        return;
>> +    }
>
> This seems like it should deserve a guest error print.

As the comment says, that would cause us to print a spurious
warning every time the device was reset.

>> +static int uart_can_receive(void *opaque)
>> +{
>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>> +
>> +    /* We can take a char if RX is enabled and the buffer is empty */
>> +    if (s->ctrl & R_CTRL_RX_EN_MASK && !(s->state & R_STATE_RXFULL_MASK)) {
>> +        return 1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void uart_receive(void *opaque, const uint8_t *buf, int size)
>> +{
>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>> +
>> +    trace_cmsdk_apb_uart_receive(*buf);
>> +
>> +    if (!(s->ctrl & R_CTRL_RX_EN_MASK)) {
>> +        /* Just drop the character on the floor */
>> +        return;
>
> Doesn't this also deserve a guest error print.

It's a can't-happen case because uart_can_receive() won't
return 1 if the EN bit is clear. Checking again here is
perhaps unnecessary paranoia, but it's not a guest error.

>> +    }
>> +
>> +    if (s->state & R_STATE_RXFULL_MASK) {
>> +        s->state |= R_STATE_RXOVERRUN_MASK;
>> +    }
>> +
>> +    s->rxbuf = *buf;
>> +    s->state |= R_STATE_RXFULL_MASK;
>> +    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
>> +        s->intstatus |= R_INTSTATUS_RX_MASK;
>> +    }
>> +    cmsdk_apb_uart_update(s);
>> +}
>> +
>> +static uint64_t uart_read(void *opaque, hwaddr offset, unsigned size)
>> +{
>> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
>> +    uint64_t r;
>> +
>> +    switch (offset) {
>> +    case A_DATA:
>> +        r = s->rxbuf;
>> +        s->state &= ~R_STATE_RXFULL_MASK;
>> +        cmsdk_apb_uart_update(s);
>> +        break;
>> +    case A_STATE:
>> +        r = s->state;
>> +        break;
>> +    case A_CTRL:
>> +        r = s->ctrl;
>> +        break;
>> +    case A_INTSTATUS:
>> +        r = s->intstatus;
>> +        break;
>> +    case A_BAUDDIV:
>> +        r = s->bauddiv;
>> +        break;
>
> You used pasrt of the register API but not the second part. This seems
> like a greaet device to use the register API on.

I really don't like the register API. The field definition
convenience macros are fine, but I prefer to define devices
with read and write functions with switches, I think it's
clearer, and it's easier to see where you want to put a breakpoint
to be able to step through register reads and writes, and so on.

>> +    case A_PID4 ... A_CID3:
>> +        r = uart_id[offset / 4 - A_PID4];
>
> I think this is the one you already found in the cover letter.

Yep. (Same in both timer and uart.)

>> +    switch (offset) {
>> +    case A_DATA:
>> +    {
>> +        s->txbuf = value;
>> +        if (s->state & R_STATE_TXFULL_MASK) {
>> +            /* Buffer already full -- note the overrun and let the
>> +             * existing pending transmit callback handle the new char.
>> +             */
>> +            s->state |= R_STATE_TXOVERRUN_MASK;
>> +            cmsdk_apb_uart_update(s);
>> +        } else {
>> +            s->state |= R_STATE_TXFULL_MASK;
>> +            uart_transmit(NULL, G_IO_OUT, s);
>> +        }
>> +        break;
>> +    }
>
> Why is this case inside braces?

I probably had a local variable in there at one point which
I ended up not needing. I'll delete the braces.

thanks
-- PMM
