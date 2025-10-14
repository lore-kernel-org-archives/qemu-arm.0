Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEECCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 10:41:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8cSY-00025M-IC; Tue, 14 Oct 2025 06:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8cSW-00025E-S4
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:40:48 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8cSS-0003Nt-65
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:40:47 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-63bcfcb800aso5528168d50.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760438438; x=1761043238; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fV7/jrMkBaJn6/SK6psmoZxBrmB/QuRq2mi1M4MJLDM=;
 b=xx6XgFymdx2Dm2V59cEsmnXahLbcpl2f3vOtiVcXDUkpl9HTvsQh367F4uuaxuXLAN
 EFxdE8vkAnGB3N7y6+WQxZklI8tPWAj1axQQkqsHjY0NdivFuErXeqA9KtWlhPW5s5TO
 KRmE5lZJpQ8zrFNO96JL8cOtZlnxL1CWTcdTHlfnCMfrQBDreDdsloDYrUrN0hVE9cYj
 CfhBjhaLzQxHRtZ9SadyveZEdNConrWpoSS/DaBU28CDKp6ulMEE/UgRZoNLTs3PSI/o
 TvqO4i+Sjlg0B8u+doDX2qC0+/MyrVaT6N/U1rVpA9QhfmRJCdgoOQ74JM6PyF1m6pp0
 kaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760438438; x=1761043238;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fV7/jrMkBaJn6/SK6psmoZxBrmB/QuRq2mi1M4MJLDM=;
 b=LWZjVgJAyu454244OyuJovTheOTAnH1+5Xu7OlpKY6gQRAiZfKDYtiODJDm+tPFDAi
 lhfBAoxou53jOXvWeB/1VaRIPAYqmkkpZIpi+j2RoUCbC1hGwdlPabMAw3EAzARK1RSQ
 A8Ej3M/cJBqoGPshcCl/lmh+Mfg/UzU2JpJElI0cETQ0CZ29ZfDZUX8iRKgWjRv6MDFo
 5m6xRUAnHhCZkuS05YC90zlcxn30jbYdq82uq6Z0y15D5XzdJE/842UBBnfFR0k4LVqQ
 H9KbAUJEKkUlOlAORCMuhWRGgCFLZF/J1GX7tECUVGEpPBSXQY/ibO+uinzAMo9SxjFe
 19dQ==
X-Gm-Message-State: AOJu0YzzGzOHP3Ixn71bNGmFMfN3+4/QqJJjzS7n88VIK+CtEnMw5U30
 Zn3d8flLXqHMJSpuQbFBdcG4aUxpteYu+tn3T/ZFm1KEM9+e0jjt+qa81b9fp5sN6E29YQSoZF7
 29Uh28V29Q5CI5dzPloc+PseyZt82sSXDSEGLHwS3UdkoYntkuTVD
X-Gm-Gg: ASbGncsg1UemoR50yNMDY3iEOraIwZ7gfGmS2hkaSbvAbvWCMoUzzE7zguJy4FdhmXs
 cFgg3CjFFV9c0QP3HNgH4Etkym7l+jRPVzw+h52DHXz3Es4Bu6EmMGnmnkrCZX2pIJhKqLewtZn
 8qtZwcVnZqHtcjYUo5kwm6XsOJLXbfMdXsniAvrvQhO8aNc+BZ6hMJ8qbGUeqFt/pt5LDLL4oli
 Q41qpHmcPbxHAzxoEV2wIW5WDU5Wr/KsxHhaQ8bQQ==
X-Google-Smtp-Source: AGHT+IHU25n+NhO/XEBsOpVv+Dv7mHjyhEKj989SEiZfz77ncLsJkxn7uC2b82nVld78ZQAkn2bckryrhV0afokk0ek=
X-Received: by 2002:a53:cec2:0:b0:62a:b545:54b6 with SMTP id
 956f58d0204a3-63ccb8f2f76mr15802555d50.35.1760438437741; Tue, 14 Oct 2025
 03:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250708115238.667050-1-peter.maydell@linaro.org>
In-Reply-To: <20250708115238.667050-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 11:40:26 +0100
X-Gm-Features: AS18NWBgEyajiYmPUV-neW3F_hyeBVXdjoo5-mhRmEe8VsCU4lpfFONRodvhii8
Message-ID: <CAFEAcA_MqNWHJ62sRCCK5s6-V6-qA4BWP5aFp0PZPeLDyXbYOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/intc: handle GICD_TYPER2 for KVM GICv3
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 8 Jul 2025 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The GICD_TYPER2 GICv3 distributor register is one that is added
> for GICv4.1; previously this was architected as a RES0 location.
> Our TCG GIC doesn't implement GICv4.1, but for KVM the kernel
> might support it.
>
> This patchset:
>  * makes GICD_TYPER0 reads not trigger a bad-read trace
>    event on the TCG GICv3, for the benefit of GICv4.1-aware
>    guest code
>  * migrates the GICD_TYPER2 register value on a KVM GIC,
>    so that a mismatch between source and destination
>    can be caught by the destination kernel
>
> Note that I have only very lightly tested this, on a
> host which (I believe) doesn't have a GICv4.1.
>
> Changes v1->v2:
>  * fix comment missing bracket
>  * fix reset handling so this works on GICv4.1 hosts
>  * move get/put code to be with the other GICD regs
>  * new patch 3 to drop a barely-used debug printf macro

I never applied this, I think because I was concerned about
not having tested patch 2 very much. But patches 1 and 3
are definitely simple and safe, so I'm going to pick those
up. Patch 2 is still probably a good idea, but IDK if I'm
going to get round to testing it, especially since I don't
have a GICv4.1 host to hand...

-- PMM

