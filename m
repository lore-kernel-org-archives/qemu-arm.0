Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3663263ejy;
        Wed, 5 Jul 2023 08:39:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6V+xyvzrbfLS+IT5B96LGktmCMfRneuQuR/qoCPlsi9GO0NkCPtDKqTOx6Fgpo7JkGnxmO
X-Received: by 2002:a05:620a:1a84:b0:767:17a0:e849 with SMTP id bl4-20020a05620a1a8400b0076717a0e849mr20106086qkb.18.1688571574439;
        Wed, 05 Jul 2023 08:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571574; cv=none;
        d=google.com; s=arc-20160816;
        b=u9Gl5qanEhd37hY20FiSCfIStxRyHUvEFBV+C4qmNvs85xpQZ4cqUilnWvHfiIEd2d
         TS3sZ+TwWpqktCxZbya+RTnfuh7VlMx0YqMRJfm9G/h1xI9pviDKeoVMeVJS00MZxlKE
         4GVefhDMkbxrIQYcuCe983Cke4PM7SduRIV4dqz8vRh9xkoueBFMGvGU1XocblAbQhSM
         PVYCyPF1AI2NX7j3rtUYv3p1WY35Vf2KJtiezP4QA6KflTuxBRHSPfpkY7VMqi46pcj7
         DwZjKGfdK/2GQj7kBXKIB+oEGWv9XUArvCkSlJB7ZnfZqlaQXn3pmpTzQBZyua14p0VH
         HqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Aw4HA0Lgo41S/ubw1rDl7Ft37QejOJrSPAdELKF3qnQ=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=nKqXTLgWW7nTTBGS44i5GudZi3hwEW5dYa9lKtiaaPUo49Fb8yLIOp3QlCscBtERJN
         d+/gcNkC07YrVFKo7myWzW665WYR9NIl5z6YqEumHjEDWhcJBm0OIy1lZeDsL7cR9yNl
         Qt4d0pHttPKx5lMjDi4otsQAmV2G2YriN10d5fPoSkzB38bPJoQrxn7I3/0YAbUhQPZk
         sdTv4RfknY9D5tKMXCXX00Y1OJehDUXKQN9/Y6eWpankV055j0PA3o3WsdJiIXhnQvR4
         GVZtIaLvMJA8ltrY+ck537zkqXri/R79uHPt9ZpzheA8EvtcD8UJs6Gxj22rZ2K0993l
         /h6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X04+fjwp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rk7-20020a05620a900700b0076719a83489si11346838qkn.346.2023.07.05.08.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X04+fjwp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qH4bA-0007BN-8N; Wed, 05 Jul 2023 11:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4b3-0007A5-F8
 for qemu-devel@nongnu.org; Wed, 05 Jul 2023 11:39:13 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4b1-0000Bc-4U
 for qemu-devel@nongnu.org; Wed, 05 Jul 2023 11:39:12 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so11212626e87.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jul 2023 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571549; x=1691163549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aw4HA0Lgo41S/ubw1rDl7Ft37QejOJrSPAdELKF3qnQ=;
 b=X04+fjwpf6kM7JjQbdJLkFlsbyrdZqw7MOdxNiClCk3H1PTokijAsd94lxDxPVD1LP
 lsN46re++i4X78anmGE9zobvpY3SNw/6plrla24URlx5PIqaQs/eCUeFMYLHMHV/AK1T
 9fikXXbxeOsFLxQaHh8BNDxjTlINT+nredoIaKR3auHMosvhNlcTGSOx6HuaUZMHOmEq
 hr0v1GAgZuKMPgYZOORM64jyLrhY4ml+BY15ID6FEmFkxeFeIkrH+eAhFtwBQD4KTMmL
 3t+ZMgYNbJkpRAl8ZGlZisAztUuO37y3o8zt1jp3EpbNu9Zj5Tk4V2rqMpnQf9WwNgzf
 eDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571549; x=1691163549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aw4HA0Lgo41S/ubw1rDl7Ft37QejOJrSPAdELKF3qnQ=;
 b=GPS/o0tcrA5tZ91UBVotIn7o9GqxHqBSTJcry5d7kfTnT/jPS25od4vl6DmDb6lI+s
 EXTK2fUTL+x4kRIXrIznBTB6RRENMnksN5+6lvpo/cyobTm5imSdYonF/HY5UudXgkIS
 V2db++781Ai1ZVkmt4DpdTNuypMWiL9qJ2actYgRfMF4IUjv3jhtJ64XSBAdKIcF/A72
 VNa94WEEmIFN2HH6PRaptzu0IHXPH/xtuAA+iZ0YJWHj8FLKRe0nGZ4DDSizttVY6OUj
 k9a6/YOEGS9EzVgmZe9MGNMU2/yfv1b4rbaAUlKaZd+jBFtLC9pK6KkFymEtQhagGvC5
 YXEg==
X-Gm-Message-State: ABy/qLYeiwCVcGMItv4ISiHGOwx1OjYFWTT7W/TGNIlskbbTJUyEQa0d
 Dxn32iVk5zspiSW/1mXttOUokon5Uxe3xGH2nPwpxg==
X-Received: by 2002:ac2:5e29:0:b0:4fa:d194:36be with SMTP id
 o9-20020ac25e29000000b004fad19436bemr10608885lfg.65.1688571548684; 
 Wed, 05 Jul 2023 08:39:08 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a19ac44000000b004fba5c20ab1sm3047586lfc.167.2023.07.05.08.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:39:08 -0700 (PDT)
Message-ID: <a3b1e2ee-d0ef-7e68-33ac-9cceb7b527a1@linaro.org>
Date: Wed, 5 Jul 2023 17:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 14/19] hw/timer/arm_timer: Pass timer output IRQ as
 parameter to arm_timer_new
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NmGtmaZcKcnM

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> Both SP804Timer/IntegratorPIT peek at ArmTimer internal state.
> This is fine so far but we want to convert ArmTimer to QOM
> where peeking at QOM state internal should be avoided.
> ArmTimer's IRQ is just a pointer, so we can pass/set it via
> argument, avoiding accessing ArmTimer internal state except
> from the arm_timer_*() methods.
> 
> Once ArmTimer get QOM'ified (in a few commits), it will
> inherit the SysBus API. This IRQ will then become a SysBus
> IRQ within this ArmTimer object.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
