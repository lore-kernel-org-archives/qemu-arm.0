Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1612779ejb;
        Fri, 2 Jun 2023 23:06:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uaZwUmeHm4RNriONhhUgRQG1WtqgsQAYmyR3BSZ9H6j3mJiUcZAFXCXLLK4mEax0jbD7o
X-Received: by 2002:a05:620a:6019:b0:75b:23a1:404 with SMTP id dw25-20020a05620a601900b0075b23a10404mr14229064qkb.26.1685772360593;
        Fri, 02 Jun 2023 23:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685772360; cv=none;
        d=google.com; s=arc-20160816;
        b=PuNd1Vbl41BokVxngaGjmZvVGLLi+yq/y7UlG7Z3aqZh5uOBGPtuOrC7LTdCenVOov
         MkLn6bldYfACPYwzorrwJLp7kIcHMKNbKu/AzCCzWYqT1v+mFbokioMnAQMUtKzyIuQN
         F1mYpc52M4QLzA4t3ulXSen1r2mAy/dGDsEBiSJ7/hLYnTHqZWPYElh6Wyz2xWGITwn9
         PxJBXzuMvs7YxwKCuPWl4+ZmIzYvOpw7L29o71CjY4et7YTTI/RySDJL6Ic4SrIrnKaq
         HaBhhfEMwEHWC8L6P7J9vLfxFOoEWxTqCc9QPEce4pDmN6+JldnrDX9Bx5+1Ni1NCh3z
         NBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FADIxIHmBMNLtJmxMbSrvT2vPZQy9hAkfTzrNk4CT70=;
        b=kXSikT1IgPtAIDI5UCdsX1F5rzDe+2veTYPDZdyVYvbYwFomIkGJ6SHrs38lc7WtbV
         zgEiS7ac6Pw4r+KyXOJpURC4oEGtrHpMQc0MzLmmciZhdfSoui/nLOUiry6WyxuK2+0v
         nUIBa6I6A3ClGyeDnHkgbPKE+l3WLztw6ySXtpqcpm4teezEVl/DhABRxVRrfGwvkwpS
         tuk1Yi6C4OimgpVMhq/hft7ENP1OqVYR8aop1j5TInQ/p+P7bRUdRc00An7a+iSP/K6Z
         kG8xQQ++Jm+81T2/XwIyJtYrgCcCPwcWuQnLSkla/yDva1zV1mAp/6AINo4s7X3S28/0
         4zJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BApfHduh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020ae9f104000000b0075cb23ee1fesi1769390qkg.602.2023.06.02.23.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 23:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BApfHduh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5KOk-0000oW-NQ; Sat, 03 Jun 2023 02:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KOj-0000nz-Dd
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 02:05:57 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KOh-0005kh-Qm
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 02:05:57 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso2651689a12.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 23:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685772354; x=1688364354;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FADIxIHmBMNLtJmxMbSrvT2vPZQy9hAkfTzrNk4CT70=;
 b=BApfHduhNBIT4ttXVbUZfpTVTgKOY/gGG09tbTB6qxhNrPiV+YNdKjxK020gCC784B
 z12dW5pJfmLudMqz3sXan39w6wb/jDLk/5CQOj72gnXLFWdUc3yZ62245APZhwi63tIv
 +d2NdZOOPvdpq5ftrIUREJQ1EmEhf6Jkx93PC5h0bfWNPXqheJ1g9CQ96cwK9QzsYtIr
 LIN66zClwsoBjb5SliBjULoJC5MEGIlQ9yCAQIedXfd02lUoB5gOdgB+Fb/8eUA96l1T
 QnzdkfJIMKuj0e3Q8Ru62IA9oJtAFmQo9ZK3yOjZEzI5qw2iLrBGAxcgJQfuHkeKiOKW
 r3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685772354; x=1688364354;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FADIxIHmBMNLtJmxMbSrvT2vPZQy9hAkfTzrNk4CT70=;
 b=AbA4phMCp7AS8GD1vVV1117Z4tMFRloXoq6GrtyuRj+TSs2F/KMpJVa3aQYzEIejHf
 WWCRLddKg/1NMg9J7NxxSsqJmrHmHyB75SczErdAt6xf/9c+F1GXELk53rRPNoKkRxWS
 KG9mV0pJkB13A1ylLYakKvHOhZENEBOTViPOtoPLEtW1SIWafewWIp8lhbuNMnydt+bB
 /gyHYfhQ02QX9eGyRC8fc+ELT7cKXami6cRmDBB0BkkG3nFJYUZoWas5xUz9SQCDaomC
 w0kNYMCopn/4rA1ZjaWy8lLhW/GHLWUVwTJpbhi/GzdyfypTqKIQCuYVP9ZpJ5FEaxMO
 npJQ==
X-Gm-Message-State: AC+VfDw8bNgP9KIhRkXR8D2oQ08R4PUeHpzyn2CmUV5x45Khd+A4h8dZ
 XMQDUOaUgRNLkbQE0VamtFu3iw==
X-Received: by 2002:a17:902:7613:b0:1b1:b111:dfe8 with SMTP id
 k19-20020a170902761300b001b1b111dfe8mr1972445pll.66.1685772353964; 
 Fri, 02 Jun 2023 23:05:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a1709027c8d00b001b045c9ababsm2331149pll.264.2023.06.02.23.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 23:05:53 -0700 (PDT)
Message-ID: <ebd564a1-2b63-2062-1472-0464b4419c59@linaro.org>
Date: Fri, 2 Jun 2023 23:05:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/20] target/arm: Convert MSR (reg), MRS, SYS, SYSL to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T5xNyQegaZx4

On 6/2/23 08:52, Peter Maydell wrote:
> Convert MSR (reg), MRS, SYS, SYSL to decodetree.  For QEMU these are
> all essentially the same instruction (system register access).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  8 ++++++++
>   target/arm/tcg/translate-a64.c | 32 +++++---------------------------
>   2 files changed, 13 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
