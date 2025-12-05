Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B1D2F7D9
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 17:20:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRZSp-0005ga-6v; Fri, 05 Dec 2025 12:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vRZSm-0005gI-14
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 12:19:24 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vRZSk-0003tl-0P
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 12:19:23 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-bcfd82f55ebso1555430a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764955160; x=1765559960; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fNr3vkwz8TE38u1XNmS2c3w2p3CdTxpHlmwQlriUDHg=;
 b=OZMeC24UrDsCdJqFlatzr8SnD8B6Fna1ESjuQ4oztO72p8PzixUBq4dJXkWrbrm/Ip
 4rFtQV/UB6R2vS422JCbwM5Y5kK+LcJ5Q514DaKUzqyRGwABx38ulvcC+6JY9P9rYj5c
 3XKBdif3JnIx5iMyvgsmlpC+msgMdn4qqcbjWvQfk7SkT7AE/K/KRbl0JuFzjJ8r1KS/
 x/zazxsRoU0WhU6dVy60kxXmf9YH5PrBDQ+5bCO06P9pvTU5PmWAFenc9hO2iTf80uTo
 cZvM8TGq59pGo+3sVPJxsj8wepuj+1YTB3rHrdsqi2jyX2YdZjT/K1aF01uFzqCSLCzG
 aCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764955160; x=1765559960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNr3vkwz8TE38u1XNmS2c3w2p3CdTxpHlmwQlriUDHg=;
 b=MWJAh65yaLWSDJuxCm7wjhxFmnXxsu8IumRPE4wYJLxWShSV6jLaqa4wzNPhLRb+dh
 w4vbHI7cGt+lKCFDYrXtFXjbdYoCiAZ8Zggc9JOzQm/ks6smFmXqWyylY+NVCze1jyMU
 lDfqlw5V5mk5HcZqlBK647PJTaZe167cRSKN+hvBpf3gpm5Opk2Nng77WPWRw5mT8jeL
 YNmpj9MSZYbU/5N+emi/GzMmeG1TmzEWrYrkRty4TkhouF00tAD2/dAlFm9dNbUWa8pW
 0frAXMS1eZ6Qfrg4QxnPUhveSo8bPEET1fD02pt4LkZoJ3RYnsPkUD73XySntfpIWS7B
 J+RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEsF65SKw7d+wzGV+LoLPRtPef9eaoTrQ30mdFMkxgtgvUo3gAzYkxJqfXJ6p4rR7Pmc/8T3Oekg==@nongnu.org
X-Gm-Message-State: AOJu0YzkBr9yF8jvm2ufOH7O7SfnZx2tsvsOC2+1VEw0ZRb/fthKRhww
 4pgX0Q3RDbWL2fdxscxxsv6tnj7TskDA6Bfuo1IOeTH4yP3piRmTd5Ct80yXYSknsEg=
X-Gm-Gg: ASbGncsS/mrB+F9ZSrOo+zjyE0DtojhS+iJyFBZcSp44D+BqSniLztFArJM5tugPqhI
 H82hQK1hQisPSQg8uxMBLAwelxmBxy1gmz0FDvI2mTDefTpLOvBlTiEjJsnwM6df8VUL0wd1fDh
 7g0QyRrTnqLnxtJQRM2VzTQ0oe+vBz+RQK0Gh88Jt5mr+RCN2aVtK4lKt8YdlaNmKnt4h60gSDz
 ot1O3HZw99xwdQ9fNv53HhDmdj/+GXoauXXvkf9UDWpLwz9LEdjJ35yY96249tV6GLOW7l6L5Qy
 ItRbfCjH2M4L6oHHh7gtHVQ95wawF1GxZbJF42+CLM8TottgRBPd3N9EOOq42ogGXld0HydaNS4
 ZOKxhgt7G6bVaxL74BRf9ls2Lt55FXvw+f0ESZ5ng3C3fm09IDTZHzh/OANHFsh047vGMXNlUKb
 IKZxy97uk2BxgjBquP4Ij1a2tNoaqnmrkLlkab5+D4UGYdAeVEtASlsVs=
