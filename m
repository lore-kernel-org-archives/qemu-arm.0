Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1796505ejb;
        Fri, 16 Dec 2022 15:56:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5iwdvVx+ylxuNg6QcAf94NOnklUunDtxe0f9RATX/UgyyI63FMmr9CYtfejB3N4jIQwOd0
X-Received: by 2002:ad4:4e0b:0:b0:4c6:fdd0:df7d with SMTP id dl11-20020ad44e0b000000b004c6fdd0df7dmr44753277qvb.27.1671234960121;
        Fri, 16 Dec 2022 15:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671234960; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0NNu4WlAHHlzwjcJ7CT+Ge1Q2Ff9p9KULNC5unZ5mRcFqeKr2APvYG8LsJCCwl9ch
         QEY1NyTfbTYh9jk78yvJmBuI0wZH06h18OTuz7xmWBtUS/3GncfjcuAcvoZNik5obqo2
         7zW0ExQs0/CnvGntFZDp9d96ocw1WaLyFXEdpjF68NDy1Rybaa9ZLYSog4jrn5VPx2H2
         e/gGn8rsG1Udtm/zicFsCU2GR64uWlzXTSusF9V34Njd3T6wNjlYadarXwINOrRnj4hw
         aY7fsOqkfVLazcsWgqjhInYQZZQd1WQM2i7/mTwaBvAO+S8jkNbSWxorXbjYjP5Zpfi3
         xBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=S0J1Y/JHOekwGdbCkByHa8jzZHwbN5KNH5O0zH+eHo0=;
        b=DyECd1rD2fvrvTpzwIFX6NM9zAM1xPHMiMh6iQRRVCDpJrIgJjxPZQr6bRqRbCk0QE
         sPXeKX0nBzIXEaEa+ga9f9PCf3EHUOz6vCln3Kh+PmWr49fB0MI1N1ohX+SNIk6IA9gh
         DKqtW0eyBN61AQKPMprwqqsKIc0LLw37MrdJXkc5WXKxJmCu42Ob/3512GqhfS7Xrre3
         4FFE6g26J9wxyxptuCepHogihpIwNwVIGBnDTSuub4N2huiI0ycCcDOxw1KoSc/NCiUQ
         mBW3ACnD6FL+t8or51GHWy/078YHKloEqomk/YaGiqUeGvrzm4unWm2EbgwQZ0DcpwJy
         xh2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pJp7dRGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd13-20020a056214400d00b004b70768acb2si1605279qvb.373.2022.12.16.15.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 15:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pJp7dRGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6KYV-0004bZ-Va; Fri, 16 Dec 2022 18:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KYU-0004Tz-2y
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 18:55:54 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KYS-00047c-FQ
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 18:55:53 -0500
Received: by mail-pl1-x636.google.com with SMTP id n4so3838717plp.1
 for <qemu-arm@nongnu.org>; Fri, 16 Dec 2022 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S0J1Y/JHOekwGdbCkByHa8jzZHwbN5KNH5O0zH+eHo0=;
 b=pJp7dRGTP6UU1+2+n++b3U7FgFZOZWQNquXSWH5rFkYErPSWSv92tlm6qFUc2gTh+D
 BfUthjnvLF5nGNcMU4sIiwSgV3x/BT1X0DSuSBJt60Z7zZ649JhnLaAhBYWXw9z0Yv60
 H5tyklabc3GZYejdxC4W9g3GLBBJG3KllW64H2TbVU3QiQ+Ygo8JXljcKoicifJ54WtG
 7X+75n3UhSdiHWDT7i3UPrSqMbESmqBVRq950Gwo0FyEU5tdLqsoax35fsHWTAi3vBoX
 K69Y8PGh422gqfe/zyBC+HT5Af7hHTDxUeV176INdU6aVarty1Vj2sLXx/N4Znowegmu
 Qxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0J1Y/JHOekwGdbCkByHa8jzZHwbN5KNH5O0zH+eHo0=;
 b=mzyOx1dsSYBjvPRwfOBgqqluE703MwbpoD3SyFr2UbiaQQRC6YqwXKUY/pmOVLnp4w
 47Qic5TnYnI5u66fis4cAbI0RBgd4gCA/AMk4Pq1rTmtoCH4LnlhPeI6UIyvCaOwFNzp
 8ZUqHLhVjXRFpm1SPOrXxBAWMiO/Qi5Jag0aCsgi/U8VZmAWv/LrPQ1Swi5EG0eBlFyG
 67omfoo2jtG82HVKYOXIKoffhYohnfBQWDPxH1fV2VaHr81Ce6Qs5EGsLV23wrpEXOab
 u1c877h5udHk6EpGMgTT+NAFBlKHsaPtipZAAHo51KUqTzDEJUpanpcnm2Kj//JKYYok
 9hmA==
X-Gm-Message-State: AFqh2krhVb+4ybNO3wl9Hy5gUlYl11EfJLr1GYSh7HujAPEJZXC6CBNA
 bfh76AJK08bCGgND3egBtYELAg==
X-Received: by 2002:a05:6a21:398b:b0:af:e129:cc1 with SMTP id
 ad11-20020a056a21398b00b000afe1290cc1mr3198894pzc.27.1671234950921; 
 Fri, 16 Dec 2022 15:55:50 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 ix22-20020a170902f81600b00186cf82717fsm2171495plb.165.2022.12.16.15.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:55:50 -0800 (PST)
Message-ID: <19adeed5-ca5a-b282-2be1-eec67f757dfa@linaro.org>
Date: Fri, 16 Dec 2022 15:55:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] hw/arm/smmu-common: Avoid using inlined functions
 with external linkage
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216214924.4711-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rrw7sqwDllsY

On 12/16/22 13:49, Philippe Mathieu-Daudé wrote:
> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
> and building with -Wall we get:
> 
>    hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
>    hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
>      void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>      ^
>      static
> 
> None of our code base require / use inlined functions with external
> linkage. Some places use internal inlining in the hot path. These
> two functions are certainly not in any hot path and don't justify
> any inlining, so these are likely oversights rather than intentional.
> 
> Reported-by: Stefan Weil<sw@weilnetz.de>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/smmu-common.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
