Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7BAC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 17:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhtqT-0001pW-6v; Fri, 01 Aug 2025 13:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhsKp-0001yF-Cg
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:10:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhsKl-0004ff-Oa
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:10:19 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso21171875ad.3
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754064613; x=1754669413; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tEHG5XwF+mj3EjDyUhWj9etU2r1+imJLJhpVjhEPCCE=;
 b=n9tol9fsdFat+8pmA1FWaPhuQzqm9UCeqDU5o0icxdByrcl0qNjZgDNF/phMqzQOQ9
 nhYvBUCU3+XTjAFdt/ua8zIqiPqTgk3vecUSC64NFBzDdSFLLCE1VrkQbOsCjLVc1Y3t
 JDgf1wKYTrSsJCiNmltyC3TjHy6k8PjJv9hMeKIagsGzraoUeWii072X9liKVF2HzSRK
 BQnZl4xTpZNH/gJaT3QlbadfjC4h9+7EehwWG8y+GNh6u3FVV3+Zed8h4HES6ABqpV7i
 nWvVzO286XaGgtl0BRGGH9odBnnoXZjno3qIX4GUsl7Ca7APYmnW2OUIZ9tfYN+P1FF7
 h4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754064613; x=1754669413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tEHG5XwF+mj3EjDyUhWj9etU2r1+imJLJhpVjhEPCCE=;
 b=GRm+I79egicb0qUp8FbBnsOLcU/qmdca8BOvDZ3gEo6ebf2n7jmjgGP8qCxrIZgl+g
 W8RbFrvwKgQUH7wBfc7LkD6LvcVnMIUxsLCB1Iy750S6i8VwatNR+xUClK01DmhYMfvq
 +MvP4bDF1jKiQ0XI2A+oUYrEFDFMPwWrWJ8kwJXX3+r/lbO++O+J9eCSX8T/r1qwLD4T
 Od8mFacDKn5QefDvxaS8dev3iYBb/9Wt8Nxu95lLFrMziRwNTCyxnCLxftOKGd/IzTaR
 YcyQo1K5mCTuo/6Ad91R2p9bj0PirvIoAH3vzNTHLUFij/qqfdcgjG7pa/Gxyukey8yy
 NdjA==
X-Gm-Message-State: AOJu0Yzx7Idc+YiDZXUcEp5J9IXBrdWSdyKeu8pDkR+rw31kCYmfLIyp
 G/7bm9NoX5+kaB2/+JL5+o6MgiF12O/2BR1pkfxoKZyN4ItvP5NLFXfN7AQJaNt/EVuOzII86Vj
 kB4P3Hgs=
X-Gm-Gg: ASbGncskkKSbSfjJER4xDFlaD6P5oIhijg9Ag5ObL07kb8nt3axhaRzWNRpSuRb+tnK
 QT39p54POKBVyLMfxcs1Pk+l5Ylz5Un2Iii6kgfT5j2narQj3H9jT00C7Zm40ZsJThUo1wUUFqJ
 jZLHNABIAz90M6JbzjR5LvRBwctDR6S9+wrVggcAxz+H8HueYgZFEc3piLRV6oHwuCWR/0LHw5Z
 rtNu7ojUNhcLkqZczyvhrv47pXZeHgFaVHpftEMW84+7n4RsxDt0NrNgS+dhWtOvxIvB7bNY8UB
 shhx6GvRWA5+mtMt4Cl5Arr/W/XIahkjh9HTkWglrl2/QpbW0o2o+gIhElqgohcYIHN9kBK7EDa
 lZbVc8UtIBaZ61KSxEmFdFOn+xPgiaBKkuE8=
X-Google-Smtp-Source: AGHT+IEmTUYf8UVCsynrBIvTa9moHqBFMfn2fvjatHEtPZX8U2mkwECK5wX84WSYpi/Z4+n0CANLHQ==
X-Received: by 2002:a17:903:187:b0:234:ba37:87ae with SMTP id
 d9443c01a7336-24246f3e974mr1513225ad.4.1754064613178; 
 Fri, 01 Aug 2025 09:10:13 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8977114sm46559455ad.102.2025.08.01.09.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:10:12 -0700 (PDT)
Message-ID: <8d940286-3eb9-4b4a-a084-dffc096062c9@linaro.org>
Date: Fri, 1 Aug 2025 09:10:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/82] target/arm: Convert regime_is_user from switch to
 table
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-38-richard.henderson@linaro.org>
 <0128c452-8bde-4bdd-b73c-330a7bd619a1@linaro.org>
 <e275dc71-2d48-4b48-9b7f-dae2c8934d64@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <e275dc71-2d48-4b48-9b7f-dae2c8934d64@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

On 7/31/25 8:53 PM, Richard Henderson wrote:
> On 7/31/25 07:21, Pierrick Bouvier wrote:
>>>    #include "mmuidx-internal.h"
>>> -#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
>>> +#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK | \
>>> +                ((X == 0) << R_MMUIDXINFO_USER_SHIFT))
>>>    #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
>>>    #define R2     R_MMUIDXINFO_2RANGES_MASK
>>>    #define PAN    R_MMUIDXINFO_PAN_MASK
>>> +#define USER   R_MMUIDXINFO_USER_MASK
>>>    const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
>>>        /*
>>> @@ -33,7 +35,7 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
>>>        [ARMMMUIdx_Stage2_S]        = REL(2),
>>>        [ARMMMUIdx_Stage2]          = REL(2),
>>> -    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
>>> +    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | USER,
>>>        [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
>>>        [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
>>
>> Maybe I missed something, but what about other entries that were initially treated in the
>> switch?
>> - ARMMMUIdx_E.0_0
>> - ARMMMUIdx_M*User
> 
> See the change to EL().
> 

Ok.

> I'm not sure why ARMMMUIdx_Stage1_* is excluded from arm_mmu_idx_to_el(), but I don't
> change that in this patch series.
> 

Maybe it could be more explicit to either tag all concerned entries with 
USER, than rely on EL(0) adding the magic, since this fails to apply for 
ARMMMUIdx_Stage1_E0. It's just a suggestion for readability though.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

> 
> r~


