Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3110BCCF2C1
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 15:10:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI638-0008HE-CK; Sat, 17 Oct 2026 11:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI637-0008Gg-BN
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:10:17 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI635-0008H2-Fd
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:10:17 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8ab432273c5so6367297b3.3
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 08:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792249814; cv=none;
 d=google.com; s=arc-20260327;
 b=DjT1zrFovFi+aOBMLKgVbiabPH3xzyt00undozdF65ig7JoPByQozdJEaSBjr3uV1R
 pbVutO4s3wbG7bv8sKy9M/tnPUBwLBv9c4AXxJzGOXoEpcdsNNUmasdYN2zDfM9kj9fo
 dkkLmiplDG0teADyNOfqzUUYxsCdnGLLuZF3lJtXICmPuuQI0vkFPXIavAuiHx9doydA
 ypoLICDaYIcv+tgkYU2ydQxpU1p999l5vi8aieor7gFrqGLAPTWwpy8EJI4UURSH5Tz4
 3j1SjOLyKnO57ZSjxaHSe6vUNqisJqJ9F4Mb6lP6SoBJTegZJswvUBnvmA0NJ0INw4TR
 DPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pt+SArkaDsI2Ryo6Mc6L8DDlkKjMFRuH8nMTSTCp9zQ=;
 fh=H+sSBXFDBtdwlZWW+05WRaIN01VihMMfVDkCqcR3610=;
 b=jKZQtOHnTFdT2YOTigw3QIqEcyOZfGfAWsvsw36YSWbXuc/6fEtHAPft+/iXbzvZQ2
 CRjl/WM0W43ELudxi1Xb3IogFycLM/X6+u0KWKPBOZqymin3Pt01U8RCrsRvaEWF4K7h
 VvUbmwoJ5deJOIrmFJKPIQyd3G5Xr+GlQXilWReQCZ6kp8Bcnr0bMfRc2bBK9fUWu6J/
 FdI8HFt3GffmUSUB1et114eL19xvtVpwOb22hxjvsr+s2VMVyaN/8DO3oMqFnnM25t9r
 MfwXyZiNB3xZPAfq08vrZlCcHoYKo/XeE3cCv0e9sC9sE3PkNdyqGoJnLHb5hMfdvNEs
 1Xag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792249814; x=1792854614; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pt+SArkaDsI2Ryo6Mc6L8DDlkKjMFRuH8nMTSTCp9zQ=;
 b=fJfwWETEn08+4opbJ/qkEi4j4Re0cIKsLILlWmWWKd3DAyH1+R4M7fmGt33V96Yf5E
 T9q9rUcmSPwLsdiAFOHDb3V8k8I87LR4pk1veASdcok9bRSo5JiKlrmZxADb0PCQ5AKC
 RSqw40a/T6AoNQY0imMwa9N+Z+QEtQAgOFxSzdBur+00NFt9hJnaAOhl/XH/oJuW2Y3q
 R5A8++/ZDoxRbRpVuX3ZH6fe5e15zGnx2oRBukau/cG4hEvDw+xWecOixrWnGF1aHTLC
 ug0F8Vdx2nijbimt7mSBdzLp5MkGY0TXjl/+wBS1xtu/xWpnXWm2dhl3bGXBjw1BVCdW
 c+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792249814; x=1792854614;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pt+SArkaDsI2Ryo6Mc6L8DDlkKjMFRuH8nMTSTCp9zQ=;
 b=2ZuPDqHq/4xKnxpX694jQuZ7lhj03NuL2hQzKhq0KN/GDPWv9nyDbi7JNrf1wOQ4kU
 HkcnFKZK/H/NS+eJO1xSpbRQkJAKmdTJhFz/3ytG6LdVcLbMc5GbjWKMfl6DtiPevFWB
 vl8SF2BIpXnig3Ttp4d0HktYVIkcf0MIjgAPmnV5Thn7/06y7gOnuL0s/cwrRHt1Fl3P
 EF03/rwkCuCWZNHFt4yRbfSk9QYn6nt8NN1qcyOBQ5TRSWgTCukivQebAXn7G+qLcV9g
 tAXiQGqwbH8FI3cg7uUOvYX2uam9ZLNojU1wEzXqiDFM2MRdFwfI7d2xnPqyrZqSy3ef
 1/MQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzoOhlZAugT3udRC2bjoWYN4qJkbBtRhK73KjJ4baRWILJbKyqDG4u0Ni14uKTtOnQLUsxaQDwaRQ==@nongnu.org
