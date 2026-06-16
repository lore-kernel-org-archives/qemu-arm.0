Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C78CD98E4
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZZE5-0004i8-G4; Tue, 16 Jun 2026 15:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZZB3-0000yQ-Px
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 15:10:28 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZZB1-0002YJ-5s
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 15:10:25 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-662bb4dc1d6so1113121d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 12:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781637022; cv=none;
 d=google.com; s=arc-20240605;
 b=VPkR6FJjKIjbvhFmwpr+rIuvqHUC85DKWkjeRJZdZ7PPQ0NC0vFcU3N6Rph4QMam1I
 Ys2H8yBy27GdNcY4yFuzC/l/41TjwPyAexov8C3GHDimtjBRZj3TCo1FyX79lENaNjXI
 USX2ygWVmYqVPCyVfZsDu+jTJtZkP76NHB/LW4/5vRAqncEcD6uaqTIRfXWydgW5ufNJ
 uXE9z34cIYcX5PKZvszdk99m5F9MHFy/DpjtaHb3Q2xQc/q5wpgQcMy1+9DbaJCkjEC8
 Vn331Ce6grBS89jatah9AmZacFEihKfrUCIhXLTIM8JmKJBk86ifUOAFp7Dagd6ZB560
 x9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zt1u5yo8KpsvoBi6Lkm6pYSEdByUzcnyDFZX+BWoIDc=;
 fh=w7YHcfwwLpPx3JHe3u54lsUq64D7Fce+mHfUj+bYnuA=;
 b=Q9x96IsG9bqJlBls+l/CJVvcjv9G7kziIUmFPaQud7pfihhEDzm7oXR/apwZRO5kTA
 tIA0VeGyc+1rDT8AS2X0KqSZBEdgw6DmJVfgbTAuoj9CWOosphpAjiUJhmH6A/l3N3Xn
 9hNe6UIzK6rmqK42WEH9JBy76bfU05ra9fJ3uewyZ0R0wHD9Vb30oN6wCj8LOw4PJ7gm
 erDAbtLEbuWZMTNMsRHAvtldn+Ei+AA21Yfbk9ci11VlxKqLJb5rYZKv48Mmoh1PcAQ8
 6DItk0lbXNd0lrY1fwVIMHNFrDUAIPBgs0GeDfzMHB7s0LV/HGfgQdk1GfuxLVSzFdBD
 af5w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781637022; x=1782241822; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zt1u5yo8KpsvoBi6Lkm6pYSEdByUzcnyDFZX+BWoIDc=;
 b=xfzneVOYT0zH3TLhFInng2uN8B+JYDna+a+LM7ltR5SJSxA3kiERKJfCjvOH0ILqo1
 OCHxfTbjbZQQr69om8griJwJMJHOjK8XJ8A5Ka2/0XfGWCscvuX5JE7rdL8hArX/k9Vx
 f0VBmNumqPAeejrIjWuUqh00JGyczFOfdDpo8a3TcYu6ZiT3ZbMn+2VoWOATUpTXG+i6
 KYhbdcjX6w0VWJyAJLMwyPvpV2rAbDg/jHGq/kgCULca6WpO8iAu1A+IghLUkPbef2o0
 RRlfZYDl8f8m4jW1/stBaxBRU00gleKlYuj0Nw/J57APhg8/HZ0X3j8SUPkZgB25l0lY
 Y4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781637022; x=1782241822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zt1u5yo8KpsvoBi6Lkm6pYSEdByUzcnyDFZX+BWoIDc=;
 b=aYKQmiXTEcYINyM0Rp78ab+EH+b6v09/EdDEJRZ0srFurBgW2ooIWPK7zqkO71HSXV
 0//HJTM24usMPdUaYVFjtm28UV7c04I8rGeN8CTgsI4aFsSFh3eayrRdSJFkcn9kJzbq
 xOIguBsPDOvJXstAEdTXvLK5th6NBmivaqKjl2hjrSXBX9N+VXXKuyQ9ZEVDekoI6THe
 qlOarF1/n5IWZoXS90v0ZCjcL9e6rBe/nr4hhH4At1ZFNl72F4pTuM9clI5wkig25HNJ
 B+1vLHxZVsLUALZIzQhQM/SWE/Pa+mNqnIIFCsYKDsWNQicpjZiyUTCNsy+QUTf27rAR
 IQvA==
X-Gm-Message-State: AOJu0YwSKp265ivkFzT68TkI0gOPASCrG639gDMVWG2VNEFwWh2zUjdU
 o32MNInVgPcIuVDVwZJrp0KHHGCdZvVZrl2kbRefb6JC8AEm4febPp6GCYa+GeGDJ38ZQqXpt4R
 rlbW4AeX9k1EWhILoIpCXTOPX9POhsoQ92lqlPmSc2w==
