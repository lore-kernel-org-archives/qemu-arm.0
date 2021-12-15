Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp224130lfj;
        Wed, 15 Dec 2021 14:11:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdKEzj/sPwB21RrOvn8qdFre4lFeuOpQ8I6qPybAeH846EQrMiMm+Fzk1XPixG9iuHG1C5
X-Received: by 2002:a25:ab42:: with SMTP id u60mr8350520ybi.482.1639606280710;
        Wed, 15 Dec 2021 14:11:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639606280; cv=none;
        d=google.com; s=arc-20160816;
        b=WPCnhf2u0fvjXSagYhhYbk/rnMaJ1Yoracuj9qMzjlGDCRInWPauyWeMYVb85zMm2a
         05NuASVsZw4nb5klax6h315rznQDTZUcgsBvZJfju4p0xkifz9d3v2ekWEXQyRWi2WqM
         WFfBl2yg9uiyLVHD4JIo5y4Stwzbck02oZz7VlpxTG1S7nr/7xL2acBW9v4LDPRXTBYE
         fMXLcaym5y1xklthUMAITMgJVFLkaSQG0MIl66J5Abf28OGScJHRiQygiX6U+WYBYK1O
         PFjb014hV1oe866wFSkH+WrdSu8xhryDEv9SQmwPBV2qYihWn+3U42BS3g2WDNHQk7Ke
         2B+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BacwN/hFDQViGWrZACyelCgPB0sTfoPUE8zZ4/Q2phY=;
        b=K/e7sL9Tq4ArYW8RRV3nWEaRpfnPK/GFAICOZBP9l1ErToqhSEtOtyVg7bdpU8w6qu
         xYBRE71pr58Zn3g2vumy4ujRGq6tqD/XhauXUNc4PcmHe2DHDFG+jgl7YfDBenttbxLD
         oWVAhqkNcb3KBl4NuJ6uNiltXKuk79YAtPe0d8Wwwi9LeHIwJSCTS3pliwp/iOHfu5GW
         9irH0IxMz0ZJhgs1UsBZoy8iE37jjev3MH5PENQRmfCKTEk/Y+y04R9HayWoFyrrD3um
         yA05Hq30J0j79rRQ3aZvQ7wSGyjrGiywQCydLQpzfSM9tI8MH6mlR2BQv1uoVEaCYeLV
         PJ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=BMPi9yS8;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si3175638ybb.508.2021.12.15.14.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 14:11:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=BMPi9yS8;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxcUa-0005fX-40
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 17:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mxcTd-0004hZ-4h; Wed, 15 Dec 2021 17:10:21 -0500
Received: from [2607:f8b0:4864:20::82b] (port=37843
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mxcTY-0007Rp-VE; Wed, 15 Dec 2021 17:10:19 -0500
Received: by mail-qt1-x82b.google.com with SMTP id f20so23463733qtb.4;
 Wed, 15 Dec 2021 14:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BacwN/hFDQViGWrZACyelCgPB0sTfoPUE8zZ4/Q2phY=;
 b=BMPi9yS8WMXfxu566hbObTF61qD/7mAEUw4ir6KrrXAXP9a2GcYZlHDHZ2cku5qHWR
 1K7drsw59P6iF6UnA+Xxa1JsXA9MTThUlaIEpgwGHSVz7z7mC3IXJ2p6LyIA6DboFxBl
 HM5y5LtGE/2YgUkkNw7awyZGA7u6lKTRGW7s/nPMu4IHRAQ++desCmrraGn6E70R4F+/
 gY4KsaHyH6Ylro6QvQybk9erjV1bO6YC+4JF7+BPVIJQEPNgHjRg80N+DCppnd4yQ8km
 I36ZxpFFKuKVnk+RefrUp1uhXC7k+W/Wb3LM0rZ7122xLNiS0RdbVr4TBIJ3SmpBK2cN
 x45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BacwN/hFDQViGWrZACyelCgPB0sTfoPUE8zZ4/Q2phY=;
 b=25h9i0IhVEpcr1fWQM3yKoM46Sv2J3ddNRYY34nGuL3xdOCsc6YfoLMPArOMW3FcdD
 XeZoDnV6/A2I9RczEK1bu1ObphoZoLXXI4WTeSVSzq3aO92hyeVXkYi28cZjqCJ854wo
 wIdsdmP5popYTtrAj98wzfb+Ofu5hYAVL9NGv/EX/6x+wH5LpQzZ7CRXeEuw2ZmdQXkN
 KidoZlmcQ2UnWlmoP3G/YUfF37+wKSO7uzYeJEUSZlKOjMnQQwvNP/gaXdvD2sV7jJdg
 htJLiriivzxF86PFwZRzPdgBHBCxXp0mmvhxU8qmcNYrvSF95Q93ESWia+hqpgnY+bbQ
 Xf6g==
X-Gm-Message-State: AOAM533mIRdwLDK1k1sL8P3Tn38DYp3urMf34DaRTgzEoOGBvCyRcMoh
 JUMK0z4MiLRXCMFPDbXNs377DeYEb2XRlbA66oQ=
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr14403111qta.442.1639606212201; 
 Wed, 15 Dec 2021 14:10:12 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1kgpr+EoecEVdXuX+sPL-27PKPm-9J-E3_DwaHwe12GA@mail.gmail.com>
 <c239b30e-fb83-25d1-2649-a5285f97f9ad@amsat.org>
In-Reply-To: <c239b30e-fb83-25d1-2649-a5285f97f9ad@amsat.org>
From: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Date: Wed, 15 Dec 2021 23:10:01 +0100
Message-ID: <CAP4GjT2wU_-N5jTwNWdmOL_5gVOwXh9sFK-=J=JR2xEYVmK6=w@mail.gmail.com>
Subject: Re: Ast2600 emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000d99fcd05d33691eb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=abhijeetinamdar3005@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-discuss" <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SyvgK61txfb4

--000000000000d99fcd05d33691eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I'll check it out.

Can we do full system mode or qemu-sytem-arm ?

BR.
Abhijeet

On Wed, 15 Dec, 2021, 22:38 Philippe Mathieu-Daud=C3=A9, <f4bug@amsat.org> =
wrote:

> On 12/15/21 22:24, abhijeet inamdar wrote:
> > Hi,
> >
> > I was going through the aspeed ast2600(not evb) it has Dual-core Arm A7
> > and embedded M3. How can extend it/implementation in the existing one.
> > 1) Is it possible ?
>
> Yes.
>
> > 2) How can I do it?
>
> Look at the Xilinx ZynqMP ZCU102 board (4xA53s and 2xR5Fs):
> hw/arm/xlnx-zcu102.c
>

--000000000000d99fcd05d33691eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll check it out.=C2=A0<div dir=3D"auto"><br=
></div><div dir=3D"auto">Can we do full system mode or qemu-sytem-arm ?=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">BR.</div><div dir=3D=
"auto">Abhijeet</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 15 Dec, 2021, 22:38 Philippe Mathieu-Daud=C3=
=A9, &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On 12/15/21 22:24, abhijeet inamdar=
 wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I was going through the aspeed ast2600(not evb) it has Dual-core Arm A=
7<br>
&gt; and embedded M3. How can extend it/implementation in the existing one.=
<br>
&gt; 1) Is it possible ?<br>
<br>
Yes.<br>
<br>
&gt; 2) How can I do it?<br>
<br>
Look at the Xilinx ZynqMP ZCU102 board (4xA53s and 2xR5Fs):<br>
hw/arm/xlnx-zcu102.c<br>
</blockquote></div>

--000000000000d99fcd05d33691eb--
