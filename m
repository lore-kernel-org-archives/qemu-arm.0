Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6430728lfg;
        Thu, 4 Mar 2021 09:35:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4swmtGJkXc84P5Sp503veYhQk/FxZ4G5Y0APjDRwrSXxhQDuULghCy8SdKLWb1u63zoya
X-Received: by 2002:a02:b890:: with SMTP id p16mr5072308jam.138.1614879348969;
        Thu, 04 Mar 2021 09:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614879348; cv=none;
        d=google.com; s=arc-20160816;
        b=1C1LJtHYerXKc5QUfVP3pEJi57j+7KVReHChkQXYZAvLoXYDCK9Ehn7jDMEziX07AF
         ltCbTbu7bwPv/wo61Skuz3XiohpNah0sKpgXVq6tga3l2bJJdXPTFd7e3vaGRKivWyo0
         zBtGPXcv2xaJfDZHQrJyLbkd914vq9opgKDCNqV4ZUE0ewrKVtM6q8RHRG5lgM/QZkIz
         G9A+oR/wxnVHsEDNGUlCP5gpW9bTnyKfO7TXz7BX1+GSybfKntK1PjEOmJwdZCgUp85d
         n3Kies9wSZghwccFssThlHo5x17tnsyO66v+6V5n1NwqYiAwedfnm6nf8mn3QoVjIl12
         mZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Odd3Twk1/OSSMurMclfYk/doOXPVWkIaQf2I3pNKJFs=;
        b=RNYqjxUKtUz70IH59fb6SEyopax7BikXSu2ynGEoqGGGkOEhw4s6kGBZHl2YiT7Zev
         OUJ03G5iqc55aCzAzy4eooPRWdheY6hyvySQ5HxHmpnt2Bdtg1rAq8/ALSeB+0vRkkSY
         nUoiEIdfUKFNZz5eqK29vIkb8pq+lHPi/fVlhd0viy6XCmxd2MauhxKTrcwpiCCN9Pnu
         x5TIroV5/baOZHNl+D0upb/9yeXz7rpDuSivHOIp/Gge5+HHabM3qmLU3cFKSPc6zOkz
         Zm2h2HM2LVgwnXZLWJN3bysNntV7iNsSptfEufzrLCwWmhcWrfZU/kMmf37Agtbam+pg
         D7tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSJ1cfKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si23897497ioo.103.2021.03.04.09.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 09:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSJ1cfKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHrt6-00078U-8C
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 12:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrsx-00077N-Fd
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:35:39 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrsv-0001Yx-S9
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:35:39 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q204so18388778pfq.10
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Odd3Twk1/OSSMurMclfYk/doOXPVWkIaQf2I3pNKJFs=;
 b=rSJ1cfKdqdU9cdJ4wNv2lVv+gUqim6uT3gA2upmADH+fyIe+aYuWyvFrkWEiWkRnJI
 BfuyZOdPeuPTXjcaEpqeENLjJa++ZyCmYUqHH5ZTGWuwlW1tdml2Z9nEnMMykrvf7+Rw
 uQeOvinhl8Y9GywYhotpvD53w+xtbrm+7SoBy7g4063aLkueY87x+5PvMSybnOBBWBP9
 dj4y+3ygXgNenjHJ2ZzK3CO9N/hppEnFHSDSM+WN1CaSwT5eOz5Z1Z5Kytr1FA1kQkGh
 rIgBe6vm+uYbYw37b1caR3N5mcaXEAW+YJMcEgRskD5y+9P6RfIeCJi3hviJEpGY0MSU
 55WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Odd3Twk1/OSSMurMclfYk/doOXPVWkIaQf2I3pNKJFs=;
 b=iyH5Si04bYM5WhWd8JmLOWrv7Im98qt5U9/Xm1ht3uhUw5LJdXueDqBlfHo1CdaN3o
 8vj33W6EIC+Ms/xKsPQRGsJOrrS4MbooEzoQl8NU7ZYUg3cGX+Zn51hjO8dZW4LNLX38
 LmKY12PNEwCatsi1JUom+ILk36PVNj8EmH+0hQHoIqj0+AxKptflhS306wiMxWoxpPy5
 4w0zLZPnULGXt6Nq7LQSfHHTkcIkuK2Rqy90RqC0OQPumW6kCQUcXVK+9RiA9IWQKOe3
 LBbMPPKWYTn9TI4xZuB+NW8zUf1vE0dCZIrLEEkuSUyYDfn9EL14kNlKDUPCI60FiHWB
 yeQg==
X-Gm-Message-State: AOAM531wRpMXvJvtTmOQLNGPnwpKGIu4krh9n0cN94pJaz+hNymiF6wO
 kzR7UGZSWo/FBlkG/rCpWAwvhA==
X-Received: by 2002:a63:792:: with SMTP id 140mr2861660pgh.200.1614879336416; 
 Thu, 04 Mar 2021 09:35:36 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b26sm49937pfo.1.2021.03.04.09.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:35:35 -0800 (PST)
Subject: Re: [PATCH 08/44] hw/misc/iotkit-sysinfo.c: Implement SSE-300 PID
 register values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a5250d6-a982-486f-074d-0ed39c863042@linaro.org>
Date: Thu, 4 Mar 2021 09:35:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tMIhHD7SgAtJ

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The version of the SYSINFO Register Block in the SSE-300 has
> different CIDR/PIDR register values to the SSE-200; pass in
> the sse-version property and use it to select the correct
> ID register values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-sysinfo.h |  1 +
>   hw/arm/armsse.c                  |  2 ++
>   hw/misc/iotkit-sysinfo.c         | 29 +++++++++++++++++++++++++++--
>   3 files changed, 30 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
