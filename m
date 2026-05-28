Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E943CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 14:50:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSc3T-0001x3-St; Thu, 28 May 2026 10:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSc3M-0001wE-Ii
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:49:44 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSc3K-0001uV-UL
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:49:44 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7c0dea734b8so126720707b3.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 07:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779979781; cv=none;
 d=google.com; s=arc-20240605;
 b=ddvDt8TepTgdzbb7pZXTQNJBwu/7lLHcH4MONMrustElf5v4pBC35feS3J8wzwCvIB
 ywU2F9SOthjfRTVouUg2oleOILsT5KPU4QLbYId4RnpC3qOAd4tw6gXLLU3hL1v+9p9x
 uKoMLj520rJY0WjS988UMknctuu5I3yHs7l7HisPuZ2dXgZYVDOH6MOxIGpvokBrr+0N
 Ywrgtool9jLcnWQV7x1G5QSoxEs6MzdqBXmWhp3k3FaqB1+S6S4w8yCYw9ztiEbY5Rtb
 vxPR9TwbGaDXsRCHFmbpYaZkAvgqpM5uABOPREXBykqNEEkF+POb/TzePCQqUVKxd/UN
 Fbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KdHJt01D4pDF1WTllAWTZg36+SWPFwxbymsNRT9y4K0=;
 fh=xukBqJQ2fP00/13mryqlPzd9KsWgUqEqVApgvKL++Gw=;
 b=dLPgnGpc/VnORtLEM+DGNuB5UkrF95SlCZudbpJHPRZvYGgZ7a04RKZaUbo9ADyRF+
 lUXkmJ+Kz2+kym1FezORz8kem03nxDgI8QvHKHEUoc//vgR3qUWneBMKxowjtl6aHiSL
 nI6l/0urSO0YJ1cW7IsUHazYbOgrkiIDm68Ua7wpjtYKvFx3300MjW042CVQcGCTsKnK
 TOK+koZr9e3yxqq0BMO0vCtFvCjpI4D7E5tKpksbHg3b/pxrBjdpflV8hWQ6wKrmLd5n
 fJE48O2v8Lp2TN/8IcEK9OTOeYkAA651eIeVQ09c5/EMcOgYDvjcfyAfiBv78XwANZyl
 EkmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779979781; x=1780584581; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KdHJt01D4pDF1WTllAWTZg36+SWPFwxbymsNRT9y4K0=;
 b=ffaw926DJifT2Toql1YgKWe3x0hdksO8YcvxoQnbHJH0DYOXAMCxKZQ9oM5WOKvyi7
 OdSK7EO0keNzEufmuExE/ZepruTbmuC+ZxGy86/xwdKMrggXRjii+VvBIqWHundg3N2J
 rrSwHvMZWwzR+8opg2hyAtrmJZI9CUA9WDjED5io3AKQzVPMYs5ePjWHEzti0MTLq8x6
 Oa4Ylej7kfuXLXNs1GM0k7Ydh68hSXD17Eo/x4vFoUhFaDUlK1pt70xLXwNxxenl1SD0
 6pqDtmk0awY3Hg92t7QhTBSMN+M0zrorXGuWEOT6ajcxJeKjJ8yAD+GPLyNp0spRtk30
 mhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779979781; x=1780584581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdHJt01D4pDF1WTllAWTZg36+SWPFwxbymsNRT9y4K0=;
 b=JFTTUcQdIUwlpZ6lJUmYLXggBfsgSac+s4ozJnHqXdtqV4VJtG3pOR0v2LAH5DSVT/
 LBLu9OLWmiXzrbjQ+PamKfjvmJL4APeUiW96c9IuIrFCoaACG8bb6NsckuapeW2pNwsK
 c8DFvYzYGjIRVyVjoqIsmlQ+adV9y0b+LP330p/WbEZVqF6QTENDk+UVIb5S6WPrxXZY
 j/KVeJz0pA+DYhCmM1lcpiN6Yrb1YOe02az4i28cfVDHBXKqliMd52bR7zC/zWfPu4h3
 5Dyp8rZgp37jpjQEAs8+BPm3GVHHKy245Iy8+83jWPdIZP2GGiRudKe06uy1HtNueFz6
 cPng==
