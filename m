Received: by 10.25.159.131 with SMTP id i125csp801730lfe;
        Thu, 8 Dec 2016 03:23:11 -0800 (PST)
X-Received: by 10.200.43.166 with SMTP id m35mr72818041qtm.261.1481196191322;
        Thu, 08 Dec 2016 03:23:11 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n57si17035107qtn.37.2016.12.08.03.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Dec 2016 03:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEwn8-0003eZ-L6
	for alex.bennee@linaro.org; Thu, 08 Dec 2016 06:23:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.gacek@gmail.com>) id 1cEwmR-0003cJ-8U
	for qemu-devel@nongnu.org; Thu, 08 Dec 2016 06:22:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.gacek@gmail.com>) id 1cEwmN-0008FL-6Q
	for qemu-devel@nongnu.org; Thu, 08 Dec 2016 06:22:27 -0500
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.gacek@gmail.com>)
	id 1cEwmN-0008Et-0B; Thu, 08 Dec 2016 06:22:23 -0500
Received: by mail-wm0-f67.google.com with SMTP id g23so2920067wme.1;
	Thu, 08 Dec 2016 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=37FMMbQAsuxXZBCmOHnvb1zToZw0fw+sEhhLTky8Exs=;
	b=sv4+FDNcg5vLMOLVtUvcYaiNAG7Y0mCLC0hotH17lhbcAbC2C8xAL69nzjT0pC9XBt
	7TIq9RWVn+AvE8lzU22ujZiVKu3VMocaH8Ru7X6UHkUtjW9B8P4RqIJ5vOn97EKmiuNP
	9reWNaWNuJnTkpcs11ZZcgTcGH7pVU7W5oLftWAbEwH30b8HzsKZYs+2RFU0MB4cnc4h
	BFhMOpfX3Fjv2RctptISirfgTXW0CyJ8pqbRfO+xhOHX2+kWtEtIGTL441vO2Ow1g79Q
	/yJ9GUBxpXi3w9mtV6Pv0c3ZxCjRcBD9zhQUAQB3kbsu91tDqhI2zg6qKRUDUyAly5Gl
	CIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=37FMMbQAsuxXZBCmOHnvb1zToZw0fw+sEhhLTky8Exs=;
	b=cNzCx1vN3uslQVxwAAv1nTckXFYrue/9fHaJiSIKrO/p86WZScVji3RQKyXunLTyt/
	bKoX+PktunexicfDWYm37nhvtbGoHi/kkcwka368fwz8M628Kx2j0BW0UGTXeZaKCeRI
	FLDBhBWT0UanJMUJ0z6KGCkuVklu8VYiZXWkmFeJt2/Ex3Mesp1HYjPzmz2gZxL1bcSO
	oJlwxq+UqC5VU/74SgA67XLjbK/OQ/Hra7jtrNLfWMFiTY70MtNV7XoCJUqEZi8p08b5
	rBxo/hvUTFoHiUfN7gA+BJp3OLqZG4D/If2O0UZa6dQ9nadJR2PCwFwZvll/b7wjyclY
	9NSg==
X-Gm-Message-State: AKaTC038Zymz1UzpQQOD4DYmo51zHiiz9Y84Sx+Qbd+pn9jBVvWh6h818iViRLpPbHH0/Rr46HtOb9zh/6l4LQ==
X-Received: by 10.25.221.82 with SMTP id u79mr25234060lfg.52.1481196081812;
	Thu, 08 Dec 2016 03:21:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.173.102 with HTTP; Thu, 8 Dec 2016 03:21:01 -0800 (PST)
In-Reply-To: <20161208104252.GH9606@toto>
References: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
	<293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
	<20161208104252.GH9606@toto>
From: Andrew Gacek <andrew.gacek@gmail.com>
Date: Thu, 8 Dec 2016 05:21:01 -0600
Message-ID: <CAHgzvFjyvHOSYdGyi8_ug+tO1rE_0TZXVQwc9g=NnZJxQ2Dtdg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
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
X-TUID: d2L2nzl3/yXa

When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
0, the receiver timeout counter should be disabled. See page 1801 of
"Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
such a check before setting the receive timeout interrupt.

Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/char/cadence_uart.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 0215d65..378630d 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -138,9 +138,11 @@ static void fifo_trigger_update(void *opaque)
 {
     CadenceUARTState *s = opaque;

-    s->r[R_CISR] |= UART_INTR_TIMEOUT;
+    if (s->r[R_RTOR]) {
+        s->r[R_CISR] |= UART_INTR_TIMEOUT;

-    uart_update_status(s);
+        uart_update_status(s);
+    }
 }

 static void uart_rx_reset(CadenceUARTState *s)
-- 
2.7.4

On Thu, Dec 8, 2016 at 4:42 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Thu, Dec 08, 2016 at 08:50:40AM +0100, Laurent Vivier wrote:
>> I CC: Xilinx Zynq Maintainers.
>>
>> Laurent
>
> Thanks
>
>>
>> On 07/12/2016 22:12, Andrew Gacek wrote:
>> > When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
>> > 0, the receiver timeout counter should be disabled. See page 1801 of
>> > "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
>> > such a check before setting the receive timeout interrupt.
>
> We could also try to disable the timer when rtor is zero but I think
> that exposes a bunch of corner cases that would complicate the model a bit.
> So IMO, this patch is good.
>
>
>> > Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
>> > ---
>> >  hw/char/cadence_uart.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>> > index 0215d65..54194b1 100644
>> > --- a/hw/char/cadence_uart.c
>> > +++ b/hw/char/cadence_uart.c
>> > @@ -138,7 +138,9 @@ static void fifo_trigger_update(void *opaque)
>> >  {
>> >      CadenceUARTState *s = opaque;
>> >
>> > -    s->r[R_CISR] |= UART_INTR_TIMEOUT;
>> > +    if (s->r[R_RTOR]) {
>> > +        s->r[R_CISR] |= UART_INTR_TIMEOUT;
>> > +    }
>> >
>> >      uart_update_status(s);
>
> Since you are not modifying the IRQ state when the timeout is disabled, you can avoid calling uart_update_status too (because it will only end up recomputing the same state).
>
> With that fix:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>
> Best regards,
> Edgar
