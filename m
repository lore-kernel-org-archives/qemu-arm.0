Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE2606A31C
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Nov 2026 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wgvFiGMi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQqV0-0001Lz-ND; Tue, 10 Nov 2026 13:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xQqUx-0001LU-6z
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 13:23:11 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xQqUv-0002RB-B2
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 13:23:10 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-67990a45e02so2338229d50.3
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 10:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794334988; cv=none;
 d=google.com; s=arc-20260327;
 b=QS8HRSFvv2uHEEIlXbVzNHkoUvv70z4n8ASVwWZeEfR+9lS1OlxIyGY/yq8nPelZYM
 y7g7+044vjCPh8EkNnCybwWLhXalbPiEDYPBaFjWCLXOqvZ7bmstWrc7R3i6LMAwaKEc
 yEL8hqwbdIuQVDs4CeML9G/l3WVwGUIpFvNpGnVSEcbotJOr/BmbbJy3ilWhnyG/pBNh
 qm6RLOa3WvRTdjKiJGmrrZQyd1YTixJ8ao67d6VkbjRiQkVbqQzDM7H6E6krFrrObl1L
 PGySOoEXbZVyLtAr+DO8xq46l+UUZho8NRVtjr9HXwzMu7nPvYpV1Ly76JuSCa3cfjHc
 ChaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=27ySAo2+dUimhu26CFpZ16PLYKjsmAwT7G8TLDAERKw=;
 fh=aEbx6BWq6S8U7eUACVKHmXEjZaLjI6Ppy73L6qPi+VY=;
 b=GQm6lEOrlsGFPiEbrGyJgOVtMCqHpiVT+6BKDxRYXwoJgKTDHWr3uu3ya2iUPrglAk
 bBKHPsT1eLfzsZE9ayAGe3ZueesAoAeMxz80b31/vAEm04uOF24IIf841H+/eAxvfnGb
 7MGotDDlgXLsbSnSYKPHO45Au/anlXcZIg33PKFuOmtpdPk8EEJQEpCEMBfvhBmsslxn
 3gnUhcqp2bUb3bFeEVc+DPlM79G463ZtX1hWomP9kdq0HVgo5/Rx2AIDYxgO0n1jzuWG
 xTkfczcOESsCxXKNsV2ArojthCoKOMtit86+4+SGJNWlej5Z8myPYMi6k4er8nlFsFww
 pVWA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794334988; x=1794939788; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=27ySAo2+dUimhu26CFpZ16PLYKjsmAwT7G8TLDAERKw=;
 b=wgvFiGMik5+6h+sJ79De4gd0/HvMWKHEevM0NeaRgDB7KXwRH1fKBiE6GGc51KSoU3
 X+JG1kORQ5Zr1idHIVPmcb07Yr5zzGWQWn/3nSq0+KoURiolMP4Dl2nW7wDibOKpRWyG
 bu3/GOo7QzQVzDzQ1BubTy5Q9qYAO/qUNLxRG7zYXN2gG9ODVpEayFRE6BFlrblu3LQ2
 GmFBmx+ahomhkfUVw94T82NXbuP2+ap7zt1zJS9DnYkyHHu3FyWIK2ahz71j5D6vz6QZ
 zGd3J5aNwdpBG0m/OePIF7z+oM8d/H11bZ1AGB52yzF1IYnjMFlGXEJL0bqcyH5eRJ/S
 aWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794334988; x=1794939788;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=27ySAo2+dUimhu26CFpZ16PLYKjsmAwT7G8TLDAERKw=;
 b=o6lWYHF8xu3dZiRYd0QOxMXswrOA93MvA4j+SqGuKv3UzOJDgIRzTNg3RfQ/j9FMGh
 rUMIJv/eBbsn5r86EgrWX2wPUBNaVyHlatX1wkGGD9MOYIXOZtLWakcKJoPeC01MNc+i
 vR9DaTCSPQpxbucdBX9qCJeaDLN/wkoOJNJr6iAmJuJjHQsifI1H2F1sZ3K1tBcZskmh
 AcrtooW+WVGhaTWWkUTcrOOj6AFE5KbsyUCl9xS2mYQhu6Jrmqi8QS+EaxO5aDpjZ8Ym
 pljPS4HhjasI8T0o9kvZ93tLDCsmFWxh4fEwdSw0OXaxhtPr8FEP/hecRcpok1kQPK+u
 mXzQ==
