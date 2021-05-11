Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3751678lfg;
        Tue, 11 May 2021 01:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAAfNwY6wWquq/Jrp6SxwG0M7/ikhTHAGJRXjPb1DMwnzQxcFMYS5zCGc8tExSVpcztLtn
X-Received: by 2002:a05:6102:416:: with SMTP id d22mr24290180vsq.37.1620720763448;
        Tue, 11 May 2021 01:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620720763; cv=none;
        d=google.com; s=arc-20160816;
        b=sSoyf0WByczVJbn8cbysy9Seuxmal7BlLiYhGwt7GBr16jTtw+sEzYte0UC5pkgwT/
         co9gen3qxIxybBS8mz3V87Wfhp3ndJErqgDNtOoh/KIS0+DmFR6iPEGKBYYY93UXKdmI
         pIMPfgga75WsfrgmFuh0MhRmYiptIsosUVS0lAlRvv4rNPeOOB0cXePM70oWcLe07Ac/
         K5d/oHAfV3o3byLh3vyZLYCcLaMRle4HZxBNATv9UAq9darRp8LXBFHjxweCSyE9Z8uR
         iwZXSY06yDyEroayUXQqk5/2OevNc9cZIOKQqLHPzpM7yIs4RNhBMa8+RgRbkjd4289e
         lCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EeUlf0JRq1sYHE3OCYgKn7toCRqjL1i2ly2KHpcSbws=;
        b=Bzb56U1ZdFYboGzB52v7XEHgrIjnfhatArX57UjHeWIiXJkglwujpdy4IW6pOi3AJm
         Xeu2+x8wrbKU6251wqYojmlP7YmrJFGBvlfF+P1+exIwUNbpW9u4CPJ8Lu6dmXZt5/Gf
         4Etod9fQsANDAGgdxJe3AZisyCtu7kxybKxGfPZ7yJT0WgisC5+/i2fZohJh54Yj5Bnw
         7PCpnKTeHuTWRhZe1OzEw8ju68m41AkY6t98GJ82iuBxOghLOXGmJ5bIFBU8+F65EAFu
         xJHYhCqaxltVQEzJplTnkuUiigsSY8oWhBNbMNc2ewc9FkwD86r/LgyG/eHlcZF8ugNR
         dUJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GmgAkX1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si8108701ual.115.2021.05.11.01.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 01:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GmgAkX1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgNVS-0007X3-Kz
	for alex.bennee@linaro.org; Tue, 11 May 2021 04:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNUZ-00060s-P5
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:11:47 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNUW-0007wE-HE
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:11:47 -0400
Received: by mail-ej1-x636.google.com with SMTP id c22so331250ejd.12
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeUlf0JRq1sYHE3OCYgKn7toCRqjL1i2ly2KHpcSbws=;
 b=GmgAkX1E0H6n2I02w1IMQo/ZZcxRSHWhURFTy/dSqzAM6qQ4c8fqcrhKPg60xf6PVx
 6TfrfoRVzvlzEhkWvebN5Z0Qb0beeX4LOIXA6WT70Qnlile+9t3QYoBVdT0OFWufczy9
 5XvOmfBQIChafJh1yNWGtSisQMjUmBOf5Ju9eIh5mXWDCH10pW0aduilU1ZtRC1rXK0E
 xRAt6tEvpnc8atE9DdXaNQqhB+qHR0vc0zW4mgfRCDv7Ffj6gXw7svWbvcJVwIX8XFvR
 jmVU1Qot2Ar0z8ZbaDdopg95CqeHO8YcwktbEirMt0IX20G1GSkf1gP7rYVTxHGDM9Vk
 19GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeUlf0JRq1sYHE3OCYgKn7toCRqjL1i2ly2KHpcSbws=;
 b=Avm66nMAzkNJzm6H0kgmy5VSS5giNPLfeti2o4hAUUqh0iQVy6JzYmunhHXud4GfKX
 wXO3n6viJknwoLLKP7yVa24UrkOrnnRjk+dqf5Xh0mEvwe0kUhhJgaeuRsBM5D6Bw8xF
 RCgMh/ZlhUhj2aasKtunaxz+MCp5It+D6CO4rn+CDRC4tUBe8vHvePPJirCskcnyexI8
 1sciivAZdnsfywLbwXXD0jWrnuPj4XWnS227amx1BU+gEVYSEfXs7Fx0jEFSqRSdIjjz
 7w++hRZk32Nwjk+j8clRqXHi40gML5oxVk7seEr7DckWTQX1Y56voPSvphDd6mCNKw1i
 tYdw==
X-Gm-Message-State: AOAM533uIkd9Ut/GzYq4pxhD3gSkG7oiosoIDHfICRSxDZH0n67tstSe
 Kisf9ffkWbaPFxhEsRoPRNKMjTsIg/MFme6YV7VbDQ==
X-Received: by 2002:a17:906:254c:: with SMTP id j12mr12922ejb.4.1620720702929; 
 Tue, 11 May 2021 01:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-5-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:10:30 +0100
Message-ID: <CAFEAcA9YB1noev21vWDvW=MtTrZ8O=mpgyWLvvTQwNV8yoPYEg@mail.gmail.com>
Subject: Re: [PATCH v6 04/82] target/arm: Implement SVE2 integer unary
 operations (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UqjReFf+TboL

On Fri, 30 Apr 2021 at 21:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix sqabs, sqneg (laurent desnogues)
> ---
>  target/arm/helper-sve.h    | 13 +++++++++++
>  target/arm/sve.decode      |  7 ++++++
>  target/arm/sve_helper.c    | 29 +++++++++++++++++++----
>  target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 92 insertions(+), 4 deletions(-)

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 42fe315485..bbab84e81d 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
>      return m + n1 + n2;
>  }
>
> -DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
> -DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
> +DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
> +DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
>  DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
>
>  static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
> @@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
>      return m + n1 + n2;
>  }
>
> -DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
> -DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
> +DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
> +DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
>  DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
>
>  #undef DO_ZPZZ

These two hunks seem like they should have been in the previous patch.

(Why do we want to use uint* for the sadalp version?)

Other than that:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
