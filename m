Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp5283288lfj;
        Wed, 11 May 2022 12:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeajGFLlaQ59xzikczZSoHLLkKAgGlz74r2k/y6qGtrbYHaQkzdENe6SxyY7pQMA8BmjHJ
X-Received: by 2002:a05:6214:260d:b0:45a:e401:66ed with SMTP id gu13-20020a056214260d00b0045ae40166edmr23396893qvb.37.1652298653925;
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652298653; cv=none;
        d=google.com; s=arc-20160816;
        b=PHkw8z8J3gIb4LQhdKT00kjro4AIbwoMvO+DYLf+UJYUJUOLaMryKqqfR1HJbnyGqW
         lPJHZy4pkC7PhXOXVCJLozqcrhr2LZEmzuazIE6YwC9ViRChbcQrjBWNHz48UwcyWes7
         NA7Swl4kz80Ip02YjiOjoalkbvA9xrEVtULSsDKIYgE/dDMuMB6DknzUohwDgP4FL/cC
         ryEw8twjmYdw43jiBTC2MHiVu/0Y16lnXhw7EaLP/IDww4kh14go9zlUmVKdPT+dioOc
         w/XMYxpqJ2nEcuSAyME40Qso8GLcXa/K+eYhHFlp+IYKhnA+Ol/H1bxzeyGw4+QDwdmh
         xw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=yRPP/md5JX56aaFGofNvJszlaL3gT5i26XzpLHhltRw=;
        b=aeJopZmluBDhRu6zXfLDehn16XoxF/ml5JAzvf+lPDUzD/uj3FVTwsFFVjYBhxsl1z
         liVLv+VOFbcmG7x3guyMJ1Hx2DozgbNFr7gs5/JU4/Y9XXntZbKkrHu0w8SPwFSOqbL1
         +DpQoPtM/B5FBX1H4eicIbNj1Z46xih9/LwTdB7VWOxtxr/LKOV+9gnjKTLDLVHCbigF
         rmXbwzFGOUbMzkhlxe3nOZqE3uCos8h+ay0m+pU0uj50lA1xHMUvt6Nm/+EvwhM9USTB
         S6ILSUrap4rheJkcwFmRBk8sggYURPvJts8ughMy7nPruH/2r9dQUmSI+qxTWEGtigOI
         oExQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=6c8MiYrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05622a050c00b002f3e36b55b9si1815609qtx.651.2022.05.11.12.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=6c8MiYrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nosMH-0000ey-E0
	for alex.bennee@linaro.org; Wed, 11 May 2022 15:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1nosKO-0000W9-3W
 for qemu-arm@nongnu.org; Wed, 11 May 2022 15:48:56 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1nosKL-0004jV-L5
 for qemu-arm@nongnu.org; Wed, 11 May 2022 15:48:55 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so1191919otr.9
 for <qemu-arm@nongnu.org>; Wed, 11 May 2022 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asu-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=yRPP/md5JX56aaFGofNvJszlaL3gT5i26XzpLHhltRw=;
 b=6c8MiYrgl2bjFEE3G9m9m/31Fxw92YeBZDETJpxN7HaMqeF+oDBeLWWqlHtXQump5a
 kQBlahuhMQ5NA1gotn4wBN3hZ5NQ7EVsY7dbhBu06In/r0IFYUJdpGaQRCHCPSD2VuB0
 ApqwkDMaV4chR2tZTGMvpJSZXCwKL/FkwacHr3UyOr48fHusviFzIsTsGGqqzOgkxRgi
 /09kLXvDUrKM52er2D/W8mYv3l+94jyNxeS7I8U7akl62IGs67P4a+85lIwPrnOX6OcN
 vmvz+POSZtg8cH6DDIYjr7Me3detYKdxHw3eW/UeFl6543Jbj4q/OzaX1ZPLeBrAcAmV
 PxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yRPP/md5JX56aaFGofNvJszlaL3gT5i26XzpLHhltRw=;
 b=l7NZKAKcVxx2+Uuk2mxtcCAoeDiDBwipmTUuuvT9sA9IMsnpmw1MUEh1lyDTsiSL1e
 ZNcWWjUm0ao8ui8zl494rT/Q1vjdZi9mcJujngtdWhQwN9iSQ+FCCt7b0xD3ZO9YG1te
 8WbQmU4uqGIQMoeqff75QQCXOaUkjmAbKrUXH1TnWbBwojlc8p0w6sNlR27tOAiLmC91
 c+elULhjbX+sMtR+UbqGdzDttR1EjgdmEq//aJ3tD+5+2ayM57pNljMjK4+duea4Y5GI
 hxc07D+QYKI9P5AX6gidzhVk23NULzz3h1QADi4DZeTPh2MRyrbhDNGGe2C/1sArC8ZN
 X7CA==
X-Gm-Message-State: AOAM530Mm3JdNdYhQ9PlO9G+2ZvmMqxoYRMKRo0h5noyHSwu9ojlgHsD
 TAvQBLW5/ctqUngfwUGCCNrm3DNf6OpCKQ9xT4WyG5nTBO8=
X-Received: by 2002:a9d:6552:0:b0:605:e866:1b58 with SMTP id
 q18-20020a9d6552000000b00605e8661b58mr10126880otl.224.1652298527631; Wed, 11
 May 2022 12:48:47 -0700 (PDT)
MIME-Version: 1.0
From: James Gutbub <jgutbub@asu.edu>
Date: Wed, 11 May 2022 12:48:37 -0700
Message-ID: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
Subject: Hello world example with qemu-system-arm
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000cd80c405dec1ba6e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=jgutbub@asu.edu; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 May 2022 15:50:04 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rj/pKyQuEODY

