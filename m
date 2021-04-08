Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp243134lfr;
        Thu, 8 Apr 2021 02:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw4o0L6hj5DPMZBw2rqvjd9PJ39AcqgeV8Z6kfLR6NtOcY7MUS978/tHHbtDrD6gzfEb/B
X-Received: by 2002:ab0:8b:: with SMTP id 11mr4756751uaj.83.1617872932400;
        Thu, 08 Apr 2021 02:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617872932; cv=none;
        d=google.com; s=arc-20160816;
        b=FnCvihcaCSaYOoDeRS48dONZUgJI0F0/JkYd2he18Yfv37Uva6w6lsb6l2zeB8Giya
         6pp2yUty2nnxnWswlHiY0pU7ZGG1DRrTP68O0VUXfO4TFue1d7XXh1/sXSXG+F3G2ss2
         XinXvPNfU45NIrtC4Qzh67A0kK6+uzMa2gckGexqpBdgPcZbn0UKu7FO3mZEc0Dylpf6
         uQdu7D5y5PZmQ85AL+4ef+AJAaNcNPFaNpgF9p6DGllEX1/d152JPfL7gM6iu2EVr5PO
         FqJGXF6KNcM5Dh4OJgJH8seAIYVdDfPlmOAZdckloX/vzynrwnmQi+stU8YPQMGYAcor
         JWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WfCf8TyDez/mNSWlms8Kf+dQOgPnp4pHHE6zG7Dah1Y=;
        b=yh9pW+DSnUYstlk8ZJyFcFBZzOfZYBWo6CI4ix6PPGbItH6+2lyw7MQlSBcQb+duFA
         gquzqH3mQYZUlSGycooRboFPKmsxCSh4Um+yijSs9jB/zcDY0cj1WUZ3d2Af+C934Gca
         pNApFIcd5IZBnOOAY/CSoEgG1TkgBr3JSrvD2UAijQtGBQW3tREtPnFEA7bg3GZCbOX7
         +HmFGSnxsQff5nsVFD215Y8SNlH/WGbP+xUdnCCFCLSjt6ufO7P0w8Qv7B1k4dFTpxfX
         Yub/LYiCI1TKZsQYT/1ZPMOUcuKkhTAldBa0AuKjE1NWiuGPmUb6AwL3bMCH8e0CBMuz
         UsfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OVZV9yl7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b194si1650288vkf.69.2021.04.08.02.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 02:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OVZV9yl7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUQeh-0000vP-Mt
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 05:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUQbl-0006gF-Uw
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 05:05:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUQbg-00022b-JK
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 05:05:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h10so1452225edt.13
 for <qemu-arm@nongnu.org>; Thu, 08 Apr 2021 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WfCf8TyDez/mNSWlms8Kf+dQOgPnp4pHHE6zG7Dah1Y=;
 b=OVZV9yl7wGtz77x8zqq8icrpT46OUfwp7jyhN6bq8xN80Mdfbb42AFKv9Hp9Ozc8Mk
 p8Aep8NU939Exe2KagTpv+p4QJBxF0R+lhOWLCdVX2EnqwTpnCZTPKh6KUq1BD861HNu
 fWbbDBD8e/iEY0R1FINcC7dtmkfDTIFDTiQndOer00nTs6oRH72w9n18FuMtCmYUHf5/
 HovsBvKJ0pTE2AFRer/gbR5UNw+QuEjPtMxzTe8USzYBUVlZ2levNO8sUCWcPqRW3hCi
 CZ7clr6XP6L2mw5njC0oHAISJztc/Xw/V85v24qjMtnEq+pik/PMwforu59s2qrlk9Er
 uoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WfCf8TyDez/mNSWlms8Kf+dQOgPnp4pHHE6zG7Dah1Y=;
 b=DuStfOTK/iGgBjks6fh5EtfFPJuGLf4m+Nhzom7BwPziD0whuaYPhZd+tkH98CDT1F
 AUNb7em8ptF30S43b9N8BCDSvLaeK0QDExpzONsz+PqeHV1/ph1hSqAaR2GtvnmGdRk2
 xODdm83AVAUf3s5WHyPCsC7O3bCv86ZZiWHpXlWadjYzXCP7iijBKvEfs0VFz2Sx3qfv
 gL9DALmf6kU2NEJcBSmWydzH6I6yzHWJcpttmcvBEE5XTi+y4Y6xz+EB074ZC+E5KC42
 Y6/N2Mi8XXpp/Hu+aSN0miShyqdleXr+qC3Z+4U8RFUEMk9nNMw7KwxqkNeD0aGxBpXc
 hAZw==
X-Gm-Message-State: AOAM531olyLPg0HJBH7QUafPFgPD02PnwQLst4tPmQfnWAES9rCSq6aW
 efSYcsQDGgY4mVMyAk+dNEs4KyHx5jpD2HS6XOLnig==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr9813124edv.44.1617872742991; 
 Thu, 08 Apr 2021 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-18-clg@kaod.org>
 <CAFEAcA9LEO2BzghgCvp5hfFvRx1YyL5XZxY70FHPGwHeHxZZhA@mail.gmail.com>
 <016cb78c-ece3-15b6-20ed-29436595f621@kaod.org>
In-Reply-To: <016cb78c-ece3-15b6-20ed-29436595f621@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 09:05:02 +0000
Message-ID: <CAFEAcA_-YEg+dz-xW_yBdEQVi7uWe6_bU2mB6yQ5CK1JH58HYw@mail.gmail.com>
Subject: Re: [PATCH 17/24] aspeed: Remove swift-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R91GsVqRiCIA

On Thu, 8 Apr 2021 at 08:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/7/21 8:29 PM, Peter Maydell wrote:
> > On Wed, 7 Apr 2021 at 18:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> >>
> >> The SWIFT machine never came out of the lab and we already have enough
> >> AST2500 based OpenPower machines. Remove it.
> >>
> >> Cc: Adriana Kobylak <anoo@us.ibm.com>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > We've had QEMU releases with this machine in them, right?
> > If so, then we need to go through the usual deprecate-and-delete
> > cycle, we can't just drop it immediately.
>
> You are right. Instead, I will add :
>
>     mc->deprecation_reason =3D "redundant system. Please use a similar "
>         "OpenPOWER BMC, Witherspoon or Romulus.";

Don't forget to document the deprecation in docs/system/deprecated.rst.

> And we will drop the swift machine in QEMU 6.3

We only have x.0, x.1, x.2 releases, so it would be 7.0.

thanks
-- PMM
