Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3854305lfy;
        Tue, 18 Aug 2020 07:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSGOzaqFK+MhaUUJL5xnCvEE8dBdvgdqSYgUyf7js+uJIVmk19sgBfVZr/1+WOI8gBYSGD
X-Received: by 2002:a25:b44d:: with SMTP id c13mr26377647ybg.375.1597759351438;
        Tue, 18 Aug 2020 07:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597759351; cv=none;
        d=google.com; s=arc-20160816;
        b=JyYAF9H22BRto3s3xFIQsJ+ISCCPJVyV79bSHlVu79ABvyIpS+1rOWxbb9eM0YHekg
         BHNM48nnAmpgIicyTsgFRv+FSZoqkz1Vlry0xRWaMc+RR5h+yxG/lvlgciYrjSFy2fz8
         bkJLFEt47vEPpgdRY5vRj7B5Yj0VwYvS63V3RTz0N1jNamzM0LF8OyxyywBPO5IypoBs
         7RXfp2TdL44CC5zYJV87xdI+qbkCZcIvhRX3S/qhzL2gJPfxFHJ7jlwzH8MgLPM23nxq
         hWJViwHh+KuomvbIfpUcQFQlkSqf4y+h2bdRxeDos65mB0vhjBwuxYnaKorX744CJlqV
         WHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=1aGqAO4a1ys688nuWDwXZaSGQfcLIsmHQ3hO/DdwwYQ=;
        b=Mi2eeF7s3LNL8IODLzMAr5cqGUCDTEocEutyqrGRVZEjHLe6W9nXF0nFFDo1utQCTZ
         rWdSa9Gnv6wUCETlRDKCZl0VNZiDBCsO44qeLHPqdJ1IZa8nP9f++VhJC//OeROjkZLD
         AhHeRHph1KL9zYja6WSccsxxVWahqOSyWb4GzSasOcjCxtj5F2OOpx310/PoWMIdG/nv
         nScxqXf9NNBF3ayZr/N2nvOZEpWTe8rBfe7E2LYy6rElH4gXX4FtRGD6ZNuZ3gtaX5f1
         XCGEwaJQBk9z0O4B5JZSBvWEVUCOafh0ZjVGywGWKRsOIVO8POfaDULeHtg7C0nBZSJY
         kkvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=GPmfRt+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k37si25594516ybj.178.2020.08.18.07.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 07:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=GPmfRt+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k82C6-0006tN-RX
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 10:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k82Bu-0006r3-PD
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:02:18 -0400
Received: from sonic316-11.consmr.mail.bf2.yahoo.com ([74.6.130.121]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k82Bs-0006Cf-Hm
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1597759334; bh=1aGqAO4a1ys688nuWDwXZaSGQfcLIsmHQ3hO/DdwwYQ=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=GPmfRt+IplijFeAOtvVq+3b+nyi83fuu0f9GaVw55ydEgQUBFwc4pQyBXhauAT4nIXyvNahc9ceSXUpmjtMkWSCpgxOK+kcAokBNB3EnnC33TpHZJ+1wUYDkssZ3JMAynXMrE6F4F/9z+YNMK9Qt1X26cP1PPzLnHpbbMRMOpa0T20M1DUnf+gZkf9blZhVJGR1Ht+EGCTpZ9nsVTGhDFC6eiAZHRYIWcafJ3l3V0IHJ9c4bBC9LtUP4UrY620WOPz5yvEU6w1dUj/gTR62Y5R7A36U7xbZurHtC92Of67s8OK7z6/5ewm600v7I/2mlb7DgWYJem/c1GTGxZo8APg==
X-YMail-OSG: Jw.gDCoVM1k4vb7.kcMSyhottiLZH9FoyCbVH0INPlIC8lOWspisCZcQrtOo88N
 zx0tK63gMwCDpHmwAMmX2yRCiNCMQnJh5aHpD2uqQZvsSoX2t6jrB6lysPY92iMay5u1P5GflFGt
 nMfhsNwtYKEzPoP5M3cxVhgO3uuFiY5vrrUXwakxtK_n8SlEh3HbGLtggv1y7.7I9zwf1z5b7nD_
 2xj8rDnkhd9yu_lo1jG2boyPxP9CPgfa_Oah2VuG5CzLWYhEaG8LIf8u42qVe4PMrdIz48.REtBY
 k8EyY0ViVleF0qYnXSHO_fLB6SHWVNCgJx8FQJMiwIt55YXdsoJ7INpXB8VmSEjpFIy7sLadC5Ve
 xPb_ZCYEFNYjXnJZPxv9FUMX6YwjSDYUqV8FnHVqvY60BcwOsVyuP3dFGhwsZpJ0M1ywcrTYAJLt
 w.TD4Aa99tRNqP5eIn0mJbbsy7onoNN7jHilTF3CJOzCLpJAiMVvoKGku7v3h8ipFp3THSoSa2A1
 r2OtRlhfxpdfIj5z0Q_wDsl_TDnBjRixHlEASFihsZ0G6BguS4jeZIgwEAOtaRYO7qfp3fRTW193
 ee8_jY0u_ZyTiW2Ki0AfD5LDNrKwBUoFjAbM8XqszMaGzaFVPnWivs1RQLCPjdiIk91TliMg0zHq
 Gqj3.qfU87jFJ2SRjxeebzgdCA0grTOyEu7.m9onwoaEzViEaL7P.W6EHHtHfrPeNRTjKnIuufpc
 0QsXeEB6imb9DrwPyVgS7UiwQyNcCQr_E49DFGe2G4_EcbbRfbq06gcZAAFi0ZDZbHhqR70Ad2Db
 ykgud1TRi1hpJ8Qgpc9UTwalpL63IkCYAQA.6whw3yxppHAlqNtTab.nSEf9yEZMjE_RLNhC1Iiq
 9j85HlMkXHAa0jBiWPX7bOgW4V.EACY.Z6Mphdlq1xQ4n27WdyRiqmn.7r7nqDglslg5aUm3l1Cz
 NOoL4TpDC_C6LLY4394zf5vxPo2q7JpUKj2H3SGbhSmG1XtY5uKwWS5w5HceF0K42PXvpvvktiba
 2UOSMdzStjgOmDznKV_4bpMiBP2gy8jnXd.ooilAAAEGGmf2CVAVfumehih5XedfxgIMYwvoYfnN
 wiFzpx6WQsdUROPuR_dz65klgEdLRFqzoT8N25TZ7Fxx4kCbqLuEmz8BuXhFwgGvu.cqXWb5koF.
 yJd7qOCUaL9FMtODhQYG0yXNnGbXcWv6gXY37oJmiI_WUKxURXHAooOObYNrn9CwckEerV.nYp3m
 5kewyefnk.Ty.nfwbuPTZQUlSsf7tMQdO8WrbJsDQWPyQAJQPL9qwhCWsDGnCzMXG_wMudJ2BB33
 7.rrYvSpoiNjRE035DEnoZVM6tM6sEYyou3.B2.cfmV0s.z8lHKTkJMCigeeFRd79KZgco5SIgMl
 4TroFYg3z_QmVKZanQIJPEpY-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.bf2.yahoo.com with HTTP; Tue, 18 Aug 2020 14:02:14 +0000
Date: Tue, 18 Aug 2020 14:02:12 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <1348331683.3733974.1597759332262@mail.yahoo.com>
In-Reply-To: <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3733973_934074912.1597759332254"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125
 Safari/537.36
Received-SPF: pass client-ip=74.6.130.121;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic316-11.consmr.mail.bf2.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 08:14:29
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
X-TUID: m++gDsMAwenF

------=_Part_3733973_934074912.1597759332254
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yeah well, I am in the middle of the=C2=A0may-or-may-not-work territory, cu=
rrenlty digging for food.
The best I can do is debug it remotly, and see what happens,here let me sho=
w you:
gcc params: -Wall -Werror -O2 -nostdlib -nostartfiles -ffreestanding=C2=A0 =
-mcpu=3Dcortex-m4 -mhard-float -mfpu=3Dvfpv4-d16=C2=A0(to make sure I have =
FPU instructions)
the source code:
void PUT32 ( unsigned int, unsigned int );#define UART0BASE 0x4000C000
int notmain ( void ){=C2=A0 =C2=A0 unsigned int rx;=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 unsigned char s[]=3D"QEMU is not that interes=
ting";=C2=A0 =C2=A0=C2=A0 =C2=A0//dummy FPU command=C2=A0=C2=A0 =C2=A0 asm(=
"vmov s15, r3"); // If you are to remove this, the qemu would print after I=
 type the command continue in gdb, with this line, it shows nothing=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0 for(rx=3D0;rx<sizeof(s);rx++)=C2=A0 =C2=A0 {=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PUT32(UART0BASE+0x00,s[rx]);=C2=A0 =C2=A0 }=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 return(0);}
