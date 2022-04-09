Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp583898lfq;
        Sat, 9 Apr 2022 10:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1EivN+rrzn+9+cCd4c6BNC0A7/EAvn2Rp6UP0qA0i8UlF88CyUSzZqsqAUdw+aD/e0odh
X-Received: by 2002:a05:622a:1d4:b0:2e1:b942:83dd with SMTP id t20-20020a05622a01d400b002e1b94283ddmr20309853qtw.321.1649526955229;
        Sat, 09 Apr 2022 10:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649526955; cv=none;
        d=google.com; s=arc-20160816;
        b=TCrq9uT0/V9PnC5K3zjvR5N0eFaE3U/n6arTY00+XpjOFyoGdom/1VvgxN1g6+gyVH
         6EcVQmRKajpnuu3UDEHhROQgOYEdQ9aQ7bsm5J+TFQN7tpPSs0e9AIR90Xi60QdjFges
         seJNsjfsmC5RsaZhP1YP0JLtiZLd6sLRzRjz4JteI22gHWdVlO8B7u4pUGGF6+BjkJWW
         jqW8pk+9eqjLk74ryPlRiYcnCvWr9hE3pPvxtelOwUaJr0PcUz7+05KUkOvEovJ3FoI4
         cYCFGVtNJz8pr5cfnVo/ULkf3ENzVbDrFTNgc9Bp4whcJ7TOxgtB4J5tfnJWwPJL/veL
         VFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Yasihu4LUgcHFYu4THfnpF1kCHG8V7rylOaLGAh+MAc=;
        b=L9yGNXnFhJ/Um0tP3PZia7dU1AMuysR0F7qsy59JU+29zxSq0aXLN3HYF+POfena9U
         huutyP4403AGTDEHWx9CHNfU7IgGFPblwyDZYCK0GiXk9GhLCMYazn/wymxwt17kPxVP
         4/n/FPUYdWaETVgwcdgsOIks6E1ulrrYpqlGFJTsKt9hNBoYVJwNMdZeh2jFDMSpVxj5
         iNFi1oN5sdvIAxM88URyvXynKUfX6MK96uPwdpoHiEoWrw38IxYiPQsPcgABBFxJevzC
         brJkDaDTuMN6f71Hbrngml4yu702lgxQWhEwH72tXhB6RKXo4vGdYH2YP3LakRK3L2f7
         ysTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMYsYW+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs13-20020a056214226d00b00440e46a7b9bsi2363739qvb.57.2022.04.09.10.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 10:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMYsYW+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFJS-0004m5-OI
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 13:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFJG-0004jE-AZ
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 13:55:44 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFJE-0005hG-Qq
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 13:55:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so2374191pjb.4
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yasihu4LUgcHFYu4THfnpF1kCHG8V7rylOaLGAh+MAc=;
 b=YMYsYW+i3GiyihshqYcALzLE7KLYK4wVM3tY/7FGgTjB/732l6jY3SrDhi5CK/UEC7
 Y3BEDWE0Ly5M1u2mg1KAcisKDhEnLvyHwSXw+f5Pnkfn74S1iGWWX+G+gcoS7fZKr/NT
 uu35A3SJ3HrEXMoxYBXrpvuwbYChuqaOTxU8Gxwuo8Zzvfh3h9ljnoial7Y22hGeqzJv
 UOIlG3yFBZLktIUCKyaQQcvWLpRvM3Qhsytkk7Z1suuX2iTBYUqIh9YdeI0qPLdafumC
 OCbVyeSC69CWEMuFplT8ircULEew9bibFonUWKCkQksYipRzML2JrevOGg0Ds+xwiyQf
 9eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yasihu4LUgcHFYu4THfnpF1kCHG8V7rylOaLGAh+MAc=;
 b=QexUQ+D4zXb3qLLj/FweqLmSn4R2LQT4VDSphkI9V4cYeVTrJwgvT02psYwIF9vV9y
 +FohcfiwUVkQTZaNHq13O3Fnl5+i05VTgFm+qjU4DrFCPMhEf+OkklJbGJ6aEMRmuki3
 c7zLerYxNgaRHxpCo3azink9nz2k/OwCAp1LWS0TKzPf6JZsRewa9V9WUsalRa2lfkbu
 l+J4EnhGmD7+gyTWUa6flCHRDFLbZRmoURIYGe7ls6jRV3Po9Y6c91DU8LBKRGBLsN1b
 6TT8AGWEiq0KDT2rTOtWm6IAx22L8nlVnYJpnK7q7JytF9PP7aOPmefDoBhMrp/hXzE8
 3mCw==
X-Gm-Message-State: AOAM530CWF+vSvr2Dq19zblRY2dld/LGw5wiMqU7d7eDphvwqG98Z7N1
 3LPGQ/wlUMALs55zwFYNQEY5tQ==
X-Received: by 2002:a17:90a:930b:b0:1bf:ac1f:6585 with SMTP id
 p11-20020a17090a930b00b001bfac1f6585mr27665736pjo.88.1649526938904; 
 Sat, 09 Apr 2022 10:55:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b0050591e66508sm4802402pfj.220.2022.04.09.10.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 10:55:38 -0700 (PDT)
Message-ID: <89c9a4dd-01af-54e7-80fd-7eb800aa6da6@linaro.org>
Date: Sat, 9 Apr 2022 10:55:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/41] hw/intc/arm_gicv3_its: Split out process_its_cmd()
 physical interrupt code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Blss6doXTvCT

On 4/8/22 07:15, Peter Maydell wrote:
> Split the part of process_its_cmd() which is specific to physical
> interrupts into its own function.  This is the part which starts by
> taking the ICID and looking it up in the collection table.  The
> handling of virtual interrupts is significantly different (involving
> a lookup in the vPE table) so structuring the code with one
> sub-function for the physical interrupt case and one for the virtual
> interrupt case will be clearer than putting both cases in one large
> function.
> 
> The code for handling the "remove mapping from ITE" for the DISCARD
> command remains in process_its_cmd() because it is common to both
> virtual and physical interrupts.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 51 ++++++++++++++++++++++++++---------------
>   1 file changed, 33 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
