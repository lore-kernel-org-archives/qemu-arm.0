Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017FBCCF2C7
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3wD-0002zd-Bh; Sat, 17 Oct 2026 08:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3wB-0002zJ-Im
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:54:59 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3w9-0005a3-UV
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:54:59 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ac8a2ac52bso8296747b3.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792241696; cv=none;
 d=google.com; s=arc-20260327;
 b=S8Jyj7UsEK1ifCSXl0FwEUeyXZCbkxWm23bQRFCEIfWRq1C7g8sYaXUSRJ9qeKxZGe
 R6q8lmBm71GW/uoSN7yEE/7Do9Q21b7WZlz0pgLSukUtA4U4VkXQklZ1sNMgzmRzbfgC
 n8cBJOyxHDCgLaeoMZ5YFyUi0+6ZpnCTmZIV85bQTL6CYLS4M13FuCNpX6hdjSxnYhN8
 RCg5WPfe2UWN1i+J3wjESV/aHoNuwt7GoQwjgx8gR0TJ1PewEqn2qAVc6Fb/+jtv1VZf
 iXQ8qxfpIHzfz9fHItkPTzMi98qgn7l9/8sTVgfoYcJ9NJ7uCZpxnAkis6pFCkP5gBu1
 erUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=c4h/k0zYSPigK6KUfZ3N41/XzKXVybJXmD03MwaLw7E=;
 fh=gDFmY2ZTukNENEfYbmBtn8EEDu9UzNLWZd+5PyuPRmI=;
 b=pa1F4f1I6j+PlxQPBfvCsr3kVsIIUae3rOcK3q8QSHM2vVX0VbKt5Yzi8ODATXk+xr
 mz3bTHzdGIgXZIq68q7wc5QUdBEFRPk7dB7rkDmTi0gzxmYjj6pbbYs0l2BUKzTkv1rY
 3FKBXAO6ldnlmwmWwqRMxR/CwuAk9/QUQ9LPUvJLR2nmVU0qRgr8hzsEmpHT7Rcry78e
 4Tr2hekU/4qhHKRaIwnI6Oy4jXz9kotvlZvTp/DwcDEaaMf8ruVMZlaEvcTMltE4UneW
 4uXDRNIndo3JkufT7NZ0QAAIQU/rNATKkgn4QJtUTnt3W/dOJaLr8Trd9IiKnrqOiDdr
 KaLQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792241696; x=1792846496; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=c4h/k0zYSPigK6KUfZ3N41/XzKXVybJXmD03MwaLw7E=;
 b=JZtXq1NjaRELNTeUJduDMXHNzVaAejb89IoDvq80FZfmiXSOAeSYyUl/OTQaCb78T3
 LpmBLy88OzpBnuhXBns6/HSnxqF2n03d9o8EYmmau6rwx9ivSX5KXGBSt/fi5XBnNjmj
 pBjIAO1p/zZhJsY02HMMf8fWxWstDc9yakU4l9tdidsUBI9bUo8Z/Uj8AhHbkqeoM+EU
 22eGkkS1MENTlmkT5if+x1yO8UPhDj9X+yGk/kZBxbv8C2GUkF2FEveNn5CyCh0vBcvL
 7oYXpRjDEeDjsa7P78We9V9b5QIvMjFQXvicOOFliJSJUnWLkiEGjhC/RhgqTfeym8B1
 t2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792241696; x=1792846496;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=c4h/k0zYSPigK6KUfZ3N41/XzKXVybJXmD03MwaLw7E=;
 b=V7PhNpC8BUnK+YWdA0TY0s9Kk0hyDb7KzV6+monGtjLIjVOWomhtMH153wmMnSHTMQ
 2LQHjDpk6qYtW+fOmgNihHD5+qlT+CRuSq0UsT4yCURWhrHz5nSiuAol9Idoydz9sgdS
 a+xOv/kYOTlBnnirJw60TcwTOWEPzGFxg7ySuN3VMo6gYogdp7zf8JNhT6VyZhccxI6a
 hWwppTaoGk54ZMiNkPKB7ilzxLzPEUbOHG2YwdRzo+l6Swe+WOnhHvgZUpA17c46ePE0
 i4NV657BK4uqlu5RhO8OCGUUEV81ezur+o6gPp/F/HVSXgM+vr/Opn2QUVfVfXhKUxuy
 BFmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz5s7HKg5GGOtcjQ2ePlKmXfytm3ZxIY8HxiQp6dPVl3MtfqCar/IHSHQUNjfk6gAo4JfyganioZg==@nongnu.org
