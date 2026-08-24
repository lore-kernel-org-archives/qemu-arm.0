Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D54C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 10:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyS96-0008Pz-Ft; Mon, 24 Aug 2026 06:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyS91-0008PI-6H
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:43:11 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyS8z-0005dm-Ja
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:43:10 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-66c70d73210so4154810d50.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 03:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787568188; cv=none;
 d=google.com; s=arc-20260327;
 b=Mt3+bNFhRrxGmwmvqc5vnGTZICqKzeM5rJHFTI30AN45qRjTpGQfvOCTc1J55QJd7a
 JvUJ/Q0Phh0I5x71MAaA15YQgaDC7VWKaIVvm6w4ah1tztZTYDKTzyXKfVUFCgANzUS2
 rACSufneGq+DfVAHBbbk/WxGKHQ1omn0yS6LzuCqna1LoFk79PRsKmQYmaZZ1wnSSzj1
 YVPZGpICEP3sDeX2ef+pq3Iy4Dj13ugFYLavRXWvv1M6Bd1j4gTuX4E2/7bwEOvkXVK4
 Dsi1ls4EtV10aDfMO5kFxusMM24oT45MGV8HMmMNcF47hbdtRUJMEGuhXJfEhjUIC/lE
 wuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=asuRtl1zHe/+aUY58NMVomp87dqiRzLQvVILhFYgao0=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=CPthl5oluHLsI3GibxYRfmREUvbQqhNP131L1l1bwHUKxhrb7snyprPGHU7j8OqWBG
 7TERvrJujqiUG+2oz+iQIiO4lUvL6KgX4erEtc2l+oM+bgbLDPTEM7yYCDySazw6Aw2X
 9XOh/EoE7aX1vq9ax2q81nx7CUGvn58ww7Bpk4eBYI3MZJXrorQ9Ifo+zDUEjbti9inh
 UIPG2kGvHinLJWluwvN+5UlVMNlwixPEmpU4GZNgcMACfYUTx5EfdZ7y8jx+9eNnwjwd
 FX5ADpucPqv5RHNbEActv9pVG00ULOORMrBrHIl9Hu8ysYCRXrzAYz7/RUeKK11a28pE
 9iHg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787568188; x=1788172988; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=asuRtl1zHe/+aUY58NMVomp87dqiRzLQvVILhFYgao0=;
 b=rfmuMBSkOyd+AkMgw064maQjyi7IEsB0Hdi1XYbR3fZHsJbXRwouiJYcoFg5T9wQbu
 iT5LSJKWLfEMX0eO/b1RMhM/qPr7riP0U1xVRKpTwinb/uDDHWHhf33SHzdBUBCWQ0Ml
 VGtX+mvUSKqO03DHvOBedf3lb6ZxQsdteBdxO1EDJ9XXeF6wIQV3i85d/vLKmQB9rM5D
 Nc+at5n5byv/++MIs/AZUYjITPpa2xbqYgsU0uoJvFCL7hUImcWyEmUaQQG7Ps+Gx3oc
 0N/DNs7jse72taIPXzt3yNz6ZPya5cIZzTS0yMZ1lvTXh2FGy4fm2DCMN6svlaLKnrGX
 hlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787568188; x=1788172988;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=asuRtl1zHe/+aUY58NMVomp87dqiRzLQvVILhFYgao0=;
 b=P4aFryrtBgelauSXHUsyL4lwkVoVtyUo/HjDexGvx8Ky0HFbQOLJp0imhoM9dklycX
 Ybc+B9RSQtl8/ioWDGn46CV1V65MH17syqYwCB/p0e8y3q8HzhzLjo1AOdCiDalb3BIy
 C7lJxfZTCu5Mz4B6Wr1YZUVX2rY7IQGk/sDnXi3IvMpte28TShXeRBdXmHmoo7I1bkkr
 3bVV0H3zN1ELY56JVN75MvoSSU4RyYZLEUdwOOsYQBnvJ+/Rv/NfpZP91veEeBcU8ayx
 lHDca8bo+8uj4JM1oO9H+OTRg/x7y9Jtdxo9WnwnXUvh9snR0iMvwnlGeuNh6Ac5kC2d
 M1sQ==
