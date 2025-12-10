Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B9D3E771
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 18:44:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTPAE-0006P1-Mf; Wed, 10 Dec 2025 13:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTPA2-0006NC-NE
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:43:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTP9z-0003ZE-Qo
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765392213;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zr7uvmt/71xEwB5JJWgF6aR8P9yGGYRmX+C9qoOaMCA=;
 b=UIM0HvZuL7UN7qlXVFxj4bqPy648SFqOAS7q5m91IeCRoupXMgHhKCAb4N/IydyO27F9uJ
 LxqXsv4/IWRGX3PIIr5gQnU/5sPZ+p0JEKqRq63CdLWYie+FYr3Gk0L9H3BeZUg2lqBvyw
 hjTo5eJAt9JcSLQ0i3+NyB8NIGidOxc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-QyXx_F-dNZSFwZYERUL52g-1; Wed, 10 Dec 2025 13:43:31 -0500
X-MC-Unique: QyXx_F-dNZSFwZYERUL52g-1
X-Mimecast-MFC-AGG-ID: QyXx_F-dNZSFwZYERUL52g_1765392211
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29845b18d1aso2934985ad.1
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 10:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765392210; x=1765997010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zr7uvmt/71xEwB5JJWgF6aR8P9yGGYRmX+C9qoOaMCA=;
 b=BGAKP0Fvgr3Lq8M8lqA6zduoZ2M4JuSrytf0AQ4YRd6Pn/5fzsEut2mDZ3+JKPeHNc
 93ZxvgHQmnjwm2g74/j4Dk5Hb/67HCBFf06BUPIr7xarchXaFzNagdo1cZN6BDZN1MXS
 GN0zsFtQFaqsj6nmjx7LACWvElfof2Q3VaDz8L+v3v6FptDq2yq81SQ4xNEnD0XV0uEc
 ZJkyt6WQJGJSVNLGYmGA8OmOMyMvtL4NPVbl5yv9pdPc7pw8InfdyqkB6HOhNtdSb79w
 /AHiSDl5sR7boHQSThjOq9YGsUbHAFHpZJb+yfP2rW+tCFUUtAesw3w67l9PycXB/lu9
 7bgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWosZ2rhnUxh8RuHsCpKLlLl0Ubt3zKeIUdvoZAS3tkaiPKmZNGDSEgH+hGZjW1vcIp6vefBIdl6A==@nongnu.org
X-Gm-Message-State: AOJu0Yy8p8KLyUk7mPtN0rhrVlHN8Q6xx3UOyrzg37LuIRr366Fw1S/g
 T1VJfANOFxBN0YSJ/C4sgNAk33VObRHj19a3qNJKo+WIyZ1g6dQ8JBsr+D6/YOjya8d/16squaK
 Zqm6Zf8bihyjNiiRTW/LS1fvqwdUKDPdfYs9iVh8khTy1rFp9AhQ0jw==
X-Gm-Gg: AY/fxX5NLMQ0jxbOL3t1RUTgGDUjW3XJWxBsnxHsXZ6kq3WVgY9yqWYGzWujCSbbpd+
 P+qqsbdm3xEATUAqfjxMXDWqKva+GsGBW7s8rp/oCVyMUTlAmlaP1o5jVIpRuP9+OzgSeYN6FPT
 /5mJZk8MVsAfZtmaYgZDrQ7GV04/PEy1RKyLo1cA+V9p+HFLboJuS85OliGuSHiW90++ebkMbay
 ZAl3W0DFNEg5Hgqhzg0Xt1TrN3wY4LKz3B7UuWnb+K+IIdPbrzD757vj7D1uLTimdDNGRAeoGRM
 N9ULABQC4JNpG7KGuOaIXVulQBk8utdSAzdh3uoOvYnAgDfr4zcuas6XWmnm3N65Gnf6DbF/m17
 TuVpQPFz56cc5fMTQ3Ij6eo1YSFHrm3dBwSVDYSdpH5G06QbLyWjs9SMNkg==
X-Received: by 2002:a17:902:ebd1:b0:296:3f23:b909 with SMTP id
 d9443c01a7336-29ec25aaefamr40674835ad.39.1765392210588; 
 Wed, 10 Dec 2025 10:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE10V6X8Z/KwEFd/T62QX+LOP3jbBU+yBv9QUA571/PA8CD3dy4oJU4/qINtDG7giF03syQBA==
X-Received: by 2002:a17:902:ebd1:b0:296:3f23:b909 with SMTP id
 d9443c01a7336-29ec25aaefamr40674535ad.39.1765392210187; 
 Wed, 10 Dec 2025 10:43:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9b36c98sm813995ad.8.2025.12.10.10.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 10:43:29 -0800 (PST)
