Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1070630ejc;
        Fri, 3 Mar 2023 05:35:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9mYYqD7K9c3grx7ntUUjRFgX5dyjcZE+xOR/pRphAEpWL5wSSDqFW55Z9YSA5uRKj9dY7B
X-Received: by 2002:a05:6214:2387:b0:56e:9551:1980 with SMTP id fw7-20020a056214238700b0056e95511980mr2844621qvb.5.1677850500503;
        Fri, 03 Mar 2023 05:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677850500; cv=none;
        d=google.com; s=arc-20160816;
        b=KFxdfAKW44C1ttRUxuQneucBtmal6DvH2VhT7+P1XGxQa9z+P0CfLTTSXNh2BU1EBM
         X3Gb6FV5EEMBpGLi1H36ArGjES5u9slCT4QPgIXwsyJKA0tv/m9g/TFbBH2iubQLgLyP
         ipNNqXmPDCupwYGvAjaH/6V14TFGtE8Cks2mpRBZh3hwb/JAqiVL+KDiE6cS6l3+ORVy
         iqxKe+NEZYDXPXXTzr1P4iy8D3RAJNZ+idOx7r34TzIGLUdApnaC7hcJ9Xch/umi3LD4
         H+fP+fPoFYlGmYFvysHIpTVtV3HzVOXsEV77mhtCcwVX2KIO5tSU3z2e0rWYr+JAP0Be
         QQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bxfVBHbfO7bPVVLS0HEXJ8Y/rqq/AIln7l39Y/FXZsE=;
        b=PM1SoPzXiz66mnn1f/lK4Y1WuyLJ04J7Bu8pkJeNFJNDC1IBrJeOqKS/wIX1aYnliB
         z7M32+yckfXkN/CNl0Z3cvCf6BV4Dh+oV+bNJtd7boD/02unHWTIFWevGQQXhcwl/nIJ
         8kcoETh98SdmOlDbiJQNP1cm9KzRsIbkywFLrL1ciqdzqfufeD8uybIbVgnVT4EiOMLp
         1YU+WsfN/tfvnvo6ys4KHSt8RLwVuW2sy1xa3TaNxUjl4BI2lvkqIkTX8OF4+WJkG0YV
         snkKBCI08GCRhOe3R+faX2ukvQUhY1djutqC/cYwIi0WETodED4lOsCB0Nw+LnQWqjPR
         YfDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eCkPWEAI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a0c9a82000000b0056e61f96a16si1580455qvd.183.2023.03.03.05.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 05:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eCkPWEAI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY5YK-0002Hp-Sg; Fri, 03 Mar 2023 08:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5YG-00026W-Dc
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 08:34:24 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5YE-0006Yv-P3
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 08:34:24 -0500
Received: by mail-pf1-x434.google.com with SMTP id a7so1529752pfx.10
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 05:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677850461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxfVBHbfO7bPVVLS0HEXJ8Y/rqq/AIln7l39Y/FXZsE=;
 b=eCkPWEAI4W+rIFHnwQE+Vq1NVGcuHRqo9eqf/SFodVSv2nc6qJb/veYzKFjt1R0HYH
 ytxkzlgPxXpliw1PIT1O5PCsEP2AEZsYNSbe540sNE1kMd/ZUp9UY7k/+QicPhfFgB5l
 5/quvle+UzV/bJ3rFyU5VaxD0Q6srKL//n33QxEpTt5Ic4bq0DMLcbEU1gS51NSvNsS+
 lqEblDVN6Od0MmGnuCjVynKHSHqlHsRTn3HaICJnekOjFFoO8fDiUaxhdPjiZSsktcwo
 BFkBMiANxU1wdzRNPkSRNjlDIJLv8XJSorT6vPcxHQd3Rv1p1Aq+0CCKLT5L0eOy46mN
 OILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677850461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxfVBHbfO7bPVVLS0HEXJ8Y/rqq/AIln7l39Y/FXZsE=;
 b=Em4CO22XsC7Q0417t63HpWAEWRAafrDI72+Ma9ao2ezCWyCjL3JV8B3dV9pdmj8qWj
 TCmPhBdVKOaqnAyNihAkhmSWLXJT8ezXX3H9WFLt7BFaZYDjPRzEkSW3SLDmwsTumKPw
 OCOpk9SYrk4vvJb41W8cxA9Iw/2CvEpLjVqjQx5aH0D324JsQa8CVeLdShVbFxlyKz77
 ovv4zdGYwzASBsp5h99Yvd4WZbGnW7/LceGIkANsS3D+DvvzSEwXgIdoHZwLE3xyBiNc
 agtdX3ABWC53HcTj3tYH0S8rLTDiNwXODbrgYFu/oyFFdZvY+EtTDocu2Qz5MVyJGvS7
 uo8w==
X-Gm-Message-State: AO0yUKWg260tXYSITR2KcjuBe4pLq0UxC23vc56RDteeFM4KBCbZ6HoM
 LdSQcPu5IJ2HFfSkdy3H+33lH4z0+yHWflp3W2L0GA==
X-Received: by 2002:a05:6a00:225a:b0:593:c9dd:9069 with SMTP id
 i26-20020a056a00225a00b00593c9dd9069mr905743pfu.5.1677850460936; Fri, 03 Mar
 2023 05:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20230302174206.2434673-1-clg@kaod.org>
 <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
In-Reply-To: <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 13:34:09 +0000
Message-ID: <CAFEAcA-HvviZFZXBwJQXhxVsqv473=5BW=WJgKSd25uqmschXw@mail.gmail.com>
Subject: Re: [PULL 00/11] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3QTyuKR+HiQR

On Fri, 3 Mar 2023 at 13:23, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Peter,
>
> On 3/2/23 18:41, C=C3=A9dric Le Goater wrote:
> > The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11f=
e06b:
> >
> >    Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu int=
o staging (2023-03-01 19:19:20 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
> >
> > for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da=
:
> >
> >    aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50=
 +0100)
> >
> > ----------------------------------------------------------------
> > aspeed queue:
> >
> > * fix for the Aspeed I2C slave mode
> > * a new I2C echo device from Klaus and its associated test in avocado.
> > * initial SoC cleanups to allow the use of block devices instead of
> >    drives on the command line.
> > * new facebook machines and eeprom fixes for the Fuji
> > * readline fix
>
> This one was merged already. Would you prefer an updated PR instead ?

I'm not sure what you're asking ?

thanks
-- PMM
