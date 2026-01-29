Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79686D61020
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTs2-0007yG-66; Thu, 29 Jan 2026 10:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTs0-0007xj-OO
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:23:44 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTry-0005bv-GH
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:23:44 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-79496f0ea57so6064947b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 07:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769700221; cv=none;
 d=google.com; s=arc-20240605;
 b=aOoDAqcOQiuSz36c6fkFbJVIOVWZaFbQ0qgsYmHDQZjqasUcUU/fLbE7X6mZDBAOPU
 jWNhDeY7JosrAhuE0IULO89STECw6gbg3lKW75ypYdzScHkeR926ecp9ylT2guU+1Nfo
 1UXWNFKWkRj36QMP+6I6UadWVdRA17bbNWYvLEbaCyLJlKh+wzuXYbxEWvhnrHNEDfEJ
 jHu+dYi/ExrYI+O6Daw6hYcFLuBEHwbAzsq6AVIfw94soFQDGrds1HzQrmP1TmEqCzUZ
 2F5w6cuSy75UVtVBXR57WsE8yXrcOROdyDtB8WS6Ovd8s5TyY1scv9Dx7TwkkYSkTTZn
 qSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HGsBBVoPwOoSO4+vUaMv95px2FvM22R0jza8OCwLrdg=;
 fh=tVYo7F2c8liawxWYPnvGsG5jrLP1J+L1j6wVHHuIsLQ=;
 b=aX0a1Y+XZjkPPrpGptcA0iQC4V4qEYS11cWr2UvrqwWoSZ4kRum+zdJS9TDoHvX7H0
 EqED0ce1tXUZha+bwCUDbLZzRNgSYwup3uoHoKgMWS0G9BphPxffStpFrOEe+STVdgN8
 6xnN71vca1F8A4Azo1kRQQ2cB9XgR8NcsxS06D9WxhNgi6EFIk+phpvQ483EpfCIvQDy
 g2EIv9/ZS20PvAxBkr21MCUYlYSd6J93QcrPcnR7PdvxuqyYE2Q1OxHkXNTmGLH2o05V
 8i0FLYUlT351ifc+Vey+AWrXQqhE8D8YQFu0if0J51zyffKd81DFWZb8TNLlrfs4zeFR
 kgTw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769700221; x=1770305021; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HGsBBVoPwOoSO4+vUaMv95px2FvM22R0jza8OCwLrdg=;
 b=WE748xu7TclcfDfKrOpdFOuXFHUCHmpt1NVKFzIH2uJFPi2m4uVGGayZdPK7JhIvb5
 XNQx911Ny4jNTq0bnnI5R/8QA505FN4eHk787X/kjKv9SfEZLIMlxnIzHfxGpOWAYy8g
 z+NMR8A/lu+20jvJnMCZuHIm9mgGghk5oODjSyUMzg/edNP/CQaGGqxwPL9b6icr5/WP
 UsBlcktrPsIE/4cjHlNinyhI6R25olgzD8MNoE7T4feCSGpRXblUjl6TkRohNgD3Vwaf
 st+8Jkmwmwr/7KzLnHSm514alweQ6fwYo8xXDFmEx1GQldYsGnhEow1oK/qsjr9pBmsm
 sRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769700221; x=1770305021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGsBBVoPwOoSO4+vUaMv95px2FvM22R0jza8OCwLrdg=;
 b=C8xGShtZ7J8Lx21n03KYxWnEtyqex0Z1OBc7x/n+Y6efkx4om144XG958p5UZg3khM
 TtOpKqBRtL+dJv4TbKIpZqtSsD0737PyNDgj+MmwuSDoZDfTaMvKo5Faz1AK0fyC+MP3
 5qRZ1CL4yTp3K7G2ZBdTIphkldFWs0PcZHcQewuC+a2J7yuKsEZJgUMa6SX7APXjrtuq
 d7U/Wb5yYmkGk2QB8AvD8cD/RPaIHqVhOTmI46HHAws0jKKeAcrNbDSsGGydgUvbCwnM
 z9Mk4LSwbwEJJdUboTBLyewOONb4gp1rzDqOBjYPD/d/zaK1b9hY1GDX/xtVjm4bEfwC
 7eqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPOKTOf+rVDxoFuQ9JVCO8D7g+eFFL5sSNIFmKgkK1mrJ7iL90p+BmRc5fF/2piKSBmuGZHd0/6A==@nongnu.org
