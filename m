Received: by 10.223.161.27 with SMTP id o27csp365175wro;
        Wed, 25 Oct 2017 23:00:08 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TIV1Euj/fHketcJOj+hbdCmT/0wsEBFQ9iOjs5JywiYAWI/KakMp4BoDFYrep+CNjuxnEw
X-Received: by 10.37.210.19 with SMTP id j19mr2716925ybg.476.1508997608712;
        Wed, 25 Oct 2017 23:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508997608; cv=none;
        d=google.com; s=arc-20160816;
        b=ng2cyps7+4rnTuudG14ziDY8Y7tlM6l2bYun3Y3V8J+bUuNBnIdqlfR24Nfir7WQb2
         jTiyw3Yua6yINpVEiAvc+92kAo4igmQ2Rw2Cx1kbSQrJ5KdukFnqwKyZFjKpnwkliKLe
         03tDUTE6bHwj07z2PTAJElZbnzug4YkfNDsKjg1HKIVtRvMVfmAiPkIrDLxkvu0y52xf
         d5EYmtDeYq2hsTX5VF+8tHDkjoG2GsXppbuHIcPv+htAEv/MH/DG91kTVeiA4bTvauIF
         O5eBdgTjGLds0k3psvQhfr9ZUJFHA6HANe1/+i8foYYwYjPbmhas+bLlifP95dR4ZcbD
         Z/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5YGSVLzg+I/wti68bGWTOoCDbEYHrhyiaqb5eKdA22E=;
        b=Kyh50BDD+cZhax7VxUfQfBDKgIIzBxhufsACwW26TQ6aEqPwt7IuGauG6dK5CbPF4y
         jd1T9aTEJXHCwdim/yFwy83aE9fBAnVYlUsLMY6Etd2Rx6h9dEjJ/xc6Jnf3amaYayDb
         WxJnze+pQygHjEC1g+ChdmPTbGQXAj6OXByYyCgDaqk/GKJkAM2w369XMDetcfvSFWK7
         vFPAnToS/ezUFdshZXZtCDacJ7znN61cEo5cOe0fDDfzLY6J2JKJC5J/+QJOdvpMYUMF
         EDkLa9LlPhrfLRwH8MqXa2Ardk14pV4NKX6QHKGGWOSsCMslbgnpTlnXmGfz/GNoStgE
         iW9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XS5hqR0s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y75si668375yby.547.2017.10.25.23.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Oct 2017 23:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XS5hqR0s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7bD6-00083c-5E
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 02:00:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e7bCu-00082I-QZ
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 01:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e7bCt-0003w6-Qr
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 01:59:56 -0400
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:56204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e7bCr-0003rp-4V; Thu, 26 Oct 2017 01:59:53 -0400
Received: by mail-ua0-x243.google.com with SMTP id b11so1663641uae.12;
	Wed, 25 Oct 2017 22:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=5YGSVLzg+I/wti68bGWTOoCDbEYHrhyiaqb5eKdA22E=;
	b=XS5hqR0skgByyHf8nrV6dubGHXqRl0acT/6HIAXP+XOvoZJQrPn679jxZfhQ4yDh5h
	YuOsP9KZKhzw8XHxjMFwy8dC/M1PUqRBhhG67pYaqSrdDr55fOPZKHxAkbjP4m38sV0b
	jnjKH2BNZaxuQG/TI9Pw6pemYBq1aldkzXA7IXb9FbZlrIplrqpKSBVFwwoEzuEpM3os
	bjv2TvEC2EogiuOmQRZeAvWaGou60JqACSgGuKy3nrm2xOBymMbPqVwyYlHdn+tHJaTy
	dTFozSDsjvsveiyjT+Kjx3G4OHhW7cqJwM222IbQbmrdps1HopscWGEVxXNe1lPQsdSk
	ypqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=5YGSVLzg+I/wti68bGWTOoCDbEYHrhyiaqb5eKdA22E=;
	b=bPXDzBpPd4fm96n6YJsmJRE+sYyMMEugRC6DkHuWUVJXOctRAo3v9jRCqCF2tsM5jk
	ecatZgroYUHTue7iR5XAR5HtKvMKg6RnZYOXlSwKXglu+Ug8Fn+815zxL+2PUdJ3ymck
	UOJig3qIRNXGZp0edHugsr+VvQHm2K6Y0urGRa+GPxnOqK/1ZGviUslCjniMrrlyb0k5
	c5WkhBtnwADsNl/5fE27hee49TXJaCHtd40igLFQU5nN15TuBbFy+8EE4d6qvhgSln0z
	K/vxTaXaFDiy8xpQfLuf2cdk2T7pWzq76gNEqQ0C67CZl8m5GdtUUTsEDBXWsBJAOmy+
	UIOg==
X-Gm-Message-State: AMCzsaVpwgym5gomkvX8HIxBji9FMJDMNlaGMifr8bXHlDyFi5antmVZ
	ehKtzD2IjYeRaOi64XELIOtl+Y1GN5uZtROoUBs=
X-Received: by 10.159.54.107 with SMTP id s40mr3421617uad.95.1508997592256;
	Wed, 25 Oct 2017 22:59:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Wed, 25 Oct 2017 22:59:51 -0700 (PDT)
In-Reply-To: <20171025084542.g65k7bv65j6nhaby@starbug-vm.ie.oracle.com>
References: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
	<20171025084542.g65k7bv65j6nhaby@starbug-vm.ie.oracle.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 26 Oct 2017 11:29:51 +0530