X-Gm-Message-State: APuU4Z+onA1NtInHPHhnLcHE11g+oNvHPh2kqaoSCS/kK2GjgVspIObk
 hDm+42AZ9o1+NXSJ3S0eC0HoGJACcqpOHtQyboSIGUdcUR26koZrktt0cwcz9DLtv7mXHZOFRFd
 oTumFgECqftqr34T89p+mhkqdVKLYylU836fJJlUeoMoRGLK9sYbucaI=
X-Gm-Gg: AYBFou14JqfLPNE66L2RY0wkbwDOn5ekC7wcA22M8NGULY9TtiPUukz3Jh9x2ULCKfc
 gifIuYPJNv9WGQDWrzw7hxh/XPKjIuBvo3Iy8jK1BJJbq8En2ok0eUmHWzW2/zO02pL8oW0JTh5
 jdRYi0t1z9/D4QjxYxLCOuxlBJYyjoJ+2Lt9dQHje87v3l+9mjKtQh0yYHO20JCAiapzd7iwdpH
 TopxjeC7uvf4Bv1EFzj5m3aVxUYN3HsWgVmEzT+3dOTOc7OBYraEtRd4LBdxWHC7XwVulqRJRC+
 MPMOn2WRy+q5o0ypVWyy5m6R5gjSRzx0jfHZ/2D8/WMTnUDRcMOo9lNYOMgsW7bysdXZItD4YQ3
 CXAKVhOmiBmwbsE32ELNtYUO4ts8aZQrumusSFIsAaFsD+gEzPrvqBT0+MLb4kYa/j8rjnYiUXl
 msBKtdVcLMC/SANM4SSNuWIHiUNNYJmBfHSMNJ/bFkig==
X-Received: by 2002:a05:690e:12cb:b0:67c:a2c:8214 with SMTP id
 956f58d0204a3-67c67fa8174mr88932d50.66.1794334987532; Tue, 10 Nov 2026
 10:23:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030095731.581512-1-peter.maydell@linaro.org>
In-Reply-To: <20261030095731.581512-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2026 18:22:55 +0000
X-Gm-Features: AclHuK8CB_vL-ujtoK9NibS5waOnqLhzVdYEdW9-BFBnMdXiEK--dFAILjW8yT4
Message-ID: <CAFEAcA_18rPM_zKO8daehxrPdXD4DWLhQ1gvuAy=9WEZejqPMw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Deprecate Nuvoton quanta-gsj board model
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 Bin Meng <bin.meng@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Last chance for anybody on the Nuvoton maintainers list to respond;
otherwise I'll throw this into target-arm to deprecate quanta-gsj
this week.

-- PMM

On Fri, 30 Oct 2026 at 09:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The latest OpenBMC release as of June 2026 no longer supports the
> quanta-gsj board model (as noted in docs/system/arm/nuvoton.rst);
> support was removed by OpenBMC back in 2023:
> https://github.com/openbmc/openbmc/commit/ab5062cf6f562ad0c844570ba1ea0089961848ca
>
> If OpenBMC don't care about this model any more, it's unlikely to
> have many users.  Deprecate it, with the intention of deletion after
> the usual two-release period.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I don't insist on deprecating this if the Nuvoton maintainers
> think it's still useful. But this is a "hello, are you paying
> attention" call, since you didn't respond when I asked in
> code review on a different patchset :-)
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  hw/arm/npcm7xx_boards.c   |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index dab47b6ca38..c579342b312 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -287,6 +287,16 @@ The machine never got fully implemented and can only show the firmware prompt.
>  Given the incomplete state and slow progress on improvements, it might get
>  removed again without replacement.
>
> +``quanta-gsj`` Arm machine (since 11.2)
> +'''''''''''''''''''''''''''''''''''''''
> +
> +The ``quanta-gsj`` machine models a system with a Nuvoton SoC
> +intended for use as a baseband management controller in a server.
> +Support for this machine type was dropped from the OpenBMC project
> +in 2023. If OpenBMC no longer care about this hardware, the QEMU
> +model is unlikely to have many users, so we are deprecating it.
> +Users should consider one of the other Nuvoton-based board models.
> +
>
>  Backend options
>  ---------------
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 9c526a26839..ec4b530986b 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -496,6 +496,7 @@ static void gsj_machine_class_init(ObjectClass *oc, const void *data)
>      mc->init = quanta_gsj_init;
>      mc->auto_create_sdcard = true;
>      mc->default_ram_size = 512 * MiB;
> +    mc->deprecation_reason = "No longer supported by OpenBMC";
>  };
>
>  static void gbs_bmc_machine_class_init(ObjectClass *oc, const void *data)

