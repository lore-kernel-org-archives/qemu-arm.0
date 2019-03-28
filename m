Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp422383wrx;
        Thu, 28 Mar 2019 03:03:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjnG95qdFmnYDDkMZBNguBouwe/kpPds8HKw1XfMskkQi/hXjdKmuZuxIFiZhSUpesFIlE
X-Received: by 2002:a24:1952:: with SMTP id b79mr7209838itb.91.1553767436216;
        Thu, 28 Mar 2019 03:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553767436; cv=none;
        d=google.com; s=arc-20160816;
        b=vInutQ1Il3Bde+bEevPRH63iYs9tnzcnGuTlwviftwAQO1NZQOqMOPsu9QCHBR0GZy
         xz/6/JN0RliZsEUx3BqD1MFcy5UncwkcCDZAr2JypEbxz0w05T8KtlAb6NOzsrSEUkfV
         OOmqJI2L8bDoHIH+jjtG8SWGtEWvMd+88J27sYeG1NWo+pZItifFrvPuPs/qRa3mkm9o
         lKBM4X8BkKA3lrzxN3Td3/lC+a8Iokok51Kk8o4zY4Pq3aR5z6bumSWxW+oWWT1iPYy9
         JOHLR7KSodY+xco0rm6ctenJvbnnzpVB1A3VIkgFYQvXfvfD6JC1YE8o8VEx8QDSLUI2
         ooIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=HonnTlWMw6tGPzAbllzbc3HQTXOYp+EtUr8tdxBduew=;
        b=BiYQduNJEsUY/jKmAPssuz92qjaq8WP4bKROT+sRJg4GEFINb2gF6Ou6FBEhAHJgKs
         HbrRlyBrdIHk57Koe+haEkM+K0sAJhAiV8TNNBycCTnjmRof8+UsSNH3itdxOyEyYAJe
         9kzl9jbmOWpDuAjSOD+Pf/QanlW2flp093m0Xgv8JHdrlloStAnxhItWt4ZTR2DKx4j9
         QX+xX2Lw4T4cVkpKZuKvBzyFxiTmlMzGno8FiK43snpA2N9eJeVLSONvur0+GoKoJM8w
         kLHYRsh5AQSjSw1f67kyYErGyPZ1RzT1F5JPaRkBfijH94zqAMMyo5NdTKecitVDTDbN
         T6eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si7290933ioh.158.2019.03.28.03.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 03:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9Rt5-0000E3-DE
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 06:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9Rse-0008Ta-Ar
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 06:03:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9Rpw-0002rl-TE
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 06:00:46 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:38294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9Rpw-0002rU-Kl; Thu, 28 Mar 2019 06:00:40 -0400
Received: by mail-yw1-f67.google.com with SMTP id m207so5614731ywd.5;
	Thu, 28 Mar 2019 03:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HonnTlWMw6tGPzAbllzbc3HQTXOYp+EtUr8tdxBduew=;
	b=aQH5qfNrVV2kyza0R7QorWEE29jQKVtgMbTaV6pXli9gRLIk6sFU7C5ByS2eio/Mhe
	eIDPK2YlaiuIvmQ3qYnploy4VQxvDALaz5UO7TiUGVqB14ARG9OEe+n0d1jx90m2Necm
	rguLZP/ip71GjomxRKpZl2dr42qcX9ThbMT5h/C2dLX2h8/Lc1hkU2fTA3RY1EZ+KZ2g
	tPuVf/RQLyAjRt/Kec8QMmFcNe7ibXPCgA6cn4LNKK0QjrGOeQmWktorTODjViXrast4
	mbhO/wknO0reerqQEEppMSpE+qW09OwhmVGIjv2KUJsUPaobAYYeZWH1+Dx/Q8Vk/fua
	qyKA==
X-Gm-Message-State: APjAAAXG35Aqf1yk8MJ+ZoxTc0LytHVuRHBK8XkD983cuIGtW5Cv3/cr
	F72MiEErh05Qt1zGw+krKiUk2mvGnyxs5ZcF0c8=
X-Received: by 2002:a25:aac2:: with SMTP id t60mr2735015ybi.127.1553767239687; 
	Thu, 28 Mar 2019 03:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190328095736.4480-1-peter.maydell@linaro.org>
In-Reply-To: <20190328095736.4480-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 28 Mar 2019 11:00:26 +0100
Message-ID: <CAAdtpL6m3KjpLmBfwLeOPYwjGJtr9ZHkWpu+HJKf6u4xZU=sEg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000062a5b4058524a0bb"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.67
Subject: Re: [Qemu-arm] [PATCH for-4.0] hw/arm/raspi: Diagnose requests for
 too much RAM
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
	Andrew.Baumann@microsoft.com, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hphfdHxXGM4L

--00000000000062a5b4058524a0bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 mars 2019 10:57, Peter Maydell <peter.maydell@linaro.org> a
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
>  hw/arm/raspi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66899c28dc1..c7a18a319bc 100644
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
> +    if (machine->ram_size >=3D 1 * GiB) {
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

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--00000000000062a5b4058524a0bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le j=
eu. 28 mars 2019 10:57, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
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
=C2=A0hw/arm/raspi.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c<br>
index 66899c28dc1..c7a18a319bc 100644<br>
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
+=C2=A0 =C2=A0 if (machine-&gt;ram_size &gt;=3D 1 * GiB) {<br>
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
2.20.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@=
amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000062a5b4058524a0bb--
