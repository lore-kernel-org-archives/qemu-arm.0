Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36E7CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 16:45:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT0KO-0000u2-9c; Fri, 29 May 2026 12:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wT0KN-0000th-BE
 for qemu-arm@nongnu.org; Fri, 29 May 2026 12:44:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wT0KL-0007Hc-QK
 for qemu-arm@nongnu.org; Fri, 29 May 2026 12:44:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso773777f8f.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780073091; x=1780677891; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H3tiUgayoOPf0pWZ9CoDFe2YmlgvjlXiw8wK8lJUOFA=;
 b=OThUTJmfY6LH/dLREah+jplG0WsEsYyLOuEQtcthQJyYR349B4/gU18Wp5yqrZuFg/
 CZzolljEDeukek/X/q+IZKtYqIb40HSlY1QfKMyYr3S/jyWOG7S02Np/kOTV5hka0CBo
 aZlfVljDrs5FRaNuQRCrv+xsi1VC0TRxCjBBPc0pegi5xK5EJTQJdKmko2qJrD/0gn/r
 mvZwJuyrNpUE+UV1RH/aQpl61TGgDRtCXcN7pvv4/JaoPjqH3qxy/tFb5YuMZLVDEueJ
 OnVtS4BQV9n1RVNeIe3+HWgNGL/JZTN6gZKpwFxRulqTLHP83j9SZa48qaPTNsxL7Oo8
 yBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780073091; x=1780677891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H3tiUgayoOPf0pWZ9CoDFe2YmlgvjlXiw8wK8lJUOFA=;
 b=qJwuBy2zJDIGHTy+IS+iea2kwobK1nHzBGB6Wl8jPSF9tp/NFW2dWU733yODrAKBvK
 jjO9v9w5FSjO5kJ0sEuhsENjeCapiPeiOaqAKmSIcG+qlzU+9yFNpo8O3KTnkrQ69yCH
 sh5J9IAx7LyTnkbTUqZSeaVw4XeCrm5uf3Yvlh5WeZmDsiig6xkktGs473lx5T6qgcKw
 GJs6tA2h/tx7o/4nZqLVPkbeTt2yS9/ZOOl79b9V/s+VOS+r48NQ09cxnAhLwXARc2Sw
 KFBY+r+Ec9Xn0so6XE2rmH0hnI3OiVONQpCDKpaAIoT8xfnLiegPXY4UCmCBQK+46j2n
 95aQ==
X-Gm-Message-State: AOJu0YzKLqw1x+JocGsl8W4TZ5sJ5Xt+51JtRgo7zO8Kcth25ZzxQKXz
 nZqk1IKAYFWNkFeRfqZaQwxhptA8qw8Mcdv6MH1ZcXuSbeDUXaw950/ZwFhgIfEFSF4=
X-Gm-Gg: Acq92OFFV3/Dlcp/1IkWMYvQwbPmbp3vTDo36tlmv2HQi8bF2jzf0WM/2veVABdCX5h
 LbTUqN+W9ZYfeOFO5XtCWqhSif1qdhV/f6J8FWbIuiOz9TtMzp+Kh8KOPq2yCVKkkk9vk316bnd
 rL4fcJdvGoScukpfOFtetLw2MtDdq2Hh1+Fca5xGXX45iXPO+iPbOc4yPgKyD7qNy3SvS068ozQ
 0nYcSjUxUSE5OEgACV5VpPsyMCaYJrn3+GBtzHmZfqERNsOqeqIvozPeFhCJRZn94Lhb3R7lxho
 MWB1uok1gYAXLOPV7gjixjrISbgU9uqnWsO5CWimaAmmejUXwnTRkcCnAGZjTIMacwMgzMAU/0g
 NE37L3G4uuBfKEH7obFUvbtR5g6jzVzi8kax7JvOiDrf9iU1KHLFA2zLPRh2LhIzF011lgPr8Lv
 +LZD5WPPv6dVtUvmYu2cbyNefyIY6HBs8PZzXo
X-Received: by 2002:a5d:6586:0:b0:45e:ea46:ce11 with SMTP id
 ffacd0b85a97d-45ef6b12bf3mr840594f8f.14.1780073091517; 
 Fri, 29 May 2026 09:44:51 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:9be1:73c8:1a1e:445a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm5008748f8f.7.2026.05.29.09.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:44:51 -0700 (PDT)
Date: Fri, 29 May 2026 17:44:49 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/5] target/arm/ptw.c: Add Granule Bypass Windows
Message-ID: <ahnCgXdlwjro5Ybj@linaro.org>
References: <20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org>
 <20260528-jmac-gpc3b-v1-3-d34c46c5069f@linaro.org>
 <c5e98ece-ecad-42cc-9b83-154453f535a5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e98ece-ecad-42cc-9b83-154453f535a5@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x431.google.com
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

On Thu, May 28, 2026 at 11:52:09AM -0700, Richard Henderson wrote:
> On 5/28/26 08:34, Jim MacArthur wrote:
> > +    /*
> > +     * GPC Priority 1 (R_GMGRR):
> > +     * If GPCCR_EL3.GPCBW is 1 and the configuration GPCBW
> > +     * is invalid, the access fails as GPT walk fault at level 0.
> > +     */
> > +    if (FIELD_EX64(gpccr, GPCCR, GPCBW)) {
> > +        /*
> > +         * GPCBW is invalid if the base address is:
> > +         * not aligned to the size programmed in BWSIZE, or
> > +         * greater than or equal to the stride value configured by BWSTRIDE.
> > +         */
> > +        uint64_t bw_size_mask = -1L << (bw_size_field + 31);
> > +        if (bw_start & bw_size_mask) {
> > +            goto fault_walk;
> > +        }
> > +        if (bw_start & bw_stride_mask) {
> > +            goto fault_walk;
> > +        }
> > +    }
> > +
> >       switch (FIELD_EX64(gpccr, GPCCR, PGS)) {
> 
> ... here.
> 
> None of the checks you're adding are correct:
>  - Missing size and stride validation,
>  - Alignment check vs size is incorrect; you wanted
> 
>     bw_start & MAKE_64BIT_MASK(0, bw_size + BW_ADDR_SHIFT)
> 
>  - Check vs stride is incorrect; you wanted bw_stride <= bw_addr.
> 
> See GPCRegistersConsistent().

Thanks for the review Richard; the bw_size_mask check was indeed wrong.

On bw_stride_mask: it was intended to keep the high bits in bw_stride_mask
hence this bitwise comparison should have been equivalent to
bw_stride <= bw_addr; in fact the other use of bw_stride_mask was incorrect.
However, since both Arm and Intel GCC produce roughly the same code for both
I will replace it with the more readable arithmetic operation.

On size and stride validation: there are reserved values for these fields,
but the ARM does not say explicitly (that I can see) that they make GPCBW
/invalid/, so it wasn't clear to me that we should fault on these.

Jim

