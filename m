Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60043606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UWz6E9lc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLMl4-0003IG-Ki; Mon, 26 Oct 2026 11:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLMkq-0003EN-UF
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:36:57 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLMkm-0004Gk-SH
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:36:55 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-677d35fd1d2so3025721d50.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 08:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793029006; cv=none;
 d=google.com; s=arc-20260327;
 b=F1EuT0FEQ4RSm0VtYDL9+4ry3HQEQbBpRbm11TdIEFM61q2dhMt9CaY6WjYkS3qTtJ
 fZ2cbU16uL7+YdkXCfJtQ67VYqrsQS0xjemkwywFRiCBW2j9NZxucvcHOYDg0EvPjSpp
 4g0HYdNpu1GGj+ncUk4h9nUH18GEYhU913EfrLKxoDVOQxgveCdd5lxchO+JZnrvs7gJ
 JuT+fQtgCD/IKKfuKvtd6AQmN3CXIo7XtQZF7JJWj9ge+JcT/t0/hu0aqayMf5uPNscX
 bmgW7Fajw5W35QtJSHI3fFa4sTe4lYOtC3AoHYke7mtetM6pXKjC5NlDBTmLdUKoy3j+
 j17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mkGLhs4+xKTUISTmCatc+U8CXhEnCwXeDsHnBOc+0Ns=;
 fh=L2HJbs3CE4BAXkrtpzEg76YaVbQNHi/7jqA972Up7pI=;
 b=Hm73G7e9ORufnNAhkCc2m3/l74jlHcRpB5gxftwrPBJ/UgzEoFW8J4C2Bu0DVEuLuk
 SRpkOO4x3fLKGLyjQeO849XOCIY/4lWCt56fc+qL9B67dRulHZj/E+ZaYJ7G8yGYER0C
 iqadib8KA9Twey3/Lq9GLvNyOWBwuAXY0bYvmVNKUzD+tUHWUic0i2dIyeeR3Ycw8aqt
 Ki7Tg3izDwdx7YoLixBoA+luoEf0tMcEcjTK1K5B4cS7P4vAgwPgyUkOqh5ittezmAK/
 7vsLellsB5LJ+cJL/t1k2zbTBhdYaaWpFcbvtWWPQ5WcGCxw0Z9/RKvw4oCLuGMXe3t9
 jYxA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793029006; x=1793633806; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mkGLhs4+xKTUISTmCatc+U8CXhEnCwXeDsHnBOc+0Ns=;
 b=UWz6E9lcWRXKrinCMumLJV0Li7EcU1Npqvl9TjRUTNN4O9EJ7bzjTjPOjpR5UjJwJi
 yXKhm8c8erXYKKbk8H5EBq0lTlcPfha/J364WG57OKAo1F+pwXmsS2TEtUNByNAEruYe
 /uAE2hhYKpPEZ757FQQtnoeDFgvfliQ4G8SNc4AkSdHUxI2o1g6Zu3++JwCtHzBCGssL
 tthrh3gcFqm1Hj5HLCmlK+tHa9j4D7CTmBJEiEIOECDaNTwpjW7MNoVX56D5mpeW598F
 yYv/qB1Ayc3Z9hPA0g1XgW+BtAtegbYEeAs2eZQq85LFXuKflXsoAMX1HI689+0h14yD
 Zcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793029006; x=1793633806;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mkGLhs4+xKTUISTmCatc+U8CXhEnCwXeDsHnBOc+0Ns=;
 b=zvYzQQoCNSmvo09TrFkf3Cb4ngj2p/LoHgjY+o6lplrEObqsWFf11lduxiuSltmtmn
 27nzuq5Phm58jPl2tVripxHrmQxjLbToLgfLQuFpcQOTw+HqHzFG1NDxynBvQV3tLgn9
 6gU3PS3JIm/3G/1dUXncZHjcEVMyqJa7+1KWthmxHLLH0DCMo1GgTzAF57WpHC2BMeDa
 kvlLhmWC8RljFZ9KGckIUH6CUaXlKaON/gWNhWwLidpca17SIt7I5TYxtDyqafFOlq59
 10JTcvxnuqk7o8qQOx4hzBmkE433h4GEdWW6EwTWiV2T+wu/OPqNEWwLYO61j97PhtFm
 +LkQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwBZaf3+91fsNKi3nyHTPEEJdhfzIxi+6uEn13J1m4Bqsrl2hWvu4TK0j+7UEOEw3SKalji/XToug==@nongnu.org
