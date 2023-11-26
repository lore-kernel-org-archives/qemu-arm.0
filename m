Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp365138ejt;
        Sun, 26 Nov 2023 05:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG58qllQ+t0i6a50KcrCh408nRXyrU5VB0dO1td4tLLWpUUdKo9JgQyQiPMpvLleTePt8A9
X-Received: by 2002:a05:6a20:7da0:b0:18c:9175:eae6 with SMTP id v32-20020a056a207da000b0018c9175eae6mr382916pzj.24.1701007181885;
        Sun, 26 Nov 2023 05:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701007181; cv=none;
        d=google.com; s=arc-20160816;
        b=uGCCP22W7VO/G/GglFJ5PbcN/QiAWKd7sLMNTCiD6dpAmnBVfkZ66RuB1tyPvwomPD
         t6NFoxcxuOlhobbD80/nzrskjGbO2+gpD3mwQh28HMjKbpqyxXRywUA9HhHCFDm1Te7Y
         9FloVKdgDtncUj6VljPAWUw8CSZX3EEhnDVKlKsfqsIwRWtpnIt5MwtxCQ/85icGmXwe
         JwjHTugFAZZ1v9N28yo/FfczBWngFrdHPDLEdGwrRiSd90NVSNJty2kKRvusrvE4O5iL
         rrIPIw392lKFq2wGCFy9t+LN2Z67HSj/wMZw1RbTJrD2zHaSt6eXUjpC7h9w5xpcFHDX
         zvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=R0tl1FznWRSZXjG/br/+doPbwrsA5NmyepPx25HwKuI=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=QMWhxcY9gnni1Dl1QJZmVoDuW8gotca4lAVQc8fm3wXyPJDTv+CV/jyyDUwCf5e6gb
         sQ9PXj5FyWjqrw5Ski7l0iT3xQz5g8R6EBwEnpl2jPTRe7VYPLfBSjM01ef4feGD/BwH
         Qpm7yBSE6bdirGRHKYFgGMYG0P7QMp5rup1TvkM9Wehzral1n1mpGEMqoWdCi2YbBtWv
         TzpHVcxccUQpHThRgobEf8v5SpGNjY9Ea9/sTz78dZgOMbIzu/oAHn3cyy2563S3ORPt
         ZKn+E0PvSz8TsgwEQrG9nTnU2hx0B93INhI1p4yV3Ywk6jhPb50baoYobZQPk/sByY2T
         1VJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjHqyitM;
       spf=pass (google.com: domain of kvm+bounces-2461-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-2461-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2461-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id c13-20020aa7952d000000b006b6119c4695si7466000pfp.380.2023.11.26.05.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 05:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2461-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjHqyitM;
       spf=pass (google.com: domain of kvm+bounces-2461-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-2461-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51CB02810B0
	for <alex.bennee@linaro.org>; Sun, 26 Nov 2023 13:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B518FD28A;
	Sun, 26 Nov 2023 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EjHqyitM"
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B81FC
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 05:59:34 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d81580d696so638541a34.2
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701007174; x=1701611974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0tl1FznWRSZXjG/br/+doPbwrsA5NmyepPx25HwKuI=;
        b=EjHqyitMGGbd7lgjZdAOSlAzCMNuBSPGgF8yYbWgiJtVa43qq760RJPquy/6kGIN3x
         nWnFzxJ2hziOypHEcdNjhrK+xOEIUVuyQTslc4AHZBklhnJdkKqQG3rjOhEM+xdEWmcW
         qkipo8rk2k9O3Vl769e8vBcran2YxpEtIs5nQGrAVem6B9u2NL2Rg54Kmik2kWaUI9wR
         T/GQUHJWFTY12NnJ7bx+QfTsytEkDof9gQ18jLR7DJiXFgrHpojjhwsLU5uaoVSu2jB/
         8oID7PGXAdXwE1ZNHT61PkyUIUrkj1H39uhBBe9s4Oe3wp4QseSvtvh/+wy3NzV1Z8xE
         x+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701007174; x=1701611974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0tl1FznWRSZXjG/br/+doPbwrsA5NmyepPx25HwKuI=;
        b=pHRbkenGiQcAPpYmG9e2qeEUbQ0itMr+tGS5AwGV9RFxDE1vg3+KS5lx9KDxdWCiou
         bZElGnA0imPVeKknLU+fkNLKbiJAMrjqb8+9UF1sSRHQ4pIACpkCiKjF4IToKMY4zcEK
         HdGtQ7jSzWeYNNXB82gUhWbxp6lz1ymJc8SKs8SknDnQg7+g0XLs4vLadTJ0aDj3OvTQ
         MAVH9le1mqNBg6zGBaec0jWct0XwPyHdDJT35eeFN5LxewxGjFN1gE59lXgxk/V60VmU
         RF3P5cnpHH1uB27T3m06u64ApG5XG5Y5XywW5zCWW3tI47eaa3Iwxc6NSLhzFG6+pYm8
         rtIw==
X-Gm-Message-State: AOJu0YxiiWzrUNQY1M35O6eHXS/adnKK2Tn8QYby3JE1Em0U4+RmnMWE
	pzB1BqTPu1fKGAcGCsYZM86zYw==
X-Received: by 2002:a9d:7c86:0:b0:6c2:2bca:7a14 with SMTP id q6-20020a9d7c86000000b006c22bca7a14mr10801328otn.23.1701007173808;
        Sun, 26 Nov 2023 05:59:33 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id r8-20020a056830448800b006d3127234d7sm1058215otv.8.2023.11.26.05.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 05:59:33 -0800 (PST)
Message-ID: <c031bcb4-7b2b-4ca4-a25b-65e9c10430af@linaro.org>
Date: Sun, 26 Nov 2023 07:59:30 -0600
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 00/16] target/arm/kvm: Unify kvm_arm_FOO() API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-TUID: M5/V/yu7MdTQ

On 11/23/23 12:35, Philippe Mathieu-Daudé wrote:
> Half of the API takes CPUState, the other ARMCPU...
> 
> $ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
>        16
> $ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
>        14
> 
> Since this is ARM specific, have it always take ARMCPU, and
> call the generic KVM API casting with the CPU() macro.
> 
> Based-on: <20231123044219.896776-1-richard.henderson@linaro.org>
>    "target/arm: kvm cleanups"
>    https://lore.kernel.org/qemu-devel/20231123044219.896776-1-richard.henderson@linaro.org/
> 
> Philippe Mathieu-Daudé (16):
>    hw/intc/arm_gicv3: Include missing 'qemu/error-report.h' header
>    target/arm/kvm: Remove unused includes
>    target/arm/kvm: Have kvm_arm_add_vcpu_properties take a ARMCPU
>      argument
>    target/arm/kvm: Have kvm_arm_sve_set_vls take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_sve_get_vls take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_set_device_attr take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_pvtime_init take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_pmu_init take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_pmu_set_irq take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_vcpu_init take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_vcpu_finalize take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_[get|put]_virtual_time take ARMCPU
>      argument
>    target/arm/kvm: Have kvm_arm_verify_ext_dabt_pending take a ARMCPU arg
>    target/arm/kvm: Have kvm_arm_handle_dabt_nisv take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_handle_debug take a ARMCPU argument
>    target/arm/kvm: Have kvm_arm_hw_debug_active take a ARMCPU argument


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