Message-ID: <CALHRZurvgp-eHqBWqwSaU6AGMg9L4vwJTHNv0z4FoAd4eeAVfw@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="001a114698be7412c5055c6ce15a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel V4 PATCH] msf2: Remove dead
 code reported by Coverity
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oOZ/X78ZQsaa

--001a114698be7412c5055c6ce15a
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 2:15 PM, Darren Kenny <darren.kenny@oracle.com>
wrote:

> LGTM now, thanks.
>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>

Thanks Darren,

Sundeep

>
> Thanks,
>
> Darren.
>
>
> On Wed, Oct 25, 2017 at 07:59:04AM +0530, Subbaraya Sundeep wrote:
>
>> Fixed incorrect frame size mask, validated maximum frame
>> size in spi_write and removed dead code.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>> v4:
>>         changed %d to %u while logging frame size error.
>> v3:
>>         Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
>>         register and logged incorrect value too in guest error(suggested
>>         by Darren).
>> v2:
>>         else if -> else in set_fifodepth
>>         log guest error when frame size is more than 32
>>
>> hw/ssi/mss-spi.c | 18 ++++++++++++++----
>> 1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>> index 5a8e308..d60daba 100644
>> --- a/hw/ssi/mss-spi.c
>> +++ b/hw/ssi/mss-spi.c
>> @@ -76,9 +76,10 @@
>> #define C_BIGFIFO            (1 << 29)
>> #define C_RESET              (1 << 31)
>>
>> -#define FRAMESZ_MASK         0x1F
>> +#define FRAMESZ_MASK         0x3F
>> #define FMCOUNT_MASK         0x00FFFF00
>> #define FMCOUNT_SHIFT        8
>> +#define FRAMESZ_MAX          32
>>
>> static void txfifo_reset(MSSSpiState *s)
>> {
>> @@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
>>         s->fifo_depth = 32;
>>     } else if (size <= 16) {
>>         s->fifo_depth = 16;
>> -    } else if (size <= 32) {
>> -        s->fifo_depth = 8;
>>     } else {
>> -        s->fifo_depth = 4;
>> +        s->fifo_depth = 8;
>>     }
>> }
>>
>> @@ -301,6 +300,17 @@ static void spi_write(void *opaque, hwaddr addr,
>>         if (s->enabled) {
>>             break;
>>         }
>> +        /*
>> +         * [31:6] bits are reserved bits and for future use.
>> +         * [5:0] are for frame size. Only [5:0] bits are validated
>> +         * during write, [31:6] bits are untouched.
>> +         */
>> +        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %u
>> provided."
>> +                         "Maximum frame size is %u\n",
>> +                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);
>> +            break;
>> +        }
>>         s->regs[R_SPI_DFSIZE] = value;
>>         break;
>>
>> --
>> 2.5.0
>>
>>
>>

--001a114698be7412c5055c6ce15a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Oct 25, 2017 at 2:15 PM, Darren Kenny <span dir=3D"ltr">&lt;<a =
href=3D"mailto:darren.kenny@oracle.com" target=3D"_blank">darren.kenny@orac=
le.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">LGTM now, th=
anks.<br>
<br>
Reviewed-by: Darren Kenny &lt;<a href=3D"mailto:darren.kenny@oracle.com" ta=
rget=3D"_blank">darren.kenny@oracle.com</a>&gt;<br></blockquote><div><br></=
div><div>Thanks Darren,</div><div><br></div><div>Sundeep=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
Thanks,<br>
<br>
Darren.<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Wed, Oct 25, 2017 at 07:59:04AM +0530, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Fixed incorrect frame size mask, validated maximum frame<br>
size in spi_write and removed dead code.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
v4:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 changed %d to %u while logging frame size error=
.<br>
v3:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Added comment that [31:6] bits are reserved in =
R_SPI_DFSIZE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 register and logged incorrect value too in gues=
t error(suggested<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 by Darren).<br>
v2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if -&gt; else in set_fifodepth<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 log guest error when frame size is more than 32=
<br>
<br>
hw/ssi/mss-spi.c | 18 ++++++++++++++----<br>
1 file changed, 14 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c<br>
index 5a8e308..d60daba 100644<br>
--- a/hw/ssi/mss-spi.c<br>
+++ b/hw/ssi/mss-spi.c<br>
@@ -76,9 +76,10 @@<br>
#define C_BIGFIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 29)<=
br>
#define C_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt;=
 31)<br>
<br>
-#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F<br>
+#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3F<br>
#define FMCOUNT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00FFFF00<br>
#define FMCOUNT_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
+#define FRAMESZ_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 32<br>
<br>
static void txfifo_reset(MSSSpiState *s)<br>
{<br>
@@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 32;<br>
=C2=A0 =C2=A0 } else if (size &lt;=3D 16) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 16;<br>
-=C2=A0 =C2=A0 } else if (size &lt;=3D 32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
@@ -301,6 +300,17 @@ static void spi_write(void *opaque, hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* [31:6] bits are reserved bits and for =
future use.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* [5:0] are for frame size. Only [5:0] b=
its are validated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* during write, [31:6] bits are untouche=
d.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((value &amp; FRAMESZ_MASK) &gt; FRAMESZ_MA=
X) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot;%s: Incorrect size %u provided.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Maximum frame size is %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, value &amp; FRAMESZ_MASK, FRAMESZ_MAX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFSIZE] =3D value;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
-- <br>
2.5.0<br>
<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--001a114698be7412c5055c6ce15a--
