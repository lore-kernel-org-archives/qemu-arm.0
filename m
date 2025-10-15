Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CEACCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 02:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8r6z-0002gm-FJ; Tue, 14 Oct 2025 22:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8r6x-0002gC-U8
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 22:19:31 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8r6m-00032H-BH
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 22:19:30 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b50645ecfbbso1156457166b.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 19:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760494755; x=1761099555; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWt+gReZ7MfSrvsiU8EM8zN6GBsat6l5bki+g7p65z4=;
 b=BIutuxrIkWbslO4LYR207pHgRGLiUz4sZYIv3dJlo1KpEtb/zXTVW5lScjpRCgs7lN
 B/E1lSqt9oM0Jf6Vl6IEmk4Phd+8uvXpoK3qc9EmQUytPYJ9uVQaPrmPBVJUePTdVV5M
 NGmjvd0fJ/JLoVyykh8wpsE22KMxOwLR18dQ3BdPNVpZJ0OiljepLHLvNFnArltRw1ml
 4MiVd84x6anMAPh2KKWzSNNLgXyX71/7VVRCl5WN38n7yxg6yjQPrpwFDjxw+YXxLPOG
 90hyRwp4drXZYxHzGc1pqiGjXNdRgNbf9L6yKOYr1i4GquBWa1vQXyipj1JP15mQQCU3
 6Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760494755; x=1761099555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWt+gReZ7MfSrvsiU8EM8zN6GBsat6l5bki+g7p65z4=;
 b=oH13JfJuE64kKGtZ8LTPZXiNW2mFG3L3quQA0+T6PjFHyIDVpG4HMOcLzeEfyb3J2p
 vwVYBSZq9J+CBt27897/gsc73mnYdDteS+EMhUsnCb9wWSTA3WsSjcgoYkoW9a8CmBkH
 jD//ZVx2wIMWDb75uTmRDWaP1BU3j2STs8yJu/XJ6f7DAV7fO6ZPAI8+BznSf2k3SrdW
 6aqBNMqLgZyVnzouZFDYZUaqpepqAwqFj67eWbJiW1zreXFyYOkxOW2IED6L2oAf+9Tx
 GR6g7kjNO2Uxr8aLz3hL6oFqFcSROGaCYg7ieSJ6tIvWEB35AxwYPObKqUj8o8w4vyfc
 oyHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgdQSOdMxvz78MbYeTxMEtRm1geWiNQBD9cY7wvNx532qblXOzMhNglsqsucF8CmqbgMh/ogFR9A==@nongnu.org
X-Gm-Message-State: AOJu0YzMI8BoSLa1AywXrVXYL8if/kX/6FHa2q4y2ltihVi27des+ywU
 k/M/8gJa1kEglHvsuPzBdSD6ljkxLO2DHFJdd+21nuZSBK9Qr9do5Q1O/P26JOcuBpkuaqzy9R5
 3Ji0ic55VR//guh74Dj7iHTKSOwbM2Y0=
X-Gm-Gg: ASbGncunBhTaRvutWnP7iLJrPossPX2ev6OMBFCWPjhkjeS/enlkV+GBbjDMjV/E9On
 DDFUb8fst1PpFoRHbGnt9vgoRJAmikgoq/Cdc4WIHJ/m/zeoYac9ItjpaUIxKp4HfFANqG7MF95
 XpuOyhV/sE/kF+rZkTcpnV3hpbZZi+Hv0kceAyBDkag/PWDaA6yw8bhk0xbvA67Lr1wn4AnBcTm
 tdHJiKLcorU3PVX3RqMk0aAZGUI0DvxV8Hau6XzPtA4Dcq31falDpQPM5Fsl9UYuF8=
X-Google-Smtp-Source: AGHT+IGTMeWG7k+I0JFGQcuHpwJNfVorKtG41XgNdWrsaKyHrqlXe7J06S4r1P00X5Cxm3PJMMuo3ARRkcSNNz4zWmc=
X-Received: by 2002:a17:907:86a6:b0:b47:d628:f002 with SMTP id
 a640c23a62f3a-b50a9d59a99mr2788026566b.13.1760494755367; Tue, 14 Oct 2025
 19:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251004200049.871646-1-linux@roeck-us.net>
 <20251004200049.871646-2-linux@roeck-us.net>
