Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp650840lfq;
        Sat, 9 Apr 2022 13:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGH8vVEPFd2SXdsQcbnjyr0uqkCUEkcpJWhkqiBPjg9NAPvVR2fAwd61dd0xG3UKYjFAa8
X-Received: by 2002:a05:620a:4508:b0:67d:c137:68df with SMTP id t8-20020a05620a450800b0067dc13768dfmr17281653qkp.337.1649536848829;
        Sat, 09 Apr 2022 13:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649536848; cv=none;
        d=google.com; s=arc-20160816;
        b=Gp5NQemWSLtJFUIo5OIEs8R8BYcu+xe9ii3KX7XKnm3hU4eftw6NIb3U7n0FT9gG2k
         /Pg4EbQ4TCPZR2FIKYKwq0XHvNarX8LuKaxRGEyHs0UFXlzARfRIbdTMxkZbZtewPwu8
         1jUlBELdsSqoo0mc+gAjkGXvW3l0Fq5DTZIQ82Lnq6v0CgqsSNKT165L4GUnhq/LlrqY
         Ln039XW5jkNHgdp0BNnoezCBYwBs8hV9BEwfJ7gWctLqsHSTalDdQRC3MtFRqXJOAgiX
         PwAE0U1M8YwhaLjfsRpOvJ9vQpMNuB5vJRaMJio/QDDB+Y25xG8lcZN63RPOYHVeGl+V
         gnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ltVuTEgyQJKYvNjM1Q95U83FfiVswzhYCc3xnZ1LS/Y=;
        b=dOD5LEOXQiYSbYqVKhjnpTg+H86DRFd8b01If9FZbjfl/PY2yHq2cE0+qGYMtUKiFv
         1AjXlysKBt9zbvZ1/7dhj24U7AZbrBkuxD/RhTYm+ZZjLj+5g9PmbgyA6IU5kctAYE7+
         KkngtdkrdmYIEFz1a7omN/+Q4OYK3JlNcMhamzK4gbq3+Md1nfihIzeK9gTXTi8/1MJx
         0OsyhWEQ+Ob61M+yyaf2pCY9KgJEUKOWk+G1RMd4WHdGEgfeoKho0Bg3Kn0S+YKjlM9W
         vQ5+qhpJXC93d9wX8aXzjqslbSbJPld+wb8ZxjcAFjUbCju7TKWOvU2yytaoSpi3Snev
         rZgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwLbpvJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x29-20020ac8701d000000b002e1fbf3be5esi2507464qtm.79.2022.04.09.13.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwLbpvJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHt2-00008f-9P
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHsq-0008W3-5m
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:40:36 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHso-00049R-K3
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:40:35 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso659109pjf.5
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ltVuTEgyQJKYvNjM1Q95U83FfiVswzhYCc3xnZ1LS/Y=;
 b=TwLbpvJXLVqJS87UKez1MUtfOEon9n2o+Kg4a96od3CUNhcDqAzi5e6aqJxcwaLi1S
 umDf4z+ook8HIMgoavNxJ+qpt9zLbNS1LypTjc0dU6AfWVlTuuT1K1Duql4qkRD57wxb
 0wHQKN2rTmiZCqT995Wz7m2xL5veABay3NkZuY4bKMMzhZk03D47QVBbE8xwXTJRHMba
 2Pu0DHiqnFQn0NY6TO3gtZsqy9/kbScfn6jlxBAxLd6fqpCt1cA5f/dHziTd1C1zF4H7
 CoPz7t9wpkUiQ7D74TOnLa3+NFxwOnykT+nj1M427mcenbEm+0OR1RrwLwb4Y8rjKQHX
 VIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ltVuTEgyQJKYvNjM1Q95U83FfiVswzhYCc3xnZ1LS/Y=;
 b=XsIs3NmKyi4TYV437N6TjtYHji7uqH1QFz+RMiHubus1D+Z/DdGYZh1oplHv4bRhX3
 dqrC3TCScKeuWXQ5pb3Bp6OU64LrLgk9zVgVipsTF8Xna/OFdFwoQtxly4LYREvRuOTP
 mH2thEXgFAQrm+cNkZaoKoKDKGdAIKMNTnqKsPbe+XB4iBR9fFa0c2GjpQnULH9DW/h8
 y80Nhoeod8sjPgsxRGX+JTc96vN772mC2DMSHjRsuEJhbcgY+cVKKAaBKP32hkcUGWpS
 gdZ97++q/AN64q88BchPJm3nB5o6oyQO8NTV8ZHp88w9ZGV/e/nnQHrLYnSi/IYzwlqi
 LVxQ==
X-Gm-Message-State: AOAM532cdvwBZ6Hint+TVTyVS/FF17AMphCL8HzsiywyPcPu7KQBhTHj
 kmB3OJzuk9PTCU8m9zshrUKiVw==
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr29207661pjb.4.1649536833354; 
 Sat, 09 Apr 2022 13:40:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm15565341pjq.25.2022.04.09.13.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:40:32 -0700 (PDT)
Message-ID: <f73281f0-e61a-dfe3-3b26-10e445be8e3a@linaro.org>
Date: Sat, 9 Apr 2022 13:40:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 36/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_inv_vlpi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHtDksdsiMN6

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the function gicv3_redist_inv_vlpi(), which was previously
> left as a stub.  This is the function that does the work of the INV
> command for a virtual interrupt.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
