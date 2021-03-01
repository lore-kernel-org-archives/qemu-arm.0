Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3247281lfg;
        Sun, 28 Feb 2021 20:30:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTT6RFXRweAa75Sck5CG5NI5s5pEUWHYoARzizpvTScHWSh6nxYSxMSkOd++XnMXhHMvnu
X-Received: by 2002:a05:6e02:968:: with SMTP id q8mr5907919ilt.31.1614573010341;
        Sun, 28 Feb 2021 20:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614573010; cv=none;
        d=google.com; s=arc-20160816;
        b=cajRvPUQ7sqRhW7ogWBgWpalJS9aojA1ZZ6j3729X0QDjgaGSyAYDGtmTcc7GEhBIn
         wfoBGllBxadjSTXBUfae5dRCzc8IGz7wXkQyIqztrTFjhEfQyZYXjzgdLMDyPQs+qnW3
         fwjw/+dfij7/7BlrtqO347Ulpplb/oyesDhtoPLLh0yLWexnQVEZk2qdyPnRWZN44VSH
         5GcXg547l3sz4O4tvX1YyjI1xH+NTQaVMwy74+GSN9/iUg3wbTvmZhNRlKk+ig68Uvvs
         8fTnYB6hazUMxsLmnb4wLyCwAay2VgXm1ozbm8pAyG4Dndx81VFF3XhL+qHYXf2V4IZx
         lNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oZGgOL2NJmpqnjyC9g+IxSXO/NnjZwe1AidEpSi7A54=;
        b=VO6juIcwMqFCTTgWz4R3Q0VxlQXcwa7pcom96Pbc28Ccqir5Lcxd5GGNStHnjhlvwT
         TdmTVHtIZ1np+XYndK2fLgN1Dv15a6w46Td0FkrUet1+7ZoJ579xd/ZsvNPxg6kM5227
         s0YCnKR+wptH7W3Yn737ab6zKewEfMgYlJgAQMa+9ZhPVSm4qAN1vjfYMZBFpyNI8EOH
         OyeVbdIR8/mTorgorbw8VEtohcaoJusKV3koLhyE+2RgY7rl/SlEt540oK+E0RhJ3UiU
         04h0i04lrQPUIJRDZoApTx4mIN96rEjwCStYT2XBiO4+3y2xOsA7i5DmRVRXNHLSTT6X
         SzWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FfVxxRZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si14982646ilo.43.2021.02.28.20.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 20:30:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FfVxxRZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGaC9-0002ca-MT
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 23:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaBw-0002cE-9y
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:29:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaBu-0007vn-Nn
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:29:55 -0500
Received: by mail-pj1-x1033.google.com with SMTP id e9so7563848pjs.2
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 20:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oZGgOL2NJmpqnjyC9g+IxSXO/NnjZwe1AidEpSi7A54=;
 b=FfVxxRZP8joSUjZH9QqpguI0B2bXuto97z0mAyNfQEKReoo9DDu3VJvGEtw2TeblL/
 G+M4RtUrS8DbPkUxL1IHKariDfT79P3N4WZJhOxz8m16E8D8ODXGCftsOpJfUb5lfyJJ
 GaYoZUKPmT1FVAU9qgvc9WyZbR4ggYsEMzyLJ/YC76LGN1P4oDckGoBnhc+u6W5PJlcs
 fscgqtp8axomTeGBxy2VmVQ9WCgpAgOky2+0WyQn1wJaiB8ppiE6AlL+G17VEDr5fvD8
 hSmjMEsMVv0qsNvIGMUgyw0PnLKl01sg6UlR8wzGxfaoozQSl1pCLC5CC3DuO3VlDpKC
 5X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oZGgOL2NJmpqnjyC9g+IxSXO/NnjZwe1AidEpSi7A54=;
 b=MnuEiKqbY+3h3ZHlu4bq+prG+F3Euo3lk+ABREeXxsbuba6hKBC0RbFSnxF4wRegZV
 j1g3nnZ+H6y8uDduSExyhMu0XxiBYNbwRZ2FzF93LwmLYV37uHWB2aMtOveQ3PNhbFFr
 N4Bt5NtCRrBAFB0gHTesYrccqPdbAhMmItrDzxWZ0KKtlt4RpXajdAtGIUxRea4p9SQS
 pcd/fe4yZFQC09tFi1sSbi1GKvSaiYoFaqqaT/nH3hMyMy9DwyWp3d3xLEW9+lLb1OlI
 hNm6E/IucQvXB1mAXKCgey7JP5ZnxjB1tLKx16xyXoJIUlUDvYDOXVBm85f4fFBoa0PF
 x6MA==
X-Gm-Message-State: AOAM5318eD+hC2yZzVPTvEourwjEGeDBbKWfN/LkRaIt7taqU74KKfe9
 7NzOgxf23i2a5djSG8SyAz11Pg==
X-Received: by 2002:a17:90b:34c:: with SMTP id
 fh12mr15070894pjb.61.1614572993226; 
 Sun, 28 Feb 2021 20:29:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o65sm14318459pfg.44.2021.02.28.20.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:29:52 -0800 (PST)
Subject: Re: [PATCH v2 14/24] hw/arm/mps2-tz: Size the uart-irq-orgate based
 on the number of UARTs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9f2bb5e-0929-60cb-0de0-e6c24040eb9d@linaro.org>
Date: Sun, 28 Feb 2021 20:29:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eundeVNUgbNj

On 2/15/21 3:51 AM, Peter Maydell wrote:
> We create an OR gate to wire together the overflow IRQs for all the
> UARTs on the board; this has to have twice the number of inputs as
> there are UARTs, since each UART feeds it a TX overflow and an RX
> overflow interrupt line.  Replace the hardcoded '10' with a
> calculation based on the size of the uart[] array in the
> MPS2TZMachineState.  (We rely on OR gate inputs that are never wired
> up or asserted being treated as always-zero.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