X-Gm-Message-State: AFq9FYIYTxb6TjHdX57w9505Quu7troPonqL9mmXTtiXYRyWqLZfImns
 SgOgIxoL96RZt1ha+68eoUHjRs9wbOySTtUbg8I1wn7CnsNh/WqeTcYsA1V0yCKsNHKvx0G2n1X
 w/TNvgtSWzmhVvHruZrJndrsz16Z1vAUV1rmmPE91mQ==
X-Gm-Gg: AYBFou3qz4hae3rTlfHPVGtnjYa7QMaxus7kkugcUlZY2o65X7OxpitJkoDxaZUoVJf
 Gy63RK2Nu0BQYX2F7Vp0GYk9ek5kTvOa3Wb1KSnbpbWwWGJPagOFySVc8b7DGjDrz0oFO+iSpZY
 vItHstZVKDM4w7fST2+JosfRuYCXt2oLRoPAG4fm6jF9sL6ZIK7VA0958Jud3P+HRj74wYPxZfe
 pzBuMFg6UE6uCU8NMB+HK6frYAmrClW928ta8+V0Y3zSK2nCxpymcPxqSkN1nRUfLseunKNFPw1
 xgwrqDskCBYSqhk3pm6HJQELaw+xXEY00t9n5SziqzDuubRNQ8TYNU63GUTxaD9/21d21QlvZ2h
 DnOWXnjH6iwQFKk6RIzwgqrjfPihOyaLHiZppCutTQDqfAjvoyw==
X-Received: by 2002:a05:690c:e641:b0:8b0:ac82:afc3 with SMTP id
 00721157ae682-8b0f2170907mr8560797b3.21.1792249813806; Sat, 17 Oct 2026
 08:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-12-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-12-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 16:10:02 +0100
X-Gm-Features: AclHuK97aNdt-24ThOwA2Ew67A1b_KAw2OI5w4LKkbam5ey8FMzWpNJB9fkbP6o
Message-ID: <CAFEAcA8gZXznfO1Y9X+jvRyLekMf2omWRfyyjBewOKyAu5mi9g@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] hw/net/bcm2838_genet: implement GENET MDIO
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Implement the MDIO command register handling used to read/write the
> BCM54213PE PHY's standard MII registers (BMCR, BMSR, LPA, ...) plus
> its vendor "shadow" register blocks reached through the AUX_CTL/
> EXP_SHD indirection scheme, and a simple link-state model (PHY
> starts down, comes up once BMCR is programmed and autonegotiation
> is (re)started).
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> While carrying this forward, fix the autonegotiation-restart handling
> in bcm2838_genet_mdio_cmd(): the guest PHY driver sets BMCR.ANRESTART
> and polls BMCR until it reads back as cleared, but the result of
> FIELD_DP16() (which returns a new value rather than modifying its
> argument) was discarded, so the bit never cleared and the guest
> spun forever at boot. Also refresh the link state once the restart
> has been handled.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  hw/net/bcm2838_genet.c         | 139 ++++++++++++++++++++++++++++++++-
>  include/hw/net/bcm2838_genet.h |   3 +-
>  2 files changed, 139 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
> index f3c5ca26c5..fe2a3cf890 100644
> --- a/hw/net/bcm2838_genet.c
> +++ b/hw/net/bcm2838_genet.c
> @@ -20,6 +20,8 @@
>  #include "hw/net/bcm2838_genet.h"
>  #include "trace.h"
>
> +static void bcm2838_genet_phy_update_link(BCM2838GenetState *s);
> +
>  /* GENET layouts */
>  REG32(GENET_SYS_REV_CTRL,              0)
>  FIELD(GENET_SYS_REV_CTRL, GPHY_REV,    0, 16)
> @@ -216,6 +218,7 @@ FIELD(GENET_PHY_STAT_1000, LOCALRXOK, 13, 1)
>  FIELD(GENET_PHY_STAT_1000, MSRES,     14, 1)
>  FIELD(GENET_PHY_STAT_1000, MSFAIL,    15, 1)
>
> +/* There are two data representations for PHY_AUX_CTRL register */
>  REG16(GENET_PHY_AUX_CTRL_0,              0)
>  FIELD(GENET_PHY_AUX_CTRL_0, REG_ID_MASK, 0, 3)
>  FIELD(GENET_PHY_AUX_CTRL_0, RSVD_3,      3, 1)
> @@ -272,6 +275,134 @@ static void bcm2838_genet_set_irq_prio(BCM2838GenetState *s)
>      qemu_set_irq(s->irq_prio, level);
>  }
>
> +static void bcm2838_genet_phy_aux_ctl_write(BCM2838GenetState *s,
> +                                            uint16_t value)
> +{
> +    uint16_t reg_id = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, REG_ID);
> +    uint16_t reg_id_mask = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, REG_ID_MASK);
> +    uint16_t misc_wren = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, MISC_WREN);
> +    uint16_t reg_data = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, REG_DATA);
> +    uint16_t reg_data12 = FIELD_EX16(value, GENET_PHY_AUX_CTRL_1, REG_DATA);
> +
> +    uint16_t *phy_aux_ctl_shd_reg_id =
> +        (uint16_t *)&s->phy_aux_ctl_shd_regs + reg_id;
> +    uint16_t *phy_aux_ctl_shd_reg_id_mask =
> +        (uint16_t *)&s->phy_aux_ctl_shd_regs + reg_id_mask;

