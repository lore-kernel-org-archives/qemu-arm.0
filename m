Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983ACCCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 10:36:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v653T-0003ln-TE; Tue, 07 Oct 2025 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v653S-0003lK-LY
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:36:26 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v653P-00006v-Ax
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:36:26 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-71d603cebd9so73936577b3.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759833381; x=1760438181; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aFYz5iQTpMav+zDYZjX1r38q1rMTDKAazHmLiuQh6HQ=;
 b=Ikneghr+xO9GAwIMK0HkZbrSKt7BQZ2XSB1rzwEyydBUmNkxzmmbUKAW3wWcXhw5EL
 AP1PHBL82Cve9rRGJbVXzM3yRpMm/iLl/0EWLm4rewbrPmxM5YUIX01D6eNrZgoldE7N
 pUl5J/QzwIPDfSzQp4FGFwLYOQfyjNL37WauhrFMCsCmqtxXKjd+b0tML6Qwf3ZKNZCA
 pzIw5VWDj1wRM4oYmfoPkd4vxNawl6/LUBog219/FTi4FhKBMW/uXYnDKIN9f5Mkovup
 ghevWWGwEU/2/sdWD/rtLew635uW41SrCHtVg/NyRwXhE7/IdUNxQXuqlTuuZ6BnGc8y
 SDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759833381; x=1760438181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aFYz5iQTpMav+zDYZjX1r38q1rMTDKAazHmLiuQh6HQ=;
 b=DJSAoQOhqoPmXkVUgw33aKWO8dB6HWZQZ7kyQUL9bEOg/inIJsott7TnPkuekC0UeR
 chwX44yLYivti+2naZ31kC9HkWXFSmdoYPhJXLNWylTb3hgVzWsQkCkPUf9QGiYLCKdU
 drrOJrvdMF+V6Rnr02cir+N3rPT4VTyEk5f7y8EDfIECI0MVXyUzmLYBYWlHS7/zMpEp
 UTjhgr1df+7JBgRrit/Y+A5b62UjPbEFaS4GjF1xwaonPWnw2IfMz+9xPlgZ4VBOdRpe
 6yfJUtz+Y6YRACzmNcgDX5sKBj/O6iiwVsvK5BXJBSGeOwcgPS3dRXb2ydwUqArDwjmJ
 gT/w==
X-Gm-Message-State: AOJu0YygwN1mexAQ7Zs3HSQejmXVbsU3QQ/NlHHdHHtbZ5e0r23jxOc5
 UXxAd6O4lPfZ8Js43gKE4Y54fej/HJ/PKKKkUw0aTLRF/tefStRZGqGNqv0udWmbgE7CwH9Jd+l
 YjRjnQdr3IDHiwnaaliP+ImlPFthTTEFc0Yws0n8ENg==
X-Gm-Gg: ASbGncsOgrTd+gRdRyAVl+1+9+NX+BcZzTMk9FTQ6E+kU9gbrddJX0umr1y8YVnhL/O
 PZ3elC0EsSCNuOPxwREgKaMmx0YkrDhWRJwKiXaRiTX06dBkjfFRFzVnL71AHykQYYE8e1ocZiD
 bYSi8rKc+QMDukyE4pFgWYGEz/xvlkL14cKoP9NNGW7S7K6pZAYKre5FaekeHGjniBL+vgDwYL2
 Ny1LNrq63adyixLSL2LXKbt4l7ItwWwQUl2
X-Google-Smtp-Source: AGHT+IE+bQuAbwXjq68kDA/qCcBQwtDyDQoQWf44W1o/eugZMmGbY3aHfIlGf2nlWgEBK5+0Zpuu0Rv3t1rzWfnTbwg=
X-Received: by 2002:a05:690e:2490:b0:63b:6290:d132 with SMTP id
 956f58d0204a3-63b9a0f09acmr11459964d50.42.1759833381131; Tue, 07 Oct 2025
 03:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251006182900.100580-1-skolothumtho@nvidia.com>
In-Reply-To: <20251006182900.100580-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 11:36:09 +0100
X-Gm-Features: AS18NWB_nX7MIs24rO0XAZ2lU6ubPmr-2VYLQphGd29Fb2BLOqnGIpxiHgf5Y3A
Message-ID: <CAFEAcA_3Vz-4Pednqd8ALW0jTmYAOgeQZ2Cfc6h9-vAqLE_RZw@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm/virt: Document user-creatable SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 nicolinc@nvidia.com, ddutile@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 jonathan.cameron@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 6 Oct 2025 at 19:31, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> The virt machine now supports creating multiple SMMUv3 instances, each
> associated with a separate PCIe root complex.
>
> Update the documentation with an example.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  docs/system/arm/virt.rst | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 10cbffc8a7..2e0e8196be 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -37,7 +37,19 @@ The virt board supports:
>  - An RTC
>  - The fw_cfg device that allows a guest to obtain data from QEMU
>  - A PL061 GPIO controller
> -- An optional SMMUv3 IOMMU
> +- An optional machine-wide SMMUv3 IOMMU
> +- User-creatable SMMUv3 devices
> +
> +  Allows instantiating multiple SMMUv3 devices, each associated with
> +  a separate PCIe root complex. This is only allowed if the machine-wide
> +  SMMUv3(``iommu=smmuv3``) is not used.
> +
> +  Example::
> +
> +      -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0
> +      ...
> +      -device pxb-pcie,id=pcie.1
> +      -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1
>  - hotpluggable DIMMs
>  - hotpluggable NVDIMMs
>  - An MSI controller (GICv2M or ITS). GICv2M is selected by default along

This bulleted list is intended to be a summary list of the features the
virt board supports; if we put more detailed information and usage
examples in here then it gets a bit odd as the list is interrupted
by a multi-line detailed explanation of a single feature.

Instead I think we should have the list entry be a short one
that refers the user to elsewhere in the document for the
more detailed information, like:

 - User-creatable SMMUv3 devices (see below for example)

Then you can have a new subsection

SMMU configuration
""""""""""""""""""

(which I think I would put just above the "Linux guest
kernel configuration" subsection), which can describe
both the "machine-wide SMMU" and "multiple SMMU" options,
maybe say when you might pick one or the other, and have
your command line example there.

This gives us as much space as we like to document the SMMU
stuff, and a place in future where info about accelerated SMMUv3
will naturally sit.

thanks
-- PMM

