Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp696292lfy;
        Wed, 19 Aug 2020 11:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEmEkHKQhZG+xfKhHbF3N5dsqTKJsgvN/YI//CKfrItEUNZ9f7O6Rkuj4xet5aczew8tfy
X-Received: by 2002:a25:d917:: with SMTP id q23mr33622620ybg.450.1597863370629;
        Wed, 19 Aug 2020 11:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597863370; cv=none;
        d=google.com; s=arc-20160816;
        b=OcK8XxgxCYsWvde+xlXp2jpno24MyNxc/3BQjA2pVcB+w6QzqmaAOrhzBAMSyA3h8V
         ddZ76ffUIkK6hbUj7PQ6C+wQETf2sO8oyooASmfG+aT9eBV77qtOR/Xbxuq67O8hKwV5
         Wp9zxZrzZbJRaZ5gev9+GOuV0JTMSSBKLVYZvtXq6KPcbv5NW+BjjAL/VaQbhop008MR
         Cq1FmxTig6J5z8Lmj5etCt8WUiz58UbU6rsRcirQT7Y+J4iMXE6QvM3wrI7R0w61GO5N
         hqsgi2nqvI//K4ICNNXKYa3ntiEq9Hox9BRY9sdR0NNXesBwqRZQ9bGnAxu0wqGTrGle
         Kl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=pQ1Uo1aefN2Blt4tcdHK70GPdjWRqvNCNtkmaDPmCXg=;
        b=tgbmfoSGyHCXcKvOfmLAAIDH4BFAO0VO5N/ipjs4iOGc/lsKZkTp8iKOhhHnKW3Y38
         b+hnuOIaLiPEeow28u5rqD/H0WOsNg3NF4I2Fj0ysQK9YItASwOvTAt/v1Av4IPwn6/z
         06BL2tTvd56T9hzArLePEpjGRgCxpjNuwPKwACYUzEFE2Dgd7fsM9qmCXmgbdwVmpJcO
         p9Z/jLEEJVVhdS1YUis1UlPwKmp4I1mqkql9PUWSqx1u9eVdz7KZXI7ZSL9f1A6KpsY9
         GHLX1tE18k1A52jC0QdNP7YurTkZQVwW/I4wJ8bybqCwxl7P4LthtXMFYDjR5Fils4CY
         b2VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ANjhGL54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si25165513ybr.323.2020.08.19.11.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 11:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ANjhGL54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8TFp-0000qj-JJ
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 14:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k8TFi-0000qO-SJ
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 14:56:02 -0400
Received: from sonic307-9.consmr.mail.ne1.yahoo.com ([66.163.190.32]:46681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k8TFg-0005Ta-JE
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 14:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1597863356; bh=pQ1Uo1aefN2Blt4tcdHK70GPdjWRqvNCNtkmaDPmCXg=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=ANjhGL54k2I8Cj3bK2s0FXN7CBoEZdaFHFVjdagaCAx7KqKWnIuibAW7FDjMAZoL2QONSaMVh+2LbCmxr8xP3hiJwYXldcFHLdeaEGBNSdyl8K1rKjDGxykb76XPpW9e3qqGx/qA82jTyfCobDp+wIbXCCeWrSKe9s6ZMtjgf0m2ZxcnvL9avpCr71dT1CKPjipwhui609ZVlxknLkCWgyfsfFclx8qjBwYsCr2W18pvCWEcy8HiB/CotO5kzdSJ6b0trlfEKW6ziWz/OsB1n5bqq0ApuI6jG8iea1Pzw4LTGpuJwLmUZkK5YvfV09Ef1emDq6zNR1xwwZzsRaLYrg==
X-YMail-OSG: VhvKwjkVM1kocxzYjQcNWCXRRy626PfJGqQoDeYpQrZ2hr5d4jn08MHL2ZOrodO
 khZHGh6KYrgqzlqkPgQkJAPPT1xbKOoyi5FH6Dy5oklEBdATZ6.Dy1kK7HpBBGG02LFO1mf_Q.VW
 j6Xlf3QI.8jN3UW9XbgFGj8BxqxeLyKr8qMxr2FcYevpIuV44FdBU.9aUuynw2x3ZcmE.WgFhJTT
 O_sTQm6MIadNV3aUHDf.tVIr9v0jmboGEsoFp0R3HSEMxRUizeCALCpnkIUVn.zIoJflwdI3_ZNo
 K.0CBPibEJ66rFKrHQriv4J53e6bYYhKoLGYrb9its.S5RhP2Um7geufHRDYiA2CEfbiIAMBzKb2
 dhWQBXSGe85y_vBUgdaMWfL65YU4GrXu_7YylJwmwGsKFTgr3fHhpGX_0ss6Xvwnd_m.2qxOtOqg
 34YfIqOzwU.e80TU9OBWaUwIeQo6Y6l0wG6PSEAefeeKQy.xHuhRAPF0r.nML0wk3EPK7UJw93PM
 LR9ktvYc2cTn3l33SxR09FDuM75h2TyaIL1SWygFSR_bQYRNMV55dmoAWl0BQ4f1LNFIscmuGtD2
 nKYYA2YLuIqXrG4amh9kdqqh7_pg1hRwR5XzjrrZK4cP.hlJsOuZVJE4auKtATsFVqCpFvUtnTq0
 3TMztvhs77ofNUQzLWMgOo2bn46mlJU5v9FZxce2kaX9WSB47n.nFlcRPnopJtj2JQuD.J0Jj4pg
 ajgO9ZqIIuhED_cN.Nmx5MFXmYVrNOZgSB7g8_95Jg987k20wIN1ad5qz0uMzbh4njbxCSXajIoT
 FA.3_VDQYoZcGbJGGnw4paNDePHP7yRJBe9DiU0QPSBdZoipTzj2MGUgTzMf2nrHoSiNh.Q4PcJ3
 2kZ9ITE.HCSytYyrX77aHzK940WgpDVfPaPfElXMLOmthpms1ztf85GBlU06HTxbUxbCqGnRcstA
 .VIns0Axru6zKWW_JoRFurerqHTNt2zf7KsBtovo.1FH8mkJPILevKyPtuGYXOHUcIdcdPABV6hP
 ztUt.RhRjZ465MTJjnD60cjVnz7rmL8yrJHFNpbxo45dsGMNLreIYzQl8Om0zy0cPMUnfuOcvpfu
 CNT1T3nKxQn_R6cYqlEYFOE2n3LlOP4d_rjBcXUchMbNq5ieFEa4xyLN3w75hemDhGC_AUsuxb7m
 z0iRm_PCaJk8GSbwxV9PFB1WU5PXQVNb5cCq1qkFTM0cnBSiau63HaOV0JhutnLGdS8dgBUOeSeT
 Vb.qMmOWl1Sb_kZq8y1wJUnCNlBAa_C8qt8qX4uedTD32AOXJ0kpSZeWpOv6qv9geQfKWqBxa36H
 qdFo5Ae9ehKhdbLMjULRzwx82G7u9bByWC1FHRtiKSCna5frhPEr4qABgRmfnXQCnP8myVqpL5KM
 fu28PjyUeXtYdSUX8lw--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 19 Aug 2020 18:55:56 +0000
Date: Wed, 19 Aug 2020 18:55:51 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <1948646316.4529673.1597863351319@mail.yahoo.com>
In-Reply-To: <CAFEAcA9afVDZO0yd4aOtsUeR8TVc-sfDrdTgiME_1o72NVx3sA@mail.gmail.com>
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
 <1348331683.3733974.1597759332262@mail.yahoo.com>
 <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
 <1227370812.4280844.1597836314970@mail.yahoo.com>
 <CAFEAcA9afVDZO0yd4aOtsUeR8TVc-sfDrdTgiME_1o72NVx3sA@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_4529672_1606691419.1597863351318"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125
 Safari/537.36
Received-SPF: pass client-ip=66.163.190.32;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic307-9.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 14:55:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BqYYJK+tdY5d

------=_Part_4529672_1606691419.1597863351318
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,I managed to get it to work.Thank you all for your support!
Mircea Cociuba"To be or not to be, that is not a question, it's FF".=20

    On Wednesday, August 19, 2020, 02:58:43 PM GMT+3, Peter Maydell <peter.=
maydell@linaro.org> wrote: =20
=20
 On Wed, 19 Aug 2020 at 12:25, Mircea Cociuba <cociuba_mircea@yahoo.com> wr=
ote:
>
> hello,
> This email will be non qemu related, but close to the original problem.
>
> I managed to get the FPU activation sequence to compile, found it on the =
ARM comunity site:
>
>=C2=A0 =C2=A0 // ARM 100166_0001_00_en S7.3.2
>=C2=A0 =C2=A0 __asm("ldr.w r0, =3D0xE000ED88"); // CPACR
>=C2=A0 =C2=A0 __asm("ldr r1, [r0]");
>=C2=A0 =C2=A0 __asm("orr r1, r1, 0xF << 20"); // [20:23] enable CP10 and C=
P11
>=C2=A0 =C2=A0 __asm("str r1, [r0]");
>
> The documentation also specifies that this code must be executed in privi=
ledged mode.
> There is little to no reference to priviledged mode in the Arm documentat=
ion.
> It briefly specifies that a certain CONTROL register must have a specific=
 bit(nPriv) set to be in privileged mode.
> Where can I find the description of the is register and memory location? =
and are there specific instructions that work on it?

All this kind of detail is documented in the M-profile
Architecture Reference Manual (definition of privileged
mode, what the CONTROL register is, what memory location
it is at, etc). As Vincent says, execution starts in
privileged mode anyway, so unless your bare-metal code
is going to do operating-system like work of switching
into unprivileged mode to run tasks and then switching
back again, you don't need to change CONTROL.nPRIV.

thanks
-- PMM

 =20
------=_Part_4529672_1606691419.1597863351318
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpa0fe5c7dyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Hello,</div><div dir=3D"ltr"=
 data-setdir=3D"false">I managed to get it to work.</div><div dir=3D"ltr" d=
ata-setdir=3D"false">Thank you all for your support!</div><div dir=3D"ltr" =
data-setdir=3D"false"><br></div><div class=3D"ydpa0fe5c7dsignature"><div cl=
ass=3D"ydpa0fe5c7dyiv5090244957signature" id=3D"ydpa0fe5c7dyiv5090244957yui=
_3_16_0_ym19_1_1484384922228_11432" style=3D"font-family:HelveticaNeue,;fon=
t-size:14px;"><i id=3D"ydpa0fe5c7dyiv5090244957yui_3_16_0_ym19_1_1484384922=
228_11431"><font class=3D"ydpa0fe5c7dyiv5090244957Apple-style-span" face=3D=
"'times new roman', 'new york', times, serif" id=3D"ydpa0fe5c7dyiv509024495=
7yui_3_16_0_ym19_1_1484384922228_11430">Mircea Cociuba</font></i></div><div=
 class=3D"ydpa0fe5c7dyiv5090244957signature" id=3D"ydpa0fe5c7dyiv5090244957=
yui_3_16_0_ym19_1_1484384922228_11432" style=3D"font-family:HelveticaNeue,;=
font-size:14px;"><i id=3D"ydpa0fe5c7dyiv5090244957yui_3_16_0_ym19_1_1484384=
922228_11474"><font class=3D"ydpa0fe5c7dyiv5090244957Apple-style-span" face=
=3D"'times new roman', 'new york', times, serif" id=3D"ydpa0fe5c7dyiv509024=
4957yui_3_16_0_ym19_1_1484384922228_11473">"To be or not to be, that is not=
 a question, it's FF".</font></i></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydpd930bb3dyahoo_quoted_8336270322" class=3D"ydpd9=
30bb3dyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Wednesday, August 19, 2020, 02:58:43 PM GMT+3, Peter=
 Maydell &lt;peter.maydell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Wed, 19 Aug 2020 at 12:25, Mircea =
Cociuba &lt;<a shape=3D"rect" href=3D"mailto:cociuba_mircea@yahoo.com" rel=
=3D"nofollow" target=3D"_blank">cociuba_mircea@yahoo.com</a>&gt; wrote:<br =
clear=3D"none">&gt;<br clear=3D"none">&gt; hello,<br clear=3D"none">&gt; Th=
is email will be non qemu related, but close to the original problem.<br cl=
ear=3D"none">&gt;<br clear=3D"none">&gt; I managed to get the FPU activatio=
n sequence to compile, found it on the ARM comunity site:<br clear=3D"none"=
>&gt;<br clear=3D"none">&gt;&nbsp; &nbsp;  // ARM 100166_0001_00_en S7.3.2<=
br clear=3D"none">&gt;&nbsp; &nbsp;  __asm("ldr.w r0, =3D0xE000ED88"); // C=
PACR<br clear=3D"none">&gt;&nbsp; &nbsp;  __asm("ldr r1, [r0]");<br clear=
=3D"none">&gt;&nbsp; &nbsp;  __asm("orr r1, r1, 0xF &lt;&lt; 20"); // [20:2=
3] enable CP10 and CP11<br clear=3D"none">&gt;&nbsp; &nbsp;  __asm("str r1,=
 [r0]");<br clear=3D"none">&gt;<br clear=3D"none">&gt; The documentation al=
so specifies that this code must be executed in priviledged mode.<br clear=
=3D"none">&gt; There is little to no reference to priviledged mode in the A=
rm documentation.<br clear=3D"none">&gt; It briefly specifies that a certai=
n CONTROL register must have a specific bit(nPriv) set to be in privileged =
mode.<br clear=3D"none">&gt; Where can I find the description of the is reg=
ister and memory location? and are there specific instructions that work on=
 it?<br clear=3D"none"><br clear=3D"none">All this kind of detail is docume=
nted in the M-profile<br clear=3D"none">Architecture Reference Manual (defi=
nition of privileged<br clear=3D"none">mode, what the CONTROL register is, =
what memory location<br clear=3D"none">it is at, etc). As Vincent says, exe=
cution starts in<br clear=3D"none">privileged mode anyway, so unless your b=
are-metal code<br clear=3D"none">is going to do operating-system like work =
of switching<br clear=3D"none">into unprivileged mode to run tasks and then=
 switching<br clear=3D"none">back again, you don't need to change CONTROL.n=
PRIV.<div class=3D"ydpd930bb3dyqt9784379457" id=3D"ydpd930bb3dyqtfd22156"><=
br clear=3D"none"><br clear=3D"none">thanks<br clear=3D"none">-- PMM<br cle=
ar=3D"none"><br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_4529672_1606691419.1597863351318--
