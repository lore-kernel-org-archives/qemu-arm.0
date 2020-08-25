Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3578186lfy;
        Tue, 25 Aug 2020 09:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjU1fFXn2mS/16g05PAt1ChtdTvFWgM5QL1NB0cW/wdcAZTqimHPGePNi8VOux3Yc4gEfF
X-Received: by 2002:a25:5545:: with SMTP id j66mr16013256ybb.232.1598372640616;
        Tue, 25 Aug 2020 09:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598372640; cv=none;
        d=google.com; s=arc-20160816;
        b=QL6wWp3xXNBubMP+oqrLzDmOduwfPQ3uXs1m6SUjIpoX686iDD4wiVRY25NmmWx8U7
         U2CFDPXF+hiXFRlBvusb0zpAvJ2lCg7IkHIjxb+S5CCm+omK9ew872DODkT4inHWghmn
         Q0CJShRCwWpI56x1WXYamRnkVOzwfDb4kzkm1TdYb9VbjRxg8gT0bKFkpBRi6uJpcgFd
         MZrDb/4j5P5tRVhvQJdy57nSPb95aC0Gez7EvVSwbg30xaoFEDjehrENWePL00ozZVQX
         pv9PS8uyxIYA4ciT+actETH119Fl1fclIqu83E3WASGACYZ1cKKUyZ2CNKg43wL1WZ4g
         Q4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=GNVIPC5kQ8EFXQUl+uwTsg/Em/TESsObolXrIKYUJBE=;
        b=azmwnyjw9SSbs24Vxt/L8DVkxk+WS/is+UEgiFQ5ARL9a23HtjUgXJEpFGZV6MLbiv
         vZZJdj1tPtSPMzqMah9IWuOl2S9awFFJixK/4MAP9ogGyvbKT+2ajTIWi39Ftkw+o6uf
         t2YzMCWPVhKko2EzfnY28DqCvtRmzjjzrW5TrMK6KT5kDd7kNWScTSiC6m86qgY5Fs9a
         0SDjRLzeJVTLjr+viYcCYcSGeZekLT1M5taukzUgsxKPPz06uaNARfNCwO+jFPkvgDbA
         IT2ma59GkwCCF/A2Ecmyu7b4vEekOvpIpCfl6OJ5wEBr/KhQ51a2LVzQQeT/bhj9mXBs
         7Y+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ZMjGNK3W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si14995094ybi.326.2020.08.25.09.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 09:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ZMjGNK3W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAbjs-0005ye-06
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 12:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1kAbjl-0005yX-HA
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 12:23:53 -0400
Received: from sonic308-9.consmr.mail.ne1.yahoo.com ([66.163.187.32]:45530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1kAbjj-0007c5-4G
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 12:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598372628; bh=GNVIPC5kQ8EFXQUl+uwTsg/Em/TESsObolXrIKYUJBE=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=ZMjGNK3WDxYWaewrI+IMdjAiQkrNist0ltNc1VGZ8mFLAfnklfE8ED3zzxEleMsJJuxqZn5sQWtRXN79zVGWt47oq7Fr/7+R80gd7c+J3j9vLJSpmndNRS8Nc82ASFqeoBm4nSnUQQs0oNgjTivPHJvdIaUDRmW9mQw3065eBGME+QsnqCjkPJ0g9GM68i5hCSsmAjaWdKqjZeXN82clH0Lj2L+q0h76eUM5lOkDrIX34o2rDzJCtAYhSerXEzKNZ4YerJyQ7i7O0sQdNzFNuPIiMXx9lYnvBE/ZQrVGhVFu9GHqMIM4GO98YCnE3kyLqMEmEj+Y+gp6O4EkL2k09A==
X-YMail-OSG: UyTRfVwVM1l_wuxdSegroDUT83ePsWKirBKDYC0jWNUJgrgJYaoytVQBQqxODS9
 OSOORk7fBORr0FTmajHU7ylycsKqkhJo61sXwJGEypQDwU_M3NyplEFNTxrixZnEnYxl_VtM5fWM
 pvirpmpOxxHLhAHsoeFyVid4XHH.krg9G1BfgW9wT5uSo3FvhhAtYiWvZ0Qs32fr8C1xuwPJ9mBi
 _J33.NP9_b.VIedIi14jK.MObZu23ST950Aglpd858AoCw2LUdZeMROvpMIXCg9STx5boh4MnSqB
 nf0egm6b2K2NJmflMX5bv06vGgc4fN6IctBFyz0r1.YYI5lMT2KTyS5dGJ_y.2eHhB9.kfy2X.Zo
 2y__jfccgdAyhAHq.gpR850Eg9RVmwtXlkA.xJd8UZ.KCTtA6wDXB99hOtyhWShCUSZ5qf.UAEAA
 cyIvRwriMiqi3QJQPk7NPhrRgG1P7vAZDTFFhH0nv8z17LHXyVYA2OjcFeVjQQaWCPceXs5_kMDA
 6sjSJsuMHD_ppatCEgbaHPYq1KISydMUxP3Omr2YSGPzoZZqChLO4N7SIro2XhLcGo8yrBB9c1g1
 K.cbGE2Tk8HjYl4afcFaCnxcKFEsIwJQQJGazIHKyMmal_H57koFisAJ37jtMIPAscjtGgTanh7q
 AVzGTp193uSb8mKushQI_RxMTDqiLEZGsKAFMcx4MYxIG24jgtFQx1gY9Uq5MeRRVIcAvOSrA4mM
 6HnbjL9wjCTfgoMI8W46kiZ9hxzn51Q86w8.nsB3fNSuUJsmHQ_9dLa26GoO4Lnd.UrNg2ns_bgs
 ZZWivIQJTekDxVgOlaM5A1ivQFc1OsWc7bis_m4wKVXYpr8YQsRTvy7kNJx3yHoPmJtNQKqZN.V7
 1EOO960w4x1dLFCbRxmrXP4bgh4PIsWHX.VOvb5EQQI6Bqv6pwcIG.ABC8E_mcKjng9OoRF2OV4m
 N9cozIoa8e5RHcmWR0AQRr5Tkkh8.uOlp3SSBIPrF5UnThX9ShINujPsmg_FkIgi63F9fn9p2OrY
 ndKLX6Nf_drkUBuntg8RDhkt3UfzBiAXPlCnAHgWXNcIcomVYM.J93leqCDmi4JbNkGeBOqM0TwY
 e0Y2l5sXZ7beu7MAY066jemn3aIpj5mpUAzftQYyCm2JxVgQf_sCu5I5mA_77Nb.iJ2rtidLRzFt
 3_21sEPxfVSGqMMms4TiHDmEMAfL2WC533R3ntmWzhKYOcYSWgB1L5gpKx0sFVabgDF1D_sVz4vM
 wlzZbWbuN5HZG51.W_TcJtFgVaTnYAJANV0f4Coig8g.0UzmvAvWNafxCI9_N.y9rOu9svwLM3W1
 x3Z63qv8FHSbEUzzVwQoTgkZZB.oOlhmXXHtzjO9cYBYDdXRl0aPZo.gB15qdFDzSXYEnOgZtpp7
 Hn3FWh8kuGJmebgHshK2zpbRFiIHxZo6D.9PS3xpr2pHLqiuHRTp5Akm_cmaggxkw4AKtS9ZtSax
 Yco05Aay1hcyfrrS2tPCH
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Aug 2020 16:23:48 +0000
Date: Tue, 25 Aug 2020 16:23:47 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-arm <qemu-arm@nongnu.org>
Message-ID: <887324818.3432504.1598372627788@mail.yahoo.com>
In-Reply-To: <CAFEAcA_3yUToiV_iXERz4MMtrQFwmmBzRMZ4KzttA0pS9srvVA@mail.gmail.com>
References: <554074341.6540650.1598262327794.ref@mail.yahoo.com>
 <554074341.6540650.1598262327794@mail.yahoo.com>
 <CAFEAcA_5a7aGpGMtVxjYjVnnDJNzXkQJwDW-846+TeNjTrAs_g@mail.gmail.com>
 <316503436.6530715.1598263341117@mail.yahoo.com>
 <CAFEAcA_3yUToiV_iXERz4MMtrQFwmmBzRMZ4KzttA0pS9srvVA@mail.gmail.com>
Subject: Re: [QEMU]send key event from monitor
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3432503_528270679.1598372627786"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135
 Safari/537.36
Received-SPF: pass client-ip=66.163.187.32;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic308-9.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 12:23:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: teXvCM+VzWL9

------=_Part_3432503_528270679.1598372627786
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello again,
Reading the CharDev docus is teadious, and I am having trouble keeping up w=
ith it.I am not asking for spoon feeding, but if my question is considered =
as such please ignore it(I will keep reading the docs)What command must I s=
pecify to qemu to link the devices UART to a TCP chardev?(windows user here=
, I have to use windows)
Current command for starting qemu:=C2=A0qemu-system-arm -M lm3s6965evb-m 8K=
 -nographic -kernel notmain.bin
if you can tell me this, I can use netcat to comunicate with it easly.
BrMircea Cociuba"To be or not to be, that is not a question, it's FF".=20

    On Monday, August 24, 2020, 01:26:00 PM GMT+3, Peter Maydell <peter.may=
dell@linaro.org> wrote: =20
=20
 On Mon, 24 Aug 2020 at 11:02, Mircea Cociuba <cociuba_mircea@yahoo.com> wr=
ote:
> I get that, I also think that is the problem.
> How come the current console works then?

That's because your command line will (presumably; you don't
say what it is) be configuring QEMU to say "connect the
current stdin/stdout to this UART". You can alternatively
configure it to connect the UART to a TCP port, or to
display in the GUI window, or various other options (see the
docs about configuring 'chardev' backends, which is what the UART
emulation connects to:
https://www.qemu.org/docs/master/system/invocation.html#hxtool-6 )

> I mean, thinking about it makes sense that qemu "sees" something to send =
to the bare-metal program, how to do it from the monitor?

There isn't any support in the monitor for sending characters to
a chardev, I'm afraid (except for the special case of sending a
'break' event with "chardev-send-break"). Usually people who want
to automate sending things to a UART just set it up so the
chardev backend is a TCP socket or a file descriptor or similar
which the automation can then read/write. (Obviously this then
means you don't have the human-can-interact-with-it-too behaviour,
unless you put something on the other end of the socket/fd that
will multiplex human and automated input.) If you really need
to have something you can interact with from the monitor prompt
in particular then maybe the 'ringbuf' chardev backend and the
ringbuf_read/ringbuf_write monitor commands will be useful, but
I've never used them myself.

