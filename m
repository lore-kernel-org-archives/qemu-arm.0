Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1456323ejn;
        Fri, 28 Oct 2022 11:07:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46qr4byGIMWVlHbOMUnyla1baxDDSEXtTcWnX9C/jyJg3eHO/48g8svNpLPbx+KYUIIDNV
X-Received: by 2002:a05:620a:2984:b0:6ee:cc6b:5945 with SMTP id r4-20020a05620a298400b006eecc6b5945mr370763qkp.323.1666980442605;
        Fri, 28 Oct 2022 11:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666980442; cv=none;
        d=google.com; s=arc-20160816;
        b=cyYNwFObVErFb2PPrktui+5UwKkw1wt2bF41g/v7IUw06igm2REg3Of7y27kQQRk8w
         3kubW6g/GtZzPnXZkUL86dE+ftRvBkCSxx0dP7OhwE4v2vHuC1N/Ea8XjY0RabraCiTo
         qPmHXp1sLXfnAkCo7b0aK2QFJ9cn6CELP8Nor4ZgtZba6S5VuhPLpJ1NODna7IDOz9MP
         zO05ZQGd663qhJUnvlxPy05UCNg196baSeSDmivAjDBZ+AEDfTyqsppgnvOx6TGvg9Fx
         IHJZB/IAglD1zxClNqTyTEFHvekhBWDlosO+7+EE9woxnjSbCfscdTwTU+vCq598oCZX
         a1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cgiUie0XsNZhwdSCJ1tdnJfUfdSXLnzs8dTzYxI7w/I=;
        b=oVl+JMZnQ8d9aoWDSfhDdZo2zdIw6kw965twifA5eiLM1fDmPSbkgSTuyp5bq7fihN
         c5BbG5nQrUMwyDBU8QeYDVQjFYcbXUHJBWQUHHwl6He3X6XcMcwnthR58BS93u30jWH+
         +oSZUk7FTbCZj+R6PPWuXVEVCfI5h64IuTvwtMrbcEZWIOpWWAZq2xUMfXGXy1W77/Dx
         T3AH/jf8v+QkMSEjW3T2ZDT+0BoqgDjeKAbdyUelYxnjxvU7WSxehdYj8orCKoyJzvcJ
         c4BXIhw3QQ9k+YqhKvGa832gkVR287e++hnatlneS95iMyq4jhP0CAsglHDmbGdTI816
         CvNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3XcgdDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05622a139400b0039850f05d5esi3505413qtk.750.2022.10.28.11.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 11:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3XcgdDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooTl5-0008L5-TV; Fri, 28 Oct 2022 14:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooTke-0008Iv-HT
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 14:06:42 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooTkc-0000GU-U2
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 14:06:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g24so5504757plq.3
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cgiUie0XsNZhwdSCJ1tdnJfUfdSXLnzs8dTzYxI7w/I=;
 b=J3XcgdDONEI/ueXBwVa8m0c+iFA12v5zd9NzRIDOBWBuZ/fMOn4cTdl+9mGcMEGPJo
 y8PM7aY2ShVxKatBGEt8oC7uy3+ZpXTtM76dU9SdTqFxRyQN00+xQyuYGlYs0KiflPsr
 fOEfogDcqDNSSlecT/y6byUT7WC+kQB0qOi+uSsxULubK+o+kiXk3Qtt0uf21HLjD3T9
 G3BWbtLbzBMevz7bS4v8yEuPpcuI+fThUu/3p4j6syFFErn2nAWqW5cYFGSnnZ7kyFBp
 XDbRumeXIvL4Wn0IaYI9p9NYzUd0yFic4Xb26fYJKj9mLwfQRthZFhXMW+zQPuLe0Mzw
 AHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgiUie0XsNZhwdSCJ1tdnJfUfdSXLnzs8dTzYxI7w/I=;
 b=i8bZ7m/BZG74z97vnkt/LX27oqXMXTAX5AlOg0vczFqYkO+v4ktoUPHwfTQXIDzPZr
 3rAtjUd+IMa1LIhqon6Ww8eVE2Yxegvi9rD916KEviT2EWwTSoclAdk0xG/ph4RTqo5D
 ljaBwy5vDV/qnrX9JFX/fj7NvFjtQvpa8J879aVp/fGj74jTjO35WmQT5egwvjvHsfBz
 L0Lt/EUP3ha33QyhuVeo3xWVwP83AJCznXX3VxV3cFHxxh23YKqS4BagoujIZPQWA37w
 nghb8uH6/zcUKnhlYUtxEK0P2KDk+BqHYaCtsVj+/jvmBii+6/tS/80fO83oPYXkoE3s
 q9Ug==
X-Gm-Message-State: ACrzQf0WdYTuq3b8G/opydopE6koZlLWsZXKYKg2WVJcdO84rTBwdVYz
 E0wH3xYud6wdm7pu6Bu0J2BlT/ZzpMVAA/DJizn/hA==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr203995pll.19.1666980397125; Fri, 28 Oct
 2022 11:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221024035416.34068-1-gshan@redhat.com>
 <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
In-Reply-To: <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2022 19:06:25 +0100
Message-ID: <CAFEAcA_XVOKS1mDwAMMiUeeo8CeeO-GCXmXECAJTP7Ys79bnAQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 eric.auger@redhat.com, cohuck@redhat.com, zhenyzha@redhat.com, 
 richard.henderson@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nqf37yhvdlz4

On Wed, 26 Oct 2022 at 01:30, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter and Marc,
>
> On 10/24/22 11:54 AM, Gavin Shan wrote:
> > There are three high memory regions, which are VIRT_HIGH_REDIST2,
> > VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> > are floating on highest RAM address. However, they can be disabled
> > in several cases.

> Could you help to take a look when getting a chance? I think Connie and
> Eric are close to complete the reviews, but v7 is still needed to address
> extra comments from them. I hope to make v7 mergeable if possible :)

If Eric and Connie and Marc are happy with it then I don't have
any further issues on top of that.

NB that since softfreeze is next Tuesday, this is going to be
8.0 material at this point, I'm afraid :-( (Softfreeze caught
me by surprise this cycle...)

-- PMM