Qemu starts like this :qemu-system-arm -S -s -M lm3s811evb -cpu cortex-m4 -=
m 8K -nographic -kernel notmain.bin

I connect to the debugger=C2=A0gdb file notmain.elf
i get this "notmain.elf" is not a core dump: file format not recognized"
but it still works, see comment above for the asm instruction.
Must I manualy tell qemu that the FPU core is active? like set the register=
s accordingly?
Br, Mircea





Mircea Cociuba"To be or not to be, that is not a question, it's FF".=20

    On Tuesday, August 18, 2020, 04:28:51 PM GMT+3, Peter Maydell <peter.ma=
ydell@linaro.org> wrote: =20
=20
 On Tue, 18 Aug 2020 at 14:17, Mircea Cociuba <cociuba_mircea@yahoo.com> wr=
ote:
>
> Hello, the netduinoplus2 is not part of the machine list in qemu "QEMU em=
ulator version 4.2.0"
> in which one is it?
> in the 4.1.0 version release notes it says "ARM: FPU emulation support fo=
r Cortex-M CPUs, FPU fixes for Cortex-R5F"
>
> Now, is there an option to be passed to qemu to get the FPU working?

I think from 4.1.0 we mostly implemented the FPU for the benefit
of the Cortex-M33 model; we enabled it in the M4 but I don't
know if there are any board models that use it. (You can use
the M4 in the linux-user mode also).

