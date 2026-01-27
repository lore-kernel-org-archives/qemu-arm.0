Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8DDD2D8FA
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 10:54:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkgiK-0005bz-Jn; Tue, 27 Jan 2026 05:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgiD-0005Wz-HX
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 05:54:22 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgi9-0004ry-7Y
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 05:54:18 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7927261a3acso59509437b3.0
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 02:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511256; cv=none;
 d=google.com; s=arc-20240605;
 b=P9popUWSsrlnqeZL6dEnv6KCMn3SygeHYowPoHbZtdWPdwZHJwG+fnXzaMw0ZdQdm7
 mR79pNOvixlWAeWuWGxJMnJg41OTHIbqGc39MoOBFEHB2Lm81vV2i+bx7XfM7w3qdT3a
 ccr2y8/mExBQpxqR3cibyQ8kwtsaVq5aoNEPXS0m6Pf7cn9fidFjhISkzCfie+b9GiG7
 y0Ie4deiUW8h7EAbyzd4EASqxQeLvK9/raz0AVDP5UOP0JJ9icOU1Y7CFU7NCppUZw8T
 qaelETtXwVPMZ4UOEh50nTzwNW/rESgPmhGTcaOJgTnovIwJmMOC789qCNVxu92n1ToL
 uhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8HKGn42L1eQD81RjDm43Ph9NqD3780kcISMKPXUVSlo=;
 fh=JBj4l3vrH+3MG1/PEXpdIR11cEFM3aPiDdJ5Cu8V/bM=;
 b=aCEojAOo/LwMI+6EuAQ6LiQlgfb1t5azu4aBybT4zysK+Wi4Zw0f6OE2ffCj+EljOO
 GrGEDbgeQH6Kgl+EYG0El2Z0jlfMngHE5D9mxYkxNcr9jzWfZ9GXvDwHFr+9p+ZITl+g
 go2IJtGoQx8YS7ivhSpCgaoxYGARJaGe3CUuoKkA/cKnSm6zN2vR65tkm3cRz+r49+rw
 rtJX/zbg+ppLubkSZerQ1tBYiWSEVy9ySvVUX/7YZP1DZxYv1RpEHM3egrDoWQ4el9X2
 4g8B1//KKh9gkjcQkHLU6gJj5GxHxNYLbTlmCiOQcSugQMgCMSW8t3HVegLgBgst97IY
 KpoQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769511256; x=1770116056; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8HKGn42L1eQD81RjDm43Ph9NqD3780kcISMKPXUVSlo=;
 b=MVa3v388hw/gKg8o9xqG56vg4Mgz8R8DWa1f4ULgUzQ4ayOuUD8VU2s0TJ5wOok2jr
 Twv+9pj5JN8xQSFIWcjau3h0MMpCAHqhEYfkRCMf4nKX2neUCMp4R2qAer1r2Ammrcs9
 QuAnvwFtlkk59lrxkasyt8NTAEWXMQenqaX0iLq1SsM/LIR0rtTYbJHNHRv9t0/sMUCV
 1aR4SEOGJkw3T13orFWR1t4KPe/ayyeEPPQ7645iwPmFJvyXTOF6Q8NkydCj8ObBLY1D
 7vyGDRRraKmv5oND9fz4JLGqrhMv4L6rIcgvmomd35JhDhKNtP0ZWk5JYu1epSFVLR82
 /SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769511256; x=1770116056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HKGn42L1eQD81RjDm43Ph9NqD3780kcISMKPXUVSlo=;
 b=S3Gtv6EY9x6oVORm/CwWZh7XgGWZzG60slBc2mprG2G4JmUctW2QEang4Qx4T5gxLT
 G9N8B7NH8aWevsDAM0WsC11/sYmRQ6ulD6o5MGL8Jqwkyo/ou8F2Qcz/tSkiBgquOrQD
 3KET1v0ART7VP0M2tz4k1JJF/j6JVyDqdiRltNGdzjxntvxYSUoI1pJwhx/XGR+p5eXt
 u7frgJGLst/iEn8umSVwFPkkzyVEK+cGP28o+Sf2a+ECqCQUcLCMdvJHIed8VcJA4Z4e
 oHkmmYe/eoblTE3vcltv3G1KyHrbFKQKufrPBlIqF+ZPu85hSmQoZbf0bZOIN0/S7xqZ
 MRlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuWEplzvsd+60WmhvG+hQDQI1niLvizV94LBjtXzySr4KuHkOL4yjHcNzFR4G3Ay2rMU8afLc+ww==@nongnu.org
