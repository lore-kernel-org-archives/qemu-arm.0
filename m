Received: by 10.25.134.130 with SMTP id i124csp1980233lfd;
        Mon, 11 Jan 2016 05:58:53 -0800 (PST)
X-Received: by 10.55.42.10 with SMTP id q10mr7352591qkh.99.1452520724019;
        Mon, 11 Jan 2016 05:58:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r204si87261623qhr.54.2016.01.11.05.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 05:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIczb-0005eh-MV
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 08:58:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aIczY-0005ag-MS
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 08:58:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aIczU-0005ac-LN
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 08:58:40 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aIczT-0005aN-EW
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 08:58:36 -0500
Received: by mail-vk0-x229.google.com with SMTP id n1so69963844vkb.3
	for <qemu-arm@nongnu.org>; Mon, 11 Jan 2016 05:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=3zn7/MqBaUhqKfeycSF3EOjdN0MkD+SeAuX5GphHlyo=;
	b=ctZmU0p4jreGkBaN+qWCo/SpeD0ywwoZ8Pb8jnmhIe92ddpItO0iasUibX04M9+BE9
	KRNM+j4g5pEjjv1LmPG7ANntYtIABMsosFKPCO4rVENYqx+5osE2XFpkP99h7Zvz6/Mh
	wvIQm5+0ghXV0N45bD4hvqj1+ZOTGAf51fTbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=3zn7/MqBaUhqKfeycSF3EOjdN0MkD+SeAuX5GphHlyo=;
	b=N9rN2Jp7v8hyDkX1JJgBPJqFiqeNpSeTAThEXacqt2rCh+QXleBHuUK7ViAffnGBnP
	c6xYj89QUqGPX3chV5sqN0DmabLE3IANlcwFrAsjUf7uhj/dSW3xT0NgIHvm/vrvexpu
	VKQ+1MOvYC3dQa9zHsv3H0oDPQH2ZD/BARr/Nh9qIfj+8o2NnNSZMw1CSDvKZ/RJHZTD
	SvB9sIqAV5gR4IQ1B6lt1O27Add5/sH6/35yhkJeRxn9Ef3fEXp+hybm3SjAHpXYQGTX
	lxZb2q1NgmfiYWQOLAuHEfmo2lCqKdXH6dHouosbZNHPD2tfEM0fHhWVyDhgbMKhc7FI
	RjwQ==
X-Gm-Message-State: ALoCoQl5nQI3VjcR4kJNvLubWzOkgs1Tw1Gj3ff2Kct1OTW4xUGgfpRjuUnu4l/0qBx+rt3wl3VCqXjtIteM4n7ubO513ykvGAw+onNcrd/Z1IxtYFMxtkg=
X-Received: by 10.31.0.136 with SMTP id 130mr81575048vka.139.1452520714926;
	Mon, 11 Jan 2016 05:58:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 11 Jan 2016 05:58:15 -0800 (PST)
In-Reply-To: <861da5c44f261ee3f160607c9d128ce0e9f89e9e.1452277501.git.alistair.francis@xilinx.com>
References: <861da5c44f261ee3f160607c9d128ce0e9f89e9e.1452277501.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2016 13:58:15 +0000
Message-ID: <CAFEAcA-mmYVGqBP9J855Xm20n0XGVMLoWv4Lze61y00EvFBDyw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH v1 1/1] arm_gic: Include the GIC ArchRev in
	the ICPIDR2 register
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
X-TUID: UcTfpfK3MQKU

On 8 January 2016 at 18:57, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> The ARM GIC documentation (page 4-119) describes that bits
> 7 to 4 of the ICPIDR2 register should include the GIC architecture
> version. This patche ORs the version into the existing return value.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>
>  hw/intc/arm_gic.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 13e297d..f47d606 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -688,6 +688,10 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr =
offset, MemTxAttrs attrs)
>      } else /* offset >=3D 0xfe0 */ {
>          if (offset & 3) {
>              res =3D 0;
> +        } else if (offset =3D=3D 0xfe8 && s->revision !=3D REV_11MPCORE =
&&
> +                                      s->revision !=3D REV_NVIC) {
> +            /* ICPIDR2 includes the GICv1 or GICv2 version information *=
/
> +            res =3D gic_id[(offset - 0xfe0) >> 2] | (s->revision << 4);
>          } else {
>              res =3D gic_id[(offset - 0xfe0) >> 2];
>          }

The current implementation of the ID registers seems to be
simply "like the 11MPCore interrupt controller". I think we
should get them right more generally if we're going to fix them:

                       fd0 .. fdc     fe0 .. fec      ff0 ... ffc
11MPCore               reserved       90 13 04 00     0d f0 05 b1
ARM GICv1 (eg A9)      04 00 00 00    90 b3 1b 00     0d f0 05 b1
ARM GICv2 (eg A15)     04 00 00 00    90 b4 2b 00     0d f0 05 b1

Your patch doesn't account for ICPIDR1 also having a field that
changes between GICv1 and GICv2 (for ARM implementations), and
we're missing the fd0..fdc bytes.

I think this is probably simplest modelled with several
gic_id arrays and using the appropriate one for 11MPCore/GICv1/GICv2,
rather than trying to OR extra values into the 11MPCore ID values.

For the NVIC these registers don't exist at all, and the
construction of the memory regions in armv7m_nvic.c ensures
we can't reach this bit of the function, so we don't need
to specially handle it. (Also there's a rewrite of the NVIC
to disentangle it from the GIC which hopefully will land
some time before 2.6.)

thanks
-- PMM