X-Gm-Message-State: AFuF++nqnAGk1iNOoZ4ZCpidbhHnxS0X9zLblFpV2grJRSTAkc/BVUyk
 EsX62aeCeJnrBhpbAHvqrua9j19zPmHw0j2rNQ+TrcIAFrj948061sY7JatbaWQjFrMt0+SN2PX
 Y3M98LIndr8IJTjTubzh8Bsm+mSk8LMzLqwWguNmEcGBW1VR/8XPKtYE=
X-Gm-Gg: AR+sD11N+mGZ53UirdwIeOMvWzvEMICkmNgN3WblroY0yI+n+HQA0j1NGtd0ciqTXjp
 C411HWH4+u5Oz0c0IlMkWrvvpaMfb/hw95HCURKwbFUQtXfwnmU8wyUyTj0fzUsQUG5pXvdeL0+
 Ey1hFFBT/fBxYfC4Fs6h9CUC6sHpHVDrhnmb0pEtdCy22c3Ou5+C9wwaNKs1wyWW5wcFU6qsXEf
 KAWcdFQZqddIfmjbZ8ywYxVRMMlbtEKcHB2Cev5rpZpihoDqtU7NOqhwPLziuerXKzr0kf+0bLI
 MXeAUSP+DPZvQ0zws+vx7o79DIKZH/SFpOep6i5LO4iE8t+aHY4pe2KQa3TuRQvPbmro8DDKVN6
 ZqywMC0dDpieU2McXBsXlCCQdd961
X-Received: by 2002:a05:690e:144c:b0:66c:f6a3:32a5 with SMTP id
 956f58d0204a3-66cf6a332d6mr4985477d50.15.1787568188333; Mon, 24 Aug 2026
 03:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260824102805.639072-1-peter.maydell@linaro.org>
 <20260824102805.639072-3-peter.maydell@linaro.org>
In-Reply-To: <20260824102805.639072-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2026 11:42:56 +0100
X-Gm-Features: AcwNN1Wanb0eIUgALoE0LNplv9wNHxuKpl_wreP3FI0AMEh5gOdDEmrTLsMggSM
Message-ID: <CAFEAcA_HM1jTVfSn8TJNT5GwNRm531hraLvBJ+VUmd9au7BcyQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Mon, 24 Aug 2026 at 11:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The GICv5 spec defines that an L2 IST is always aligned to its size,
> by stating that bits [N:0] of the address are 0 where
>     N = 11 + (2 * L2SZ)
>
> We were missing this check, and only aligning by applying
> R_L1_ISTE_L2_ADDR_MASK, so we would only enforce 4K alignment even if
> the L2 IST was 16K or 64K.
>
> Add the missing masking of low bits.  We already needed to calculate
> the number of bits needed to index each byte in the L2 table, so add
> it to the GICv5ISTConfig to save having to re-calculate it later.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv5.c         | 6 ++++++
>  include/hw/intc/arm_gicv5.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> index cdc6c9d3466..20680a5c225 100644
> --- a/hw/intc/arm_gicv5.c
> +++ b/hw/intc/arm_gicv5.c
> @@ -595,6 +595,11 @@ static bool get_l2_iste_addr(GICv5Common *cs, const GICv5ISTConfig *cfg,
>              return false;
>          }
>          l2_base = l1_iste & R_L1_ISTE_L2_ADDR_MASK;
> +        /*
> +         * The effective base address of the L2 table is always
> +         * aligned to the size of the L2 table.
> +         */
> +        l2_base &= MAKE_64BIT_MASK(0, cfg->l2bits);

Here too we are missing a ~ .

-- PMM

