Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp308153lft;
        Fri, 8 Jul 2022 07:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t98VEJXPo7NeasWvnvE5Dbj7+jOF3d7THgPWlZNAv95uIHYsLHN0Vnc9VBks3wZ0ZO9ngo
X-Received: by 2002:a05:6214:20a7:b0:473:4571:3721 with SMTP id 7-20020a05621420a700b0047345713721mr1498115qvd.60.1657291417518;
        Fri, 08 Jul 2022 07:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657291417; cv=none;
        d=google.com; s=arc-20160816;
        b=Tj2B+QzXcMxs7gyixSuLYb/v6BDjcU5Dy0m6eh0jP7CxwiqYpUIjsNpV2hs44ulY8t
         MH4xikO9HKqSXIEjV5q+m6aiTLrwseEGxLBWkzVZn/7HdYZlwFTJgnsXNghtxZ1H4efU
         8ynRWbwDKVr6YhEvNoPClgj+ohwZ4rdNB03V3VI8T7/xCu5vyFMU89GZXiOr4tI/zgDz
         4NVaH2iHozAH4WyHPtiX6wNzSxj/iOJjsKOZS61l26iQG6O0drgnKDXULIZMsdpdNMcP
         lYCMtobHk9hkALSYtxF2JCp4f6AVHBnZjmt40TPHnEFuJjEMFCreJF8KMZLxTf9Qgb67
         GaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZPbrArNFZ/rWeA8x7cl5tNZ595+1bD1UnZfj1X9XxkA=;
        b=0MwY2rU0B5gnnR8kG7FPvCJX3fLEUpv4Xmwb9EV5WVrq/WJDyZLBAlo6aWOWORzF9j
         UPh3ZCVL42kOEH0tUGQWrcx82aCHoTNUKd6NCIzkeFka11G3fKHgxBHCpUoet+URPssz
         4ngBOKyyF1+SFhthL2lVriVwuzaug8PC8LW2ETrz7/9z22eAcXh6H+z9CyzhrzH7W6I0
         zt7UurZLPK7aeZQwR3MqDhMyC/AqI0L6smAZo6mO/0Nn3RPs2tUVNR5MGkRkH9DSOWEb
         GfJG86luM+BQg8YE0w3ENncIsqbBqWERYai3TOmkSnE2iyX/PQuL7p51j7kmDg71q7jX
         rdBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XzIE5gqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw8-20020a0562140f0800b004622a2cd4c2si24506835qvb.66.2022.07.08.07.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 07:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XzIE5gqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pCj-0005Ea-1T
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 10:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pC9-0005EF-6d
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 10:43:02 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pC7-0002Z1-NF
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 10:43:00 -0400
Received: by mail-pg1-x532.google.com with SMTP id s206so22550581pgs.3
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZPbrArNFZ/rWeA8x7cl5tNZ595+1bD1UnZfj1X9XxkA=;
 b=XzIE5gqayEQOT+n4vcOqBRkm488gYNyZCAsBYo7ua49q4UZ9KXeVv69h2jbMDLtCvS
 wqmUnkzPzLjn1Gqus6eGIglSLfGtpR5sH/w1jdOFt7zvxFabDOQIuGXIPPGhB4N5zUG/
 sOBNB5f6kea1tLjBSiILLdakELgvl7QPC5n8RYFXhueLdpy339tsEc/6k/0OaXnM3bxg
 pXbecybgtDRWnCZpFWNR93Nh0EC42ChLxMg1OpD+lfBpshAnY1583s0GbqBk5rczN6jQ
 xG3jidQr1mPIP1QuhcwXXLt+XItfoN5CPjxJGv/LD9SQN3QkxNXkUP4yRk727AjIWwbH
 ilUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPbrArNFZ/rWeA8x7cl5tNZ595+1bD1UnZfj1X9XxkA=;
 b=AEqT/9jr6quK02SgEO8cMn/pl5frfjlUDPi9p89FWhCTchdywZansX3sbxc1JXpkgR
 h38mETzNoAxiBzF1GqyxTCbsOtFcgiQXHQRZPgZQeUmweVgt8hqum4N1qz4em/twGc8+
 HmdZ3LKhcAtviGjiwt/HLpNwcOue6wRrIuT1U3dZ6GXosYzBwHC+TCOCqR1ltrEatCq5
 X+8HusAEwNpX4qim+ow+ScNwybHAKyU8LtMdn8tgWfkbz6OyKhj9Pi09FHIwyFuXtPWK
 JT0/TT70drAWxDXL18Lajd3iUfkg/oDsYOKAQyBt52QmRijN50U0vib8v+wv9NOm8j56
 H1QA==
X-Gm-Message-State: AJIora+WFKhzWwvesvupUlsF33rUxZ9t2JXRAvh930rrp7PicMAaPSm1
 Iog1iU8glPJQDLjphs4+Jwlq9w==
X-Received: by 2002:a63:4604:0:b0:40d:a0ec:5dc4 with SMTP id
 t4-20020a634604000000b0040da0ec5dc4mr3693668pga.510.1657291378038; 
 Fri, 08 Jul 2022 07:42:58 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170903230200b0016b90620910sm22677315plh.71.2022.07.08.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 07:42:57 -0700 (PDT)
Message-ID: <83f71b37-848b-ad6f-d51f-b3d6e0d4cf24@linaro.org>
Date: Fri, 8 Jul 2022 20:12:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 25/45] target/arm: Implement BFMOPA, BFMOPS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-26-richard.henderson@linaro.org>
 <CAFEAcA8Ou2N9qJyvSy2wkpGtguCjJrA9YWoio4jsrv5VrNE3VQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Ou2N9qJyvSy2wkpGtguCjJrA9YWoio4jsrv5VrNE3VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q3itEMR9wjiZ

On 7/7/22 15:12, Peter Maydell wrote:
>> +static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
>> +{
>> +    pair ^= neg;
> 
> You seem to be negating element 1 of row and col ('neg' here is
> 1 << 15 unless I've misread something, and it gets passed to
> the calls for both the row and column data), but the pseudocode
> says we want to negate element 0 and element 1 of row, and not
> negate the col elements.

Yep, thanks.

>> +    if (!(pg & 1)) {
>> +        pair &= 0xffff0000u;
>> +    }
>> +    if (!(pg & 4)) {
>> +        pair &= 0x0000ffffu;
>> +    }
> 
> The pseudocode sets the element to 0 if it is not
> predicated, and then applies the negation second.

Yes.  However, the negation is predicated too -- the squashed FPZero is never negated.  I 
found it simpler to unconditionally negate and then conditionally squash to zero.

>> +            uint32_t n = *(uint32_t *)(vzn + row);
> 
> More missing H macros ?

Yep.

>> +                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {
> 
> The pseudocode test for "do we do anything" is
>   (prow_0 && pcol_0) || (prow_1 && pcol_1)
> 
> but isn't this C expression doing
>   (prow_0 && prow_1) || (pcol_0 && pcol_1) ?

Yep, thanks.


r~
