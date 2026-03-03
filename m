Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22688EDEBE0
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 19:00:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxUyS-0002kE-Dl; Tue, 03 Mar 2026 14:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vxUyR-0002k5-H9
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 14:00:03 -0500
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vxUyP-0003OY-Cr
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 14:00:03 -0500
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-12758ce1e8dso2690306c88.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 11:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772564400; cv=none;
 d=google.com; s=arc-20240605;
 b=cSTIBFhFbOQxwKZZ0Kk/2c96t0FzjrzAuW+C4paU6E7N6X0XtD+3Vwvvi7FzrKS5g8
 5cgRhy81ddUfvAR1stypx1BHk4vw9Qr+/8FAMj88FxDFBCq6YvM35nTykij/seHaOB3+
 MFlotl0+f2APLidibYZuuX3G0ax3tw5ttQazBmW0XXt++N3dqelMGAW05SeU1JJ1+KaN
 ZHLcHQel9p8/dRZewIp3IdWwzhZgyEEpwaCTvG3OfSM/IiV25c176Zk4wBY7BIQR8B9Z
 jbS1R4NgUMNfDObu/4YC4PIn9EaZHqipVk/+Xbz8/gWLNjsfw8hdWaptZA34prJBQGNS
 WHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nvwiln5lOyTukgj15yad9ekqwEEhjh8aFmNXkPGIXcs=;
 fh=2/TWVyKVXIy6SfCUJUs7odb7sBcxBIevVWzBYbLqrXE=;
 b=MVMd0F+T4uMl5vFFNJ9Rd+aVa72v1onbH9L5m+9C4j3vc663uS+n4ZDZzdVaQTp0Zv
 xMSLssvtoxPld3TMpi5nyg7AE5Gkpc1eM1EMF3VO2/wFs7l4e+ylExlmLA623crsNhP3
 7ko5QhiEzlGLJHqY7ONMiAu10EVF7fadoCnulYBtvS3UjOPvPmTU2t8EHABI1JErY4TP
 SJk8+v3eBSUdUTpWPF6v+zZqq9JjHQiaC3VxVQ+tTGKTDNnBwMQ/7TDo8AhAaB0sGVBp
 Tvv2cM/GT/mtLeNpox5pYUPHoDq3OiMk/xc+UCiJ3hfNoZU4a6ScBSo90HD5TeFvMOry
 2CEA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772564400; x=1773169200; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nvwiln5lOyTukgj15yad9ekqwEEhjh8aFmNXkPGIXcs=;
 b=JsSuAGUYmLqIQImyuIfXJ7kTVu/Fd5Mj8capxd2osDFKKdYAl4dmrXRfRMXV1flYXe
 p62bIAOyRDmvm2eEZALH2ZCZc9oMztqN+/rNM9Cf0eGTTRFhVF+iIKXJR5zMFdTXwRuS
 i+7jt8LfJag2VRwUS9IHeIr92tKxJKEJtTN8bodTkxxFEkdStbXSfv/jYvoGkBAJhljQ
 5FoTiwuw0QFh3nZUtZcdvt7Yz+lWFqUZJX5a5eqKoOqXQ2VRYfSLw9f5R7Hdt29AK9Tn
 uSoC1CiqC0GrFPWVt3ORL+9ZssG5oVgH+invaB3/TS/ExAYdm8z1E3QVzODOJzAQGdNd
 KPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772564400; x=1773169200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvwiln5lOyTukgj15yad9ekqwEEhjh8aFmNXkPGIXcs=;
 b=aC1iWDH2eGbSjrWJGKg8WnFDR8kRKx3GeekJZwjzUgsDwx//Mhyio3gFUAP7Qkr6Cs
 qrLh8dFx2ECa4f+WCnjxWJJKJj7/9fGycW4CF8422UxQT1uRCcXdpc9k2xMzw4c9C1ia
 WpOLAgr+8TV8ZUoeba6Z3IA5FnN2jG54inbI3rBxoeW10TO29Z7Ac4XFfENOGw3t9DKB
 NbIwyN8sR6wi5Irh0nAIY2kBOI2XqluDY76OHhH0h+Q/LPWluq7xCFe1zEh/LCV4S4m5
 iGpHwNJuG8RgjupNIZ2mVGr8cfM700gZD5u5ouweH9XqpIwMKqXSNzkX03ZC+u2/X1+Y
 iPWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp7MwDq4u4Q8LMc53z/2fMjij5o5vJCdLhP8aA6qldU050C55Xj+sdhqqjupZ5gniiwtGnQcIXMQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyk7LgUX+w2LhPJxCM4z9qlx+GVpgR6Bsk+tK1Yu4jOD7K+Zdgt
 FZcsDgzSM7hGeV7BHuU4ePKQe592R5O9Hc+cXxEMhcLYHKrWtNbVQ7NZCruLUJIQYNIvOSZFrXE
 xCefdg9OwCtTC5LPG7EyO/RKgbfcpuc4=
