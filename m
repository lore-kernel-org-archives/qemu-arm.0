Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp40309ejb;
        Wed, 8 Feb 2023 13:52:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+hidm6gEAs7PRJv7/zXkaBX8RfvfnmKSejuJKtNTPGoFM7kuSd5Y9EZK/JAYzawVBiLjGx
X-Received: by 2002:ac8:5fd3:0:b0:3b8:6930:ee6 with SMTP id k19-20020ac85fd3000000b003b869300ee6mr16450167qta.21.1675893119845;
        Wed, 08 Feb 2023 13:51:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675893119; cv=none;
        d=google.com; s=arc-20160816;
        b=VTOt6s85qmgSrJne6yyRJyUF8GlzaZUB2ds0c3gaAIKlmcRpLAsgoYVJcgsxAWaloD
         WSh+iHdS4DrYNPFYEhLwWqa8gLhPvsR4MfHgzaQVTDue3MPFmXdylkshhFuOElgasU0h
         ZYPOhEFVa2U/vxZmbVSyQSAbJsvFoO75P12Pync/mKailjPcloVyBsl1LLVfvcvpxK3e
         yYIp4wS2xS37YYS5R46nl8B1/yV/ohDCIrYpB11Ga0mlozg3PqnprrevJkD6+IXLuUIL
         8jhyr2l9SkiS+5C5/dX8n+QGMTmoI3EA0T/9yShP3sbY1xiILtV3XYxtBnpHKrKtLKDE
         oKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=05LT+mpZ9xuXMN/HNZfAzIm0Bc4e4tmmE57FFRYy7ew=;
        b=VULf1gCeQx9rVr8YWghkic01uSE06+Zrv0/3cjvVRdNxhgBYxrTzFZHd+31hXuvHyP
         TlAYENYdu8uJgdxlQoY/T/fxcv8QffSipBjF0p5QbgwI7Zp1wik1//QnijTvf6VtOK+L
         bZlsG2dNb7/uQPiay67Xr2hmE9cBGlVLBTO2krcIDM3lVHZI3zV6KYWD/2+sTseGbbnJ
         jYhvmZep1iClPk8OEzDqV8ty9mN94tshYOMsMX55d2cEYvazku42hP5Q/WJll89mDgWF
         dYRr+gKHj1237M9TRRDO4slzWUek4GB3+CpkOcClTT1bdUN+s0RrjMaiY4GQfQiXGjPX
         mRpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JPTbIiri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26-20020ac8615a000000b003bac7925889si3080606qtm.412.2023.02.08.13.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 13:51:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JPTbIiri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPsLu-0007U8-AW; Wed, 08 Feb 2023 16:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsLr-0007TZ-Vm
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 16:51:40 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsLq-0002xU-CN
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 16:51:39 -0500
Received: by mail-pf1-x431.google.com with SMTP id 144so2489pfv.11
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 13:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=05LT+mpZ9xuXMN/HNZfAzIm0Bc4e4tmmE57FFRYy7ew=;
 b=JPTbIirih3NlXGboQd7BFSlQmgWKZhOP/z8Hz/Al5L4NvNelanXkcq8QOoFIvEjCm9
 EgiodoD7BT8KsDYXpuNtosgYgqKL2N3T+uL3QPUwAx13MJcHmPZaVnJ9BSlOQ2GxYK72
 mBfx+K7gD18TILqGFZHFGzwuidbUVXGEzupzcPmgkHDrUiKG6luZtTWda6ExzBq8eOyI
 ai/Qhcq8QCQ5jhdZxd+6TO+wq0oEUWnkT6WSacLpssB4LxZuClp0DxKe6XJOpQKKgJAF
 gzfSh+ZASNklo9euRTMiQcqz5azLIJ3NCdDeK5hMGq8BJmQCcuXBkgCCmeOEyJRoELlW
 dYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=05LT+mpZ9xuXMN/HNZfAzIm0Bc4e4tmmE57FFRYy7ew=;
 b=QcRd+0MYnhb7nKoDLrQRPcGIHrfhmy8azZn378bJlZh4+EOJUYicwGNLEpuE96GIHL
 rdt/U7c8yzKfF9iN8ctri6HQBL45l/YGobqZbcQ50WK6UnErLk9cESbpTe76ym8yB/Ba
 7HtfhS12ARJQznv3UwUMuJHA9NJ6BlyfVyCLM2iOUWCuAzzJk8exImlUc1cvqAupUriA
 txVEQPrlcMifC0BXDBcuwz/rJCNhJ3mzq7bLg0QPY8KfhufX/NKmoH6XWoEZ6oWUYSMd
 EMQG1LLDjFIe/QSaoGfP5Lt7KYJKCgvijlgVmqrgFyXWMZ03dpFBZsXGkqdVeePQUp9k
 frDQ==
X-Gm-Message-State: AO0yUKUuhq8rqPpWCY2012tmydSq6d3oiJpSH+EDa0nPoBwORPFhX1uE
 9X/bz7j9Np1Lw5ZnBTLEulkW0g==
X-Received: by 2002:a62:1a4f:0:b0:593:b491:40b8 with SMTP id
 a76-20020a621a4f000000b00593b49140b8mr7283318pfa.4.1675893096691; 
 Wed, 08 Feb 2023 13:51:36 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 o185-20020a62cdc2000000b005815017d348sm12085922pfg.179.2023.02.08.13.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:51:36 -0800 (PST)
Message-ID: <adc3f811-c2b5-8ee2-1396-dad9bb6d3911@linaro.org>
Date: Wed, 8 Feb 2023 11:51:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/22] target/arm: Add RME cpregs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-7-richard.henderson@linaro.org>
 <CAFEAcA9vW1Z+6c7HWh+s-d74kFrpBm3JDMCzdY_pqQh7-JPjVQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9vW1Z+6c7HWh+s-d74kFrpBm3JDMCzdY_pqQh7-JPjVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
X-TUID: 5gQxVo1+EEp9

On 2/7/23 04:53, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL,
>> PAALLOS, RPALOS, RPAOS, and the cache flush insn CIPAPA.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h    | 19 ++++++++++++
>>   target/arm/helper.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+)
>>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> as far as it goes, but don't we also need DC CIGDPAPA when
> FEAT_MTE2 is also implemented?

Quite right.


r~

