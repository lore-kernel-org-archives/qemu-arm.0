Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp81380ejb;
        Sat, 28 Jan 2023 16:07:11 -0800 (PST)
X-Google-Smtp-Source: AK7set91fgEpzU29eAbKJt84GOEYmhZXk06RwDTx9aWfeF8H2JCTXzKt0C7fQAPbq+LZ/vN3IVD6
X-Received: by 2002:a05:6214:1c49:b0:53a:ee35:a4bd with SMTP id if9-20020a0562141c4900b0053aee35a4bdmr3766398qvb.18.1674950831342;
        Sat, 28 Jan 2023 16:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674950831; cv=none;
        d=google.com; s=arc-20160816;
        b=C1+EpxlRA3NDly5hZdT9vEMRM8DNhlY7d1pA2zjhutT8Oy9ziR8OCbiME+qdCsS0ne
         aEUTXMgT+RnlZznkrfju/8dYtje1WZTa49d/Bh7G7vUclM/6B5M2tNpnhFsXdxSRQNOl
         W+pkDsLcScpub+bpB06KDLBJ/Gve1ee3PqD3pDWu9VUfy2OqhzUTGoTeCyjy3naxdmvK
         cjWNwR0Cu7dYLSsk6xFwl1zT/aadnmVAewnzn1Ff5InsxVMd5ry/ZE5o8T1xUFdAtCzi
         K3NwVUYcKMqa1CXYucGg5n6ua7HVJwUbIRvc+1REQr+BDYxXc2e93fPu3S3gNGoLc8d1
         4lBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=22dmW1rM1iGIgMpX3VyBLcUPIVpOPLoCDG0Drd4wkbg=;
        b=ITmdVCYoB6pOZ0smvk5xrmZ3qO5iDRW/NZ70yVKLZ8IL54O3ktz9zZYMWMfOEG9fdr
         /sv2JhnBCKhdulz48yiI2lmzY3YW92al5wzTtrmYUnnw82FCc1VINKsG3tFfuHpeiA0I
         gGnLGCCO2U7R3QyHdzTF22lbCt/PJXOHcj12TuNjw2zbilbyg4y7mIeLh6+4fRt0mxo7
         CSp+vbEIPnx9HOQy2ZgPyw8IPWBrlaf1iAWjHqW/TOGSGTMcwc/HQOi4pIAka+oxzDIH
         5wh2VmO6sq/+pTZLRr+qYjfrZxRBn/2HB86a2cFG7LrPstWky4ztC0giKXufExd57PNW
         Zr/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oFyj+ViY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw5-20020a0562140f2500b00531bd0ec2efsi5446264qvb.34.2023.01.28.16.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 16:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oFyj+ViY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLvDU-0005Ec-MJ; Sat, 28 Jan 2023 19:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvDR-0005Dj-PS
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 19:06:37 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvDP-0000bP-UA
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 19:06:37 -0500
Received: by mail-pj1-x1033.google.com with SMTP id lp10so8082605pjb.4
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=22dmW1rM1iGIgMpX3VyBLcUPIVpOPLoCDG0Drd4wkbg=;
 b=oFyj+ViY59sAHh0fYfDWzZ7U9e4hmXGyvknBzqgUfFqbw86JoE+eNYExxwHvWaj77p
 dTTs9XDoCu1qOKJcW9YhGVZdbdbXhdH2mPDIRtGkAPwTaSQhZbAYVqPyYzfHnv6hcaAp
 b/lczdbkYsY35h72HpZUdV67OXBAxHI+WDQ5YC1zeIYtdATdY40GBV76VGexwp3kwFJR
 X2ULcX1vcHzzacapBecHjisI8wJBvLHQcYqtKg1Q+aaty0fk08A3IdZGvgz4JFbXBrCg
 0IucSseQfRH0rAYdEENfljqYAB2BrkdMEbPEqjyGGP8/r5sZnIGojwi5W6Px5qrjbNub
 Uvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=22dmW1rM1iGIgMpX3VyBLcUPIVpOPLoCDG0Drd4wkbg=;
 b=yKSmFKOd5tS23mmCihugo7zW61LxnkuK+I4eCMpjyKVGBDWIZGD97GV6yjJQaoTfpV
 lvdjHbmRCoVAhlzu7AyS1VAV4W0no5UPWffvJHsYtaKsLHAAQnslvC1cc/CEJaXuaa1e
 a/xePVxm5UgXD+4soN8kHWn3PwyO5YL3N7RN+tynb4go0Aa4goxTcWTGc2ml1BDiiGUD
 7SqbA5gEnCgqQ0Y0I4SWlw5uSQFQRRcow+NGMITxSG1J+B38gylMmE9zuDI0qt4JzPUH
 NNj98Ch6890ehnTMgQXN6j7ENjTivOQD4HyxqH2Wd8sIRIH6aUs3q7dpTdTtyuwjCSV4
 WI0g==
X-Gm-Message-State: AFqh2kp//14jZ+cbp+OshxgdYsgR2V2Bb0S0OdHBYNjnTm8n1j1pJI6t
 RVgY+NCafSfS4+g0692CmO5W+Q==
X-Received: by 2002:a05:6a21:6daa:b0:b8:2c67:8f7f with SMTP id
 wl42-20020a056a216daa00b000b82c678f7fmr60542714pzb.47.1674950794211; 
 Sat, 28 Jan 2023 16:06:34 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 6-20020a630106000000b004784cdc196dsm4358246pgb.24.2023.01.28.16.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 16:06:33 -0800 (PST)
Message-ID: <191c2049-0cda-8517-659d-f1f1473fffc4@linaro.org>
Date: Sat, 28 Jan 2023 14:06:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 22/23] target/arm: Implement MDCR_EL2.TDCC and
 MDCR_EL3.TDCC traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: srQs3Vv7nYIF

On 1/27/23 07:55, Peter Maydell wrote:
> FEAT_FGT also implements an extra trap bit in the MDCR_EL2 and
> MDCR_EL3 registers: bit TDCC enables trapping of use of the Debug
> Comms Channel registers OSDTRRX_EL1, OSDTRTX_EL1, MDCCSR_EL0,
> MDCCINT_EL0, DBGDTR_EL0, DBGDTRRX_EL0 and DBGDTRTX_EL0 (and their
> AArch32 equivalents).  This trapping is independent of whether
> fine-grained traps are enabled or not.
> 
> Implement these extra traps.  (We don't implement DBGDTR_EL0,
> DBGDTRRX_EL0 and DBGDTRTX_EL0.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/debug_helper.c | 35 +++++++++++++++++++++++++++++++----
>   1 file changed, 31 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
