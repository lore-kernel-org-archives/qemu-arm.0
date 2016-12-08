Received: by 10.25.159.131 with SMTP id i125csp803824lfe;
        Thu, 8 Dec 2016 03:29:16 -0800 (PST)
X-Received: by 10.55.200.75 with SMTP id c72mr71259116qkj.169.1481196556444;
        Thu, 08 Dec 2016 03:29:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o36si17008906qtd.323.2016.12.08.03.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Dec 2016 03:29:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEwt1-00079u-S8
	for alex.bennee@linaro.org; Thu, 08 Dec 2016 06:29:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.gacek@gmail.com>) id 1cEwqh-0005sn-N3
	for qemu-devel@nongnu.org; Thu, 08 Dec 2016 06:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.gacek@gmail.com>) id 1cEwqd-0001jY-K3
	for qemu-devel@nongnu.org; Thu, 08 Dec 2016 06:26:51 -0500
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.gacek@gmail.com>)
	id 1cEwqd-0001jT-FU; Thu, 08 Dec 2016 06:26:47 -0500
Received: by mail-qk0-f195.google.com with SMTP id h201so52397657qke.3;
	Thu, 08 Dec 2016 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RJxyR8pEfQKfoGdn7yH2a3aXjkb88P3NcqbkhCOWd/k=;
	b=MH8lyZo9+ruhsprSvyHQKwQamFyVi2lont2NdqVJgIOmYL4bfQP4AzMfNhlHu2ma/S
	lp5ZoOd1VgGdFCPndCImi50ElCRQvMANPqOORUub7OuKg9zGAhfcMtCDTtXdBTnqB57p
	Z4Lrj3wayVsk+0hK8x9yG20rvKXs/dfAaVTXBJ5itufZcVJazLeKp+CdoRCRVqGpEfuw
	4BqgNokxE0Pm281+kCk0vRdzpmrAQjouqbW/6RGCFf9YxcKBeFys4jTM+Lo7jEQEtm4k
	oGFJLNeHUHTG7P8jocF6L/cWOw5ujRokIoVKQKhA/frItGKKjE+avwtk8Dl7s64Xscgi
	9dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RJxyR8pEfQKfoGdn7yH2a3aXjkb88P3NcqbkhCOWd/k=;
	b=JNCHeaPteYlA+yBL89uwghcccoLmOCUpsvr0fiqisBVcSV58xSG2YJsiOedR1aYz9p
	fwA2fq3HBu0WSzHwxtvY60FPpLyzZ1AvmBKmDs+vS7bY4qhv3mS69+g/TlRX8B+UyMki
	Kc/dE8U31DXYJ5eW/yZ1XOIrrKl46hILJHFf90Vt5V6VI0lIbwrTK5e1zhezcs5WA6Vb
	rydCxAsQDV8rlfs0kQ7/wXEDHGgkIFgeIOI3fOpl4VANcGfcVlYbBRs5WhI4XLQJLUfd
	0QQqiqf7gU1JzLe+YTqcruQ/Qg2nUR6lHvaS8tsWWN5fzZqV4OMJsxmweeWWXmr2mvb/
	UZkw==
X-Gm-Message-State: AKaTC01Fah9MimPuTIkZ4txpe950QGQWydAwd2aHxTTWhso2pBZYLQkUo8f4BG15c77/EDg5aQUGPFN7jEPlIw==
X-Received: by 10.46.69.137 with SMTP id s131mr33174028lja.26.1481196346607;
	Thu, 08 Dec 2016 03:25:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.173.102 with HTTP; Thu, 8 Dec 2016 03:25:26 -0800 (PST)
In-Reply-To: <CAHgzvFjyvHOSYdGyi8_ug+tO1rE_0TZXVQwc9g=NnZJxQ2Dtdg@mail.gmail.com>
References: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
	<293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
	<20161208104252.GH9606@toto>
	<CAHgzvFjyvHOSYdGyi8_ug+tO1rE_0TZXVQwc9g=NnZJxQ2Dtdg@mail.gmail.com>
From: Andrew Gacek <andrew.gacek@gmail.com>
Date: Thu, 8 Dec 2016 05:25:26 -0600
Message-ID: <CAHgzvFi2ft+Oqo7MvmJQWa_Wv5AYKxZveaLi2FZ3OiY8BZrA=Q@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.195
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] cadence_uart: Check if
 receiver timeout counter is disabled
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ncpWsKdgyzxU

Laurent, thanks for CC'ing Xilinx Zynq maintainers. I read that part
of the submission guidelines, then completely forgot to do it.

Edgar, thanks for the comments. I wasn't sure if I needed to call that
function or not. Also, one other discrepancy with the technical
reference manual is that writing to R_RTOR should mask off all but the
lower 8 bits. I'm not sure how important that actually is (since the
timer isn't really implemented in qemu), but I thought I'd mention it.
For my use case, the current patch fixes the issue we were having.

-Andrew

On Thu, Dec 8, 2016 at 5:21 AM, Andrew Gacek <andrew.gacek@gmail.com> wrote:
> When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
> 0, the receiver timeout counter should be disabled. See page 1801 of
> "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
> such a check before setting the receive timeout interrupt.
>
> Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/char/cadence_uart.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 0215d65..378630d 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -138,9 +138,11 @@ static void fifo_trigger_update(void *opaque)
>  {
>      CadenceUARTState *s = opaque;
>
> -    s->r[R_CISR] |= UART_INTR_TIMEOUT;
> +    if (s->r[R_RTOR]) {
> +        s->r[R_CISR] |= UART_INTR_TIMEOUT;
>
> -    uart_update_status(s);
> +        uart_update_status(s);
> +    }
>  }
>
>  static void uart_rx_reset(CadenceUARTState *s)
> --
> 2.7.4
>
> On Thu, Dec 8, 2016 at 4:42 AM, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
>> On Thu, Dec 08, 2016 at 08:50:40AM +0100, Laurent Vivier wrote:
>>> I CC: Xilinx Zynq Maintainers.
>>>
>>> Laurent
>>
>> Thanks
>>
>>>
>>> On 07/12/2016 22:12, Andrew Gacek wrote:
>>> > When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
>>> > 0, the receiver timeout counter should be disabled. See page 1801 of
>>> > "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
>>> > such a check before setting the receive timeout interrupt.
>>
>> We could also try to disable the timer when rtor is zero but I think
>> that exposes a bunch of corner cases that would complicate the model a bit.
>> So IMO, this patch is good.
>>
>>
>>> > Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
>>> > ---
>>> >  hw/char/cadence_uart.c | 4 +++-
>>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>>> >
>>> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>>> > index 0215d65..54194b1 100644
>>> > --- a/hw/char/cadence_uart.c
>>> > +++ b/hw/char/cadence_uart.c
>>> > @@ -138,7 +138,9 @@ static void fifo_trigger_update(void *opaque)
>>> >  {
>>> >      CadenceUARTState *s = opaque;
>>> >
>>> > -    s->r[R_CISR] |= UART_INTR_TIMEOUT;
>>> > +    if (s->r[R_RTOR]) {
>>> > +        s->r[R_CISR] |= UART_INTR_TIMEOUT;
>>> > +    }
>>> >
>>> >      uart_update_status(s);
>>
>> Since you are not modifying the IRQ state when the timeout is disabled, you can avoid calling uart_update_status too (because it will only end up recomputing the same state).
>>
>> With that fix:
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>
>> Best regards,
>> Edgar