X-Gm-Message-State: AFq9FYKvKK49lxe9anVy88U5XiRvq6F7h9BBv/L+OL1HUQwbYo4i6dDp
 ZsasRh4Zxd3jrXdq09E3pqM/UvoTVbLfMX7lpZBP/xs3FEUyegGVIqaluA6WD6Ja006lm9gFtpP
 zvwCq4sxtIoaZOpLNSrwNuu/Z4abYv24Z1rk9zOk9zw==
X-Gm-Gg: AYBFou1vq6ryM2JJUUXi/CjZZSlHDuuN0zOTkvlKJ4H94j2UonaV1hjqaUahtU1PLpb
 UUF5ZS4G5TDMaUCNVqyFNsCtcDPdnQgBUnUUaHI8MwAAOsGDiGiLox59VynvT2ChnXBviNWeLTi
 tK2maam7Sa8oG4sFZuvkNTPlVl70PkCgaxpVUIbq+EJCCxp8LuWtbc37xHHRkuaViPElSTMCpk3
 bOaJAr5ELtccjk8JzcsqQsmSdtvLEA7mWX8K5UnGNpJnT2HQmR4HueUFLoEKHLjtBCvDCdCrSvc
 509y83vVvP6gsUdAQa95H1sWEQj151mT8prYurB7SJ3D54ElrCbIhXTdOWE2TGX/F6KdvXm4SQ8
 6Rh84AVJaVBVlbZucnfnH+z2hD6SFeDJXE8+7EhM=
X-Received: by 2002:a05:690c:4902:b0:8a9:8744:c07d with SMTP id
 00721157ae682-8b0e2dbee67mr21206177b3.18.1792241696397; Sat, 17 Oct 2026
 05:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-2-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-2-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:54:45 +0100
X-Gm-Features: AclHuK89gsivALYZyQoZU2dGrjxzWXbVXXVLuGcI-1x7xzbSHwLa8ohVELMMXLU
Message-ID: <CAFEAcA-r5n6X-eEcnnHUaVrwg9EKmLHJOxPjnuodOtmS4Xq8=w@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] hw/arm/bcm2838_pcie: add BCM2838 PCIe Root
 Complex
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add the PCI-facing "root" part (D0:F0) of the BCM2838 (Raspberry Pi
> 4B / BCM2711) PCIe Root Complex: a PCIe root port with the vendor's
> device/vendor IDs and capability offsets, not usable on its own
> without the host-facing part added in the next patch.
>
> Adapted from patch 13/41 of Sergey Kambalin's "Raspberry Pi 4B
> machine" series (patchwork series 829638, posted to qemu-devel in
> 2024 but never merged) against current QEMU master; the surrounding
> PCIe/GENET networking support for raspi4b was left unmerged upstream
> (base scaffolding aside), so this and the following patches complete
> and debug that series to get real networking working under
> raspi4b.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  hw/arm/bcm2838_pcie.c         | 82 +++++++++++++++++++++++++++++++++++
>  hw/arm/meson.build            |  4 +-
>  include/hw/arm/bcm2838_pcie.h | 53 ++++++++++++++++++++++
>  3 files changed, 138 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/bcm2838_pcie.c
>  create mode 100644 include/hw/arm/bcm2838_pcie.h



> +static void bcm2838_pcie_root_class_init(ObjectClass *class, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(class);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
> +    ResettableClass *rc = RESETTABLE_CLASS(class);
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(class);
> +
> +    dc->desc = "BCM2711 PCIe Bridge";
> +    /*
> +     * PCI-facing part of the host bridge, not usable without the host-facing
> +     * part, which can't be device_add'ed.
> +     */

This comment is supposed to be next to the line that
sets dc->user_creatable = false, because it is the rationale
for why we do that, but it's got separated from it.

> +
> +    resettable_class_set_parent_phases(rc, NULL,
> +                                       bcm2838_pcie_root_port_reset_hold,
> +                                       NULL, &rpc->parent_phases);
> +
> +    dc->user_creatable = false;
> +    k->vendor_id = BCM2838_PCIE_VENDOR_ID;
> +    k->device_id = BCM2838_PCIE_DEVICE_ID;
> +    k->revision = BCM2838_PCIE_REVISION;
> +
> +    rpc->exp_offset = BCM2838_PCIE_EXP_CAP_OFFSET;
> +    rpc->aer_offset = BCM2838_PCIE_AER_CAP_OFFSET;
> +}

> +struct BCM2838PcieRootState {
> +    /*< private >*/
> +    PCIESlot parent_obj;
> +
> +    /*< public >*/
> +    uint8_t regs[BCM2838_PCIE_REGS_SIZE - PCIE_CONFIG_SPACE_SIZE];
> +};

If this is register state doesn't it need to be in a vmstate
struct, or does it get migrated some other way by the PCI core code ?

thanks
-- PMM

