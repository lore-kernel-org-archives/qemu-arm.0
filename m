Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2327983lfo;
        Mon, 14 Mar 2022 11:13:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWoYMMd5EABYKb4JU4IRBcN7rgEUwcnuzBDcDMFTg8pPrmyB4GsMNsiUCVQ5QS+uPvTLx/
X-Received: by 2002:a25:7544:0:b0:629:33a2:b142 with SMTP id q65-20020a257544000000b0062933a2b142mr19453271ybc.136.1647281628265;
        Mon, 14 Mar 2022 11:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647281628; cv=none;
        d=google.com; s=arc-20160816;
        b=vmdv+T08ryn51y/nkplY+WqBDDgnU+DEM99v6Jl+oYnCF7i0CDZT0BaEDPd0uvI9uW
         BI9i812yvbjJW7ETIPmnNg9IZwROp14es3C+VopC0m4P7I3r06VgbzNS6zy3F+AyXiB9
         vUny2W5+Qyb6sYeE2tRM7XuJFE4BvltB61gnbohhjspJTU3ihuT+/Mk/EluaoSVe0nwj
         TmnTjGHea6fOSQQFaR06xG5VY1EfRajjTMwnucl2zfb6VpOlZGgbEV7Z1amxhW/oiQen
         V1jwAJ/nTGTmqsbR01REuOHwi6YANz2XOiDrXoTVhBzPZTYCgLZyGr8LH4NwBKTbBnvM
         jUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QaQ+Boi0mU+Pp7EhfQK7kgD4tno7V88QKhgpvqtno3c=;
        b=p2xWw1YSEMhIQXFrpoUjKkt7PDxm4CwH2KZmYsp0oG5uJ7GeiI/KQEe1tkHtS6q1JH
         Z593jkkXBNfojgGRorXe1bpcf94DLd0w6FpxTXE4yGyVpC30uJA6x7sQtNUEntKugLbt
         cELSUcTt29s1Ze9FDiVAX4jkWONX4stDv1+U8X4DZY0lu8PJJLOiR60aNg0uX2lZd3+t
         y8ELOtaO0rkR4znfr7wo6beTzYyJtSNDLsuTb8WXMxZmOd2cxudCqudySrOZXz2uReLQ
         sLcRtxKlltwwE5IDhqmqTGh50OPG9ZyGVx+dM1Zf6ffKC3Kws1lWpuvY3psopGE/DfzC
         hXQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztn9mtNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a5b074e000000b00628ba65c4ddsi8963675ybq.7.2022.03.14.11.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 11:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztn9mtNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTpCV-0001j2-LH
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 14:13:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpBI-0001Bx-Ds
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 14:12:36 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=43649
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpBG-0005Ec-O5
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 14:12:32 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id g26so32412130ybj.10
 for <qemu-arm@nongnu.org>; Mon, 14 Mar 2022 11:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QaQ+Boi0mU+Pp7EhfQK7kgD4tno7V88QKhgpvqtno3c=;
 b=ztn9mtNK1qXxF4dQjeHeOhbGhahQ97fKCZYVVuzYQzEWGts7klHGllORMRDXQ5uJoY
 8U7MoYfg+ixINGPBIb9fd1dNR1ocSkWNXUuRRB9On3nidw4rvKdjmUebq5TYuItPiJOW
 mB4D275DjsHwxoiyUZKUsuwzG7E4vlDEwO4SRSJLR/eyc1fQRtwew7CYVfNsqEurVBci
 1TzKbGMZRuk0/vSgEKb3NwbH6ada//9mcBEp1qeR9sdb+E2TZMd8ihC0RhxK80+HhowO
 I7OuzpCSO3wDNoCOpRtP9Uu00UFTbN5KHT5UReYJeUpXaVSYiNefszbkuexMB7we/peD
 5fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaQ+Boi0mU+Pp7EhfQK7kgD4tno7V88QKhgpvqtno3c=;
 b=kcFdHFuifWOH1BoA6d3lKvoVUlnbRVVwaKp1WzSHNxa9yZjcu/4IFkBrpC9sXrN7GO
 POzAF6J0Kef4tfYQHt4vx8dRWgkmC2M55tXObbmmYGXBZxjvfW3dVcCdAUqz5cHCTthg
 HJ3GjW4dA8pTDn9R2/eM2TAT2uVWsp2+X8m2ekcw408GRmJWqc/rtJFP0eW60DlcT3Ow
 NvgPhsXqnXCFy9MhOhuBcBV/janqyjrLfIYpKd6wzaw/Fdz2ohyITF2UaTI+bearEXJC
 0CSqLgO5CqY37Wu5eIS3rD+Hq9UA9qQy64S10akJOtmuEkDZ8lO86OtjMkVf+ZvV31C2
 G3+g==
