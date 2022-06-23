Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2937890lft;
        Thu, 23 Jun 2022 05:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uLQncsuu4jCnZgSsLaF/Mq//6l8xl8sDEVMkyQejL4FksNnCdMNnQ3+XtQZrJUWv+qXomF
X-Received: by 2002:a63:745b:0:b0:40c:cabe:961b with SMTP id e27-20020a63745b000000b0040ccabe961bmr7468624pgn.117.1655989093940;
        Thu, 23 Jun 2022 05:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655989093; cv=none;
        d=google.com; s=arc-20160816;
        b=cgzEjcXu1BK5V3VvRK8QF9hwiRnqkgDaDPULnFoUrYU22QrvzMrZugaEvk9EMOQoHt
         WOcX6wFXxEzdVnHyoyuNkiUj/WZ0o338t/z1Wby3vvnJmpSEjKY3kycMafD1r+Kdoa7I
         InReiHk6oO6I3CBg5pOZ2BcwbO5JLuQBPKzRerOIEgsMtYsGU9+pP7WDXVkZ8vfBUs/n
         oZ6JjbcHpoBOvV7XkcVseN7o0hH1PyMwVAdNLfvnukFS+Pg2yuqlXxpKYULsSWyfv0b+
         pfP2Eirj+CIP4LsGHNO5wLd9vZ8J8xvYXtZhSd8yj5JX4pbqs3at/oMNHTVZ8H+EXXxd
         48sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Ko7ME7+w5VjeJMsrwGq5U2qPP5wbHBuC21S8nSLJTzY=;
        b=omZpBUOz75hjht6lARwEAcNJ48N39QmOn/6cRHD97JNX4cwr+LG4xpHgwCAhDMy4NW
         /WQlORvgDjwuGBi3w1mu9rb1nj8K+7TUQ4RUlZleAh5tCXT3G5K6TYp0AHRwGeXTbdtt
         yodyznaDAQ7HoazqNCI9J1SMXu2JV1ObT+zVObJg9abFH28fdMzFCdbkuj6ctsuxKVUd
         nOZtXRE4tSIBKruOfbeXi63nJkEnms+N1b+Hk1gn2bb9vDY4TBF3obZoYuF0Ny7ajIt5
         q69h4TKoaeRB/jBkDFjG4+qET39Ouj+iwLqhEPt8PO1xRAAr5zzcFkovoTYGL+8FcdOY
         5vwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMjg58UE;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id mi14-20020a17090b4b4e00b001ed0f6f1010si1638505pjb.70.2022.06.23.05.58.13;
        Thu, 23 Jun 2022 05:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMjg58UE;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbiFWM6N (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 23 Jun 2022 08:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbiFWM6L (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:58:11 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD221145D
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:58:08 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31780ad7535so166775647b3.8
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ko7ME7+w5VjeJMsrwGq5U2qPP5wbHBuC21S8nSLJTzY=;
        b=iMjg58UE+9Embz91PXP/aiKB9M1MqzkHJwF11dAyVccMXKd+gpI+6gywucwCx2XGAW
         5Ab7OWLnFUgvFZVYDkip9hsAzQUO/9YGHTHHa2VHpTQ+Jzenxnbwoo3fBbhabeMyY8I+
         F43UM7ppBs1bkoxNZ3lO5tzspiImCQ/YYabMhiCkeT57P45kDqdqGk6VeXsr/8makJpx
         y8j8FM+CG7VgB0ue0NS/PN7qxyWkIcj3ELbfINpQHsGSdTo82yae2pyMC+dS1oBXrpID
         NC/D0OlUTM2TlIKfuo7MOjv8EX6PdDqClPEjDl4w8UVgTcIdy3ColS2aWqkUhI1no0J3
         rQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ko7ME7+w5VjeJMsrwGq5U2qPP5wbHBuC21S8nSLJTzY=;
        b=y1kZKGsrHXSIL1CancKMvNdKxtRMthlAA+04XfBjeRL3FJy3DgsO86VQ868R+6MG/O
         u10LDnZk1MeWGX6NyYn0g6qRq1FOuuXbOl5s7akgNRugLV+B7zZLPlcqeQJ0UtmnENXV
         JbEILLVTTbJRg7/Ti/hLAVXpalDz+MI8aEkyTvuTtDC7vysZRzkzj+b6Z7kz3dw5u047
         nco3osee2xq/4yfyYsx5lNtd6GEpS1/h1YVdM6ixntFW/rgnxKREYYvEJlTeqrBV7ekA
         n1cSd8mN3TBtf3D06cuq8B2T3aeJqrdumnWYR2gituJvdD1BegMcO7WgEmFdRJKqGx0r
         oPfQ==
X-Gm-Message-State: AJIora+ROqXr4fEIFCoJRrN2FR5y6RNpayLAXDqb3pih/GeuyNns2nAB
        jo8g8gHXTVxDwuDLRMrB00k7zM3mSJxX5EPIMYFRNQ==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr10312102ywd.64.1655989087842; Thu, 23
 Jun 2022 05:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220623102617.2164175-1-pdel@fb.com> <20220623102617.2164175-9-pdel@fb.com>
In-Reply-To: <20220623102617.2164175-9-pdel@fb.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 23 Jun 2022 13:57:57 +0100
Message-ID: <CAFEAcA9GAr=Rv9GMsnUux3_PNk1gRPBOcSyPzD9MRP5UzOZO1Q@mail.gmail.com>
Subject: Re: [PATCH 08/14] aspeed: Replace direct get_system_memory() calls
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
X-TUID: jPkaEBYRnQ3Y

On Thu, 23 Jun 2022 at 13:37, Peter Delevoryas <pdel@fb.com> wrote:
>
> Note: sysbus_mmio_map(), sysbus_mmio_map_overlap(), and others are still
> using get_system_memory indirectly.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c         | 8 ++++----
>  hw/arm/aspeed_ast10x0.c | 5 ++---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  hw/arm/aspeed_soc.c     | 6 +++---
>  4 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 8dae155183..3aa74e88fb 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -371,7 +371,7 @@ static void aspeed_machine_init(MachineState *machine)
>                           amc->uart_default);
>      qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>
> -    memory_region_add_subregion(get_system_memory(),
> +    memory_region_add_subregion(bmc->soc.system_memory,
>                                  sc->memmap[ASPEED_DEV_SDRAM],
>                                  &bmc->ram_container);

This is board code, it shouldn't be reaching into the internals
of the SoC object like this. The board code probably already
has the right MemoryRegion because it was the one that passed
it to the SoC link porperty in the first place.

thanks
-- PMM
