Received: by 10.80.166.35 with SMTP id d32csp292001edc;
        Wed, 26 Oct 2016 14:58:04 -0700 (PDT)
X-Received: by 10.55.15.152 with SMTP id 24mr3572406qkp.45.1477519084700;
        Wed, 26 Oct 2016 14:58:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v125si2405856qkc.279.2016.10.26.14.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 14:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzWCy-0007hb-4r
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 17:58:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzW1H-0007Wv-Gc
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 17:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzW1G-00042c-3V
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 17:45:59 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bzW1F-00042N-O3; Wed, 26 Oct 2016 17:45:57 -0400
Received: by mail-oi0-x242.google.com with SMTP id p136so1233385oic.1;
	Wed, 26 Oct 2016 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Ayjl+mcFqNWvvolcPHijEe/ubgWphK827M3pcVJAjIk=;
	b=Yu2qsC32b6cQD6ouHJ001HatnM0y+6OMvbhhbfk3dckVtArztWlqROBu6RUMTkKooi
	w2LiZPlxyNo9yRi8QGv9x8Z8uJAHrVW/Sd7Y+/Z+Ask4QSQtZiFHRXG1qm/gbzqXO0+Y
	e12BK1iM/vudvTV6MIAks/sRQ+jCg01IgMZp/oVoz34LYV3Ai/Zmtpk/NHampNYXG3ht
	AJYLQl6Hhd7yQAfDnsa60xDi2t/ECPcCZM/hT1ab0A6yiV+t+3YRhqwNfjnd1JX5EY+R
	Ad02knUWRZbbDmOPHqgbvfewojUQ2y9hrBA2egeXoaAC/Yb04lLcNUCKQQ5XPrXCrq/6
	m0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Ayjl+mcFqNWvvolcPHijEe/ubgWphK827M3pcVJAjIk=;
	b=gK4oyFZxcGylSsaVqlDfHIAl0VGZTx+5yBm6FqWFIYAV8GiTpzdi+4PuDdg0yCHzdQ
	qB2Cz+9v7A7wV0uFkgH4/0cKQl/TyhSggaVX3geUH4GIuI640DgYAHATjPLqSTEH/n1T
	HQ9Swsu7Sb+BUyWUH1Ag9FULbZR6w2UJ3HGfFe9OMGQZ7C1vhzcSmFHPb5h+QZ7FXh8t
	lAPKamtQ5HGXIX/Xt4spRaUUpS4EdZCVK5RK+wup/4i9Wbyt7lN08m6dC+JaXhbcq+r4
	EGgxqU/MTXwU5H/HxgqRc1V1oxzv8wu6LusY6UFr5ntM8NeRuxjray02OE5p99d0gpQu
	vdgw==
X-Gm-Message-State: ABUngverO+s4bz8262TwEwpsjaBwVO8PbzDUxn+exgXytpQ7MUsXQwcnLssifS8Hrx90RDnAiALJhcjWpeMJKA==
X-Received: by 10.157.36.232 with SMTP id z95mr3341311ota.124.1477518356864;
	Wed, 26 Oct 2016 14:45:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Wed, 26 Oct 2016 14:45:26 -0700 (PDT)
In-Reply-To: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 26 Oct 2016 14:45:26 -0700
X-Google-Sender-Auth: BbsV4R74oLW4N0_vdCMH8MM30To
Message-ID: <CAKmqyKOuX7cZuYa7xCc69b322S3XpM_0VQMc0DQ4b=Gvq3UM+w@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v3] char: cadence: check baud rate
 generator and divider values
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LKDvP+vVMAFy

On Wed, Oct 26, 2016 at 2:22 PM, P J P <ppandit@redhat.com> wrote:
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

Nit pick, I would put the URL under the title below.

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

Why do we still have the reset value here, I thought we were just
ignoring the invalid writes? You don't need to reset it.

Thanks,

Alistair

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
> --
> 2.7.4
>
>
