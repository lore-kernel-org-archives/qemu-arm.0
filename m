Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp881394lfc;
        Fri, 12 Jun 2020 17:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdQO/VWE8JiPM25lBhr0rd+2Pbit2alrnEH3uDlflz6gp2zZzjxlCske5yDW/bB2z/Tf3E
X-Received: by 2002:a25:c101:: with SMTP id r1mr15625914ybf.112.1592007570319;
        Fri, 12 Jun 2020 17:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592007570; cv=none;
        d=google.com; s=arc-20160816;
        b=Zr+jBNTgruQn0yMnGOKA+e1atw6kbBvUpkIDXqDsy9EhtydkGSZa9AOLEYHWjgThPz
         736bOASb4T4B3RVPLystv3ku8X4ovs3sl2I9FUQ+ZJzWsUFGw2+MRDYCUA5Sge/f5G0M
         Di5/dJVt6GdBlMmmAV7OFVP1bWIAVMYDl66L/hEkDvUalgMVVm92Iq5/W2Ofs+qlauun
         g+kLL4rjP1QROwh1BXVOZunZHJqyDm3qnA9XveuOJaYVychMd93BJtjXpH0UjLDlGLGO
         y9HX0YiUY7aHaIyhTX66TufvNsVm4mUQiQgV1bsdV/+cPI3CqNFjdSbMzwLj8gFfzyiC
         UZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fePs81fA+XH2lGKybDVVekfZVoP1uy6wDnoFXdUsDDw=;
        b=CIWWeLxGyzw6QIIMztb6hy1s0av6QjZeFz1QlfV8GrGxR2N/OAvCfSKGb18nX5Sjcm
         5ac1sRcswChLxqkUzHlSD7jK+ovvK92Q89GluUn1KIWQR7221rtPaAFrQLfDOQ15Bgol
         RDG2W5wKYnPHBsrUlC7YPL3nNN2+Rc2bKKnJesWOiHjjPdYMJsF5l/eT3+UfTfU+/w/B
         F3edrZeaGQA0K3Orhs7UR2M+ppoMHMyFEqhAlwgIjBUIzlgo8nZucA3DcQTde0wl16KZ
         eATU6bZcTXocyTKxmekN/9l9qCmV4RAu6HCz6Ndn2TcpDh1CIi8ZKIXzpQq5wFSagFCZ
         LP5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=CinAQnau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si6393225ybl.126.2020.06.12.17.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jun 2020 17:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=CinAQnau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjttR-0002Xi-O7
	for alex.bennee@linaro.org; Fri, 12 Jun 2020 20:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jjttL-0002XT-IV
 for qemu-arm@nongnu.org; Fri, 12 Jun 2020 20:19:23 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:42710)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jjttJ-0002Ks-EH
 for qemu-arm@nongnu.org; Fri, 12 Jun 2020 20:19:23 -0400
Received: by mail-ua1-x929.google.com with SMTP id c15so3797452uar.9
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2020 17:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fePs81fA+XH2lGKybDVVekfZVoP1uy6wDnoFXdUsDDw=;
 b=CinAQnauJYNORGoTD1BsTNa3j/4gsBkChCiWeuB/0VgO29M+ie3EvSIATS6kDMMxTO
 aeGr7kDX3zt7XIGdUdQ9fyhfrDxrCld2tZk5W82ouMwEucjSfintecmYWvhzoIUs2/GR
 keDhEIeorMFODMGlilIT/ws04Tc9/b+yIU+zgp6zJ1tdyCkKiFKyeGHipKOQulY2OoyT
 hHjnLjxNE4IrXNLEn+Nl74gqIDwy8cr8Gzwg4Uthq4vKsVRTfKeZT5HD45g3419gqoUw
 Q3QZbuQmkliIadgaAwMDy0K2dHkgeSo4GpkS8+USudCCxOgvcM8FpAGGNrTS0T5oAzlW
 jE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fePs81fA+XH2lGKybDVVekfZVoP1uy6wDnoFXdUsDDw=;
 b=MxcjFUPHmVc+TQGwh95088jb82xpKUmhnj45DBYf9nvCxO1DhwdGnn+G2hboVeg+az
 bIQKhSk95jsnmCy5Ct5BTIiqh9kUH5fT7sZJwYUZ3Fky4zPC2/I+lwxiqHc9PiDEY1Xo
 dckM8G1HGKPYCwjHhvsPHRBtxI6ZoyF3VGhsbai5fbnLk+kV0OCPzkP3Shx+UBnWeI8I
 VKKMGte7saA+1h7HOYNhvGV8fdxHDnPe8z2sUP+8VBlvWzHgXuQSpwTAmm+EoCerfTNJ
 AylALGj55rhWPnE1qyWA2ClVOJ9IDbUFRflzHnwdpUH0BhvwE117b/iQWjsFOMP/14Rf
 SF2A==
