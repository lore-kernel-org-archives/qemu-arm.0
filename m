Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp620630ejx;
        Wed, 9 Nov 2022 14:38:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7fTKstAjM+tg5ffnWfgKyDUmWnX4+eoUZ+3XiXwwZQQGao3SbQclYxXqDrW+C+f6qSYLLQ
X-Received: by 2002:a05:620a:31a0:b0:6fa:2721:2e74 with SMTP id bi32-20020a05620a31a000b006fa27212e74mr1164137qkb.467.1668033515739;
        Wed, 09 Nov 2022 14:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668033515; cv=none;
        d=google.com; s=arc-20160816;
        b=nRcFmihy1gTXkuo/6rE/sWUklGVs43rNdVfWr7DBousipoH3q8lSmvCfq6IV5FnP7C
         PlYoeF9K2IK2/gfnWUhAH01InqgYk5CvigiKQjol2tMiFhB78H3qmDqleMhgs8epzY/w
         hnQoAFiOCEokXRHHiaFiItqlyrR7C+MC7HQRmWCdgJb00Px7YZgOg+MmCLelFQsTusjC
         BgGBcOJwvjy2xHnZVEILh/owuVDKSSeXCDEgZaGHNC6SthJjE8BG24APWxfGiq0Cs3j+
         wF1ynzg8IMyXBrK9sz8xeNxfqCCdgHFn6ueYmwLJ0BIdNnUv1wd2WgRo0ChuH4cDNjs5
         tGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Iy8yy8vlGlMp+knGqUVGwF0LY20Vx3+cmnoWREb+ch8=;
        b=D24S1KtvNSxjRlgFBD8eBdt/gg7d9H2qgOxE4qZPqjZVMV6A56H52trrXeYSZPHOga
         GtLSDKCBHBb+PDdi5PyaarqQGWoT8HFrptzkJgDSaCmmbL8ftlvS5cRqraDFRVkwGGX1
         JfXOjW2nCFy18rZr39FwC1wPMsb261vsn9AwixTKXqwvmICZcMcs71peBKzNL3Pgt4be
         AMeX4caCalsDQGL09cGnq8CdTtkcg2A+dSQUNsLnQeg5faFNO8j2ooAed8kdDpCjjCaD
         /Jg/vGUAUYJygCwYtPOmD3RJ9kLF7HuBxYLzRhRVaZZvo1/Q6IMlMTPO1GNHOElJy7SF
         bLmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxZFw0sU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe5-20020a05622a4d4500b0039786d485b0si9769221qtb.508.2022.11.09.14.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 14:38:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxZFw0sU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostiE-0004nD-TZ; Wed, 09 Nov 2022 17:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostiE-0004kX-02
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:38:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostiC-0003Jv-8U
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:38:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id l14so28046841wrw.2
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iy8yy8vlGlMp+knGqUVGwF0LY20Vx3+cmnoWREb+ch8=;
 b=lxZFw0sUJIJJhHcMs0q6xv4JSZYnXk5uz77g3f+ZvFYUIpCmdCYUv7d1UW3feohUiM
 NVxPkrJWbW/2ggEXTIszBBhiyCxZzovDcoLLFXbkrvRCKM7Gf63a0x2NxPbMU+hJ2DgJ
 5P0gcVrsPPLkJx2CKtnzT+4BDSRldWdNhzJSQB+8ddUlCs9d70XxUMU1zJv6BXc4/PAU
 hsqTEwhesPc8SeUxYoyJk7RUOFikxlAAKZrDXzktHVoejkXrtEIv/47a+jJgU5B2PdUC
 uXludtbLCBPSC9jYj+s3TntAjWgS96nt4A+BeDUSxc7jtsv5RpvrLabIi6oKJbi9fULH
 Bdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iy8yy8vlGlMp+knGqUVGwF0LY20Vx3+cmnoWREb+ch8=;
 b=tEkZxjGOTHBy9exu7qqgcU4ynsgtAM5wQ0I1PAjUlFs01TsYNvDL+2qETViXKbR5XE
 dtj1OjwYi1VRVW87KANJzpydAsK+cnmdvzTYWX4eVRMJ1vHtU2lHkbBnaM59D+yupkwD
 hpWCzz2g+2jyae3JLOAph12pxn+nXUZ1fTm1QDOnoX8mcrNnlCcP6KOvQwdKwD0uEZuB
 dAZZn8CgZQb651RGoibJiz/DZoKwQcLlF9QsmVgkJZBeYkKegUJk82/FvQQmtunudcZS
 5U43hs68g/qrhv3xPx0JW1Ly/LKiv7UU4w7uiAPY6z0hFfAEpf/XOoTYdHEzzM/QVkta
 kKTA==
X-Gm-Message-State: ACrzQf2S9j6kbov932mhB4ZE8DGMvjxbXH6KjAHtvIhwOARQOco4fR4Q
 EfE7Qc0788es3ctVF155yroigZdBSq5FXg==
X-Received: by 2002:a05:6000:110b:b0:236:c717:5015 with SMTP id
 z11-20020a056000110b00b00236c7175015mr37086947wrw.439.1668033502878; 
 Wed, 09 Nov 2022 14:38:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003c6cd82596esm3290315wmq.43.2022.11.09.14.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:38:22 -0800 (PST)
Message-ID: <a67d3ad1-babf-e165-c77c-8442a59acb70@linaro.org>
Date: Wed, 9 Nov 2022 23:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 7/9] hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: aCD2KDofG26d

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_ITS_COMMON parent class to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

