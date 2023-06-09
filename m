Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp562626ejb;
        Fri, 9 Jun 2023 11:15:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ507PQJIJsDMb/wilPsI2vD+94VsKUv5xccZtdGiLhnMqDPKQPDKkyf+583gP1m8IbrQ3oS
X-Received: by 2002:a05:620a:2b4e:b0:75b:23a1:3607 with SMTP id dp14-20020a05620a2b4e00b0075b23a13607mr2311074qkb.24.1686334515148;
        Fri, 09 Jun 2023 11:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686334515; cv=none;
        d=google.com; s=arc-20160816;
        b=HcggdqzC5y+JAyTggh6bzutTmbjhHAdE7rTtxHoH5Ncihw4VOVoyWRvoHAjCNgyBFn
         SLoYLR1WVraSEqhDBYPyY6eUGqHAIDe8vnm3GXRxWWLOfOtPnarxn+zDJhTQmYj7orBn
         Fd8MbqCunOfn0Xfle+0ZBhOA9sRLualbWyh5It41Rtv8In7yOJ/1/hZkRjcGTIzcsIqp
         +USOyUjVMXWviXQHVozeUMHEoo4PJvB1muSbZ3E4nFtXrBRa4L++AAV9tEv5cGsW7pLr
         2135AQxQKG3zgSmiM1apz7K/2BxGg6RNFCmFPhEc9X3N4jQZAC1894iNMOGL7WQWCdkL
         5gZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w36AbASTiRSHNc2Te2Cr673sMI9eEa6Xoi32f/Ol4UU=;
        b=eAxuDtRzmftQtxsF0pCa6ZSq6aVZqA1yqLSxUqZOCsKgx6TJXm3hNInjH8BjVyIV3c
         Ey02s2BgZrAzp7Cu4Agcu6YuZIjwZ5XGtIg7F6PySyjpOfhqCDayGA/EEFT7SbhZ8+Mc
         ks4t6QwnxeiTVTpzbrqBlexGmJBrc8jW3AeLH8R1d+tWzzfhd2PN4AhD+oXRCT5/uj5a
         JIewFpIHeWZodWTxuMFBaSXsUBm7uq3cGAMwePDfHv2aSBJIYSOrFHmbzy9mzjpcMFLa
         BcmaA9lsXEdRviVfy7XIVdm1bMfj7H1v7xmsoJQiOeIPLPrShIqnMLi7BU3vKordR3GH
         XwAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pC6wJGxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1-20020a05620a146100b0075cdcd61ee0si2490791qkl.458.2023.06.09.11.15.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 11:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pC6wJGxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7gdi-0000i9-2d; Fri, 09 Jun 2023 14:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gdh-0000hq-Cx
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:15:09 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gdf-0001P6-M6
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:15:08 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-54290603887so821289a12.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686334506; x=1688926506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w36AbASTiRSHNc2Te2Cr673sMI9eEa6Xoi32f/Ol4UU=;
 b=pC6wJGxxka02oHsT08zuToJ3QVpkrg6E9ysQ3IVAEmPGR3MPYlXQDI0k7ei3DnO5xm
 IF5u59Oh5DYWAfn5lH5Iec/kcetmxsGWdQ0xUNIe27aAy7bKRFZXys03RQCPZBQ5OAWb
 hejhiP4bZrTA8NmLnKlK4MoD1qy2FMdO6DX+NVn5UAv7bbefDxV9SUnAk3FlAJZxz2z4
 5zXuGDEJgMvIS5c4R9ZoClIho+YNdQRS07jZfiA4CyIbCXdLP5tdPVHMyhP8xtb7nAuL
 hkndZt4LNyR4fbti4tgAYt+G0cXpYL0Pr4Abta0EojEqvrBb5P/zv/ibhRVwBze3XlJt
 iVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334506; x=1688926506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w36AbASTiRSHNc2Te2Cr673sMI9eEa6Xoi32f/Ol4UU=;
 b=KWNqg0UpnBFJCN1Us54pTPQpeleKWaqGlkdNdFzKps+UsviUviwMuavz/qbA+e9E+a
 qDGpDvQYkXnOBnMT4Efc5zJ486uBeeIUvNaXOEy4Z5pqwa+CbsbnZeLsNruSoVhw+td6
 Fi+bUnETvTsQuCuvet/ndknXi2VuLDMlqDFelhMjxor8Dzy60mBn37zIqo1653WY7HoY
 BkhYBc/OuJ0LwqIA5WThYwAwQhVUSatTGNMRWM7NdkxwIL/EHlgQOmvw5DEeAw0r3Jin
 SNBveEV9GlB2A+QaY9uRp+3eJzv8VapkWbHuJH2fJJRW7o2b7UNZtUasEzLs4CoF0kvJ
 8cjQ==
X-Gm-Message-State: AC+VfDztQRUTpVhem84vBeYAHvK7tW2OizQyyHVTJbMYGYiQMIfAE5PY
 lJkcKCB/qI7QmpBuoTVaQF4BZQ==
X-Received: by 2002:a17:90b:17c3:b0:250:acb7:21da with SMTP id
 me3-20020a17090b17c300b00250acb721damr1504308pjb.38.1686334506232; 
 Fri, 09 Jun 2023 11:15:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a194300b0025b83c6227asm2227560pjh.3.2023.06.09.11.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:15:05 -0700 (PDT)
Message-ID: <045021a9-c318-fd46-d00b-94b124f10b34@linaro.org>
Date: Fri, 9 Jun 2023 11:15:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/22] target/arm/tcg: Remove CONFIG_TCG #ifdef'ry check
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: qLcqoTqvV8Wd

On 6/9/23 03:46, Philippe Mathieu-Daudé wrote:
> CONFIG_TCG is always defined within target/arm/tcg/.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/cpu32.c    | 4 +---
>   target/arm/tcg/m_helper.c | 6 ------
>   2 files changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
