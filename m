Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1647930lff;
        Fri, 18 Jun 2021 08:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz18VkzNyOc+BF2XQY02mmcsST+8+O0ZfO+DCyxECgOb02alXh1dlpMlC2hQbrwWfpqhJ6U
X-Received: by 2002:aa7:d7d3:: with SMTP id e19mr5492392eds.46.1624028893794;
        Fri, 18 Jun 2021 08:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624028893; cv=none;
        d=google.com; s=arc-20160816;
        b=KVw6Ct0L69kIvdSqjxBWjnAm9ZSOn6WUwARKmq4gKK+U7xSiupwy+FuYWN5qQ3IG9m
         So+IDHaRJTC4oiEp9eLXk+O04jPiBIdgsG9ulHAL3UtlIGW1e93UGVBDrRSzNnTQxx/9
         px2hwPY8X+KqCKiBqD11Liqol6SfpIzQ9vAGPl2n3bx7vrkXylXO9uv+CtQzPr/OJbmh
         FUEjg9FeXJYww9XshA8Lpu+va3Qf701k9Z8bBsuLzS2MPn0GSydSZrsYEHDKvHquBrw3
         tEPAZZje1FzDLTFjBZOIz0wnbz8XgDdq02PWxe/BKclLPPn+0D34VGp5TPQNGMnH5Wc4
         fyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NdGbtBsV1TZZ2yJ2qix2fUZK+fELs5GygZVmfUmXyMI=;
        b=pS7kdnUjPG+QqNxNzyC+sHpBXvvyr19XjQ2SqHD0TrGeKO/kgjaKqigT0Lg/OJ2q3L
         cZr8fkrXa+LA5plNwDugk2c1whAVJmCH/sb005M7XCAmeRDB4WUxvEG2gsDmyrCQ22iw
         AiPi4evtVHmfEooBSnrk1iPr08VKqFgLxxRaMjDTJfUa6q6DDH9yCYM0Hf/Wkqwp71ZX
         9bppRUP8zBJ66azvy8vVZeym0Gopj91aDvfc1AvAm0v7XUKP1+bpMe8XOAI4LGJHM66P
         e6ywxz0YNn8/HkoWX6kaV200joHMR4Hyp3czFGrXMb5dlpXs/CHQN56+flvzHfXAPOaH
         34vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJLQh2Ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si2517949eju.463.2021.06.18.08.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 08:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJLQh2Ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luG6O-0001ju-Ud
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 11:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG6F-0001ia-6t
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 11:08:03 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG6D-0003hW-H3
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 11:08:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c15so4734747pls.13
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NdGbtBsV1TZZ2yJ2qix2fUZK+fELs5GygZVmfUmXyMI=;
 b=DJLQh2AgPBTd5H8ANyEWgYUCQhlk2RSzohZYhAl7WG5VcZK0dRISn9ctXrzwzh30mZ
 urjc3i1AUftS+dDsuj+I1bM7yMohXKfuR5Z6w1I7SQrJSq387IS+wfGciUO3lGN1GhVp
 5b7DJf0rPHQqjg3MvwOAd56FJx68K86164B3kCFLEb3YGOFroVoMemrDqeWbzMdCjLnT
 uEQjYcZbK0xuAF9U4MLooADEaIhcOMFCokT9piGuaju6x6xbWas+N1sro8mN4sutoNa8
 z/kpQSemGLrtGYdyw7SYfQTRJo/AUq3qGXi+ZoIaWV+YySqkbKnhfiawCVQCRITjV+sS
 UOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NdGbtBsV1TZZ2yJ2qix2fUZK+fELs5GygZVmfUmXyMI=;
 b=umypemn85Sd9jWNtX/luRLPiYgiH1WkAaZ5Gl092LCSXIqOzN2dtMTT0o6THEorF6C
 ZDap4BLYUpoZE8Nivwc5gnmIDIN6DJe6d70jIIzN2QGBxwqTyMTovYyUSbL0koOJL2x+
 wpx4U7GLyDiiAvbxXW0SfAGmXmQ4iR4saX/QbsdpuCCgwEY0lEfA6h64Zgj4WbhugsI7
 B241aww6fCDH28FI1+62TbUXlhvMfREzFBcDd3fFBFTt/R5gop9gaGP2QJiiuXKErp/1
 aB2DVuyFtgNVmry4sxQCHY0lGCY54bAMpvk8E9SLD15zS/pnub3Ux9V1bolE6rFOBlA0
 Il1g==
X-Gm-Message-State: AOAM531+YxoPVjnhW2q+F3eog7RLViy6WdmS/m/nODu/ODipJVR2dJLO
 Dx4rOWGMwleO+uOUhSMEuO6VmQ==
X-Received: by 2002:a17:90b:247:: with SMTP id
 fz7mr22386824pjb.137.1624028879860; 
 Fri, 18 Jun 2021 08:07:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm8600720pff.88.2021.06.18.08.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:07:59 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/arm/translate-vfp.c: Whitespace fixes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a37aadf-c125-e03e-731d-d978ba0f666c@linaro.org>
Date: Fri, 18 Jun 2021 08:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
X-TUID: 9rLCzp8cFkA+

On 6/18/21 7:10 AM, Peter Maydell wrote:
> In the code for handling VFP system register accesses there is some
> stray whitespace after a unary '-' operator, and also some incorrect
> indent in a couple of function prototypes.  We're about to move this
> code to another file, so fix the code style issues first so
> checkpatch doesn't complain about the code-movement patch.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
