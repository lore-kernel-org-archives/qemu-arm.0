Received: by 10.25.21.96 with SMTP id l93csp1383705lfi;
        Mon, 4 Jul 2016 00:12:16 -0700 (PDT)
X-Received: by 10.55.18.86 with SMTP id c83mr14825160qkh.187.1467616336045;
        Mon, 04 Jul 2016 00:12:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s27si1249131qks.234.2016.07.04.00.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 00:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJy3D-0000rN-El
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 03:12:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJy39-0000r4-Jr
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 03:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJy38-0007vq-HD
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 03:12:11 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bJy38-0007vm-AO; Mon, 04 Jul 2016 03:12:10 -0400
Received: by mail-vk0-x22c.google.com with SMTP id i63so51348086vkb.2;
	Mon, 04 Jul 2016 00:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k+yDy9uvPcrUI6T4C7VpuTfh+zB4+KBwkeoFZys8S5Q=;
	b=gw7baLnO2peM+GpKqNrdRvhQFxbidExd2cwr/lg6bfRdktDQkDTlWoR4Sms7qgrqYV
	qWOY81LyyqqP62ZtDZ3PFquqC4f8t1qBjPMc3hFRMCu53DL2IoTyYnjrjIqq2Lvfkof0
	khTKoHE769MdipINkfcvMJY3QJejEEqMwoIcsPe+7fyRIV+zmjQxinxzABeAchC0KB/1
	NanA4ANr3o5qRcc5CbNGtIV6AKLUnA5Jk/Bl963jYQSzJrj4oXEOlGMPvmR36Kg+gCNw
	290tstxzekoK5smAIQi3d3EO9SsJaFcywopR3fbNXN11cXB7Xs3yQw32Ietzi7ex4tJT
	ifSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k+yDy9uvPcrUI6T4C7VpuTfh+zB4+KBwkeoFZys8S5Q=;
	b=DwbmmHumZRyc6yv9fLSEk7PJc8NdW46i0aE3Ueh3KZsyQSFU4w6yxmx8r+6A0e3JRp
	zcp0hrXaLzf3AtRvO0IeZyuIQ/0+0p80GoS0fgzRyLzSZI0DOiXbIQxyPN9YJCrGgYfX
	IMGC3wOBSCtc/bfouiozckYbKzu80pGbEcJbGRz/j8nH5OCDV9lQLXj9y4u+K5OeP0Yf
	XcJm1fZOB8OBSGjiDYbBn1Z6oMRb2E3f1Ei1xy0uRmyZZR7N/kpXBDkPUDTMmV321UFc
	h19ZufV6pGIZzumGQLM8/p+TcDuNAfKm33ib73dmKEonqgUYKh+2vRmy29+J7fAx+HtQ
	1axA==
X-Gm-Message-State: ALyK8tK2GfEZpg9SV6TO/lgUCHqF4eV+R+Wo2mTlwbXas53xOc4jGYcHtRmOG375wEi7oudaGg9LFit49z3qGQ==
X-Received: by 10.31.15.20 with SMTP id 20mr4631135vkp.82.1467616329784; Mon,
	04 Jul 2016 00:12:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.56.87 with HTTP; Mon, 4 Jul 2016 00:12:09 -0700 (PDT)
In-Reply-To: <f82c7ccd-b706-c2df-8593-3d64adf65192@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-7-git-send-email-clg@kaod.org>
	<77433c2c-364a-a329-dd7b-1b80ea0f6c63@kaod.org>
	<5777F327.7050606@gmail.com>
	<f82c7ccd-b706-c2df-8593-3d64adf65192@kaod.org>
From: =?UTF-8?Q?Marcin_Krzemi=C5=84ski?= <mar.krzeminski@gmail.com>
Date: Mon, 4 Jul 2016 09:12:09 +0200
Message-ID: <CABc_YGA39dc6Cz=eayo9CHzOooNDPdU6bfmCc=+Nqz8jSW9ofw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary=001a1143546400e10d0536ca0ea7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 6/9] ast2400: add SMC
 controllers (FMC and SPI)
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	armbru@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ygFh0WcxI4Dc

--001a1143546400e10d0536ca0ea7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016-07-04 8:58 GMT+02:00 C=C3=A9dric Le Goater <clg@kaod.org>:

> Hello Marcin,
>
> On 07/02/2016 07:00 PM, mar.krzeminski wrote:
> >>
> >> +
> >> +/* CE Control Register */
> >> +#define R_CE_CTRL            (0x04 / 4)
> >> +#define   CTRL_EXTENDED4       4  /* 32 bit addressing for SPI */
> >> +#define   CTRL_EXTENDED3       3  /* 32 bit addressing for SPI */
> >> +#define   CTRL_EXTENDED2       2  /* 32 bit addressing for SPI */
> >> +#define   CTRL_EXTENDED1       1  /* 32 bit addressing for SPI */
> >> +#define   CTRL_EXTENDED0       0  /* 32 bit addressing for SPI */
> > Hi
> >
> > Above comments does not say anything.
> >
>
> I suppose you mean that the names are confusing ?
>
> The default setting for CE0 and CE1 is done with the hardware strapping
> SCU70 register.
>
> Yes, is hard to say what does it mean and what it does (at least for me).
This is a minor.

Thanks,
Marcin

Thanks,
>
> C.
>
>

--001a1143546400e10d0536ca0ea7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2016-07-04 8:58 GMT+02:00 C=C3=A9dric Le Goater <span dir=3D"ltr">&lt;<=
a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Hello Marcin,<br>
<span class=3D""><br>
On 07/02/2016 07:00 PM, mar.krzeminski wrote:<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +/* CE Control Register */<br>
&gt;&gt; +#define R_CE_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x04 =
/ 4)<br>
&gt;&gt; +#define=C2=A0 =C2=A0CTRL_EXTENDED4=C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=
=A0 /* 32 bit addressing for SPI */<br>
&gt;&gt; +#define=C2=A0 =C2=A0CTRL_EXTENDED3=C2=A0 =C2=A0 =C2=A0 =C2=A03=C2=
=A0 /* 32 bit addressing for SPI */<br>
&gt;&gt; +#define=C2=A0 =C2=A0CTRL_EXTENDED2=C2=A0 =C2=A0 =C2=A0 =C2=A02=C2=
=A0 /* 32 bit addressing for SPI */<br>
&gt;&gt; +#define=C2=A0 =C2=A0CTRL_EXTENDED1=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=
=A0 /* 32 bit addressing for SPI */<br>
&gt;&gt; +#define=C2=A0 =C2=A0CTRL_EXTENDED0=C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=
=A0 /* 32 bit addressing for SPI */<br>
&gt; Hi<br>
&gt;<br>
&gt; Above comments does not say anything.<br>
&gt;<br>
<br>
</span>I suppose you mean that the names are confusing ?<br>
<br>
The default setting for CE0 and CE1 is done with the hardware strapping<br>
SCU70 register.<br>
<br></blockquote><div>Yes, is hard to say what does it mean and what it doe=
s (at least for me). This is a minor.</div><div><br></div><div>Thanks,</div=
><div>Marcin=C2=A0<br></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
<br>
C.<br>
<br>
</blockquote></div><br></div></div>

--001a1143546400e10d0536ca0ea7--
