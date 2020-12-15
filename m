Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3687029lfq;
        Tue, 15 Dec 2020 09:14:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxit4HkiULzm1E4HVkU8zYMBIOp7dICRy6eCsrKhASs4YyMyQNlqkoJvp0xOxMzNRZ1hYNv
X-Received: by 2002:a25:4b42:: with SMTP id y63mr41640374yba.10.1608052464641;
        Tue, 15 Dec 2020 09:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608052464; cv=none;
        d=google.com; s=arc-20160816;
        b=HYr3IwuJipgkXKwNuaOBGqTQ/Imkf3/0vmDlE7Yb76VFh7OG9JClysHhXXBFbzyW4U
         ccWqOYXIpLFjqTyE3AYdnRZtZidmyi+EuTgFls2qDhommZSS33u1qm68wHDDxEn3RkB4
         OhMzYfDYT23lUnnmG0MJ0xw0twXFuWFvTadmpayoYYziydrC28olPk1y+7eCQuy/wlAx
         6OK4xKg1xDRprghvz1QxLwey1YeRabZUU7RCK5moYq56SYo7GqK/g6jv+WerdZCRF8Af
         SmFGoNLWpgSel8+nsHs9jptuGRrZniWdixanUmns+2EU74MA6Y+cGQc3+o58oanSpxEk
         3s3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xwb33KDVUeuxveR0XnLxUJImmBOS1vIqA9nH4lvQrSc=;
        b=W/LHmagevSxHmyRwY38blly8OVtb3biyeVmo1QhsCMeOHbPejhPbw7aU2oW1NGxQI7
         JiX43Au3VW27QaSBFpNgz7RJT66EkXf11Hzp79ugRlNhBi5MKPgvQpRDozyqfchr15FW
         JX1yyGpOSXEnvcdDE8MBMnLGoOE5b3/8o7CnO64llt5qlilJJsNkz+NO6WobSHbJVMVY
         P62h2zEAB2rPN6P98L9nGsY/+uH2vKmVG2MeEjI2qccU98CdiVXJXh9anufZZ4Y2ssRt
         SmKiF6HjDcoiCEFlVmcdRYaCiZFwG2uQ8tsiWdH1LsGiGZAf2uakvMGRNiyqLtv0T0Pf
         nN1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="vQ/t2Vb4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si4605142ybr.8.2020.12.15.09.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 09:14:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="vQ/t2Vb4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpDu3-00024U-VY
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 12:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpDtu-00023o-F4
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 12:14:14 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpDts-0003p3-9s
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 12:14:14 -0500
Received: by mail-lf1-x141.google.com with SMTP id a9so41317758lfh.2
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 09:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwb33KDVUeuxveR0XnLxUJImmBOS1vIqA9nH4lvQrSc=;
 b=vQ/t2Vb4oR5liQ/356OFh7mHEPmTHn6pKRy2FGO9pLe27zfMY/thKpS9d10JdiiZef
 yVa9WF/WvDt1NHFF3Iu7yC1arpWp4JEmax7vzvVMs1TtUMQzgwFlF/0YfgmXYeFFoyQL
 xn58VXn908ooRkIyNHlsMqGQGIw/gx9UZNA/fbhPUctupwP2W3RPt26qucfmlLftPwv/
 WeDUa7Dz2vI6ELyOkwvtmL9aRHCkeIF/vVkeu3+wCbrsW8fwk1J0jpIapKKFrtVCrbin
 HmaVBImgKWaaU0QTc8V1oJZJsyG593OMRal0eNrf+AolKPhn+oxtZnoFQWKI1kHE6OY9
 OiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwb33KDVUeuxveR0XnLxUJImmBOS1vIqA9nH4lvQrSc=;
 b=LCsUQfLv3wbnX5REtanFf4F47pakGNrDimz+9qCGQIOcO4UPwvbTjIH9SOZu/mJc8H
 /xobF7PgWBEHCuzttpXqIGLZbXFOTWKUXUA85aVRk76ytMZEk88L2+zMINWufjoEC/4S
 8DTJy9/HICelkqHLYfBV3fcLpLBZNDGp/F65IJAPt1Lgcn6+TcvrKR49PVMFU7kiFMas
 moEQ/RvJWPTygAj2DTNkQ6Rtz0l2e8oNUDiTq0GWKC8tFep/nkLWPS4KyU9LJUK+W5LX
 N8NNBQlKbXY2kRorgv/FAG9mfm9L4z+pbwUxRzBLd+sogwDTKE5mmfxaJnWZD+M33qgV
 +DDQ==
X-Gm-Message-State: AOAM533Q6MU8FXbPi/61tJ1p2TS0kQpU4VgRjROqb9UH+p2h29QrRpyc
 6MV5ri7diwfrcNlmmzuxBDGkXZ88EM/7ifGXUAG9hg==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr12453800ljj.77.1608052450274; 
 Tue, 15 Dec 2020 09:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <b356d726-4b6c-ab4b-237a-c31dd658c5b2@amsat.org>
In-Reply-To: <b356d726-4b6c-ab4b-237a-c31dd658c5b2@amsat.org>
Date: Tue, 15 Dec 2020 09:13:58 -0800
Message-ID: <CAGcCb13sgLS+kRwtXoSKrVNxyfjbH_9-BwgJfo4rS7eE-BMoUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Additional NPCM7xx devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000014b6cb05b683e341"
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, minyard@acm.org,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 f4bug@armsat.org, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: CHD5EJJeXYbL

--00000000000014b6cb05b683e341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip! I'll use that in the future.

Best,

Hao

On Tue, Dec 15, 2020 at 7:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 12/15/20 1:13 AM, Hao Wu via wrote:
> > This patch series include a few more NPCM7XX devices including
> >
> > - Analog Digital Converter (ADC)
> > - Pulse Width Modulation (PWM)
> >
> > We also modified the CLK module to generate clock values using
> qdev_clock.
> > These clocks are used to determine various clocks in NPCM7XX devices.
> >
> > Thank you for your review.
>
> The list is still rewriting your author ident.
>
> Maybe try 'git-format-patch --from' next time to force it
> on each patch?
>
> Regards,
>
> Phil.
>

--00000000000014b6cb05b683e341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the tip! I&#39;ll use that in the future.<br><d=
iv><br></div><div>Best,</div><div><br></div><div>Hao</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 15, 2=
020 at 7:17 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 12/15/20 1:13 AM, Hao Wu via wrote:<br>
&gt; This patch series include a few more NPCM7XX devices including<br>
&gt; <br>
&gt; - Analog Digital Converter (ADC)<br>
&gt; - Pulse Width Modulation (PWM)<br>
&gt; <br>
&gt; We also modified the CLK module to generate clock values using qdev_cl=
ock.<br>
&gt; These clocks are used to determine various clocks in NPCM7XX devices.<=
br>
&gt; <br>
&gt; Thank you for your review.<br>
<br>
The list is still rewriting your author ident.<br>
<br>
Maybe try &#39;git-format-patch --from&#39; next time to force it<br>
on each patch?<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div>

--00000000000014b6cb05b683e341--
