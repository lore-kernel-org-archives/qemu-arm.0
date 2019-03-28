Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp776115wrx;
        Thu, 28 Mar 2019 08:41:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxa6SUCgL7s9XIvG5XIWpPtREWTqDzb2b/dW5Hugx+1yANRM5tu3vjSbFvCgXd8d6+xI9ma
X-Received: by 2002:a6b:3c05:: with SMTP id k5mr954407iob.270.1553787667718;
        Thu, 28 Mar 2019 08:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553787667; cv=none;
        d=google.com; s=arc-20160816;
        b=yUUuAytUA29q85Wtabo8kPd2B5MPqGb6hbZ8mt3P4bdbsddgXu+vGhNoncIe/3WL7B
         D4yUoPMPWI91/RLF/xk7tPSQGvzk6t4C8d6P8fbaKDqfeNir4K+e9aFQNhYhn39L4KAw
         Cf67FIzGFfI4SiCmL7lyWK+690KtewwstWNv05/mtlhVNEsh1Unwcuw11dz1Tj/5GSNL
         QZ8z2L/cekYL0PfcoHBC44WpnXpNH04ddxaeWqL1tdu2IDCDW16SOjBACbe4TsGF8T9+
         6wC5r/xi5P/fZLqWB4LExFhA2m51T01Jp6XIY30ypFtz2FHgKOYyYHqyvRKPIy6bpAsQ
         0zTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHjEFW1a8zgvL8cugYATpjKrPTmKak8dFeLMRwi7Mik=;
        b=k/fSjKb5RSYtYjOW6dpdgK2kbV3+JQtHdA+rxMtwrhWcuwv3yjWrrq8jnIjEnyy0eN
         9mhGJLe8UU3NuZHThPHuPUDGpYGOJ2HcMBt8q87rfBxMF/ZywJyiB+ToJjilJV1R53Mm
         E12DDUxU7k4p9E6Z9ib4xDFmkwxcdFimZWjG5nx33Te6Yux5x8fsdsTJXfazwebsk++v
         4rvSCnZ6JrrFWN1nljnKopHcUPhP3gZXOK7VonTadhsDG6k1R7P4/VF2IP/7j0VJY7UC
         4RlWNSw+zVzYt7iexRtDPOUrH9V78RZJHTDFJg3lMRW0wcSYbKWEVCW/1V1JyOtmpJAJ
         fdCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ATAtB1Ve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p62si1910156itb.123.2019.03.28.08.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 08:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ATAtB1Ve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:38151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9X9O-0002NZ-V0
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 11:41:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1h9X96-0002LP-R3
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1h9X93-0007Z4-3S
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:40:46 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1h9X8z-0007Yf-Vy; Thu, 28 Mar 2019 11:40:42 -0400
Received: by mail-lj1-x243.google.com with SMTP id r24so17008769ljg.3;
	Thu, 28 Mar 2019 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GHjEFW1a8zgvL8cugYATpjKrPTmKak8dFeLMRwi7Mik=;
	b=ATAtB1VetqiVNUtjxNv0ZfOKGdVz6UVPTtKFYhyQ+S+xhnDvFtDCcb+M54Kfan7r//
	K/4VQjqgEWY/NYUiuCXuhleByFzWjNEvxgHptJ+aP/tRL0xPoJX0diL8gKo67CRav6vx
	1psVP/xQvEX0EmQPQHVTd6X5ZX+h2+Q1GG7e3mruijgttA5VrRpcZvaKRa4kcjdZUy0x
	lohorAkAFLFLh6Bl1OHjSwIkGiwiJ92hBFNIA3tgq4CNV1Y31ilAuxJtUlC37a2uZe76
	VWu21L+b9XQrVCO2q0t3LA8xw5FnRPbJ0BYWe+TlAj/g3cWIw3wFAF7DlGXnf+0dXgnh
	h7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GHjEFW1a8zgvL8cugYATpjKrPTmKak8dFeLMRwi7Mik=;
	b=kiq2JyUrIdQdREKVVPFDGowY5Xvb/uKzVZd2QaZP5BaiRbPiFomXaBwrbnEbn9onWM
	mF9eZm7Ih98ePxWoyn8MvDIrap1+5zZVgf+wYO8Q1n1KfBLziMZf0jxRENiMSJYzCNph
	ePLn1ogT0CNGWdMwejV1qcv0dhri2BCQBZb9wksxDMNEg2DDrJG7gLGM1HzfHb/IiNzt
	UcUDBqXKFu6jp+3z7tAv8Df6/TX5+QUS5WmWv6BjH5Lsh34Z1Y7JNxlAjnvCVyFuhOsL
	SafkohxjaPQp88UHeseOF2dkQYDEQ6YoE84TVajdRv9POWB32TEeGswmj2fv5DSrmEjp
	MrPg==
X-Gm-Message-State: APjAAAW52Lgjvax1+LCIQfHQ1Zq9lxc9vlFRuroJ6O9bsPUet2pPi3at
	RQkpwCu/AV5KrEgm+G5q3X0mmPSmntH+jQ4lzIA=
X-Received: by 2002:a2e:91d2:: with SMTP id u18mr23919615ljg.161.1553787638342;
	Thu, 28 Mar 2019 08:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152635.2794-1-peter.maydell@linaro.org>
In-Reply-To: <20190328152635.2794-1-peter.maydell@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 28 Mar 2019 16:40:25 +0100
Message-ID: <CAJy5ezqAZKSvOSDnLFPq6i30woRuLr9P4oeYSkKtC+7q_9FtHg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
	francisco iglesias <frasse.iglesias@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003d69ec058529604b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aA4vDydkcmEm

--0000000000003d69ec058529604b
Content-Type: text/plain; charset="UTF-8"

+ Francisco

On Thu, 28 Mar. 2019, 16:26 Peter Maydell, <peter.maydell@linaro.org> wrote:

> In the stripe8() function we use a variable length array; however
> we know that the maximum length required is MAX_NUM_BUSSES. Use
> a fixed-length array and an assert instead.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/xilinx_spips.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 16f88f74029..c615058cc1b 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -429,12 +429,14 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>
>  static inline void stripe8(uint8_t *x, int num, bool dir)
>  {
> -    uint8_t r[num];
> -    memset(r, 0, sizeof(uint8_t) * num);
> +    uint8_t r[MAX_NUM_BUSSES];
>      int idx[2] = {0, 0};
>      int bit[2] = {0, 7};
>      int d = dir;
>
> +    assert(num <= MAX_NUM_BUSSES);
> +    memset(r, 0, sizeof(uint8_t) * num);
> +
>      for (idx[0] = 0; idx[0] < num; ++idx[0]) {
>          for (bit[0] = 7; bit[0] >= 0; bit[0]--) {
>              r[idx[!d]] |= x[idx[d]] & 1 << bit[d] ? 1 << bit[!d] : 0;
> --
> 2.20.1
>
>

--0000000000003d69ec058529604b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">+ Francisco=C2=A0</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 Mar. 2019, 16:26 Peter Maydel=
l, &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In the stripe8() fu=
nction we use a variable length array; however<br>
we know that the maximum length required is MAX_NUM_BUSSES. Use<br>
a fixed-length array and an assert instead.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
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
2.20.1<br>
<br>
</blockquote></div>

--0000000000003d69ec058529604b--
