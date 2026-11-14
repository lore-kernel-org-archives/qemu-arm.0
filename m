Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD58606A32D
	for <qemu-arm@archiver.kernel.org>; Sat, 14 Nov 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V/akzFSv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xSBKs-0007SP-Ri; Sat, 14 Nov 2026 05:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSBKh-0007Jt-4Y
 for qemu-arm@nongnu.org; Sat, 14 Nov 2026 05:50:08 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSBKf-0001aV-HL
 for qemu-arm@nongnu.org; Sat, 14 Nov 2026 05:50:06 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-67921b515a7so1947604d50.2
 for <qemu-arm@nongnu.org>; Sat, 14 Nov 2026 02:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794653404; cv=none;
 d=google.com; s=arc-20260327;
 b=KDfPC7cKDJQtpVX7AOXvGNfY9Rxl3OMnBAGLPvwrwT1571k9HP/AoRqV4tNuTepPTW
 vOuP+SHom+vuDempUaOTS1cqAX/VvQo1zpAeMxMH+2UhXTZxJokIp7BqBFudeZxWgAjf
 iJaJOPS5vzLVhRmvnCvP+q884LvZnAPCuHIcFX+YS+WfmX37lLYFkTDgLhKvKEdYK+yo
 RPnFS1c0f7gT5A22GVv9q58phMDLQun905gyt9vlI4pM+Sm1B3VyS+xQnYMrpyOXeVK0
 MTMk5mGXPbqmEJc9ur/FV9OuXZUxDT/ypfm5QRq3Q927DPwxtPMEqzsYbGxC3UGpL5G5
 2CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cGDymkR3cFc6weptlKP3igi3nbWKhlIh2JKy12OlpYU=;
 fh=+Of7jKsV2rhdjBK8yIRFsRozBS9RH6WMNhMbtLEwRHc=;
 b=pYtP5CxOUoVLV/Ed9izsmORx2kTMOWnUAaPvmzGAU+YZbbmRRhm40FJ9EpJPlDFKqb
 HWgMUkiYzo1XkZklx3iA8AZ5/KFcijouR90BHdE1wTYTQZIXbErpOb8UPehuEHDtryDH
 yX6R2tNczyHxoa3e8jvqhLffVyO5pD9D6B11cjTy3tlioGcc1zTChO6Qaezi+J05NBz6
 VyOf6HjEm5uqJ2umxFv64XoxfudzMNQpwQqg8BOT8psWXTQiHdE3Ykd1+Jj8R5ZGsUvM
 rCn61LtBmfxaBP+vCqyF5p2M1APnU3czYQzK1gXKJGSpfn2hZVSf2Sd1JO+RAjNo2qvC
 TixQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794653404; x=1795258204; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cGDymkR3cFc6weptlKP3igi3nbWKhlIh2JKy12OlpYU=;
 b=V/akzFSvZr+dtNjjxSmQP1PfeNL/kuctkM4umtas8lsonJvrRe/b2SsvbEh27feHYj
 6T1OzSkTvrwBnNBubiEYPJvCmjyiYvO3+JeXeBv8DfyMBjxv3KG9K/LfrBm0TnzpKv2q
 g9llbE9tPXxhgLjPDSNG4u+ki927IWYMLC0i7fmCWUj2J/jKUCIVLLpW1/v/tLFhQN68
 D0dGSJxrRhrQRRJrx4saxvh7FqJ/PAo0ZE5o4K2I8fZSdPA14dVKPY8mCTJW+PvatO9X
 kAgAn97ZNevI6RqkcWjTVaRRvem0sRUIjgdzPSn1nzNfADZjALUaMVL5K1dKo2GYgIul
 XmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794653404; x=1795258204;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cGDymkR3cFc6weptlKP3igi3nbWKhlIh2JKy12OlpYU=;
 b=hdyoPBB5xnkzERcqQmOO8aE7BSqwTLnEFPVkJID3HpA727TOayWmNEH4PQAYUdEl+k
 ok2Qwdi6uq4yT8+UZz8m+utU76E8f6fUr5X1boo4BA5fytMGJDaf+Ev1/7Fqg39KcLUV
 JQJKb+hYdFjkWAJVvn+RHdFXuuHBR452M16TjVbMIK588EVvWkhxlLf3A33B8RNPa9fU
 mwQKVvkV97KqXNfUjnq/NQcOlxk+YCTk3Wg0Ah8jKydShnGNRR6OSDtAgh5cnV1JUkPQ
 NmHG9kw90uER69R+RUKk3hFjnA2iewLbCXW5OWIV2XOcVW5Jte3ai9OBQ0Jcf16daBxk
 uu+A==
