Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B04CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsY0-0008FP-DL; Tue, 12 Aug 2025 13:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ulsXz-0008FD-98
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:12:27 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ulsXr-0001M5-5c
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:12:27 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-321a5d6d301so1883116a91.3
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755018732; x=1755623532; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3c2lW0+/OUuqUvcer0PxqXEkHuFsIRkQnp7MVxMTISY=;
 b=iO+sqY51p/b8j5rCQD4+TTHio4KF7rJtjBm2xaTMtcbDfevjyYbxT6WvEq0VjR6Drl
 1nZ438Gx4zt7qNXaH6xPkf99cvTK6EoQIY3vQjmvbNH3PodClOaY8wQhJLzq6HAn1r0T
 4yw7bsy82is4MS80C1DRa8ei6I/GQHuhrhNnZgXBhMqg0YzAjgzpe5hSc/geiZ+Ud2y3
 w6W+eXiEfgu1Rbqjn7xFSVGRTD8a+u7nxyQusm8zWX7DIwk8o8x47JqA5s4fqI/e/9zc
 VkJrCoHOLNx5fcTlSLvBvmkwsGAwKrbAxKj271qv/k/eORGCYQbqpLJqylr0SNCQjrGr
 4oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755018732; x=1755623532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3c2lW0+/OUuqUvcer0PxqXEkHuFsIRkQnp7MVxMTISY=;
 b=AsaPoiAZhNfxHFepqsvIWa5wzHYXtElT3/7ZA48mSk4bmSxbs23O7IVyjTSf7osvRF
 We4Lm0JAhg2cLUPixUn4aLPbGnlLn6S5iEMLZfZnw2FBP/qI03G5W6KA+wLg0vlB/fLg
 Hc9p+SD33xOL10gwtA+iGcXYIJi/3X/pjPVMk3pM2RI8eJHQTccqYjmZFDVWCpWeO7RK
 Bk/PYrQ899DZdqQ2ETV4hQ3pPnPLt/EVzjKJrLHbnowrIpZnJIDGgk897hrNH7GF+StL
 vehzO9qh3vN1OKJJb24pP81ka1bZhMPXCiolvFWz0Q2LrwWPYoGkOTTSBn7FQN8XRxvU
 8/EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTfN9lBGOQBOj/cY7/VVws2Tdr5PaE7iKlGXuM/kvOm6q8WfBZZ+/BzhMpxpzKSRMyYFRfYic3WQ==@nongnu.org
X-Gm-Message-State: AOJu0YxT3AN4fo0JC1IckHx5BYXsrOJ3Hr4jnrYr03sUJMtusGespwqk
 KEtIFE7dyKMmNMEOMLAiLZGD8onnlJr0VRZYRAvYsF8yQMB2ZXa6ZalqUkIsUDkN5BM=
X-Gm-Gg: ASbGncsvER/NEkvCEfEYdRpO1DhpAKdLOXg1Uw7GJdIwKOgGNNQp1MeyaEBCQPBeQf+
 v2b7u3Gi6+9W8rCCZlGLH6v6BbbxbxbahWRLiRT8zki02E0XD3z+k7juutK4RJclPalDTP3pVsy
 hs1/POaWXeW7l0ZNvUlGmVAB0b/to9OoJEDp9VEY2xly6xlpJF0ro3k9lNL603P18/7qCdVPA/7
 cndKx0DdvgOhn2PHMRDdOGqzZefDGZ6OEWhbffy7R/wp2x1fdSDVeKrmYsxHiVDYJCtZldP1cnb
 YGHT5UiIb1fhoXs5NW01HPWj+XCutqwr/jxA++V+g4BkaQvOfLokP9ijol54U+6KYXbmF7ckC7F
 Mnm8r2gVgw+tvwjnpmZ+4pQuPERrnEKtbMP/tTEoOYYivOQ==
X-Google-Smtp-Source: AGHT+IHJMOQa+RouMLgQx+ViovI8m1unqpnQ52QmkAsGDnhYKsNEIFQmMg6e0S5bffoaBBuJfSMDTg==
X-Received: by 2002:a17:90b:39cd:b0:312:f650:c795 with SMTP id
 98e67ed59e1d1-321cf9dc35amr484201a91.21.1755018732528; 
 Tue, 12 Aug 2025 10:12:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da81bfsm35311228a91.8.2025.08.12.10.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 10:12:12 -0700 (PDT)
Message-ID: <e9b579d2-96b1-4619-87fb-fa334bf5e0a0@linaro.org>
Date: Tue, 12 Aug 2025 10:12:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 02/11] hw/arm/smmuv3: Implement read/write logic for secure
 registers
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>, smostafa@google.com,
 jean-philippe@linaro.org
References: <20250806151134.365755-1-tangtao1634@phytium.com.cn>
 <20250806151134.365755-3-tangtao1634@phytium.com.cn>
 <4c84da2c-eefd-45b3-88ed-cc5070e5c421@linaro.org>
 <a5154459-a632-42b0-b599-d5dff85b5dd2@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a5154459-a632-42b0-b599-d5dff85b5dd2@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102f.google.com
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

On 8/10/25 9:54 AM, Tao Tang wrote:
>>> +/* Macro for secure read validation - returns RAZ if validation
>>> fails */
>>> +#define SMMU_CHECK_SECURE_READ(reg_name) \
>>> +    do { \
>>> +        if (!smmu_validate_secure_read(attrs, secure_impl, offset, \
>>> +                                       reg_name, data)) { \
>>> +            return MEMTX_OK; \
>>> +        } \
>>> +    } while (0)
>>> +
>>
>> For this, and previous macros, shouldn't we return MEMTX_ERROR instead?
>>
> 
> According to ARM IHI 0070 G.b page 87/:
> /
> 
> /When SMMU_S_IDR1.SECURE_IMPL == 0, /
> 
> /    - The SMMU does not support the Secure state/
> 
> /    - SMMU_S_* registers are RAZ/WI to all accesses./
> 
> RAZ/WI is indeed a deterministic hardware behavior, and I think it is
> architecturally distinct from conditions like a Terminate or a Fault.
> While the software might not get a "real" value from a register (it gets
> zeros) or its write might have no effect, the hardware access itself
> completes without any protocol-level error.
> 
> This is my current understanding, but I'm keen to hear if anyone has a
> different perspective or sees it differently.
> 
> 

This looks like the expected behaviour indeed.
Thanks for sharing the reference.

