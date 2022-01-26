Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3443073lfk;
        Wed, 26 Jan 2022 07:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx46j3DiLT6EtiQlc9yJW3g3VUVhWBrtUdijJMD9f1DfF8IvP3AM1u4DvWXPr4bbjshWBnp
X-Received: by 2002:a92:ca47:: with SMTP id q7mr14757683ilo.236.1643212123378;
        Wed, 26 Jan 2022 07:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643212123; cv=none;
        d=google.com; s=arc-20160816;
        b=wM9hkcBzG/TGkfKdQFMVwhOOD6rVUnD3kx6JXJk4XTnzsnMScBm7QCIbv1f7iIgyIp
         9HDmBGqYA1FqRJ9dEAgIJX47F+v5mEUNatABB33tsqLNnOrSN/oJW8/VpVyvdj4Nt91u
         /ugb+eRQm1hh3WcV2U0epnXLlp9Sz/PN84ASJiWoMau81kvub/wDhLhiHNBllW7XAxkc
         J91m4SY3aWRyKc2HJuv8UkxtD4i/qjTNAlooLahl1MEvx7Z69L9oII/KrDcmLWoeqWWN
         6Vad8C5Ij+cs22JD1h73RyFQehFrEhYPlpddsZqBmF+KG7gE+oUc9i4zBNt4/0ofLvHk
         27PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b2OaMKlqJMcqNCG9nYd1C7PGNQe2mdlHd9ERFxOKQdA=;
        b=ArM/bsSLTPCWYUr28rC4U0e0XYobOvTeMyEH3a/ZTy1cSr8knpEof97brp5dnxRCf/
         8toCzEUrBPMNU6pGVadomiE9Otwv8LZbVPP4YE6uGoV0gRQkADfWBknC57P3a7/UmnuP
         urPEDKFpvFOSbvvN114zCrhrwnqgLCAlnbouWHSe8z+Gpv/s5dlWqPyEkqWGWfVkrE7I
         DW6d6vwQ8L2yD+wkdKTgr/GHw+YIOj+Ek2tsDq+r5uyDeXrcaE5uGDlDvGwovuPzjV08
         9nPCRD6lDJkbrGKzrAphj9eElfOcKPTKcYHXRaODyB25Y9kQcvzdYkuH0lxlNkNI2Jfv
         OHsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4luylvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si15791992ilv.0.2022.01.26.07.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jan 2022 07:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4luylvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCkXK-0000f1-O3
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 10:48:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1nCkXA-0000ee-H5; Wed, 26 Jan 2022 10:48:32 -0500
Received: from [2607:f8b0:4864:20::832] (port=43923
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1nCkX8-0005KE-OH; Wed, 26 Jan 2022 10:48:31 -0500
Received: by mail-qt1-x832.google.com with SMTP id k14so3424qtq.10;
 Wed, 26 Jan 2022 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b2OaMKlqJMcqNCG9nYd1C7PGNQe2mdlHd9ERFxOKQdA=;
 b=V4luylvYTylYzPHJPeFoZSlhMS31C7Uowue3e/nGDZOu4Mu4vkHVvewYi2G0R4PQrr
 b+cpih0AbuMiIKu8qNARTqi4WWYLJp0DdYsGTGwQIbwV62lvK2BgPLUCroCGt97D6GER
 DaNkRF8U8ysSMs+XH4uAbcGIEMTtdDYmO7MICbCrOvJxs0k5gpHyvGer7e7SHiGmkR1e
 09604LeqSmScRghy40H8/Y2NOXaWMzC47J8sEmJ+5aIxxITBvC03o/83UOdtLGMLJbOf
 8uQOORjpBwiATLfaliF83HzALV2RCCnnOeh377MaaN3yFzGOSxOsimENgNxCJwU9NUI5
 Qebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b2OaMKlqJMcqNCG9nYd1C7PGNQe2mdlHd9ERFxOKQdA=;
 b=P/lNwRd7ZrL+3qova7UL0TYfzkdTfothHxVpri5ov6nJ7cYOS5UBvRltv02SM53eYM
 Laq8T+IsT7jcgyb+9oeIL3+hUW/+wxxtbZc7TtAxCFPhJh55/10kbSK+JJqxyM2rLWtl
 HXOXv+BpgN74rAQzKlRzF9CtKabUr+5ardeFGnJuLyIipqoQCZRErIFr29UNaxHj0JRE
 j0wJRchciCKGnVkOmxnDLCfYZEg39D3bol2JrVJqZme26ox4CH1t1XCGrwgxyIJldKEg
 FD69+Id8tPgHadvEWVHr/Pb1D8fjby2DqUnQTZdHcEt0d9B9ICXz50Vc3NJvADlDdAFh
 Mkww==
X-Gm-Message-State: AOAM531syr9RH97FjFXDpsghgNPQy4ZyfvDlAX69Ilf4nLdnEE+3c0py
 ouzvh00rors18kMIHJ7AqExf83LV3AEpEwPvI4E=
X-Received: by 2002:ac8:5b93:: with SMTP id a19mr20881307qta.224.1643212107939; 
 Wed, 26 Jan 2022 07:48:27 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1kgpr+EoecEVdXuX+sPL-27PKPm-9J-E3_DwaHwe12GA@mail.gmail.com>
 <c239b30e-fb83-25d1-2649-a5285f97f9ad@amsat.org>
 <CAP4GjT2wU_-N5jTwNWdmOL_5gVOwXh9sFK-=J=JR2xEYVmK6=w@mail.gmail.com>
 <a451141e-e5b6-6dce-270c-458bd3a32cbc@amsat.org>
In-Reply-To: <a451141e-e5b6-6dce-270c-458bd3a32cbc@amsat.org>
From: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Date: Wed, 26 Jan 2022 16:48:16 +0100
Message-ID: <CAP4GjT0DrW+1xdfiNHJdiGu83Mk3xP+MMwN9FE0Q8oVifBAm-w@mail.gmail.com>
Subject: Re: Ast2600 emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000fc025e05d67e212b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=abhijeetinamdar3005@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k99Z//84VWHg

--000000000000fc025e05d67e212b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How do we implement Hardware Semaphore (HSEM) in QEMU for this type?

Any suggestions.

BR.
Abhijeet.

On Wed, 15 Dec, 2021, 23:20 Philippe Mathieu-Daud=C3=A9, <f4bug@amsat.org> =
wrote:

> On 12/15/21 23:10, abhijeet inamdar wrote:
> > Thanks, I'll check it out.
> >
> > Can we do full system mode or qemu-sytem-arm ?
>
> You should be able to do full system emulation (qemu-system-arm)
> with 2 Cortex-A7 cores and 1 Cortex-M3 core.
>
> >
> > BR.
> > Abhijeet
> >
> > On Wed, 15 Dec, 2021, 22:38 Philippe Mathieu-Daud=C3=A9, <f4bug@amsat.o=
rg
> > <mailto:f4bug@amsat.org>> wrote:
> >
> >     On 12/15/21 22:24, abhijeet inamdar wrote:
> >     > Hi,
> >     >
> >     > I was going through the aspeed ast2600(not evb) it has Dual-core
> >     Arm A7
> >     > and embedded M3. How can extend it/implementation in the existing
> one.
> >     > 1) Is it possible ?
> >
> >     Yes.
> >
> >     > 2) How can I do it?
> >
> >     Look at the Xilinx ZynqMP ZCU102 board (4xA53s and 2xR5Fs):
> >     hw/arm/xlnx-zcu102.c
> >
>

