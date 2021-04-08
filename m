Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp260540lfr;
        Thu, 8 Apr 2021 02:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaikfUMIDSY5cfUDC2avgYyCipbH3Rk+twWus7mI8xYd8kRD8WWKVRr/cmVKXdzIh/fvTs
X-Received: by 2002:a92:1311:: with SMTP id 17mr5717082ilt.134.1617874529107;
        Thu, 08 Apr 2021 02:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617874529; cv=none;
        d=google.com; s=arc-20160816;
        b=S9ux5Qh62SLMrgDZAc7di4av+kjJOlO8ueKX4ZPY1k5VddbKUXsUNAs8DC77hOJa+c
         d//lCcZdKD0z4zrGI6Hlj0wgcQ2jqV34ig1lr6knJ3kATiHuEKSQVS812oUEPWNQugFQ
         UH4rtLZDO9qeecnuOfx7jD5slnlccLlo9Nrz1SUHAKFOs0jKdTkJBM5e1MsYjPT3eTma
         Lv7dIJ0N+9Cr9fEEzSls6o404epkm4tWIUSGUDBU8EQQad5vyVRsL34w6QaPcGx7gqub
         Kei4cvU5d8WYXcYP7/yPmIic5H3db/KHRegafF+u6Xj0Vzs3Q1jZqE2c8enh5R2tSx7O
         WOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fr384F81qEzKYWkp9qk5hm7AyIcUmksTmvWTPcHgO0=;
        b=Ezw7GzzxnspcSfLAX2yUIw2bsKERzMpUFcb3a/9/227Rmt75COtA3pEqs3J6x7JpCW
         Uc/nMTU3N8sULwEa3EPS0cnbRK4EVAWlOtDq16XYxQdochlab+DqTOBLowm+bBWFT5ZN
         6pODJmkTzBI2tem3a3Z1neEEHXoPYguF1YQZJcCNzPmppX9y6VEr9OZjA4Dz5iZlbADY
         uZNpsN8Ox9dVl3zqNyU3Tnb3LXbpwBvfr7A2gxVsxaxYqfYqTZwuWFFRa1XXA9IRU4SP
         EJATTbtBz5CeaDtfNFAgZgQM2SBiNgFZHDHh0kpyKKWwU69VimCHJAhdStP0FcOmfuBp
         Xh6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YEhDysH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q126si25321828iod.60.2021.04.08.02.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 02:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YEhDysH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUR4R-0004IS-UU
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 05:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUR48-0004Ga-5u
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 05:35:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUR44-00025z-17
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 05:35:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id s15so1586673edd.4
 for <qemu-arm@nongnu.org>; Thu, 08 Apr 2021 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fr384F81qEzKYWkp9qk5hm7AyIcUmksTmvWTPcHgO0=;
 b=YEhDysH1i4QP75ZWTdGRWjHF3n/huONBfBk1gtyx/U37knWsscbT8F0j6kTs8+swix
 p4u6BzXE9lZ9wU06k1vqbHkhgzJLMYCja0XX/k1IZyCM55NRFFPb2+uvQW+Pak824sZh
 +tAdq462uqOehswddqHTaaSNGV2jkwHzl5lORZ2HsmqaK4a+Z0buntRpov9Y1ElVgjKA
 fKilkYVua2fHPe88al5DUxeDyu9vjrpHsotIFRmovJ/ulb0WI079ogMIwD9AIoUI4r7m
 L2gT2FWfbR5dheNlhppvU5RMRWOWvE1JVx6vNQ7AsYUHMl68pT2xdnwCW4xxZeIX5MRM
 O8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fr384F81qEzKYWkp9qk5hm7AyIcUmksTmvWTPcHgO0=;
 b=QyBGhHPDBF2FKW9niHvRQwADc1bXWt7fI6IQC767ICoqycGcBzJhLLSuCXg4Sc3VNa
 531oGzHyPKp5/vuLCA4SICsyh0lQwC66bzd293NYV41UcuF+HTI9aefrMbOXf+GrSKQf
 FErRAJ/5pJGmRf9RCOOFVcjWsrMzL25mz/uB+PxU4XydmbhQDKNBksQUxlzD1pWzZ07f
 a8fcTOvvqL1HHznWb3F/3/+RssJHMF876FJMxIQuWzZH13f7KtB1m68ioPXgz7kBUBTI
 Tp1lQD6KVp/CwO+SU5Xc+Tae1sQX1GSLOdT4jE7Lq2wBMAncnV0v8EYXcV8+0w+/Zc4S
 ALGQ==
X-Gm-Message-State: AOAM533OQeZsUi2xqNspH/zGR4dsW9KDf9B8JDKG5qKc0egtuDm0ncP7
 s+Awy/jCvvfGXvV9o8soMXeG5wnyaTLXzX3o7wu9SQ==
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr10186765edd.146.1617874502688; 
 Thu, 08 Apr 2021 02:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210402084731.93-1-yuzenghui@huawei.com>
In-Reply-To: <20210402084731.93-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 09:34:22 +0000
Message-ID: <CAFEAcA9Bisg-2u9Pc1vqUY6F5rUEQTd-sEgy_a5DiLoMAy=5+A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wRRFI7/uc3CW

On Fri, 2 Apr 2021 at 09:48, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> The GSIV values in SMMUv3 IORT node are not correct as they don't match
> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> our emulated vSMMU.
>
> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5a2b2d4cb..60fe2e65a7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -292,8 +292,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
>          smmu->event_gsiv = cpu_to_le32(irq);
>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
> -        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> -        smmu->sync_gsiv = cpu_to_le32(irq + 3);
> +        smmu->sync_gsiv = cpu_to_le32(irq + 2);
> +        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
>
>          /* Identity RID mapping covering the whole input RID range */
>          idmap = &smmu->id_mapping_array[0];
> --



Applied to target-arm.next, thanks.

-- PMM
