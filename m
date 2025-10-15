Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE7CCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 03:05:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8roo-0000An-8j; Tue, 14 Oct 2025 23:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8roa-000085-6C
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 23:04:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8roL-0008SG-KD
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 23:04:34 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so12289338a12.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 20:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760497456; x=1761102256; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVsr5GB0VRiKOkdxbOkd6pGSyHcGmpP5OKM77x47VP0=;
 b=nAcRK8E/DJDBqDWkhMkXHShxLXWRgZcNihH1Vok3RkLR4DsyyArzdLk2DQGEyo5OYe
 gR/tIMSZl5LdO7DzgAFYd9J5eMPFEcQLWnwXSQCNfGuhg/RQHT5ldyxsUnYfaoNPEhdL
 72T1/1S1Egm2xHp5Mb6rLcsygyMiW4YxiSOwXFtZpISjw83AnwbVLHgaly41Nro9pSCi
 QgwvJdVqjccYzRq9USOzuFwL7edhOBUoPYh+GdONhkVhm++xn0AyqqEIibSOKBpE6XAq
 kZkYsP4I99B5ZvVJjFd8CoA0mbfG/in7XKvhicQ7S7h7q/7SpUCbOe9JoVxExhD+nUDb
 ESag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760497456; x=1761102256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVsr5GB0VRiKOkdxbOkd6pGSyHcGmpP5OKM77x47VP0=;
 b=eZ88gl8m8PVj6Li9xQSEU8poMNCnWtYOcyXzsfaefF4qr7ACwo9MpjfUjo3MgI/qLi
 H1vPABFlE/ZFU8O+fduMT55ezVGI2rcxDZ78/Mtbc9fDNCitd6rIkbHm73SixjkPzjgq
 t4z4KMQBkNO6VmWlHbstOSLr/x4Yk5TbIg4nPYZczKVDt5B3+UyOGeMjnVD8cyPpLwnS
 9/TaMT6PoDIa1+SMPb1BIJrAk8lt+OBb6KRUASXljpHZwu2OA2aS4ugjPK70pWQL7OyM
 VrX+qqX+sSJM5/Hg1qh1mXVWF+6I79Sbs3VdkOW/dnOEJqcRA6jVXzqLXrAxBiGd+uGa
 /4lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTxC1AHkCkZQN1t2k0nKF5CsepF8ztAPmjgsfs77+tzZwB4jaApOmUb0oNait9yLB4guSTvLYOyw==@nongnu.org
X-Gm-Message-State: AOJu0YxiyIIHPoJpZwnVj36J3p8eSC9aRJ28jFFENR1J24v98PbJ+tZv
 G2QY1cTiYibVm5Lu61kPfvJ5w91OcORxPGmVYMiMQXiXxVkWEZ1HUC6Sj91S9uwuzeqOU8loyBK
 YPUfmjKiYM1kXxnk7M8NbNBJj7uPGs+c=
X-Gm-Gg: ASbGncu6npOvptQFyV5Xwa0mluPkNtPAa77dxTcRW342ZPkb9Xg4nGRfvZPzUg9Buny
 3xdWAZcaycvwg/cUczqallythOV3tGcOhC6zoBYqxYVabqNAZQSZb4Z9KbSZW3N8hBw0503yu5d
 zhmCjI9bs4aVZWnIy/A+D2+m/TAsIhdRHzMvcf4pP1J/ufPEvxUS3iTgX39uQJtyP1UtxU1leiZ
 3HrHS4M6mc3Cv51Ys/K5TLKYp8bbG4/O4prI6BJi/EvEynlFs9O1I47tncN5UBLbLg=
X-Google-Smtp-Source: AGHT+IHvkG9cjwFmvDVdq10v/nPsBJLWpvQpCEdkDUzJUdiZ84B7RkTbzdks46hNWWl9Nu0+Rd3+g5FSCTVyJmsKOks=
X-Received: by 2002:a05:6402:5244:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-639d5c3eb8amr25711387a12.18.1760497456213; Tue, 14 Oct 2025
 20:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251004200049.871646-1-linux@roeck-us.net>
In-Reply-To: <20251004200049.871646-1-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 13:03:50 +1000
X-Gm-Features: AS18NWApnYh0fWjWmq3EcC3R_qAdfydsH3MmvqQxgVVddViALQzB1G3qV-TdmMk
Message-ID: <CAKmqyKPQDUjQPgzfpcUBSEZ=y1Of6dcrWBj8e6cBhHUH8F9Kng@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix Ethernet interface support for
 microchip-icicle-kit
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sun, Oct 5, 2025 at 6:02=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> The Microchip PolarFire SoC Icicle Kit supports two Ethernet interfaces.
> The PHY on each may be connected to separate MDIO busses, or both may be
> connected on the same MDIO bus using different PHY addresses. Add support
> for it to the Cadence GEM emulation.
>
> The Linux kernel checks the PCS disabled bit in the R_DESCONF register
> to determine if SGMII is supported. If the bit is set, SGMII support is
> disabled. Since the Microchip Icicle devicetree file configures SGMII
> interface mode, enabling the Ethernet interfaces fails when booting
> the Linux kernel. Add support for clearing the PCS disabled bit.
>
> ----------------------------------------------------------------
> Guenter Roeck (4):
>       hw/net/cadence_gem: Support two Ethernet interfaces connected to si=
ngle MDIO bus
>       hw/riscv: microchip_pfsoc: Connect Ethernet PHY channels
>       hw/net/cadence_gem: Add pcs-enabled property
>       microchip icicle: Enable PCS on Cadence Ethernet

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/net/cadence_gem.c         | 31 ++++++++++++++++++++++++-------
>  hw/riscv/microchip_pfsoc.c   |  6 ++++++
>  include/hw/net/cadence_gem.h |  4 ++++
>  3 files changed, 34 insertions(+), 7 deletions(-)
>

