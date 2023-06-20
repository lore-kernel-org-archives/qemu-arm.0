Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp187690ejt;
        Tue, 20 Jun 2023 03:42:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vt4Ek+Gz+P2cB7ZniEVklbgdDMwkptz5ufYexx9/u1/0i2vlsOWqxVw3kMGUyUa6VQ/Y8
X-Received: by 2002:ad4:5ae6:0:b0:62b:5786:32eb with SMTP id c6-20020ad45ae6000000b0062b578632ebmr4428254qvh.38.1687257742874;
        Tue, 20 Jun 2023 03:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257742; cv=none;
        d=google.com; s=arc-20160816;
        b=q2r2u/TW+zWjS5HltNZH4r27pJzvkK3ZCb5J6nLRxRH+odDmgT8yAbvgHHTTbGonp2
         dHiAwOU9H9HcTri8gTcYTuIMA/SQEcwNx7SoI1FjnVYD7e7FOU21WQdSpJOT3pRZeyU+
         TB73CMKNcgJCfUetyjitcsVE2kXgjt1/FrWjr7QHIbbRjnLIKd2GsSiAViRqp2JYkzUH
         QfR6uP6XTOyji2d9huK+OeYTJRCXc0Lob7HOSqHSgZVPnwHI2AVc+Oe4/P34tnW2Y6PH
         f3ooMmbbqknDZSJVeLDy0FH9vwdLaeOS6F6AACTUbjyhtrRQKKJUjUf/qMmkLSYTXe0a
         +mTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=A1pJGHU9zoumlPJFyM0mbjEpLH5IWpVhi/yjUMy1FGE=;
        b=iLXApcYoA4DKeaMYiuh3EqzP19gwg+H0oaCZEyvRwzEG5gzorER1V605lDV3F63552
         rAgmLwTAlpquXRa+gV+NPGXLQRsmSZLUxBq2L1q3gN/5Xh4/SNsr24PHzqRLMhLHjSKL
         sbn0ivSl/n7SHyjzEBYOWgUXIErVEBSvsBdXVmoVB24PZV1IriMEVz0hgykiMQpRPP8l
         dcUqmzoZSTMjXndvIDFR7rKqgq0jC2TSX48qU3gfO8B8eIqjMuhiuzSe76TGGHYiOuiX
         vgHh5WOGpnlyQOYNJZem8ybSJTJZ0c3Qfx/f6tjyOM1RKfZHpNqyC/DiutRAgGCfW84u
         i7YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivA7yz9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j30-20020a05620a001e00b00763a15386c2si680290qki.420.2023.06.20.03.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivA7yz9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYoW-0001Hz-Lp; Tue, 20 Jun 2023 06:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYoV-0001EP-C7
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:42:19 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYoT-0005Bx-SR
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:42:19 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-988e6fc41ccso189276866b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257736; x=1689849736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A1pJGHU9zoumlPJFyM0mbjEpLH5IWpVhi/yjUMy1FGE=;
 b=ivA7yz9UdiQ9tp8y2CTQiBJOUsZ3XrZETblMG047k3TpAn+nmktqf76Ktf64Vns0wG
 JdqXrQ64X1VjSp3fSNW8kO53vWut7XeV5X8Barr+vR+0prUxVVKusq7zMA7Pm59jgiia
 Csnl3HPz9Vf2Cipjbai/fvIL+qaY+Kn1I6GdqBDKsAQhIwXbwrXZKoyJdY59oAINz6bF
 q6xSS9jqKBPn09WB86z7AnNtlipIXDzkvSDB9uC0Inyl0RmsNmT2P6Vvyk0I0dq5zoYQ
 4+BWeVIsQ4GNzNPCjhjUjqHo7gwdvGMs5RHj/x4KS29SGGHDscSIL1yMJat7v5dh2bF1
 Xp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257736; x=1689849736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A1pJGHU9zoumlPJFyM0mbjEpLH5IWpVhi/yjUMy1FGE=;
 b=lAG7oYo9PCy+cEKnrxWGL/N2tj82kusydrok1GNZnExk0TLmStgEB3W7CkfAFe+FQ5
 8fSAPgvRnbMxNk4z+dY84ej640YW1bm79kln7L9GeI8YAGKlGoCaDb6bFL1qQUti8hzB
 NbrH6biU60UlXxO2ActCBdusaMcKiKBoqi7MBTZAanPPmn+6364/vIKAylrHPXlw+bg7
 dgzvEBC7Dqi87JaMzbRsFg4yOFVpI9euZElxmWteb1+jawKxLU1Po7pD6vufwUx/cQTQ
 /9D8xcYF4hQ1mIT/gkDOwN+mXOFQ7TuW2V1hj6AwbkTfCbhNBxKdxI3fgx7TZvxu10qM
 oVCw==
X-Gm-Message-State: AC+VfDwqiz0GkYILLiHkQFMhAx41Fz7Fp6YeNj+HbNKPUYfhI9aB6ngd
 2PniiMzaWbyUVNtQ6v4IZobuDw==
X-Received: by 2002:a17:907:928b:b0:973:cc48:f19c with SMTP id
 bw11-20020a170907928b00b00973cc48f19cmr8370417ejc.56.1687257736372; 
 Tue, 20 Jun 2023 03:42:16 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 le15-20020a170907170f00b00985bdb7dd5fsm1122951ejc.201.2023.06.20.03.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:42:16 -0700 (PDT)
Message-ID: <199d31f2-94b3-4a2d-c23f-a82c94a75d10@linaro.org>
Date: Tue, 20 Jun 2023 12:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 29/34] target/arm/tcg: Extract M-profile definitions to
 'helper-m.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-17-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: Xqb5mubQh2+b

On 6/19/23 17:55, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the
> M-profile definitions. Move them to a new header; the next
> commit will remove it from the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h           | 17 ++---------------
>   target/arm/tcg/helper-m.h.inc | 23 +++++++++++++++++++++++
>   2 files changed, 25 insertions(+), 15 deletions(-)
>   create mode 100644 target/arm/tcg/helper-m.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
