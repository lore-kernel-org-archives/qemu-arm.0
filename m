Received: by 10.25.159.19 with SMTP id i19csp3386229lfe;
        Wed, 20 Jan 2016 14:48:40 -0800 (PST)
X-Received: by 10.140.235.150 with SMTP id g144mr52244438qhc.11.1453330119995;
        Wed, 20 Jan 2016 14:48:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 107si46173436qgx.12.2016.01.20.14.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 14:48:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM1YN-00086v-Il
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 17:48:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aM1YL-00086l-KE
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aM1YK-0001In-Lj
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:48:37 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aM1YK-0001Ia-7C
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:48:36 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e185so13564908vkb.1
	for <qemu-arm@nongnu.org>; Wed, 20 Jan 2016 14:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=5WzdidkJo9WJezA/uqHprEKzenEl81q1WHmJ06GyAl0=;
	b=B0wIFzWOu+/9oSoxgarevx95endeRVYiq84V0v9d4/pbar3Di+KKT3oo3E44hSKpHe
	NE3SjJhql9PFyNDcIhRknabsO9UcaP0HzSpjTXxLwu+d0YUuST7DsAxMNR9M/ag7bfPA
	5YhYPsKCel6rqC3+cQUFgtd0ekNadectRoDQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=5WzdidkJo9WJezA/uqHprEKzenEl81q1WHmJ06GyAl0=;
	b=Jsjmn3DHuWQTP/FEwgJoIqF/34v0712CWbqaJIwiWNehPLRXXUj9U4flURClXHfor0
	WUY5DK9uBqCvvfAVQmh9uPL94V99kvHfiGLQRCDFdQbpBZqOOqtAgq+DfAlRzWpeRNbX
	HT9MHMOHtfgBtWMljiy5A9/ZAccLZCh7Viy+geLkym9nQAQOxweAZMPSQ3UIoe4Gc2Og
	p8zpALqsCYvy5cCqDbIKfPDQDKJhadGAhC+8HWNXunou2hLf7r62R0PGFuHiBEEksR+g
	ShD7aQV+zRpTKmQLHlc7Uf3dfQiVOOeMtnoc571HjiBRUyO9djCyp+M02vsrnWltCCxA
	dftQ==
X-Gm-Message-State: ALoCoQkRXwnORh+skcZM7vDxhpvaxbuZ61uzPJC8Fy9WhYUYOqaqzg3+epwQeKuve6BwB4phgxODzUzhd0U6HP49ioXYuUYmzyYwDWTCOSSS5r0FKYGBELw=
X-Received: by 10.31.194.21 with SMTP id s21mr26767067vkf.92.1453330115503;
	Wed, 20 Jan 2016 14:48:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 20 Jan 2016 14:48:12 -0800 (PST)
In-Reply-To: <118acc7c92ab1eac93ad2dcb25944569f4c6ae59.1453328768.git.alistair.francis@xilinx.com>
References: <118acc7c92ab1eac93ad2dcb25944569f4c6ae59.1453328768.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2016 22:48:12 +0000
Message-ID: <CAFEAcA-h=hmiZ+z2vFukaAGqKBX6qVYK4nkFDB62AjkmCgLbAQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/1] arm_gic: Update ID registers based on
	revision
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
X-TUID: e4D78i1J/wpZ

On 20 January 2016 at 22:42, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update the GIC ID registers (registers above 0xfe0) based on the GIC
> revision instead of using the sames values for all GIC implementations.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> V2:
>  - Update array indexing to match new values
>  - Check the maximum value of offset as well
>
>  hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 13e297d..8eb3a2d 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -31,8 +31,16 @@ do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__)=
; } while (0)
>  #define DPRINTF(fmt, ...) do {} while(0)
>  #endif
>
> -static const uint8_t gic_id[] =3D {
> -    0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
> +static const uint8_t gic_id_11mpcore[] =3D {
> +    0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
> +};
> +
> +static const uint8_t gic_id_gicv1[] =3D {
> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb3, 0x1b, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
> +};
> +
> +static const uint8_t gic_id_gicv2[] =3D {
> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
>  };
>
>  static inline int gic_get_current_cpu(GICState *s)
> @@ -683,13 +691,30 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
>          }
>
>          res =3D s->sgi_pending[irq][cpu];
> -    } else if (offset < 0xfe0) {
> +    } else if (offset < 0xfd0) {
>          goto bad_reg;
> -    } else /* offset >=3D 0xfe0 */ {
> +    } else /* offset >=3D 0xfd0 */ {
>          if (offset & 3) {
>              res =3D 0;
> +        } else if (offset > 0xfdf) {
> +            goto bad_reg;

Where did this condition come from? It will mean all
the ID regs fe0 and above end up treated as bad registers
rather than taking the code below to return the ID value.

>          } else {
> -            res =3D gic_id[(offset - 0xfe0) >> 2];
> +            switch (s->revision) {
> +            case REV_11MPCORE:
> +                res =3D gic_id_11mpcore[(offset - 0xfd0) >> 2];
> +                break;
> +            case 1:
> +                res =3D gic_id_gicv1[(offset - 0xfd0) >> 2];
> +                break;
> +            case 2:
> +                res =3D gic_id_gicv2[(offset - 0xfd0) >> 2];
> +                break;
> +            case REV_NVIC:
> +                /* Shouldn't be able to get here */
> +                abort();
> +            default:
> +                res =3D 0;
> +            }
>          }
>      }
>      return res;
> --
> 2.5.0
>

thanks
-- PMM
