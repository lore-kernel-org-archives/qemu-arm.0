Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp351291ejb;
        Fri, 28 Jul 2023 03:20:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEJ+k/WhAaN34jJwUaXCNmGOIBjH3/FjOkxexLW31/Cymm74wBenWTEwSorzS86LmBT/25x
X-Received: by 2002:a05:620a:2157:b0:767:d50:d6fe with SMTP id m23-20020a05620a215700b007670d50d6femr2139326qkm.28.1690539650589;
        Fri, 28 Jul 2023 03:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690539650; cv=none;
        d=google.com; s=arc-20160816;
        b=iVaqgivBl9K6pLq5emrBUc+X0LvSyTUA5AByspCVp71ulGR/XL631vkCqkqvemnaqU
         SrJFkDbJSc4iRDx2FjIsA5c0XLHETzAB2TX8HpJsJGb6lasjvT2inNBlE4vNGpa4bhfK
         bgyGEaCDgEcuPCzpZiUs1R1iQHKAq30bXcc8JHoXoiBGqcCIk9So205qbfDPoVNGrLVK
         wOKzyxeEtc7+2wU8cqjQUmH7Rwhvk+foiP3gjyvsSvAopVWQ3Fbdbq+AoEpzEz6S2erJ
         A84tIJv5P7X6aDcL5DDL+DCYcfNXkBG+SQwotjdLlkIWOLvQZeTyK9TA+3WfukCGipYN
         u2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wH7bJbZhu2Q6KNd2TTdhSXlH5UfTyGWlGSg7gGLBkjs=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=M+PSzrZwxKFtkbsbTe7BSsXn5Mcx2F901XLn2jCqzAdxOEHtduHUloJP9GwhvMqxXo
         DjT812mN3zxr7umArAmjMzGnl7ES7HeFmwbAWeCWxcQmnMNI0NB7H5dAkcgKob2hKr5+
         4GGNYoL7Urb/6gV6Fc7S3FvdZzJ8vGigQ8U9qdlvOqQSa3+5zMNBEdhI6hXItnRNKIVW
         0kXcWYcAd9ueeELm7T+UAuISzKbyni9FOpAEM2OgyiJpRITmzmP7hfdNPt1Xb+SMm6lG
         LdzHlbBmuCCFpkbka5D1xnPmxupBULcTx2ciA0ysv98pRT+a938rtCiZCabndWDWQmZW
         Tnbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YUhyme/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020ae9de06000000b00767d49d0fffsi1834988qkf.128.2023.07.28.03.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 03:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YUhyme/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPJq3-0004b3-7M; Fri, 28 Jul 2023 05:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPJq1-0004an-Ne
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 05:32:45 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPJpz-0000IZ-Ju
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 05:32:45 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe0bb9500aso3273642e87.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jul 2023 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690536760; x=1691141560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wH7bJbZhu2Q6KNd2TTdhSXlH5UfTyGWlGSg7gGLBkjs=;
 b=YUhyme/PE9TMZtxvyiaeWOmsn5jJtGC0Rc0u1MZvZDB2ro8/jvuWckCxWpWU0aRncr
 E3v5iwE+Bhoy3SSjzBquuPdD6KCnBdbu/i3bc8JaYmlKPeaSrFx/EAMaEKJtyLKO6scs
 v7SVXMk4VE2A6E5xfWq810QeLWVA6ONOelwQGT9dFvHT+OOuzaJbAPhnyOuRO3hfA544
 y68AMWQDKlp5F8hcLXXaP8TCE2gdLfMpLFDzpubl6INNWbRcXFfNi7m6PPOmGth/+8Lo
 nTtMNDHfCnFcI31Z7L71A0xUclTwe3tWHWQzD8FaYfoVaGRl9aTQgh8bM6mOvr4U8OmY
 aVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690536760; x=1691141560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wH7bJbZhu2Q6KNd2TTdhSXlH5UfTyGWlGSg7gGLBkjs=;
 b=IY+hS1J5dOqld8ZnxCsGAvzu+FkqHm964QO0zaYZNHjDS2C6JLsWp3zlYNeu3IYpwC
 H8fROA+VgBw+GQQv2edETPoKdQeavR2p+b6T32+1miOe3nZHvZ7ApoceuUGtuqgOQxph
 U/M5A1F71zGvIoiYiWfsugCZKgoRyyaZWjngT0SycMmG1dpQ/SURtlhlzcnh58S7eMtI
 knaooQmi5W9rb4t7kL443RT1t2C9DWj67aCunk+yYkJYjPXoz6vlDxWg0PYd2MkqebIK
 DVjUeD7FgEFlY8myve2s+Vionj2wZxHChyA0x39AoZYUg+80Erm3xD0RVH4I2IEUcjZ0
 2FGw==