Message-ID: <e95d82af-540f-43b0-9f0c-2e5928192049@redhat.com>
Date: Wed, 10 Dec 2025 19:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v5 3/4] tests/qtest/libqos: Add SMMUv3 helper library
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <9b2c0429-a8bb-4df4-ad95-492f463cf29f@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _saK02C6kVT_p_t1CrjJw2S5AmpJPTfIqU23fPUxbz0_1765392211
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/5/25 12:53 AM, Pierrick Bouvier wrote:
> On 11/26/25 7:45 AM, Tao Tang wrote:
>> Introduce qos-smmuv3, a reusable library for SMMUv3-related qtest
>> operations. This module encapsulates common tasks like:
>>
>> - SMMUv3 initialization (enabling, configuring command/event queues)
>> - Stream Table Entry (STE) and Context Descriptor (CD) setup
>> - Multi-level page table construction (L0-L3 for 4KB granules)
>> - Support for Stage 1, Stage 2, and nested translation modes
>> - Could be easily extended to support multi-space testing infrastructure
>>      (Non-Secure, Secure, Root, Realm)
>>
>> The library provides high-level abstractions that allow test code to
>> focus on IOMMU behavior validation rather than low-level register
>> manipulation and page table encoding. Key features include:
>>
>> - Automatic memory allocation for translation structures with proper
>>      alignment
>> - Helper functions to build valid STEs/CDs for different translation
>>      scenarios
>> - Page table walkers that handle address offset calculations per
>>      security space
>> - Command queue management for SMMU configuration commands
>>
>> This infrastructure is designed to be used by iommu-testdev-based tests
>> and future SMMUv3 test suites, reducing code duplication and improving
>> test maintainability.
>>
>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> ---
>>   tests/qtest/libqos/meson.build  |   3 +
>>   tests/qtest/libqos/qos-smmuv3.c | 731 ++++++++++++++++++++++++++++++++
>>   tests/qtest/libqos/qos-smmuv3.h | 267 ++++++++++++
>>   3 files changed, 1001 insertions(+)
>>   create mode 100644 tests/qtest/libqos/qos-smmuv3.c
>>   create mode 100644 tests/qtest/libqos/qos-smmuv3.h
>>
>
> ...
>
>> +
>> +void qsmmu_single_translation(QSMMUTestContext *ctx)
>> +{
>> +    uint32_t config_result;
>> +    uint32_t dma_result;
>> +    bool test_passed;
>> +
>> +    /* Configure SMMU translation */
>> +    config_result = qsmmu_setup_and_enable_translation(ctx);
>> +    if (config_result != 0) {
>> +        g_test_message("Configuration failed: mode=%u status=0x%x",
>> +                       ctx->config.trans_mode, config_result);
>> +        return;
>
> Is that expected to silently return if we can't configure translation?
>
>> +    }
>> +
>> +    /* Trigger DMA operation */
>> +    dma_result = qsmmu_trigger_dma(ctx);
>> +    if (dma_result != 0) {
>> +        g_test_message("DMA failed: mode=%u result=0x%x",
>> +                       ctx->config.trans_mode, dma_result);
>> +    } else {
>> +        g_test_message("-> DMA succeeded: mode=%u",
>> ctx->config.trans_mode);
>> +    }
>> +
>> +    /* Validate test result */
>> +    test_passed = qsmmu_validate_test_result(ctx);
>> +    g_assert_true(test_passed);
>> +
>> +    /* Clean up translation state to prepare for the next test */
>> +    qsmmu_cleanup_translation(ctx);
>> +}
>> +
>> +void qsmmu_translation_batch(const QSMMUTestConfig *configs, size_t
>> count,
>> +                             QTestState *qts, QPCIDevice *dev,
>> +                             QPCIBar bar, uint64_t smmu_base)
>> +{
>> +    for (int i = 0; i < count; i++) {
>> +        /* Initialize test memory */
>> +        qtest_memset(qts, configs[i].dma_iova, 0x00,
>> configs[i].dma_len);
>> +        /* Execute each test configuration */
>> +        QSMMUTestContext ctx = {
>> +            .qts = qts,
>> +            .dev = dev,
>> +            .bar = bar,
>> +            .smmu_base = smmu_base,
>> +            .config = configs[i],
>> +            .trans_status = 0,
>> +            .dma_result = 0,
>> +            .sid = dev->devfn,
>> +            .tx_space = qsmmu_sec_sid_to_space(configs[i].sec_sid),
>> +        };
>> +
>> +        qsmmu_single_translation(&ctx);
>> +        g_test_message("--> Test %d completed: mode=%u sec_sid=%u "
>> +                       "status=0x%x result=0x%x", i,
>> configs[i].trans_mode,
>> +                       configs[i].sec_sid, ctx.trans_status,
>> ctx.dma_result);
>> +    }
>> +}
>
> What is the reason for batching operations?
> We are not in a performance critical scenario for running this test,
> so it's probably better to have distinct calls to single_translation.
>
> ...
>
> For the rest of the patch, which is quite consequent, congrats. It's
> hard to review all the setup phase here, but knowing it works with the
> current smmuv3 implementation, that's a good proof that it's working
> as expected. 

That's a huge amount of code indeed. I don't how much we shall review
this test lib but if it needs std review the patch needs to be split to
ease the review. Maybe qtest maintainers can give some guidelines here...

Eric


