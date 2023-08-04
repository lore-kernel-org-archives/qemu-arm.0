Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1736502ejb;
        Fri, 4 Aug 2023 06:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp/LRQgDnzg8I/dX2j0o4chE91GGMK1wG1CKBYL7JVgnYWMTgxxa1upNssn3jTVuVpyNfo
X-Received: by 2002:a05:620a:2453:b0:767:dc9f:5141 with SMTP id h19-20020a05620a245300b00767dc9f5141mr1474267qkn.19.1691154565371;
        Fri, 04 Aug 2023 06:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691154565; cv=none;
        d=google.com; s=arc-20160816;
        b=fthnMReKAd96488zvbCKAXaS8W8v0XsbXj4aIe+oX2t3n7y4b+1Zd8R5qFG5odoJDR
         m7q5OEAqD0mePV322GnvPcY9SuEvTIoFdZeUkqgGVgEHbBI/vG3KNTiZb2DQ6CkXiiAy
         RVsIBBVB8HfnAx6DIVE31TlaEbIE7UfmBp0mIRZQO4uTG+199sm1VwHD6/X6DirxoHyp
         JaukQEE9U6oKtFCVddEwr834YEt7MMZBOI+DzApx3H+M/v2qhQ3BJJihShclWx4DKcRO
         9XBTSyfv5UQulFYPUmnoBLb07KPHorXMMXKPxsxudDTa0EPb5bexllNL3UWLEDJ/dRCY
         TgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=m1J4aXhtd2ojg8Ya2HLoFacJp/rnIMMlcEtzHdoHPNM=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=WB7k3gMfaaJuKe6UMZucdegRUyHtUks60HaU5/fui+QQVfLhUpDONffgTUXY6NdABy
         BkN64s5MjLDImbx0a4rj33RaAm9coriDYVfTSSXR0SWXXrGNT/fNTYX8qq5rYSio2aFD
         uWoaeMSfNBYXv19SivX3js9SwXZXuAoQ8Dn265LI3Uh50blDsDZBkLZWvxworbmOzGq6
         qAaqSuu78LbzbPs4aggMT+BY4J9TE2balrpuz1Qan+xlprfgj7cdsIbA7XlrQTodGZXX
         P0yMemz+enraH9Sn87KcW81cC+REraEemYqo9U0vm+WWgz8kCNlgzVtYp+dyXk6LbcvS
         WkUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQeHJGTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac857d0000000b00403a7a5ace0si1244162qta.382.2023.08.04.06.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 06:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQeHJGTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRuYS-0002Jd-0n; Fri, 04 Aug 2023 09:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRuYP-0002Ix-IS
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 09:09:17 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRuYN-0001NN-Qy
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 09:09:17 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe28f92d8eso3534527e87.1
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691154553; x=1691759353;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m1J4aXhtd2ojg8Ya2HLoFacJp/rnIMMlcEtzHdoHPNM=;
 b=VQeHJGTijHnuPadwdDf+Pq9POqOBsjxtx85aq6RYzEJlsmLDrQkpsPA/ZuCFkngSdT
 4cuYJqIXBMjgKUOyYnafE8Ys1tX50Gj+PEXeNlAEecFINoPn4fZzwnbj8VA6t2w3poVA
 6WzxcEunZWbxwRiSN3TSwUKAGDtOzyKprIpXBNoKFMHLqo2i9iNKibL+HDtOEEl86uSl
 GvKhtzmK43zkEr7eCOSvLoFOAf98XBtFuM1PsAvYrNABjJ8UXIgfWd+gn4awkbHByS1p
 fghRhPX4AJ+7gfXKshFoBZFTKLuXRIrJHgEYc3v+Ty2vCqW5HUaQeYhQmZsYSo2T9rGK
 yumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691154553; x=1691759353;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1J4aXhtd2ojg8Ya2HLoFacJp/rnIMMlcEtzHdoHPNM=;
 b=Oam8tQpPG3QSSJ12K6KWhKUtpQwBiwcr20JQNLtGLiqdb/FXt+jLYOk9A7xwVAOsqX
 0b8sghwz1639x4nMnYpG4gJJtY9dAOFmntxEyZtWjIGXaiuHzF7kFXF0j8MdxlFgCOf7
 /twp4takwpQdMsuu/DtorEqIARi9pi5oagpCRSQya3u40yQgm+xMB3xloVLpkBoP3HyO
 zF6z7OsjbwvUTNdh6eilfTGEfALx5n5XUtVZQc6J1Tp/U3IldaQ+HIkBrmLO3vn3dSKn
 P4Ok/ERxjmSjqDPcIOcgX5dVkp/1NFDJYDQVnlTwlmXsYVsXMSeHWZ5Y2leYcBqlor6b
 9B/w==
X-Gm-Message-State: AOJu0Yx5jSaDnyxHs95FQjCBAbYwEDHCOgmJa4VI0zozzUGRuYH70Q+J
 a9o/ia0oPoZ5D2KlKVXds1NlZldDE0Mab4DkU66jQofVMtcnuC5B
X-Received: by 2002:ac2:5058:0:b0:4f9:596d:c803 with SMTP id
 a24-20020ac25058000000b004f9596dc803mr1305957lfm.53.1691154553208; Fri, 04
 Aug 2023 06:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-16-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-16-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 14:09:02 +0100
Message-ID: <CAFEAcA9Pab8pOf+B0=pfvUTHx5u8akdj7RNQSgggkMrtptfLCA@mail.gmail.com>
Subject: Re: [PATCH 15/44] Add BCM2838 PCIE host
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7EHLLOZZuWbS

On Wed, 26 Jul 2023 at 14:46, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_pcie.c         | 232 +++++++++++++++++++++++++++++++++-
>  include/hw/arm/bcm2838_pcie.h |  23 ++++
>  2 files changed, 253 insertions(+), 2 deletions(-)

> +    /*
> +     * The MemoryRegions io_mmio and io_ioport that we pass to
> +     * pci_register_root_bus() are not the same as the MemoryRegions
> +     * io_mmio_window and io_ioport_window that we expose as SysBus MRs.
> +     * The difference is in the behavior of accesses to addresses where no PCI
> +     * device has been mapped.
> +     *
> +     * io_mmio and io_ioport are the underlying PCI view of the PCI address
> +     * space, and when a PCI device does a bus master access to a bad address
> +     * this is reported back to it as a transaction failure.
> +     *
> +     * io_mmio_window and io_ioport_window implement "unmapped addresses read as
> +     * -1 and ignore writes"; this is a traditional x86 PC behavior, which is
> +     * not mandated properly by the PCI spec but expected by the majority of
> +     * PCI-using guest software, including Linux.
> +     *
> +     * We implement it in the PCIe host controller, by providing the *_window
> +     * MRs, which are containers with io ops that implement the 'background'
> +     * behavior and which hold the real PCI MRs as sub-regions.
> +     */

This comment has been copied from gpex.c, which is an implementation
of a "generic" PCIE controller. Since it's generic, QEMU gets to
decide its behaviour, and since we started with one behaviour and
then changed to a different one we need to provide the property
so that old versioned machine types get the old behaviour.

For the raspi4 PCIe controller, we don't get to decide -- the hardware
will behave in a particular way for accesses to addresses where no PCI
device has been mapped, and we need to follow that.

You should find out whether accesses to unmapped addresses should
cause PCI transaction failures, or read-as-minus-one, and implement
only that behaviour. You don't need to provide a property selecting
between the two.

thanks
-- PMM