X-Google-Smtp-Source: AGHT+IH/cHLhy23k2UA+wVY+EWNMpezGTrOJ4ke0g0WyckePYsGJ7iz1T/r1JzBAX3s94WkfoSBBHg==
X-Received: by 2002:a17:90b:3a47:b0:343:7711:127d with SMTP id
 98e67ed59e1d1-349438d603fmr7554402a91.9.1764955160169; 
 Fri, 05 Dec 2025 09:19:20 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeae6ae0sm54197205ad.93.2025.12.05.09.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 09:19:19 -0800 (PST)
Message-ID: <a361b46f-2173-4c98-a5d3-6b4d2ac004af@linaro.org>
Date: Fri, 5 Dec 2025 09:19:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v5 3/4] tests/qtest/libqos: Add SMMUv3 helper library
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251126154547.1300748-1-tangtao1634@phytium.com.cn>
 <20251126154547.1300748-4-tangtao1634@phytium.com.cn>
 <9b2c0429-a8bb-4df4-ad95-492f463cf29f@linaro.org>
 <b184c907-e073-43d0-87b9-cf8c6c23dbed@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <b184c907-e073-43d0-87b9-cf8c6c23dbed@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/5/25 7:03 AM, Tao Tang wrote:
> Hi Pierrick,
> 
> On 2025/12/5 07:53, Pierrick Bouvier wrote:
>> On 11/26/25 7:45 AM, Tao Tang wrote:
>>> Introduce qos-smmuv3, a reusable library for SMMUv3-related qtest
>>> operations. This module encapsulates common tasks like:
>>>
>>> - SMMUv3 initialization (enabling, configuring command/event queues)
>>> - Stream Table Entry (STE) and Context Descriptor (CD) setup
>>> - Multi-level page table construction (L0-L3 for 4KB granules)
>>> - Support for Stage 1, Stage 2, and nested translation modes
>>> - Could be easily extended to support multi-space testing infrastructure
>>>       (Non-Secure, Secure, Root, Realm)
>>>
>>> The library provides high-level abstractions that allow test code to
>>> focus on IOMMU behavior validation rather than low-level register
>>> manipulation and page table encoding. Key features include:
>>>
>>> - Automatic memory allocation for translation structures with proper
>>>       alignment
>>> - Helper functions to build valid STEs/CDs for different translation
>>>       scenarios
>>> - Page table walkers that handle address offset calculations per
>>>       security space
>>> - Command queue management for SMMU configuration commands
>>>
>>> This infrastructure is designed to be used by iommu-testdev-based tests
>>> and future SMMUv3 test suites, reducing code duplication and improving
>>> test maintainability.
>>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> ---
>>>    tests/qtest/libqos/meson.build  |   3 +
>>>    tests/qtest/libqos/qos-smmuv3.c | 731 ++++++++++++++++++++++++++++++++
>>>    tests/qtest/libqos/qos-smmuv3.h | 267 ++++++++++++
>>>    3 files changed, 1001 insertions(+)
>>>    create mode 100644 tests/qtest/libqos/qos-smmuv3.c
>>>    create mode 100644 tests/qtest/libqos/qos-smmuv3.h
>>>
>>
>> ...
>>
>>> +
>>> +void qsmmu_single_translation(QSMMUTestContext *ctx)
>>> +{
>>> +    uint32_t config_result;
>>> +    uint32_t dma_result;
>>> +    bool test_passed;
>>> +
>>> +    /* Configure SMMU translation */
>>> +    config_result = qsmmu_setup_and_enable_translation(ctx);
>>> +    if (config_result != 0) {
>>> +        g_test_message("Configuration failed: mode=%u status=0x%x",
>>> +                       ctx->config.trans_mode, config_result);
>>> +        return;
>>
>> Is that expected to silently return if we can't configure translation?
> 
> 
> No, it is not intended to silently return on a failed configuration.
> Maybe an assertion is a better choice:
> 
> 
> config_result = qsmmu_setup_and_enable_translation(ctx);
> 
> g_assert_cmpuint(config_result, ==, 0);
> 

Looks good. We should rely on exit code first, and then on verbose log 
to find what is the problem.

>>
>>> +    }
>>> +
>>> +    /* Trigger DMA operation */
>>> +    dma_result = qsmmu_trigger_dma(ctx);
>>> +    if (dma_result != 0) {
>>> +        g_test_message("DMA failed: mode=%u result=0x%x",
>>> +                       ctx->config.trans_mode, dma_result);
>>> +    } else {
>>> +        g_test_message("-> DMA succeeded: mode=%u",
>>> ctx->config.trans_mode);
>>> +    }
>>> +
>>> +    /* Validate test result */
>>> +    test_passed = qsmmu_validate_test_result(ctx);
>>> +    g_assert_true(test_passed);
>>> +
>>> +    /* Clean up translation state to prepare for the next test */
>>> +    qsmmu_cleanup_translation(ctx);
>>> +}
>>> +
>>> +void qsmmu_translation_batch(const QSMMUTestConfig *configs, size_t
>>> count,
>>> +                             QTestState *qts, QPCIDevice *dev,
>>> +                             QPCIBar bar, uint64_t smmu_base)
>>> +{
>>> +    for (int i = 0; i < count; i++) {
>>> +        /* Initialize test memory */
>>> +        qtest_memset(qts, configs[i].dma_iova, 0x00,
>>> configs[i].dma_len);
>>> +        /* Execute each test configuration */
>>> +        QSMMUTestContext ctx = {
>>> +            .qts = qts,
>>> +            .dev = dev,
>>> +            .bar = bar,
>>> +            .smmu_base = smmu_base,
>>> +            .config = configs[i],
>>> +            .trans_status = 0,
>>> +            .dma_result = 0,
>>> +            .sid = dev->devfn,
>>> +            .tx_space = qsmmu_sec_sid_to_space(configs[i].sec_sid),
>>> +        };
>>> +
>>> +        qsmmu_single_translation(&ctx);
>>> +        g_test_message("--> Test %d completed: mode=%u sec_sid=%u "
>>> +                       "status=0x%x result=0x%x", i,
>>> configs[i].trans_mode,
>>> +                       configs[i].sec_sid, ctx.trans_status,
>>> ctx.dma_result);
>>> +    }
>>> +}
>>
>> What is the reason for batching operations?
>> We are not in a performance critical scenario for running this test,
>> so it's probably better to have distinct calls to single_translation.
> 
> 
> As described in the previous thread [1] , I plan to split the tests so
> that each translation mode is exercised by its own qtest. With that
> split in place, there is no real need for a qsmmu_translation_batch()
> helper anymore, so I refactor it into a qsmmu_run_translation_case
> function and drop the inside for-loop.
>