X-Gm-Message-State: AOAM533hYWD0jG+6pumlgngoOdzqTMG61xBlpwBIlYFwF4R5gXm+GglL
 GwyHXg7x1kFEKnSc5gSbbNezD3fXnGDvpN+qkifOTQ==
X-Received: by 2002:ab0:6ec6:: with SMTP id c6mr14608973uav.7.1592007554624;
 Fri, 12 Jun 2020 17:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <20200611223016.259837-12-hskinnemoen@google.com>
In-Reply-To: <20200611223016.259837-12-hskinnemoen@google.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 12 Jun 2020 17:19:03 -0700
Message-ID: <CAFQmdRbMb5HBvhV02rd8beC4KtxyMjLb0SXrmgRSSDY3eG_N2A@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000c6637705a7ec2424"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x929.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 897fuCmcchac

--000000000000c6637705a7ec2424
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 11, 2020 at 3:30 PM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> @@ -57,18 +72,30 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState
> *machine)
>  static void npcm750_evb_init(MachineState *machine)
>  {
>      NPCM7xxState *soc;
> +    DriveInfo *dinfo;
>
>      soc = npcm7xx_create_soc(machine);
>
> +    dinfo = drive_get(IF_MTD, 0, 0);
> +    if (dinfo) {
> +        npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", dinfo);
>

Btw, this does not actually work. I initially tested it with the same flash
chip as gsj, which seems to work, but after switching to the Winbond model
(as per the npcm750 evb schematics) it looks like it reads incorrect data
in DIO mode.

While trying to figure out what's going wrong, I stumbled across this patch:

https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg01586.html

which I don't understand. It looks like the winbond model wants one dummy
cycle after the address, since dummy cycles are modeled as byte transfers.
This doesn't seem to match the data sheet, which specifies 4 dummy cycles
in DIO mode (which is actually a special command byte transferred across
two data lines).

If the "continuous read mode command" is actually modeled as a single byte,
then it makes sense because that works out to 4 dummy cycles in DIO mode.
However, I don't understand how the flash controller model is supposed to
detect this situation, and I don't see any flash controller models that
support sending anything but dummy _bits_ between the address and data
phases.

Could you please clarify how this is supposed to work? Are there any
existing machines that use a w25 chip in DIO mode?

Havard

--000000000000c6637705a7ec2424
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 11, 2020 at 3:30 PM Havard Sk=
innemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@google.c=
om</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
@@ -57,18 +72,30 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *m=
achine)<br>
=C2=A0static void npcm750_evb_init(MachineState *machine)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxState *soc;<br>
+=C2=A0 =C2=A0 DriveInfo *dinfo;<br>
<br>
=C2=A0 =C2=A0 =C2=A0soc =3D npcm7xx_create_soc(machine);<br>
<br>
+=C2=A0 =C2=A0 dinfo =3D drive_get(IF_MTD, 0, 0);<br>
+=C2=A0 =C2=A0 if (dinfo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[0], 0, =
&quot;w25q256&quot;, dinfo);<br></blockquote><div><br></div><div>Btw, this =
does not actually work. I initially tested it with the same flash chip as g=
sj, which seems to work, but after switching to the=C2=A0Winbond model (as =
per the npcm750 evb schematics) it looks like it reads incorrect data in DI=
O mode.</div><div><br></div><div>While trying to figure out what&#39;s goin=
g wrong, I stumbled across this patch:</div><div><br></div><div><a href=3D"=
https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg01586.html">https:=
//lists.gnu.org/archive/html/qemu-devel/2016-07/msg01586.html</a></div><div=
><br></div><div>which I don&#39;t understand. It looks like the winbond mod=
el wants one dummy cycle after the address, since dummy cycles are modeled =
as byte transfers. This doesn&#39;t seem to match the data sheet, which spe=
cifies 4 dummy cycles in DIO mode (which is actually a special command byte=
 transferred across two data lines).</div><div><br></div><div>If the &quot;=
continuous read mode command&quot; is actually modeled as a single byte, th=
en it makes sense because that works out to 4 dummy cycles in DIO mode. How=
ever, I don&#39;t understand how the flash controller model is supposed to =
detect this situation, and I don&#39;t see any flash controller models that=
 support sending anything but dummy _bits_ between the address and data pha=
ses.</div><div><br></div><div>Could you please clarify how this is supposed=
 to work? Are there any existing machines that use a w25 chip in DIO mode?<=
/div><div><br></div><div>Havard</div></div></div>

--000000000000c6637705a7ec2424--