X-Gm-Message-State: AOAM531//RzcCtP8Vs77YTS4PmmlDhUxiXejYGeVfq8kBwQXdismQ2UF
 stsfQl1GF4xJbQTpkTZMJjpZzIWfio01G/WnhQH0EeI16pKwsQ==
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr18719807yby.193.1647281549785; Mon, 14
 Mar 2022 11:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220304165628.2345765-1-peter.maydell@linaro.org>
In-Reply-To: <20220304165628.2345765-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:12:18 +0000
Message-ID: <CAFEAcA-7XPoeeO92C6YhR_1Cq3vsjR6vjJSSQqRTmvp34nhkbA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix handling of LPAE block descriptors
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BPv+U08Pws2D

Ping for review, please?

thanks
-- PMM

On Fri, 4 Mar 2022 at 16:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> LPAE descriptors come in three forms:
>
>  * table descriptors, giving the address of the next level page table
>  * page descriptors, which occur only at level 3 and describe the
>    mapping of one page (which might be 4K, 16K or 64K)
>  * block descriptors, which occur at higher page table levels, and
>    describe the mapping of huge pages
>
> QEMU's page-table-walk code treats block and page entries
> identically, simply ORing in a number of bits from the input virtual
> address that depends on the level of the page table that we stopped
> at; we depend on the previous masking of descaddr with descaddrmask
> to have already cleared out the low bits of the descriptor word.
>
> This is not quite right: the address field in a block descriptor is
> smaller, and so there are bits which are valid address bits in a page
> descriptor or a table descriptor but which are not supposed to be
> part of the address in a block descriptor, and descaddrmask does not
> clear them.  We previously mostly got away with this because those
> descriptor bits are RES0; however with FEAT_BBM (part of Armv8.4)
> block descriptor bit 16 is defined to be the nT bit.  No emulated
> QEMU CPU has FEAT_BBM yet, but if the host CPU has it then we might
> see it when using KVM or hvf.
>
> Explicitly zero out all the descaddr bits we're about to OR vaddr
> bits into.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/790
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 088956eecf0..b5c8caafe84 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11706,11 +11706,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>              indexmask = indexmask_grainsize;
>              continue;
>          }
> -        /* Block entry at level 1 or 2, or page entry at level 3.
> +        /*
> +         * Block entry at level 1 or 2, or page entry at level 3.
>           * These are basically the same thing, although the number
> -         * of bits we pull in from the vaddr varies.
> +         * of bits we pull in from the vaddr varies. Note that although
> +         * descaddrmask masks enough of the low bits of the descriptor
> +         * to give a correct page or table address, the address field
> +         * in a block descriptor is smaller; so we need to explicitly
> +         * clear the lower bits here before ORing in the low vaddr bits.
>           */
>          page_size = (1ULL << ((stride * (4 - level)) + 3));
> +        descaddr &= ~(page_size - 1);
>          descaddr |= (address & (page_size - 1));
>          /* Extract attributes from the descriptor */
>          attrs = extract64(descriptor, 2, 10)
> --
> 2.25.1
