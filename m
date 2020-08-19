Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp362894lfy;
        Wed, 19 Aug 2020 04:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH/S7vCE2QKTBnPCm+i0xKZxz33RJtaNlMCA/CU+dEmI670NiI+xj/LzkOISOlAaN3DIB6
X-Received: by 2002:a25:9904:: with SMTP id z4mr33688509ybn.150.1597836327539;
        Wed, 19 Aug 2020 04:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597836327; cv=none;
        d=google.com; s=arc-20160816;
        b=WKfENvoq9dmqi7b+2Cw+3RjOKSqUqS/VjvEACvYJayjChyh2pjK1RP6KkCgzFmUS3T
         60h8++41080SW3hCBd/qfVJ/Lagy8RbSZmfyM+/Rr2++6KZBTSf4d5A0FQwH5o8s98Ih
         /IkiHdMI10mhb0TE+D+f6UujVfNHTwxBeDzjXyCSg2sMiUaG+3QOlJN5jxtIdAlsC4A5
         gf3GdYMnL52ysq4c+PzXBxeNQdjhBcsnPYEjaSmm8Y5M5sSI04uMerp0rAh63ZWxs7Bs
         rvztoYTMJqDEDnLNxW8VO1OP63BnwENE8DRNwpo/MgJnKxUOqSH0XBJzpZxV23KO3yqg
         ZvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=SDLHNTZbPr1YRfhDK+1goOmdrg8wXSZg4OpiPHV1Bjw=;
        b=yrTRmoGyYo9+18Cet4zySN6UhOKUlY1az8CnmMQlnQtU4CB21QJz20bD8F0UGjZHni
         jQSq0z+gXgMMWVslpWcdjS4MiT6/hq95tfbp+2J8APXVAlkj5HnYTFqSZuCPlAviRyUW
         qb9sekV4jowNDRjujJHLDSbUdUxMOakdO8NkTs3ZPcP3DeyAUfLQ0CX0hi0ievltU9xy
         vwlgEtx3z/htXdItM5x7ukGvj/k7A7VlwljuX9uBR3rNKyLU/tOLt3qzFpSseVSjEa46
         +RPe/eRiSc82ygYn9J2PNKa6G9r9vNOa66ZMZEm2a7kGWhYvKZTdvDztQv4hUezIsqa/
         MkWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=rNmWiCrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si22671460ybo.416.2020.08.19.04.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 04:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=rNmWiCrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8MDe-0008Gs-UN
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 07:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k8MDY-0008Gl-UK
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:25:20 -0400
Received: from sonic308-56.consmr.mail.ne1.yahoo.com ([66.163.187.31]:36205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k8MDW-0000SQ-Ox
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1597836316; bh=SDLHNTZbPr1YRfhDK+1goOmdrg8wXSZg4OpiPHV1Bjw=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=rNmWiCrBbQsIAnaqZqMEAarwx6ZEw2hSG3Y+/RZPYHfg8LazunmmqtZIjB+TdDCNS9kdb7Dz41rf3GPFFe1fshEp5aNg5sxHHuWcvoll8PRwtEBFYEavhb6njwUphPqjz6TxveNN7PIkHXHGnljo0hj9I/AhsbEKJzAyS17yv/PtXz94PrOeLjpjG82tsrz8/XtlPNooFcX8B3DzK1qXwy7yOXDEYtN5tsGgOo7GngXaYtcVqQa19jOvHI1CAq2uzdgp7ZqAswCQMHX3JBIxa4mKHvUo4nHcCioD005+D1tp0utNHk2iGbUVR+UvQRsobm++ZbkQxKy8Jg1m6G0/1A==
X-YMail-OSG: YvLNeEgVM1kDDtPkWeBu5ImvmPBUqsD5Bj_AKhHlWD7US.8i1NMNKoadn4W.ued
 YlcFftEN6w1bKTWbvwid0wFR1wPoa6Eh1N5Xo9RQCNJbMdz93UwjeNvwB6rmyMrB.EsDB._TAmW3
 YDVxxXn7EiIfgYjsvT4wLv7J1nDMtdVnSvRYORPZ8.hvxOZDiiygd1JoCQo3jYKNjaDqaypzTWD.
 T5HSPeDiURUK53kL3CfV4iRDvB8Z9a_VAjKwn9etMEpq1BCZfrPpbcfJ_1K97IWD4csY5q36c.1s
 x3yhrT4sPvEz.FD9tc82D8TU2x3qhGY7b827_OleJ7ZEqLQ2anTeCbtnNbbyU9PvKAETiVHq_V13
 L2sItXaBZEOtFBlq0T8dqWGmi0OlzpQ8Sm9Gu7TFbHrpO4lPb9MMraUHIMzw1ZVGJEPck.EYMc91
 Z6cx.NbSVmIDzbl73dpGFCsikJeDz_G6UnIC7IE5LSp873EGPxP.v0IaVDuYL_V37dHKHjn3swJ5
 E0TCJa0JvS44v5Zj2UOm4Xbsp6g70vXj4hLpVkHgXuuzVBMaG3EJMNgUQGPxwK_bsZzokUxGkUlM
 7EgFRpecYA9j10ymU6Q36jvl4W9wmHAnHjBqZZsGA.k4pNsJwFyHwbOfWzYe2z1Wu5iJbypsIR5n
 uwIKj5iqZU_exVy4t70DDAx_FFRvGgBOU0Xh6RlYe2d3SesZxAmhMRrUR30C_tip.nH9bo2tZPS4
 YEbKYv24HhZlYtudQPu6_ntpF6StAyzlEVGGkSOsvrqF0J1DqBudGXdGvpZDdSRshIv3ex2EJJsC
 WwdiQnq.vskWJC.iiHkENMVOKZ8LTNyYA8NsS7X3pcVzgB32.IHB1F2sLQDSo7PmVnv2vWeRF.dV
 tCPDxjrvKf7ylMG4t8sAm4Oj4_OwrMaHxkNxQTVJ9LtrhbemThBdv6uL_hClL20ehSsbkv9B04j3
 WLMqj8GMem9m1iZL.CaqSqltmHQ4XNwwZd4UbHJ4Wj9wsPf.mInHSVYHsMJJcX5vofdmLQi7Y4JD
 JkhfDKdt95NB_CQXjXAeFA.8LGkJYP62boV9ZeAkt1xfuwgGEAW1YcRqY30YHPJvwR4iR6IQykIT
 rKy6siaGu89UmJI4ZDmGK0GpX9S7aigKHPTvWf_7.7kHnZL7AJ8Y4hAoUY7FgQbL2VfRbS1EASf1
 x1dXwCBySn9_mOy0HUJj5CBmx3k8YSXnKY5tB8gklJZo5IKyrP8BRBSFTW3rAbsLgxXhzpmHML7S
 8Q2rfk6EGmpzGcW5ggqv6yIlplcEZ7es.dMUN4kArv8SsFrKSc4jEeVd9k8gLVOcjRm0BpW9mEri
 UOGDjk4GeJFIi2JLL..hL1cT04LYA3tYI26bwXTprBYjYubduVeOBWyr72mcFNfBrWiBR4r_7_JX
 _83Uq6aWgTiPcxg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Wed, 19 Aug 2020 11:25:16 +0000
Date: Wed, 19 Aug 2020 11:25:14 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <1227370812.4280844.1597836314970@mail.yahoo.com>
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
 boundary="----=_Part_4280843_1936327808.1597836314969"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125
 Safari/537.36
Received-SPF: pass client-ip=66.163.187.31;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic308-56.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 07:25:16
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
X-TUID: ovONpHPKwOSq

------=_Part_4280843_1936327808.1597836314969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hello,=C2=A0This email will be non qemu related, but close to the original =
problem.
I managed to get the FPU activation sequence to compile, found it on the AR=
M comunity site:
=C2=A0 =C2=A0 // ARM 100166_0001_00_en S7.3.2=C2=A0 =C2=A0 __asm("ldr.w r0,=
 =3D0xE000ED88"); // CPACR=C2=A0 =C2=A0 __asm("ldr r1, [r0]");=C2=A0 =C2=A0=
 __asm("orr r1, r1, 0xF << 20"); // [20:23] enable CP10 and CP11=C2=A0 =C2=
=A0 __asm("str r1, [r0]");=C2=A0
The documentation also specifies that this code must be executed in privile=
dged mode.There is little to no reference to priviledged mode in the Arm do=
cumentation.It briefly specifies that a certain CONTROL register must have =
a specific bit(nPriv) set to be in privileged mode.Where can I find the des=
cription of the is register and memory location? and are there specific ins=
tructions that work on it?
Mircea Cociuba"To be or not to be, that is not a question, it's FF".=20

    On Tuesday, August 18, 2020, 06:35:33 PM GMT+3, Peter Maydell <peter.ma=
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
------=_Part_4280843_1936327808.1597836314969
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp1db6a16cyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">hello,&nbsp;</div><div dir=
=3D"ltr" data-setdir=3D"false">This email will be non qemu related, but clo=
se to the original problem.</div><div dir=3D"ltr" data-setdir=3D"false"><br=
></div><div dir=3D"ltr" data-setdir=3D"false">I managed to get the FPU acti=
vation sequence to compile, found it on the ARM comunity site:</div><div di=
r=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"f=
alse"><div><div>&nbsp; &nbsp; // ARM 100166_0001_00_en S7.3.2</div><div>&nb=
sp; &nbsp; __asm("ldr.w r0, =3D0xE000ED88"); // CPACR</div><div>&nbsp; &nbs=
p; __asm("ldr r1, [r0]");</div><div>&nbsp; &nbsp; __asm("orr r1, r1, 0xF &l=
t;&lt; 20"); // [20:23] enable CP10 and CP11</div><div>&nbsp; &nbsp; __asm(=
"str r1, [r0]");&nbsp;</div></div><br></div><div dir=3D"ltr" data-setdir=3D=
"false">The documentation also specifies that this code must be executed in=
 priviledged mode.</div><div dir=3D"ltr" data-setdir=3D"false">There is lit=
tle to no reference to priviledged mode in the Arm documentation.</div><div=
 dir=3D"ltr" data-setdir=3D"false">It briefly specifies that a certain CONT=
ROL register must have a specific bit(nPriv) set to be in privileged mode.<=
/div><div dir=3D"ltr" data-setdir=3D"false">Where can I find the descriptio=
n of the is register and memory location? and are there specific instructio=
ns that work on it?</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><=
div class=3D"ydp1db6a16csignature"><div class=3D"ydp1db6a16cyiv5090244957si=
gnature" id=3D"ydp1db6a16cyiv5090244957yui_3_16_0_ym19_1_1484384922228_1143=
2" style=3D"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp1db6a16=
cyiv5090244957yui_3_16_0_ym19_1_1484384922228_11431"><font class=3D"ydp1db6=
a16cyiv5090244957Apple-style-span" face=3D"'times new roman', 'new york', t=
imes, serif" id=3D"ydp1db6a16cyiv5090244957yui_3_16_0_ym19_1_1484384922228_=
11430">Mircea Cociuba</font></i></div><div class=3D"ydp1db6a16cyiv509024495=
7signature" id=3D"ydp1db6a16cyiv5090244957yui_3_16_0_ym19_1_1484384922228_1=
1432" style=3D"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp1db6=
a16cyiv5090244957yui_3_16_0_ym19_1_1484384922228_11474"><font class=3D"ydp1=
db6a16cyiv5090244957Apple-style-span" face=3D"'times new roman', 'new york'=
, times, serif" id=3D"ydp1db6a16cyiv5090244957yui_3_16_0_ym19_1_14843849222=
28_11473">"To be or not to be, that is not a question, it's FF".</font></i>=
</div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydpce56f073yahoo_quoted_8210216388" class=3D"ydpce=
56f073yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Tuesday, August 18, 2020, 06:35:33 PM GMT+3, Peter M=
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
akes an exception.<div class=3D"ydpce56f073yqt6811168563" id=3D"ydpce56f073=
yqtfd39041"><br clear=3D"none"><br clear=3D"none">thanks<br clear=3D"none">=
-- PMM<br clear=3D"none"><br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_4280843_1936327808.1597836314969--
