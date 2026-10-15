Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE28BCC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 14:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHM4R-0005xy-Th; Thu, 15 Oct 2026 10:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHM4O-0005xM-UO
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:04:32 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHM4M-000270-7v
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:04:32 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso16395517b3.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 07:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073068; cv=none;
 d=google.com; s=arc-20260327;
 b=GeUdqIEjhFFs9pNUTFDNphYCVhrI4xd2zfoFtMVWjbRSJEhrYutCVhGZxY61iwWG60
 vRbF0aMaCV4qIm7oxlpulTqCkr7mn5jfTLrETu21hrvvE/hgv5ZeeJlFjX1ll33wIjR0
 JeSdwf+F+I8CNH4x2sSvOklZXR/hNdqkTwzJEPbFOzYcezzsO7rxMWCg6w35A2aTMUz5
 hN08wetkYxhsW1KeHcLeC9dSceAv/E1Rm3bTCehnJASy+fEajMPfFqkoWox1R1mQUH0x
 dmcdfd5T0L6jOssc76bZFgjvuz0Sk4ZbzLvTmkCxEKxwzqQUaKhB+P6vAWVSrji6MJrm
 H0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rAj/PL1/Kubvxu9E3DHe1paOOh3OoN48UxF0kJlMOXk=;
 fh=QAqL9B8LCImw0x6obdrIe1xP+7aQkslqsIC66qicMtg=;
 b=KuD15WzJvaGR7BBAfEb5aTB+KY1oZm3Vou/S53HC5mEFbf0aR6oKnnDLofdHauLgoE
 kgqr8jKKDA6/ZhAi+LV1sxWlVFefipYPegWn3S3q/EmxxmUWViK7GqeOn887vIegk3SM
 x/1LIvIacu5x9MlhvPb/modYoJmLa3QNggZr6H5qB1Fw1+PT5E3nQcKgPKa+LXEcXMc0
 hHRClXzXIV6q2WTO43ja7hzy10xs95d3bR3ouoyW4pG9EAUbDRm4GjrVkK8xTBm6vdV6
 B2NSAZFylGn5tmRXN0+AFcAzoHcRIGqAUh6UzOgD2x/KAMM88YJB+hc1Pbf9yZmLrUKD
 NnlQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792073068; x=1792677868; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rAj/PL1/Kubvxu9E3DHe1paOOh3OoN48UxF0kJlMOXk=;
 b=BKuHK6wi8sYo8q0VxeEBTryUsbZUpyIGFZgK7tzFO+h+dk0rqAz/9ScHGG4wZCUrKy
 htkuok7vBM87eb2txj61KF08/b80VfggaY6Er1AxyPx/JV4fWrBZQG6mXXyF+J5OM/l/
 RFYRZQdnVr2rAizw4meDYb3qXQ6A7K2/o4Sap3z0cXR1abRaxOG6okYhI1sovi1wOHnr
 hx9/7IkQC+aJamxvH3DQcrwGDASw5XZ+gm/bOL4EuGEhdAS4BGb5vsv5gAtpDIjd0FoD
 4Dz9/UAWeSbmInYoYf4D6uya2mBSZizAdtmnYJ7GGgVjaw7m+8e2GbsrFM2Osip9RCl0
 PD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792073068; x=1792677868;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rAj/PL1/Kubvxu9E3DHe1paOOh3OoN48UxF0kJlMOXk=;
 b=1GZZFu7yhaw18KkQTCydKP1Aw0AxhghwTbBhDdLko8Gq4MzPTtI838xGvYxwK0HPF4
 ChLXDSGsmL7I/bdZ+UZeSwpyaR/L7ZRd17ItI2whoX+0YABMUPh8x+41Q7MQopC121/x
 TR5lidinHJHzJwoCXpMSuE12ojHvUhg4CGpcaaU4Iz6ZVijr8PweMHohmn9iIvOL1rhJ
 Lz0M7PesqJ4eBJpyiSaPCtn1FEs6jgWG7Te5ucGOf0TUwQfVEvJBkHlgc7i4/fSE3R2+
 Ts4ETK+mJSrQo1BHblbaL8TwmKOa3uC19wKhqDI1x/TyB9ZVo3CNQZaFGM+R3GJ5Pt+X
 OjkQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdSyUtfxBjWrT5eEBKCNQcPjq7UuyoC2QEOaM6ENpfni7qRQpBmBzv5MQCPm3ed4bLigllomTZrQ==@nongnu.org
