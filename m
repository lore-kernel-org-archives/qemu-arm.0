Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp428663lfm;
        Tue, 18 May 2021 06:45:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeUFYSMrASMmSNECBP7MYiflalsVthm4HiLXbDKuE1Ihal1TnXO77JvTMTjGrpszs7gPUs
X-Received: by 2002:a05:6602:204f:: with SMTP id z15mr4126958iod.99.1621345522716;
        Tue, 18 May 2021 06:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621345522; cv=none;
        d=google.com; s=arc-20160816;
        b=B0NBIYGqZj7NabrUk9yC8Ft0jp/Yc1heilMuVG42nqGbTsjgw8z5sE4SVnYIHtM36h
         5XqpKWQjJQnTFQfwgY/rMtIh4SMKFxs5tsM3/Y+afSOkRpgdP89tck4SM5JrEUIu6hSI
         hGRR51e/KkHuIIRnINqGbWB0RUwHfFQWCmSfqiGdO2KSeoBeSmFSZNbHzJxTxL6WRRe0
         dDEK4b6OB1HLZN21HtI6rspT4MH8cI5z+kmZ6NgwfM+Qc9yokfjC5nR2qKsaPVp1JqZ8
         mVCC8GfGjVPubdQ1kTq8yLaeZEZteMA35aTZS7ohgcu1410fsCHLWaKmG3IgXpYRsxKl
         WpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cdAVq9upZSGJVXJfJ8uFk6ZciszXNguo7RZtSEizOLs=;
        b=JJuCEuos4/hSpYBQwsqzqcw+NVXOgk4FSlqWavuurPc/KsAXqr1NbdN3+zpyAR2Yjc
         NxQrQ+sF9jR/TAhjNgi2sCV+HgMM9AcrP0elfUzd1G2vf2IU28i4ZUiFDW+pvqZQr4st
         g+H0lhGBzOwULqjTz5IWYKl+Uh5aiTO4lOk5l6TxE083gNdEQnuI+olelDJ33KEKxMwR
         /MrY63vRhYXNs+Lwmb0mN3BodOWvkjcJl3OCN656wZyRJMEsoGmDuNDrLiCx+5LYcooA
         CZMtY9Ij7HNGgavSEOLuJzOtwkCU/sUEmZaQQ2+yYSC06L5QD+JFbRLCoQMMa1RDwkks
         8MVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ay0pdGdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si20397054ilh.148.2021.05.18.06.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 06:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ay0pdGdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj02D-0000UD-Vh
	for alex.bennee@linaro.org; Tue, 18 May 2021 09:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lizzH-00018e-Sy
 for qemu-arm@nongnu.org; Tue, 18 May 2021 09:42:19 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lizzF-0007D0-BG
 for qemu-arm@nongnu.org; Tue, 18 May 2021 09:42:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id lg14so14629519ejb.9
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdAVq9upZSGJVXJfJ8uFk6ZciszXNguo7RZtSEizOLs=;
 b=Ay0pdGdSO1TrKk8O1kCI1J5jlN0DnucpqO8T1uiGJzSJhYMToRzKuR+1QLXEL0oyPk
 LvnEISTWc1/f0wx0bfBPgrP8WjxKGZYp5hWbhNDYBlvsrNU0obo4XTQnq8mS/nk/fabI
 PSo4cqY6RvIHlnm82H/6pBHzuheiVWXvK3ABC+E+PFIbQ48iuMmIUKnz6Aj5VtoX95QD
 a3Y5DIBriylDmkuf8YZUC+dP8KLHJZi1inK5eb88j6/0ijLMWnFU8hbuy4jPYfaxu/Ob
 gA47SdblWr8o5J03NDcNn8ly9eQgu5joT4qV60EkSpemi62o06ydhQq+8H3hQ3J9yj+Z
 ZyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdAVq9upZSGJVXJfJ8uFk6ZciszXNguo7RZtSEizOLs=;
 b=dnNUC4TMHzKVAp6wlohNaTLjge2/toiWkn+gJ62k514GtXLS+z2C+HyQcpvGfb5oMy
 +SU6z6iCNlDB/vxomx9PVBujrRvOryDZgF7ONWRx9bH7mQskC8910Cq+DvzLUPydR5a6
 WHOIyTs7CRHxZIcV2mEanB6lH2B+XzAiLq6lvm5+qteGAiGE9hgk81HMMMkWhGiWsR25
 H6dmP5Bdzqo3LCLig104025Z7ieIhjNcWguiMouEiZjFdMEVpEc2HTx7rKq5uP5z1hnH
 kvyzjREk2w0NfP8hrrufgxlerXYslQJHnPxKaD0Uj/HuF4sSv77kc90J38W8wFYFX+Nd
 6X2w==
X-Gm-Message-State: AOAM532iNkxNDldxIZAIfMnSBIroVFHY5sCeNkheHAy4yL/P+Nn87Jp2
 wrvsjy+BPAbNLmm6RLsHQi0ih8y6FJLSfuGTCK5ywA==
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr6291696ejb.250.1621345335368; 
 Tue, 18 May 2021 06:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 14:41:58 +0100
Message-ID: <CAFEAcA9qrQSwN9yVqedQDQPPauYVrWzAKrcdM+jfroz8Mpj4XQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bwgpmsjNM/hg

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v3:
>  - review comments addressed
>
> Shashi Mallela (8):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   hw/arm/sbsa-ref: add ITS support in SBSA GIC
>   hw/arm/virt: add ITS support in virt GIC

This fails to build with clang, which has spotted a
missing set of brackets in two places:

../../hw/intc/arm_gicv3_redist.c:568:10: error: logical not is only
applied to the left hand side of this bitwise operator
[-Werror,-Wlogical-not-parentheses]
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^              ~
../../hw/intc/arm_gicv3_redist.c:568:10: note: add parentheses after
the '!' to evaluate the bitwise operator first
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
          (                                    )
../../hw/intc/arm_gicv3_redist.c:568:10: note: add parentheses around
left hand side expression to silence this warning
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
         (             )
../../hw/intc/arm_gicv3_redist.c:657:10: error: logical not is only
applied to the left hand side of this bitwise operator
[-Werror,-Wlogical-not-parentheses]
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^              ~
../../hw/intc/arm_gicv3_redist.c:657:10: note: add parentheses after
the '!' to evaluate the bitwise operator first
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
          (                                    )
../../hw/intc/arm_gicv3_redist.c:657:10: note: add parentheses around
left hand side expression to silence this warning
    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
         ^
         (             )

thanks
-- PMM
