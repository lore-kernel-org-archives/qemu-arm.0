Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2453102ejc;
        Tue, 1 Nov 2022 22:34:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yOEORNOnWhfdOzL4VCauILGxQZWEemfucw5BXuW/UIuxE5k/nPcfF+kCLFPJOEIwODqIQ
X-Received: by 2002:a05:6214:509d:b0:4bb:e7c1:9d7b with SMTP id kk29-20020a056214509d00b004bbe7c19d7bmr14774805qvb.75.1667367247330;
        Tue, 01 Nov 2022 22:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667367247; cv=none;
        d=google.com; s=arc-20160816;
        b=ROa/tYKPIExqKUvldooBYvMjekpHx4pl+Xv1GKf3cNQWYD5GI+CyMova+4GNjvMOjf
         i0BbLocBf80uv2o9nnFPDqs6yKZ103b1WXEJcz6HkzSd4a/UmlWpbi2CACzbw5oShlC4
         up40pXqdvVv+yqCbtCOxv2Yw6E1zkathEQRVEE1ZeUNcItYf5d5d8yrAZgftXWE+D6va
         Zrs7ItTNiMHoQ/Ct8/UGdKWE/nGdeqF741LduFm0IEMZw/8MWQTsastReXaObIzX6LNy
         hAf0PZPCVSsuGRHnVaikOZ1nFecEF1txv+TGGCMIv1DCvy26f1aisBg262kGYVzc2pKn
         gHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8zw73O248UyVHdONBlSCrjt6b9cvZV9DYu3FgBB6UNQ=;
        b=YfNwJTIhCfpA65uLGv+sVwTQHOEXFvPmFAReSU2mIAf1/oHs0CL6rXdM1v/oOobqjE
         LIZakGB3bxGf56hktjHdG4kk2U2UMvoBeZhdPQplb/P94gt4us7RjXgmROrOsuOxhu6m
         On9WfGJR9CRAKpiMzcLN9wxACOzthU37Ow5HfPytWVpOSOSLVKi+04DW/NmoEV+kEWIC
         8QeFK/+xidtPfolvdhgZvocu66qHX6Oi2YQ3Z3t0j/ofkJJRabYpaMWWiJeHo+4SpRpW
         qXxLWEsPnaSrEh6kJTOmqgoxtPxBkfEzI2KvMMszwVHTRAqcAFyS04cjkH2Xxud4VXgR
         yO9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvBUAQL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05620a241300b006fa2e04adedsi6331683qkn.725.2022.11.01.22.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 22:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvBUAQL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oq6Na-0000Vm-II; Wed, 02 Nov 2022 01:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6NY-0000V5-J0
 for qemu-arm@nongnu.org; Wed, 02 Nov 2022 01:33:32 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6NW-0006mJ-HC
 for qemu-arm@nongnu.org; Wed, 02 Nov 2022 01:33:32 -0400
Received: by mail-pl1-x630.google.com with SMTP id 4so15591992pli.0
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 22:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8zw73O248UyVHdONBlSCrjt6b9cvZV9DYu3FgBB6UNQ=;
 b=bvBUAQL4JEQOciIYTSVpzQxgx3FpoRMsZ+UYUM93ly1gMbChz7v/BNx5BeSfD3bCHd
 mfJ0XUgVEmuLdmC0UOOBO2houZrnzqhwBXpS0RvBnpa9zZIIWLLQygcaC4lAdlauYqtq
 7hGYpxwHmZxyNPlt19QsnJ/3/bNGFZ7hcjUf9Y/fXOAf4Mo/N7AIU6rygK5Oz1VMpa4e
 3WoNrXcNCEqUARQAkB596ok9mGu87THKc7xXXZ69JE6DdmLYBQSMnzQx/GepdQlpHImx
 ShwEDXRD4YYSEB9/2iGxZxKaym+ZaWxfPVr6J5BKcj7ibrWvgvCZIgfxTG7s08Qz8Lvr
 zrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8zw73O248UyVHdONBlSCrjt6b9cvZV9DYu3FgBB6UNQ=;
 b=Glg0ByksMO+czIQRcpvqoMFbuUyMhQM2NQAH03Q+spknD+8HNLpDjcaPAqYw4Sze2j
 T1FpI3iBgQAmI4fUwyaWVU5q1JScZgM6ipWdtiac9UwMqoNAX5FImvtaSXHok5w8hO0a
 hDY/XQ6splQ9SQU1SOmhgZe+E8f+cL2BTwA81VAiNa7NWtu5Jz/zSsnErERKHPift6fy
 JlCPMDeAnUcSQxeI3KzsiDqXAjMh6gDl1cgWQ8JH/ndwdYFgJySUFMY2mbJkOeoxFMkB
 VIFUzz0MeFPcEIj7vHRv/dtw867I6xKVp2560hlS203Z/3Klv//u/qcGsI2hSsy6ZyB+
 +XBw==
X-Gm-Message-State: ACrzQf1PBFn8cGrgYR8HncHd2H9DXjCZHXFadB3/nNTj9/GXYQ8OL1HZ
 uRQWFz44slD/D0uUsbHw5gtvBQ==
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr7805951plg.153.1667367205629; 
 Tue, 01 Nov 2022 22:33:25 -0700 (PDT)
Received: from [10.0.0.242] (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a488400b001ef8ab65052sm518021pjh.11.2022.11.01.22.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 22:33:24 -0700 (PDT)
Message-ID: <2b021c6c-7fdc-9ef9-befb-ff18991e4776@linaro.org>
Date: Wed, 2 Nov 2022 16:33:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Content-Language: en-US
To: Ake Koomsin <ake@igel.co.jp>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221101064250.12444-1-ake@igel.co.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221101064250.12444-1-ake@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7E8akCFsecZ8

On 11/1/22 17:42, Ake Koomsin wrote:
> We need to check HCR_E2H and HCR_TGE to select the right MMU index for
> the correct translation regime.
> 
> To check for EL2&0 translation regime:
> - For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
> - For S1E2* ops, check only HCR_E2H
> 
> Signed-off-by: Ake Koomsin<ake@igel.co.jp>
> ---
> 
> v3:
> - Avoid recomputing arm_hcr_el2_eff() as recommended by Richard H.
> - Use ':?' for more compact code as recommended by Richard H.
> 
> v2:
> - Rebase with the latest upstream
> - It turns out that we need to check both HCR_E2H and HCR_TGE for
>    S1E0*, S1E1* and S12E* address translation as well according to the
>    Architecture Manual.
> -https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg06084.html
> 
> v1:
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html
> 
>   target/arm/helper.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
