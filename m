Received: by 10.80.166.35 with SMTP id d32csp1244753edc;
        Fri, 28 Oct 2016 09:01:38 -0700 (PDT)
X-Received: by 10.13.243.1 with SMTP id c1mr13130666ywf.182.1477670498079;
        Fri, 28 Oct 2016 09:01:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l64si3730254ywg.314.2016.10.28.09.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 09:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c09b6-0008IQ-Nw
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 12:01:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1c09B8-0001Vo-M1
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 11:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1c09B7-00038M-KU
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 11:34:46 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1c09Az-00033E-9j; Fri, 28 Oct 2016 11:34:37 -0400
Received: by mail-oi0-x243.google.com with SMTP id n202so4121577oig.2;
	Fri, 28 Oct 2016 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=UAxvvBJcNvTDyfjzulq4RIOZkvuEzwTf0FC1NSxE+F8=;
	b=usCGWdE/e8nRHjhNJ4wG6be/4TOknQtqS6R475F3u2eXe+Q9kD5QkKDzmEOTtOZkt4
	4BkfY/K8+QmQx2h2zzqcU9xIk4CoP+RjKacW3IVjhduIKAvrfoTVvTpRIszWSb8efv/h
	4FtzDnvjSbp74tK0bWENI1tIY+YJz7jrS+e8LYHK7d7dvSz1OI7TrBnv7HkabToQxPMP
	b0b+2zTte7wNnrxXuXToSb0aNleKWb5DAj+RMWhoSOn1sJbp6WP6juTGnrY4NnYx9BZm
	iDB2mVoDsjkUWVF5fHO+IAg/dND41y6LP2MT9Lielq76BYacAXschGzwoddeQ28LUBV1
	YeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=UAxvvBJcNvTDyfjzulq4RIOZkvuEzwTf0FC1NSxE+F8=;
	b=Xj3ulvZeUw1ZgFBT9crUePmsqmBxMO0BU+TLXpJXgOCm5Fl9wr7HGa4zpB3GMNQFNE
	f4iRkMKi89vqsHF6tTahlrUQ7J+vncqpGABaRUF+O1pC1XakvhWpaU68+CNECyGYpmBv
	7Y/dFlBa14eRT2+YiQp/kC2+gRWyhl3TnK91lx14S/j52pdY0Kwh99+5BFLynwWCymI8
	fEcbybzqD7pZ0/i7mNZQghtk1F51Y7e2E2oCSs8PkNSgjPDB7gL9vA5qFk4u2zma6dOM
	O0n7sI8KGpnIRUli9uLq7JGxtb4g958SbDFcyhRh1kePUbCEYpsHB1BmA6JNkZXsEZZH
	wHiQ==
X-Gm-Message-State: ABUngvfRXVeNdS4wNHT3EP8ITW8nFHHQnx2liYznWY7uC2p1OSv5nyQmuIXyuDFN6qPDbfgkIF8E5qlo6EE29w==
X-Received: by 10.202.197.71 with SMTP id v68mr4328732oif.71.1477668875893;
	Fri, 28 Oct 2016 08:34:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Fri, 28 Oct 2016 08:34:05 -0700 (PDT)
In-Reply-To: <1477596278-1470-1-git-send-email-ppandit@redhat.com>
References: <1477596278-1470-1-git-send-email-ppandit@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 28 Oct 2016 08:34:05 -0700
X-Google-Sender-Auth: gfx-VmRMdL6f5PrfKmViCvv2niY
Message-ID: <CAKmqyKOMveh+4Hkt6F5qS8D0qSofhBK1dsTzSDTa_Uj6GOmL1w@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] char: cadence: check baud
 rate generator and divider values
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Imp/GeidRnNd

On Thu, Oct 27, 2016 at 12:24 PM, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The Cadence UART device emulator calculates speed by dividing the
> baud rate by a 'baud rate generator' & 'baud rate divider' value.
> The device specification defines these register values to be
> non-zero and within certain limits. Add checks for these limits
> to avoid errors like divide by zero.
>
> Reported-by: Huawei PSIRT <psirt@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

This looks good to me. I'll spin up a new patch for the migration fix
next week (I won't have time today).

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/char/cadence_uart.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> Update: remove default reset value assignment.
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg07206.html
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index e3bc52f..4a3c4c6 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -1,6 +1,11 @@
>  /*
>   * Device model for Cadence UART
>   *
> + * Reference: Xilinx Zynq 7000 reference manual
> + *   - http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
> + *   - Chapter 19 UART Controller
> + *   - Appendix B for Register details
> + *
>   * Copyright (c) 2010 Xilinx Inc.
>   * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
>   * Copyright (c) 2012 PetaLogix Pty Ltd.
> @@ -410,6 +415,16 @@ static void uart_write(void *opaque, hwaddr offset,
>              break;
>          }
>          break;
> +    case R_BRGR: /* Baud rate generator */
> +        if (value >= 0x01) {
> +            s->r[offset] = value & 0xFFFF;
> +        }
> +        break;
> +    case R_BDIV:    /* Baud rate divider */
> +        if (value >= 0x04) {
> +            s->r[offset] = value & 0xFF;
> +        }
> +        break;
>      default:
>          s->r[offset] = value;
>      }
> --
> 2.7.4
>
>
