Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F15ECCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 15:45:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI6aw-00069V-J7; Sat, 17 Oct 2026 11:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI6au-00063x-7o
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:45:12 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI6as-0002UP-8x
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:45:11 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6798af41644so601680d50.2
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 08:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792251907; cv=none;
 d=google.com; s=arc-20260327;
 b=ljJk+c+gXC6lNXeis7Pspvjl2oUpj3Wd3/OTIaS6WTGO+P2kzY1z/6Xj2AZ9aDtr7m
 ixcNtVOn1wfoQfOu2vTf/rK5Rwm3HuU4ii95w7cK23sxkZe1V/XYIq5SA6sG7xoOQJ+a
 6X+Rl8RdTS7QpWvZqp5tTZvAoJNRG+DVaOvR8bm9qEP/B12dyJ9O2dwEP0k86r4e+SoO
 RGHzNd+jyXLK7CUbAH0gcEbt9XU4V24aSeiguw14cZW/CrT5pVo9NpJbYFJXknAhwM/U
 lwYmY70MWwxxUmUwrXAqtgJn0ZqGgnrkraIlyn+TJ47PlxT1TpEIO8a1NLNoRpP2XnOO
 FpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=c6ehgLiCBMPM9O9Qv2+tmYJA5l4Z62uEt1Nmq6PsrRM=;
 fh=IptQtLBzyxBEEL9F9GPVAM6bzG8qELDbVHvZOORjNJ4=;
 b=GMXNnQxr+AfMTuw61tJy2Hp7UDlE9M2+fbSd7pGtO5H06O51n5B/3DEvFzmEe4OlGV
 Ww0f/0LaLDzns3Gn/A8SjEc2kaRCokmzp8d/2wZ3yAxIYmvN9svKanlvrfxuQinmUmf9
 QRcTNgZe9QB+Jj1xWJ9QB/K/ftBRKT2p5TfYnVVlt1G89P9x8DNj25OG64/MP1R+/8Bo
 ahSyRByWBv4il87s552OzAkg0AkMSAzyBQ+IQzPh3h7aCid4nvzXXFwQaRO/ie8J6vGh
 lmq2O+1D4Ye2hFJLympoNxi42xbNJOZ2uFXuK20EKnGHcwGylM69o7XG8Nay7V512/ap
 MVqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792251907; x=1792856707; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=c6ehgLiCBMPM9O9Qv2+tmYJA5l4Z62uEt1Nmq6PsrRM=;
 b=EiXCip8z9YOAMq7p8YNuQsmO7C5kaHOuQGb/Ks5kqXRGEJvdJmsEcM4w/1BMtXj12s
 iDV6Aeag1wsNo/OhI7YU1qYUuowq8woWzfhJnoJez9CV6p8KE1416PDMGJvjXohr15pB
 HsWs0O3AonUuxMuRtPSH9bOs/NGolwiDLMoS6E3FSZHH8p2vuxdKWi+Un7UPAMitHOd9
 /ikh3O4VXUBR+WTl3WdBrVLIL1xT+Ha3e/sVTVeBUH2OPVytTh0lB15S2woYsskTTZ+w
 6PYYqbYEySAv1NPCG9WNFzB0VYOb29j/PZxqy4F/9fjlaGH7TPclQ2SeslBhJC8/z/fy
 TCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792251907; x=1792856707;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c6ehgLiCBMPM9O9Qv2+tmYJA5l4Z62uEt1Nmq6PsrRM=;
 b=xcVIl24pH1iMBNra/RYqweDTCprjuhX8j4p/3uHc3dNXQPfS4J+cbzGfNru6EqZzZ9
 aUy47TSJJTtsj5JXn8QT+kzh+lGsdcb+dz6pdASx5AeWykvvZWQKEdGGE7TZxXdM6Uc6
 2hphIaemEOviIFtq9pcGC9Jg+iWxovpMmIjJt3WZrlf9pYfpXOfODqYeCH2exEd5NcqZ
 Mc4CYayu8InHHV0hmYQ1uocDk3rcaoPj7C0WGjhynVj4V9DtW5lQNDwnPJnLBzP8+pX0
 C45/x5mdeW+aPyaWw8FW8OcGpd/Y+t6L/jdnd9CJpw4qpEGtrzf+UEh9bjvBYV379t6h
 RxsQ==
