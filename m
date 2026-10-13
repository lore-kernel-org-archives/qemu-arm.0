Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CFBCC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:03:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGZLW-0001CU-I7; Tue, 13 Oct 2026 06:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xGZLQ-0001BH-R8
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:02:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xGZLO-0007u5-Po
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:02:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48b0946c2c2so1659194f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791885769; x=1792490569; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9l8QxLsARWG71X43UIA7zF2h/xgxES9j9wgsYMacm1E=;
 b=jwWCO6yMWyGnTpqKDtI1sRtNwExlDxNFqjar7e5C5JDN+eLKQ8ZxEnyUuahPFG/EQM
 gBY2QpaCacVgQDueuE1zudI5tUFjmCr9dJ5EjeJqyn+aL4EpVHBEirWjWIalspcOhr30
 zhnb9oFlJY1urY0tDZIVeC04xQdrIT+JbckhNkwNckVC1Nqd5r1T1IILcXb3DcIk6JPl
 zy79ctU7toizNTQI+t6kKxFHVGR//yEgd2V6Z9H1TJlplLrEov7FgrSQBUxLbfilKmG/
 ag4GbMNw3RveH6fV1VCszYEanP6IRtwygZ2ybK0mQ32ooe2uZowTHAny23priuuV80b8
 VNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791885769; x=1792490569;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9l8QxLsARWG71X43UIA7zF2h/xgxES9j9wgsYMacm1E=;
 b=gKcS0OGvvPP2dONWz+bcKmXLBfw8TO84ojx0PIDFqScF7+QLN6W4j47gJRzf7/MHz/
 HCmJbb82GDo3YqSL0Oswc19O37DeWKSzKLb9getE7K4K9uY5LKjF8CUAivZYrOr3HiMA
 gIS9SDg3RHa0rhJQAMCW12xTXcHW5EVHmdJ5hTmmfvreFKAPspvWh7QJRI0Aiyf83uB7
 gXDwX4EV+q7zYOU+KpAiOGhRkHrzvjO8ikUr54Oa6o/c7yEF15A/UsBQcb1yw3JHPUV2
 J+caiw49L8zTQaOuRUHaRwFyj/FJVsHadrjBtu8A+4p3zKEZQc2zes/GAGFG4WAR9cji
 /iSQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByM/deQEv6ZnsgkF7W3of05g+Dvo4FPqggZq0YyVz+zYqIx7Q5NRGCdMBxg/izfQ5LDeKmWOEqimA==@nongnu.org
X-Gm-Message-State: AFq9FYJ9x0k1eOxGCdNSZhJCQj8jVegtHk49Jp1wIWh+0lIWCVkPn1nn
 /qhWafxZb7gz8ukY/oxIzFPaq8uMxdpC3Gbp6FUmPDiGZNsGxEHYqnCT
X-Gm-Gg: AYBFou2//zwvBz4DSLrCbu4dHTCj3vbzWtfREOPmTD5xZ/LtX0mK/OVWlx/j5OPCFvY
 jZOgg/fGiML3Zk8nZ+IPqmjak6KxmyeR/8Ip4SA68LTcD4pbXdGAwSxX/8Eqpn4qTFOgdqSMrml
 BiQFO4zAwgr4jZ9n2b06pqJcr6VnT3Q9T4jOcmcMvnZSbg2LxuxfndWRA+FWgt2PITR+XKfb9AF
 v7teTrBEXcy0u1hCypjhUD2w7JLcJlRNh4iRuAsNtFPFvZr1CbvCsMLBAFjqEAh8blTwY+maIQT
 UpREvLdgltkrjlIs+25YY8YLxGmmyYE5I+LTINPpDCPs/QV4sGHWiyTSilYB8A48IDQLDpd91rO
 hY0FxjJyD7uo6yIWjxKBdW/Q3qDUv6NdGihY987sMNvMBF5rHl9PGHyiRsJauoNt2YnN4yOwMmy
 5UEETGcJo2NVCK7/pfijW3pZf96nEkkjd2/Dppm43XoB6XhcG7hcRAO5dGtOSOvQTHwtqYl+Z95
 Fq+6pjubu1dM85/Uo2FKNrUp8/LXEVHA9qd1Bv533QsidsV3EcqdCV1BAgSj5EHcKN98Sw=
