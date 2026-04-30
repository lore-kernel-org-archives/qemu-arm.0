Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3179FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:40:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wITUm-0005jv-7T; Thu, 30 Apr 2026 11:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITUi-0005g6-DA
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:40:04 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITUg-0001w9-Bu
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:40:03 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64e87a81639so991962d50.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777563601; cv=none;
 d=google.com; s=arc-20240605;
 b=eNmcyooGYSdzBfAdYQxqybtjyBm1rF+WF38iQvmDOdsuba1Y9rp6bhcDA8StmVWASe
 uwTr0iVIm5yN/WzHGvBKJxs0BeGeAaRmpKArkqtoDWtoFfUrC5XL+TiLw9GD6RjLC9E2
 ULLErsyOd3Sdnzq0Yrw4maekuFBMTkH36JvAHHJzWB0ywsgWcgCnuqO7px02wixgfYkO
 CaHS+UnFfmpz8XEDm9l+ILazL8/1Kgs+h+0yIT8Ln68+ojtpkv5XRG/vWSJV7t7902xv
 H1cEvuQSZpSDbGJLfhdzrKwTGpqLZ5vpsRezauZ6a6TLaPJqEXFeB2nE4fvWpBpicnq4
 AiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ReDWy72RBwlCfXkKdQA2a7wP1OoBOa5MlmjTpVb60nw=;
 fh=5cPsl/bc2rMqjSi2Lnwp+mOaI18KTT72XS0xqClF2Kk=;
 b=c7W31+NrNgEqoycynVBiyiCQ/KYRrVjIqhD/GZqRVaaaX0cy27yb2U79dMfaOhHaEj
 8boM7CFPncI8ZwPEXjWQAIWv5F3YmP3/JARSMX1gJI16VjSAOqz3t1hgb0hm9VrRi+t/
 CPm7LdFD/FcUSNdc5VcNdH7U8cgQ7QEDRDF80FtQ6bm+JVI17veNBrHJg0uT6JrtIBsz
 uMHiKNitQqNiTQ1ZqsSsBDP7UPzvHuhxSRVAVK7rv96G3oSPGidliNGt8wwxjvd9fiel
 yKPz/yt7F/uT37XSkPyPOW0EviELDae8WIzhgd7cNwe69zmtSuQQCfMxo6sYVsyNavMv
 xLrA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777563601; x=1778168401; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ReDWy72RBwlCfXkKdQA2a7wP1OoBOa5MlmjTpVb60nw=;
 b=VwKL/nJkikvNyFYp6LoqNCS5hZOwiL2C2KoXYAYje169uarkMz39pDaRv8szXZDR4d
 4sV/ERlL6OxZWOcXp8SVJL6xG0G5MUL5hA48sDc2UZR6f3SvxJCEYmX2HenBFIfaipY1
 mJF3ua8PUnD+xvZjIyqJv+SUdPUcX09tCG91Z1+2ndKvJXy8kz1N/wkVRPfaDQIL63iq
 RpDyR/WHdJlJpteD31M+Q7NMskWvN9c13V0OzFESNuMMNIWaTZLbzp8XzRtuT75X17a/
 8Cpb69OON7wIVmOhqHnVzaat756y6RQSHNn9s9twpsUZ5yFA4pdzPntW5Hu1YsQlKVw1
 BmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777563601; x=1778168401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReDWy72RBwlCfXkKdQA2a7wP1OoBOa5MlmjTpVb60nw=;
 b=Xrat5QaGqQLFAbeuLGg5eqHwbmkEhBJX2SKisj0yn08nsp7UeQGkjO9NUuCR9s38tK
 aQxsk9HFb62SbNNBXf/0VqSpPvQDnxr1B27fKov1YrAnalE+dewv84h7sfRfDnW3IutS
 nBvsjyVkVQuKrBdzPFTQrqfS0SjVvtgdUD9PJfBD18l6o7kCLRq1ttfKb3PcTQY/rawm
 M71/plKUNzjtJnh4CH1WAxw0wszS+NUrDAKi5gOA1yZMoT5JjC32GKnXgWWBka89fULU
 jD3oLiC+UMaVIzNsHHuDZZ9TLnvg21U21/rfnAgI+XXQAfmbM3/fE7oY0vZH5oBySsBF
 O8tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+v67BQHXeBnv05TSmbzpaVRWCWZhsRAjFVIh9vlGHkiAE3SoTByqEZRM/+srysaEshSiaEGX47+g==@nongnu.org