You could either use a newer QEMU version, or see if the QEMU
you have supports a Cortex-M33 board and if that would be
suitable for your needs.

That said, I think looking at the code that the stellaris
board will put a Cortex-M4 in the emulated system if you
use -cpu cortex-m4, though if you do this you are wandering
into unsupported may-or-may-not-work territory. You don't
say what actually goes wrong. (In particular, make sure your
guest code actually enables the FPU via the relevant system
registers before trying to execute fp instructions.)

thanks
-- PMM

 =20
------=_Part_3733973_934074912.1597759332254
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp891ca534yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Yeah well, I am in the middl=
e of the&nbsp;<span><span style=3D"color: rgb(38, 40, 42); font-family: Hel=
vetica Neue, Helvetica, Arial, sans-serif;">may-or-may-not-work territory, =
currenlty digging for food.</span></span></div><div dir=3D"ltr" data-setdir=
=3D"false"><span><span style=3D"color: rgb(38, 40, 42); font-family: Helvet=
ica Neue, Helvetica, Arial, sans-serif;"><br></span></span></div><div dir=
=3D"ltr" data-setdir=3D"false"><font color=3D"#26282a">The best I can do is=
 debug it remotly, and see what happens,here let me show you:</font></div><=
div dir=3D"ltr" data-setdir=3D"false"><font color=3D"#26282a"><br></font></=
div><div dir=3D"ltr" data-setdir=3D"false"><font color=3D"#26282a">gcc para=
ms: <span>-Wall -Werror -O2 -nostdlib -nostartfiles -ffreestanding&nbsp; -m=
cpu=3Dcortex-m4 -mhard-float -mfpu=3Dvfpv4-d16</span><span>&nbsp;(to make s=
ure I have FPU instructions)</span></font></div><div dir=3D"ltr" data-setdi=
r=3D"false"><font color=3D"#26282a"><span><br></span></font></div><div dir=
=3D"ltr" data-setdir=3D"false"><font color=3D"#26282a"><span>the source cod=
e:</span></font></div><div dir=3D"ltr" data-setdir=3D"false"><font color=3D=
"#26282a"><span><br></span></font></div><div dir=3D"ltr" data-setdir=3D"fal=
se"><font color=3D"#26282a"><div><div>void PUT32 ( unsigned int, unsigned i=
nt );</div><div>#define UART0BASE 0x4000C000</div><div><br></div><div>int n=
otmain ( void )</div><div>{</div><div>&nbsp; &nbsp; unsigned int rx;</div><=
div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbs=
p; unsigned char s[]=3D"QEMU is not that interesting";</div><div>&nbsp; &nb=
sp;</div><div>&nbsp; &nbsp;//dummy FPU command&nbsp;</div><div dir=3D"ltr" =
data-setdir=3D"false">&nbsp; &nbsp; asm("vmov<span style=3D"white-space: pr=
e-wrap;">=09</span>s15, r3"); // If you are to remove this, the qemu would =
print after I type the command continue in gdb, with this line, it shows no=
thing</div><div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbsp; for(rx=3D0;rx&l=
t;sizeof(s);rx++)</div><div>&nbsp; &nbsp; {</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; PUT32(UART0BASE+0x00,s[rx]);</div><div>&nbsp; &nbsp; }&nbsp; &nbsp;&=
nbsp;</div><div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbsp; return(0);</div=
><div>}</div></div></font></div><div dir=3D"ltr" data-setdir=3D"false"><br>=
</div><div dir=3D"ltr" data-setdir=3D"false">Qemu starts like this :</div><=
div dir=3D"ltr" data-setdir=3D"false"><span>qemu-system-arm -S -s -M lm3s81=
1evb -cpu cortex-m4 -m 8K -nographic -kernel notmain.bin</span><br></div><d=
iv dir=3D"ltr" data-setdir=3D"false"><span><br></span></div><div dir=3D"ltr=
" data-setdir=3D"false"><span>I connect to the debugger&nbsp;</span></div><=
div dir=3D"ltr" data-setdir=3D"false"><span>gdb file notmain.elf</span></di=
v><div dir=3D"ltr" data-setdir=3D"false"><span><br></span></div><div dir=3D=
"ltr" data-setdir=3D"false"><span>i get this "<span>notmain.elf" is not a c=
ore dump: file format not recognized</span>"</span></div><div dir=3D"ltr" d=
ata-setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data-setdir=3D=
"false"><span>but it still works, see comment above for the asm instruction=
.</span></div><div dir=3D"ltr" data-setdir=3D"false"><span><br></span></div=
><div dir=3D"ltr" data-setdir=3D"false"><span>Must I manualy tell qemu that=
 the FPU core is active? like set the registers accordingly?</span></div><d=
