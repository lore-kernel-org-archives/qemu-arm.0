Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp971457ejb;
        Tue, 13 Jun 2023 21:49:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6giy+Daj6d7rA6n/KrINqpIV9BNae00LT+znnX5K2Xoxwy2lSQvUNSP7TDe3KjZkmhLHin
X-Received: by 2002:a05:620a:4c84:b0:75d:803c:3e58 with SMTP id to4-20020a05620a4c8400b0075d803c3e58mr13852588qkn.55.1686718155348;
        Tue, 13 Jun 2023 21:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718155; cv=none;
        d=google.com; s=arc-20160816;
        b=0TP9mA1aapDQ6H/QBNu1ByqN3m8aeb0actEBHz+swemWKrbaASwByJyzrNlgQH84JZ
         NPcG9DST6v5TD59cLyjH9jYTYe66GCyYerGjL7DnElR9+bW7p+PvByp710qrxbWzw7uC
         QrkNRkdIvORcAul89YC2lFOeDfghewky46glrq0aIn52HRyhxqM8XBjRNIKcXqgzdPc9
         iDC3KBZlI1wew9WEi5+nswGZaXdKus03OwS8X+xZSqg2yjB0EXX6+uMB5eGVAcJ+5BXP
         HjbiNe+skugd/xjL0rcMKNJoDvg3x5IfNocwCs7OXVDt57PGonxdn8VckC0tBfHuwGKp
         I7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L+cf2hw8IZO4Tom2qkH3ytSPQxmYGP8/jurKHfkL0T4=;
        b=yfgLqgrmH2JuX3OkM9+ZegntS4CTM33ZJX8LlbVfvnQ5gwT9k/dR7SNvv7N4rJh9+j
         BRHhQKPIfFqHrK0jIXCaHKEUKxJUAa+0z7+sdRklOG5t4oUtR6/VM7/dX6lu0MKTHkJi
         xPN6IamOpAUQ8YUTk1KBiEpXzfzRzlulQNKz41Ok4SnGJwXEFyIb4OAtX46mn6741KuZ
         CIfZTiw8j6J61nE+GxnJw0v67v109it9Dsvlc0ggBSQiC+RUny9kbt8np30b11clITIK
         hdNSJj7TGVqBxWQ6CHbwq6BeVREfIWiDhE/yn4Y6mOOTlTWSKtTCbpWmfeRuKdh+JNFd
         nB3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wa4rwKAA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020a05620a12f300b0075ff367ac5asi5041399qkl.693.2023.06.13.21.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 21:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wa4rwKAA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9IRO-0001Rf-JI; Wed, 14 Jun 2023 00:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IRN-0001R3-0Y
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:49:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IRL-00045k-Iu
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:49:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f7ff69824dso1294725e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 21:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686718140; x=1689310140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L+cf2hw8IZO4Tom2qkH3ytSPQxmYGP8/jurKHfkL0T4=;
 b=wa4rwKAAYOhxILevAslSQDFn1XiYLw08C/h0C5sMUSnZY4Y6NbCyMmDTgwWaH6LgEF
 kmDZO4cHLyvwsEXA5Q4itu5DJMls4EN2jO63x/9curpatQre6JIpQYdiHvzRxoVhi0+0
 dfoygShbpN5IjReeWg+dHQ1fAp6g8FDp+l/bbtoumviZThpRRuykn+7plTuxtD6DOQp9
 pmA2gY7ddi/ITbsws6hANJpXFKowaRnkawD1jy/UWDDa1A5gRACE4qxSyT2XrY5EHRDW
 s/f6A2OSFDXKNCn+egHSl1gU2kalwS/zOKLEi3AntK8wncu+VjhQ9Eok3jl62IFYdCQp
 bmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718140; x=1689310140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L+cf2hw8IZO4Tom2qkH3ytSPQxmYGP8/jurKHfkL0T4=;
 b=SCKjI972t4Sxpo83NBjOkaWJDcmc5gCbPpGOd8yKrISb34RX/IeLC/FH83c/U8LMkP
 zW38ho5/eHWrYZpWzL/NmoElSf3uRTu9eWR2QGNXhqJwBb6QgqOOkbRWEUXfZa2iG1Ec
 A9Hlgpa1q2XDVFS9P8jm/yQCSczwU+sxZfY4aVgAScIKZAI0nsY3snDq5JzdX6DN8ElA
 j94oB5eu3Dqtn6hpnDry10L2hoKGa39Mjki3lezknqqwWlahMMOzJlT8VqWUXtgpburD
 +O74mluW2I70C0XAvL1j3uDugw+vJa0hcMgxc3yARE64Rn80tXx42+AXNoJ3Ci0lELVG
 Tp/w==
X-Gm-Message-State: AC+VfDzqlxJZz+S6QR5Oi+JGUBDL7/jiSNvPJulQs0y9tSSRxUuYvlJz
 otuYWX0Bj7O001UGWSBmO+seiQ==
X-Received: by 2002:a05:6000:4ea:b0:30f:c420:1743 with SMTP id
 cr10-20020a05600004ea00b0030fc4201743mr325497wrb.26.1686718140702; 
 Tue, 13 Jun 2023 21:49:00 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adff087000000b0030ae5a0516csm16947732wro.17.2023.06.13.21.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 21:49:00 -0700 (PDT)
Message-ID: <f5eb076b-aff1-91b2-e45c-cf7c7713cf22@linaro.org>
Date: Wed, 14 Jun 2023 06:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 14/26] target/arm/tcg: Reduce 'helper-neon.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: 5T/DD48gMj6l

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> Instead of including helper-neon.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h             | 1 -
>   target/arm/tcg/neon_helper.c    | 5 ++++-
>   target/arm/tcg/translate-a64.c  | 4 ++++
>   target/arm/tcg/translate-neon.c | 6 ++++++
>   target/arm/tcg/translate-sme.c  | 4 ++++
>   target/arm/tcg/translate.c      | 4 ++++
>   target/arm/tcg/vec_helper.c     | 4 ++++
>   7 files changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
