Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB7BCAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:30:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWeO-0004Qz-Bl; Tue, 16 Sep 2025 10:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyWe8-0004JE-7h
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:27:06 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyWe4-0000cU-KE
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:27:03 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d603a9cfaso42376797b3.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032819; x=1758637619; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f5NTFvTvdEWFz6gMq4vZse7LbJZfRnMeEMYbB5xmSv4=;
 b=ITYB8AlChGg7Ke7Qcb6itwJwh7JtU1rUQ2rETMUe8C1WIblVfBiiXXFMH+9ttCcwrK
 1IkAAWazwnlYBKzUCtHpVGr28/oTvVK5Yfvfo7lgnv5+KT2VDNcZwlF19r6q//G48xUB
 ben+ZdNTQrjBvUxjEeTSOMOTcSP0h/FdVfxO9f+K5blZxiLuTooY1u5NLkpTpnw/Qydz
 6nuvfVoP+rQUm7dehEOba+eJOmWczKHO7njuk1KXjGvGCAK8m+j4b/jga8OVK1azocwX
 xO9zXX0xtdJpp6ExmZIQEl/Wai4W4XL73jXc+TjR8+ww9+/SxzpuJzJPgLzaQXp6nKKD
 zlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032819; x=1758637619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5NTFvTvdEWFz6gMq4vZse7LbJZfRnMeEMYbB5xmSv4=;
 b=PgoADDhU9NZ2SX36BZ1BxoOPh0yfG4iKDr99JBBUWNoLhwYfbiXEoxYCivCjSJcc13
 BHrfCqehKaE81bYvOFK0jHZ8VGD8F7VF0WL7zsEmBsQ78e8rBlNNHl/iR+IyYxQ0ZSgA
 mWsP2zAAL1lrHKPL7Jba/8KxmTEU8OAI8U40lMGll0u3SSNTzKES2i0pU+jvKiRZsyub
 hLIxRnVO8QcKWvqkD6gDQ1pAz8gTri/DiOkKZyvo9vx8vj60LUObSfAeXMVF/AFgy37D
 C+YNC3oQM3VByR4KEzVvSXv0ea1ONs1y/7FgUUgni7oOAHsqpcS4EhYS2dxucdggqpI7
 D4JQ==
X-Gm-Message-State: AOJu0YzNtP8LEYRmY2/4o6zCCQJy78Dzs97FvrOypCn2MWM2H7wrbajx
 TNUaILKo5BW+VzblPcqzYslWILYvDk3nba0NqBDK2cg8VnXyHrzmh41QitNqdYk/lk254DgdEI8
 RnXtE8qRPXTw231jlYwlxoXOoxfUNoX+Bx351dA0jEw==
X-Gm-Gg: ASbGncvPSWzfcDQc0uxYyqP43nS62aZHH8YCMs36dxVtz4Skkntmn/qGZrKCrT8fPuF
 WAK4SQCFm31jqO8K3s4NSdAa/I4m3ca8ztPvMu5dA3/tyk8mI5j4oXmfvJcFtSNH2A534fC2L/b
 vPnvkrH+riISZDrASANniJPUo+LaiPJ2oIl00y4Id507UnyBAPmiz9mV5hi2Gc8QMoEugSclo+h
 5YuRTSa
X-Google-Smtp-Source: AGHT+IGerC8EME3mXadiu4JV2tTjvfaHaeXq9OJp+VPoJ5fsSew1BPYK2Tw7Cvh2gzAVJ8ZQyeJIASfzalrXCAwzRFg=
X-Received: by 2002:a05:690c:4910:b0:729:df2d:4a23 with SMTP id
 00721157ae682-730645328a8mr141929777b3.32.1758032818730; Tue, 16 Sep 2025
 07:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250829082543.7680-1-skolothumtho@nvidia.com>
In-Reply-To: <20250829082543.7680-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Sep 2025 15:26:47 +0100
X-Gm-Features: Ac12FXyaq6wFA0RgKc7vV3aJBtyo9LKG2sKQ6nnJ1y9h9O1wvBx1sO4XbWRXNJU
Message-ID: <CAFEAcA_7aA8tV_hRzn=3Wi8LZnxaRrYA1DwPxt1MbmVgQKh6Rg@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] hw/arm/virt: Add support for user creatable
 SMMUv3 device
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com, 
 imammedo@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com, 
 zhangfei.gao@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 29 Aug 2025 at 09:28, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Hi,
>
> Changes from v8:
> https://lore.kernel.org/qemu-devel/20250711084749.18300-1-shameerali.kolothum.thodi@huawei.com/
>
> 1.Dropped previous patch #1 as that one is now already in.
> 2.Rebased and updated DSDT in patch #11 to make bios table tests happy.
>   The DSDT has changed since Eric's PCI hotplug series work.
> 3.Added T-by tags from Nicolin. Thanks!.
>
> I think this is in a good shape now. Please take a look.

Hi; I've applied this version to target-arm.next. Thanks
for this work, and also to everybody who has helped out with
code review and testing on the series.

>  hw/arm/smmu-common.c                          |  37 +++-
>  hw/arm/smmuv3.c                               |   2 +
>  hw/arm/virt-acpi-build.c                      | 201 ++++++++++++++----
>  hw/arm/virt.c                                 | 111 +++++++---
>  hw/core/sysbus-fdt.c                          |   3 +
>  hw/pci-bridge/pci_expander_bridge.c           |   1 -
>  hw/pci/pci.c                                  |  31 +++
>  include/hw/arm/smmu-common.h                  |   1 +
>  include/hw/arm/virt.h                         |   1 +
>  include/hw/pci/pci.h                          |   2 +
>  include/hw/pci/pci_bridge.h                   |   1 +
>  include/hw/pci/pci_bus.h                      |   1 +
>  qemu-options.hx                               |   7 +
>  tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev  | Bin 0 -> 10230 bytes
>  .../data/acpi/aarch64/virt/DSDT.smmuv3-legacy | Bin 0 -> 10230 bytes
>  tests/data/acpi/aarch64/virt/IORT.smmuv3-dev  | Bin 0 -> 364 bytes
>  .../data/acpi/aarch64/virt/IORT.smmuv3-legacy | Bin 0 -> 276 bytes
>  tests/qtest/bios-tables-test.c                |  86 ++++++++

Could I ask you to write a followup documentation patch which
adds something to docs/system/arm/virt.rst to describe the
new functionality and give an example of how to use it?

thanks
-- PMM

