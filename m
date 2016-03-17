Received: by 10.25.208.211 with SMTP id h202csp447379lfg;
        Thu, 17 Mar 2016 06:37:46 -0700 (PDT)
X-Received: by 10.55.71.66 with SMTP id u63mr14041866qka.67.1458221866156;
        Thu, 17 Mar 2016 06:37:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si7896590qki.19.2016.03.17.06.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 06:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agY7V-0005xa-Mt
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 09:37:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agY7S-0005uH-0v
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 09:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agY7N-0002vy-W2
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 09:37:41 -0400
Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236]:34272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agY7M-0002tp-Mc
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 09:37:37 -0400
Received: by mail-ob0-x236.google.com with SMTP id ts10so83993876obc.1
	for <qemu-arm@nongnu.org>; Thu, 17 Mar 2016 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=tw4cQ5odwCq0K67FcQtEXiK4/xkqixyiQvznZznIGlA=;
	b=SdSpPj1pFcvgfwyDsg4av9mXxE3urSeAUEZSkQCnF4bbExjSIEZN9r15UsIkpvLWTD
	mOc12PW1jyF59tB70nz3hWc7M273+FeY+X6ZW2E1ATuwdjSKVy27x9LMLwBJsnLBvJEk
	eaXQdwd8WbPaJ427ug71d+WB4BgJ2YB+NdvS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=tw4cQ5odwCq0K67FcQtEXiK4/xkqixyiQvznZznIGlA=;
	b=dad0LjqaOrQuvAent/HERWnviHdkvDT3FsAQJIg8SO1Panzyys57i8f+JnIV309pCP
	AZupcjKaPAXuFtjZM6M4rB7FJVpBbnxX+tMUeY2sNwek1axqU0YXe2tUWV80OHnJBl2z
	Ow97OuFy5YvMw1rOfGejNAdGuM++bdJOH4DtzSzyaKUHzoqQoqen3g/xrdw2iuAvszFG
	U1RHhuW3PticHA4cLyBSFPCQvckPpEvK4iNNdyrfue+Ge/UYwoR91S3Chu66tfjGR4V3
	xojNZXOIVp4WbEUiXv9k3eX2L7ysXZbv5TiU0VtkPlWrc2hrYE9rBdOg7kO8GwsamqF3
	t1tQ==
X-Gm-Message-State: AD7BkJLCbPamNhxVR4tI1VrsQY5DHuTFG43FohfNirj/OVR8kCO8FTUZG/7VkB24SfwLKG5Zt/6MEM8sVia2Nzjy
MIME-Version: 1.0
X-Received: by 10.60.133.180 with SMTP id pd20mr2126016oeb.22.1458221855759;
	Thu, 17 Mar 2016 06:37:35 -0700 (PDT)
Received: by 10.157.6.5 with HTTP; Thu, 17 Mar 2016 06:37:35 -0700 (PDT)
Received: by 10.157.6.5 with HTTP; Thu, 17 Mar 2016 06:37:35 -0700 (PDT)
In-Reply-To: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
References: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 07:37:35 -0600
Message-ID: <CAA8zJ3CYn+Pjp8RphPR7+L=CeOZ3nDfosjF6yPZeefSj1utBag@mail.gmail.com>
From: Thomas Hanson <thomas.hanson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=047d7b472532b77afc052e3ebbc7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::236
Cc: qemu-arm@nongnu.org,
	=?UTF-8?Q?Antonio_Huete_Jim=C3=A9nez?= <tuxillo@quantumachine.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm2836: Wire up CPU timer interrupts
	correctly
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
X-TUID: T16zdtF3kVpo

--047d7b472532b77afc052e3ebbc7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mar 17, 2016 4:33 AM, "Peter Maydell" <peter.maydell@linaro.org> wrote:
>
> Wire up the CPU timer interrupts in the right order, with the
> nonsecure physical timer on cntpnsirq, the hyp timer on cnthpirq,
> and the secure physical timer on cntpsirq. (We did get the
> virt timer right, at least.)
>
> Reported-by: Antonio Huete Jim=C3=A9nez <tuxillo@quantumachine.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/bcm2836.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 89a6b35..1cefe41 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -136,9 +136,13 @@ static void bcm2836_realize(DeviceState *dev, Error
**errp)
>
>          /* Connect timers from the CPU to the interrupt controller */
>          qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_PHYS,
> -                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq",
n));
> +                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpnsirq",
n));
>          qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_VIRT,
>                  qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq",
n));
> +        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_HYP,
> +                qdev_get_gpio_in_named(DEVICE(&s->control), "cnthpirq",
n));
> +        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_SEC,
> +                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq",
n));
>      }
>  }
>
> --
> 1.9.1
>
>

What drives the order?

--047d7b472532b77afc052e3ebbc7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 17, 2016 4:33 AM, &quot;Peter Maydell&quot; &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Wire up the CPU timer interrupts in the right order, with the<br>
&gt; nonsecure physical timer on cntpnsirq, the hyp timer on cnthpirq,<br>
&gt; and the secure physical timer on cntpsirq. (We did get the<br>
&gt; virt timer right, at least.)<br>
&gt;<br>
&gt; Reported-by: Antonio Huete Jim=C3=A9nez &lt;<a href=3D"mailto:tuxillo@=
quantumachine.net">tuxillo@quantumachine.net</a>&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0hw/arm/bcm2836.c | 6 +++++-<br>
&gt; =C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c<br>
&gt; index 89a6b35..1cefe41 100644<br>
&gt; --- a/hw/arm/bcm2836.c<br>
&gt; +++ b/hw/arm/bcm2836.c<br>
&gt; @@ -136,9 +136,13 @@ static void bcm2836_realize(DeviceState *dev, Err=
or **errp)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Connect timers from the CPU to th=
e interrupt controller */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out(DEVICE(&amp;s-=
&gt;cpus[n]), GTIMER_PHYS,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio=
_in_named(DEVICE(&amp;s-&gt;control), &quot;cntpsirq&quot;, n));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio=
_in_named(DEVICE(&amp;s-&gt;control), &quot;cntpnsirq&quot;, n));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out(DEVICE(&amp;s-=
&gt;cpus[n]), GTIMER_VIRT,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get=
_gpio_in_named(DEVICE(&amp;s-&gt;control), &quot;cntvirq&quot;, n));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(DEVICE(&amp;s-&gt;c=
pus[n]), GTIMER_HYP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio=
_in_named(DEVICE(&amp;s-&gt;control), &quot;cnthpirq&quot;, n));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(DEVICE(&amp;s-&gt;c=
pus[n]), GTIMER_SEC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio=
_in_named(DEVICE(&amp;s-&gt;control), &quot;cntpsirq&quot;, n));<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
&gt;</p>
<p dir=3D"ltr">What drives the order?</p>

--047d7b472532b77afc052e3ebbc7--