thanks
-- PMM

 =20
------=_Part_3432503_528270679.1598372627786
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp41256457yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Hello again,</div><div dir=
=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"fa=
lse">Reading the CharDev docus is teadious, and I am having trouble keeping=
 up with it.</div><div dir=3D"ltr" data-setdir=3D"false">I am not asking fo=
r spoon feeding, but if my question is considered as such please ignore it(=
I will keep reading the docs)</div><div dir=3D"ltr" data-setdir=3D"false">W=
hat command must I specify to qemu to link the devices UART to a TCP charde=
v?(windows user here, I have to use windows)</div><div dir=3D"ltr" data-set=
dir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Current comm=
and for starting qemu:&nbsp;<span><div>qemu-system-arm -M <span style=3D"fo=
nt-size:10.5pt;line-height:107%;font-family:Arial,sans-serif;color:#222222;=
background:white">lm3s6965evb
</span>-m 8K -nographic -kernel notmain.bin</div><div><br></div><div dir=3D=
"ltr" data-setdir=3D"false">if you can tell me this, I can use netcat to co=
municate with it easly.</div><div dir=3D"ltr" data-setdir=3D"false"><br></d=
iv><div dir=3D"ltr" data-setdir=3D"false">Br</div></span></div><div class=
=3D"ydp41256457signature"><div class=3D"ydp41256457yiv5090244957signature" =
id=3D"ydp41256457yiv5090244957yui_3_16_0_ym19_1_1484384922228_11432" style=
=3D"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp41256457yiv5090=
244957yui_3_16_0_ym19_1_1484384922228_11431"><font class=3D"ydp41256457yiv5=
090244957Apple-style-span" face=3D"'times new roman', 'new york', times, se=
rif" id=3D"ydp41256457yiv5090244957yui_3_16_0_ym19_1_1484384922228_11430">M=
ircea Cociuba</font></i></div><div class=3D"ydp41256457yiv5090244957signatu=
re" id=3D"ydp41256457yiv5090244957yui_3_16_0_ym19_1_1484384922228_11432" st=
yle=3D"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp41256457yiv5=
090244957yui_3_16_0_ym19_1_1484384922228_11474"><font class=3D"ydp41256457y=
iv5090244957Apple-style-span" face=3D"'times new roman', 'new york', times,=
 serif" id=3D"ydp41256457yiv5090244957yui_3_16_0_ym19_1_1484384922228_11473=
