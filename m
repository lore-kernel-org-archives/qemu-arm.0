Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0FEFF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACXW-0002lY-M7; Tue, 07 Apr 2026 15:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACXV-0002jU-96
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:56:45 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACXT-0006p6-PO
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:56:45 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-35d971fb6f1so4706482a91.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591802; x=1776196602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6poibM2YHAi8gi1/iCNREFyz9Fc9y9F8/6NFCMksCI=;
 b=gV5MJpXu/z1xi3dsU6Bj9yhfIr+HvVQyJEDXYBExFjYCQfDsEkbHaE6d3n5/ztJzzI
 ca6Rnb55YY3iuz9pDqYZfwVkDQO1fpJUPIwQVBw79m8YuaVvGCOFmlB121KxCvU5mGfV
 YFuPlUNuHoBxumWcXQl7nXeFtHcHUaiXDZR0LEfVHJoQdokeZ3BE1iKFKcL7GusgKeYu
 WDxQYpM3LIAxa+CysPlX8+bcst1zXyhfVDrjg1X6fKaNPOOY8n2fUu27BH87hWe6g+3Z
 5iXRmaAY10sWBxeAg7RE581z5KqjaSemZgwxuRVXunSUTxzHqPwTeuA+I3L8Qq5t7R7N
 XcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591802; x=1776196602;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6poibM2YHAi8gi1/iCNREFyz9Fc9y9F8/6NFCMksCI=;
 b=c0pMAhnfdkcT1d90AaxAuDaNAaJWYAAwnUoFHnsu81anyJjoEbNG7RkXBqjFqx/YOi
 tFuskRjb1uWfuW0vtBEhTGMwoQdpZK/ymwAGZAt5qvydrDvXzl5C+N30wNUCRGCNrZFc
 zIYFl4UHfODprd+os2smIn+CklmA300Jr2dUSx/EJ//o/r4ERMBSAdd3Q8nAUTLV7mO3
 w3NXlnB0h9rVqcK8nsui55AWbz1fUfBUNIK+xtHJIJhNxpfa/ibusrAeVN+7zS1n1mCl
 n1J3G1AeLku08b8ReGavOZZHWr7f2rvKdOt0yXqKbtzzCUq3N/0L6e22eZVBNORqXDg7
 yJ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4i5qKUrg+F+MGLUtdSnv1m71gwO7vhUfU6AkE/vwfQeaMl7BLQftwqnwKOUX6T9kHE+7Su0AOeg==@nongnu.org
X-Gm-Message-State: AOJu0YxsE9d6U9yl6FmEcx6pPN53MKXXkFO5ukGyuUsEqqNzN4gmB51i
 9zr/xeI4nudv+bA45/3jYxjqiZQiSzSRWyoifKCdJtGrF+ibxHLDnl0kKKLquc9Q+6M=
X-Gm-Gg: AeBDietssRZHnfI49lPMMQetyF8RJvAEmKsZlUaEH7awDezGOrpARf10NngOwN/p3LM
 /ttBak4w9jKsSs8PiMaVdS7tDKHtRMGlWQu+Nre6TaTOE8NxLjXfFPP+UAisy8flA9yHGWCCNs4
 4YMcdreuP8gB90GcFfCpn8t3/eD1Y6jDPjNXpHriKaRYQOcWg9JfOT6XZGzdpBP1Lu5x9Q3tBlX
 Z8odqSTdz2xLyqUTFGvdjTmr8czcd2RylLNJmBKh6YECBwELyhuRM5G4Am4rYi2XksN11Rhp9xi
 XHI/4fd3KWNFlUO97R0x5lYZom+qDpGwlWajB0b1OpkYJGlW+zyu1cgzdjx2bpiX2Svl4DTN0CE
 8t6Tzoc4u5+qGCpn94tznK0eqWVSjOJ99Ic7wzDc7NVID/OUfwol1w8+uWAx3Ad1YqOGAQr7OWR
 KyWNB+mFxzE30ezUZPTWBeGD4b54XA3e/QUbYRyBNcmDvj710mflV+zE1P84TgOluoAaBIFw==
X-Received: by 2002:a17:90b:1dcc:b0:35c:30a8:330 with SMTP id
 98e67ed59e1d1-35de66262d8mr18370197a91.0.1775591801947; 
 Tue, 07 Apr 2026 12:56:41 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dd35f50e9sm18113483a91.6.2026.04.07.12.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:56:41 -0700 (PDT)
Message-ID: <ae93b673-7969-48be-818e-086ca39fa1e8@linaro.org>
Date: Tue, 7 Apr 2026 12:56:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/20] target/arm/tcg/translate.c: remove target_ulong
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-20-pierrick.bouvier@linaro.org>
 <614088dd-edfa-4cef-aef1-b697c8b4aaa2@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <614088dd-edfa-4cef-aef1-b697c8b4aaa2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/7/26 12:16 PM, Philippe Mathieu-Daudé wrote:
> On 7/4/26 04:27, Pierrick Bouvier wrote:
>> We can replace it with uint32_t, because we know it's limited to 32-bit
>> target.
> 
> That, or widen to vaddr for consistency and save a "why this uint32_t
> type here?", anyway:
>

It's really specifically uint32_t we want here.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/translate.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
> 


