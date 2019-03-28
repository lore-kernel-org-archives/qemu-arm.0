Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp960310wrx;
        Thu, 28 Mar 2019 11:44:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYtNB5E5EXyMbOq4p8FCGViJ7GNM7LXJVAeun9+bHMZciGS3i3+pIZPmY4UYXsy7mAZgnB
X-Received: by 2002:a24:2251:: with SMTP id o78mr1409622ito.134.1553798688578;
        Thu, 28 Mar 2019 11:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553798688; cv=none;
        d=google.com; s=arc-20160816;
        b=Hw9/e1qEuHTy5PLwLzF1hri5koziH+a21g7/88wCbdXcsGNYZ3Bfj3p5DL9X0qwolP
         Sinqs+ZbEkULv2H1XaBEj3fp+ArHAV6U+NAKdtc9YCGU5TyzHLozuAq8paxLCDtR958J
         ixaIiUNrFIPN7a1rnPgOWYy5mA+eDHF4+OLoeFOFwrPZi0jKzWGqJxtFP+BdNSP+yr7O
         YvdfXKG6NFkHki35QzWwctBbGFqcQwKRI5NRXRAdUFwLliKVKCRcK+s1zTD9fb8Oe4th
         bYrbzxV+OQYzsFWd9N6txxxepYQQC1V+LRnpcTPjfUTVgt0KVT0UlRPEzktoaoliHcFP
         KhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Cmf4Y0d+XAUk0Ef1p3obbwIqVtrhvIo5oOnLB7j3elQ=;
        b=xiampEL9wG9k3YAp1YYp0BSlzAAqbmuExzSMSurapGon+UdnjCdr70lTVXUO+9zMKa
         YkOSWIhAcdS0/B7Tcnp8Bvh7dTDCfUL1O9TCqQqu9iCgxzyiMGeKxafhPrw7jbzI8+zq
         QSUCMNYa88RpvgrP4BBCIbr7OeP+NT8Jh1ej3YsdPcFQiy26oJWZIpexQLjBqOi10Oq1
         D+4ROLSqRFHEQK95CMaMOpowS+NcFSIo8EH6eGzunJmJVcZVT2Gt2dvememkWBZBQKrK
         N3difScCF2qieY47qFoRzzCbuVbUQYa/K+35JKfRALuesgZyLlVS6tT3UxFIupVDwEEe
         rAHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64si10923904jaa.98.2019.03.28.11.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 11:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9a19-0006Ag-QD
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 14:44:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9a0z-00069H-1Y
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 14:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9a0v-0002i8-Oc
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 14:44:36 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:36576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9a0s-0002gH-HR; Thu, 28 Mar 2019 14:44:31 -0400
Received: by mail-yw1-f66.google.com with SMTP id u197so15512889ywf.3;
	Thu, 28 Mar 2019 11:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cmf4Y0d+XAUk0Ef1p3obbwIqVtrhvIo5oOnLB7j3elQ=;
	b=aB4finz/RzZzZ5Agr2atCOMRKXNk0m6WOQAmbwCbOfOI7OokZWZSToRl9tdoAzZgE+
	olH6oN7eNEgGl70WkjinVzOjSTljJoq/PFngVe5fwL0XwJ7UCASlwcDOwl490RXYrWHH
	rm7eDfRpYKTVpqOyShR/ljK8YDH+Os99UWa9fZ2P/ECoe+YeUYMa6+ykBWzBvPAj4iFs
	rAxd8oXKZHB+Ds6IhMz3ywuS8WIBecCtNX8+mRpxm1iByX8/19WbHgrJefE3jrQ/AruC
	vLOxrT9ewATieHC1KQ2Tlln+xK3MooB8RLbPhcDpPyZNlKvVOQ/C63PEzozkeNACacT2
	HVPg==
X-Gm-Message-State: APjAAAXmd6J0Afi4jj13yWSmy/kcBJfocI/8Yrc+MWURjlncP11wcGcH
	zLWQqlMp5uLloXXPAvDKhIEq9smXONhIODSo7Nk=
X-Received: by 2002:a81:a312:: with SMTP id a18mr37075873ywh.370.1553798668682;
	Thu, 28 Mar 2019 11:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152635.2794-1-peter.maydell@linaro.org>
	<CAJy5ezqAZKSvOSDnLFPq6i30woRuLr9P4oeYSkKtC+7q_9FtHg@mail.gmail.com>
