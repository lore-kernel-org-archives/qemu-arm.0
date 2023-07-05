Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3666216ejy;
        Wed, 5 Jul 2023 08:45:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlET69PJKBVPngdTcJw+o023iJEpm8L+FJOQZAqPoNGwuTlvRolUOBiIVsl/NJu6VP2iRpt9
X-Received: by 2002:a05:620a:28d6:b0:767:9310:1523 with SMTP id l22-20020a05620a28d600b0076793101523mr2196346qkp.75.1688571907258;
        Wed, 05 Jul 2023 08:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571907; cv=none;
        d=google.com; s=arc-20160816;
        b=pgIBszfC4NZcemWaLP5GzashJjut9lehVdK6f4KZ0I5o2VlFcTnNMOLLSd0BTUg8+g
         0Jd5u6fTKRkWBnrk7HtAOl2YVPdP0+eHMURqynALT7Is+xab3J4sHEIT2RzFuQIPe2YR
         V9oTrtD2rD4ghruoRzWEIOuljBNESs2CiMjNdfYDgTmCjTu0Z6SBFX2qaXvbAjVVjsG5
         qrjgCyqh/i1lMwXYjgyiVbmhxulVvbgYbnX8KhM6pEJ3RRGPNRdBDwoSRiKfA1I/l5dO
         W7p8zFYRIwcdV6VLGIz2iPeOuI10BnrTe78Pah31eyufg683iNo40A9z6aUSvUpMTvQ3
         dHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=88PU+23+COU/1+XJxieediUwqsawj83pgn9dvBTwEYU=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=S/lUuVZbnd5WfoQ2hL7Fk7U5wpiMREaBHAPi5cBBkhK16MPSd7BM1D1nkfyrWH7xjT
         Q5kOMLIFPLPWx9JSqOkOUEllAk3lqNFCXPd3dqEyG6zXwkAjLteWa8jkPydGPi6Ov+3R
         0IYcG2whmNnXbJ1ajuVl2aqg1pIk0Uz1gWC64tt+luxe8eCljpUqHI6t0wVIBv0eWpZT
         oG0I+LV0D1oH9xman+MP/J6lQ3N6FMzjG2IHW3D8DoQYqMdGCkmg6VVyFW+pTFlpghTu
         zdUbLUnKURb26sptzKwLVeG/dT76GKBEF9lMAsQC3Fy5jBi9U7Ze/M7AxgAar1eUVIh+
         dsmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LC/oQ1Ko";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id su10-20020a05620a4b4a00b0076527c1bc7csi12502485qkn.179.2023.07.05.08.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LC/oQ1Ko";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4gT-0002fa-SY; Wed, 05 Jul 2023 11:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4gS-0002fL-Uv
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:44:48 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4gR-0001sl-6F
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:44:48 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so5405473e87.1
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571885; x=1691163885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=88PU+23+COU/1+XJxieediUwqsawj83pgn9dvBTwEYU=;
 b=LC/oQ1Ko1F1Yt9XiHsf/xcF9jkCCsqkvyocammJlV0M7FyzBo1YLG6xdvU6MkMXXPq
 Fz0k3v4idOh896/km+11u+KwXh6rUYco1eA0jR+iTl66NjjTr/0p3U3oiapJBHFPKRHw
 SxEnqmGQAzlJtzQ2kj166PZJhBp0MbhN1kvxWCH1JDmM+DiQEBVvzHeXFL1h6JF5Ffzg
 TfNaNtOfrn1xIYgOC+XRFoTuJZepEnhNXEqD2cjyKFGNZ7+Mlie7PfKl68qbZxar4/9o
 trTn4L8ZrAioAeNftZEd0pS/zjLNhM3S9HN5tZMBEjCmFh7dkH1guT2j6XK3KJTSC2OP
 EZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571885; x=1691163885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=88PU+23+COU/1+XJxieediUwqsawj83pgn9dvBTwEYU=;
 b=H3yDdPROwkcXdCd+H/ULsRBgZcfQGo7/RLu8MJZeN/ZO2lRvsSNMxF0Z+XdmDAKWms
 hqbi2AwV60ay2jgK/qtEDrz/6oIW4/J7cAa5Yrp3fUG3JSFKe84tTkgKzmCuTE0no/x5
 n+E5BfS7K3WJvETd8lsJPggwEY86pVgUk7zcKOs05/1YfYS5Qu9qwUBT3bUKTLQuFgho
 sdui5XAZFfvI8B65Rv78+Ax9L7BTUD93V3c86/Hs6NQfCvave+sI5awyKDvLuMCloc8Z
 PSZ0jh6x+umz9Ryi9/3MVjcpwGnLi/edBF8+7zSkSCy2FWHJ0CT335CFOULQEZd03fXA
 umGw==
X-Gm-Message-State: ABy/qLYNaVu5zLHmU0fG7u01c43nkk95G5nRbp3uBZNFTnADDurRELOQ
 cxTj7XuQpO9eO5e8lgSJNvtHjw==
X-Received: by 2002:a05:6512:398d:b0:4fb:741f:75bf with SMTP id
 j13-20020a056512398d00b004fb741f75bfmr14677584lfu.16.1688571884908; 
 Wed, 05 Jul 2023 08:44:44 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a19ae04000000b004fb75441c94sm4935551lfc.9.2023.07.05.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:44:44 -0700 (PDT)
Message-ID: <5bf5f559-be92-c853-da47-9fe807d63cac@linaro.org>
Date: Wed, 5 Jul 2023 17:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 19/19] hw/timer/arm_timer: Map ARM_TIMER MMIO regions
 into SP804Timer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-20-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Z0v4s8oimwfW

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> Instead of manually forwarding MMIO accesses to each ARM_TIMER,
> let have the generic memory code dispatch that for us.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 23 ++---------------------
>   1 file changed, 2 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
