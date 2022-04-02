Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1318143lfb;
        Fri, 1 Apr 2022 19:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1quWH4BtjN/Dy8T3gIt1cM6BfV0nU0C0HH5StA0/68lLxz5VKKj7Hs7iGcLAgLQFRaR1V
X-Received: by 2002:a05:6214:76a:b0:443:6326:8a90 with SMTP id f10-20020a056214076a00b0044363268a90mr21851669qvz.107.1648866544231;
        Fri, 01 Apr 2022 19:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648866544; cv=none;
        d=google.com; s=arc-20160816;
        b=SQLPBisXeTjT3FddhE9WK9Gw1jwVICNWTN/wPw+BvR5UZksU7/tMyekBu7e59kkRV6
         KbshA36sDSekV7QuaemvCKJaKiBPgIoNyWqRDqumP1OaIrMwLAHFgsIuncadQSSD3uzO
         SfzxI/bYBwyL1HBN5lY/cJaxJ6ojvd3hINr8yc3aVxh9bhVTyBSiQlX983PwbGHyWR68
         6XTH3f1lBh61dMST/3UaKQ7BsH/GkhBCAs9DqvbvsAhKAezQsSGqwmw4KvVlgnubnLOB
         sULUOc3QiEsIbIysMo3MPDDpuiHm2EHvtz9Ln1wOEDg8mZMP5uAAdC2t4rok7iEGbgbO
         L8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2XkKUPx+UDhBJ9rg/c8lN99LCUH+q5iXJoBX4wiVhfs=;
        b=JlOjxUbBpf7p4hDJ0os6MnzpllrguZqARr5HcaIENHqnE+tn0/76dJIWLLW8tO6cUC
         R5/VpwvMwRwOXzbPt0tMrYwyKd6gyBOzorzP0NMPZztJblGD6D4eD18V2zYFmaAbMHhi
         DX/iXPfMW2RdZ74XnE8nsOUhiHJdXvp0Zsq7TClSPSt+hYVJBj1+FJ/9VeZ5yUDDOjPd
         2c4uc/sLj2NDIQcfg1fD6MXLYynlntrcBMqpUOQ6lEonb3vh3q5vzG/7qlDhmM9sR+Rn
         HSRHk2e/PW5dwI91wf+DIHQvkS+G+hRImgh4zYUykMUUxNOVzo/vC6ZEsnQxbQgBIJcF
         qjkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=YUZfBcdY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n127-20020a37bd85000000b0067e4be23a56si1502098qkf.667.2022.04.01.19.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 19:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=YUZfBcdY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naTVf-0005bs-Ni
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 22:29:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1naTVS-0005Wf-Mr
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 22:28:50 -0400
Received: from [2607:f8b0:4864:20::72a] (port=46898
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1naTVQ-0000qo-K9
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 22:28:50 -0400
Received: by mail-qk1-x72a.google.com with SMTP id r127so3522455qke.13
 for <qemu-arm@nongnu.org>; Fri, 01 Apr 2022 19:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XkKUPx+UDhBJ9rg/c8lN99LCUH+q5iXJoBX4wiVhfs=;
 b=YUZfBcdYZif+cNuuqyJT6bOsN4zwl+rgxWTERSU0O3JbgoF2Af6N9I+FDUvM9xHSOX
 0nXaKm4rqd+ewNtmizkok16UjkHIerKgPzhQTf8qLGDlnTfOev+/x5wm8lkN3DNjpGIx
 Cy4BMSpCDPmoLQcTiOWIe5W4kXLP0KKlD/+F8qVqYuZV5//6K4AZ7Bhv0v8xZ9Mvzl77
 SxuRKf8xOYpamhjxEHQHVTcbKJuQo40dx44IDPma0peDMqPWjGo58vD4aSfHjYjXhsGr
 ksPlUeKtX4jvVjt1Vzv6IC0tgSw5bWwlRXf1Axc66f8BmLkL551hm6wmCwlMWbC4Q2W+
 i0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XkKUPx+UDhBJ9rg/c8lN99LCUH+q5iXJoBX4wiVhfs=;
 b=yXFyazMlb+ULgvyJw7uHDPSweATMXrb3qLleY0Rzy1Z7aQK5Fft4tHrguxohG/0NsW
 ul/wF/FWjU1lpuCDngEWLEaL6Yr2peTe5CfGbVkjmxsWCxhuW6PaHmfqo0avdN8KCwYE
 S+QTAh+4wnUL1nquS4PmJYGEalHLn8gLbZwjnavbH2Z/Nf6sm4hiqtujaifcSViiheWx
 wHY2fdjjaa8rtLTo0XdkrOnOSyC2hJda75sMEOvoF71+1swEZhsCCwL9icJ5lMqmvNQO
 y8vOsBMksUPIkIA/auT/VDGXETn0UHIvrmC/Cjad3rQCDZ//mz+P1W1mFBjbjmrFdxHb
 gh5w==
X-Gm-Message-State: AOAM5312wHQlFfyhL0dliFfsP2TM5CYMUtdjXDqSI0Vv7WGTB8j5kGXq
 /w8NIE6HiqKGJjJk8vcTcUCgE4lDKpYnpSuH7FgfFAkUaIxVug2xXWE=
X-Received: by 2002:a05:620a:2847:b0:67d:2bad:422f with SMTP id
 h7-20020a05620a284700b0067d2bad422fmr8402072qkp.559.1648866526670; Fri, 01
 Apr 2022 19:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
 <CAFEAcA_rMuWkobjBoFJdYQqc=qvyUPrq9_-W+TkrNdTf+iBgsw@mail.gmail.com>
In-Reply-To: <CAFEAcA_rMuWkobjBoFJdYQqc=qvyUPrq9_-W+TkrNdTf+iBgsw@mail.gmail.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Sat, 2 Apr 2022 10:28:35 +0800
Message-ID: <CADXGpufhJn9L4U_Y6gcdyzy1XMV3C5PM5T+T0ruaqvBnHicyhA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::72a;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mXNwtMh6HEe6

On Fri, Apr 1, 2022 at 9:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
> >
> > Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> > ---
> >  hw/arm/exynos4210.c           | 26 +++++++++++
> >  hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
> >  hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
> >  include/hw/arm/exynos4210.h   | 11 ++---
> >  include/hw/core/split-irq.h   |  5 +--
> >  5 files changed, 126 insertions(+), 33 deletions(-)
>
> Looking at this patch, I think it's ended up quite complicated
> because the exynos4210 code as it stands today is doing
> some rather odd things with interrupts. I'm going to have a
> go at some refactoring patches which try to clean some of that
> oddness up into code more like what we'd write today, which
> should make getting rid of the use of qemu_split_irq() a bit easier.

Should we wait for the refactoring to be done and rebase this patch set on it,
or just remove exynos4210 related code? I'm glad to see if there's anything I
can help with the refactoring.

Thanks for your review.
Li