">"To be or not to be, that is not a question, it's FF".</font></i></div></=
div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydp4af4c0dfyahoo_quoted_8427647314" class=3D"ydp4a=
f4c0dfyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Monday, August 24, 2020, 01:26:00 PM GMT+3, Peter Ma=
ydell &lt;peter.maydell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Mon, 24 Aug 2020 at 11:02, Mircea =
Cociuba &lt;<a shape=3D"rect" href=3D"mailto:cociuba_mircea@yahoo.com" rel=
=3D"nofollow" target=3D"_blank">cociuba_mircea@yahoo.com</a>&gt; wrote:<br =
clear=3D"none">&gt; I get that, I also think that is the problem.<br clear=
=3D"none">&gt; How come the current console works then?<br clear=3D"none"><=
br clear=3D"none">That's because your command line will (presumably; you do=
n't<br clear=3D"none">say what it is) be configuring QEMU to say "connect t=
he<br clear=3D"none">current stdin/stdout to this UART". You can alternativ=
ely<br clear=3D"none">configure it to connect the UART to a TCP port, or to=
<br clear=3D"none">display in the GUI window, or various other options (see=
 the<br clear=3D"none">docs about configuring 'chardev' backends, which is =
what the UART<br clear=3D"none">emulation connects to:<br clear=3D"none"><a=
 shape=3D"rect" href=3D"https://www.qemu.org/docs/master/system/invocation.=
html#hxtool-6 " rel=3D"nofollow" target=3D"_blank">https://www.qemu.org/doc=
s/master/system/invocation.html#hxtool-6 </a>)<br clear=3D"none"><br clear=
=3D"none">&gt; I mean, thinking about it makes sense that qemu "sees" somet=
hing to send to the bare-metal program, how to do it from the monitor?<br c=
lear=3D"none"><br clear=3D"none">There isn't any support in the monitor for=
 sending characters to<br clear=3D"none">a chardev, I'm afraid (except for =
the special case of sending a<br clear=3D"none">'break' event with "chardev=
-send-break"). Usually people who want<br clear=3D"none">to automate sendin=
g things to a UART just set it up so the<br clear=3D"none">chardev backend =
is a TCP socket or a file descriptor or similar<br clear=3D"none">which the=
 automation can then read/write. (Obviously this then<br clear=3D"none">mea=
ns you don't have the human-can-interact-with-it-too behaviour,<br clear=3D=
"none">unless you put something on the other end of the socket/fd that<br c=
lear=3D"none">will multiplex human and automated input.) If you really need=
<br clear=3D"none">to have something you can interact with from the monitor=
 prompt<br clear=3D"none">in particular then maybe the 'ringbuf' chardev ba=
ckend and the<br clear=3D"none">ringbuf_read/ringbuf_write monitor commands=
 will be useful, but<br clear=3D"none">I've never used them myself.<div cla=
ss=3D"ydp4af4c0dfyqt4214688229" id=3D"ydp4af4c0dfyqtfd96455"><br clear=3D"n=
one"><br clear=3D"none">thanks<br clear=3D"none">-- PMM<br clear=3D"none"><=
br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_3432503_528270679.1598372627786--
