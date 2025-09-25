Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5CACAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 16:04:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1oRK-0000Bp-8B; Thu, 25 Sep 2025 12:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1oR3-0008Ph-Jj
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:03:13 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1oQo-0007yj-1E
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:03:07 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-635380a4a67so887971d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758816166; x=1759420966; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iLlFuJ+iX5wyifqNxIn6t6XU4TT5qvqEgzhS+Kbw400=;
 b=Y1knRhNe9tpGPM5RC+o0g5p6CKaxlNDRl0PYRazC9B2L5lGfeIpuH6Ipvgvb2vsXHT
 vSsCobn6ZLk/ro9OcpOtEKYczl2YAptxZ4F2yigJs1Qx6WdKgLnWHV1AyX6spab4pjkZ
 or2WlZrJcyQlQCnVG9QqcAIy8hARJeEbwQaFy/0K35onkNk6tmKu9Y3IXnBHm1SNFccr
 Hst39ehC4rR7hSsIrY4uE2XGQ0PMEFrEcm+GZ5kWqT3kCjNFUArX0oST4JgR/Tv9QA8F
 ReGJ7QfPvPhR1MmGhs+rYxou2UKVLhFUVhAjtFJTMnYfGJivhUcycvSsii5ut/SEoIsX
 6kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758816166; x=1759420966;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLlFuJ+iX5wyifqNxIn6t6XU4TT5qvqEgzhS+Kbw400=;
 b=VTYsj6IqFWgFUmpOYBbZJ1uFiBZaYQ8QujLsYZdahXpB9LE7HhM7pMoIkNjbcwjrvG
 SFApTThbaChOoxYcb8cbfvst6jFo+jcpkNGK0przMOJJ/+aI/pcIoJ8zOlFQxSUmTiBO
 je45wp9/pCx8+CA/xc8pdk0UP906HfZNspX9aqVLEbHd45YJVqWkQj873teTPyB7USFA
 ov+XA6n//vkofrBFLQhR4YWjR0XmLomoaSBC43jJrqjzINMjzSiQYT/pI0FEZG/eqn2G
 fFfG7HWbrs8JzQlDhqS/q3xsnX5e3caX57asvgJJXE+2q972AR70CFsY8ysmgxaLc3xz
 YAjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD2g6ylm1BcWUfzH5UYzj7TGJ5nrc13g613gXhI1upadAVr9wapHSwkC+C1dXOntp344SGns4Qag==@nongnu.org
X-Gm-Message-State: AOJu0YyAiW+cWw5EXL2L/flY0BLu2aosBjCsRpSO72pp2l6vfcWeHEPT
 OvNzcX/PQ9svNFhur9piFrGaoDiGZcbs/bYKyVyRDDpV3mDwvDYPt/kjMc3CrB3ovmzcqMOKeDX
 Lnri0iqdN48+SPetUiqpvRgCWDwWDvsdrKNFhlRuRWg==
X-Gm-Gg: ASbGncs93LKVkKfz8S6vU19nuRnD+teS3MKXDVqUTjWSiBjqGcMPkDbZxE/x8LOWO++
 rcfoxir+dGeNnJRxDeZgZ1xZ0r77zQIHKqoC6noaKO2Onl47N/bgDorFIIdXVvcDIkSLSZn85WQ
 rSty3qkvB2yKkVU0d4+mevHDYHUmAnWd1jR9si201ycQGBMyZMPMtBGq9NggCGOTrbdPpChJ8tT
 lwoVz1M
X-Google-Smtp-Source: AGHT+IGCpms8i93eV3XeMlurKIEORFFdZpoyUexyQ+ZgkMKXHoaliP079vOHYsZIwueY2s4NAmmS6fRd8IBm2j3Rsts=
X-Received: by 2002:a05:6902:100e:b0:eb3:8155:73d7 with SMTP id
 3f1490d57ef6-eb3815575f9mr3351111276.43.1758816165198; Thu, 25 Sep 2025
 09:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250920140124.63046-1-mohamed@unpredictable.fr>
 <20250920140124.63046-23-mohamed@unpredictable.fr>
In-Reply-To: <20250920140124.63046-23-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 17:02:33 +0100
X-Gm-Features: AS18NWD0ExaVsx4-sz2VajpoCZeR2gAFsGP1JUT_ZNYO9R7ArS7Np5PQco5dlVo
Message-ID: <CAFEAcA-45aHae+frQkq1JAHPYJH-Uu9HUOLU5VjVtEEW1sNO4g@mail.gmail.com>
Subject: Re: [PATCH v6 22/23] docs: arm: update virt machine model description
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 Igor Mammedov <imammedo@redhat.com>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Alexander Graf <agraf@csgraf.de>, Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Sat, 20 Sept 2025 at 15:03, Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
>
> Update the documentation to match current QEMU.
>
> Remove the mention of pre-2.7 machine models as those aren't provided
> anymore.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  docs/system/arm/virt.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 10cbffc8a7..fe95be991e 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -40,9 +40,10 @@ The virt board supports:
>  - An optional SMMUv3 IOMMU
>  - hotpluggable DIMMs
>  - hotpluggable NVDIMMs
> -- An MSI controller (GICv2M or ITS). GICv2M is selected by default along
> -  with GICv2. ITS is selected by default with GICv3 (>= virt-2.7). Note
> -  that ITS is not modeled in TCG mode.
> +- An MSI controller (GICv2m or ITS).
> +  - When using a GICv3, ITS is selected by default when available on the platform.
> +  - If using a GICv2 or when ITS is not available, a GICv2m is provided by default instead.
> +  - Before virt-10.2, a GICv2m is not provided when the ITS is disabled.
>  - 32 virtio-mmio transport devices
>  - running guests using the KVM accelerator on aarch64 hardware
>  - large amounts of RAM (at least 255GB, and more if using highmem)
> @@ -167,8 +168,7 @@ gic-version
>      ``4`` if ``virtualization`` is ``on``, but this may change in future)
>
>  its
> -  Set ``on``/``off`` to enable/disable ITS instantiation. The default is ``on``
> -  for machine types later than ``virt-2.7``.
> +  Set ``on``/``off``/``auto`` to control ITS instantiation. The default is ``auto``.

Could you fold the docs updates into whichever patches make the
corresponding changes to the virt board, please? I think
that's patch 3 for the "gicv2m when no ITS available" and
I'm not sure which patch the "add auto for the its property" is.

thanks
-- PMM

