Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3929481lfy;
        Tue, 18 Aug 2020 08:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVs2T9duokmXFZt3ENh4V6J6IWeUEAuv/mM6GFeelND9SHT5QyRgZhGghmjcNQyW7dtemj
X-Received: by 2002:a5b:e:: with SMTP id a14mr28914304ybp.91.1597764636454;
        Tue, 18 Aug 2020 08:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597764636; cv=none;
        d=google.com; s=arc-20160816;
        b=0WER+UkHWlYQex9Ig62v8BwR1kWr5+HE4ixj5a/myT3OQTDZl3iWk+ac55BaLLVBsF
         3gZftao/S0bZppwO1oe1+iaPJrxPC+B9zWGKsrp8N1CtuWPoj6s9ExnbufJ3/N1J5DT4
         Qr1OjdiuTBLkUWIdhQT2RCM0KMGXOtGSGyQ/eZZr9qHYBL3K1vWkSXdGJjFiaOuhdcu9
         SJMCQhKgwAR9cxxfl38O5gB/gfAHfd9fn/2Z37sjlQV5GrbZd/SWyf2zbeGL+o9H/q+U
         CAXUe9xzSYrXihSpLZJj/ormGJZ/Dub2TS/QLraCQ+xaqXkIpb7dMZJNnfqwM2eyRnoa
         MeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=zJJmuKaA5/gqyjnHgzpgshrkmy9T+mAhZrUiqGTiWJw=;
        b=M8uyyIHenYxtXdf3dZ+/Z5PHjJ6JExmsVgk6myBHKHK//RWr/dTwmVSwIedsQzgEnE
         zMnhz+mNbiX1kW7TI9PUS9fIwDLNqkPv/xW06lJb76imkfeeX359GWIluoxswr/lEFsP
         24EC23yR2gAnZ9M9fGAgxGoLK0gaRrqnnkI4lCYKzFbx0BtHmsXy8TcUknDgMPy9GHAm
         A1/KpbQHsjQwPeZCsiy+FehEqX2XVahUPbsIpNqTfYyMnBRbS5uDaXANuPvbSwNddqYM
         NA55Vr+wMu+zk8cn2UOBqoau+WtkbRDltwqFlXZUIDiWq0U5B3vsYgamj+0tpx5Q/cOr
         vQmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ST0K5t13;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si20255828ybs.48.2020.08.18.08.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ST0K5t13;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83ZL-0008Bt-Nx
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k82uY-0002n8-34
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:48:26 -0400
Received: from sonic303-21.consmr.mail.ne1.yahoo.com ([66.163.188.147]:33861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k82uV-0004AO-6j
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1597762100; bh=zJJmuKaA5/gqyjnHgzpgshrkmy9T+mAhZrUiqGTiWJw=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=ST0K5t13pP2ZwDBI4cSh1qOOwu4qC32MBAsI/qZUeLW6MIm3OQuiGsqW/ef0A+3Myvt7FVJMCijGVHEDkNsMYccN8lwoXB3Bge6Lxh63LOeV+cf/7sBet2ji/THs63/xcNQ8bP6lfNupYw4K3tyXQ0OO/tPPPd1TUQHg0D8eoZE/e1witsmamfPyEYygHcKQewwm9M5fVTZrB6mJpm72jMkg6QyvBIibtTHBuL77C7jkMTMyOMES9v3uSSxNSu7WqlwVjhWlt8p2XmZWbU3GFjWwWzkawS2DCOnnT1IrdXoUDCIj9d928az3DkUEQLxpWq8zF7hzkQ3r68ioj7tiHA==
X-YMail-OSG: zt5q6rQVM1k_civAG9jZU5KCIuT9F1lzD.GdNx2UMXMGjk7F4jC4sfpofrwEKHC
 GqXegiImWKV5DEWfwgzSIASFWzm3nR3wW2DS5CQEycBQGXCxs1.xPzf5l.kjOe22JH4pb4UxQuR6
 1XjtbJX.ZcNGb7Fv9sFS7WHmgLAtDhUIM30Vv.VkXnFowFeM08hVxWeAow8A.O0thwJaX.ameJ4i
 .EhO22TDkYAUgRJiy9FGV_hJa3K5eFgdoOTQt6gRSm_UCrshQUNdCgstlA_4SivyG32qgcHJfBCM
 h3kA_s5U7jg4cN6hlYlAAce5pc0rMBmMSZHPcyklmOb4jvu9wxEBHZkmgq7eJbC6yoyOSk9.YqDZ
 xlFOIAWoniAN23BZCZYzjqJpa4nPoce8xWAKT3Xfrqx8bvn0Yi1qTl76bAyKzF6bsVkpYVyrOAH.
 PYFLQvyem_OFhycbL0oLZJ3IUh1VnfTaaOfGsw7h7hD7BDXtr10l.p6y884Php2..4WJAHlGkOn1
 ks0AodiGqRkCcZ0R1cu_u4ybX_hHlQdLbeY8gvyio.UPE7.uTCrP6Ow2DxK.T_jIKTucgsCG3Xq9
 zWW7wtQ8NG5YBUUFxkO7VUezNaajmCCOCutzFQ4gavIApVguEHQssyxijyJDKCH82Xz0mvdNERxq
 I9L13t2VNDF2R8Nb4FPHjzYpb3DjbzwI5Thwzc8dpar3Vy9Rh5zb2F4nGnORu9hVabKVzkEdalLX
 yVFHyehoSJCqQ_rmtzqNeu1DTBv2K0FRWICwNR64DZXgZLsI2473uKB1D86BuGddgLWpgKaDMaIQ
 KzixCVseM9tVC_3rz3HcmRAwSpeHTsASj2jFzfHYg14zaPxUVvlb7pJR2d39s.cvFOy2Dh0qh02r
 hrQeKP7LKQRXtixT2sSVTtZnklEhuP6Fpd1PwQ.TVDPsocr1qti1Gf8QQatKm1qSZoVmPW7frdLW
 z9O3ifNvT2Ht1KPRDfQSCenN0lDxtNm28Y8xk1GXv9lug_yo4OcLuS_sbZIVTp89ebRrEarBvI2Z
 C1cnnHu4LviKn_GgY4YPi36yLPxP1U7gfT4oLJwAJoQk6IvPhhovQWxW1DnEGMHavC83mli78cFk
 JYHTDYYetGAoGIixoXWYpu5VVBew3szIkjkZl_USrufqxEhdiamFjdDDqSgQxYosfTp22TW4KVbK
 NzUIJRAXa1jpg8CjitoFo40.Hk4vefmTVZDiVnINbMtrbKHHpxZjZ.OAEFZonMgQihfiKiNDLfBc
 bmmZdO18pyXQPjfleKCjmKl1Q8pZY3pCiOnxQwhvwqoIvDiI647PZzH.fFkG8MMmOWErzwb1BUTG
 hJFiLWprsuFyH6_q2knU9TRj2s4gRRzBUXUMYC0X7sD93hdbIEe2TjtewjaF46K4aYZDhSQ.ovKO
 vMRgeB90l8ur0FEHQOyuENw--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Tue, 18 Aug 2020 14:48:20 +0000
Date: Tue, 18 Aug 2020 14:48:15 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <1359439110.3773430.1597762095933@mail.yahoo.com>
In-Reply-To: <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
 <1348331683.3733974.1597759332262@mail.yahoo.com>
 <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3773429_412855621.1597762095932"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125
 Safari/537.36
Received-SPF: pass client-ip=66.163.188.147;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic303-21.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 10:48:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z1cjAktuYcQN

------=_Part_3773429_412855621.1597762095932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you very much Peter,I will try this first thing in the morning,
But before I try this, if the register is memory mapped, the stelaris memor=
y map has no FPU.Is the FPU always at core level at the same address?
Br, Mircea

Mircea Cociuba"To be or not to be, that is not a question, it's FF".=20

    On Tuesday, August 18, 2020, 05:16:39 PM GMT+3, Peter Maydell <peter.ma=
ydell@linaro.org> wrote: =20
=20
 On Tue, 18 Aug 2020 at 15:02, Mircea Cociuba <cociuba_mircea@yahoo.com> wr=
ote:
> gcc params: -Wall -Werror -O2 -nostdlib -nostartfiles -ffreestanding=C2=
=A0 -mcpu=3Dcortex-m4 -mhard-float -mfpu=3Dvfpv4-d16 (to make sure I have F=
PU instructions)
>
> the source code:
>
> void PUT32 ( unsigned int, unsigned int );
> #define UART0BASE 0x4000C000
>
> int notmain ( void )
> {
>=C2=A0 =C2=A0 unsigned int rx;
>
>
>=C2=A0 =C2=A0 unsigned char s[]=3D"QEMU is not that interesting";
>
>=C2=A0 =C2=A0 //dummy FPU command
>=C2=A0 =C2=A0 asm("vmov s15, r3"); // If you are to remove this, the qemu =
would print after I type the command continue in gdb, with this line, it sh=
ows nothing

This looks like you're trying to use the FPU, but you haven't
enabled it. If you're writing bare metal code then it is
the job of your guest code to make sure it enables the FPU
first, exactly as it has to do on real hardware. Check
the Arm architecture reference manual for the details of
how to do this (I think the main thing is writing to the
CPACR to enable the FPU).

Otherwise QEMU will correctly emulate the behaviour you
get on real h/w if you try to use the FPU when it is disabled:
the CPU takes an exception.

thanks
-- PMM
 =20
------=_Part_3773429_412855621.1597762095932
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp91f56336yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false"><div><div dir=3D"ltr" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">Thank you very much Peter,</div><div dir=3D"ltr" style=3D"font-family=
: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">I will tr=
y this first thing in the morning,</div><div dir=3D"ltr" style=3D"font-fami=
ly: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;"><br cle=
ar=3D"none"></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif; font-size: 16px;">But before I try this, if the=
 register is memory mapped, the stelaris memory map has no FPU.</div><div d=
ir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;">Is the FPU always at core level at the same address?<=
/div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Aria=
l, sans-serif; font-size: 16px;"><br clear=3D"none"></div><div dir=3D"ltr" =
style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-si=
ze: 16px;">Br, Mircea</div></div><br></div><div><br></div><div class=3D"ydp=
91f56336signature"><div class=3D"ydp91f56336yiv5090244957signature" id=3D"y=
dp91f56336yiv5090244957yui_3_16_0_ym19_1_1484384922228_11432" style=3D"font=
-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp91f56336yiv5090244957yu=
i_3_16_0_ym19_1_1484384922228_11431"><font class=3D"ydp91f56336yiv509024495=
7Apple-style-span" face=3D"'times new roman', 'new york', times, serif" id=
=3D"ydp91f56336yiv5090244957yui_3_16_0_ym19_1_1484384922228_11430">Mircea C=
ociuba</font></i></div><div class=3D"ydp91f56336yiv5090244957signature" id=
=3D"ydp91f56336yiv5090244957yui_3_16_0_ym19_1_1484384922228_11432" style=3D=
"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp91f56336yiv5090244=
957yui_3_16_0_ym19_1_1484384922228_11474"><font class=3D"ydp91f56336yiv5090=
244957Apple-style-span" face=3D"'times new roman', 'new york', times, serif=
" id=3D"ydp91f56336yiv5090244957yui_3_16_0_ym19_1_1484384922228_11473">"To =
be or not to be, that is not a question, it's FF".</font></i></div></div></=
div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydp587312ddyahoo_quoted_8048507662" class=3D"ydp58=
7312ddyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Tuesday, August 18, 2020, 05:16:39 PM GMT+3, Peter M=
aydell &lt;peter.maydell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Tue, 18 Aug 2020 at 15:02, Mircea =
Cociuba &lt;<a shape=3D"rect" href=3D"mailto:cociuba_mircea@yahoo.com" rel=
=3D"nofollow" target=3D"_blank">cociuba_mircea@yahoo.com</a>&gt; wrote:<br =
clear=3D"none">&gt; gcc params: -Wall -Werror -O2 -nostdlib -nostartfiles -=
ffreestanding&nbsp; -mcpu=3Dcortex-m4 -mhard-float -mfpu=3Dvfpv4-d16 (to ma=
ke sure I have FPU instructions)<br clear=3D"none">&gt;<br clear=3D"none">&=
gt; the source code:<br clear=3D"none">&gt;<br clear=3D"none">&gt; void PUT=
32 ( unsigned int, unsigned int );<br clear=3D"none">&gt; #define UART0BASE=
 0x4000C000<br clear=3D"none">&gt;<br clear=3D"none">&gt; int notmain ( voi=
d )<br clear=3D"none">&gt; {<br clear=3D"none">&gt;&nbsp; &nbsp;  unsigned =
int rx;<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"none">&gt=
;&nbsp; &nbsp;  unsigned char s[]=3D"QEMU is not that interesting";<br clea=
r=3D"none">&gt;<br clear=3D"none">&gt;&nbsp; &nbsp; //dummy FPU command<br =
clear=3D"none">&gt;&nbsp; &nbsp;  asm("vmov s15, r3"); // If you are to rem=
ove this, the qemu would print after I type the command continue in gdb, wi=
th this line, it shows nothing<br clear=3D"none"><br clear=3D"none">This lo=
oks like you're trying to use the FPU, but you haven't<br clear=3D"none">en=
abled it. If you're writing bare metal code then it is<br clear=3D"none">th=
e job of your guest code to make sure it enables the FPU<br clear=3D"none">=
first, exactly as it has to do on real hardware. Check<br clear=3D"none">th=
e Arm architecture reference manual for the details of<br clear=3D"none">ho=
w to do this (I think the main thing is writing to the<br clear=3D"none">CP=
ACR to enable the FPU).<br clear=3D"none"><br clear=3D"none">Otherwise QEMU=
 will correctly emulate the behaviour you<br clear=3D"none">get on real h/w=
 if you try to use the FPU when it is disabled:<br clear=3D"none">the CPU t=
akes an exception.<div class=3D"ydp587312ddyqt9845002349" id=3D"ydp587312dd=
yqtfd99881"><br clear=3D"none"><br clear=3D"none">thanks<br clear=3D"none">=
-- PMM<br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_3773429_412855621.1597762095932--