X-Gm-Message-State: AFq9FYIvAprBpzUlUnktaSENsbFRziiGvD45QBcWyogWFP20fa1EQGE0
 ojYu+h5hqjTJP1vDTNlEQ319JPgb+8l/2ye0KaA1e+ORtt+s1iGu4k/L+fRXasImBvuT25uKZjQ
 o6LEt6Xidx7M0EKW794OJ5jH95AaR9OpvacU+YxgXgA==
X-Gm-Gg: AYBFou1B/6WJZpFNtZIEyTnztze9aSISipYA64rKs3FPaH7v8+SOpnP6Zz82lua0qDn
 PvlIZ7Bv35vMYCwmjDkhBt7MpthF/E/TRradqJSU4pUc5ZG40PXKbu35LhMAbqo2+JFH4jTBHbr
 foF8mxvpkUAeI4tbE/4PT7vR9lny3S0S+xe/jmg5J4e8LLhJEvipTRqNqIcrmmnVGb2u+mKut44
 FlF7qmSqdxvYiTzMh4VGsyNIOeVD051lMiA8YinpYDyGOqZ8LbrZ88/Y0etPShPBS4PgJT3rC1X
 nb7oIN3iw+2aHGdWo61ivk/uXKfzIcbOaXWYyoIScnJcyggp78cFr0WITnm+26Y7f9ExwGcbXj0
 jhSdFA28xFtWzwAgnLq2s7++jgV+cPPjAkd9Bp0c=
X-Received: by 2002:a05:690c:f08:b0:8ab:3d1d:af0f with SMTP id
 00721157ae682-8b0f21ae8ccmr13223277b3.44.1792251907392; Sat, 17 Oct 2026
 08:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250929165230.797471-1-clg@redhat.com>
 <20250929165230.797471-17-clg@redhat.com>
In-Reply-To: <20250929165230.797471-17-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 16:44:56 +0100
X-Gm-Features: AclHuK9E6vaOTj7kImr54MM0WYpFKQ-bnz8zOqwxViKhFvMMoBFKEFQspXT3Nws
Message-ID: <CAFEAcA8OKABUH8S_F4HrWLKDC9XYqWGxD5_xMAPOPmc614u4UA@mail.gmail.com>
Subject: Re: [PULL 16/32] hw/pci-host/aspeed: Add AST2600 PCIe config space
 and host bridge
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Marcelo Manzo <marcelomanzo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Mon, 29 Sept 2025 at 17:54, C=C3=A9dric Le Goater <clg@redhat.com> wrote=
:
>
> From: Jamin Lin <jamin_lin@aspeedtech.com>
>
> Introduce PCIe config and host bridge model for the AST2600 platform.

> +static void aspeed_pcie_rc_class_init(ObjectClass *klass, const void *da=
ta)
> +{
> +    PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(klass);
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->desc =3D "ASPEED PCIe RC";
> +    dc->realize =3D aspeed_pcie_rc_realize;
> +    dc->fw_name =3D "pci";
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +
> +    hc->root_bus_path =3D aspeed_pcie_rc_root_bus_path;
> +    device_class_set_props(dc, aspeed_pcie_rc_props);
> +
> +    msi_nonbroken =3D true;

This sets the msi_nonbroken global in the class init, which
is run for every type compiled into QEMU at startup. That means
it's effectively forcing it to 'true' for every machine type,
whether it's aspeed or not.

You're supposed to set this in your 'realize' method, so
it only takes effect if your interrupt controller/PCI controller/etc
is actually being used.

Reported-by: Marcelo Manzo <marcelomanzo@gmail.com>

thanks
-- PMM

