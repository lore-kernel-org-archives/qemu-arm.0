Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1360934ejv;
        Thu, 28 Mar 2024 12:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRmsbsHOiWCQouYRDu+wd0xCaVezz4bnPsmcsp9cyqJS1JP4YOgKQb6sxVzHSv0Gt0qRZHqbFviad7+RY89AQs8pWkcWYQ
X-Google-Smtp-Source: AGHT+IHo4vLyUUJkfqzsOXw/lAckAsqBusMDw15ozHmpTqXtqRc9XI1wVKd6wLIKWeKHmrsWn08X
X-Received: by 2002:a05:6830:441e:b0:6e6:ebee:265d with SMTP id q30-20020a056830441e00b006e6ebee265dmr209794otv.32.1711654061223;
        Thu, 28 Mar 2024 12:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711654061; cv=none;
        d=google.com; s=arc-20160816;
        b=EbOvMCJ6T9yZYjMar6Bku16zKVrIQ7FUGZeG48vtt+VKENKnWyD69axr4qdJSaXy/J
         xeXYkOE9OFm0txVLT83TltaUgZyJI9m0qWOC+YDqG6Kgvgz1tNN85C3aIacsL9mfZ50U
         /A5S7ROaKZMO4W9f8T33MRFWP0lGITZk5ORpyZn6kY70WyWZopurTRDqG13r2XGsi++b
         MjVF9zJ+A5+KRGH9U9q/GJfVzeEwAr07wyoi/GFJ87CCQzN0KEMerYaL+nxWFsk9DEMI
         OYBYRAr83C8B72Izd5Gssg1imqVGJ5Kpuqx4DhDqN5X/0rJjIPCINmOpbtKKREE4dH8F
         3mKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rZS9XFyOQG2i8hCRjoB5xys4mRT4xfclOc6vBgM/M/Q=;
        fh=+9IP2BBlDi5wPXHK8kct7/z5VUNR6osxl0Cy1C/LDuQ=;
        b=dj9/7vfbCMhuxvWejJXyJxQfRWfriO9vxYeVjSEbSm41LOI8TS1FzS6joCMu2r/4yu
         JVIWXsrG5QCfL2JSKSIzm37H+nFh/K4urqcaAZzU/Duqe4nUGwOvajQwEsOdtdfZugLW
         53FI6ZSxYOcw5+T+BvE2HOFdWq7jFfwataGYkKViu5wW3uNz8OZTF+BLQ/fsFUQbmHF0
         J8Aa/MLen1/It2zo9FY3KTmjnYw/woU01v9KrZtCSmkMGZqJXy+DBL36kFMhxUeStUiw
         hRA3qO+up/DkMCTGglZzqvpVhbbLaneU5e7Zouh3AhOHH9COSteDMi5ay4LCs+YFx6XU
         HaLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gMYmi83M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa5-20020a05620a830500b0078a2d18e2f7si1998394qkn.776.2024.03.28.12.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 12:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gMYmi83M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpvPL-0004ty-Ks; Thu, 28 Mar 2024 15:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpvPJ-0004sE-GV
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 15:27:25 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpvPH-00021X-Sc
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 15:27:25 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56bc8cfc19fso1573551a12.1
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711654042; x=1712258842; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rZS9XFyOQG2i8hCRjoB5xys4mRT4xfclOc6vBgM/M/Q=;
 b=gMYmi83MCR3YA5gsk+Px+t2a4xS1DuPMj6ZBWoOiabJlaRGeMSxGQluEdQwm7sP4+o
 T88KeheWg8HH0n2mrfxEmDeTwzy6olKsBRU/MmGDXZg6gUloaPUNHt5mT2ehKoyLYrti
 0ZEcNzv+wV8t3IPjdLXmVU1/AhbM6dZIHyBefNx4Ttpvz8DuFaJdPuJgTIpwVBhPKvm6
 TOYgW3ytChX8gLFHNsTbICAER9TZRz+CLM4LVSdB/L94mRh4pgGBtPypSbtxv1cJQ183
 TiGMDqUnsElPKSags3lnxoUAi2jbjIlgr8u/jbRVXPNQcKmkyFauiaIA7grotDGye4yt
 dvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711654042; x=1712258842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZS9XFyOQG2i8hCRjoB5xys4mRT4xfclOc6vBgM/M/Q=;
 b=vvWYz08cgBIzSwcDF9nKLV55TFpXEhNwC/G+KmUeRskllkb1W8u7ZmAx8Bkj1X9cl7
 wYinQffh/cgI7YWc1o2MrXLRBP52if5YaGt8s8YIlcb4qIiEZhgg+8I1D4ZO16Q8jYGr
 x2bsA8vozOiHtGq2IO5EuY5av+7snAEAdN4BrmAYPgqoVNaMONKcX7SVU+uUWa8JxsA9
 cnW2lgmagiYsCdIbBwvT22kaVYXf7UXBroY/20cMDLq2PmZFo45rWSIVZphEudNaNERj
 RbhdgtfFkOTbBJACdEcXGC+MqzyEYkw/yzfZlncTBWOs1jH1RTlZP9aQBLJrT+6OUJ0A
 pHJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCnWwcOOYA/g/qtur19+PWYYvHgt3jmBUfG37XukTmK+LKJ/TX2iJxFlRB9Hv0X6hXSFjlGN8RohcVtgGf6oghTSCU
