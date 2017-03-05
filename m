Received: by 10.25.0.147 with SMTP id 141csp1089387lfa;
        Sun, 5 Mar 2017 11:10:30 -0800 (PST)
X-Received: by 10.55.161.13 with SMTP id k13mr13346546qke.265.1488741030140;
        Sun, 05 Mar 2017 11:10:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i128si13946717qkd.278.2017.03.05.11.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Mar 2017 11:10:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckbY3-00077f-O6
	for alex.bennee@linaro.org; Sun, 05 Mar 2017 14:10:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <viniciusfre@gmail.com>) id 1ckbXy-00077P-FW
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 14:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <viniciusfre@gmail.com>) id 1ckbXx-0007Nh-Do
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 14:10:22 -0500
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:34076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <viniciusfre@gmail.com>)
	id 1ckbXx-0007Na-8h
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 14:10:21 -0500
Received: by mail-ua0-x236.google.com with SMTP id f54so147650152uaa.1
	for <qemu-arm@nongnu.org>; Sun, 05 Mar 2017 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=pniouLF5u+kJyOELUybiwWJL6v35FfIV69+fwWwe+Mw=;
	b=FjXLYbtshcaPYonXYlgQAy4c+G57te8JjBMzuVTtlGyd4oCSX1HePiYhpISV+YRPur
	qbj0Ko5RjqAZnvC7IsdysGIuhybj8rOSkBNwJHoJ6Lv6I3Zp6hAgsNVRp+meoAMxI8bh
	gr4Yv+Pt9n1JVMIFXTYiPWzWDsH8JlJcCqwYhwHjGU1izytvAg5xI9JwD5ASOJ/rUb6X
	qAfr0jsRAe8k2cjB83QsJObQJySZfP1o2idY8JsdzLGKXTeGLmQzEgQqhW1Q1eyWun8z
	FDCq9T6QmjT6XxmseqW0oBRkpptUd7bzHTbVPZXe6G5+93ak6jSu1w7iNLxuXtCB/FaY
	6dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=pniouLF5u+kJyOELUybiwWJL6v35FfIV69+fwWwe+Mw=;
	b=QsfCOlAwxL3WK/STKdNpE8pJI2FVcFQTIlpJxazTt96ZOMa07YkoYOmvoT/OQjvUmT
	UVwyAhgzzoxQ9kTW48/jL1ZL9x+desu8M5Ex3WUIfavTsjQ5p6D82nYuO3srxK6HpNLh
	FhFYq6ClnVmERRA6234ZLLGWhOFQSYresFLRsW5Ym3v/cRX9QzMWF4x8slN1HrDROtJo
	LCpiace5eOF5PPN8OFCHC4UZCThbm9JT5IrPWs+t/r8f6KyFMrwFPMVxqrR9DM2/1+Uk
	DIh0XwB+40MOjngaRGoFY24lbCT3k5pmR+z/D0UZO/sG6GNZAlervlBz4n7qBJ1ly7s+
	z3eA==
X-Gm-Message-State: AMke39leeTA7htEm0NXqyjGq20MiN8MZ81DHhrn1dD2Vq9AEhlla9ZeVqRIZahpkpSBSrfCc7ePg3AVEit0bmA==
X-Received: by 10.31.217.7 with SMTP id q7mr3908312vkg.32.1488741020351; Sun,
	05 Mar 2017 11:10:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.0.201 with HTTP; Sun, 5 Mar 2017 11:10:19 -0800 (PST)
In-Reply-To: <CAEz5UgHOXCSMmfymSuV5XYdyWyc_Ozp=24xv6X_wg2FMCMJFZg@mail.gmail.com>
References: <CAEz5UgHOXCSMmfymSuV5XYdyWyc_Ozp=24xv6X_wg2FMCMJFZg@mail.gmail.com>
From: Vinicius Maciel <viniciusfre@gmail.com>
Date: Sun, 5 Mar 2017 16:10:19 -0300
Message-ID: <CAEz5UgEX+UxC-UQivbpJ8cdyYQtgLF-cy4rJYkQeCR2=ONx+Ow@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c07c410ae47a6054a0087fd
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-arm] [Bug] Raspberry PI 2 get stuck in boot
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
X-TUID: 1PeqefHuedeL

