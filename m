Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp495429lfk;
        Thu, 21 Apr 2022 09:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfs5dh7b3YjB71XQ4JCmPGrMOB3N+bnH8Wm9GTzWlgfYKcbmjV6yl/UO4qZbOiEdRf4D9y
X-Received: by 2002:a5b:2c3:0:b0:645:6565:fafa with SMTP id h3-20020a5b02c3000000b006456565fafamr612800ybp.323.1650559964558;
        Thu, 21 Apr 2022 09:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650559964; cv=none;
        d=google.com; s=arc-20160816;
        b=fjy9AZtpfmqqLYoK4StWBiE1DEw5aPhGaHbPsXuQEyBRX+i39mXkeMLWPvpPK83JIy
         16MG8HtvBAXwQviB4xU288Vx32/tOjOA2FXP9Dz6EBCC36K9zxDFMqoemimKxfbifqt9
         r2D/r0x2wIlHcCw71babHg0mnOX74Btyt482uOmJacwpaCsvln9WPbzqoj/0NjFBU3E3
         jz28XOttwQm15wkIsdXRisD9bZWzZIs80zRAgk0rJtl9fjmM5pLvk1Vz749cFiXSwhRE
         e8M+wAU9QwnSxztjNr0Z7EKKLyY8ylMIwwOkkyMQtoTgamrJmGp5jk6DhLXTGSkHL11q
         4eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=myhB9v39Fx3HMVXa3izErRcQ764iEzzk1xHStiXalFY=;
        b=iHDDMO9UCyFQ6491/4v7UOe0AjR9E17Qp5VJYZdHTZBGpOaodIgR3a4jbOGPYl3Zba
         AUatLdg1DZ9b3e6ii8jt1f4bmot7U9CZ+Qr9LO16x+aLoqjjHfL9eaGK8ARhlOJYSNju
         pFeMMGkzaZ46ewr4fvD1oW2o5dWlUeW8slrgmFF2mBt7pCROk44KZ3ewaXsx9XE86Ifz
         MjBohO9+0w9ZRqtpIkyvTF0WBsTQOr2olH5t5qXzYoiCVaFJlw6MnJPymRYv37o2HfvN
         YBG4/J/fRtwCgeSsZB2gni5b5gSOZnQbWim+aUakuQpZLtTnLN96lROPaszKfn6/FwUR
         x12w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RmqrpA6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u66-20020a25ab48000000b006453b488a42si3651204ybi.219.2022.04.21.09.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 09:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RmqrpA6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nha2t-0007P8-UO
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 12:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nhZgA-0008TR-89
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:29:14 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nhZg8-0000sF-J1
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:29:13 -0400
Received: by mail-qt1-x82b.google.com with SMTP id bb21so3655754qtb.3
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=myhB9v39Fx3HMVXa3izErRcQ764iEzzk1xHStiXalFY=;
 b=RmqrpA6wGye7d96lqVuEsuYBvVo9K15POMg15OLzPRPNINOa2B8Upl8Pnkdluz7UzV
 BKT0RqULxHPIEiiHRkqI/G66T/BkwMf73zC/2Brp1D8OTBOl52Ld+d9bp9DVsXhAcTDG
 O1tvhrMCTc/NZUQ3+O3Csr2tLXNEtgCF8ST05xgXwOkhASwekKcUtyvJEiFMZxW3CmIO
 qr/zUQvadZuveghbyl1kNnbyAEAgBf42FwPNgEsOHIpsSpcsMW6p+SyFGCWXD9PsFovc
 goDoapeLJ3qYtvJRyVTyE3BEJgDkKFumJy/fUtBx3IPPj11m7DBa1+LEFewLh4JznBEd
 mdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=myhB9v39Fx3HMVXa3izErRcQ764iEzzk1xHStiXalFY=;
 b=3v0rSzNyjXlNrZc8E5ACY2+VfBOekQN5jGVl2xc+eY3iOrDyjGEudsuUDn6//X7/ga
 U1ucVyfvxj4/hjnJuv8Fst2UPXfJY32h/yx8fjJj+A9z8l17J7MaW5iBWpwQV2VXFAQd
 1BS96xJH/bC5lnW+chMpRGeMN7tUICLN2A1dzD/gPYTT9d3MiCV3KmSEVTtIFInxCzX2
 tExa7+UxtiUfWkGuVzcJoj0F5IHLBJ1Draedarmrbr4oaXXXhHJcz+966Z/rxQinDuM1
 d+i54KDbJlDKXq23Rv6b7yfSrCRgcMGvQ5s1RtmvkY6neXgjp4iKHdRgKndNruo56YIh
 wRMw==
X-Gm-Message-State: AOAM532JR782T79VOUNfPBuuAictxSIwPrh6lYs0WRq35XS4o0g+3G5j
 Xg9CbjpasOdeZQzQbqyxkDNvPTkF91fhgAhDhekf8Q==
X-Received: by 2002:a05:622a:191:b0:2f1:ffe6:283c with SMTP id
 s17-20020a05622a019100b002f1ffe6283cmr185502qtw.557.1650558549952; Thu, 21
 Apr 2022 09:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
In-Reply-To: <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 21 Apr 2022 09:28:58 -0700
Message-ID: <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Patrick Venture <venture@google.com>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Havard Skinnemoen <hskinnemoen@google.com>, 
 IV00 Uri Trichter <Uri.Trichter@nuvoton.com>, Vishal.Soni@microsoft.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="0000000000000d58ad05dd2c9c7e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=wuhaotsh@google.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8OjWjJwm5up

--0000000000000d58ad05dd2c9c7e
Content-Type: text/plain; charset="UTF-8"

Thanks for all the comments you gave! I'll go over and address them
recently.

For this question, The actual CPU should be cortex A35. However, I don't see
them supported in QEMU. If I inserted CPU with "cortex-a35" QEMU will
complain:
qemu-system-aarch64: missing object type 'cortex-a35-arm-cpu'

What should I do here?

On Thu, Apr 21, 2022 at 3:45 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 5 Apr 2022 at 23:37, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature
> > quad-core ARM Cortex A35 that supports both 32 bits and 64 bits
> > operations.
>
> Here and in the documentation patch you say "Cortex-A35", but the
> patch implementing the new SoC creates Cortex-A53 CPUs. Which
> is correct ?
>
> thanks
> -- PMM
>

--0000000000000d58ad05dd2c9c7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for all the comments you gave! I&#39;ll go over and=
 address them recently.<div><br></div><div>For this question, The actual CP=
U should be cortex A35. However, I don&#39;t see</div><div>them supported i=
n QEMU. If I inserted CPU with &quot;cortex-a35&quot; QEMU will complain:</=
div><div>qemu-system-aarch64: missing object type &#39;cortex-a35-arm-cpu&#=
39;<br></div><div><br></div><div>What should I do here?</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 21=
, 2022 at 3:45 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Tue, 5 Apr 2022 at 23:37, Hao Wu &lt;<a hre=
f=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature<br>
&gt; quad-core ARM Cortex A35 that supports both 32 bits and 64 bits<br>
&gt; operations.<br>
<br>
Here and in the documentation patch you say &quot;Cortex-A35&quot;, but the=
<br>
patch implementing the new SoC creates Cortex-A53 CPUs. Which<br>
is correct ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000000d58ad05dd2c9c7e--
