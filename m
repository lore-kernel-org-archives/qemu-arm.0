Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp290160lfk;
        Tue, 12 Apr 2022 07:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRUrXB+c9AHBN75aiUn6zSu9tPUx0uhGAsVVbUWO0gEnC+qBpgi6MLhXZ7WpZagw/cFoD6
X-Received: by 2002:a81:5409:0:b0:2eb:fea4:a240 with SMTP id i9-20020a815409000000b002ebfea4a240mr11626940ywb.47.1649773957522;
        Tue, 12 Apr 2022 07:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649773957; cv=none;
        d=google.com; s=arc-20160816;
        b=oP+2vPp3qofWlu9paHcOmZYmptj+2U53psvKAB72EL1wiT2Fqe5UxA73vwp9rftwDh
         la6Lu3nM5wcn/lzHD9dqJYQ+nLyyAJ97cfsngjs9YgpdlO3+SKdFxjF65ORVUuOTR6s6
         wdSZyFfKhY4hc0TZqSGm9kp6GPywx8vPp+kuywVH4fnTot/lK3+vsjRy71KcYwv/5BZD
         1oXalElgmDdJxYRn1Vq3jOuIQhAfFyXKN5h2nWVVXYYvVkaOEWOAjxa+D+B6x1WBMW87
         FU0X6IF/GMF3nxzVr5pD1CFq3x2CBYlCmKVY8O4qoM//fBc/BWuAbbq1IwTZTPw3XUBl
         3fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jRlO+zP0kVj3Wo0YI3Dve+Qh0WCm2PUnYex+fnuEUiM=;
        b=s8Wn/Hn7xgFqR97/EcwkOS1n+jZltEVME9VWw+K56wbjA7w2M+ehUeANeaNVcbgjVY
         efn3MFCJ/wh3Quf43YWpmBozKxnYV0p6vu5o2cMYeHfJiFc3qzoWrXSX+Kix9s9eAJad
         IuR4QgCQh6PLkPW+lgh/ipUSDlRc8g9uDXqFByuurl2GkvXYcwLBUpHe2/WIytb8nKYB
         HhGglLd2bmp8a2+CnyA05EPZcbuvVuT5WKlMBRgMCM6qLtOazYtaa+Qo36Ks3sMKLZCh
         6ZbQNjdoqDUFC9X0+wIgD3EM2SCp7Chq6RE+Ogo6qgn4owKY3uh1mLuEEYp6TdVZhR7v
         VKUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ex/Euq1T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127-20020a250c85000000b00641408b2069si3561115ybm.297.2022.04.12.07.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Apr 2022 07:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ex/Euq1T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1neHZM-0000rp-UR
	for alex.bennee@linaro.org; Tue, 12 Apr 2022 10:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHXx-000728-Of
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 10:31:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHXt-0003eS-La
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 10:31:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id c12so1634861plr.6
 for <qemu-arm@nongnu.org>; Tue, 12 Apr 2022 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jRlO+zP0kVj3Wo0YI3Dve+Qh0WCm2PUnYex+fnuEUiM=;
 b=Ex/Euq1TRS3pBLT+kHDohou2RQNwF2KGPRYKsowEMBhkTlOLUuOsqmr6qhkzrY1cvG
 hRo2w/HZuWPS+eyjW8qMTeYGiwa4ujBK5Edc4Iky69Pjq5pfYUqD3sNH/1oXRkGMewFR
 EoPH2C7DYe1ch3BY/a7d7BFee8hZhLbqWeOguhgzoh+KGuXaM+vRcF0l8mdCKxxDp0SN
 vZfj2rbuX9G2Z9qj6p7x1teSzyfDJGrTYH2LrU4h32V6ucVqTgkE3/FqhO2E9wiyluya
 qpjHkkT+Tp8qIc5YhGlwjnlRHQ+FZB7Ri9k97QTf/r4Ljo8grbE3RQAlIIydiB61HOC6
 QgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jRlO+zP0kVj3Wo0YI3Dve+Qh0WCm2PUnYex+fnuEUiM=;
 b=mvk5Gmgoo63NZma21ft5TIgY00FlkhNDS8a5BB9PdP82KV+I42T6lD1ufKrxNItPjR
 RsoZUO1MNR3Wcv3n1ZRSM8ohHtTw4lcGeD31NB7wmna0qk5ou91iI+G79Rdt0kXfuucL
 QNraplVx0bTOoxG5pKR3hdx+7S0IVJVw6+RgIKTSnJAyeZeY+ID1NUp03noXXW8pbUiJ
 Ki5p31u6vk/S3bS0V9v0qy76hCwx8dQnkN5mrMETdX0eMhggDVXrPKJz6kdK7XUI0+kZ
 OjOYShL5VhNS1XO17vyUPNSKo4iEXHTaoFeJT1tu7Fi4xpuBAAWRKZbqfwCpNuDCE8pn
 WBDQ==
X-Gm-Message-State: AOAM531OSwmUc7ZublYXYGMlnDx3xrvJnTr3JUdyI4wjT/KXAsdS2xwx
 ssC84YS/RvCQ/qSbv1gWj3Xzqg==
X-Received: by 2002:a17:902:7088:b0:156:1aa9:79eb with SMTP id
 z8-20020a170902708800b001561aa979ebmr37525303plk.71.1649773863990; 
 Tue, 12 Apr 2022 07:31:03 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a63be4f000000b0039934531e95sm3082383pgo.18.2022.04.12.07.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 07:31:03 -0700 (PDT)
Message-ID: <232fa6ab-2e1e-4b50-bb45-762242f8a0e7@linaro.org>
Date: Tue, 12 Apr 2022 07:31:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
 <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
 <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
 <CAFEAcA9VHK_YLnZ2FAgdg87uF5Bk4op7kvL9e8DAZp27jvfjiw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9VHK_YLnZ2FAgdg87uF5Bk4op7kvL9e8DAZp27jvfjiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O6wKDAEWM0XC

On 4/12/22 02:56, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 23:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/11/22 09:18, Peter Maydell wrote:
>>>> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
>>>> +    ]
>>>
>>> Why don't we decode bits [11:8] here? I see it's the same
>>> as YIELD/WFE/WFI, but I'm not sure why we're not decoding
>>> those bits in those insns either...
>>
>> See page F4-7074 in H.a, where bits [11:8] of the imm12 field are described with 'xxxx'.
> 
> Hmm. That just means "decodes to the NOP/WFI/ESB/whatever
> instruction-description whatever the value of those bits",
> but when the specific instruction-description then marks
> those bits as "(0)" or "(1)", that has the usual CONSTRAINED
> UNPREDICTABLE meaning described in section F1.7.2, where
> we get a free choice of UNDEF, NOP, ignore the bit, or
> any-dest-regs-are-UNKNOWN. So we're within the spec to
> not decode [11:8] but I think it would be more consistent
> with how we try to handle those (0) and (1) bits generally
> if we insist that [11:8] is all zeroes here.
> 
> For this series, I guess go along with the current way we
> handle hint instructions, and maybe fix this as a separate
> cleanup later.

Ok.

r~
