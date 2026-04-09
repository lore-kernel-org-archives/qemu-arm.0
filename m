Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB35EA3C5E
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 13:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAprG-0004UM-V3; Thu, 09 Apr 2026 09:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAprB-0004Rv-Ii
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 09:55:42 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wApr7-0006IO-J0
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 09:55:40 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6505ef94043so943818d50.2
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 06:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775742936; cv=none;
 d=google.com; s=arc-20240605;
 b=M1kWpYEPx7HeGn/FlPb6SeQexsxeVEUZrduxpVjuA4KoJd0DQFFtnnvbkUO6Pb0KNU
 C7oej58BQNYEeS2sVEki8JAhFzwNmX+s4NyYaJiHusMBNFSmezH9OulGuB9pWaNUIkaS
 TqrYC1uRK45PbE7yFzPMDSP8Zlcpq9zxmK5oKjeSK7g0z7IFXAWhUyoJJVsx71tfFS7N
 kQ5J9ACeU/WenXHH57rw/nDqf7vdCEZUjLQSDjdjYnj3uva9tjPWk5rMXWshKiy5fwRu
 3StqzB+qeSFoH5Xfq7bBkeSbLqCZgk6TlDO/xWuziwq4EXLp4Dcvaz5jV5APqv9Rt0H9
 uTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QJ+EQolA+gxK+KucAm6+lcjEO5OE7AOFOMhamr6Y780=;
 fh=sLdZR/fQCvNRGyOAcWgvKlbZm9cjxBuWzXi6bg5P62U=;
 b=doCrL5uuOaSoyMRY3AYG3bhNTNqkdmcsM8zGuLHzT/JVo45P0AeyZjlq/+QEaQFZAa
 Gc5OfN6RA31J/RGg9RC2R4r5Ii3mQokNvQHgkg3N/feu2Mef1xpWdoccjoU7HANj5W2+
 6HJZoC1X/mQG0m5/0f15ICtK2PqOjNUxXGDkspDA8n3nvrpxKo1Hz5cXtvRP/bgyUemJ
 BCbv++ayrtzaDYZxRsy95QdZQLwZEPX5zdAW/pb43D3SL25FZjO3M8AmfhwKsAgNzfaO
 uKjxEOTyk7g6tkHyEWigbzBNDpLdOQgeQ/k2juc3+K1BlA/xvJqVQN4Djrk8H8hP6eFJ
 rOgQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775742936; x=1776347736; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QJ+EQolA+gxK+KucAm6+lcjEO5OE7AOFOMhamr6Y780=;
 b=XAg2UeqHeyR3p4lQSXEHitNmaTqVz+1MkU1X9e1BSFjMx97XunxRoHqiPe17tnJcBX
 RNtxVXHvRxH6qqBYuz8MG/iTioQ/hz11qHeF8L+hUQ1NsuxWgto6v/dp47yqWNnCtRMz
 NP+iHQsmaZ6NvHYCQEd+fcUviFIGGWPv2c/gsf2zCorSn7ynCQqlSbbfY52v5hfvHEgR
 JFdp+C0+Rz4iq3AAZVNnoVF/rcazfg4d8N8Ngy1eQpEqg1eE/OXFk7qE5hreOdgWoI/N
 gDgefACMz8LoNkuqja1YhA6y7sD4ZUuZPfeUfdGlruCsJsMIr+BZ1/PXbzZB+lrY0cXb
 lRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775742936; x=1776347736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJ+EQolA+gxK+KucAm6+lcjEO5OE7AOFOMhamr6Y780=;
 b=nMEnj8dZcn5YfMUrZTCyESY2EosHwPKIBymgxpD3gkOcxAJeS+BkeaNa4JE8AXTjcK
 gVrrmfErroF8/SPOay8OxduWKAJr64/52jop9Z3Iq/nW1EWWO/IKWR2L0lya83uOys6X
 KN8VoB/CJQ5eo86q6VGimFfINMKaSoL/57oTk1ZMF+dNvL/p6RBICFMG+v5q4jW+NUzI
 zF/83+P0jYhkw0vu+nJ9KSkz5hrJIlF+ZQF5ATNvS19308gu1cqjEWEd7oUZm+V9bIo9
 n8EGybeL0v1FSGCTDv+hNYGmb3fDHNM8umb9fjoJS3zAW4eTbwk540wFDcmQDTN5V5m8
 Hp+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ0rbh5pqASApEPJmuzxDNrPEsgu2RroCAPDw12B2m2k32QZYC3cJ+xRJH6MyL7cF9SawFys714g==@nongnu.org
