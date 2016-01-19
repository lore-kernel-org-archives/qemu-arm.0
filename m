Received: by 10.25.159.19 with SMTP id i19csp2363121lfe;
        Tue, 19 Jan 2016 00:49:11 -0800 (PST)
X-Received: by 10.140.86.243 with SMTP id p106mr37007758qgd.1.1453193351752;
        Tue, 19 Jan 2016 00:49:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si36380084qka.117.2016.01.19.00.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 00:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLRyR-0004it-Ab
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 03:49:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLRyO-0004gr-LI
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 03:49:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLRyN-0004aq-JH
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 03:49:08 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLRyN-0004ag-FB
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 03:49:07 -0500
Received: by mail-vk0-x22f.google.com with SMTP id n1so189924822vkb.3
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=AFXa+Magr8y2QQgPBK4BFn0UtTUdTXVWiXyYdb8H5B8=;
	b=N9Iznkgh85YdWtOobGhc2M24xMlij4yzywj4nrHy0e0yxPQMtV+r7fALCRE10P1fDt
	0Pxy2oIzFxjKjck4vLEIJ51DazGWjsbpi7XcoCq2iQbtcUyK4Caii79WaL3BZ+2EJT0R
	p5gNYlMAAsWZ7BaOnhrTnGMig+93egEB8kIKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=AFXa+Magr8y2QQgPBK4BFn0UtTUdTXVWiXyYdb8H5B8=;
	b=UrCRIL7JA4Rer9vxlcEyxUtzGhydwAnqTsCV9tvVa5ceqhW0jLgSh6kZZbbpJtaqAf
	OJ8AsEufbyugihCKZjfxmsUyxiU3bpdzrvH/2dBUwIpBf5qG0lwqGNj7V+dr0XIUqdNa
	V+GItR3ng2/ZHhDx6Eq8/aJFzE9BRvshqMcrG//XdtdKagk+SjTFEg/4UZURRON+vPlJ
	Hw1g322q/QtVE2VKN8oeTt01RVxD4oWSFYuNu2zZfOxQIP0VgT1OjonPWgtv+EJgSx+6
	BSFAfxOYBVgnCID5B5WVNSLFKe4bMfRzvQcCzURPAQC7rI5nElUAghO2dVbWWplmeT+6
	KJaA==
X-Gm-Message-State: ALoCoQkfd8x72lIrvWna2B/3TEHajA+VM/Sebt4VVQSZ+TUmdW5YY1CuG+FxWoS5MzaVXidx1zhSMACZuLvOycE+A0j0Vr/HFturNfR52V1a+Akh60ONX/4=
X-Received: by 10.31.141.2 with SMTP id p2mr19673219vkd.37.1453193346953; Tue,
	19 Jan 2016 00:49:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 00:48:47 -0800 (PST)
In-Reply-To: <e83ff2fc1c0fcdc6c435e53b1f83f1049b2a87a3.1453166915.git.alistair.francis@xilinx.com>
References: <e83ff2fc1c0fcdc6c435e53b1f83f1049b2a87a3.1453166915.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 08:48:47 +0000
Message-ID: <CAFEAcA9QvgNUTvAjBZAu5apxj25RwV7bRFs0g0eUWVfDD1DrtA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH v1 1/1] arm_gic: Update ID registers based on
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
X-TUID: s3Jgoi1XTNml

On 19 January 2016 at 01:33, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update the GIC ID registers (registers above 0xfe0) based on the GIC
> revision instead of using the sames values for all GIC implementations.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>
>  hw/intc/arm_gic.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 13e297d..f6bfa53 100644
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
> @@ -689,7 +697,22 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr =
offset, MemTxAttrs attrs)
>          if (offset & 3) {
>              res =3D 0;
>          } else {
> -            res =3D gic_id[(offset - 0xfe0) >> 2];
> +            switch (s->revision) {
> +            case REV_11MPCORE:
> +                res =3D gic_id_11mpcore[(offset - 0xfe0) >> 2];
> +                break;
> +            case 1:
> +                res =3D gic_id_gicv1[(offset - 0xfe0) >> 2];
> +                break;
> +            case 2:
> +                res =3D gic_id_gicv2[(offset - 0xfe0) >> 2];
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

You've expanded the arrays to include the fd0...fdc values
(which is right) but the logic also needs to change to
make offset =3D=3D 0xfd0..0xfdf go through this code path and
also to use the new indexing into the array.

thanks
-- PMM
