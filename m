Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2428924lfy;
        Mon, 24 Aug 2020 03:02:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWbesDTq1k3a1nqeQlM++BjBI9BcZJ7L4dMsOuYP4ogR1u66raueEWfP/1aix5wiYLJSaT
X-Received: by 2002:a25:e688:: with SMTP id d130mr6235184ybh.509.1598263365884;
        Mon, 24 Aug 2020 03:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598263365; cv=none;
        d=google.com; s=arc-20160816;
        b=S1bF2PxHhZphQEdsof9erR9qBJkGFCtguY/wOApyQgvgTV+LjmUiMWNHit4Gr9wwZy
         ZsaDpnsXZERVGH5d1oFkFRNqNYVYph50irL+JYgw0HMaqbo/CeN270mglslqPi+53h+7
         WowRvEk2Q6Av6C1PZTu+wRWfcjsVTejJPFuni8VW7F6hRWrIww4mCPoC91zowowDOrnX
         S9dNLWVQ1N37lMx0zmCygZrmgyqvFpHMZ9d8PKV44BT6jHznm+qSuyE01Y4xsfkZNeN8
         v/qDyrGYglAXF42EhSDHEfxBmf0Ddsdkz1KlVLKzfRA9TnanO24TWH0/McMt/dcMqYhL
         meJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=rICSU8tS4uiivMaxZCAivJPpGp3pDZ/J0xyG6NapHac=;
        b=zOgPaXcKQDKvP1ycgEO4QIauzvtDVzaGYmJSvxX0p6IVpVrsYX8W6Z5aC43WMVwWlo
         mI4aF2zolnRh3a2dHo3K6sRMt1eQcy8zr0qZ7cHtuywP2TdNnAceln5g6ONTbY33qxRW
         Us4vNkLhTDvA5B5NQLYF881oUvbD2RLKGizkjOqYy/wM4OC4WzUnqjLS/aOHTv5u1///
         dzR6xahvWbN4jak1dRkDHOYLqxG9XASJgNYz0ecGQHU638V00o+cXo2gQv0gZC9gORTE
         uuxaQfeit6BCu0hM1BNeeUWHTNHFVDKIHfzxbVZaDwbNYAtX7OkMprmbLZfEqHOvWOoC
         NC/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=jEPDubgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si10112325ybo.18.2020.08.24.03.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 03:02:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=jEPDubgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kA9JN-0007WL-1t
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 06:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1kA9J7-0007Gl-By
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 06:02:29 -0400
Received: from sonic308-56.consmr.mail.ne1.yahoo.com ([66.163.187.31]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1kA9J5-0006gf-5V
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 06:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598263345; bh=rICSU8tS4uiivMaxZCAivJPpGp3pDZ/J0xyG6NapHac=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=jEPDubghX3/reYdy1e9duPGottoFqz0iuh7c+uQ3T4YB0aCIugcwr+AVuRGuPLhQ1u3D1MpGJOt4uQ4dymloc2XT8j70Ofanjb/IdGkRjm1A3nJi/KnJ3ZlqMtQLoe08JwKyQwufcvHP2duq0YS9zV0LmlOqazdrOOeDdIq6V6wBBOq/WquYPC6ye6Dv4/C/1tFg6hv3dQ4XekXaFQUMSaUXNfOfcb0dU8+ro6mTyxnpJ7rZ3miIox2Hu6uro5HXTy5EGw25eBIAMqrb2//qiS6j4mNurjtcU4PPE/mhFbXBckkcxmSXjhfcFgNyBzvVrHG0F7JfvAwtr88wuIoUlQ==
X-YMail-OSG: Mn6CA54VM1m8MgBwT48PEJ7Y8ZBwQJ312bqmJJJSZs6nMDbGLM1F3pEO18KhGkt
 u29TscPr8TM7LcdmwsbqU9BYUUMn5PZrLkU8sACrG7ptymPEqelqvdjtvcE1Jq_DilzwDAVN6WyB
 uoUSpfbRKaL7LIp3MKV1StsN8rXKKY7E47QvlsM0Pf9055fxgqElXue_yy_2V5UQoerzQjkmRogK
 Seihq7B4kbWk.XnFC6tKrlnJgW8Sz1p8uW.l3XNSl.P1VAcxt9k_HSNoGrS2b.YNTVt7hpdVWEmt
 j3B9cB0J4Inr1n9RAsDxXzK08y73Tp_5QQ2Mx3wAhoeE5EuB0B1ALDZn0tnDHpwWlOqW_RHUqbAW
 6ZFArNVb8PShRgfC0KSjnuQjF8NrwCdgkLB1Nsf_wlU95hufzV3YJ8fG8osbC.hv33kskd2dqyUr
 euMaesA3IDEdHnC2FWDYWq0dpkPISGwpGZbvFtG98ByE8ZlW7IO8fC6hF2n2YN0jc6Ae7QNloEa7
 0xfjrJmaSHZgQ3wserjdJxy5fsCb1Wk3rl_mmRcVD8Q4AEvmWvLhHanszzn4cPCZ16Ji_EgEkZjT
 1V5oapQy0Y8Pe_sTwi4wms9zB200ZTBo46SEsF42YJii4LFW_Ekpw56uboFPSWJ7pc._GFSJC6rj
 J2R72HBMMDyDIynXcSPcs7peyPTwBtn0fzHWQTj0P2d.znDd6b0yGMJv7lZtSwAa8jSAJlKJ8WvO
 aRCj3DPMN1W7PAynROzROdOF8l5R2ZVYzM8NE1gDnzpPjC.tpD5XedzhgXSCRkHqxKw0AT._pXqP
 fuOhzoXUXECDRoUH9Ef.oTSIN.ONDcJdmA1Q9HBZ7LM_8q_vfCTgxOmSRMofG4mTdtmu0wyBRGZo
 CR18SlpS60xoJHYEL_mGBl1l5tAZeGHyzT.QCCMgY1ZcBzuA9tnNoCd4eowDY1u40mf_tjk4i6KV
 L06EN_5omxMMJCoqjLTsIbWAuFD6cTEVXJ8.Yrwvy63nBWOu9sQ0TFo_BNuX1jMRSP9OeE6fQxCC
 taEAUqydqxFl6j4vLKwbnh2R7tWENvtss76Y3wdaY0edXSUP4__eV_WSVUEsSA.FR60GZCYegkLQ
 11Ot9a78.Oncgn_jAXVy.zpsxjIQzOsX1iWztkVjAhKodWSSWzrz8A1KrqFNTLELyl4M4PGWs2KI
 MHd8yRpAzX5Oe74Efy_Myn9LQ7QK32VP.4SNSNd89jpa1OCNqZnnthwP1eChE29LbO01oruBkVRv
 Y8HUHoZ3C7bYJX9q8Aa8MzZZjQPc3_3cJQg_YRNng5XQaZJ7ISgT3mn_zXoZtwcbXuHuBljaiRqp
 iSbPd2FBQgHNifREUU2cLJxHENup1ACIB78.WubfsjTKWzkcoSOECt3bSEjyIeGCuMD_CKpCpI5s
 wKCAc1zPTMq9gmIu_IKnKo1w4oF1rd3SDVBnOApiAEPgYwH7RLvFIPoFYz7YT_ZDXgsR2UsOXWov
 Fj2oawu5sd7VjdLFNckE-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Mon, 24 Aug 2020 10:02:25 +0000
Date: Mon, 24 Aug 2020 10:02:21 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-arm <qemu-arm@nongnu.org>
Message-ID: <316503436.6530715.1598263341117@mail.yahoo.com>
In-Reply-To: <CAFEAcA_5a7aGpGMtVxjYjVnnDJNzXkQJwDW-846+TeNjTrAs_g@mail.gmail.com>
References: <554074341.6540650.1598262327794.ref@mail.yahoo.com>
 <554074341.6540650.1598262327794@mail.yahoo.com>
 <CAFEAcA_5a7aGpGMtVxjYjVnnDJNzXkQJwDW-846+TeNjTrAs_g@mail.gmail.com>
Subject: Re: [QEMU]send key event from monitor
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_6530714_1227833331.1598263341115"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135
 Safari/537.36
Received-SPF: pass client-ip=66.163.187.31;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic308-56.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 06:02:25
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
X-TUID: mltYSIPD2/hW

------=_Part_6530714_1227833331.1598263341115
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I get that, I also think that is the problem.How come the current console w=
orks then?=C2=A0I mean, thinking about it makes sense that qemu "sees" some=
thing to send to the bare-metal program, how to do it from the monitor?
Mircea Cociuba"To be or not to be, that is not a question, it's FF".=20

    On Monday, August 24, 2020, 12:56:11 PM GMT+3, Peter Maydell <peter.may=
dell@linaro.org> wrote: =20
=20
 On Mon, 24 Aug 2020 at 10:45, Mircea Cociuba <cociuba_mircea@yahoo.com> wr=
ote:
> Basicaly I have a running arm cortex m4 with FPU enabled, all good an' we=
ll.
> I wrote a small echo server, whatever I type I get back, simple, right?
> it works in the same console(I type 's', I get 's' back). Using the UART =
of the device.
>
> When connecting the monitor( I just added this: -monitor telnet:127.0.0.1=
:55555,server,nowait)
> using telnet, I use the sendkey command(It says in the monitor it emulate=
s sending keyboard events)
> The problem, when I send the command, the echo server does not get it(not=
 present in the UART register)

That's expected. The 'sendkey' command simulates sending
a *keyboard* event, ie it goes to an emulated keyboard.
That's different from a serial port/UART. Your setup has
no emulated keyboard in it, so the sendkey event will just
go nowhere, I think.

thanks
-- PMM

 =20
------=_Part_6530714_1227833331.1598263341115
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp203d3a4ayahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">I get that, I also think tha=
t is the problem.</div><div dir=3D"ltr" data-setdir=3D"false">How come the =
current console works then?&nbsp;</div><div dir=3D"ltr" data-setdir=3D"fals=
e">I mean, thinking about it makes sense that qemu "sees" something to send=
 to the bare-metal program, how to do it from the monitor?</div><div><br></=
div><div class=3D"ydp203d3a4asignature"><div class=3D"ydp203d3a4ayiv5090244=
957signature" id=3D"ydp203d3a4ayiv5090244957yui_3_16_0_ym19_1_1484384922228=
_11432" style=3D"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"ydp20=
3d3a4ayiv5090244957yui_3_16_0_ym19_1_1484384922228_11431"><font class=3D"yd=
p203d3a4ayiv5090244957Apple-style-span" face=3D"'times new roman', 'new yor=
k', times, serif" id=3D"ydp203d3a4ayiv5090244957yui_3_16_0_ym19_1_148438492=
2228_11430">Mircea Cociuba</font></i></div><div class=3D"ydp203d3a4ayiv5090=
244957signature" id=3D"ydp203d3a4ayiv5090244957yui_3_16_0_ym19_1_1484384922=
228_11432" style=3D"font-family:HelveticaNeue,;font-size:14px;"><i id=3D"yd=
p203d3a4ayiv5090244957yui_3_16_0_ym19_1_1484384922228_11474"><font class=3D=
"ydp203d3a4ayiv5090244957Apple-style-span" face=3D"'times new roman', 'new =
york', times, serif" id=3D"ydp203d3a4ayiv5090244957yui_3_16_0_ym19_1_148438=
4922228_11473">"To be or not to be, that is not a question, it's FF".</font=
></i></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydp68212cb2yahoo_quoted_8342086326" class=3D"ydp68=
212cb2yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Monday, August 24, 2020, 12:56:11 PM GMT+3, Peter Ma=
ydell &lt;peter.maydell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Mon, 24 Aug 2020 at 10:45, Mircea =
Cociuba &lt;<a shape=3D"rect" href=3D"mailto:cociuba_mircea@yahoo.com" rel=
=3D"nofollow" target=3D"_blank">cociuba_mircea@yahoo.com</a>&gt; wrote:<div=
 class=3D"ydp68212cb2yqt3683598957" id=3D"ydp68212cb2yqtfd42797"><br clear=
=3D"none">&gt; Basicaly I have a running arm cortex m4 with FPU enabled, al=
l good an' well.<br clear=3D"none">&gt; I wrote a small echo server, whatev=
er I type I get back, simple, right?<br clear=3D"none">&gt; it works in the=
 same console(I type 's', I get 's' back). Using the UART of the device.<br=
 clear=3D"none">&gt;<br clear=3D"none">&gt; When connecting the monitor( I =
just added this: -monitor telnet:127.0.0.1:55555,server,nowait)<br clear=3D=
"none">&gt; using telnet, I use the sendkey command(It says in the monitor =
it emulates sending keyboard events)<br clear=3D"none">&gt; The problem, wh=
en I send the command, the echo server does not get it(not present in the U=
ART register)</div><br clear=3D"none"><br clear=3D"none">That's expected. T=
he 'sendkey' command simulates sending<br clear=3D"none">a *keyboard* event=
, ie it goes to an emulated keyboard.<br clear=3D"none">That's different fr=
om a serial port/UART. Your setup has<br clear=3D"none">no emulated keyboar=
d in it, so the sendkey event will just<br clear=3D"none">go nowhere, I thi=
nk.<br clear=3D"none"><br clear=3D"none">thanks<br clear=3D"none">-- PMM<di=
v class=3D"ydp68212cb2yqt3683598957" id=3D"ydp68212cb2yqtfd36177"><br clear=
=3D"none"><br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_6530714_1227833331.1598263341115--
