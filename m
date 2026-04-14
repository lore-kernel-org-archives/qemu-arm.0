Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A65F9D0C9
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 11:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCcKc-0004q7-Bf; Tue, 14 Apr 2026 07:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCcKa-0004pm-ND
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 07:53:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCcKZ-000245-3a
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 07:53:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso58117945e9.2
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776167601; x=1776772401; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lotglqzmbs5ymAURJXXG/BqxY5lLuAk0pIEkLHGrelE=;
 b=QuD/U78Q80aCnVyUiqY0gTZmr805woMMmf9/RA9ZF25Irmt+X9y8sJLnAwNuSTdjty
 LhyO00Xx0dvsJ1u8Bg5CFPXAcvt/IWVnpTqZhZShkhowoMaFCh8355ZcZdQ2UdiYe2wU
 zHpXKAluWpIYVRwXdtLjG7vZ+CmmaywXbKp/3s8foQj1RTXUEUQ1U8wPALjr2IANTqHS
 z/8BK1bFh0BnogH0rXWfEfXcoPqjKSuJmh0MGejYnzJE99r4HuwxQ61KqgOY0/uGL1vU
 rzZvoUXRQdXqlJhT/dIuW6YEx7Cx1Zh65atQ87oxembh9iDGm/f9B+b7RraYVIwY72z4
 YDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776167601; x=1776772401;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lotglqzmbs5ymAURJXXG/BqxY5lLuAk0pIEkLHGrelE=;
 b=R6jfwblFGEwRVcCY7BIOXDb4peSjh3uQrOx8AF3UhVmJaV91Tr7mAO0cCyCXAnmb29
 Rn4q3Jrk/VfqgL2y6My2VCIpVNGU8MI7UhnWilBdAmEcrfmeHt387yOCZOZt+Apx1doA
 WRJvYfdtrrPLbX6990lfsHn0rcpIcvpvIaa1Hj55h4IiunnKn6smyyf1j7xxOtH39ez7
 rR6ng9sN3FmoDSj0B7Fk9qR/8bW1UlzHAlI/VBBiyncTNytXf+0JUbR844ieW4gmvlY/
 IvYHEeWEHYzDVExhICMt5kRpyIpvXmW3faGf4wydRqXBflROpdgK69dF0RyLglNr9OJ1
 dsLg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pLkmciHixHYTrJ5sR0a6SF4VBdV6Ny7ImWHQgRjTgCJWcM6fBgluB8TjzRq/hN/NKR7Gr0kjlOg==@nongnu.org
X-Gm-Message-State: AOJu0YzscB/WqhP+2ta0JLTI6R5RRwIrktSMwGncyfNk6jit9XqZCQ8L
 Q9kpd+81ShUZ6U3sEUUktI9+ngQ8MLpBTedVssRP2ZmxOMxVOU6z9zs0i9d+AcG5Qy0=
X-Gm-Gg: AeBDievi5tknFiaJxGaJDQN5Go/nZNvD9PRQ2U6N9K5PuFEwqxUErd2pJyvfo9GHjM8
 BQouexmpEftInKAeKJn7N/Vq0KfN6XYeKOIS9qQYMes76gCtPNE93QFWuNIuyrfdHxeX+KEx5aJ
 NN5hLNo0Mf36vWkXtjeAxwlTMgTQLHVzIiBRiW0PccsVQ8u87lPn1FaIGMDskzemZG+M8MVjX2a
 podywovbXFXndIlnMQofJyoqmr6oKvBJWn6OiAyuZxo2ZVZ1LdU23d9mL/WzmrLNMEoc39AxN8M
 2bsxoBl0tyd5UMIhtoErTIjZ1+ogQFyNNzBKSqa69nQ6pQZiM4NRhabU1+UupQZLwj+hfGzx9bF
 lWyWTMrt39cdsegmSv+EBDHfC387hvWUT0lUN+QOzeTZ6JPL8gF0CEah6dt0tMDB21PUV3nly3a
 lR9q20eA2LcnkMDh/iJDo14SSsSsVSKmeenY9eENke9JEFLx3qSXV0bjw/GgDUSmtCow==
X-Received: by 2002:a05:600c:450a:b0:488:a882:b7 with SMTP id
 5b1f17b1804b1-488d6ad17e6mr223922915e9.29.1776167601158; 
 Tue, 14 Apr 2026 04:53:21 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ee018b34sm47048365e9.13.2026.04.14.04.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 04:53:19 -0700 (PDT)
Message-ID: <77ee7af1-5dcd-48b5-9343-ad540b129a11@linaro.org>
Date: Tue, 14 Apr 2026 13:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/65] hw/intc/arm_gicv5: Create and validate QOM
 properties
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260327111700.795099-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 27/3/26 12:16, Peter Maydell wrote:
> Add code to the GICv5 skeleton which creates the QOM properties which
> the board or SoC can use to configure the GIC, and the validation
> code to check they are in range.  Generally these correspond to
> fields in the IRS ID registers, and the properties are named
> correspondingly.
> 
> Notable here is that unlike the GICv3 (which assumes its connected
> CPUs are the system's CPUs starting from 0), we define a QOM array
> property which is an array of pointers to the CPUs, and a QOM array
> property which is an array of integers telling the GIC what the
> IAFFID (interrupt affinity ID) for each CPU is; so a board or SoC
> which wants to connect multiple CPUs to this GICv5 would do something
> like:
> 
>      QList *cpulist = qlist_new(), *iaffidlist = qlist_new();
> 
>      for (int i = 0; i < ms->smp.cpus; i++) {
>          qlist_append_link(cpulist, OBJECT(qemu_get_cpu(i)));
>          qlist_append_int(iaffidlist, i);
>      }
>      qdev_prop_set_array(vms->gic, "cpus", cpulist);
>      qdev_prop_set_array(vms->gic, "cpu-iaffids", iaffidlist);
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/intc/arm_gicv5_common.c         | 80 ++++++++++++++++++++++++++++++
>   hw/intc/trace-events               |  3 ++
>   include/hw/intc/arm_gicv5_common.h | 25 ++++++++++
>   3 files changed, 108 insertions(+)


> +static void gicv5_common_realize(DeviceState *dev, Error **errp)
> +{
> +    GICv5Common *cs = ARM_GICV5_COMMON(dev);
> +
> +    if (cs->num_cpus == 0) {
> +        error_setg(errp, "The cpus array property must have at least one CPU");
> +        return;
> +    }
> +    if (cs->num_cpus >= (1 << 16)) {
> +        /* We'll hit other QEMU limits long before this one :-) */

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


