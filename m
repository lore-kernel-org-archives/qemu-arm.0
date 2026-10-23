Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE7606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GG7MMCE+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKBQs-0003v9-Sw; Fri, 23 Oct 2026 05:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKBQr-0003uZ-CH
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 05:19:25 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKBQp-0006Pq-Qp
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 05:19:25 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ad98c3fb15so5620337b3.2
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 02:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792747162; cv=none;
 d=google.com; s=arc-20260327;
 b=eSzTrLubkCDGsoZlb0/SNmk829G4BV5kS7h+Y+ugBlFsKAxKhdxGIaSrrDfL7h/7Zq
 CSE2gVJvVR5+90VutARJ2s6aGlh3Px641EhQkl35/uHKoDgGWoO6hGmBI9pIJH06skRi
 61v1tE6ExMsCFv74/Y6Zg+Xv7KEUg6spG3b5qnHlCFGfE4Ec2GFxRdZL5qUKOYN4mnlp
 M6jfwtH1/aR4gvAiHV7Z3EYgdxCqBI7WhPmU77BpeVM90OZ7Ubvq2z5iXxvloVrMRBSe
 Ff0hN/JLfOUQKX5jrmacOn9eXvYjmACg7QM2xe3iWBtG+/szQ1dZxuvEilzZQlc6Zk7X
 zQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mLqfpqTOPQxPIyRO3AiO/z+XRCEOzHjSsl/ENke+obQ=;
 fh=kxVC4Hj1G95zQNwZq6pW+5jMAVpMEgN8Hb+wWNWgypY=;
 b=EW7Z4CcCG13orqWpVjxwvblKgUrHIX2mrE6E7prBg9EVt2bbnt7VNPAVMNbeUYUcJ6
 kQEmg2Ln7hXt/QtvzwY3SzFla3YtqrYqxDdBemCsjBdHUKMSLDrygqM9/EKj32ziRCAy
 XlRAcZbSSalOiPxqFArBcbWuGJtHXojnB//UVu7xsyr1g6zPV7fToAdT+aea6XQt0kuZ
 Wfa/MWxhqTDenR8R16yukpf5hpCL34lSHAheVZeFFAIsE+nb3AQlozuRhAi1w2B9TOzM
 3yGoJTaR2FD8casqE3SKwmklhXn6mB3DbVDmC8oSNu7ZWKrVI8RvjkXciSE6//Qgyqln
 9ZJg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792747162; x=1793351962; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mLqfpqTOPQxPIyRO3AiO/z+XRCEOzHjSsl/ENke+obQ=;
 b=GG7MMCE+Iy8XQ9JCC9Luf1h4UU2HydJFfyRZqC1iWUg5/cfYDM7uYXZzRt8l2CVWYh
 dTWSkHOrhgyjQytDzaCgnM6SdvdEYTMeUZDXvyK9OJjKhl8eou6yMv2ots3ezPYtU0Mz
 oeFEYJ3uawUn1r8+wOtiaclFqYvxY3qW+0j3I+MDZzsTmSk5T/nyWJHMuyrW801EEmts
 AXUCeBy51w9VEu/oiEbz4HpNXnZRca/uHu1tZi5CqLtXT3HQBRJdGrhl1YiQTS54FkVe
 5gQHCxz7Deepzw2IAud6Ody60NgzxpEmPPKyHoczU9vGNci1nbRc/2MZuLknCvK7bGfa
 tYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792747162; x=1793351962;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mLqfpqTOPQxPIyRO3AiO/z+XRCEOzHjSsl/ENke+obQ=;
 b=u2+uStXOFx0u1lmIaiF26V63FWMnlbtgBXLb1tom11Y7KabsPdy9e+la94Ug76FQ1V
 o4KkK2a6s5GV/Jab5X+8TkGQCI2L94AnV1AaWpdUoy9kCAmroHPQMfejnr03Bogc0J5W
 /nATQUsYG6VEbnVUfarphAjea35N1k3ghmAktUgFcCmE2OC4vqkDMS/ONZAUrFMDU6ZP
 +wRMb0TOdrUuTrNOp+dodFdHoVMVv3g9qgtHUPByvJnsq+/43f7gpOcg/Vc1CfcDD8VE
 hu2aj4OnBEZ8ShjzmtfSVTLESxsYHCbuEarMNocmkSZyEHNnohFJZDB1QIpKb5MKTSLb
 tvTw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxd5QucykL62HFUM9iqcNzNbeLpslXLklxqYaIbxCvkYnp4So+z2wgRP1mJjYsDNSQETzKtTpBihQ==@nongnu.org