X-Forwarded-Encrypted: i=1;
 AFNElJ/iCHVr2jFJLuXemBB6zJXRWl1rvxHJOic5uxXQrkghot6RC9R1DTIDFuFBmtE0xvmKSWu0yTcMiQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCWYpCNNaWSrax9Wh1hDaIG2+LjITCi7NmOBRixngluVhSJd/5
 vCddNLtSqFC5H1s0oh0mXwHYM2sbfW779VUFNGSLKz460b9GB5X71/388K5NSHc4oFR6rChLIY/
 MaBqRSBqW5rOdafVmq0KPTtm88myJRUTqI8bxoE7v+w==
X-Gm-Gg: Acq92OHRFRiM56oypB5M70dvlqZUCpyG8Jc9gxyY0egwPyPLvXPVWKB4UoQy5JZXeQA
 Mw6Q65+25nwHPh5k3NJM36xA1qPrjBExJOr6mGa+H8Y87oAsQ0laSK3mp5JGyO9kdR0CP6HhksJ
 a2aywQtrtTb3s3ulqJKF0Lg35VdwtZs1Yhlg2FoKkpVhu+XGs204OELZxPc2h5h1egTtmIlRjaY
 43SMplmTjFAj7/P4Z0aJML5QyrpujsDXPgmWuV9fniaDHfmrZcDIvUPpD6sddmxvAcWRslPiMnx
 3ZFMza6f5xT5YBzoT9cazF7X9+Gdndv0wzA635HBneTKanslG6mC6Mm5pPI22s8ggFpt8RNI61T
 WMw==
X-Received: by 2002:a05:690c:6e05:b0:7dd:4c68:1a14 with SMTP id
 00721157ae682-7dd4c68223bmr9971937b3.21.1779979781391; Thu, 28 May 2026
 07:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
 <20260511-feat-mte4-v6-1-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-1-8557cc1313b9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 15:49:29 +0100
X-Gm-Features: AVHnY4I4LbQOF9BBQjQ77aFuonnAxwj8aKazh15g0AEzuUJMjIvVzZiHUctk4Dc
Message-ID: <CAFEAcA9eRSmSgSQ3dYx=gifQ-a2UikWDP8-MG439tk2=_3x16g@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] target/arm: implement MTE_PERM
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Mon, 11 May 2026 at 15:01, Gabriel Brookman
<brookmangabriel@gmail.com> wrote:
>
> Introduces a new stage 2 memory attribute, NoTagAccess, that raises a
> stage 2 data abort on a tag check, tag read, or tag write.
>
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h   |  5 +++++
>  target/arm/ptw.c            | 25 ++++++++++++++++++++++---
>  target/arm/tcg/mte_helper.c | 38 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 63 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 88fe3ed287..adfbdb9da5 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1157,6 +1157,11 @@ static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
>      return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) >= 3;
>  }
>
> +static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
> +}
> +
>  static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
>  {
>      return FIELD_EX64_IDREG(id, ID_AA64PFR1, SME) != 0;
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 316e201cfe..467d815e0d 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -3414,7 +3414,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
>                                          ARMCacheAttrs s1, ARMCacheAttrs s2)
>  {
>      ARMCacheAttrs ret;
> -    bool tagged = false;
> +    bool tagged, notagaccess = false;

This drops the previous initialization of 'tagged', and clang
complains:

../../target/arm/ptw.c:3432:9: error: variable 'tagged' is used
uninitialized whenever 'if' condition is false
[-Werror,-Wsometimes-uninitialized]
 3432 |     if (s1.attrs == 0xf0) {
      |         ^~~~~~~~~~~~~~~~
../../target/arm/ptw.c:3488:9: note: uninitialized use occurs here
 3488 |     if (tagged && ret.attrs == 0xff) {
      |         ^~~~~~
../../target/arm/ptw.c:3432:5: note: remove the 'if' if its condition
is always true
 3432 |     if (s1.attrs == 0xf0) {
      |     ^~~~~~~~~~~~~~~~~~~~~
../../target/arm/ptw.c:3427:16: note: initialize the variable 'tagged'
to silence this warning
 3427 |     bool tagged, notagaccess = false;
      |                ^
      |                 = false


You want "bool tagged = false, notagaccess = false;".

thanks
-- PMM

