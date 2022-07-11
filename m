Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp839934lfp;
        Mon, 11 Jul 2022 06:40:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3VH/BfcqiQ+hNP9SmP/btnFWYJ9lc5iGl8tgnjmHzuMKs+vCyOF277tz5FTym/la3dGA/
X-Received: by 2002:a17:907:2d9e:b0:726:a03a:16c4 with SMTP id gt30-20020a1709072d9e00b00726a03a16c4mr17959907ejc.742.1657546821947;
        Mon, 11 Jul 2022 06:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657546821; cv=none;
        d=google.com; s=arc-20160816;
        b=LnV7XOA7pB8/oBBzzE1dbOcQzjoxE6go464ZwFE5LSHnB/5xK3zVIO59Y7s/gyeo4M
         YPSxuGwPy/j/duO3EfwB42MAUNGyP38w64mpuZiOhp+KcuW8wNQoMkMiD9sLtq9zXSbd
         bnE3zKrj85rOHHb5e/V2bMbWyNJQuUO4lD/lrQ09UXdSNww4BZGpPiq7Q8noMTH+8+NN
         sU1sT5btE4AoQzrfUvLQ7gP1gao3jI1BJimBBJuGMc0P9wuS1fvoYFJlaIHrnmBVlH+U
         5ZfCsNAhgnDJ+p4Luts/2awcpSZfD6uBox/URUeEk2QlWO3bYTKojCJ+BFMPzMJqMTyT
         dVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=J8+lreWmMpb/Gxpom1GmVEtnuVBLWaJoJSxRJlnCM7g=;
        b=E23C71jFyCOuOsiC9p51KereGeCdeEzVrDNbOO0xZ2X7CLneGpsM7kVRijbp6i0usC
         MpVREOa+JbnDCwxG/WPDJRt8Kt3EL8h0X6Z5sRgoEMh5RuYiimF4A4o+DqlgkWFMsmyo
         8u7nIivxD6lbXf/Oy5M/q4L/GWjjpCXGlk6+Ft9VQ6euN18LQap/tL69CkY3kqinuzTi
         QFxJIwo8vM3pXrzCRGyLMcTsYShcXP+67xqXx//jfX9sqpFuLbqrq+22blwpDa20P0xW
         LWCD1kgMMBvR5vwvV80egH23tJzV2IcmxsW3zNJULEJt6gUP97fukqRhWKcpipawBQSJ
         Qljw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sNBVCv8K;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id o22-20020a170906975600b0072636d040c2si11096225ejy.104.2022.07.11.06.40.21;
        Mon, 11 Jul 2022 06:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sNBVCv8K;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiGKNkV (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 11 Jul 2022 09:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiGKNkT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 Jul 2022 09:40:19 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DE94D809
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 06:40:17 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31c9b70c382so49125097b3.6
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J8+lreWmMpb/Gxpom1GmVEtnuVBLWaJoJSxRJlnCM7g=;
        b=sNBVCv8KeGMOHXZ6+wr1bzjVTHlBsQkjX8nYTQ2+ak3e8MEvrorYuuSNBL67EY7giK
         RjJ2Mc0I1ex6+wL91BvbMgsjkckC12Xtu5wrhNxbGKGj2fGDGaCHsTPSChCmBjYVMhSd
         LqDolxIlEigyjuAvH7jxwcgBTYopreKTt42S4Mq1cWtDxfwmPDBingY+wlUYKPR5nAiQ
         7+yEM9XsrE7wdPayL0isD03rKNI3Txj9uj4gvx2OISs1M81/jsmaPyxQsdhHq/bQPOik
         f9HEGKgNZ658V2JuQhk9UFuCD3JjBSY3bpB20raDV14/WK7gR3nAttKYjY2shLByztk5
         K+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J8+lreWmMpb/Gxpom1GmVEtnuVBLWaJoJSxRJlnCM7g=;
        b=h+LnCG8KnKK9fagSUDdFHXl5XOF3jrkCI8Jj5AxFlRcOWgWwyhn9cMmd+R1FsRGvzq
         D08D+upmSHi4Jfiqlb5vOZWCA4aPxtH0m5q9aw1krJLblry3xe6p4K68G7g7RAmcl/VM
         kpuoDpZp1e/3Sfe95JDTzGx5Ev42XBdiyVvZmrU8SdDwkn5WjLrUjlG32w5lA89TXfgD
         Z+Q9LP358QZ/0FXADgw2YmyWCqLAxVNZGDzEeOy6Gh8kYCqdfeJ2qYvt81uJwipSzf/6
         YIQgNI4jOyyfGFgzWuNqZ0P1hvKfDKCJVJ/FobdlODtddfZpuN/ps8OhH8wIltBtW5ln
         LxQA==
X-Gm-Message-State: AJIora9R67mURS4vgzHqiU7IS1Y3CxYN+fM6kRYO/YMYP7PzhFUT4qhJ
        Y3lZz1+ItRObdiDqi3VCLLqQa2aI5hqLOJFlfF95qA==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr18967337ywg.329.1657546816621; Mon, 11
 Jul 2022 06:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220707161656.41664-1-cohuck@redhat.com> <YswkdVeESqf5sknQ@work-vm>
In-Reply-To: <YswkdVeESqf5sknQ@work-vm>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 11 Jul 2022 14:39:38 +0100
Message-ID: <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
To:     "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc:     Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Eric Auger <eauger@redhat.com>,
        Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
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
X-TUID: rbZ47qoVYBxf

On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> But, ignoring postcopy for a minute, with KVM how do different types of
> backing memory work - e.g. if I back a region of guest memory with
> /dev/shm/something or a hugepage equivalent, where does the MTE memory
> come from, and how do you set it?

Generally in an MTE system anything that's "plain old RAM" is expected
to support tags. (The architecture manual calls this "conventional
memory". This isn't quite the same as "anything that looks RAM-like",
e.g. the graphics card framebuffer doesn't have to support tags!)

One plausible implementation is that the firmware and memory controller
are in cahoots and arrange that the appropriate fraction of the DRAM is
reserved for holding tags (and inaccessible as normal RAM even by the OS);
but where the tags are stored is entirely impdef and an implementation
could choose to put the tags in their own entirely separate storage if
it liked. The only way to access the tag storage is via the instructions
for getting and setting tags.

-- PMM
