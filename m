Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1907830ejb;
        Fri, 4 Aug 2023 10:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgmudT0tOv0UvmSzZ0q9njoWIvbYiSioVeTPA36dIuVjNYDA3HTm4f8Cnwj1nDbLGZNvgI
X-Received: by 2002:a17:90a:43a7:b0:268:1745:b61 with SMTP id r36-20020a17090a43a700b0026817450b61mr2120890pjg.34.1691170113948;
        Fri, 04 Aug 2023 10:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691170113; cv=none;
        d=google.com; s=arc-20160816;
        b=M0A3L/oto7jyUpN1ISigX7+gbUqZcfBMpvSS6XAqPbgvCL2U0zRgZIYJo+bh3Z7T/o
         x/vtES1oRbZSSpOsIYlCt0M1Q8PRNdjdYTCvbB772eyPXJxKKDse2VUTfoUB7dbsGRQ4
         j5BwHJNNN+uBdJrR2wFqQFMeAXeCMCTOVojwVQCNi+ZaIJJNHBhGuiUo/wtZyEgEJhuQ
         r0Q7vwk7jIUnygNO5XPi27TUOPDecPJNilCAKnb8OfhrFeaaZ7FL7F3bwA5eMXVe5q8g
         s/miO+9J283wReH4pM+Q1MctXuUna8rAYu1nk66SLYb0trIz+l/lfDbfVGvqw27dE91H
         LtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=HKSGMt871RVYZS+5tOox3pOxnzR9gBOIV6Eu0azAJPw=;
        fh=XsubhDhda3Jy2jwSl6ul4B/gOYNpncuz9O4UsSnbTZg=;
        b=NGjuXPXxkVnXJKGZHc5yxapkv425gxyrMm7zIbxi/gu6tiM7xPIDhQZKJSUPYQzh6s
         HOQR4LJMjHG21OHuJ+a4Lgslvrkey1GiILeRIBVRx7ElcpZVN/y2pEUM/qwV7M2LCpOT
         A4nXicis4e/NLT8WYdxPiWu/Az/zGDachC9gXOn916YcJ5p2gb5pEJDP6jayd9sC56tb
         AuN2RtTq+gp5MyC3EYmYGhd9ZlknbpKUlpXzN8wGuR/ehXizUGVlGZgSErYxxT+z/78u
         9cIEtjT8a6s5gD0kAVL89iOOEWUtHsr+haLU0CsNNkpXw2fblfL6Yo3dzFQd62nyZxmz
         be2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KFjb51Ij;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id lt14-20020a17090b354e00b0026811da0fafsi2091326pjb.65.2023.08.04.10.28.33;
        Fri, 04 Aug 2023 10:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KFjb51Ij;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjHDR2c (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 4 Aug 2023 13:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbjHDR2a (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 4 Aug 2023 13:28:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5063C25
        for <kvm@vger.kernel.org>; Fri,  4 Aug 2023 10:28:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4057411e87.2
        for <kvm@vger.kernel.org>; Fri, 04 Aug 2023 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691170107; x=1691774907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKSGMt871RVYZS+5tOox3pOxnzR9gBOIV6Eu0azAJPw=;
        b=KFjb51Ij6sPuGiIKf/YMU2Em4OZDiUVowdxbaUgfXrjvLlRFUtmlrB3jyjS1fkYHHX
         fRbv9E0e2sp6u4KPOndYQHxvpzwg7B7LGtNUS77C4AB0evzBJBKFSJsQPyrbL9lLCZVN
         x28yvuUy8/xJ4bP/25Xvk0mPVszJpJ9bWkkfcie9VMFzYJ6a9BqQUXULFBn43OmREDln
         mJhMmpggF5AszKv76UrLnF20hp73dDRbzcttvyq7LDrsW6fMmubHwPZ1bGX1l06Tg27T
         2pj97XveFkCMBNGrHIyoojCk0U15omluXF0XBspurRzrayrTFprQ1wpU6hUip8FEKuD6
         rZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691170107; x=1691774907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKSGMt871RVYZS+5tOox3pOxnzR9gBOIV6Eu0azAJPw=;
        b=DJdSfGoXSkt7Yb80OsZSNj6IS2MPVJAJZwOykziqeZRy1T/26AntT4fqlMEjIg3KLH
         wzVRsRtVR0MmZrRKnSeIEDGsj1k3MpULOMduStLWC9syKJ1jqwcZFDjN1YhXvF2u8WOm
         qv4eNrz5kj2a6MTShLWAw7Rp5mKZp7BWzoEXY1di1eij34HQ6aVx9rpyRtYwgpO6JfNm
         1vV7uRoQfxWSj0luV8ehDJuDB58m3cs224w64ga+mh0s51CXCZnP5tRf+PojBcuPrhzI
         PHvvgPTosTVlfCG4QIPej7HpjykMqfvo7gCf3rkINN7Y4SozdIqpxV/JvvYoKl/J9iXH
         h+UA==
X-Gm-Message-State: AOJu0Yz4l/OJptE+hslZIpXfg05DdZ3AjI/nbDh9hK8xJhyorgL9IjGw
        vI3oUmDGWHATNkemiHWdxqjfqeRMR1XtRpCZ0UAHHQ==
X-Received: by 2002:a05:6512:3b8f:b0:4fb:8948:2b28 with SMTP id
 g15-20020a0565123b8f00b004fb89482b28mr2407101lfv.63.1691170107789; Fri, 04
 Aug 2023 10:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230727073134.134102-1-akihiko.odaki@daynix.com> <20230727073134.134102-5-akihiko.odaki@daynix.com>
In-Reply-To: <20230727073134.134102-5-akihiko.odaki@daynix.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 4 Aug 2023 18:28:16 +0100
Message-ID: <CAFEAcA9dGh4iq+gVOoMRHhkS-VhWwUUtoeQ4r-1YuK1kDMRABw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] accel/kvm: Use negative KVM type for error propagation
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: o1HvNn8Fwa5A

On Thu, 27 Jul 2023 at 08:31, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> On MIPS, kvm_arch_get_default_type() returns a negative value when an
> error occurred so handle the case. Also, let other machines return
> negative values when errors occur and declare returning a negative
> value as the correct way to propagate an error that happened when
> determining KVM type.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  accel/kvm/kvm-all.c | 5 +++++
>  hw/arm/virt.c       | 2 +-
>  hw/ppc/spapr.c      | 2 +-
>  3 files changed, 7 insertions(+), 2 deletions(-)

I might have put this earlier in the series, but we get to
the same place in the end whichever way around we do it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