--000000000000cd80c405dec1ba6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,



I am digging into qemu-system-arm to try and execute some simulation
environment unit tests with no underlying board/device interaction, at most
I need semihosting to print out some results.



The intended target for my hello world using arm-none-eabi-gcc is
Cortex-R5F (e.g. -mcpu=3Dcortex-r5 -mfpu=3Dvfpv3-d16 -mfloat-abi=3Dhard).



I am not finding a way to successfully execute my hello world example using
=E2=80=98qemu-system-arm -cpu cortex-r5f -M none -nographic -semihosting=E2=
=80=99 and the
payload variants below:



-bios hello.bin (hello.bin created using arm-none-eabi-objcopy -O binary
hello.elf hello.bin)

-bios hello.elf

-device loader,file=3Dhello.elf



I also did try using =E2=80=98-M virt=E2=80=99 (without -cpu=3Dcortex-r5f b=
ecause it is not
supported by the virt board) and connected to an arm-none-eabi-gdb session
(added =E2=80=98-S -s=E2=80=99 to qemu-system-arm and arm-none-eabi-gdb hel=
lo.elf -> target
remote localhost:1234) but c/s doesn=E2=80=99t progress my execution succes=
sfully.



I am trying to achieve CPU simulation and avoid board modeling or if there
is some basic board which can support Cortex-R5F in which I can run my
hello world (and eventually my unit tests) I believe qemu-system-arm is
more than capable to provide this type of testing environment.



Are there any examples you could refer me to to complete a basic hello
world test using Cortex-R5F with qemu-system-arm?



Or if qemu-arm might be an option I could use that instead (I faced some
issues when trying to use it), are there any examples I could refer to? I
am running in CentOS Stream 8 if it matters here on an x86_64 host.

Kind Regards,

James G

--000000000000cd80c405dec1ba6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border=
-color:rgb(49,49,49);color:rgb(49,49,49)">Hello,<u style=3D"border-color:rg=
b(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=
=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;border-color:rgb(49=
,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=
=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal=
" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color=
:rgb(49,49,49)">I am digging into qemu-system-arm to try and execute some s=
imulation environment unit tests with no underlying board/device interactio=
n, at most I need semihosting to print out some results.<u style=3D"border-=
color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p=
 class=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;border-color:=
rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rgb(49,49,49)">=
</u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNo=
rmal" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);c=
olor:rgb(49,49,49)">The intended target for my hello world using arm-none-e=
abi-gcc is Cortex-R5F (e.g. -mcpu=3Dcortex-r5 -mfpu=3Dvfpv3-d16 -mfloat-abi=
=3Dhard).<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-col=
or:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;wo=
rd-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"=
border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49=
)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;=
border-color:rgb(49,49,49);color:rgb(49,49,49)">I am not finding a way to s=
uccessfully execute my hello world example using =E2=80=98qemu-system-arm -=
cpu cortex-r5f -M none -nographic -semihosting=E2=80=99 and the payload var=
iants below:<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-=
color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px=
;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=
=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,4=
9,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:=
1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">-bios hello.bin (hello.=
bin created using arm-none-eabi-objcopy -O binary hello.elf hello.bin)<u st=
yle=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,4=
9)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px=
;border-color:rgb(49,49,49);color:rgb(49,49,49)">-bios hello.elf<u style=3D=
"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></=
u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;borde=
r-color:rgb(49,49,49);color:rgb(49,49,49)">-device loader,file=3Dhello.elf<=
u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,=
49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;word-spacing=
:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"border-col=
or:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p=
><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border-col=
or:rgb(49,49,49);color:rgb(49,49,49)">I also did try using =E2=80=98-M virt=
=E2=80=99 (without -cpu=3Dcortex-r5f because it is not supported by the vir=
t board) and connected to an arm-none-eabi-gdb session (added =E2=80=98-S -=
s=E2=80=99 to qemu-system-arm and arm-none-eabi-gdb hello.elf -&gt; target =
remote localhost:1234) but c/s doesn=E2=80=99t progress my execution succes=
sfully.<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color=
:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;word=
-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"bo=
rder-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"=
></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;bo=
rder-color:rgb(49,49,49);color:rgb(49,49,49)">I am trying to achieve CPU si=
mulation and avoid board modeling or if there is some basic board which can=
 support Cortex-R5F in which I can run my hello world (and eventually my un=
it tests) I believe qemu-system-arm is more than capable to provide this ty=
pe of testing environment.<u style=3D"border-color:rgb(49,49,49)"></u><u st=
yle=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"=
font-size:16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,=
49)"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-c=
olor:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;=
word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"aut=
o">Are there any examples you could refer me to to complete a basic hello w=
orld test using Cortex-R5F with qemu-system-arm?<u style=3D"border-color:rg=
b(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=
=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;border-color:rgb(49=
,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=
=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal=
" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color=
:rgb(49,49,49)" dir=3D"auto">Or if qemu-arm might be an option I could use =
that instead (I faced some issues when trying to use it), are there any exa=
mples I could refer to? I am running in CentOS Stream 8 if it matters here =
on an x86_64 host.<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"b=
order-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-siz=
e:16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u =
style=3D"border-color:rgb(49,49,49)"></u><span style=3D"font-size:1rem;colo=
r:rgb(49,49,49)">Kind Regards,</span></p><p class=3D"MsoNormal" style=3D"fo=
nt-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49=
)"><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" s=
tyle=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rg=
b(49,49,49)">James G</p><br style=3D"color:rgb(0,0,0)">
</div>

--000000000000cd80c405dec1ba6e--