--94eb2c07c410ae47a6054a0087fd
Content-Type: text/plain; charset=UTF-8

2017-03-04 16:10 GMT-03:00 Vinicius Maciel <viniciusfre@gmail.com>:

> Hi,
>
> The linux kernel 4.4.34-v7+, version , used in 2017-01-11-raspbian-jessie-lite.img
> get stuck in boot.
>
> [   31.572869] INFO: rcu_sched detected stalls on CPUs/tasks:
>
> [   31.576423] 1-O..: (13 GPs behind) idle=001/140000000000000/0
> softirq=0/0 fqs=0
>
> [   31.578076] 2-O..: (13 GPs behind) idle=001/140000000000000/0
> softirq=0/0 fqs=0
>
> [   31.579390] 3-O..: (13 GPs behind) idle=001/140000000000000/0
> softirq=0/0 fqs=0
>
> [   31.580762] (detected by 0, t=2102 jiffies, g=-287, c=-288, q=1)
>
> [   31.583707] Task dump for CPU 1:
>
> [   31.585268] swapper/1       R running      0     0      1 0x00000000
>
> [   31.591144] Task dump for CPU 2:
>
> [   31.591805] swapper/2       R running      0     0      1 0x00000000
>
> [   31.593095] Task dump for CPU 3:
>
> [   31.593741] swapper/3       R running      0     0      1 0x00000000
> [   31.596279] rcu_sched kthread starved for 2102 jiffies! g4294967009
> c4294967008 f0x0 s3 ->state=0x0
>
> It happens in target-arm.for-upstream from Peter' repository and
> http://git.qemu-project.org/qemu.git/ branch master as well.
>
> Best regards,
> Vinicius
>

Hi,

One more information, the kernel get stuck in this line:

drivers/char/hw_random/bcm2835-rng.c:34 --> while ((__raw_readl(rng_base +
RNG_STATUS) >> 24) == 0) {

Best regards,
Vinicius

--94eb2c07c410ae47a6054a0087fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2017-03-04 16:10 GMT-03:00 Vinicius Maciel <span dir=3D"ltr">&lt;<a href=3D=
"mailto:viniciusfre@gmail.com" target=3D"_blank">viniciusfre@gmail.com</a>&=
gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Hi,<div><br></div><div>The linux kernel 4.4.34-v7+, version , used=
 in=C2=A02017-01-11-raspbian-jessie-<wbr>lite.img get stuck in boot.</div><=
div><br></div><div><span id=3D"gmail-m_-8577416872107926230gmail-docs-inter=
nal-guid-b3f49d99-9a9e-3898-39d5-d24d57fadec5"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:a=
rial;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;=
white-space:pre-wrap">[ =C2=A0=C2=A031.572869] INFO: rcu_sched detected sta=
lls on CPUs/tasks:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap">[ =C2=A0=C2=A031.576423] </span><span style=3D"font-family:arial;color:=
rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-space=
:pre-wrap"><span class=3D"gmail-m_-8577416872107926230gmail-Apple-tab-span"=
 style=3D"white-space:pre-wrap">	</span></span><span style=3D"font-family:a=
rial;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;=
white-space:pre-wrap">1-O..: (13 GPs behind) idle=3D001/140000000000000/0 s=
oftirq=3D0/0 fqs=3D0 </span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">[ =C2=A0=C2=A031.578076] </span><span style=3D"font-family:arial;col=
or:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-sp=
ace:pre-wrap"><span class=3D"gmail-m_-8577416872107926230gmail-Apple-tab-sp=
an" style=3D"white-space:pre-wrap">	</span></span><span style=3D"font-famil=
y:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:baseli=
ne;white-space:pre-wrap">2-O..: (13 GPs behind) idle=3D001/140000000000000/=
0 softirq=3D0/0 fqs=3D0 </span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:r=
gb(0,0,0);background-color:transparent;vertical-align:baseline;white-space:=
pre-wrap">[ =C2=A0=C2=A031.579390] </span><span style=3D"font-family:arial;=
color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white=
-space:pre-wrap"><span class=3D"gmail-m_-8577416872107926230gmail-Apple-tab=
-span" style=3D"white-space:pre-wrap">	</span></span><span style=3D"font-fa=
mily:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:bas=
eline;white-space:pre-wrap">3-O..: (13 GPs behind) idle=3D001/1400000000000=
00/0 softirq=3D0/0 fqs=3D0 </span></p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;colo=
r:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spa=
ce:pre-wrap">[ =C2=A0=C2=A031.580762] </span><span style=3D"font-family:ari=
al;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;wh=
ite-space:pre-wrap"><span class=3D"gmail-m_-8577416872107926230gmail-Apple-=
tab-span" style=3D"white-space:pre-wrap">	</span></span><span style=3D"font=
-family:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:=
baseline;white-space:pre-wrap">(detected by 0, t=3D2102 jiffies, g=3D-287, =
c=3D-288, q=3D1)</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(0,0,0=
);background-color:transparent;vertical-align:baseline;white-space:pre-wrap=
">[ =C2=A0=C2=A031.583707] Task dump for CPU 1:</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-family:arial;color:rgb(0,0,0);background-color:transparent;vertical-alig=
n:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.585268] swapper/1 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0R running =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=
=A0=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 0x00000000</span></p=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:transpa=
rent;vertical-align:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.591144]=
 Task dump for CPU 2:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:arial;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">[ =C2=A0=C2=A031.591805] swapper/2 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0R running =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A00 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A01 0x00000000</span></p><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-famil=
