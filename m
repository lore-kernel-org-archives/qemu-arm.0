Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1850687lfc;
        Fri, 28 Aug 2020 16:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrBuTh0YUORlKnXR3LPm9EbUPUpigsaFL0pv2ZesoVnhghpJkG73TjgN2ywTMn492Vzzr4
X-Received: by 2002:a05:6902:4a8:: with SMTP id r8mr4989306ybs.424.1598656068697;
        Fri, 28 Aug 2020 16:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656068; cv=none;
        d=google.com; s=arc-20160816;
        b=LiB9QL95P+FKyuJ4sreIgIEQ1goWiWlE1UWoyfGipsbQDLrMNHZeHIwmuIKsBEaUYp
         TjHOioG/UWp8tyRboLlAoTZeeCbx/o+O+zfgHFyM8hEQRHXy0S8wZzkPW4qri6/rjDct
         0d22k1UtqVVJZAaV26RPA69cnTmNM6rEmMn3mZLQiat67JLw5Fugqx8L4ulV3k68VQT+
         aacKSHDzZ6ybtz2axcCJKhce6PQwkEl265STU99popRMcM9//9svl6jMOlqg2cIZ8hvx
         zpsdV7goXiqIbIppy1UBEg/LzuR/8/g0E0zsk2X+t1F9KX0YWo7rjpFSnP8/eEADuB0U
         5adA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j61PhrfnrWXNyX5zCR9qZ/KYaECfYcFgLt+I/N7a9QE=;
        b=Ar6e9FZRIpXVu2hmrK/62W3ky9Kg7M18prf80LUmqkaag7XUyeJT1bhwAXV3ODteKK
         xX1NisJKgC62NLnUrO1Jan6Il5XOm3WdSEYWun8Rcp9iMXJmTN0G78sOLfbRsGeJjA3E
         BgnaJXTkdgGgR4HmvvShJlUIp5iDe1Ls4ZFlaaFnWZju6MxKtAeCzxpjbk+sfJqy4z8v
         LEnn6FYZ/LdfOLMNFqbHGMCUN6uq4TJlBhVsOmogsSorVzDEPjeniFK+XGZYrEaoShKv
         PZ0wm9xhvXZY6TPmp6o+Tk4J0FokyYx8gEVYVgoXD2OneIOvfAoWZW1Ot1OIp2fjQBdJ
         0hzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HH07PlXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si607309ybz.22.2020.08.28.16.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HH07PlXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnTI-0000Nx-2p
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnTA-0000ND-9m
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:07:40 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnT8-0004R0-Ll
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:07:39 -0400
Received: by mail-pl1-x643.google.com with SMTP id y6so337300plk.10
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j61PhrfnrWXNyX5zCR9qZ/KYaECfYcFgLt+I/N7a9QE=;
 b=HH07PlXbdlAwhwOrXUlj6GM9YfVZXemh3O1wOcKaCDq9DgSWcg/trmqrejeXELdSTs
 A0WSt8KhsUYElZ7UN1FQzSCos61KLbBtdd9LWiVZr1z9/pW4yg+BhHHIWMtRK85BSHz8
 9bU6vqlaY+x0mRg4I/yKfA1ZkxBGqOOqWDF7+QGYXJ7sbfbylTjWxUx8qveHBrxkz3wI
 8Xf+vHF4tfNLjzM+lnRcP3JnMZxfjJATkCypIpxB7iXo/k3yCUi21WMj4uMmUiUtNzvV
 OJyTKVnJDZOq49iCkmnDkCktiGABxVRPlcyXacqWkIc48gx3/r9yzSf52CmGxYeG9AHb
 K6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j61PhrfnrWXNyX5zCR9qZ/KYaECfYcFgLt+I/N7a9QE=;
 b=Dbu5DqDtaEqEgntkjT7ztplQhG7NhpPneC7f9emUeExwA2EgJQl30pKbCFnCqI5Gl0
 Yu5tdtnkuktblsgBC/n8E8c9cRExZ+yhdF/a6kc7/MGaIadYjRPnQY3FYZBj2KHaE6uW
 eq5n3ov18kUdm5qmoYC5b2/2z6wbY10Y8mqQ9JuHC1DKsiiHRBC5yfIQD24YUgdXmEA0
 Jds0rATxOsqy1apBiy96NHwkfGnKiTVNkElzhjRycKLl/mNKSp5mVEajV1qVWHLzpQmZ
 VryMqHRolu+tjVausH8MRgqn8oY2VUDt7b5Lf64sZGPP+ujlzGALUGNjir9ay1NJToZq
 uqag==
X-Gm-Message-State: AOAM531OeSM8Yzz22mlOTHS2/RC7DBsKDh2aQ6SFHlMt9hOwjw8zmWAo
 i34gmlQvP/RaP1IKioOYo+7zcYnFw9owIQ==
X-Received: by 2002:a17:90b:238d:: with SMTP id
 mr13mr974530pjb.132.1598656057117; 
 Fri, 28 Aug 2020 16:07:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k1sm486146pfp.86.2020.08.28.16.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:07:36 -0700 (PDT)
Subject: Re: [PATCH v2 36/45] target/arm: Implement fp16 for Neon
 float-integer VCVT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51f87f58-ce26-a989-71a1-7de5158ab35d@linaro.org>
Date: Fri, 28 Aug 2020 16:07:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: tOIwq+H4i61B

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon float-integer VCVT insns to gvec, and use this
> to implement fp16 support for them.
> 
> Note that unlike the VFP int<->fp16 VCVT insns we converted
> earlier and which convert to/from a 32-bit integer, these
> Neon insns convert to/from 16-bit integers. So we can use
> the existing vfp conversion helpers for the f32<->u32/i32
> case but need to provide our own for f16<->u16/i16.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  9 +++++++++
>  target/arm/vec_helper.c         | 29 +++++++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc | 15 ++++-----------
>  3 files changed, 42 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

