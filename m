Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp284790ejh;
        Thu, 25 Aug 2022 08:23:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7n9Dr/CrOZisy0+JPKbeFpupB6i12x6CTTNO8iZ+cAwjHA1FN0vbbE6dMilEVTtbO4Ah9J
X-Received: by 2002:a0c:b3cc:0:b0:487:4ff7:407d with SMTP id b12-20020a0cb3cc000000b004874ff7407dmr3987924qvf.95.1661440998061;
        Thu, 25 Aug 2022 08:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661440998; cv=none;
        d=google.com; s=arc-20160816;
        b=T7gh8KuG6hg9Yp8uIimTGp4WWvpfDwu6A5vPjfJV1cS2Aj3TTakGFDhxNs2Vx2betN
         fMw3mM1Qfqx+2Cdwfjcn7t1jJoFEUYgvy6BtXBHFNWbblJDEZCvCCUuzzYeYMSEtxzmv
         mO0SO8jDp7x8z75/qzA7ZisDDYdXuBmTJcqh3fzkT+YwEaCJF3VaIWK5Qy+J+tyKe4rq
         leQdz3yZArPrYmfmUOleiU0OMvcaFD0zJZVevPe/7E9RNmx8HC81bo3TR0yx8f8+JxNL
         uLoaD51FkD65GLWWFwEfa0IzUdw0E89205wYTAI6waVnmFJHwINfXcOrrH7z910JCZo8
         PChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iameHqBelA9xxeSH4cOGesEMxtnS6edYLqzqccbR/I4=;
        b=e+tMZWGDKqMYZsLcWoy2u0Ges2hJKNIlX3PU09/BGLk8OH2fZOA29xIX4f3D2JwB/r
         gURz3/48m/ZOAmbC+edyEn9h5kp4VqILYbtLBo1EwwG5eBh5oxrqnthx0EgXYFo63UHf
         iCrZTvbDIu9flydB1gkQNQyE8nlaaXkVg2do4ozhF0QM8/9CQIUhXqA/oLMszU0Er12B
         7Yt3eB+5YPq8OamHR7BblTxhYSPUwOJWieZxXefzEj/Tq2lmUNclx3N7r+WcQLPxYJXY
         4DViyvWCYtnCEHUWWDOAaLUBj+q+ljiYDm37D2BIs0KEcI27VMrlT1+uYcX8bFUux4MQ
         Qkzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULiC4A5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn1-20020ad45d61000000b004972d281dfbsi561286qvb.16.2022.08.25.08.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 08:23:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULiC4A5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oREhR-0003PL-Hi
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 11:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oREhH-0003Oz-Ss
 for qemu-arm@nongnu.org; Thu, 25 Aug 2022 11:23:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oREhG-0005DC-7W
 for qemu-arm@nongnu.org; Thu, 25 Aug 2022 11:23:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id x19so18807756plc.5
 for <qemu-arm@nongnu.org>; Thu, 25 Aug 2022 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=iameHqBelA9xxeSH4cOGesEMxtnS6edYLqzqccbR/I4=;
 b=ULiC4A5TAhATJ4/FE+mOta3+i4hDLR7gBqe3u6vyMLThYBSX6a6ZtkCiljnD7oc4Ir
 DToTsresB+/xjlUYX8/uwrdyFSeDglSPs/7JQIAcYwKo+NY7J2LHPQl5VY5fkaFh3/No
 wd/gqQXL2+CXSLSgaISnFztxF6sNFVh2fgGWs62modwWf3kSERnJYLuiYum/nM2sgKuQ
 q9aZ1Qr6wnWg1YWETPdvXPCnX6BekLTvfUXqYOMeCYmfMt5/9klByg0hBuPyppoWwusu
 LtdKofaHbFyrbaoZztB9X7Q67qFC20rhVA0d0CNCng6i2yPBybLYj9lMdtJjQwGVnAdO
 DU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iameHqBelA9xxeSH4cOGesEMxtnS6edYLqzqccbR/I4=;
 b=nqDrFhMkta6ALWqj2m06NdohqhNryD+PfcKGnJkZza1ebO6A3bHC7zlTsoO+FS1GtU
 rytJcpG7N9JsUL56boBpu8NniEeXMTq/8ksYwqHY1SbiHr0eFwqyqLfxc0ra3eBNdOWT
 XtH7lQjZgWwdYnbdqOpDGO3AuJRh+LQ3pnk1kTXdao20OSdhcvzMQcb0rEjRQ4UwyKxq
 8jk2bOviJ/jV2jFENk2DQjwOAEOKlroOpRCm2OZjvcHmQEk/Z9ZOwigyf/gRopizNhHV
 DFJbPj4/l/GKhr+myO3+rYZuWjBUzJfxM+CgNKgrxsuPUMlXAh3skk0oh6tmC3peP3CQ
 CyHg==
X-Gm-Message-State: ACgBeo2g8UoD7VwBIC07DE2JU/ganhbJKEFut2gd/NxFslnpUn7JnPK6
 oX5YSCosLQc8l9BI2Dynx7Lh9Q==
X-Received: by 2002:a17:90b:1b46:b0:1fb:de2:2e77 with SMTP id
 nv6-20020a17090b1b4600b001fb0de22e77mr14209557pjb.143.1661440984616; 
 Thu, 25 Aug 2022 08:23:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 mz16-20020a17090b379000b001f50c1f896esm3694848pjb.5.2022.08.25.08.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:23:04 -0700 (PDT)
Message-ID: <08249dfe-52b9-3048-e6c2-2be0414b10d6@linaro.org>
Date: Thu, 25 Aug 2022 08:23:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL for-7.1 0/1] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220825085710.34800-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825085710.34800-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IvVhhSsfCHYT

On 8/25/22 01:57, Cédric Le Goater wrote:
> The following changes since commit 9a99f964b152f8095949bbddca7841744ad418da:
> 
>    Update version for v7.1.0-rc4 release (2022-08-24 19:27:56 -0700)

Too late, as you can see by -rc4.

r~

> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220825
> 
> for you to fetch changes up to 7ccff968f65cfad573bc0015cb0ab800d4337a6e:
> 
>    hw/i2c/aspeed: Fix old reg slave receive (2022-08-25 10:46:42 +0200)
> 
> ----------------------------------------------------------------
> Aspeed queue:
> 
> * hw/i2c/aspeed: Fix old reg slave receive
> 
> ----------------------------------------------------------------
> Peter Delevoryas (1):
>        hw/i2c/aspeed: Fix old reg slave receive
> 
>   include/hw/i2c/aspeed_i2c.h | 1 +
>   hw/i2c/aspeed_i2c.c         | 8 +++++---
>   2 files changed, 6 insertions(+), 3 deletions(-)

