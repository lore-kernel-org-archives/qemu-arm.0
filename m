Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp621415lfq;
        Sat, 9 Apr 2022 12:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdH/PzR+NQnbd6EM5HdA40NE8PhtJZBkNGV1X0AUhiYEsmu/WWR5Cehh+qEo28jVfQDDN2
X-Received: by 2002:a37:89c7:0:b0:69a:121b:9256 with SMTP id l190-20020a3789c7000000b0069a121b9256mr8653261qkd.218.1649532259176;
        Sat, 09 Apr 2022 12:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649532259; cv=none;
        d=google.com; s=arc-20160816;
        b=GgTcFoFPA7VOQks+rb+6dkcaRK6sX8yksFVXZbLGPaUAzKC3425hIc7EOlV/VzT+rC
         Y8R/q8GK+6/3SEMnlM1vyq1kMRlMtZtYkSCBwSipJl19bDHhu7jSZwAVFqmLyqbtzKAl
         FhcaBGPy8rSavMpwkExRBgx9EUp6uYYs+X4VRLCLBj5D+htx1on9kwrebbgCjP8V1LXP
         LMG26SNS/SXnPTGkNd/V78Trxgen53nXZtOg25oU6gOrxDLs09ygca+6jIC2pnibsOR8
         mVUeBcbcKXahKWDNBpwP444ncDz8YgKK8Wyi8pk7P/d+txpJD2XQYFzNHSL3DJ9BHeP5
         9pZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pda8nbAPsRYazZqWTdokxBj1SXupl+aJrjCtSfa3U8Y=;
        b=MMi8TLyXZrDbELsVqrp7ciVXItsTqBLmYfdK01UYEAQdFgXQYt3tWAzkfDjTst23e0
         KbEtT/cED+MTjq4NUFunjuqCK5uiZX3q27wsVfUmntjzd3lsfoSwK6aSQ3vyXu6+XFks
         lLUJsGlipcLNfJNp+Y+y5LuTPAdYZMasbOU923Eu4hKTebQ9TgW0VXD+6nqVBdCGyK0H
         fYnQRS1PiMLPDs+qklpfCijKtZLY1L0O51AEUhPWwi69PyzdBbENzw2FvpxejoDlo1w9
         lGJFVOAwbQcjLLk56YqeAcE4fJVONSSZoU5wADBoMtdW0S5YKY88Owolbfc7W0yA0JCJ
         Mjxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x1oTtfFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw5-20020a056214238500b00440e46a7d90si2219245qvb.558.2022.04.09.12.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 12:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x1oTtfFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndGh0-0003OF-M2
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 15:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGgO-0003Mi-QE
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:23:40 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGgN-0001EE-86
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:23:40 -0400
Received: by mail-pf1-x429.google.com with SMTP id x16so11216988pfa.10
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pda8nbAPsRYazZqWTdokxBj1SXupl+aJrjCtSfa3U8Y=;
 b=x1oTtfFWQI6UVFgV3BWjC8y2gEOSuC+aqoLCyyIvQvmqb6TYp+NOQgpqKkrHufmhJ/
 9P2t/YBEF89YbJfUWiozYAxUBYSgafIC6iXrIy80w7HaBVXtBgn9c9vWHww0qIxFsrzr
 TZdqONM66t1kl6g/sHkhviXZs8ipg3FysA71TPSNQ/Edqw36swK92wDWNpkC++ksY762
 JsjOzmBpR9a/tjtH/xwRIpNoZsJdvtYmBdvjudf517BtHbHFpa7dui7XKf0vlDVJd929
 /tCENSIuGX+uhKsehBAaspOYqeMEnWGTRFDYfyLwcFlJ2V9l8D5a0YkGRtKVZx82EaHl
 NK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pda8nbAPsRYazZqWTdokxBj1SXupl+aJrjCtSfa3U8Y=;
 b=jkiX7P4nr3cavM/yMmdw61KzCYTYNqIE4BM3eihR4hAdvYYuGY3zNrQYT5pM+021c1
 7C2/aLcNewKRuwRQ4C9Vf0OOVjHjPRGmFn98rAp9NhpaOgz/imZPrldTqzqj4I0qxNHQ
 dWbAnImdKIz9ti3i2CM3WaxqyFm22KQAlfLDVly3U+YXcmr+P9QB5ygUyYmXN3/5puPk
 iEIOV9paEeSaW3IKnj6Bn/DCs9I5UQ0BjJPYX3g4Idei1yrG5LKanro9rKLsaePb4f6l
 spg7+/yjrZKyEb2iT5jvn2Q5SASeh9l5yQzy058pWoO/2VTx64J9Q+eT41w6AEzMuP0F
 Kznw==
X-Gm-Message-State: AOAM5339lLnu0j/B2etiazDaIqQImOuhW4hR6Mfo80Aem+m85QUGdBLa
 0D2sT3ARIsJ1fbAuCa1gQ+4RGA==
X-Received: by 2002:a63:d158:0:b0:39c:c4b5:69ca with SMTP id
 c24-20020a63d158000000b0039cc4b569camr12339307pgj.187.1649532217835; 
 Sat, 09 Apr 2022 12:23:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q18-20020aa78432000000b004fb0a5aa2c7sm31537034pfn.183.2022.04.09.12.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:23:37 -0700 (PDT)
Message-ID: <7e140f2b-207c-007d-d701-6f6dad295cea@linaro.org>
Date: Sat, 9 Apr 2022 12:23:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 26/41] hw/intc/arm_gicv3_cpuif: Don't recalculate
 maintenance irq unnecessarily
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ac0flwRCOfMJ

On 4/8/22 07:15, Peter Maydell wrote:
> The maintenance interrupt state depends only on:
>   * ICH_HCR_EL2
>   * ICH_LR<n>_EL2
>   * ICH_VMCR_EL2 fields VENG0 and VENG1
> 
> Now we have a separate function that updates only the vIRQ and vFIQ
> lines, use that in places that only change state that affects vIRQ
> and vFIQ but not the maintenance interrupt.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_cpuif.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