X-Gm-Gg: ATEYQzyWVF/SjAawAf+40Xxg/2mL8dHlNilUw5jWay+Prv168RSA/mfW0tEM28TBnak
 Wc78KAUVUP5/y/zvtd1LRSCurEETGLfBUt3ruYtUY3Akc17qJEcZjgHoA7KKk9Mmf1vg27Y09LS
 yrCGK3ef2lBeEUSHCb3CVnHRCSjh17k2jnQb8K7EOOCqCBKcApGLUD0X1usUZtLh9yRVhm4tiO9
 W95yAZZAr31f3TTVqb0dWmitgxLnfDR5KTPVTiGaF3Z3IYC2Vv/76oNx4HthaZ0D31uBdLLAvvW
 E09mRP0=
X-Received: by 2002:a05:7300:3b0c:b0:2bd:dd33:7996 with SMTP id
 5a478bee46e88-2bde1d49fb0mr8541854eec.19.1772564399626; Tue, 03 Mar 2026
 10:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20260212104432.4168886-1-kchiu@axiado.com>
 <CAFEAcA_u5B2RdVEaGycCQ6gCx1pQuT8rvGVGZpoKLTK+2s72+w@mail.gmail.com>
 <69691e3b-1605-4a5a-8ad5-0eec56ce3eed@axiado.com>
 <CAJy5ezpcvp0Qy-P9gE46oDtsxZxNO=xMV1k-GC3WF4yY3gARGw@mail.gmail.com>
 <CAFEAcA8mC4TkicLy9bcS8NYMDNcSUjsataGGmkMpViw4wBvmCA@mail.gmail.com>
In-Reply-To: <CAFEAcA8mC4TkicLy9bcS8NYMDNcSUjsataGGmkMpViw4wBvmCA@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 3 Mar 2026 12:59:47 -0600
X-Gm-Features: AaiRm52lD6xxTOQqc8b9w-PVQRhTPGDBftkxBj7k40ujpJ_jy5rW0-qJ9TjrlNM
Message-ID: <CAJy5ezqTAMr=A3uAfmuWLepK66AdLRu4Q8AmFMh4+4q2HtDrkA@mail.gmail.com>
Subject: Re: [PATCH v1] hw/char/cadence_uart: Add BXRS register
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kuan-Jui Chiu <kchiu@axiado.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me
Content-Type: multipart/alternative; boundary="000000000000619da5064c234fd9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-dl1-x1235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000619da5064c234fd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 12:44=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Tue, 3 Mar 2026 at 18:32, Edgar E. Iglesias <edgar.iglesias@gmail.com>
> wrote:
> >
> >
> >
> > On Tue, Mar 3, 2026 at 2:33=E2=80=AFAM Kuan-Jui Chiu <kchiu@axiado.com>=
 wrote:
