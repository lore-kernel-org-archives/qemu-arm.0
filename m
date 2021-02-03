Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp459100lfo;
        Wed, 3 Feb 2021 10:28:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt4laXegzRiuwJCb9SpYYJwdpfc7HnHaMKYuxgt+O8Vet2u2p2PXe0A3k9vdmS7v5d07rc
X-Received: by 2002:a25:83d0:: with SMTP id v16mr7107772ybm.40.1612376924208;
        Wed, 03 Feb 2021 10:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612376924; cv=none;
        d=google.com; s=arc-20160816;
        b=gwgi1aJyGc2GkPNOUVp/6i3oFYsdI1qtswALow3k2DEsJEsTCSvVfnon4acyxoO/fj
         TOMUYMrcWPIw1bcfga+RbxD1BK/V/svNVotdv/iPZJWc05mdGQskIFsu7paEEzl6rhM7
         KQ2vYS5LONB2qzziHW+Z2wEMfA0QcClDA//LJiTSPM4gLsnH2QLYyU1NUN7tnBeinrRE
         a3plvDEaZB1cXCnXNBvzHvKboyS9O3HriIN7MC/KATjI+vswk17wFvOJitGf+e6m9pn2
         Ku0U8o8C1QvAOISL0uwfnucHVLXtunqfwo9QWrhslXlyzLovlZksKT3tz9D2SFoPxEJ6
         48uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a3tu9XUt/J0ThZrC67TWP1h0eqMB27MzYZPXTgo1riE=;
        b=wqK2DBlIpTYXDHH1YpoVTv1ffxcmscAEGub2IZ94nZTOMEUJPIgYdt1N4jy4pIGmqi
         Gd9GXI06ZhHSAn02C/ubcN9+eBMuzbBNo0wZ8GuYAyRY7Nhc+lNXUA8UvjUSFB/c9lVo
         FFkAUjVfNSl5ovRhKMgqpfkZo/ENJaipHl6gS6a0xlTq912iLJ2euH/3N+YYaTZgIBS5
         3UO9Bm4CyO4rqzduiBMSss8gBt5zwNuBoCnN+UUmzjLgL0KxiAbGeusg+wAZ+xuSomdh
         utSEmLXb1KusGCZ8niKWW1fBkoNGYpoTi7jtImXWnCQdNXmsXdogoqqf/CpqzrKHuI3f
         /8Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q81vj3bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si2923939yba.460.2021.02.03.10.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 10:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q81vj3bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7MtP-0000Mz-HN
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 13:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7MtG-0000Lq-2K
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 13:28:34 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:32871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7MtE-00040F-3J
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 13:28:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id d13so353274plg.0
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a3tu9XUt/J0ThZrC67TWP1h0eqMB27MzYZPXTgo1riE=;
 b=q81vj3bTXl9tlkyM3InBQ3vvBK7j0oQ25paD4svfw0gINeyXpwiapc9KeS/6JwSC4I
 PtTAaQmpgw2vtlm8r88OFQPgKvZUnke2LRor5KN/nQdMyMOmACvS8I9SfvTr7E7ATK4t
 mOwai52+dihF4WwU9kRQCEdfrdyAnwb3x9WoqL9NEc5Tlsm7PFMiAMUS+pEoxY2+NFYt
 DZs4TrWlnivyDma8jAecGj1noQ740FHo0iszJO7hZg/oAqFheyEemyNkB0MhUq7UyYg/
 +D9XvOPfhKcsN4/EysaxzsalJsvi0y4zySUHrFRosHZmC7jPSdidsOPIj83A7muZSG/I
 yb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a3tu9XUt/J0ThZrC67TWP1h0eqMB27MzYZPXTgo1riE=;
 b=U00Yyvdwx5d4lMRffxeCYhsVzzf0d+93lihFburcDSFQiwf55GjY6kwOP7R7klZ9r/
 Uq1O7ynEslQzN0iMAtUuuGF5pepigC+Wpf65cz8b92hQl1zzjmr8XTYFTLTnkUnd7Yzb
 P5qFvcu4H9hvrjQl/4hqMHzOPFAT8p/wNPph7TbAG+TdnW6b0WRXznwSvY/zFT1KFAEV
 YNQ6suUKMBIj5JWtx4yG+7F8c94eiQzkgIfeSOPbeKN9OvuIhS9pLZbnwM7ASFkVATFr
 0yrm8t+KtUeoErUt4I2KZ5zKDh9sxNGtzo4okS9bWU9CJ11CjW8wuxBFxp+NN2OiG9Y/
 dPJw==
X-Gm-Message-State: AOAM532I+seul1oAvR6PiLrTLvhYhDwF2lq/tr9sbiRppz1Lg1t7vfsq
 o6NlGNDX3C0yo7Q7bDYRDlkDBQ==
X-Received: by 2002:a17:90b:1088:: with SMTP id
 gj8mr4443909pjb.35.1612376910521; 
 Wed, 03 Feb 2021 10:28:30 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id bo1sm1611325pjb.7.2021.02.03.10.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 10:28:29 -0800 (PST)
Subject: Re: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>, qemu-arm@nongnu.org
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
 <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2858ca66-8abb-f90c-7af3-0a21801e6002@linaro.org>
Date: Wed, 3 Feb 2021 08:28:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbOtMGGhFVYh

On 2/3/21 6:55 AM, michael.nawrocki--- via wrote:
> The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
> to 1 only when there is no support for AArch32 at EL1 or above.
> 
> The reset value will be 0x30 only if the CPU is AArch64-only; if there
> is support for AArch32 at EL1 or above, it will be reset to 0.
> 
> Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
> is supported at EL1 or above.
> 
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 16 ++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