Here again we are taking a pointer to a struct and assuming we
can also treat it as effectively an array of uint16_t. In this
case BCM2838GenetPhyAuxShdRegs is all uint16_t, but it would be
clearer IMHO to define it as an array of uint16_t rather than
as a struct, as we do with BCM2838GenetPhyExpShdRegs.

> +
> +    if (reg_id_mask == BCM2838_GENET_PHY_AUX_CTL_MISC) {
> +        if (reg_id == BCM2838_GENET_PHY_AUX_CTL_MISC) {
> +            if (misc_wren == 0) {
> +                /* write for subsequent read (8-bit from AUX_CTL_MISC) */
> +                FIELD_DP16(value, GENET_PHY_AUX_CTRL_0, REG_DATA,
> +                          *phy_aux_ctl_shd_reg_id);
> +            } else {
> +                /* write 8 bits to AUX_CTL_MISC */
> +                *phy_aux_ctl_shd_reg_id_mask = reg_data;

8 bits? This pointer is a uint16_t *.

> +            }
> +        } else {
> +            /* write for subsequent read (12-bit) */
> +            FIELD_DP16(value, GENET_PHY_AUX_CTRL_1, REG_DATA,
> +                      *phy_aux_ctl_shd_reg_id);
> +        }
> +    } else {
> +        /* write 12 bits */
> +        *phy_aux_ctl_shd_reg_id_mask = reg_data12;
> +    }
> +
> +    s->phy_regs.aux_ctl = value;
> +}
> +
> +static void bcm2838_genet_phy_shadow_write(BCM2838GenetState *s,
> +                                           uint16_t value)
> +{
> +    uint16_t reg_id = FIELD_EX16(value, GENET_PHY_SHADOW, REG_ID);
> +    uint16_t wr = FIELD_EX16(value, GENET_PHY_SHADOW, WR);
> +    uint16_t reg_data = FIELD_EX16(value, GENET_PHY_SHADOW, REG_DATA);
> +
> +    uint16_t *phy_shd_reg = (uint16_t *)&s->phy_shd_regs + reg_id;
> +
> +    if (wr == 0) {
> +        FIELD_DP16(value, GENET_PHY_SHADOW, REG_DATA, *phy_shd_reg);
> +    } else {
> +        *phy_shd_reg = reg_data;
> +    }
> +
> +    s->phy_regs.shd = value;
> +}
> +
> +static void bcm2838_genet_phy_exp_shadow_write(BCM2838GenetState *s,
> +                                               uint16_t value)
> +{
> +    /*
> +     * TODO Stub implementation without side effect,
> +     * just storing registers values
> +     */
> +    uint16_t reg_id = FIELD_EX16(s->phy_regs.exp_ctrl,
> +                                 GENET_PHY_EXP_SEL, REG_ID);
> +    uint16_t block_id = FIELD_EX16(s->phy_regs.exp_ctrl,
> +                                   GENET_PHY_EXP_SEL, BLOCK_ID);
> +
> +    s->phy_exp_shd_regs.regs[block_id][reg_id] = value;

I think it would be nice to have some (preferably ARRAY_SIZE-based,
but maybe that's tricky for a 2D array) asserts here that the indexes
aren't out of range. In this case they can't be, because the fields
are both 8 bits and the arrays are 256 elements, but an assert()
guards against future danger and saves the reader having to go look up
the details.

thanks
-- PMM

