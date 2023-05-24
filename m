Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2613066ejb;
        Wed, 24 May 2023 07:59:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O3N/aw+ksEDX93KIqETQzLii1zuQ9L7SjQJ5r0XIx4dgNfKXduIsBAqXPoFlSFMFOXzto
X-Received: by 2002:a05:6214:e69:b0:623:a303:7083 with SMTP id jz9-20020a0562140e6900b00623a3037083mr21464477qvb.19.1684940382343;
        Wed, 24 May 2023 07:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940382; cv=none;
        d=google.com; s=arc-20160816;
        b=QFzz7PikRuYWLxmWUiUTeLb3v1ql138ORvp8pMWRm8oxjmvMHtKtWsJvVloejpZK2Z
         SU2qQpPj2emKOxR0CgNBLDWaeFygQJ8J+PLmsC2nLBYzu1WuBCIEWG+tXIsmyr6K4r/x
         BqOsO48/rO2Z1X9jWmV1AscSSVuFJUxeTjSoagrplXeXTruVFa92dCE+RJxCM1cEBo0P
         aaaZYlQ3En+sNGaPnl6R6lPAyR8mEXWJ5j4UPz7koxv2gUJQM79JB5Owe09SLc0pv83G
         KSQvqQL/ZKiZm9f2ItriNWQzhCwzbKHdVvopEkTvUGRo6254JekRmSJGfR3dqChvNtdC
         aWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x36OQH0SwdR1jrsWHKeeBmibE1d+3dNzuNhncz6kxaE=;
        b=LzYm0ZGwQ+MeeG3jzbkw0hc3a2KdmYmySc+HsJ3r3crQZfuaYa08VmyWCbdG8ISAdJ
         Rbm/Zdg3pyE/p8Z8YBeHKKkvCgpP0bG3QzQJTYNEz5+0hqexLiYgUKYz/sF0eNgBKdgS
         67vzlWPDqjoHSuQBfP/3555lk037DeuuLrW3+ZZuCzihS3qkMOzKn/whBnokc7cqeBWx
         JJzVpFvlNbBi4IcwfJ2ntVK7yUi3psfaHfcj0Tx5UKACjoS973zomQGT7a2hg365mras
         7A8g8L4XLEl3ePLrpS1o4bQ7GKsXT8zyQiYqucg0qb8yvVw6Ji1JUp5YZGC+IF92mcon
         qR/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWa0S586;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js2-20020a0562142aa200b0062391476347si5423484qvb.100.2023.05.24.07.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 07:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWa0S586;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pxE-00066T-7q; Wed, 24 May 2023 10:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pxD-000664-3R
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:07 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pxB-0006Co-Fe
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:06 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d2e8a842cso777014b3a.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940344; x=1687532344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x36OQH0SwdR1jrsWHKeeBmibE1d+3dNzuNhncz6kxaE=;
 b=oWa0S5866r6luxvR7gGIhcUdPlyMkQV1U5OXKN3fLia9SHjIgtbWv4lXXt0m4/Wqpx
 2bHEYubzGjgJHSlg/PuH9BGQ79k/BZqoaX4saR9OHouUL/5xU3ToDWLid5/ciSUJipyU
 Ste5QC16jAOvqJGgAPwWZMY/ZQ5x7+QlP8nQuMSW5XJ8+r1x2+6X0/VczhJU1Frt5cnl
 bGBydhEzVCXPk90KAiwtvy0PQRhThXUVemq1CG8kx2L6XsNuGslMO5n0PuOZmrGFu32F
 sux2LwGhJ9eOFB5Wyb2riIeEWseP+B94USarISHT22fMj6X5PJ8YdJJKPNNjZuCk2wX0
 uhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940344; x=1687532344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x36OQH0SwdR1jrsWHKeeBmibE1d+3dNzuNhncz6kxaE=;
 b=jVekH9kCF3spAatIcrVhZSTbgV0e+FTDlP4uaqQeDikGWk1Ukq04yqnwZoqFVRQUdk
 LaBNvaBW+TLFxI49SIoNAdcXqj+0ECpEs4NXAfZZ+CKBPYnBNTT9ddE/c5LQq49NxDEe
 SHZEun5tEM/nk9bGWEneUM9+8TXyDxVICHINDmudObN75SICqCp8hm1O7wDQW2QSR5o1
 jZTro8GQF45YD1LMGHzLJc4lEjD6T4HKJMHTBYPno/nXzQCaHBLZonNsKojHqS/VBv2x
 OUQEeb0d6Gq3rj/qJ3AxWV2bEjp0gNUwok2BYl+O0eDmw6Fmcl0PivlIFY4V06rAWWD7
 BjBw==
X-Gm-Message-State: AC+VfDyetidZb+8IfxtTAHozHVfVPWUMgFpPljjlsghiPxuZ2yPPRW0m
 L4OQIJ5jP2+W92RNkEQcTYV3Xw==
X-Received: by 2002:a05:6a00:134b:b0:64d:30d2:f69e with SMTP id
 k11-20020a056a00134b00b0064d30d2f69emr3784526pfu.3.1684940343759; 
 Wed, 24 May 2023 07:59:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 u18-20020aa78392000000b0064867dc8719sm4816085pfm.118.2023.05.24.07.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 07:59:03 -0700 (PDT)
Message-ID: <8992c8ef-0e7a-db66-7e8e-f58260df2013@linaro.org>
Date: Wed, 24 May 2023 07:59:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/5] hw/arm: Use MachineClass->default_nic in the
 sbsa-ref machine
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
 <20230524102729.810892-2-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524102729.810892-2-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-TUID: z3BwXTkMcDKO

On 5/24/23 03:27, Marcin Juszkiewicz wrote:
> From: Thomas Huth<thuth@redhat.com>
> 
> Mark the default NIC via the new MachineClass->default_nic setting
> so that the machine-defaults code in vl.c can decide whether the
> default NIC is usable or not (for example when compiling with the
> "--without-default-devices" configure switch).
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   hw/arm/sbsa-ref.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
