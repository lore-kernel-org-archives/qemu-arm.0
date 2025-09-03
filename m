Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BA9CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkTe-0004AK-SB; Wed, 03 Sep 2025 06:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkTW-0003vY-UD
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:12:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkTU-0000m2-GG
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:12:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so15787085e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894338; x=1757499138; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9/IZWFrW5IhGd9GyKd6ZrmUwMraLMxhPEYvLIzqwP50=;
 b=TcyKiQtryU7XlQHCnSn5wFgQhJDGqlm3p2+pLZ/Mvh2Yq3KBtVivTnMtRBfog7jWeV
 obn/5xkA58QaXD/oPUw4bn3+R9szZaIxjdBjnN5q23vDQG3NF154dDmEmx2kgloRkSbC
 eLIaGYH5oEUAER9TcbvBbFiu+st8P1gJK2HqtXGzQXfTS6+QFFv0pFltlj1MomCBGG+B
 AtDsxJZUgnqcXmxwajk0F6CmleE9FGGQdsvdU2JkD7B0EZ0KVFrBw2Uv3AhVCUzrvi0e
 f4MgwfmJzuMF8nAtc8t049CorZzSs9HSWSNdhDzVMJx6heyFbqldHDX+H9UrWjM9GFEg
 //DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894338; x=1757499138;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/IZWFrW5IhGd9GyKd6ZrmUwMraLMxhPEYvLIzqwP50=;
 b=fOTuXiCRXFGEnkGEVeUreDOM+It7ag05Ap2yG37bqbZW/Co7I7Oml1+tP/+futAcDQ
 feJ8cxptT0Ilig6IUXN7ZgVPMfb8t+71shU6dU6c57sOrB0WOep4i3Dw17o5tYEc9O1r
 sRaGf/ohfUdU9Oh9wWeK74rjETkgz/QV2LQGn6CkDhw3aR0J8CEnBHTbsVj+uoCC5cAw
 7GWFqS+Dog+t6aNTDSoPKGkl8Cvx5Tka1GgSZFuegrnmYCU/APBlr1FJ0Z7TvID58wR1
 BrJVOJUWYmIkkpltV40OaHB68zt5zvW3DEARv6rx/IoD2vd5ZQIK/7Dr8n7o+YOZVQiK
 sdow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLJVyN4J6hsN14dDOYjGuguy+XFLrsuzrzF5rXrITZ0y1YSi6g2+tnbB+p6HWnJphBGslZHwnRMQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2y6jfzSYMevnko6cWax1neiW9MQMYv4CYBSPbpgjKQG1vYvtm
 9k5VcTZ6id/mK9772xGwZ/CMO56lpy/RtCXGB/8KpUJ1jsO4TWnIKDvv1YLdqtW9c3w=
X-Gm-Gg: ASbGncvMkc5c2pLaTyGX02I8xmScsO8MZVHhHEVCuokMkTUyzI8X7pxZgc08LHn7OAa
 fI0MrNAxF9avqHbhmdOmeeeGZSkCEOn7FrdYJynWuEHvalaEv+hoQ0sHMfbtgJ9tC7t4RHOonSc
 H8/k5FbZnDajOJlqVJwm16wvRCRWfCL1liJtC17dOBCczoAbjU7013fpcRDuYeJM5ISB2d2dQiM
 yRX7TybPIL14CIXQAVDkHTX49lSm10EY9F1lGRX+Br/a77NPqKZRov7OrSCk/ceBcsmfu1/R+US
 MQHs1xil4oPOGGMQsd23aJifIar4dU7DeD7yn3JopT/uYQX2phLvI7zBV2/VDmPZHD9JijbMhms
 KJRtwJ0zGjpZ325qcFRSmG8CQfNksCJ1Q6F4RTmxJ1pVV04Xzec8z7eZwf7s7I1NJgnKeL3kBFF
 i0naV/6NJu
X-Google-Smtp-Source: AGHT+IFQZCg+j9rYs2aYBlI/Q1NA1vnuBlYKk1ozog9uwEkCMROYvZbO21Ukdei2AxevzD1AQ1HalQ==
X-Received: by 2002:a05:600c:1c03:b0:45b:88ed:95a4 with SMTP id
 5b1f17b1804b1-45b88ed9c98mr99009275e9.26.1756894338501; 
 Wed, 03 Sep 2025 03:12:18 -0700 (PDT)
Received: from [10.223.47.213] (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b96d2a6b3sm38538005e9.10.2025.09.03.03.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 03:12:17 -0700 (PDT)
Message-ID: <8c66b4c7-a5ac-4e01-a226-61e2e0435418@linaro.org>
Date: Wed, 3 Sep 2025 12:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] target/arm: Add arm_destroy_cpreg_list() helper
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-25-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250903100702.16726-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 3/9/25 12:07, Philippe Mathieu-Daudé wrote:
> arm_destroy_cpreg_list() releases ressources allocated by
> arm_init_cpreg_list().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/internals.h | 2 ++
>   target/arm/helper.c    | 8 ++++++++
>   2 files changed, 10 insertions(+)


> +void arm_destroy_cpreg_list(ARMCPU *cpu)
> +{
> +    g_free(cpu->cpreg_indexes);
> +    g_free(cpu->cpreg_values);
> +    g_free(cpu->cpreg_vmstate_indexes);
> +    g_free(cpu->cpreg_vmstate_values);
> +}

Please ignore this patch, it is part of another series related
to arm DeviceUnrealize() implementation.

