Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2899403lft;
        Thu, 23 Jun 2022 05:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6iJ7vb2SsCTC4YPrrr2A2kmZN9FMdWVZzKC7qeDJ1S5JZ8bTiTFaC0rqdV4dqiHolXocV
X-Received: by 2002:a17:907:3e92:b0:711:d26c:f91 with SMTP id hs18-20020a1709073e9200b00711d26c0f91mr7602808ejc.283.1655986311190;
        Thu, 23 Jun 2022 05:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655986311; cv=none;
        d=google.com; s=arc-20160816;
        b=BAHAHTr29XCfCgPdKQTjvU0XmlEIakEGdZtDDzZqRsHsfM+uoAbRi4PS66pQZGMq4X
         A4WID0ljRR/6GN1KB62eBgxtGI2IfZilNJCuDWx2wqGlMtzb2IcmSRbebLluRbLNckjJ
         MSgFdgD7//WYJY24z0cwoMKrcZVc0jgKuwfSZvagehsJr+zVp4XBL5aA3TIPNDmXPebj
         37bnXujEiWCUlmzINxgwqyU6LBGFOsq7kLnWarTprmZ0tBrfNoUFCKLOOqdXTYrge+LA
         qB3LCj5YlLF2BCgzVVuNvLTZfx3mE2Q82/TY3aiRFgmxHZvF8SqYNH6rQE/TU6DdJe+l
         ofJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=S7K6L24c+Y1b2KwK/Q66A3sSE8CSQ8aoyDZ6Ql0AsV0=;
        b=avfOiWy1qT8pNuzH7o7wTd49ueGmC3PXg5oujjLCx9L3EU9faB0c3X9uggw3B2gqFX
         kP6pMLJQBJB2alw8ExLL/F6olz4oehKBoGjqBbGQOvOtaGzHCNOpnwM9B48OlmT+BuP6
         8lpfG4z66JslrzB+DgUa3pHndXSi7lxfNRK6VENqEA7kQfYkXZbX1Dql3H0dX9bi4gZC
         L46fjz3IuXtaw6vSM1rmInZ7K86oiibAnn8hZlj8RVk5EL3NDUvAuOyre6Jq2JoDgJyQ
         TenC2qdkxIFc0nU6C1d30Ne5pKfPbYCqld1jaooV8hYB1VlQ6lNwvZhDqIcDAFAbpT21
         s9Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sSpGHUTC;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id he32-20020a1709073da000b006f3ac80590dsi17922907ejc.526.2022.06.23.05.11.50;
        Thu, 23 Jun 2022 05:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sSpGHUTC;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbiFWMLu (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 23 Jun 2022 08:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiFWMLt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:11:49 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7488A4DF7E
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:11:48 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3178ea840easo153780177b3.13
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7K6L24c+Y1b2KwK/Q66A3sSE8CSQ8aoyDZ6Ql0AsV0=;
        b=sSpGHUTCswvHhT4H1B5KfzqfwiD7oQxtmXZiGYZWoxAyeQ53n3xZie+Ig2mwn4fCKe
         Xkk5l8mFLX0kRrjF8NztrOQAuU52WLUKrooX1ha86jVcPQT+lVHJJzr3EiJ+UF7TjqFM
         nqdYctf2D2InwbxppBsCmKuKQpNw34cClqkrbhhan/C7GZWJQrWrENeasaFTmg0tWRFp
         g/2Ucg8+GEoDhWWrC6Nrg6Fi/50TmkWKpcFMB9baLyloRj6wdJU9WXjRf1SB3ztDT0cg
         FKJhzLt3sFIqvSV/cOBVRkiQZLYWTjptf9Q+C/PdBnkfcBF+uIqQeDB+soTPzUrdXTPY
         stZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7K6L24c+Y1b2KwK/Q66A3sSE8CSQ8aoyDZ6Ql0AsV0=;
        b=dYTjM4RTA9O9nZBEmQzwuo6cvq1CB3MSqQ/H/WxuKCLFP1dYyUbB3Khn+/rdygWH9o
         uwOO60rNxyItCVP+L/0d2L7u7duEbbKA4Or1gjZfgt5DcItktcrcxmp47cy1rwCmUou5
         h6Db768Nf67Nkbs1MOcBMP3aCXk+YSi1Oibuku2Eq8krxna851Ehdf/ABycdqnEk7+2U
         8zZ3N8UpyTxBRRe21LAo8RRRb1V9Jt14b9m4YAlrvxB0RkPSJx2Lb4dh9oubehqtuOsb
         SlYewTABsaLmEScpROARnA9iLquBkd8MU08dswQczCzhd6rKZ0Bn7yTbMS9n5YHDXicB
         trUA==
X-Gm-Message-State: AJIora/nGFIo6oW17ldG7q6nybK8ZnwFKw+HwQA7L3MYdXT4EaDB066C
        dSqX0qBrsD+/5T5BgIIQwHjt5QnRu+1A/7aaOw4Dsw==
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr10199573ywf.455.1655986307630; Thu, 23
 Jun 2022 05:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220623102617.2164175-1-pdel@fb.com> <20220623102617.2164175-3-pdel@fb.com>
In-Reply-To: <20220623102617.2164175-3-pdel@fb.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 23 Jun 2022 13:11:36 +0100
Message-ID: <CAFEAcA9k_gW7GDDDiLf7gp-wX=_OCKzKeMHe5Rr5ZZe167kaYA@mail.gmail.com>
Subject: Re: [PATCH 02/14] sysbus: Remove sysbus_address_space
To:     Peter Delevoryas <pdel@fb.com>
Cc:     clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
        berrange@redhat.com, eduardo@habkost.net,
        marcel.apfelbaum@gmail.com, richard.henderson@linaro.org,
        f4bug@amsat.org, ani@anisinha.ca, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: psdh8GLcLtld

On Thu, 23 Jun 2022 at 11:56, Peter Delevoryas <pdel@fb.com> wrote:
>
> sysbus_address_space returns the address space associated with a
> SysBusDevice.
>
> That address space is always the global singleton "system_memory", which
> is retrieved through get_system_memory().
>
> This abstraction isn't very useful. Users of the sysbus API (machine
> authors) should know that sysbus_mmio_map et al. are mapping devices
> into the global singleton memory region, not into a specific container
> or some memory region specific to the device's parent bus.
>
> Lastly, only a few uses of this function exist. They can all be
> refactored to just use get_system_memory() directly.

Yeah, we definitely don't need two functions doing the same
thing here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
