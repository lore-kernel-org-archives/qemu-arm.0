Received: by 10.80.166.35 with SMTP id d32csp305763edc;
        Wed, 26 Oct 2016 15:38:11 -0700 (PDT)
X-Received: by 10.55.157.80 with SMTP id g77mr4194356qke.12.1477521491125;
        Wed, 26 Oct 2016 15:38:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y29si2554466qtc.0.2016.10.26.15.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 15:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzWpm-0003sD-Fo
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 18:38:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzWpi-0003s4-FR
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 18:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzWph-0007xX-EJ
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 18:38:06 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzWph-0007xF-9R
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 18:38:05 -0400
Received: by mail-ua0-x230.google.com with SMTP id 6so6943729uau.1
	for <qemu-arm@nongnu.org>; Wed, 26 Oct 2016 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XKN9y5jXRKKzzWaGAHhDR+xHYSmsjZ9ykpPlhis6t8o=;
	b=dWV0c9VR/2Y7v9kubsTAvjyzKKowd5k2sgWbVDnxXcSgLKdP61IWQgAOwbTEy1ytFm
	A5UbPNiUmuWXBa3td4fLiSnvUkn4hxMgeb/PhT448FCv8JtMezbi0mIVF3lvIuKE8sUA
	PSfr3QcoW5T3zUl1qjIpR9jNwclXUKOLoWzPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XKN9y5jXRKKzzWaGAHhDR+xHYSmsjZ9ykpPlhis6t8o=;
	b=SzwsBz/CZHJFyjlfYAcOA6xvIXpkPuMiBCQix2ERtfYqo2DbJYdkXtoItxI0Eeta2U
	j5jDIQfdzEBzmaEl15+5nbpovsIZo6lFj2jRCbgHhvLC3IA4SlEuGeBKyi3AORTaf7GZ
	k4dM9OEOhayDAnZLg6kDq5DATU6nqYFy0JTD40JBA8HQO5/9WuaWQy86eDt0wUmJ+34b
	aRcZm6v8R+hllTOV6f1bD7v2VHaSuQQkyQPRY4pQJBXaxUk4D1NEn4+verLR9MBM3Piz
	Z9cBccRMO+7K7kEPOV5W4eqSlxuknUxTsuFfKYqRlZTG652oebp3HBtgWy1ubLiuSVaV
	yiFw==
X-Gm-Message-State: ABUngveZRtR8znncQkhAz5tBuZICd3xs3r7kKDoby3pNLrN4Fkl1miEuuJ3rTDvIrPbxXXgwjH8zo91gQhjW66JI
X-Received: by 10.176.68.230 with SMTP id n93mr3312561uan.175.1477521484513;
	Wed, 26 Oct 2016 15:38:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 26 Oct 2016 15:37:43 -0700 (PDT)
In-Reply-To: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Oct 2016 23:37:43 +0100
Message-ID: <CAFEAcA_VLx0vtOJqzqdmo8RpvGa7VR6TAb+HtpbL8woTy3kENw@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [PATCH v3] char: cadence: check baud rate generator
 and divider values
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g9ZBM9VQQmcJ

On 26 October 2016 at 22:22, P J P <ppandit@redhat.com> wrote:
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
> ---
>  hw/char/cadence_uart.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> Update: mask R_BRGR and R_BDIV register values with 0xffff and 0xff resp.
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06206.html
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06215.html
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index e3bc52f..5341d81 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -1,5 +1,10 @@
>  /*
>   * Device model for Cadence UART
> + *   -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
> + *
> + * Reference: Xilinx Zynq 7000 reference manual
> + *   - Chapter 19 UART Controller
> + *   - Appendix B for Register details
>   *
>   * Copyright (c) 2010 Xilinx Inc.
>   * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
> @@ -410,6 +415,18 @@ static void uart_write(void *opaque, hwaddr offset,
>              break;
>          }
>          break;
> +    case R_BRGR: /* Baud rate generator */
> +        s->r[offset] = 0x028B; /* default reset value */
> +        if (value >= 0x01) {
> +            s->r[offset] = value & 0xFFFF;
> +        }
> +        break;
> +    case R_BDIV:    /* Baud rate divider */
> +        s->r[offset] = 0x0F;
> +        if (value >= 0x04) {
> +            s->r[offset] = value & 0xFF;
> +        }
> +        break;
>      default:
>          s->r[offset] = value;
>      }

You're relying on the register values never being
invalid to avoid the divide by zero, which means
you need to check them post-migration too.

thanks
-- PMM
