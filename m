Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E621CD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 08:09:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLGHP-0001Ox-Hm; Fri, 08 May 2026 04:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLGHH-0001MV-IU
 for qemu-arm@nongnu.org; Fri, 08 May 2026 04:09:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLGHG-0002Ad-2m
 for qemu-arm@nongnu.org; Fri, 08 May 2026 04:09:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488b150559bso13069125e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 01:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778227780; x=1778832580; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1dV9Y/qSk9e1KFInLEL4RRVmF2JhLPqCaIOcrjlh/Mc=;
 b=QO3+j5EPpoKbP42ZEsDpohIv9xJXnf1qjAFw6az28zWcx64jnF5FrPu7AKyoZyhvPe
 N+Wr8qi/5cH2gjesFaOm0yoFnWHt8HLHlfv7qXbnvSw8Aazn1l5tr9d1ewb8x9K/L3Og
 mB/60erzV3bkCK6e4fQjbXru/u1n7UIPIMhr31zwAcynxjxqngp5ujGcGi/CAyUt9O9U
 vivL0gCnUCZwU0nc5BhB+3y6BMMhOuITS/Y1xD3Hl4CAJlnCZGqRI3DOPBjKVrNPRfko
 LP2aDnsgiVTtE/bMJS+0v30jhRpgBtJCsTXAe6gulTFzH3rv1dquu6ZWxQCTYeH/X/EE
 VW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227780; x=1778832580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dV9Y/qSk9e1KFInLEL4RRVmF2JhLPqCaIOcrjlh/Mc=;
 b=MCn5t1yvhNWlWcignjz9cDbfI8gQ/hfbXE5kJf/MJqqhZ19vKA9w/GyYQnjdFYVam8
 ZJv6UwNtBEXX9L4MY9yqgm/Ii+ZqZqNIC1WeeWR9/qVogizCOLg9/+cNDPXQoyilI76Z
 Qx0yRwyJopnYMKt6siZDwmRxBLe5MuQivONwdLTup7rV7oqh2M/mWxz+I7u7dfbIQaOu
 bq7hhiv5tvGshFyZ+57WFhCj5gsPrcY2nlFJF3s0qYVkkpzBLZN1ViqNsA6FmvqDITjs
 GSiDLq9cQzL8S/JHGqLSLMdohCdO2glbc6K9/neMLDfaBxGDSuGaixo32s7m5Yqz7Ob8
 K3TA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8strvaotlHkrcHahXth/TExkNaFu3yMbbpGVSUpTZ9ZsmNIADVw58ZRmfyBsY1Nu+5L8KQVAeanw==@nongnu.org
X-Gm-Message-State: AOJu0YzEBdIwwxqoca7c6WQwKHmpispxSmiy4QeY0auzXD2fBzF3juCx
 b4xDB1Zip8aFuVmMx+UPKr1zmfCBgdcfwDBBXhFJ5h/SEIoABH4tFT0kXCvS9ltAUG0=
X-Gm-Gg: AeBDiesGF8fJ9qRh1Ehsl+AMWiPuu3eB9c1pD0jXB92fJQVlQEH1SuQSR0XDIMW1f3S
 Nv6x5B/FKhGDeZ+VVbnzzVgTwlmzN6z5YL4hLxMkigDcdZuv7xNbVZBp6p+WEMimbdSA8NQJU31
 rBqovd6K+ASZ1HiAZAbC3O2ARO22Qpjgj0LU60IxFORoTGm4dc9vj875P+Xs8F3HQTj/qfCHuMY
 QC/cXZSymA+Ml6K0UiPco8knkGdD4kfgOB+mm+ZwN/pMTcWAtw9+c5p0Noyzs0fKht5SXuxODgF
 J7S0FJQcZMBb4GRSeuc1RPikPVe5cZw5uIWuAjxRpsmVR6MylKzN/KgDjsLpkTvjJTdiKwmYYQu
 TmruKFrjlPWuDszIfHCVrDW0mjR+vFbiU336gsLhXcMkIXuodyy1Zchv8w27sdqbzkNaDeH0emK
 bXeTmlgiL3mq5tKKuGbAyzfUXNOGnbQqKL0h5dYX0nQqKCK0/TlaITdKxrwtqcZNnH+5yItmzhQ
 4WzZLgiBnloJQ==
X-Received: by 2002:a05:600c:871b:b0:483:709e:f238 with SMTP id
 5b1f17b1804b1-48e51f4652fmr187013875e9.29.1778227780445; 
 Fri, 08 May 2026 01:09:40 -0700 (PDT)
Received: from [192.168.0.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68ed0f29sm35247795e9.2.2026.05.08.01.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 01:09:39 -0700 (PDT)
Message-ID: <62ae7f9a-bd76-4748-ad35-646959eb2b24@linaro.org>
Date: Fri, 8 May 2026 10:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tests/functional/test_kvm.py: Skip if virtualization
 not supported
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260507194728.2034696-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 7/5/26 21:47, Peter Maydell wrote:
> The test_kvm test runs the virt board with virtualization=on,
> which will fail if run with an accelerator that doesn't
> support nested virtualization. Catch the VMLaunchFailure
> exception and skip the test if startup failed because
> the accelerator can't support virtualization.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/test_kvm.py | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