X-Received: by 2002:a5d:4e4c:0:b0:48b:10c8:2181 with SMTP id
 ffacd0b85a97d-48dbaaec6a7mr17303506f8f.27.1791885768649; 
 Tue, 13 Oct 2026 03:02:48 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf35e00015f07061f2b3fa54.dip0.t-ipconnect.de.
 [2003:fa:af35:e000:15f0:7061:f2b3:fa54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bd1843sm4292643f8f.56.2026.10.13.03.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:02:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:02:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 QEMU <qemu-devel@nongnu.org>
CC: Bin Meng <bmeng.cn@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 00/10] hw/arm: Enable U-Boot boot on MCIMX6UL-EVK
In-Reply-To: <20261004090500.3082641-1-bin.meng@processmission.com>
References: <20261004090500.3082641-1-bin.meng@processmission.com>
Message-ID: <B64519F5-5D6E-4098-9B27-B2941EA0B2EF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



Am 4=2E Oktober 2026 09:04:45 UTC schrieb Bin Meng <bin=2Emeng@processmiss=
ion=2Ecom>:
>
>The mcimx6ul-evk machine can boot Linux directly, but it cannot run the
>U-Boot proper produced by Buildroot far enough to load a kernel from its
>SD card=2E Early U-Boot boot test accesses currently abort or observe
>placeholder values, and the i=2EMX uSDHC model exposes several issues=2E
>
>This series lets an unmodified Buildroot 2026=2E05 U-Boot 2024=2E07 image
>run on mcimx6ul-evk, load zImage and imx6ul-14x14-evk=2Edtb from USDHC2,
>start Linux, mount the SD card root file system, and reach the Buildroot
>login prompt=2E It also documents and tests the existing direct Linux boo=
t
>path=2E
>
>Patches 1 through 4 provide the minimum early-firmware-visible state=2E
>Patches 5 through 8 address i=2EMX uSDHC behavior needed by U-Boot=2E The
>last two patches document both boot paths and add functional tests for
>U-Boot and direct Linux boot=2E
>
>This series is based on:
><20261003170232=2E2450916-1-bin=2Emeng@processmission=2Ecom>
>as the sdhci changes have conflicts=2E

Series applied cleanly for me onto latest master (615ece3c406b) with the f=
unctional test passing=2E

Best regards,
Bernhard

>
>Changes in v3:
>- Rebase on the v3 PolarFire SoC Icicle Kit series
>- Model the full reserved page as a child of a15mpcore_priv
>- Validate MMDC RAM geometry and document supported capacities
>- Translate uSDHC vendor clock gates in its MMIO handlers
>- Cover partial reset accesses and migrate vendor clock state
>- Extend contiguous SDMA completion to both eSDHC byte orders
>
>Bin Meng (10):
>  hw/cpu: a15mpcore: Model the reserved page as RAZ/WI
>  hw/misc: imx6ul_ccm: Update PMU_MISC0 reset value
>  hw/arm: fsl-imx6ul: Map early firmware register placeholders
>  hw/arm: fsl-imx6ul: Add a minimal MMDC geometry model
>  hw/sd: sdhci: Use a QEMU-local no-busy IRQ quirk bit
>  hw/sd: sdhci: Honor i=2EMX uSDHC vendor clock gates
>  hw/sd: sdhci: Preserve uSDHC status enables for U-Boot
>  hw/sd: sdhci: Skip SDMA boundary stops for eSDHC and uSDHC
>  docs/system/arm: Document MCIMX6UL-EVK Buildroot boot
>  tests/functional/arm: Add MCIMX6UL-EVK boot tests
>
> MAINTAINERS                               |   1 +
> docs/system/arm/mcimx6ul-evk=2Erst          |  72 +++++++++++
> include/hw/arm/fsl-imx6ul=2Eh               |   2 +
> include/hw/cpu/a15mpcore=2Eh                |   6 +
> include/hw/sd/sdhci=2Eh                     |  10 +-
> hw/arm/fsl-imx6ul=2Ec                       |  87 ++++++++++++-
> hw/arm/mcimx6ul-evk=2Ec                     |   2 +
> hw/cpu/a15mpcore=2Ec                        |  53 ++++++++
> hw/misc/imx6ul_ccm=2Ec                      |   2 +-
> hw/sd/sdhci=2Ec                             | 151 +++++++++++++++++-----
> tests/functional/arm/meson=2Ebuild          |   2 +
> tests/functional/arm/test_mcimx6ul_evk=2Epy |  69 ++++++++++
> 12 files changed, 416 insertions(+), 41 deletions(-)
> create mode 100644 tests/functional/arm/test_mcimx6ul_evk=2Epy
>
>---
>base-commit: 3ee3bacb1edd0896cb26f0f66493b4ab006fbffa
>branch: imx6ul-evk
>