> >>
> >> Hi
> >>
> >> I was referring this commit of upstream kernel which xilinx added BXRS
> >> register in Cadence UART driver
> >> serial: xuartps: Adds RXBS register support for zynqmp =C2=B7
> >> torvalds/linux@3816b2f
> >> <
> https://github.com/torvalds/linux/commit/3816b2f886d0918d8a8ae593b2db203a=
b905a889
> >
> >>
> >> Peter Maydell =E6=96=BC 2026/2/16 =E4=B8=8B=E5=8D=88 06:53 =E5=AF=AB=
=E9=81=93:
>
> >> > Where is this register documented? The cadence_uart.c file
> >> > references the Zynq 7000 Soc TRM UG585; its URL for that
> >> > is out of date, but looking at the copy on the AMD website,
> >> > there is a table giving the register summary for the UART:
> >> >
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/UART-Controller-UART
> >> > and it lists only registers from offsets 0 to 0x44.
>
> > There's documentation here for zynqmp:
> >
> https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/Rx_FIFO_byt=
e_status-UART-Register
> >
> > I haven't looked to carefully, it may be a register that didn't exist i=
n
> the version of the UART on zynq and was added in the version of the uart =
in
> the zynqmp.
>
> Thanks. On the subject of Xilinx specs, do you have an opinion on
> https://gitlab.com/qemu-project/qemu/-/issues/3297 ?
> Our Xilinx AXI ethernet device model lets software write to
> the PHY registers for the PHY ID, and it's not clear to me
> whether these registers are supposed to be read-only or not.
>
>
Yes, they should be read-only, there's probably more registers and fields
that have the wrong access restrictions as well. The PHY model is super
simple, created just to get guests to not get stuck on boot or fail to use
the PHY...

IIRC, there's been several attempts on list to create a better MDIO/PHY
interface with shared PHY models but never got merged.

Cheers,
Edgar

--000000000000619da5064c234fd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, =
2026 at 12:44=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, 3 Mar 2026 at 18:32, Edgar E. I=
glesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">e=
dgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Mar 3, 2026 at 2:33=E2=80=AFAM Kuan-Jui Chiu &lt;<a href=3D"ma=
ilto:kchiu@axiado.com" target=3D"_blank">kchiu@axiado.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; Hi<br>
&gt;&gt;<br>
&gt;&gt; I was referring this commit of upstream kernel which xilinx added =
BXRS<br>
&gt;&gt; register in Cadence UART driver<br>
&gt;&gt; serial: xuartps: Adds RXBS register support for zynqmp =C2=B7<br>
&gt;&gt; torvalds/linux@3816b2f<br>
&gt;&gt; &lt;<a href=3D"https://github.com/torvalds/linux/commit/3816b2f886=
d0918d8a8ae593b2db203ab905a889" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/torvalds/linux/commit/3816b2f886d0918d8a8ae593b2db203ab905a889=
</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Peter Maydell =E6=96=BC 2026/2/16 =E4=B8=8B=E5=8D=88 06:53 =E5=AF=
=AB=E9=81=93:<br>
<br>
&gt;&gt; &gt; Where is this register documented? The cadence_uart.c file<br=
>
&gt;&gt; &gt; references the Zynq 7000 Soc TRM UG585; its URL for that<br>
&gt;&gt; &gt; is out of date, but looking at the copy on the AMD website,<b=
r>
&gt;&gt; &gt; there is a table giving the register summary for the UART:<br=
>
&gt;&gt; &gt; <a href=3D"https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-T=
RM/UART-Controller-UART" rel=3D"noreferrer" target=3D"_blank">https://docs.=
amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/UART-Controller-UART</a><br>
&gt;&gt; &gt; and it lists only registers from offsets 0 to 0x44.<br>
<br>
&gt; There&#39;s documentation here for zynqmp:<br>
&gt; <a href=3D"https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registe=
rs/Rx_FIFO_byte_status-UART-Register" rel=3D"noreferrer" target=3D"_blank">=
https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/Rx_FIFO_byte_=
status-UART-Register</a><br>
&gt;<br>
&gt; I haven&#39;t looked to carefully, it may be a register that didn&#39;=
t exist in the version of the UART on zynq and was added in the version of =
the uart in the zynqmp.<br>
<br>
Thanks. On the subject of Xilinx specs, do you have an opinion on<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/3297" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/3297=
</a> ?<br>
Our Xilinx AXI ethernet device model lets software write to<br>
the PHY registers for the PHY ID, and it&#39;s not clear to me<br>
whether these registers are supposed to be read-only or not.<br>
<br></blockquote><div><br></div><div>Yes, they should be read-only, there&#=
39;s probably more registers and fields that have the wrong access restrict=
ions as well. The PHY model is super simple, created just to get guests to =
not get stuck on boot or fail to use the PHY...</div><div><br></div><div>II=
RC, there&#39;s been several attempts on list to create a better MDIO/PHY i=
nterface with shared PHY models but never got merged.</div><div><br></div><=
div>Cheers,</div><div>Edgar</div></div></div>

--000000000000619da5064c234fd9--

