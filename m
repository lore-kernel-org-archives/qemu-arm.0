Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A3CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmVW-0004Yq-Nf; Wed, 03 Sep 2025 08:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmVU-0004Xt-OQ
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:22:32 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmVQ-0007Bb-HF
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:22:31 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0475ce7f41so7282866b.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756902146; x=1757506946; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RaDzZygIjc6a5RfjjqXh5GehwDKcXm8ywtSvR998IG0=;
 b=u4uvynFsJNxgH9T0nE0CVwjGRKmgMK+94y0YxXXWs8N9GgUPIAlzl+TqewvSsk75qX
 GeN3i8pHrW0c9PVNNvgTjUiF+5bJxnhgmuGndeAbZ/jtOJTp1paEDkZzBjzV0TX9EmQ/
 0kKUYiYYAMN7GRbQdWReU1p6yvvXTjyJwOTNacLM+sRPtdsVzHhP8sZ5aLUnsfPdSKMW
 56LvI9xLAVifyMSWW4NZMVCYCDJoXI5MC4hqyzrJb8cVKiwaH26K8D18c4JdwM5UzGPs
 sP8C7QsDLmZmuposyqypllB2zgOr1f83TczC1kMa/FCHoxhaT5TKSoPrmUeBh++mEUkc
 Spag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902146; x=1757506946;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RaDzZygIjc6a5RfjjqXh5GehwDKcXm8ywtSvR998IG0=;
 b=DEtuJoCrohFfdqq5JEEyQ1z9g0Xf4h9Br3EVOfgu1dxEivTiHQG7ga5+w4/8t9ljl6
 rB/dHAZYVx9XS30D1lTalaSvFgGprgZmef64dNDFMbvRH9/M2aDLV/AKd/nJ80ZjGzHQ
 Yt/ugkIAKQn0dMU7rBZuC4RoByubvLeCWmqjpeZYLgeEyjgWosAMVG00uHAI/vtKAFjx
 6asNnsVDDBw94EvSrOWLSVcv5sURON7zAqMTjI/1CLg3QeObjX/fED63Lm2zVGQ9eNGE
 jm0SCP6GE1aE4AHF2TqTXcqFiRK7KVT9aVM55L0SjIVsa37TYYz9joURPhYp7utpzxwk
 inIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5Er5qNUMHvqOvo/94NmBczjowtR0Z7CVrPSEsH3JSTXiPh8ZQ1YX3DkDlvc4dewhspYqCDhIOw==@nongnu.org
X-Gm-Message-State: AOJu0YyFxixnZNuydO9jA2xtdhnThv76Xo8cLTgMExWS0DfL4UY8kWv3
 UlPGHiVVV/ReJV7bZ05jFf2rxMRw7gwqU7DTS3fdkSqtU5Sd/bBlRk8CUdpGEa24bTADuyu0Wia
 rcJWYOGw=
X-Gm-Gg: ASbGnctRWcyLfm1i4tuIyI4iX6KjKBDCal6xcti8yoSiRrhSFGIABSWLNoMlfMXmdRE
 p0JREEvhfa0bOhXs4SCguiru+bNLkoqJC7z1lOzX7WQDjh0t5q4mGW0eJAbxuD/yRd5u7SRE784
 JdCULfOVaLjzFIiz9EE8mZa3XKrB2/zf4oVVYl6N34pMWl4822R7o/MDaOTMJvph9kqSliG0Ckt
 ZBROT7n76OnPFUFL1pCrsB5GFdH1K15yJDO0OEkXZ+5o/ZH7J1TEf73dI7I5BIL9lx0kDqYxe7q
 Y+jzR74siWzBN3cyeRAE+Qw88di5t2JiHaGfB2hsCKYgnZoSjDA4jlT82asGRONJnwIu0xMJsus
 HaSdydliNOxSwdRiU2M9Mez5vNoLT6i0YbjYN6UUlVvsIf2kKXN/tspN4rj0GNz3THuxpC3ii/w
 nRiVMlvQ==
X-Google-Smtp-Source: AGHT+IFjTkt2SmPJcCv8v/42SyJOs52hUV8sR1Z73t862Kcv8/SbRs9OTG5dm6ShINVoOKg0arkuCA==
X-Received: by 2002:a17:907:9712:b0:b04:75fe:e88 with SMTP id
 a640c23a62f3a-b0475fe1178mr8119666b.49.1756902146467; 
 Wed, 03 Sep 2025 05:22:26 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0426516668sm778615066b.46.2025.09.03.05.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:22:26 -0700 (PDT)
Message-ID: <d61398b1-9f77-462f-94b5-2874df914779@linaro.org>
Date: Wed, 3 Sep 2025 14:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] target/arm/hvf: Release memory allocated by
 hv_vcpu_config_create()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
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

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> hv_vcpu_config_create() is documented in <Hypervisor/hv_vcpu_config.h>
> as:
> 
>    /*!
>     @abstract Creates a vcpu configuration object.
>     @result A new vcpu configuration object. This should be released with os_release when no longer used.
>     */
>    OS_OBJECT_RETURNS_RETAINED OS_WARN_RESULT
>    hv_vcpu_config_t hv_vcpu_config_create(void);
> 
> Release the memory allocated by hv_vcpu_config_create() with
> os_release().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