X-Gm-Message-State: AFq9FYJWRrRseG/DTfWFNleBRnyrEXRVH8QV0s9g4Ka5IUcw6CPJrkpI
 eLRk/kHhE/aiFE2TXsJ8QtijiWm3c2AmSxhoO4IT908+63HadYXCITrKZslxLeGDH4ymKL0Gb3y
 fP0jFbw2+9FR4wnOJj+sJvGHcDxeSVp9KGlWS5wGkvw==
X-Gm-Gg: AYBFou25iNUvSST6DItA37+NcAw7awI3AM6MbrlBCDczSV3ZsuFM+fASKqDJzcLBHqR
 Q0AsXMJgYtUqd7hC3NudoF2qm7+G6LHODm8GIVKKUD3F+jz5zZ3cICglrIlrNPIapP8kzqPH3km
 JEZoPz93K/p6bj4fdvtQw/SkYHVcx1V2z130l7UFuKcT1iO5FOylcUqNfvbjAI1BdddIiS3o2xa
 QSczVdTroQDf0ecpGaZJFYbk8oKXwXNINZ3MM2vzCKqgTnFZuscQsSL1Htv9PSb4IV/R5mMxl4f
 ORMRxPagGLNeT6X0PpI1Zixe0Nk4KT2Vr4V7+hUMz6ByFkkKMoUJHBNCyD/z7ZNjWi0HY+bZSib
 pkZaNoPfUYY/Ard3Vhh6MWFCjY6QERa48XW2rnzqihEhXRJLLQw==
X-Received: by 2002:a05:690c:fce:b0:8b0:d9ff:4f7c with SMTP id
 00721157ae682-8b0d9ff56ddmr5428357b3.17.1792073067767; Thu, 15 Oct 2026
 07:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261014045605.399684-1-bin.meng@processmission.com>
In-Reply-To: <20261014045605.399684-1-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 15:04:15 +0100
X-Gm-Features: AclHuK87O_mSPs02NGthXWxbNV6NhgEJtcWU8NJD3S4nj8p5bqwnKQDDUqcU9yU
Message-ID: <CAFEAcA8XwpDmqvUaFDj+QROEAcyTr2K17cz5O1F-g7YSFSq_2A@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] hw/arm: Enable U-Boot boot on MCIMX6UL-EVK
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 14 Oct 2026 at 05:56, Bin Meng <bin.meng@processmission.com> wrote:
>
>
> The mcimx6ul-evk machine can boot Linux directly, but it cannot run the
> U-Boot proper produced by Buildroot far enough to load a kernel from its
> SD card. Early U-Boot boot test accesses currently abort or observe
> placeholder values, and the i.MX uSDHC model exposes several issues.
>
> This series lets an unmodified Buildroot 2026.05 U-Boot 2024.07 image
> run on mcimx6ul-evk, load zImage and imx6ul-14x14-evk.dtb from USDHC2,
> start Linux, mount the SD card root file system, and reach the Buildroot
> login prompt. It also documents and tests the existing direct Linux boot
> path.
>
> Patches 1 through 4 provide the minimum early-firmware-visible state.
> Patches 5 through 8 address i.MX uSDHC behavior needed by U-Boot. The
> last two patches document both boot paths and add functional tests for
> U-Boot and direct Linux boot.
>
> This series is based on:
> <20261014012323.322790-1-bin.meng@processmission.com>
> as the sdhci changes have conflicts.

I've reviewed patch 1. If imx and sdcard people review the other
patches, I'm happy to take it via target-arm.next (ping me at
that point), but I don't currently have the bandwidth to review
large Arm SoC/board model patchseries myself.

thanks
-- PMM