X-Gm-Message-State: AOJu0Yz1fRKNmWvMfue/zHDjBD9HElCh4Hqy8Nq0/5dIVq0Stjzyz0Qb
 iJcmbCdbqRLW1mubt9D3Dn/ry+Ghw3G0qOvhww8xrWiwYePLDmD/SSt3s3+K63uaIuGQUQLHOjb
 Oms1UXAePuayGfw3N52sINVVlRicIPMCVw7qVZqTrog==
X-Gm-Gg: AZuq6aIWsTu5OZoAi0WW3NpnM5UUxhW6e3Oh5FK/mIJypatUG01J6ZlYL9hi5N91E2D
 mCkzO8/K0/yflpHMtX55kku4j9bsGT3sLy9VwVEqJjmbVY9Iw7Fima7oqwwX+W4kE8dpEmOXPsv
 Ye0SLWWf5I7bPa3w/QiXpcUYp46DH9oA8NsA4vjStaXaAlfOWwX3SxXZs8DiDksSvGziYAv8gsQ
 tAUzpngHynyc+JJlQIpchv9y0BtTJtaMx6HRDUFoylZj+zonYGsHvk5IOUWx79d+q1eqg==
X-Received: by 2002:a05:690c:c4f6:b0:794:77da:aa57 with SMTP id
 00721157ae682-7947ab208admr8931017b3.19.1769511255812; Tue, 27 Jan 2026
 02:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-4-mohamed@unpredictable.fr>
In-Reply-To: <20260121134114.9781-4-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 10:54:04 +0000
X-Gm-Features: AZwV_QgouyNsnR7cdRu_uKfneF5MyedjQVrka4yFl5VX7F1dHkdTrYHtyxP5Mi4
Message-ID: <CAFEAcA-GL9UG5MN5tKDzLwQ04cBGa99cSau4=2BLTs0+GGSdJw@mail.gmail.com>
Subject: Re: [PATCH v17 03/21] hw: arm: virt: rework MSI-X configuration
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Wed, 21 Jan 2026 at 13:41, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Introduce a -M msi= argument to be able to control MSI-X support independently
> from ITS, as part of supporting GICv3 + GICv2m platforms.
>
> Remove vms->its as it's no longer needed after that change.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  hw/arm/virt-acpi-build.c |  27 ++++++--
>  hw/arm/virt.c            | 137 +++++++++++++++++++++++++++++++++++++--
>  include/hw/arm/virt.h    |   8 ++-
>  3 files changed, 157 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 03b4342574..187dd4e272 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -440,6 +440,17 @@ static void create_rc_its_idmaps(GArray *its_idmaps, GArray *smmuv3_devs)
>      }
>  }
>
> +/*
> + * In the prior Qemu ACPI table handling, GICv2 configurations
> + * had vms->its=1... That's broken.
> + *
> + * Match that assumption to match the existing ACPI tables that
> + * have been shipping for quite a while.
> + */
> +static int is_gicv2_acpi_workaround_needed(VirtMachineState *vms) {
> +    return vms->gic_version == 2;
> +}

We don't need to keep identical bug-for-bug ACPI tables like that.
If we were incorrectly reporting an ITS in a GICv2-only ACPI table,
that was a bug and we can fix it. (This might need adjusting of the
golden reference ACPI data in some of the bios-tables-tests if we
were testing that, so it ought to go in its own patch.)

> +bool virt_is_its_enabled(VirtMachineState *vms)
> +{
> +    switch (vms->msi_controller) {
> +    case VIRT_MSI_CTRL_NONE:
> +        return false;
> +    case VIRT_MSI_CTRL_ITS:
> +        return true;
> +    case VIRT_MSI_CTRL_GICV2M:
> +        return false;
> +    case VIRT_MSI_CTRL_AUTO:
> +        /*
> +         * Earlier Qemu considered its=on as the default when using the GICv2.
> +         * It is safe to do this because this is called is prior to
> +         * finalize_msi_controller.
> +         */
> +        return true;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +bool virt_is_gicv2m_enabled(VirtMachineState *vms)
> +{
> +    switch (vms->msi_controller) {
> +    case VIRT_MSI_CTRL_NONE:
> +        return false;
> +    case VIRT_MSI_CTRL_ITS:
> +    case VIRT_MSI_CTRL_GICV2M:
> +    case VIRT_MSI_CTRL_AUTO:
> +        return !virt_is_its_enabled(vms);
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

Why do we need these? The idea of finalize_msi_controller()
is that it fixes vms->msi_controller so that you can just
directly say vms->msi_controller == VIRT_MSI_CTRL_ITS or
vms->msi_controller == VIRT_MSI_CTRL_GICV2M rather than
having to have more complicated logic.

thanks
-- PMM

