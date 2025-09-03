Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1B7CA1011
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 17:05:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utqvK-0008NO-7b; Wed, 03 Sep 2025 13:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utqvG-0008Mm-4v
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 13:05:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utqvE-0004Qh-0G
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 13:05:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so1094265e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756919121; x=1757523921; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KKg3T0VzkyNGt9Y2ird6rFs/+P4V8YZDNFyw3M3VLFA=;
 b=QhVU6BQdqYr+/T7QUNAITMmYU9rWaerky4YorUl1ZavcVgLttyNmbHf6YjYD4+O1DL
 E02tRV8EUgit7XNoP7Gcy6ueOvLg9uJWZD1UOKn2W5GPR+TuyxwEkTYLCMEnbAfylHid
 st8jajRcfP4Mujmy60KHeIsXnQJuKPTStVE4dfKlyez7XWH61oyCgDCT/B2iLDHj+MsQ
 pHwy3sWglJ3A9chWIP1z3HCkXh86+aqrNFT3CWnzaE0hUciNv6u9YWibgx+Pn19fjtzX
 8lMZQv9WYz9QUTakzezHkB9KWVawTD2b0hVSuL1c7SBB/Itgi0pZkp2gasOgwCj7rNpJ
 vgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756919121; x=1757523921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKg3T0VzkyNGt9Y2ird6rFs/+P4V8YZDNFyw3M3VLFA=;
 b=EwWvQbWBBVK4Z1GEVSddwLvIz3mIgYdwEIafwSJl/Ld8T4Cmcet3F2A8zoWmuKt+W4
 Ci4fCoWjXOIXClWgzhbISnsW2w9URrRVkkA2eFyhIV2lqk8PqldQPXEoK7/L+WpJZsDc
 AklJlMujteJjMQ82plm5DGnGLT+4+eoUo63OU2VFnwMOYHEmr1OYM8A5BtC7HuYKfZYg
 aC+4xXGxr1i/7KAVlOinLmzh4e4UIrQGv5B6ZXP9og+4caZ73ChabEnMqt32VVgNzxhw
 0jlDB6MngEJHTIBR8gVnfLwgdgIe7Bpt93EVm0qctlf74TDsHWYZjV9u7G5h4Whp3BWQ
 2R4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6mCHS5aOiyKQmkrpHKHkzybrSi/bZrnk+DTvfXK9L69jF1oSvqSnKdDRKxVVAfPdzoj04geKOqA==@nongnu.org
X-Gm-Message-State: AOJu0YyixMhFp8VAH+oW2ayZ4hQgr6lgCAOn7Qmiy1o5f5NKlXhwcg/V
 SV2xzx1/efMQ9WLOTX1bqPIv6SU3KMcteor9kyCgyOmCFCuesywBGEK6yK1zsUsEohI=
X-Gm-Gg: ASbGnctYJFkuTEQs3hIedPsWajHLLpQcEiEa+REfqlUnnIHNQT/lqEH5QltcdJDjmPA
 puihJbzC4m4gdjvEaxSL4xQKiJioEDvFwC2yCzLThJEtQMyBkVMZ3YAEMP+ahCr7JX762S55+24
 Ao6EpDYwB0fKnzIs6BwWZVyc06GrxAGFFxYz6ffCTi9i0AJCS74JWAOLFq0mizbNHMHE5xe9dup
 HUboF+DoUet0D95SxpqdCwDtgE06w9I/S03eT/CWcuwyTKA5/L6IUWPDDDT5xloVK8f85rIfrLl
 Der3GpEq06opoD6DojlU6nr7M0B3NNNPDQTz/HhF3Gz2U/9XdKySpRK8i+yJXZzS/50zGxwuOI/
 8xuRhwB8S1pGvGFtNY4fBMGoAlxUWdvMpc1dqlnUD5Q1CQ6EwTOiVr7DziPrUCoHka4DoSsAfYD
 rS
X-Google-Smtp-Source: AGHT+IEFupT2dJ0aE1zSaVfQjDg/Gkk0/3bNAXi6jZ/7TwgMH6r27e/6Iy0oiJ2VIzjZXelUyoNmuQ==
X-Received: by 2002:a05:600c:4e91:b0:45d:5c71:76a9 with SMTP id
 5b1f17b1804b1-45d5c71790bmr10293985e9.24.1756919121337; 
 Wed, 03 Sep 2025 10:05:21 -0700 (PDT)
Received: from [192.168.1.138] (93-34-129-33.ip49.fastwebnet.it.
 [93.34.129.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d729a96912sm12172889f8f.8.2025.09.03.10.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 10:05:20 -0700 (PDT)
Message-ID: <2c4227ac-8f94-4599-a950-aef9a5110991@linaro.org>
Date: Wed, 3 Sep 2025 19:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] target/arm/hvf: Mention hvf_wfi() must run on vCPU
 thread
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-9-philmd@linaro.org>
 <c51382aa-070f-4441-a707-a29d87093b48@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c51382aa-070f-4441-a707-a29d87093b48@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 3/9/25 14:34, Richard Henderson wrote:
> On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
>> Since hvf_wfi() calls hv_vcpu_get_sys_reg(), which
>> must run on a vCPU, it also must. Mention it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/hvf/hvf.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index d87a41bcc53..05fc591b523 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -1836,6 +1836,7 @@ static void hvf_wait_for_ipi(CPUState *cpu, 
>> struct timespec *ts)
>>       bql_lock();
>>   }
>> +/* Must be called by the owning thread */
>>   static void hvf_wfi(CPUState *cpu)
>>   {
>>       ARMCPU *arm_cpu = ARM_CPU(cpu);
> 
> How can it not?  Are all these separate patches and annotations helpful?

Well they helped me understand the locking issue in patch 15 in
hvf_arm_get_host_cpu_features().