X-Gm-Gg: AfdE7cmpcc89TAM5Ks5Q6FxdPnxSURZVo64IAsdWBflJJ3Qi4yJJj+f9UaSMxf3SY9l
 b7u3UBQmBkbfMelVpx4rvbxWRppwQdkTxFWi9ybYABCLKbxg6GLiZxNIxoPN7niRLgvk1gYrx3C
 tYdwSxI29JWzOkKy+k1eWOJYaVK3jzogr09nZaBPUfjSndK2QlkSXRd06L9Tn4GNFYBpa82FQp7
 6ZPJp/NEYyfLb4hU+GOktXd7r72Tle3TD9ZohzQXMrZQN3DTa1v/vzw4Vs+qsrtaliJv83vmhzO
 D+Yf9XccOHsfHjC5S1JiiBk/BOGFxoax4XpvbKFFVwc0AYCyroPR5KzqTHjBx38E+58=
X-Received: by 2002:a05:690e:43ce:b0:660:9441:9e71 with SMTP id
 956f58d0204a3-662cbc8219bmr432669d50.37.1781637021808; Tue, 16 Jun 2026
 12:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260609112552.378999-1-skolothumtho@nvidia.com>
In-Reply-To: <20260609112552.378999-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 20:10:09 +0100
X-Gm-Features: AVVi8CcFb-wu-HtHG00MzUT_0etC8PCflRyVOVD26ahu-isHgbvRZBK5fHj0aOA
Message-ID: <CAFEAcA_c_g+Kw_vz7A4D8oQV5fwvcg00gagQ9Ph4_S1dntBFwA@mail.gmail.com>
Subject: Re: [PATCH v7 00/31] hw/arm/virt: Introduce Tegra241 CMDQV support
 for accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 clg@redhat.com, alex@shazbot.org, nicolinc@nvidia.com, nathanc@nvidia.com, 
 mochs@nvidia.com, jan@nvidia.com, jgg@nvidia.com, zhenzhong.duan@intel.com, 
 kjaju@nvidia.com, phrdina@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 9 Jun 2026 at 12:27, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Hi,
>
> Changes from v6:
>  https://lore.kernel.org/qemu-devel/20260601114221.457995-1-skolothumtho@nvidia.com/
>
>  - Addressed v6 feedback and picked up R-by/T-by tags. Thanks!
>  - mmap the host VINTF Page0 at IOMMU_VIOMMU_ALLOC instead of on VINTF
>    enable (patch #14)
>  - Reset the per-VCMDQ Page0 cache when a queue is freed (patch #19)
>  - Distributed the reset teardown into the patches that introduce each
>    resource (patches #18, #21)
>  - Added a VCMDQ readiness helper and renamed the Page0 backing-pointer
>    helper to vintf_lvcmdq_ptr() (patches #18, #19)
>  - Trace the VCMDQ Page0 backing, hw vs cache (patch #19)
>  - Renamed patch #24 to reflect the changes accurately
>  - Updated the design and lifecycle documentation (patch #30)
>  - Based on top of Nathan's "Resolve AUTO properties" v6 series [0].
>
> Please find the complete branch here:
>  https://github.com/shamiali2008/qemu-master/tree/master-vcmdq-v7-ext
>
> Sanity tested on NVIDIA Grace. Further testing in progress.
>
> Feedback and testing are very welcome.



>  hw/arm/smmuv3-accel.h         |   48 ++
>  hw/arm/tegra241-cmdqv.h       |  384 +++++++++++
>  include/hw/arm/smmuv3.h       |    3 +
>  include/hw/arm/virt.h         |    1 +
>  include/system/iommufd.h      |   17 +-
>  include/system/memory.h       |   21 +
>  backends/iommufd.c            |   64 ++
>  hw/arm/smmuv3-accel-stubs.c   |   12 +
>  hw/arm/smmuv3-accel.c         |  194 ++++--
>  hw/arm/smmuv3.c               |   10 +
>  hw/arm/tegra241-cmdqv-stubs.c |   16 +
>  hw/arm/tegra241-cmdqv.c       | 1119 +++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c      |  127 ++--
>  hw/arm/virt.c                 |   37 ++
>  hw/vfio/iommufd.c             |    4 +-
>  hw/vfio/listener.c            |    6 +
>  system/memory.c               |   10 +
>  backends/trace-events         |    4 +-
>  hw/arm/Kconfig                |    5 +
>  hw/arm/meson.build            |    2 +
>  hw/arm/trace-events           |   11 +
>  hw/vfio/trace-events          |    1 +
>  qemu-options.hx               |    8 +
>  23 files changed, 2024 insertions(+), 80 deletions(-)
>  create mode 100644 hw/arm/tegra241-cmdqv.h
>  create mode 100644 hw/arm/tegra241-cmdqv-stubs.c
>  create mode 100644 hw/arm/tegra241-cmdqv.c

Hi -- I just noticed looking at this diffstat that it does not
make any updates to the documentation to describe this
new feature. Please could you add something (e.g. to
docs/system/arm/virt.rst, or elsewhere if more appropriate)
that describes whatever this new thing is and how to use it,
in terms that make sense to somebody who isn't deeply immersed in
the SMMU and this Nvidia specific bit of hardware ?
You can do this as a followup patch, as I've already queued
this series.

Also, a bullet point for the Changelog giving the short
summary of what the new thing is would be nice. This
cover letter was too cryptic for me to be able to guess :-)

thanks
-- PMM