X-Gm-Message-State: AOJu0YwLFqyrbsD+tXFD1gS5IYINwNgUAgynPtJhS1BbtQB8p+jaSrv+
 tM/J5ceXAXnO3MpTgXvDqGEyYCatbcrN7Q1dKA3J2OpI5MYFcVb1mNN13lbx/w/IUHHhh9fcRo1
 ry6SG/dGYa3oo9Iz/8ze15JFLydjuUHviAIL3sw==
X-Received: by 2002:a50:9b01:0:b0:56b:d9b0:f1c3 with SMTP id
 o1-20020a509b01000000b0056bd9b0f1c3mr142023edi.39.1711654041959; Thu, 28 Mar
 2024 12:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
 <20240325084854.3010562-19-ruanjinjie@huawei.com>
In-Reply-To: <20240325084854.3010562-19-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 19:27:10 +0000
Message-ID: <CAFEAcA80e7j+euG9Fqtx5j-BnGMoK-bGoPrfFqfokJQE-kCcUA@mail.gmail.com>
Subject: Re: [PATCH v10 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read() for
 icc_nmiar1_read()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hMtQurD9/7RA

On Mon, 25 Mar 2024 at 08:52, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Implement icv_nmiar1_read() for icc_nmiar1_read(), so add definition for
> ICH_LR_EL2.NMI and ICH_AP1R_EL2.NMI bit.
>
> If FEAT_GICv3_NMI is supported, ich_ap_write() should consider ICV_AP1R_EL1.NMI
> bit. In icv_activate_irq() and icv_eoir_write(), the ICV_AP1R_EL1.NMI bit
> should be set or clear according to the Non-maskable property. And the RPR
> priority should also update the NMI bit according to the APR priority NMI bit.
>
> By the way, add gicv3_icv_nmiar1_read trace event.
>
> If the hpp irq is a NMI, the icv iar read should return 1022 and trap for
> NMI again
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v10:
> - Rename ICH_AP1R_EL2_NMI to ICV_AP1R_EL1_NMI.
> - Add ICV_RPR_EL1_NMI definition.
> - Set ICV_RPR_EL1.NMI according to the ICV_AP1R<n>_EL1.NMI in
>   ich_highest_active_virt_prio().
> v9:
> - Correct the INTID_NMI logic.
> v8:
> - Fix an unexpected interrupt bug when sending VNMI by running qemu VM.
> v7:
> - Add Reviewed-by.
> v6:
> - Implement icv_nmiar1_read().
> ---
>  hw/intc/arm_gicv3_cpuif.c | 79 +++++++++++++++++++++++++++++++++------
>  hw/intc/gicv3_internal.h  |  4 ++
>  hw/intc/trace-events      |  1 +
>  3 files changed, 73 insertions(+), 11 deletions(-)

I haven't done a full review of this yet, but it looks like some of
the parts that applied to physical interrupts apply here too, eg
 * don't do the RPR NMI bit handling in ich_highest_active_virt_prio(),
   deal with NMI in the callers
 * in the AP registers, set either NMI or a group-priority bit, not both
 * AP NMI bits are only in the 0 reg, so checking doesn't need to be
   inside the for loop

You'll also need to update hppvi_index() so it accounts for NMIs
when it's finding the highest priority interrupt in the list registers:
compare the HighestPriorityVirtualInterrupt() pseudocode function.

thanks
-- PMM
