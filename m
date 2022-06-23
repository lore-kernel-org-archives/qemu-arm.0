Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2915549lft;
        Thu, 23 Jun 2022 05:31:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v437UHsg9Nko0VtJtIkuzuF3VMk3EtleZGjH2RoFFbOf5bymum6qXZxdhp43gtvrcZ2tvP
X-Received: by 2002:aa7:c801:0:b0:435:5a08:f54c with SMTP id a1-20020aa7c801000000b004355a08f54cmr10661783edt.254.1655987465158;
        Thu, 23 Jun 2022 05:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655987465; cv=none;
        d=google.com; s=arc-20160816;
        b=d/i4N1aJukibBOhVnLU7k1B1+o+a++Vo50NY21qw3u2ev3G8B7vcFiJod8cNbEey8t
         SxaWASvQhSWNqMW+7AEtnc7W2Mm4evavCscWj2FWW+2a7g6k4NZ6SVoTILAgHtSYcwy/
         y3RoLy9+Df1QyK8KhsTPreMkIKwAGwDvyb/VQolRDQr5udlMgiWxWDdCqGyNSMUqxbbx
         mkCougBM1siAkrUmjsBChhjZK4PCTk+rn2ove9eAHlak5o9ZG8mjrjw5WtT4kz3QbBDX
         vPM7OJrqGIZOFegOd3LnSiO+b3fH5Ck7YR+I5/xIZWwiadp/Fs53vBqP9LWEoNLH+fTL
         sIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=h4FAaAxDkft/GYKrZH8p1e5O8Z/g+GpcmXs91Mv5s28=;
        b=hkDjh/kV11aNBA6IZEyqQE3g4BhgID851tOo4GmVW83mX/R7M4tHvKWaejY/3j2JGQ
         Zd98nBd56/vfMTgeMqgMV1p+DIvCMJ4gXINVo8oTVQD+4MyHxM68AQbI1NAnXgcDr1FY
         +6k7M8TrwKOgMVdl1aMO1Lgiw5zWhGnBQs5KEhDlVtnv/z/FCamZV8Gy9oACCFRXpATg
         foIVLPwYXbX3kCevftjZLu/qPqjxa8hZJbe8wRAQuPZJLYOr5CY7yw3OoEUMrFEIvV/c
         4sIqgo1XA0vCuQi1FIU5H6LOJ8KComIci6bZ03ziomM6K5dSUFm48xrTrHidsoknB+u3
         7AYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w/PZidQ0";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id cs15-20020a170906dc8f00b007262944c61csi1573682ejc.778.2022.06.23.05.31.04;
        Thu, 23 Jun 2022 05:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w/PZidQ0";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiFWMbC (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 23 Jun 2022 08:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiFWMa7 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:30:59 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1BA41F87
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:30:58 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3137316bb69so192049637b3.10
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4FAaAxDkft/GYKrZH8p1e5O8Z/g+GpcmXs91Mv5s28=;
        b=w/PZidQ07LR5n2YGfOx4cK5vDAtot3ycJ9M2vvnvf/oz5ZzRvdaWSE+BXZ7jBdESwQ
         nmeqNxjz8XVaem0TXV8wZO+8wR3PN0WwfA97V3e//IHNwjVyXW7ASm71/Gjxa94C5wbc
         dC6kr0uvE6l1jO73LuFVv7vB7rrGjzVowPS9o0cwFTBg3ynaZ51CTt37XY3WqCchNQzf
         npTyXNGPxP7wSQUdDtxXdFIEeGQgdOQkVPtrLeqdwndaaJBGrKrEFavDLy7KvmhofpTH
         1OpH+ApP6ejgyZoP9UzJTaMqofMlGZoMEIG7iL9LPpmLqpgZDWmCQ7MCx6rkmtWhXDXq
         dGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4FAaAxDkft/GYKrZH8p1e5O8Z/g+GpcmXs91Mv5s28=;
        b=ageH7RPxMCQBk4mAsNx7CZUNcaXGO9aaaqvHeaReHsuv1bNjnwea9/ae64WGk2wn5k
         EH47fG0/Fh43Qjc+M8Rc9MpRcHaC97IjDs6iKwY1l+xxAamwIFNYvoLIXoT7CmyApNKh
         3trBM5gJzfZJ+Y+BoEvWXYNLXZiV8qpfEFmIsFDvmkoL5l74snQJn2kYd9iHpW9mQ9MN
         cbQgQFiTVH5Abi5r8l+Vxgg4hPHnSH4yEIi6YH5OhcsXw6w6lgIwwngOKXWx/JjmuirI
         Y0YAWpVHvtWK1xJmti9nl9JLsR2/ogdSUB5HYB3sxAcF1dcMQF0Ue7NLCTOVrRkYCQWv
         9dkw==
X-Gm-Message-State: AJIora9c0hSiJefxGhnWF2Q8Hpgb8FMQNmD1WEJzism6xrBmfcydcfP2
        VsipDMg0GdniEhr2KtkgwyD6lFWO5y/axyAf3LUOuQ==
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr10658496ywd.347.1655987457511; Thu, 23
 Jun 2022 05:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220623095825.2038562-1-pdel@fb.com> <20220623095825.2038562-7-pdel@fb.com>
In-Reply-To: <20220623095825.2038562-7-pdel@fb.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 23 Jun 2022 13:30:46 +0100
Message-ID: <CAFEAcA-F59JEVBVYSdGX4KcS5d+EB4dNoZ2iE1aitSvo3B7Yfw@mail.gmail.com>
Subject: Re: [PATCH 06/14] aspeed: Add system-memory QOM link to SoC
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
X-TUID: OO5H6EV8pOLJ

On Thu, 23 Jun 2022 at 12:31, Peter Delevoryas <pdel@fb.com> wrote:
>
> Right now it's just defined as the regular global system memory. If we
> migrate all the SoC code to use this property instead of directly calling
> get_system_memory(), then we can restrict the memory container for the SoC,
> which will be useful for multi-SoC machines.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

>  static Property aspeed_soc_properties[] = {
> +    DEFINE_PROP_LINK("system-memory", AspeedSoCState, system_memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),

To the extent that we have a convention, we tend to call this
property on an SoC or CPU "memory", I think. (Better suggestions
welcome...)

-- PMM