X-Gm-Message-State: AOJu0YyltmJy/FlCEfWq07KcuakGmaaWOPs9RBXDvmwBOUeDDAeE+k/7
 gMcnG2dMnQPffIPhU7RgHuX+mlVFQXcyBQ4qR6+BQfxPF/R6V6tI2avhBxFszhIQD+XcTKbt6Gm
 m2QbWi0gdF94+8wBEanG0nvVoNKWOWKWOc0KmwKGqaQ==
X-Gm-Gg: AeBDievkWGTfMBd/ZDEliscNwuLR4dlrZiELEgFgjjbAKl9pyxZ/iaRnm3gDhr4qC4g
 n9q0Oj/DNWRSFy4lcTWGOAviwRpRwC+uyYEKywg1Ckybfk4wu+PjyWhIwN6udrFzGqSQLAw4TsR
 cPJwniFYYeWxHHxjQXz5czU+RtznrHT2bvQuRwnOiLQ2iCPZgHyhu8y3IgMPb4r8yysYFowOHOr
 MBE18UWa9CULWlFFE5R8gaX7ULP04huoi7ipPt9LZJX2Yxp9Rn/HYeZ47t3FyIRpr9Lvs/kEQ3i
 iHCseURt9BhqthWopPtHju/S2rF1P0CMFGMnYX5QavIcFDydQoAkcPXs2BcyjzHY4Ws=
X-Received: by 2002:a05:690e:4802:b0:64e:b33b:c6bb with SMTP id
 956f58d0204a3-650486bfbeamr19599444d50.5.1775742935953; Thu, 09 Apr 2026
 06:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260303143157.80437-1-1486344514@qq.com>
 <tencent_AEAA700C0455D77E3FEC6487B62AD68A5108@qq.com>
In-Reply-To: <tencent_AEAA700C0455D77E3FEC6487B62AD68A5108@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 14:55:23 +0100
X-Gm-Features: AQROBzBk-kks8sJDKqjyx1tZe3d_n_w-CRFGep4dQ99Gg3ZLxl0iLmGw-530S_A
Message-ID: <CAFEAcA8JdxA0V6i4nkEDhWAG+yt2EXiOe+ourHHSjgWSSTU8hQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/display: Build i.MX6UL LCDIF via its own config
 symbol
To: Yucai Liu <1486344514@qq.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jcd@tribudubois.net, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Tue, 3 Mar 2026 at 14:32, Yucai Liu <1486344514@qq.com> wrote:
>
> Introduce CONFIG_IMX6UL_LCDIF in hw/display/Kconfig and compile\nthe device from hw/display/meson.build.\n\nStop compiling the LCDIF source from hw/arm/meson.build so the\ndisplay device follows the standard per-device symbol pattern.
>
> Signed-off-by: Yucai Liu <1486344514@qq.com>
> ---
>  hw/arm/meson.build     | 4 +++-
>  hw/display/Kconfig     | 4 ++++
>  hw/display/meson.build | 1 +
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 47cdc51d13..59ef60946b 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -87,7 +87,9 @@ arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
> -arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
> +arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL',
> +                  if_true: files('fsl-imx6ul.c',
> +                                 'mcimx6ul-evk.c'))

This change is unrelated to LCDIF and is only changing the
line-wrap -- I think we can drop it.

>  arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(
>    'xen-stubs.c',
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 1e95ab28ef..b3593fe981 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -25,6 +25,10 @@ config PL110
>      bool
>      select FRAMEBUFFER
>
> +config IMX6UL_LCDIF
> +    bool
> +    select FRAMEBUFFER
> +
>  config SII9022
>      bool
>      depends on I2C
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 90e6c041bd..9b0b1ddf63 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -11,6 +11,7 @@ system_ss.add(when: ['CONFIG_VGA_CIRRUS', 'CONFIG_VGA_ISA'], if_true: files('cir
>  system_ss.add(when: 'CONFIG_G364FB', if_true: files('g364fb.c'))
>  system_ss.add(when: 'CONFIG_JAZZ_LED', if_true: files('jazz_led.c'))
>  system_ss.add(when: 'CONFIG_PL110', if_true: files('pl110.c'))
> +system_ss.add(when: 'CONFIG_IMX6UL_LCDIF', if_true: files('imx6ul_lcdif.c'))
>  system_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
>  system_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
>  system_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))

These two parts should go in the preceding patch.

thanks
-- PMM