In-Reply-To: <CAJy5ezqAZKSvOSDnLFPq6i30woRuLr9P4oeYSkKtC+7q_9FtHg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 28 Mar 2019 19:44:15 +0100
Message-ID: <CAAdtpL4tu_TUWwK_5BXxOBWoBeY3sr+q168-+=baOA1TuSyFWw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b30c2f05852bf1f5"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.66
Subject: Re: [Qemu-arm] [PATCH for-4.1] hw/ssi/xilinx_spips: Avoid variable
 length array
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
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3FZnEj+kWxNW

--000000000000b30c2f05852bf1f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 mars 2019 16:41, Edgar E. Iglesias <edgar.iglesias@gmail.com> a
=C3=A9crit :

> + Francisco
>
> On Thu, 28 Mar. 2019, 16:26 Peter Maydell, <peter.maydell@linaro.org>
> wrote:
>
>> In the stripe8() function we use a variable length array; however
>> we know that the maximum length required is MAX_NUM_BUSSES. Use
>> a fixed-length array and an assert instead.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/ssi/xilinx_spips.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
>> index 16f88f74029..c615058cc1b 100644
>> --- a/hw/ssi/xilinx_spips.c
>> +++ b/hw/ssi/xilinx_spips.c
>> @@ -429,12 +429,14 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *=
d)
>>
>>  static inline void stripe8(uint8_t *x, int num, bool dir)
>>  {
>> -    uint8_t r[num];
>> -    memset(r, 0, sizeof(uint8_t) * num);
>> +    uint8_t r[MAX_NUM_BUSSES];
>>      int idx[2] =3D {0, 0};
>>      int bit[2] =3D {0, 7};
>>      int d =3D dir;
>>
>> +    assert(num <=3D MAX_NUM_BUSSES);
>> +    memset(r, 0, sizeof(uint8_t) * num);
>> +
>>      for (idx[0] =3D 0; idx[0] < num; ++idx[0]) {
>>          for (bit[0] =3D 7; bit[0] >=3D 0; bit[0]--) {
>>              r[idx[!d]] |=3D x[idx[d]] & 1 << bit[d] ? 1 << bit[!d] : 0;
>> --
>> 2.20.1
>>
>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--000000000000b30c2f05852bf1f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le j=
eu. 28 mars 2019 16:41, Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.igles=
ias@gmail.com">edgar.iglesias@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"auto">+ Francisco=C2=A0</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 28 Mar. 2019, 16:26 Peter Maydell, &lt;<a href=3D"mailto:peter.maydell@lin=
aro.org" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">In the stripe8() functio=
n we use a variable length array; however<br>
we know that the maximum length required is MAX_NUM_BUSSES. Use<br>
a fixed-length array and an assert instead.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" rel=3D"noreferrer noreferrer" target=3D"_blank">peter.maydell@linaro.org<=
/a>&gt;<br>
---<br>
=C2=A0hw/ssi/xilinx_spips.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c<br>
index 16f88f74029..c615058cc1b 100644<br>
--- a/hw/ssi/xilinx_spips.c<br>
+++ b/hw/ssi/xilinx_spips.c<br>
@@ -429,12 +429,14 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)<=
br>
<br>
=C2=A0static inline void stripe8(uint8_t *x, int num, bool dir)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 uint8_t r[num];<br>
-=C2=A0 =C2=A0 memset(r, 0, sizeof(uint8_t) * num);<br>
+=C2=A0 =C2=A0 uint8_t r[MAX_NUM_BUSSES];<br>
=C2=A0 =C2=A0 =C2=A0int idx[2] =3D {0, 0};<br>
=C2=A0 =C2=A0 =C2=A0int bit[2] =3D {0, 7};<br>
=C2=A0 =C2=A0 =C2=A0int d =3D dir;<br>
<br>
+=C2=A0 =C2=A0 assert(num &lt;=3D MAX_NUM_BUSSES);<br>
+=C2=A0 =C2=A0 memset(r, 0, sizeof(uint8_t) * num);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0for (idx[0] =3D 0; idx[0] &lt; num; ++idx[0]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (bit[0] =3D 7; bit[0] &gt;=3D 0; bit[=
0]--) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r[idx[!d]] |=3D x[idx[d]] &=
amp; 1 &lt;&lt; bit[d] ? 1 &lt;&lt; bit[!d] : 0;<br>
-- <br>
2.20.1<br></blockquote></div></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div>
</blockquote></div></div></div>

--000000000000b30c2f05852bf1f5--