iv dir=3D"ltr" data-setdir=3D"false"><span><br></span></div><div dir=3D"ltr=
" data-setdir=3D"false"><span>Br, Mircea</span></div><div dir=3D"ltr" data-=
setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data-setdir=3D"fal=
se"><span><br></span></div><div dir=3D"ltr" data-setdir=3D"false"><span><br=
></span></div><div dir=3D"ltr" data-setdir=3D"false"><span><br></span></div=
><div dir=3D"ltr" data-setdir=3D"false"><font color=3D"#26282a"><br></font>=
</div><div><br></div><div class=3D"ydp891ca534signature"><div class=3D"ydp8=
91ca534yiv5090244957signature" id=3D"ydp891ca534yiv5090244957yui_3_16_0_ym1=
9_1_1484384922228_11432" style=3D"font-family:HelveticaNeue,;font-size:14px=
;"><i id=3D"ydp891ca534yiv5090244957yui_3_16_0_ym19_1_1484384922228_11431">=
<font class=3D"ydp891ca534yiv5090244957Apple-style-span" face=3D"'times new=
 roman', 'new york', times, serif" id=3D"ydp891ca534yiv5090244957yui_3_16_0=
_ym19_1_1484384922228_11430">Mircea Cociuba</font></i></div><div class=3D"y=
dp891ca534yiv5090244957signature" id=3D"ydp891ca534yiv5090244957yui_3_16_0_=
ym19_1_1484384922228_11432" style=3D"font-family:HelveticaNeue,;font-size:1=
4px;"><i id=3D"ydp891ca534yiv5090244957yui_3_16_0_ym19_1_1484384922228_1147=
4"><font class=3D"ydp891ca534yiv5090244957Apple-style-span" face=3D"'times =
new roman', 'new york', times, serif" id=3D"ydp891ca534yiv5090244957yui_3_1=
6_0_ym19_1_1484384922228_11473">"To be or not to be, that is not a question=
, it's FF".</font></i></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydp93a55ce8yahoo_quoted_8248944793" class=3D"ydp93=
a55ce8yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Tuesday, August 18, 2020, 04:28:51 PM GMT+3, Peter M=
aydell &lt;peter.maydell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Tue, 18 Aug 2020 at 14:17, Mircea =
Cociuba &lt;<a shape=3D"rect" href=3D"mailto:cociuba_mircea@yahoo.com" rel=
=3D"nofollow" target=3D"_blank">cociuba_mircea@yahoo.com</a>&gt; wrote:<br =
clear=3D"none">&gt;<br clear=3D"none">&gt; Hello, the netduinoplus2 is not =
part of the machine list in qemu "QEMU emulator version 4.2.0"<br clear=3D"=
none">&gt; in which one is it?<br clear=3D"none">&gt; in the 4.1.0 version =
release notes it says "ARM: FPU emulation support for Cortex-M CPUs, FPU fi=
xes for Cortex-R5F"<br clear=3D"none">&gt;<br clear=3D"none">&gt; Now, is t=
here an option to be passed to qemu to get the FPU working?<br clear=3D"non=
e"><br clear=3D"none">I think from 4.1.0 we mostly implemented the FPU for =
the benefit<br clear=3D"none">of the Cortex-M33 model; we enabled it in the=
 M4 but I don't<br clear=3D"none">know if there are any board models that u=
se it. (You can use<br clear=3D"none">the M4 in the linux-user mode also).<=
br clear=3D"none"><br clear=3D"none">You could either use a newer QEMU vers=
ion, or see if the QEMU<br clear=3D"none">you have supports a Cortex-M33 bo=
ard and if that would be<br clear=3D"none">suitable for your needs.<br clea=
r=3D"none"><br clear=3D"none">That said, I think looking at the code that t=
he stellaris<br clear=3D"none">board will put a Cortex-M4 in the emulated s=
ystem if you<br clear=3D"none">use -cpu cortex-m4, though if you do this yo=
u are wandering<br clear=3D"none">into unsupported may-or-may-not-work terr=
itory. You don't<br clear=3D"none">say what actually goes wrong. (In partic=
ular, make sure your<br clear=3D"none">guest code actually enables the FPU =
via the relevant system<br clear=3D"none">registers before trying to execut=
e fp instructions.)<div class=3D"ydp93a55ce8yqt1780259089" id=3D"ydp93a55ce=
8yqtfd12001"><br clear=3D"none"><br clear=3D"none">thanks<br clear=3D"none"=
>-- PMM<br clear=3D"none"><br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_3733973_934074912.1597759332254--
