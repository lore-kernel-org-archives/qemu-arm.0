Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3861028wrx;
        Mon, 25 Mar 2019 06:29:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyY5PQ5j8JiHe1Ha0TSMEwp9JQUXlw9SABdp3plswwE+zZLkZatoM/kQuGBPcA75oD3TzK
X-Received: by 2002:a25:4e89:: with SMTP id c131mr20366898ybb.430.1553520546514;
        Mon, 25 Mar 2019 06:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553520546; cv=none;
        d=google.com; s=arc-20160816;
        b=hb24zvgLtPvQQBVJSaJxb1lRo3G/7Tsq7JL9gp6KrBFWP68HkGX2BUBhG4pMiUs7EW
         1B2rFs+mzbwEGfJjRXGzwkLhbzZDv+grq+TCdEMNQDnmp9DGFvOwJeoJ/tqYBWS9MiF6
         5ixtk1FlW1ID5EB/ui2bHJDhGH8KzHzS0+VErB08nGvmKptayC4mzQmzH5/Yit+qWxLA
         PXCB+PK/CiNqy9ib/Goitl/o7ybGdC8mTHqBWmntxZkk1vfKfW2iUddBs6jdBrPtJmbd
         aRi7bZQtDJz/b9w3NKtKGuOGWSngw+eWGc4OdDtZp+JlxoTyLu7zUWJkeYNlYaspwsKb
         W9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=dneYWO7Cav1JnBm/4BLe2j2KMeWtgJD4yqE4IbiVfBY=;
        b=FTrKNXfo+pq+ZGGa6cK3Ex4jP18FPcTF4rUjdu3I16+rDh9k4ePc+2hAW91FzRGJFU
         tgmBab6wgxJaFVWYA4EJ/Ckfx3iog0CrzEVCB0awu3DO/goQuqXcX8WLlzLZL0vz2UnI
         YWqJleJlbqWJ9NLvxoe8rZ2xAt06g3kUH6q0wN5K+2k2W9QkNK5/bHdiYe4IdnBDO2og
         a2oo7uWeOCsxkX8SRwW7bmmTAqKIjQy18rDWhDZIAuPOirkYl0N7xE4kIphsAgTlB3Vo
         y07DNIiEfhf4QVFfkCIeZf+lxh+zI5V+Dew2VB7PNwv8St9X5T7Kkg566mOBxTexw70R
         Xa4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si9373999ybl.10.2019.03.25.06.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 06:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8Pez-00025z-T8
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 09:29:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8Pei-00023a-9D
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 09:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8Peh-0002mT-5n
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 09:28:48 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:33841)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8Pee-0002kG-Fu; Mon, 25 Mar 2019 09:28:44 -0400
Received: by mail-yw1-f68.google.com with SMTP id x129so6281384ywc.1;
	Mon, 25 Mar 2019 06:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dneYWO7Cav1JnBm/4BLe2j2KMeWtgJD4yqE4IbiVfBY=;
	b=cNNmfNX6hq3VnqQKIohCkUA881PcMNK62J8lSEDLmnXavyVI2MufywShFG6pf3TTd3
	v//kVXVkTViVjEtuB68yzDrRGB9OYT+wi6FzT17O2BwUN5yvR6GBQlD/xPtc3ifnjL/L
	hgizw32MD/2mqXPs7cpbfPE2YH+k3ps+cYlbZQ5jL1wVGhuWyNuGx0IN/o19drllskYP
	7iYPoRc+6lONuIrw92GbOGPX5qyUdHAvoyt5NLUglIOV0fvZUyT1lGg8esvtkKtl7rEw
	jxpdnmwA4fEtzGhbWJAir8XtJbZawFfrA3/gAqppeFUNTIlfyNL7o14ZsQbjHYlnTCe6
	jwjw==
X-Gm-Message-State: APjAAAUPYiIsYbA5YZEnNVGkl3FvGmfLu3yvTL1DhP2FRzGeDeiy5HC2
	N7q13HV3cSScYVMuPBZ7ROl8DTKPxnGB3JqX3R0=
X-Received: by 2002:a81:5ec5:: with SMTP id
	s188mr10773247ywb.381.1553520523504; 
	Mon, 25 Mar 2019 06:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553510737.git.damien.hedde@greensocs.com>
	<c2bf4b5983b8f0bb42208eaf62643aaccc0163a2.1553510737.git.damien.hedde@greensocs.com>
In-Reply-To: <c2bf4b5983b8f0bb42208eaf62643aaccc0163a2.1553510737.git.damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 25 Mar 2019 14:28:33 +0100
Message-ID: <CAAdtpL6rX-U2Bh4m1y1Z3OGG8zkFfsn3iFz+4n93VZvEvhm7RA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: multipart/alternative; boundary="000000000000f475c20584eb2e45"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.68
Subject: Re: [Qemu-arm] [RFC PATCH 15/17] Convert zynq's slcr to 3-phases
 reset
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, alistair.francis@wdc.com,
	pbonzini@redhat.com, marcandre.lureau@redhat.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWYbcTm+p0IC

--000000000000f475c20584eb2e45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Damien,

Le lun. 25 mars 2019 12:16, Damien Hedde <damien.hedde@greensocs.com> a
=C3=A9crit :

