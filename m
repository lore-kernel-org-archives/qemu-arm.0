Received: by 10.25.208.211 with SMTP id h202csp1725252lfg;
        Mon, 7 Mar 2016 20:32:01 -0800 (PST)
X-Received: by 10.55.77.148 with SMTP id a142mr32647150qkb.44.1457411521466;
        Mon, 07 Mar 2016 20:32:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si1213165qgd.44.2016.03.07.20.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 20:32:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad9JR-0001QS-0Y
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 23:32:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9JO-0001Pc-UT
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:31:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9JN-0008U1-Ul
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:31:58 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9JN-0008Tr-QC
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:31:57 -0500
Received: by mail-vk0-x234.google.com with SMTP id k1so4317562vkb.0
	for <qemu-arm@nongnu.org>; Mon, 07 Mar 2016 20:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xh37MUTkoJjl0D3HzDhSeg0bKegxon6nSN7G+sxzEDk=;
	b=FunPQYjay7OYwGr5bq92xXZI5v/mi+V6U+Mlt89cykcrFDdLw1ytdBWSQbyTV3Rt6d
	wKc4RSOH9YvCPMkoOaoZcsFwVx/rcObUM/IbWNcAxM6jmvAQcn2tC6LsClWEYyaIj2As
	3LAPJpoh7yH88Q0mguJFAtLoXjtMwkm8NC5cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xh37MUTkoJjl0D3HzDhSeg0bKegxon6nSN7G+sxzEDk=;
	b=SCtnvCsoEk/JlmIHielFmDzJyPjxzGAiIjYJWWxo3TDDt6hTQ9UX0BIALQiY7DOMpt
	os36EAjfVOEK70vjoJLS0fwRcHrJbao/VxQjjWkBpn4R66FwqSicI8U6fLHFEczcQAqD
	To+gT5GPFm4BEn/6jFyHNJ56lTtKL27KwKbhNLcLyAxJLxDPVs/RImZ5xjMaSimCaNGF
	QbtOFWp4mee/y2xGHhXZFHrbaO56PZVdiKYpT6YjuIknwQteInK7jjCbfZxRgSvP3kTW
	GY8OZcVnlS4/XGVmW+hBNlirMfZ9FpaYjQBVAXqQheLTZSE8sEqLq+MN2BZkkNi88hFQ
	sREg==
X-Gm-Message-State: AD7BkJLAIhkU9T/X19kFN16516umgull8Upx6wv28HVSWOgCePq7LNi7WrPJ/TCBglTJ5B/X7pxe+tLDE9gGTHBb
X-Received: by 10.31.47.207 with SMTP id v198mr24396635vkv.6.1457411517243;
	Mon, 07 Mar 2016 20:31:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 7 Mar 2016 20:31:37 -0800 (PST)
In-Reply-To: <1457029479-11312-3-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1457029479-11312-3-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 11:31:37 +0700
Message-ID: <CAFEAcA9dyv3PKo3ZmzL6359qZrdMWwUEvLoYhK2YGoZ+zk-3Dw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 2/5] bcm2835_aux: add emulation of BCM2835
 AUX (aka UART1) block
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
X-TUID: gnfZWazF89UP

On 4 March 2016 at 01:24, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> At present only the core UART functions (data path for tx/rx) are
> implemented, which is enough for UEFI to boot. The following
> features/registers are unimplemented:
>   * Line/modem control
>   * Scratch register
>   * Extra control
>   * Baudrate
>   * SPI interfaces

> @@ -131,6 +139,27 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_UART));
>
> +    /* AUX / UART1 */
> +    /* XXX: pl011 (uart0) uses qemu_char_get_next_serial(), so at this point it
> +     * should have claimed the first serial device (if one exists) */
> +    chr = serial_hds[1];
> +    if (chr == NULL) {
> +        chr = qemu_chr_new("bcm2835.uart1", "null", NULL);
> +    }
> +    qdev_prop_set_chr(DEVICE(&s->aux), "chardev", chr);

You should use qemu_char_get_next_serial() rather than directly
looking in serial_hds[]. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(Eventually what should happen is that we fix pl011 to take
a chardev property, and then we can create aliases of those
properties on the bcm2835 SoC object, and wire them up in the
board level code. But that's a cleanup for another day.)

thanks
-- PMM
