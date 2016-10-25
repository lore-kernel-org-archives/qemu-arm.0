Received: by 10.80.166.35 with SMTP id d32csp3310966edc;
        Tue, 25 Oct 2016 10:23:27 -0700 (PDT)
X-Received: by 10.31.51.70 with SMTP id z67mr10548938vkz.172.1477416207040;
        Tue, 25 Oct 2016 10:23:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y30si3601162uay.147.2016.10.25.10.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 10:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz5Re-0006m1-HP
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 13:23:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bz5R6-0006lq-8W
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 13:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bz5R5-0006GY-6q
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 13:22:52 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bz5R5-0006GM-2L; Tue, 25 Oct 2016 13:22:51 -0400
Received: by mail-oi0-x241.google.com with SMTP id e12so8278918oib.3;
	Tue, 25 Oct 2016 10:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=18lAv+C6Y4hFG+7FOXTtT+U0+X7MWrYxwIWIN3jNnww=;
	b=uiWf9blMku/I+GrSDJHJh4d4EaN1c1OZua1tOFASDU0mk7af9OdgglogyUVuDe4hz4
	kQpQ/m8L9lx5R+f4zHjgavQiQLys1ef2h+k3KnbCpQVPxki75QcDwR9z/R85/fDbSng/
	st/pMY03jrpjkXy5SwQUD8B74s1ADjhHHe8bWi3G4WvNbLt16AME71Nv9bBegdqhulQr
	s7vmuBCjT2VjU0DTk9nxpIttSajP20ncEkUhqoN+eZXFNid39Ep3jmCGAnwuERj9/JRs
	I6QSQgWOgMj3JnF5hFe8ki9NeBmQbwE6ufp/gzG8oB6KA3lTQuC9sRvl/yMMKTEfEmMg
	lbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=18lAv+C6Y4hFG+7FOXTtT+U0+X7MWrYxwIWIN3jNnww=;
	b=Fr8HXvRXvhLmZowCVD+Ak/nVP1e9x9PqV9fCGZpRQo0ZqK+RsJlDXlUQvf4tGlx6d8
	2AmXXxtJ3aoEve9JGdq8Nxcaa39nu1qzy3rHNfGg6euEnnN/iBa9WyYT36mDMqZ123oz
	H/BfPz75CtyG9O0iUnQpKyx+RLtfDRd5iTmMQ0o3+Puhtq179bwk7WKxPtosJS6e9byh
	jAumMLuRp/cK0CLGDiCFPT/Klf8TqnMsX4MS4Xx4hizwJNOIrMcd5i76eGFS7tPCWVx+
	TE7Hbh0vOHVHpnfHE+jKguidszzDLslOI9KxiW7jPqR/OyPgYC9JjOFsdRBOuFq501+w
	JMrw==
X-Gm-Message-State: ABUngvcqZw9T41yB4izAhp/rcbjZgRS0LVHzGRmHykPudRk/ZFzh67EgrGyqldqca/PpIwYyvv/KfKT7wzZijg==
X-Received: by 10.157.32.3 with SMTP id n3mr5890739ota.75.1477416167721; Tue,
	25 Oct 2016 10:22:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Tue, 25 Oct 2016 10:22:17 -0700 (PDT)
In-Reply-To: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 25 Oct 2016 10:22:17 -0700
X-Google-Sender-Auth: CC28fOLtUiDPNNjhQkJdf0kRun0
Message-ID: <CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v2] char: cadence: check baud rate
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
X-TUID: ueUHdoLvIPH5

On Mon, Oct 24, 2016 at 6:22 AM, P J P <ppandit@redhat.com> wrote:
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
>  hw/char/cadence_uart.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> Update: set register values as per the specification
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg04931.html
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index e3bc52f..c176446 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -1,5 +1,6 @@
>  /*
>   * Device model for Cadence UART
> + *  -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf

Can you say what page/section the UART spec is in the Xilinx TRM?

I think it might also be worth noting that the datasheet is a Xilinx
datasheet that covers the Cadence UART. Others might be using the IP
as well and might get confused why you are referring to a Xilinx
datasheet.

>   *
>   * Copyright (c) 2010 Xilinx Inc.
>   * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
> @@ -410,6 +411,18 @@ static void uart_write(void *opaque, hwaddr offset,
>              break;
>          }
>          break;
> +    case R_BRGR: /* Baud rate generator */
> +        s->r[offset] = 0x028B; /* default reset value */

Is this the correct behavior, or should the write just be ignored?
pg.587 of the TRM doesn't really make this clear, did you find this
somewhere else?

> +        if (value >= 0x01 && value <= 0xFFFF) {
> +            s->r[offset] = value;
> +        }
> +        break;
> +    case R_BDIV:    /* Baud rate divider */
> +        s->r[offset] = 0x0F;

Same here.

Thanks,

Alistair

> +        if (value >= 0x04 && value <= 0xFF) {
> +            s->r[offset] = value;
> +        }
> +        break;
>      default:
>          s->r[offset] = value;
>      }
> --
> 2.7.4
>
>
