Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp981630lfq;
        Thu, 24 Feb 2022 06:42:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGX4vZ2m9B448/pdes0zgavUeW4v2WUb3HarM8sswQlG89ZO+xx+K2ZIymWPUS0dZuunGU
X-Received: by 2002:a17:902:ead1:b0:14f:95e1:86fe with SMTP id p17-20020a170902ead100b0014f95e186femr2806453pld.21.1645713729639;
        Thu, 24 Feb 2022 06:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645713729; cv=none;
        d=google.com; s=arc-20160816;
        b=bK9aMZ3oL8mchxW+LOYYC+Cdyn2mq8/zlAdLxPsd6r53lONC/TLRHoa93ZIBgMzh1R
         weMwzy2uFrwTJYlbOJR9H0m3YPpwUyq63gvOO/mxBxiXPtwM/r2QVzCAIYnY+etOkkjH
         YygLdxqud4mxQi6qCB4NFTABt6ENZY90TafGocgjC2m3V6u94Sx7jP5lJ4V0jeHqsAU4
         PmDLFNbm/Pg77CMInpBIZsTtGDq/UXtGXbQ6t5Wzg45yDMslfzwAelkx4gSEHuXr2Yuy
         BxXji/uw5SI2wafYaK5adrmgrWtezU1x8jv9Lvy+t7zguzG3ZICpGhFASseDvMZ9YhaM
         3CzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=sKeXaQKZcYhfHAETWvUqal4j+oBFrfcvS+Bi018smAk=;
        b=GcJDn9I2H3c2010kicECH9gPpWKbI8nwDeBbWV0MQ9eYQOaEM4caI80HnxQOQDzBFV
         cQ4tXE5YlKVl4SUSeFRPPWrky09mUxlNfy/CZh3eKGnBRuL0EOpr7OaC3zU8CpVjIm2H
         vSEYhBKOYTasFvFX5wDWAhPKdDAc0du5x22cz333y4HA/IKd+vNvxJAdUGeKeqGI9B04
         BwgrNsFw8fgAhFAd4nY4lzQPy7oX6HiQ42Qtwy2LqdHIhsMESy8VM+tujrysHLkkUBDm
         /TS6ZTjPRiVT4eaFqBABq145X+GDqoY6BkauT98PxNP/B3oLY3DYJoecRqOYwSUhjp0i
         QLhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i8b3IEuY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id l5si3129235plh.261.2022.02.24.06.42.09;
        Thu, 24 Feb 2022 06:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i8b3IEuY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235587AbiBXOmh (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 24 Feb 2022 09:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbiBXOmg (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 24 Feb 2022 09:42:36 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588763B285
        for <kvm@vger.kernel.org>; Thu, 24 Feb 2022 06:42:06 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2d6923bca1aso27271427b3.9
        for <kvm@vger.kernel.org>; Thu, 24 Feb 2022 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sKeXaQKZcYhfHAETWvUqal4j+oBFrfcvS+Bi018smAk=;
        b=i8b3IEuY8xnQiotcb9r3BPS1DzgwwQq+MkfZUJ2zmc9sMqE2nrONKHQKOK97rONLMD
         qSUByr10cFvuEE5nG6tRQUnG3zy66iAh6czS2B+3ij1NfpakoGfQ7UtoIC54PO94RgTi
         Vl6HoPCDEd4qFVEc2D8RFfRFehEDGy+8iYg7nujWLPm/rvp+wikNCJxeXLyEdu1plEg7
         12S0XQeI3dTHm7ctppiRVdL93mrVGmP/D4VcdYzL3wehoyVLeagOyVCJ2e40cT5SJTo2
         2Igei6IdUT+nI9gCKPQ+xtVfr86W1R6rW8bqRvbOYWor6wIDojYRC4tmhSc6BF0+KZW3
         SJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sKeXaQKZcYhfHAETWvUqal4j+oBFrfcvS+Bi018smAk=;
        b=lwsu3p2ThE27AKCQGE4PFiGAwrg3tV9rL5qTXerGa11pUFdjanV6/X4li7Zk0gFgSW
         BHU0036nYVyHlEn2RJhgHxSzqLX8vFIvitJ5hVLM84G/xfcbVD81oDD0iqjCV4xxqlRk
         ULtk3SW3t2c6s0M4U6X8Be833cEMGA7CTpnIuuH2cIbSnvrN0g6LynXeXsHDfr23U52u
         SweVULLmoX132uinwUD9oOhEHekQzlzBI1zVxgFbxelqUaNTa/HKXHnfI4VoJcvTykoA
         wuRF0dttTN+mF1Vvv7YkHcMPLWBgMnvBOaXYWHRGRyhbet+s8Gy+/RHEMsjfhXggE43f
         JtkA==
X-Gm-Message-State: AOAM532Vo9V/TofoW518dNYDGFSoy1RiCE6cx+RA7g63Q1h2RAJZMyZr
        xPce0BGGyNp1ZbG3mGjZhTP4SnLXEfmihQsCJDdWGA==
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr2678540ywh.329.1645713725623; Thu, 24
 Feb 2022 06:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20220224143716.14576-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220224143716.14576-1-akihiko.odaki@gmail.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 24 Feb 2022 14:41:54 +0000
Message-ID: <CAFEAcA8JgMFhHGd91A=EzVNNgUZu-8YEKi_cdOnwnitrtH=3Dw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To:     Akihiko Odaki <akihiko.odaki@gmail.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <agraf@csgraf.de>
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
X-TUID: YE/ZYMGKeqWB

On Thu, 24 Feb 2022 at 14:37, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Support the latest PSCI on TCG and HVF. A 64-bit function called from
> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> they do not implement mandatory functions.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

You didn't need to repost this; I've already queued it.

thanks
-- PMM
