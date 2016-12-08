Received: by 10.25.159.131 with SMTP id i125csp728173lfe;
        Wed, 7 Dec 2016 23:50:54 -0800 (PST)
X-Received: by 10.55.145.65 with SMTP id t62mr60351888qkd.191.1481183454616;
        Wed, 07 Dec 2016 23:50:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j53si16640550qtj.290.2016.12.07.23.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 23:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEtTh-0007NA-Uv
	for alex.bennee@linaro.org; Thu, 08 Dec 2016 02:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cEtTc-0007N3-Lj
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 02:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cEtTZ-0000Z4-Kt
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 02:50:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cEtTZ-0000W0-Cs; Thu, 08 Dec 2016 02:50:45 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B79CB91C02;
	Thu,  8 Dec 2016 07:50:43 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB87oeTr011329; Thu, 8 Dec 2016 02:50:41 -0500
To: Andrew Gacek <andrew.gacek@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, "Edgar E. Iglesias\"" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
References: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
Date: Thu, 8 Dec 2016 08:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 08 Dec 2016 07:50:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH] cadence_uart: Check if
 receiver timeout counter is disabled
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S8GqQTV4g1J6

I CC: Xilinx Zynq Maintainers.

Laurent

On 07/12/2016 22:12, Andrew Gacek wrote:
> When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
> 0, the receiver timeout counter should be disabled. See page 1801 of
> "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
> such a check before setting the receive timeout interrupt.
> 
> Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
> ---
>  hw/char/cadence_uart.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 0215d65..54194b1 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -138,7 +138,9 @@ static void fifo_trigger_update(void *opaque)
>  {
>      CadenceUARTState *s = opaque;
> 
> -    s->r[R_CISR] |= UART_INTR_TIMEOUT;
> +    if (s->r[R_RTOR]) {
> +        s->r[R_CISR] |= UART_INTR_TIMEOUT;
> +    }
> 
>      uart_update_status(s);
>  }
> 