X-Gm-Message-State: AOJu0YyK/u5ccixx30njAq7CqHlGSLSyMV3tRb15c5YxpyIjaDNCLWxX
 zDciALoDXsmBxtAZGZoaUPgZWesBV/3TDLR+BIvNP8r8Li/80uz5zgF5sPTYnhSB0NiJcIPJxL7
 KVaacTSwDwmKhbKLqoD4OEi+cWkQHqtBWbW8lflUjxw==
X-Gm-Gg: AZuq6aI2M+2x+VE/Kw1hN84qpziH/10jUIe/1YdBLpuQWdaaMCzSmwAE1KsTJKtEczH
 Hbh1K2Zqd0cFgiV+FxgrWWTNnowxCWgF/kLjQNzo2Vg935ej/mAzPkoi6laiVVTUyfTcrN/830r
 lBkAlLguZi4zY5vd13OvvcBI8Ivgem/nEJUmYCZIczRvIzdQzsl0vN5LR22+1bT15od+ZZEJ/k0
 022lbzxrFHKtq1IorUBKzxBUcmxYSxmN6yXS5gn5TUesb4PgDD2TaUalFzDtS7Z2Kg9VQ==
X-Received: by 2002:a05:690c:5609:b0:793:d0b5:9bcb with SMTP id
 00721157ae682-7947ab4127emr53311227b3.24.1769700220783; Thu, 29 Jan 2026
 07:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-8-mohamed@unpredictable.fr>
In-Reply-To: <20260127182805.73212-8-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 15:23:29 +0000
X-Gm-Features: AZwV_Qi6JHi-PlV0zbQOn9dWM1cACeq9E9hSqMK1cT3rLe52xaq93XWs8ti5UQk
Message-ID: <CAFEAcA-AFji3sUmFV7+vj+UVj7asVdPJpnPt01zS07CkncYD-w@mail.gmail.com>
Subject: Re: [PATCH v18 07/22] docs: arm: update virt machine model description
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Phil Dennis-Jordan <phil@philjordan.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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

On Tue, 27 Jan 2026 at 18:28, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Update the documentation to match current QEMU.
>
> Remove the mention of pre-2.7 machine models as those aren't provided
> anymore.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  docs/system/arm/virt.rst | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index e5570773ba..3799d2237e 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -41,9 +41,10 @@ The virt board supports:
>  - User-creatable SMMUv3 devices (see below for example)
>  - hotpluggable DIMMs
>  - hotpluggable NVDIMMs
> -- An MSI controller (GICv2M or ITS). GICv2M is selected by default along
> -  with GICv2. ITS is selected by default with GICv3 (>= virt-2.7). Note
> -  that ITS is not modeled in TCG mode.
> +- An MSI controller (GICv2m or ITS).
> +  - When using GICv3, ITS is selected by default when available on the platform.
> +  - If using GICv2, a GICv2m is provided by default instead.
> +  - When ITS is not available on a GICv3 platform, a GICv2m is provided by default.
>  - 32 virtio-mmio transport devices
>  - running guests using the KVM accelerator on aarch64 hardware
>  - large amounts of RAM (at least 255GB, and more if using highmem)
> @@ -167,9 +168,11 @@ gic-version
>      with TCG this is currently ``3`` if ``virtualization`` is ``off`` and
>      ``4`` if ``virtualization`` is ``on``, but this may change in future)
>
> +msi
> +  Set ``auto``/``gicv2m``/``its``/``none`` to control MSI controller configuration. The default is ``auto``.

We can be a bit more verbose than this. Compare

https://patchew.org/QEMU/20260120180339.1416328-1-peter.maydell@linaro.org/20260120180339.1416328-5-peter.maydell@linaro.org/

thanks
-- PMM