X-Gm-Message-State: ABy/qLYY5nkqRUXR6km7JfOw8rkXM4Vppp/2hgjwy73ovzJ0zWEQAIay
 2FBxavVqmiuwlyd0IPZypb/J65w2o+AgU3YbYAofS9XISRXXdLpg
X-Received: by 2002:ac2:5bcd:0:b0:4fd:ddbc:1577 with SMTP id
 u13-20020ac25bcd000000b004fdddbc1577mr1410052lfn.2.1690536760388; Fri, 28 Jul
 2023 02:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230714232659.76434-1-chris@laplante.io>
 <CAFEAcA_gGia=ckyv4=XHNX4=VHJJ=rmVGXQbdnOAGv5h1rzLzw@mail.gmail.com>
 <uJ83qRpjm3C76JRjI4OOm2NAz3uF-RDUa2WL8sp3ftAzoH16KDfxZhwxsqxqxrHTfXHKkZZXy0JY6UUpq7nD0jfYEUtYM_K340O6E6BFwJY=@laplante.io>
 <CAFEAcA_HWapg170-7yu2cZ-ePTe4PaX-tWyL7FJzENgig=dq5g@mail.gmail.com>
 <yokIQT37oK_0HPVzoPJBD5moVrsM_9vvTfjLSATREN7NSvy794przKE2H0mtVB7Puff1nucD8N0Boa4tdRv8CcqFZHaM2FY6Wxty2-tkTjY=@laplante.io>
In-Reply-To: <yokIQT37oK_0HPVzoPJBD5moVrsM_9vvTfjLSATREN7NSvy794przKE2H0mtVB7Puff1nucD8N0Boa4tdRv8CcqFZHaM2FY6Wxty2-tkTjY=@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jul 2023 10:32:29 +0100
Message-ID: <CAFEAcA8posSu-U-7hpY6EKXk7P7Ji90KsPNzoRFNs2J8Z431sQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add nRF51 DETECT signal with test
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hycdN5wOI8f3

On Thu, 27 Jul 2023 at 23:51, Chris Laplante <chris@laplante.io> wrote:
>
> Hi Peter,
>
> > > 2. I also have some implementations for pieces of CLOCK, namely the H=
FCLKSTART/HFCLKSTOP events and HFCLKSTARTED event. Should I include that in=
 this patch series, or would you prefer it in a separate series? It is unre=
lated to DETECT and POWER.
> >
> >
> > If you think they're ready to go in, and it doesn't
> > make the series more than about 12-15 patches long,
> > you can put them on the end of the series. If the
> > patchset is starting to get a bit big then it might
> > be easier to get the POWER/DETECT parts reviewed
> > first.
>
> Unrelated question regarding the CLOCK module. Should I model the startup=
 times for the various crystal oscillators? Or should I just assume they st=
art instantly for simplicity? External xtal startup time is 750-800 us. Int=
ernal RC startup time is 4-5 us. I've already modeled the delay for the ext=
ernal xtal, but just wondering if its worth the extra code.

We typically just have that sort of thing start instantly,
unless there's some specific guest workload that falls
over if you don't model the startup delay. Usually
modelling the delay is unnecessary complexity.

thanks
-- PMM