All good, indeed removes the need for translation_batch.

> 
> [1]
> https://lore.kernel.org/qemu-devel/7370070a-c569-4b77-bd1e-6fc749ba9c90@phytium.com.cn/
> 
>>
>> ...
>>
>> For the rest of the patch, which is quite consequent, congrats. It's
>> hard to review all the setup phase here, but knowing it works with the
>> current smmuv3 implementation, that's a good proof that it's working
>> as expected.
> 
> 
> Yes, setting up all this infrastructure did take some time, especially
> getting the nested mode page tables right (and Secure state-related
> configuration which is still in my local repo).
>

Feel free to start with the current version, and then you'll add secure 
state related changes as part of your other series.

> I really appreciate that you ran the tests yourself and even checked
> with a coverage-enabled build to confirm that it exercises the smmuv3
> implementation. Thanks again for the thorough review.
>

In case someone else wants to reproduce:
$ export CFLAGS="--coverage"
$ ./configure --target-list=aarch64-softmmu
$ ninja -C build
$ QTEST_QEMU_BINARY=./build/qemu-system-aarch64 \
   ./build/tests/qtest/iommu-smmuv3-test
$ rm -rf build/coverage_html
$ mkdir build/coverage_html
$ gcovr \
       --gcov-ignore-parse-errors suspicious_hits.warn \
       --gcov-ignore-parse-errors negative_hits.warn \
       --merge-mode-functions=separate \
       --html-details build/coverage_html/index.html \
       --filter 'hw/arm/smmu*'
$ echo file://$(pwd)/build/coverage_html/index.html
# open this in browser by clicking on your terminal

If useful for you, you can attach those instructions in your next cover 
letter, so people can easily reproduce.

> 
> Best regards,
> 
> Tao
> 


