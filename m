Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1260784lfk;
        Mon, 5 Jul 2021 07:08:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzksWeF7RKNppZJ0JtFsndKiH8Zno3YKJbRvlJOss5ZwimqxsuIBedRtHQq/wrOZpdb8o8A
X-Received: by 2002:a17:906:bc83:: with SMTP id lv3mr13427732ejb.133.1625494094358;
        Mon, 05 Jul 2021 07:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625494094; cv=none;
        d=google.com; s=arc-20160816;
        b=wJHKn/wZN/4bk1ygJJyItczMFgTVlKvIOf0ilYQ3C+aCvi3odP4bfZJWTpreiBsLmF
         v3Sne5YWQFmeew7j7dT/fgfHVFP4T14BvAcn7/p8CitWNno0NNtq2fjlsEWGqcyrmKZe
         Rioml9PTMdzmXTjMlTr2qECsd3ducmqMhpN3c+77e3Pg2Fop7upm7JzxfnEJlG7T0NX1
         /ThuowZhh0rL9Ld6FMg5shSktHbzo8zunuxCtBEjg5oGzlKTt5cacWFnqbPEvX/wlgUW
         j8hSl1I+T83xafJDCUSEORLlKYfvSKUSqaNqunpjKlf2T4h8eTpap1+NiTgIgjciV14t
         qFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y61USB1/SUcg3py8FtuucxuF8UNof2a3ssdHL3nsCLY=;
        b=yGCSy/pB6yqHITsqx47p/6Cop49rLyLXVh7nNgiUnhrTwzpb41VjEDEQHfefpPrnSH
         iIur7nMEMWCSvCnzaHXpdS/sUFBxIjyM/vwxdxTEyyYNak4M1IecdH4ZRi7D3JYhMN/M
         lLaE2SGfsU46N8sJlx9+ekX0/1ZLwzesn9hQ3rwuQE60KPh92NbT3bUlDDkb8rFt9FoV
         gl8ynLw3giLtwjt81EEPb/3lV1A+KvFs5Byq62vpUQceVdsNhh1uDmpWXnSqwlklazJG
         Z/4IfotRVZ7gt89UhEHzaAE7GR2DASLT1QTzjwjOfXTlPZIeOcjp4Ju4Ktnkw6QQl4Y9
         zEIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fuVl80GN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si13513700ejm.455.2021.07.05.07.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 07:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fuVl80GN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0PGf-0000zF-D0
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 10:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PGW-0000yg-SM
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 10:08:04 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PGS-0001VR-BT
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 10:08:04 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ga42so11911761ejc.6
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y61USB1/SUcg3py8FtuucxuF8UNof2a3ssdHL3nsCLY=;
 b=fuVl80GNalIudAvJj3krN8L1XaZDtWJXxr2Si8Rq4VZb8HBCjgllGmNu+oUQFdY08w
 PPmQkPVaCcZRvPVwOi06qWWxhhwLxIa7xT1CUoFHN3NoFq8KIfcyRbfHcBcT4JfjZ3Uo
 nAbLIotkFkH8suKp6oTUQw4Y9OIhAV/GTyomAMoGVi+07KQByGA070tRymmTEOLzqyHB
 jCAJxKLzoozFF371VAxOdxvBjlOuIsOp+RkInWSX1/1YG2AKWm+pjH2lF7zDbgI/vrPh
 qBrWKjH1sTP3094lqzeHUtVMnGIagFNKmunkJU0qL6iJHaYmMe3Qz6haA9InsQ6mJzQ0
 NwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y61USB1/SUcg3py8FtuucxuF8UNof2a3ssdHL3nsCLY=;
 b=lgnLD1pOO3lNhUMtMzx9XmweoOUCn2dACqBbaY46Y7LHhFG17sFw2DzWQUn3k7t/V5
 F6wqd4PWMNT5EgZKwrMSvsqX++Mkt4cZ+fT8D27tdoktiPVlls6nnnKJxvynFk5efkU3
 7/L1w0Zu9L81urhPmkQGatbUucK4l03Yi08S0cDQTZKVdul5ZFeq/53qg/EwkyoMl4Em
 E1Tkk5Dt7xlE7Ckc2C67cfIihtfcBAwdqNDTOxMhmFdvV0xCxE6t1iUX7421rJxyZ2kF
 UzVQGnmNMktGAkgZD+l789VdQZdkhHFhdJzqp5ENM4XOgJrA+SuD73zw2faPjqQhNqDi
 tjVA==
X-Gm-Message-State: AOAM533Oxx0TrhRBqsAcB2n8hR1AfzBRnJBoquMmb1OnjbC/Zi6hzXTV
 9SgWVzPlRrfd9yPrekrT5r+7/Vtmr+/1hvt+oQ3IbQ==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr13438772ejy.407.1625494078628; 
 Mon, 05 Jul 2021 07:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:07:20 +0100
Message-ID: <CAFEAcA-e9-oBgK9wi6DOp5SGGd4vm-3sQY-fFn7HdTM842D1mg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A+k5iE99bZKi

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 361 ++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |  26 +++
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 388 insertions(+), 1 deletion(-)

> +/*
> + * This function handles the processing of following commands based on
> + * the ItsCmdType parameter passed:-
> + * 1. trigerring of lpi interrupt translation via ITS INT command
> + * 2. trigerring of lpi interrupt translation via gits_translater register
> + * 3. handling of ITS CLEAR command
> + * 4. handling of ITS DISCARD command
> + */

"triggering"

>  #define DEVID_SHIFT                  32
>  #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)

> @@ -347,6 +368,11 @@ FIELD(MAPC, RDBASE, 16, 32)
>   * vPEID = 16 bits
>   */
>  #define ITS_ITT_ENTRY_SIZE            0xC
> +#define ITE_ENTRY_INTTYPE_SHIFT        1
> +#define ITE_ENTRY_INTID_SHIFT          2
> +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
> +#define ITE_ENTRY_INTSP_SHIFT          26
> +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)

This is still using a MASK value that's at the bottom of the
integer, not in its shifted location.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