y:arial;color:rgb(0,0,0);background-color:transparent;vertical-align:baseli=
ne;white-space:pre-wrap">[ =C2=A0=C2=A031.593095] Task dump for CPU 3:</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:tr=
ansparent;vertical-align:baseline;white-space:pre-wrap">[ =C2=A0=C2=A031.59=
3741] swapper/3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0R running =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A01 0x00000000</span></p><span style=3D"font-family:arial;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>[ =C2=A0=C2=A031.596279] rcu_sched kthread starved for 2102 jiffies! g4294=
967009 c4294967008 f0x0 s3 -&gt;state=3D0x0</span></span><br></div><div><sp=
an><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:trans=
parent;vertical-align:baseline;white-space:pre-wrap"><br></span></span></di=
v><div><span style=3D"font-family:arial;color:rgb(0,0,0);background-color:t=
ransparent;vertical-align:baseline;white-space:pre-wrap">It happens in </sp=
an><font color=3D"#000000" face=3D"arial"><span style=3D"white-space:pre-wr=
ap">target-arm.for-upstream from Peter&#39; repository and <a href=3D"http:=
//git.qemu-project.org/qemu.git/" target=3D"_blank">http://git.qemu-project=
.org/<wbr>qemu.git/</a> branch master as well.</span></font></div><div><fon=
t color=3D"#000000" face=3D"arial"><span style=3D"white-space:pre-wrap"><br=
></span></font></div><div><font color=3D"#000000" face=3D"arial"><span styl=
e=3D"white-space:pre-wrap">Best regards,</span></font></div><div><font colo=
r=3D"#000000" face=3D"arial"><span style=3D"white-space:pre-wrap">Vinicius<=
/span></font></div></div>
</blockquote></div><br></div><div class=3D"gmail_extra">Hi,<div><br></div><=
div>One more information, the kernel get stuck in this line:</div><div><br>=
</div><div>drivers/char/hw_random/bcm2835-rng.c:34 --&gt;=C2=A0while ((__ra=
w_readl(rng_base + RNG_STATUS) &gt;&gt; 24) =3D=3D 0) {<br></div><div><br><=
/div><div>Best regards,</div><div>Vinicius</div></div></div>

--94eb2c07c410ae47a6054a0087fd--