In-Reply-To: <20251004200049.871646-2-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 12:18:49 +1000
X-Gm-Features: AS18NWBPgGh5aJieA6O3-9pkOIf6n6ylochaSgSQJUnymq7WUOz_Dn-Ctc-Y1IM
Message-ID: <CAKmqyKM4fO7mTnAYXbWp5h1VoTWR438DcKvz14mQxQ8YU28tEg@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/net/cadence_gem: Support two Ethernet interfaces
 connected to single MDIO bus
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sun, Oct 5, 2025 at 6:03=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> The Microchip PolarFire SoC Icicle Kit supports two Ethernet interfaces.
> The PHY on each may be connected to separate MDIO busses, or both may be
> connected on the same MDIO bus using different PHY addresses.
>
> To be able to support two PHY instances on a single MDIO bus, two propert=
ies
> are needed: First, there needs to be a flag indicating if the MDIO bus on
> a given Ethernet interface is connected. If not, attempts to read from th=
is
> bus must always return 0xffff. Implement this property as phy-connected.
> Second, if the MDIO bus on an interface is active, it needs a link to the
> consumer interface to be able to provide PHY access for it. Implement thi=
s
> property as phy-consumer.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/cadence_gem.c         | 24 ++++++++++++++++++------
>  include/hw/net/cadence_gem.h |  3 +++
>  2 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 44446666de..520324adfd 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1541,12 +1541,20 @@ static void gem_handle_phy_access(CadenceGEMState=
 *s)
>  {
>      uint32_t val =3D s->regs[R_PHYMNTNC];
>      uint32_t phy_addr, reg_num;
> +    CadenceGEMState *ps =3D s;
> +    uint32_t op;
>
>      phy_addr =3D FIELD_EX32(val, PHYMNTNC, PHY_ADDR);
> +    op =3D FIELD_EX32(val, PHYMNTNC, OP);
>
> -    if (phy_addr !=3D s->phy_addr) {
> -        /* no phy at this address */
> -        if (FIELD_EX32(val, PHYMNTNC, OP) =3D=3D MDIO_OP_READ) {
> +    /* Switch phy to consumer interface if there is an address match */
> +    if (s->phy_consumer && phy_addr =3D=3D s->phy_consumer->phy_addr) {
> +        ps =3D s->phy_consumer;
> +    }
> +
> +    if (!s->phy_connected || phy_addr !=3D ps->phy_addr) {
> +        /* phy not connected or no phy at this address */
> +        if (op =3D=3D MDIO_OP_READ) {
>              s->regs[R_PHYMNTNC] =3D FIELD_DP32(val, PHYMNTNC, DATA, 0xff=
ff);
>          }
>          return;
> @@ -1554,14 +1562,14 @@ static void gem_handle_phy_access(CadenceGEMState=
 *s)
>
>      reg_num =3D FIELD_EX32(val, PHYMNTNC, REG_ADDR);
>
> -    switch (FIELD_EX32(val, PHYMNTNC, OP)) {
> +    switch (op) {
>      case MDIO_OP_READ:
>          s->regs[R_PHYMNTNC] =3D FIELD_DP32(val, PHYMNTNC, DATA,
> -                                         gem_phy_read(s, reg_num));
> +                                         gem_phy_read(ps, reg_num));
>          break;
>
>      case MDIO_OP_WRITE:
> -        gem_phy_write(s, reg_num, val);
> +        gem_phy_write(ps, reg_num, val);
>          break;
>
>      default:
> @@ -1813,6 +1821,10 @@ static const Property gem_properties[] =3D {
>                        num_type2_screeners, 4),
>      DEFINE_PROP_UINT16("jumbo-max-len", CadenceGEMState,
>                         jumbo_max_len, 10240),
> +    DEFINE_PROP_BOOL("phy-connected", CadenceGEMState, phy_connected, tr=
ue),
> +    DEFINE_PROP_LINK("phy-consumer", CadenceGEMState, phy_consumer,
> +                     TYPE_CADENCE_GEM, CadenceGEMState *),
> +
>      DEFINE_PROP_LINK("dma", CadenceGEMState, dma_mr,
>                       TYPE_MEMORY_REGION, MemoryRegion *),
>  };
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 91ebb5c8ae..21e7319f53 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -81,6 +81,9 @@ struct CadenceGEMState {
>
>      uint8_t phy_loop; /* Are we in phy loopback? */
>
> +    bool phy_connected; /* true if connected */
> +    struct CadenceGEMState *phy_consumer;
> +
>      /* The current DMA descriptor pointers */
>      uint32_t rx_desc_addr[MAX_PRIORITY_QUEUES];
>      uint32_t tx_desc_addr[MAX_PRIORITY_QUEUES];
> --
> 2.45.2
>
>

