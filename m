Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp962537wrx;
        Thu, 28 Mar 2019 11:47:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/L8qFGVtI1c8gruBPDO8yS8FEQZXkMBBcj8xvNKvSyl72JZhCq+uGv/y4FXGHUNWjJUmI
X-Received: by 2002:a6b:440b:: with SMTP id r11mr30379145ioa.48.1553798843642;
        Thu, 28 Mar 2019 11:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553798843; cv=none;
        d=google.com; s=arc-20160816;
        b=rLNyLpcg72nmTrmjdazofBQe/NwkNZqHa+OC0dUEmY5O9rMbJvfw+zxDA3JKrALBW3
         4h9Y49HSgc4X+McM+4n1LRi7w1gp3ZwLL4qS+OKetMrmEa4UQ9rY3clm80bdeGZMUHWV
         +QIeh5v92XDPE6rIN5bhmbPDFW8/V1GT+w0/elcWTmQDlcGMlEnYEMCHsCslA7Z9sv4g
         0beoiwAhbW2Mh/IIP568YxA8cJ+6OY3xCzCiMxDxC+12FBCiotKfLyu+nI9pOxQFmuWW
         086Ar0STES3lQNfQSU8/kJ/HmLl1J2jqCDVNP0dpVn1KNss/o+PssUZlY85l5rwswN1R
         Ek1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=yz38DlH7plfaY2cg4RsGQC45w3HQxDqM4noCj5BCx9I=;
        b=MGtPIBZvSc8uSQ/QIe42TVys/CaqddQVzN5k4yhUv7j8kGT1AmnF0KOUC7IXKxcNBz
         3m44IUJmqC95FFw+jcmqvZyhco4WMpihst2vgvAzfZI77N7xUkRB0q8d5CW55N06yilA
         ulhCveyCu33RZuve/bLwkVErVZQf87Ln7/NkO+4mzTEYcJdg0tO1VPy4cntWjdaIrT4L
         3KzK/EzuMvQCArTLigOm5a+f3b2cvelG20CWVJH0nRxRdxfHxzlxJqS5EXaEjG2CZTDu
         Hbdm9DiI1Bdt1/apUd6ojqUuYdR8/IqbsaP53Ee/Usln/BN3mdApMi2bMrdQD7Kxk0ZG
         g/lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si11448043ioq.62.2019.03.28.11.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 11:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9a3e-0007lN-Tl
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 14:47:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9a3O-0007jn-NI
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 14:47:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9a3N-0003kM-Fj
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 14:47:06 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:35034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9a3N-0003jf-6N; Thu, 28 Mar 2019 14:47:05 -0400
Received: by mail-yb1-f193.google.com with SMTP id x79so488896ybg.2;
	Thu, 28 Mar 2019 11:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yz38DlH7plfaY2cg4RsGQC45w3HQxDqM4noCj5BCx9I=;
	b=Djh6dE1B5Vo0isofgFGgqY1mXZDX9a6tOWfMKmmSshlGrnXtJwI4rf0PP2lg2s4aJj
	ALtYDtci+qxOGrpZaHiCkEnOiuEsZxz50pNvRrKsLg/1pZbmnGQ6zUFPlWjRWMoB+feb
	qc+nj4eMhf+eNPMUZi8ZaXiKsvTavljzUxqWaQ1PVJ9Pb+oXoogKSWofRBnBwxm7R+Sb
	1uZ9LFeY3H594aOouehw7Zf3AoLEbw05j1ENy/HFB9ft21V1BN/MwKtaOXb1bVK8cucm
	nRQ2ZdMZBmy/KDpRNdrdN51S8fJKDroNMjakIFp2ktHwEQEqJ87YR9Hu0Y7DwX9lrO7j
	DqFQ==
X-Gm-Message-State: APjAAAUCyRseJUkQsoyT/iItAk8DPXnnmF1uIumjm8T1972AeY39/EtX
	ZjOgY+mHgOL5hJxGvalciyjMU87STnv13A4FRAA=
X-Received: by 2002:a25:49c4:: with SMTP id
	w187mr12857115yba.457.1553798824557; 
	Thu, 28 Mar 2019 11:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152944.3199-1-peter.maydell@linaro.org>
In-Reply-To: <20190328152944.3199-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 28 Mar 2019 19:46:51 +0100
Message-ID: <CAAdtpL5z9TN6WWCsvE0ROJ9n1adu3+SMJVjwcz36eTGskNGgDw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fd817005852bfa21"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.193
Subject: Re: [Qemu-arm] [PATCH v2 for-4.1] hw/arm/raspi: Diagnose requests
 for too much RAM
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3u3C2l+tPEM3

--000000000000fd817005852bfa21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 mars 2019 16:29, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> The Raspberry Pi boards have a physical memory map which does
> not allow for more than 1GB of RAM. Currently if the user tries
> to ask for more then we fail in a confusing way:
>
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
> qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
> Aborted (core dumped)
>
> Catch this earlier and diagnose it with a more friendly message:
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> qemu-system-aarch64: Requested ram size is too large for this machine:
> maximum is 1GB
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2: use '>', not '>=3D'...
>

Argh I missed this...

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


>  hw/arm/raspi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66899c28dc1..fe2bb511b98 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -12,6 +12,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int
> version)
>      BusState *bus;
>      DeviceState *carddev;
>
> +    if (machine->ram_size > 1 * GiB) {
> +        error_report("Requested ram size is too large for this machine: =
"
> +                     "maximum is 1GB");
> +        exit(1);
> +    }
> +
>      object_initialize(&s->soc, sizeof(s->soc),
>                        version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> --
> 2.20.1
>
>

--000000000000fd817005852bfa21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le j=
eu. 28 mars 2019 16:29, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">The Raspberry Pi boards have a physical memory=
 map which does<br>
not allow for more than 1GB of RAM. Currently if the user tries<br>
to ask for more then we fail in a confusing way:<br>
<br>
$ qemu-system-aarch64 --machine raspi3 -m 8G<br>
Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:<br>
qemu-system-aarch64: Parameter &#39;vcram-base&#39; expects uint32_t<br>
Aborted (core dumped)<br>
<br>
Catch this earlier and diagnose it with a more friendly message:<br>
$ qemu-system-aarch64 --machine raspi3 -m 8G<br>
qemu-system-aarch64: Requested ram size is too large for this machine: maxi=
mum is 1GB<br>
<br>
Fixes: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1794187" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1=
794187</a><br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
---<br>
Changes v1-&gt;v2: use &#39;&gt;&#39;, not &#39;&gt;=3D&#39;...<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Argh I misse=
d this...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@ams=
at.org</a>&gt;<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0hw/arm/raspi.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c<br>
index 66899c28dc1..fe2bb511b98 100644<br>
--- a/hw/arm/raspi.c<br>
+++ b/hw/arm/raspi.c<br>
@@ -12,6 +12,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
@@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int vers=
ion)<br>
=C2=A0 =C2=A0 =C2=A0BusState *bus;<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *carddev;<br>
<br>
+=C2=A0 =C2=A0 if (machine-&gt;ram_size &gt; 1 * GiB) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Requested ram size is too l=
arge for this machine: &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;maximum is 1GB&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0object_initialize(&amp;s-&gt;soc, sizeof(s-&gt;soc),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);<br>
=C2=A0 =C2=A0 =C2=A0object_property_add_child(OBJECT(machine), &quot;soc&qu=
ot;, OBJECT(&amp;s-&gt;soc),<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div></div>

--000000000000fd817005852bfa21--