X-Gm-Message-State: AFq9FYLFAu6J3uRVdm9tIEmtH+3rmCGApNBgn3hbi/R+KZ4ZTVXMC/Mh
 b5Y3lbGw8x8LaSzoghANIIPL4yAY4WOT/2bdTVpy9mRC4Dp/lV21mbIFNOBK6utDfo/cepHIpJj
 gesrDoud1BLrc3XQlg3kE8UUDF86h2v9xdI/Jpl3u7g==
X-Gm-Gg: AYBFou16uUnq9dkWU5vV+xYDfuPMhf6ILSVRPbo2DNbLuKGDHmyxOYmYWwwcCuUSG4S
 jDSF9DSw5lu+sEXKmLkanHYC5vHURO/e9vNy8pr2TYJdg+lmmyFKnileMEvy9fmbA9u7ENpy8OB
 0bxHfNKN68OPJsWVOI43PrUR4KM3V73W8DdE4q9F21csRRNUgTbT95CMSsmmSTH1tddJ6JV/OMb
 DefvCG2nI4QeK+LLkqE7UFG5ZL1BdBb4al3WTf6tvsaLt/bOUMMRfWTEJRdZ2R8NAqxVkVlqHcc
 KN+j5UuED0uf/TwEpM3+94UnsS7REAO5DwN7KgedCRSbKJul5nFUALBZEEW62O1yEB3C4zwhIr3
 QeR+VRg81SKD+jyiHEllb61QpMwIzdm4OmKYICHogbovPvDM469AE++oTePo2E+Zz95tUSWQAiY
 Ys9NBKCTjoe426cpriHg5dv5czjFESxW++O6QY2Aq79Q==
X-Received: by 2002:a05:690c:c4e6:b0:8a8:909b:5c61 with SMTP id
 00721157ae682-8b1921b63femr10734377b3.19.1793029006461; Mon, 26 Oct 2026
 08:36:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2026 15:36:34 +0000
X-Gm-Features: AclHuK_7kmbDEbEc-kipOCXNTGvvj-zj3uUOIhdRR5w4kVIBu6_dRxHwb3QV3Eg
Message-ID: <CAFEAcA-OwXgzMLLU7YCVKg_0XJ6UXC7idf0o0dcg3mJn=zGu4w@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] hw/arm/raspi4b: working PCIe and GENET (real
 networking)
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 14:59, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> This series gets raspi4b's PCIe root complex and GENET Ethernet
> controller working end to end: the PCIe link comes up and devices on
> it enumerate, and GENET passes real network traffic (DHCP, SSH, bulk
> downloads) under both older (Debian 11, 5.15) and newer (Debian 13,
> 6.18) guest kernels. Most of the GENET code is Sergey Kambalin's
> 2024 series (patchwork series 829638), carried forward with his
> authorship and Signed-off-by kept.
>
> v5: thanks to Peter for the review of v4.

>   - Dropped v4 patch 14 (GENET migration state): migration state for
>     the GENET device was not asked for in review, and the points made
>     on it (no post_load function is needed, and
>     VMSTATE_BUFFER_UNSAFE is not right for registers) mean it would
>     have to describe every register field by field. The series
>     therefore no longer adds migration state for GENET; the root port
>     keeps its vmstate from patch 1.

I asked you not to implement migration wrongly; I didn't say
you could skip it. As a general baseline, all new QEMU
devices should implement migration unless they have a good
reason (e.g. they are explicitly experimental) and they
set up a migration-blocker explaining why.

For this device migration is not complicated to implement,
and so I think we should just do it.

More generally:
 * you can implement device state as an array of uint32_t,
   and get the benefit of e.g. migration and default-read/write
   codepaths being more concise, with the downside of having
   to write s->regs[R_FOO] instead of s->foo
 * or you can implement device state as a set of fields,
   and get nice-looking s->foo access within the implementation
   at the cost of needing a switch case and a VMSTATE macro
   per field
But you don't get to implement device state as a set of
fields and then say "but I won't do the parts that that
approach makes a pain".

thanks
-- PMM