X-Gm-Message-State: AOJu0YwCYt9TyT/HN/DvLb9Leu0sURz/appkar6ah5vfPstix7Gvqdmr
 Git3Tk9CN4zfkFGDDIK7mcTURsltl2N1NrZ3KYfXhIxyYbYHf+pzzIhFFOfubxuTOlO9bVHWggV
 xK/5JNk7i6iADwwlEZqSqYRvcxKqX9oX2pGlIfWYACA==
X-Gm-Gg: AeBDiesWxwS5fn8xoaNYRXkecR6SkB1TyJw3tHyUxKU8xxl/uENIqn/5TTFZJkA12ih
 lOlC+LM3i4MH6JBSf1wrftls295eutI5ZFhtk8z1Pp+WkM6oyhdR2tUJHTxtzVtqahwrCoCtziz
 PWP5/w8dM7k8OEZBMo9Dd7Xh5/FqfDfhBAGaPmyRpq3It2AYdRwjZp+08TsOPErAz6i7XQ2LxHi
 6V0lN0lTjX7+01+BODbYFLUTNeR46K+PBdQHNoXbTgLFhxszsOKHF6gWj6lXIj0mSE2yhpU3lFk
 3bZ8QmQWKixJ31sZ8eIPQTDDiTA6idVn3AbGefP52zPIQMXonl0GaFgwqSGRuK3MNt5C408CFdT
 eNg==
X-Received: by 2002:a05:690e:1206:b0:658:ac79:ad4d with SMTP id
 956f58d0204a3-65c18f55fe5mr2776193d50.47.1777563600816; Thu, 30 Apr 2026
 08:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-4-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 16:39:48 +0100
X-Gm-Features: AVHnY4J8zxXW6fxl_n0y_3WVqX0LkzYyp3tUTgzLovV3Dib0GiEAegikkClToJw
Message-ID: <CAFEAcA_cYDwOFP_h_pKyUQ0kKmT671iZiNntzMC5O5tF=1cC=A@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/arm/imx8mp-evk: Fix reference count of SoC object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> object_new() leaves a reference count of one, and object_property_add_child()
> then leaves it at two. This would leak the SoC object if the machine object was
> destroyed since the machine is the SoC's sole owner. Fix this by converting to
> object_new_with_props() which gets the parenting and reference count right in
> one go.
>
> Fixes: a4eefc69b237 ("hw/arm: Add i.MX 8M Plus EVK board")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/imx8mp-evk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> index b84ac91a17..cfc3038c36 100644
> --- a/hw/arm/imx8mp-evk.c
> +++ b/hw/arm/imx8mp-evk.c
> @@ -74,8 +74,8 @@ static void imx8mp_evk_init(MachineState *machine)
>          .modify_dtb = imx8mp_evk_modify_dtb,
>      };
>
> -    s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
> +    s = FSL_IMX8MP(object_new_with_props(TYPE_FSL_IMX8MP, OBJECT(machine),
> +                                         "soc", &error_fatal, NULL));
>      object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);

Looking again at this, is this really right?
object_property_add_child(...) creates the object (refcount 1),
adds it as a child of the specified parent (refcount 2), then
does object_unref() (refcount 1). Then in this code we call
sysbus_realize_and_unref(), which calls qdev_realize_and_unref().
That function:
 * (indirectly) calls bus_add_child(), which takes a reference and
   hands it to the link property on the parent (refcount 2)
 * calls object_unref(), as its name suggests (refcount 1)

So now we have the object with refcount 1, so it doesn't just
vanish, but on the other hand both the QOM tree parent and the
qbus tree parent think they own a reference to the object,
so our refcount is wrong.

I think the existing code here was correct: we get a reference
because we call object_new(), and then we drop it by calling
the realize_and_unref function.

I'm going to drop this patch from target-arm.next.

-- PMM