> Change the legacy reset function into the init phase and test the
> resetting flag in register accesses.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/misc/zynq_slcr.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index baa13d1316..47f43e1d8d 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -180,9 +180,9 @@ typedef struct ZynqSLCRState {
>      uint32_t regs[ZYNQ_SLCR_NUM_REGS];
>  } ZynqSLCRState;
>
> -static void zynq_slcr_reset(DeviceState *d)
> +static void zynq_slcr_reset_init(Object *obj, bool cold)
>  {
> -    ZynqSLCRState *s =3D ZYNQ_SLCR(d);
> +    ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
>      int i;
>
>      DB_PRINT("RESET\n");
> @@ -346,6 +346,10 @@ static uint64_t zynq_slcr_read(void *opaque, hwaddr
> offset,
>      offset /=3D 4;
>      uint32_t ret =3D s->regs[offset];
>
> +    if (qdev_is_resetting((DeviceState *) opaque)) {
> +        return 0;
> +    }
> +
>      if (!zynq_slcr_check_offset(offset, true)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "zynq_slcr: Invalid read access t=
o
> "
>                        " addr %" HWADDR_PRIx "\n", offset * 4);
> @@ -361,6 +365,10 @@ static void zynq_slcr_write(void *opaque, hwaddr
> offset,
>      ZynqSLCRState *s =3D (ZynqSLCRState *)opaque;
>      offset /=3D 4;
>
> +    if (qdev_is_resetting((DeviceState *) opaque)) {
> +        return;
>

I wonder if that could be moved to generic parent, as an abstract method.
But then I'm not sure we can use a generic read() return value.

+    }
> +
>      DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx64 "\n", offset *
> 4, val);
>
>      if (!zynq_slcr_check_offset(offset, false)) {
> @@ -441,7 +449,7 @@ static void zynq_slcr_class_init(ObjectClass *klass,
> void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->vmsd =3D &vmstate_zynq_slcr;
> -    dc->reset =3D zynq_slcr_reset;
> +    dc->reset_phases.init =3D zynq_slcr_reset_init;
>  }
>
>  static const TypeInfo zynq_slcr_info =3D {
> --
> 2.21.0
>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--000000000000f475c20584eb2e45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Damien,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">Le lun. 25 mars 2019 12:16, Damien Hedde &lt;<a href=3D"mailto:da=
mien.hedde@greensocs.com">damien.hedde@greensocs.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Change the legacy reset fun=
ction into the init phase and test the<br>
resetting flag in register accesses.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank" rel=3D"noreferrer">damien.hedde@greensocs.com</a>&gt;<=
br>
---<br>
=C2=A0hw/misc/zynq_slcr.c | 14 +++++++++++---<br>
=C2=A01 file changed, 11 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c<br>
index baa13d1316..47f43e1d8d 100644<br>
--- a/hw/misc/zynq_slcr.c<br>
+++ b/hw/misc/zynq_slcr.c<br>
@@ -180,9 +180,9 @@ typedef struct ZynqSLCRState {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t regs[ZYNQ_SLCR_NUM_REGS];<br>
=C2=A0} ZynqSLCRState;<br>
<br>
-static void zynq_slcr_reset(DeviceState *d)<br>
+static void zynq_slcr_reset_init(Object *obj, bool cold)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 ZynqSLCRState *s =3D ZYNQ_SLCR(d);<br>
+=C2=A0 =C2=A0 ZynqSLCRState *s =3D ZYNQ_SLCR(obj);<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0DB_PRINT(&quot;RESET\n&quot;);<br>
@@ -346,6 +346,10 @@ static uint64_t zynq_slcr_read(void *opaque, hwaddr of=
fset,<br>
=C2=A0 =C2=A0 =C2=A0offset /=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t ret =3D s-&gt;regs[offset];<br>
<br>
+=C2=A0 =C2=A0 if (qdev_is_resetting((DeviceState *) opaque)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (!zynq_slcr_check_offset(offset, true)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR, &quot;zynq=
_slcr: Invalid read access to &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; addr %&quot; HWADDR_PRIx &quot;\n&quot;, offset * 4);<br>
@@ -361,6 +365,10 @@ static void zynq_slcr_write(void *opaque, hwaddr offse=
t,<br>
=C2=A0 =C2=A0 =C2=A0ZynqSLCRState *s =3D (ZynqSLCRState *)opaque;<br>
=C2=A0 =C2=A0 =C2=A0offset /=3D 4;<br>
<br>
+=C2=A0 =C2=A0 if (qdev_is_resetting((DeviceState *) opaque)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I wonder if that could be moved to ge=
neric parent, as an abstract method.=C2=A0</div><div dir=3D"auto">But then =
I&#39;m not sure we can use a generic read() return value.=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0DB_PRINT(&quot;addr: %08&quot; HWADDR_PRIx &quot; data:=
 %08&quot; PRIx64 &quot;\n&quot;, offset * 4, val);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!zynq_slcr_check_offset(offset, false)) {<br>
@@ -441,7 +449,7 @@ static void zynq_slcr_class_init(ObjectClass *klass, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_zynq_slcr;<br>
-=C2=A0 =C2=A0 dc-&gt;reset =3D zynq_slcr_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;reset_phases.init =3D zynq_slcr_reset_init;<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo zynq_slcr_info =3D {<br>
-- <br>
2.21.0<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@=
amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div=
>

--000000000000f475c20584eb2e45--