--000000000000fc025e05d67e212b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">How do we implement Hardware Semaphore (HSEM) in QEMU for=
 this type?<div dir=3D"auto"><br></div><div dir=3D"auto">Any suggestions.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">BR.</div><div dir=3D"auto=
">Abhijeet.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, 15 Dec, 2021, 23:20 Philippe Mathieu-Daud=C3=A9, &=
lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 12/15/21 23:10, abhijeet inamdar wrote=
:<br>
&gt; Thanks, I&#39;ll check it out.=C2=A0<br>
&gt; <br>
&gt; Can we do full system mode or qemu-sytem-arm ?<br>
<br>
You should be able to do full system emulation (qemu-system-arm)<br>
with 2 Cortex-A7 cores and 1 Cortex-M3 core.<br>
<br>
&gt; <br>
&gt; BR.<br>
&gt; Abhijeet<br>
&gt; <br>
&gt; On Wed, 15 Dec, 2021, 22:38 Philippe Mathieu-Daud=C3=A9, &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsa=
t.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D=
"noreferrer">f4bug@amsat.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 12/15/21 22:24, abhijeet inamdar wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I was going through the aspeed ast2600(not evb=
) it has Dual-core<br>
&gt;=C2=A0 =C2=A0 =C2=A0Arm A7<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and embedded M3. How can extend it/implementat=
ion in the existing one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1) Is it possible ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2) How can I do it?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Look at the Xilinx ZynqMP ZCU102 board (4xA53s and =
2xR5Fs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0hw/arm/xlnx-zcu102.c<br>
&gt; <br>
</blockquote></div>

--000000000000fc025e05d67e212b--
