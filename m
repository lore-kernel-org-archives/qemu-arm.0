Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F3CCD185
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 19:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8Noz-0001Zd-UG; Mon, 13 Oct 2025 15:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8Nox-0001ZO-CT
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 15:02:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8Nov-0008VL-Io
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 15:02:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so26688905e9.1
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760382175; x=1760986975; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wKJtvVBeUpceoS4GGuZ7Rw36+X8tmV8xTrk3JT9ph9A=;
 b=mkhe/hsMASChTgsnqlAEObyaVa/8C3VEGdrY/Qj7H8Ceoc0Qud7Ev0EA9D7jp9wWuM
 mJbfZQ+v62VFhwbBxWviAe/rygBvzVOK7PmvRHv2500aV4+B4iX0v7vqmee7vWUEqkYS
 WbLbctLJWcH1L02RXGvV7ui0Hx4Ewcfz3BnCPhAlHm8e8qjmK9Go1Tx0jHej3D6a8vk8
 K61Enwddhl8Y/MhgCiqtPrYN5H9c1DPR/G2q8KE/IxUDnVqyBGl24R809u/6QPxf8Fl8
 ysbQD02zBrrwBHQKfz1OcJcZazpORzbEsEU7WaEwtWpbwwTYBKWwkeaAhvPCuy0EUpEh
 Nw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760382175; x=1760986975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wKJtvVBeUpceoS4GGuZ7Rw36+X8tmV8xTrk3JT9ph9A=;
 b=o5SOdpGx1yC/DPrY00HARuIjMtP6wtkjLvOMz1OZjQjH6tfAXkphZgS+Yd1TNioZsb
 SgW4hW3olmq2QscS8isUTzcfGwYmWbvuwkkZQ06pkFORlniYvJMvineX9TQ9f/E9yMAW
 qveTocH9PGXtqwCzRfKW44B4Z55Odlmf93GMvakTkTX+ZslO/P05e33Td4bKeMVQ5ZBv
 sntQPjgWNfENLlrmO93JSbMAMtneZPFYjqvNTxAfPYTfMHsdhM7+BInYK1+sSvs05uFm
 uZn+ugvpEihp6QyiP2MPDE9+MCLR/wPtPMZfRr+xzNwYoAzEoaHZV1Qzmbqpim1dkvIt
 3yiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLqGkFcSkZfBQRAtH1Zlp7ck/WA+TqFQfwtABOd9yENT0cl4i9fRVsBTX/qFMioybCzDTBz9y9kA==@nongnu.org
X-Gm-Message-State: AOJu0YyE6tdcwMlm4Y3z/sww9DpD/mKLy7pUCKvqG5qG1YHJDvSBzBnF
 xj8nw36U3QLf2RVF4OoEHzRGXzIW+RDIPrSBQAm1k59vDQVfW2A43A+5JoIr/IiNW0s=
X-Gm-Gg: ASbGncv1pdVMdF9sfTcHfTfbrne5XCS8wXJK0UfKO3JLmtcodCF3fvPVDzdvrU31FP0
 l/ewF0vLuhbKEsOehkXua4+jMlZ/4wBRzzy5GDemHjyoIaGsSQTkOBEWzD8UfbP1Gp5JhXDcNVA
 V2e7xYXK/kLERLq/xjoNuLgz6mmJsl5g1+stgkfpWMyQb0UBsb1pcLcbgCjlXDvosUcxHP0gOm2
 wdVhaWTMM7mMUoXm9AO3VH9ZUDWm1F2ZvEHamGIhv5PafjlL3aSI5wBYE5LkrSDXtnjcKYOExqD
 Q+lRHCU8u7KSpKVZAwJugpIOH8dbH02OlK2+0JeQ6wOlPaNUtAee+IdqjZfWvJ8g9EjbkeTnpnw
 waidGUCKmw+ZKeiCjXB0uSYC93zo3tWJUBR5bJT2Gk1+9G/otunQ7Y1s4Fj6eFdGULdEPVEDvYd
 cyV196QvEJHMfBMKO4974zQX4=
X-Google-Smtp-Source: AGHT+IHH11zCSmmv2HyW/zq6ZrYND0/s/6qw5dDtxk0RD0xvF0e4++DMwcu0QSFIdAFGYjRcpGdTJA==
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr127987755e9.3.1760382175311; 
 Mon, 13 Oct 2025 12:02:55 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce589a21sm20144116f8f.23.2025.10.13.12.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 12:02:54 -0700 (PDT)
Message-ID: <d3e9d489-eb54-4540-9752-f691f6481c40@linaro.org>
Date: Mon, 13 Oct 2025 21:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/4] hw: vmapple: include missing headers
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Alexander Graf <agraf@csgraf.de>, Phil Dennis-Jordan <phil@philjordan.eu>
References: <20251007203153.30136-1-mohamed@unpredictable.fr>
 <20251007203153.30136-2-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251007203153.30136-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 7/10/25 22:31, Mohamed Mediouni wrote:
> Disablement by default led to:
> 
> ../hw/vmapple/vmapple.c:276:39: error: use of undeclared identifier 'GTIMER_VIRT'
>    276 |         qdev_connect_gpio_out(cpudev, GTIMER_VIRT,
>        |                                       ^
> ../hw/vmapple/vmapple.c:479:54: error: use of undeclared identifier 'QEMU_PSCI_CONDUIT_HVC'
>    479 |         object_property_set_int(cpu, "psci-conduit", QEMU_PSCI_CONDUIT_HVC,
>        |                                                      ^
> ../hw/vmapple/vmapple.c:556:13: error: call to undeclared function 'arm_build_mp_affinity'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    556 |             arm_build_mp_affinity(n, GICV3_TARGETLIST_BITS);
>        |             ^
> 3 errors generated.
> 
> pretty quickly.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/vmapple/vmapple.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/vmapple/vmapple.c b/hw/vmapple/vmapple.c
> index 16e6110b68..5928df4411 100644
> --- a/hw/vmapple/vmapple.c
> +++ b/hw/vmapple/vmapple.c
> @@ -51,6 +51,8 @@
>   #include "system/reset.h"
>   #include "system/runstate.h"
>   #include "system/system.h"
> +#include "gtimer.h"
> +#include "cpu.h"

Queued using instead:

#include "target/arm/gtimer.h"
#include "target/arm/cpu.h"

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


