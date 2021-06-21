Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2067617lfg;
        Mon, 21 Jun 2021 06:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6yO7Hjiv23/vzG2zd2WSTUQyoN9U3qSaKFAQ2Y8/CYhkFRWdXkwt1adIr2fuG+VaZAroB
X-Received: by 2002:a05:6512:3457:: with SMTP id j23mr14082783lfr.146.1624282458867;
        Mon, 21 Jun 2021 06:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624282458; cv=none;
        d=google.com; s=arc-20160816;
        b=qiey7y4i6vcwdeHftgDxoulYlhvln/6dV87Mbp9rap4+k8rI1cmy8onXIs3Tj3nXT4
         I1IzaixACsTYXyI+hitiMtwrOvy7FSmWbQhFidBe4g4FFRIFuR44GBPZSE2aRsJQnUJ1
         Bct1zMJso8eCqKBRdyEYOns1BjwAqxRJ0UmAJpFSiE31XpioHjayUxSIvHX3zgNFfiOA
         0fU8tB4IMuBQxzfPrDLjiboYgQeQsN2IYDiqia3VYKjXv+upx06WEa5U3SRqnlBmM9eS
         OF1/fSghVOTJrTnNtzw2+UluwKKUimcOgNNmdV20QPUizUBs2HJXslC4FMixXVtw3j12
         Iopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0WQ5WkLCR0zmy1vOqwDBFaCE/Z+93eOci7DrNImaRo=;
        b=ufbdS+3qEG1swPHStW27IoVTZ2Tfn/JXzFQSDpVhtctSke97+mTNAt43SuS/9tFg2w
         LT8hgJ/geLhYEyfp/notIIZLOs8Df3kqubj1ghV3pEB8WHG+pAvOkR3vZtXqvpRVvhHW
         veBINyoHhxKvPUwly60toi0MysKQO+O8rLkYjqOirD+6nEjJsxfdoBUBoCmd80DdZm/9
         gockYNN2ME/AGbNXU4lxvKCNaoch0UkdIj3scg2aize/CqYsRwiigXLS4z97jZf5P/6O
         NnSwp6OdS4HlDVSVtceb5tjXdpqdzgL5IX3QFuC3ZWSswc0I/H2WtXPJ8o/zWBr9PLbQ
         Am7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wkGFOIEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21si21396683ljm.506.2021.06.21.06.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 06:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wkGFOIEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvK49-0000bV-SL
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 09:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvK2B-0006RD-M9
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 09:32:17 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvK29-0000uz-GY
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 09:32:15 -0400
Received: by mail-ed1-x529.google.com with SMTP id h2so5453913edt.3
 for <qemu-arm@nongnu.org>; Mon, 21 Jun 2021 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0WQ5WkLCR0zmy1vOqwDBFaCE/Z+93eOci7DrNImaRo=;
 b=wkGFOIEVsxG+gFc/FQ7ELbiiXjoK6hIL6ctQEM7x0jLd2TpZTPar+CpcSJCNcBTEuH
 cdDfICBMabdqGGszeXcmKVta0L61IJffcBeuzCXM3wXTUjAPts4KgmDsGlD/VmDMrl1K
 c21ay0BQ37JQNy2yuUThZqFWr+0UIU/FsjYbZXEvFeqEtUrgGBn9uo1QHmmq5o3Sprs/
 CedjEMOIhB7KIoj6Rl8EVLcqIgFF7KpWZJ8gCRux0f+xITuxIhWj3KTXr0uVyXFWGIr8
 MShEXc8ctORZ5M9Cjvl8JydBwVruQZNaE0/X/f5zUK19T3SWTf2/lx7PoOHOP8ilu9QP
 9GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0WQ5WkLCR0zmy1vOqwDBFaCE/Z+93eOci7DrNImaRo=;
 b=iEceHybHrfX/od1qciEo68e8MEeW8C7sDRLo+VjWEgjSPIF5goHWR6NWUGLNcF2MFD
 lm3hrWL1XsADopT1vNsTH32tE60poWUaA/Eot2O4OWOkLJp6cuO0aDlwtadxPAYbk2RY
 BHE/psbixWys3Q6TUEyvkPH7HAre8Eh7ThVeHxOtY+5j2+WSsC2kQ+S47vimsXcgA7oq
 w1mJD4t0okL81lydVK+h+qN0kBGf0Mug45qSia4mNui/3A57dp1FCRM9t4iNNmxyOTVh
 auxbh0yfR+BfXzWMwmWnEir6vGYI4mW8Smc7Nvy+njb7pFSmdB2M5j+nT7nJ8xEyfBEr
 WGmg==
X-Gm-Message-State: AOAM531Uqo4dZSf1ggp/zQIaX5oM2IXAPrfyJegLHwrCH+Q0+jjlb5O4
 iKjHdirnr9Tonu9SYjD/EH3s9NoP4GJA+AHrHLfZQQ==
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr1005292edz.44.1624282331874; 
 Mon, 21 Jun 2021 06:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
 <20210615192848.1065297-3-venture@google.com>
In-Reply-To: <20210615192848.1065297-3-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:31:36 +0100
Message-ID: <CAFEAcA9=L1F-DGW+1g5K6dC9XDMUJyrLf4PWJq9nQ3XthG7nZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ePxUL6HGJ39K

On Tue, 15 Jun 2021 at 20:29, Patrick Venture <venture@google.com> wrote:
>
> Add line item reference to quanta-gbs-bmc machine.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  docs/system/arm/nuvoton.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index ca011bd479..197d149f66 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,4 +1,4 @@
> -Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
> +Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
>  =====================================================
>
>  The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
> @@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
>  The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
>  Hyperscale applications. The following machines are based on this chip :
>
> +- ``quanta-gbs-bmc``    Quanta GBS server BMC
>  - ``quanta-gsj``        Quanta GSJ server BMC

Why aren't we consistent about the names of the machines here?
This suggests that either we should have called the new board
'quanta-gbs', not 'quanta-gbs-bmc', or we should deprecate
'quanta-gsj' and rename it 'quanta-gsj-bmc' ...

thanks
-- PMM
