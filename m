Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp713884lfu;
        Wed, 6 Apr 2022 06:53:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB853iO4ba22ESvTHNaKCZ8WJatWLL2przyhFx0ABwKdX6OgdypXrtcOvC5p/exwWfTJeg
X-Received: by 2002:a0c:d7cd:0:b0:432:8df8:94e2 with SMTP id g13-20020a0cd7cd000000b004328df894e2mr7400645qvj.90.1649253192560;
        Wed, 06 Apr 2022 06:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253192; cv=none;
        d=google.com; s=arc-20160816;
        b=EJWh8gZINVkwImzrwQK39G+bCI4xp/AapJzAG4gTbx84/hYwZT7Cir3dZCLdiqoV3r
         O0iteYfuNxM8CBpIYF6fHUn9TMhfcLddPY2OSRiipwnYkxY5QGWFzkteW++M4FC8WqN6
         Y1G7yNDfmtPU5E5w5IUDBoBQ6kLmaSSPmhswTrG0JmstTij5IvJ0VywPVnhGfw8FPnWp
         cuZEcakToq0e4Q4uwmXEjGYmS/hiZk2uU+BE12gOh61jl1kCLbf4L2F6dvvayio26jTH
         DnEtCirm64NaCZpFN9t1wpyQamYuEibUq2dOBSYf8a+NlLYhfPbLeJHqY7Ykh8Qmi5i5
         ZvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=J96nQ92cyv+EOuupFrNNTIWr0oDK9CNOnAjcMHGwprI=;
        b=Y83VZfr5aoJfBJARyjLNDd9JjboE8OzLTi38vM3DEMwzwRG8y3yG6Alf/ZrgHyAzg1
         WSDVqcHVm9pm6SPXHtJcbUSsl1RUPEHorzFyLdrfSZlmCYFNE+M7a599V2oCXGQY+/DX
         E2urTtV9XUmYLnBDDIK+Bu5mmYdYSgJhHVzpxx2B9OXO9iuE6PWF3ozoiARmgVxSu4vc
         msRczVbBsILkEgUJoQr2AbHbhjmHtJBv/5TWb25/2uLFjMGJ8H4Yp4iu2RLvUaueySn/
         7hMt+OnmkyknuPb8evH3fOIP8gKx50Dum8vPvpucgl+zWbv+XR0jsNMQQZu7JwOG19k/
         86uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLA2Rwy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a0ccd90000000b00443d0b63e28si3921833qvm.298.2022.04.06.06.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLA2Rwy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc65w-0008Nb-2e
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65R-000870-ES
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:52:41 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65P-0003uJ-V7
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:52:41 -0400
Received: by mail-qt1-x82e.google.com with SMTP id s11so4367379qtc.3
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J96nQ92cyv+EOuupFrNNTIWr0oDK9CNOnAjcMHGwprI=;
 b=bLA2Rwy5ZEcnOO9pwouiLGfFpknBiNWYAE4QJB9144o4prbBvcBtx6fc42k2o5oIN2
 i60f+Lm8ohAx4sFMdqaMfu+g1MoqSs/2lriUxOOvCI1Yzhwfs3UGHit3W8neJAQlhUGz
 2+9/x/lW9B1b8XktsM4hIZAjPgZjrILs8ULCDkXtKeFG6+S2GcvXoudKBCLoDK0Eyflz
 EQUc5nmaoPPsZ2ujAjK93qFAR6wHG41uNZPMCkEmuHZg3KjynnLeHp3R7PiGrhXuZpnQ
 53Os405R9Y6+1qI+eyxpyro65piKBaP6eXNccytJ+qkMMGjEIfpQNHsiN2rL65IqLJ+P
 9PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J96nQ92cyv+EOuupFrNNTIWr0oDK9CNOnAjcMHGwprI=;
 b=ypOkfot7sm4yOy8C5INprZbfo8+EQJw0fdaq9svGodoryoiqOWFKkJGP74zFjFtPkM
 XG7945aMhzbbCrKUxTN8zwYrAOXBNoBP4tti55ZPEqWtGtXCVbijzeb0+4JF+hmtwLge
 IOKQWH05G8iE1r6rBTkxmjvoCQRo+F1kEpj0xtF5hM7sLz9ocdSeQ8MOYoWa1/I3d/1z
 Gu2lOfw6meNuJPPqdWmw9s6Csj/pSXuOQ9iYas/kixoAmsjcFoO8Cz6FfNJtZ8yYtXOU
 MV1kLucalgS7ntvWb7S50NJUw7GbgtEKUVtkjWREjj5c2Fq/4zGIxlQatYG7eqQ8oOKi
 Vkeg==
X-Gm-Message-State: AOAM533qCTe8UpmwCEUlgEd391eyCxf+2B9Hsg8+eu3Hw+N086Zg864+
 NS0x0ZxwW5yGvkMpwcUoOc5l8g==
X-Received: by 2002:a05:620a:783:b0:67d:4c9d:d103 with SMTP id
 3-20020a05620a078300b0067d4c9dd103mr5683187qka.250.1649253159054; 
 Wed, 06 Apr 2022 06:52:39 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 c65-20020a37b344000000b00699aa260f5dsm8711630qkf.1.2022.04.06.06.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:52:38 -0700 (PDT)
Message-ID: <87d2342f-9ec7-6b31-0af4-437abd5bfe7d@linaro.org>
Date: Wed, 6 Apr 2022 08:52:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 10/18] hw/arm/exynos4210: Move
 exynos4210_combiner_get_gpioin() into exynos4210.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K4KBgIvnEjh/

On 4/4/22 10:46, Peter Maydell wrote:
> The function exynos4210_combiner_get_gpioin() currently lives in
> exynos4210_combiner.c, but it isn't really part of the combiner
> device itself -- it is a function that implements the wiring up of
> some interrupt sources to multiple combiner inputs.  Move it to live
> with the other SoC-level code in exynos4210.c, along with a few
> macros previously defined in exynos4210.h which are now used only
> in exynos4210.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h   | 11 -----
>   hw/arm/exynos4210.c           | 82 +++++++++++++++++++++++++++++++++++
>   hw/intc/exynos4210_combiner.c | 77 --------------------------------
>   3 files changed, 82 insertions(+), 88 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