X-Gm-Message-State: AFq9FYI75MqXPNSAEKtkEdMC6ZrELn7qdQYrdD0794OIbFbU27rX+PBu
 OkUPYoogSpBHCX0rQHejOwET13pfxSDmHTbELVtQ0h0FsPVrTnq48ZMrHOLcPqEDYrOJVQE6lHW
 C/PzfQBmUH1X7jaTnaVf2D016VMTsySJgtoMd5RYfCA==
X-Gm-Gg: AYBFou3pHz1qVkLAk9NL1AAmWmLqwHuraU6v3vUAVMr9ZKQimbfFHshO3aneM5hChKz
 wLa2uaUH8L3HQgdIPwm5ixjZAZBxyVdD1g/RGYfv47soe2Vn51MgkyrMC8rATK121wdzRpi6bB6
 1hQr2kLmQHZsRgqjVya37DgFasyrGfur/Tv34PhHVpjeBmkSZgEnRzAfRIytzLTpHyzT3ShOgGi
 YK3q/2TQFLX0iLKJMFe53+idgsZ4O7R1bbr4JyTzLvugiQUVclXGmmrcFeC6ONXy/g4jrfuKvJc
 xVVDUJytpD32JoeBJWng6vxeT9pIJRwm5Lj5F8Er/pT6XwfxfBw9D+nZMJXohTA/kYyxfknqnLp
 ZOx4ErGN/bzU6mK5zWHylx2vtpIPHJQZzE3b5H6XEZNr3ZvEWSbqi0Lw+OPz3LQn4y+Ezvu2BGl
 iCVBup/pNnTwJK3wuk4dHEq71zlwUxqtJIvr/00Q/new==
X-Received: by 2002:a05:690c:931c:10b0:8ab:436f:6e77 with SMTP id
 00721157ae682-8b157efe2c5mr11345257b3.55.1792747162229; Fri, 23 Oct 2026
 02:19:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
 <20261018133603.64323-2-marcelomanzo@gmail.com>
In-Reply-To: <20261018133603.64323-2-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 10:19:10 +0100
X-Gm-Features: AclHuK8-N3SG9XLv1gseGM_K2U08QRXMVp2e716TWDPfUVpZ67YzVobHzRwF4vI
Message-ID: <CAFEAcA9Su3o0GdJ-VzkXHfx7eXYrsPU6E4hqn8SDMEinOKt-WA@mail.gmail.com>
Subject: Re: [PATCH v4 01/17] hw/arm/bcm2838_pcie: add BCM2838 PCIe Root
 Complex
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 14:36, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
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



> +static const VMStateDescription vmstate_bcm2838_pcie_root = {
> +    .name = "bcm2838-pcie-root",
> +    .priority = MIG_PRI_PCI_BUS,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .post_load = pcie_cap_slot_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(parent_obj.parent_obj.parent_obj.parent_obj,
> +                           BCM2838PcieRootState),
> +        VMSTATE_STRUCT(parent_obj.parent_obj.parent_obj.parent_obj.exp.aer_log,
> +                       BCM2838PcieRootState, 0, vmstate_pcie_aer_log,
> +                       PCIEAERLog),

What the heck is going on here? All these parent_obj things are
definitely not the right way to do this.

> +        VMSTATE_UINT8_ARRAY(regs, BCM2838PcieRootState,
> +                            BCM2838_PCIE_REGS_SIZE - PCIE_CONFIG_SPACE_SIZE),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +

-- PMM