X-Forwarded-Encrypted: i=1;
 AL+hErEsidqm2leBe5LEnFPvvhXwuwtouLKLCRqzJPzDL5oQp62d91L4OZMxRZiqRmsG24AYILdprrecOw==@nongnu.org
X-Gm-Message-State: APuU4Z9uoBRwtRA03WUu4rLK/QAdHpq63ynpZKRw3sS7wHaMu8zte/9o
 Voxe5aDcWlV7it+nXdMMIcEcPdsttrB8lKpJ5JblobAiCK9Dw2B0DIQeH6u667jqjScNaNv/FFl
 +7TmjLJdYJqF82gbBj4IjKU023jEHBVW2FBYQl48OQw==
X-Gm-Gg: AYBFou1QhMLVB5Vv/Y7RhJcCAVATF99sJbQTP/eDpb8HEyquFuYMI424okwuFxDpcoT
 iVKzduiErtVzOpvHNPCl9zgSrTv3NYppZ2YiQv5SZ1jsdI1ays8dsW6Ensem65ctlBNR27Ns1WG
 n4eEiR4NTre3R+MDu2BhLwP0wwFyT67ZXAju8Enh0nTXzdZMa7nT9axljAyBh4SZhELnD6vQUlO
 YjqTZ4oRqaeFGiH0xRsUS9m/s/L6IurkPesgXkfM8GXaNKoKC3IOkHbz9l6qpBuW4XZVkHNRxyg
 tCvyZBgO49swdTcs1BO5V6ibwKP1J6um4Y1yqTrFq5/SsY4MpuznbSBTAsS8gQTbYDXfHbCP3PJ
 Yff70meQjX+TvKOIRxaZSEEd/a7LtLRFecaxrAistqCy75XK9m4s3nuZGPDQ2vwnLgrlfkGH1/s
 RWvjJSy1KVn4g9ZrzLovXT
X-Received: by 2002:a05:690e:1389:b0:67d:9a5e:8ec0 with SMTP id
 956f58d0204a3-67d9a5e967cmr1509895d50.48.1794653404111; Sat, 14 Nov 2026
 02:50:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <179449578952.8382.2790865629085512841-0@git.sr.ht>
 <179449578952.8382.2790865629085512841-3@git.sr.ht>
In-Reply-To: <179449578952.8382.2790865629085512841-3@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 Nov 2026 10:49:52 +0000
X-Gm-Features: AclHuK9ckxnBfEDfo_LyX-IbblHtB2BETK2N6sP8mZgn1-igdfXYK3CsS6VZnP0
Message-ID: <CAFEAcA-jgooO51Lo7Mne+vOmf22nnFX+vASRdKfNFyUbPpMarw@mail.gmail.com>
Subject: Re: [PATCH qemu 3/3] hw/arm: Add STM32L496G-DISCO machine
To: "~mohammadodeh" <Mohammad.Odeh@exalt.ps>
Cc: qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Samuel Tardieu <sam@rfc1149.net>, Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Bernhard Beschow <shentey@gmail.com>, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Bin Meng <bin.meng@processmission.com>, 
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 15:03, ~mohammadodeh <mohammadodeh@git.sr.ht> wrote:
>
> From: Mohammad Odeh <mohammad.odeh@exalt.ps>
>
> Add a machine model for the STM32L496G-DISCO Discovery kit.
>
> Introduce the STM32L496xG SoC variant with its flash and SRAM sizes.
> Attach the on-board MX25R6435F flash to the QuadSPI controller and add
> qtests for identification, SFDP access, and data transfer.
>
> Signed-off-by: Mohammad Odeh <zephyr@exalt.ps>
> ---
>  MAINTAINERS                          |   8 +
>  docs/system/arm/stm32.rst            |   1 +
>  docs/system/arm/stm32l496g-disco.rst |  43 ++
>  docs/system/target-arm.rst           |   1 +
>  hw/arm/Kconfig                       |   7 +
>  hw/arm/meson.build                   |   1 +
>  hw/arm/stm32l496g-disco.c            |  95 ++++
>  hw/arm/stm32l4x5_soc.c               |  25 +-
>  include/hw/arm/stm32l4x5_soc.h       |   3 +
>  tests/qtest/meson.build              |   1 +
>  tests/qtest/stm32l496g-disco-test.c  | 693 +++++++++++++++++++++++++++
>  11 files changed, 874 insertions(+), 4 deletions(-)
>  create mode 100644 docs/system/arm/stm32l496g-disco.rst
>  create mode 100644 hw/arm/stm32l496g-disco.c
>  create mode 100644 tests/qtest/stm32l496g-disco-test.c

Put tests in a separate patch from the actual implementation, please.


-- PMM

