Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp361811ejb;
        Thu, 8 Jun 2023 07:06:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5X5jUoWJPrvg+/TfLm5Wo97ggionMTP5ELHmTFOaRvUBlnwWGDgSk16GDj28cX2Z6Gb0LL
X-Received: by 2002:a05:6102:2445:b0:439:544e:ded6 with SMTP id g5-20020a056102244500b00439544eded6mr2216075vss.10.1686233186623;
        Thu, 08 Jun 2023 07:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686233186; cv=none;
        d=google.com; s=arc-20160816;
        b=B9YTKWLU8VYn4T6pziDoJekfOpaONb6bfZMcjIQR9/dT0SAYz2mC/1c6VyZ+qYSkX3
         /EVuiBF/Uer/STAW001se1FysFIOtQ5AzraBiAJPgFP1CeueLe3cROblLvLwKpSKDZ/b
         0hbRYVG6E8YelRvStVT8b0q5cW9sEQAa1lBEIKC5nLwjbjm5ijSi0rY7Mv9ZOB2m+i8B
         8mv4mGm7vuk9X5Hv5GsMo39jjlc+a1ypOjKJCvZnmGBwFr5MsZjYOWQfPm0aBwc+OmKs
         FtBJ9tIYw10FtZS8Ew4B5RX9rpwimJ7ZtRbTtx2jn2iE/JIXLb98yXj0vMLr3JCHUcOz
         shZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dAYS/l2DUM9PlpXuZSAtL8dWzCA7PHmkT0JRclpHbH8=;
        b=JauFL2/s50C7YkCcGDRK9CaPPIh6hm6eVj25WTXw2NrUz85+uab+fDWLWhbStohKek
         wLZHvjGpSAJHXwMnH/1FHOIQMvSMLUOVusS2bvrVgJCpGQL+LF7A+zJ0g9f9xr9JcMJM
         GgVs9MI3pZse1GaBX8v+pex/8j6/3E6l4k0MudarOx6j/GHbJvU+/c/o5rlpQqkiEbOM
         D2TLi4dpnNeKXq18Y16z1GS/2ylu/+kEPLZIX2RB8P7eCJncaNF5psC3PjfjJC0q3Me7
         hTZvnG1po8/1PNR/SHY8JMoVp7U7ZH8biDlXOyV7tKokVMU0WMzMt5uT6laKHIneET4Q
         z0nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNcJdrY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a67dc8a000000b004366d0da87dsi79708vsk.728.2023.06.08.07.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNcJdrY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7GGw-00066U-8j; Thu, 08 Jun 2023 10:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GGu-000664-PS
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:05:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GGn-0007Sg-Kh
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:05:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5149b63151aso1116146a12.3
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686233138; x=1688825138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dAYS/l2DUM9PlpXuZSAtL8dWzCA7PHmkT0JRclpHbH8=;
 b=wNcJdrY8j922GxPLgXkHtAOWamPqbqZ3XO7lxl4yAk7ZKKR8Zb42zsNI+6kHChm9HI
 MRmZlJMi4bextmsLcxe3PNow6SX1jTKVXHnoWOQP0Rg4pGFf4U+Ov44Fwl6DdxoJvQH3
 442Zs7VXujsGe2HltFbeagqWedpIwcqBEprdua3YHT/UQxdSzwndXcWHzz+70lkNFZlN
 kTdAUjm8Kl8U2e0N9thQrX6DhR+DZ8FM5oFHbwocg/ufIvv2LaHGd5iR5Fvd/FUmtjq6
 oqNUyDfpNcSvI93ZzK1gvzJviWTVdy64PstjNVqBPGXa8XbWGeZkTiPlkd5k34ehA2oe
 crug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686233138; x=1688825138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dAYS/l2DUM9PlpXuZSAtL8dWzCA7PHmkT0JRclpHbH8=;
 b=iqS2Hr5s3HFcENB4jDmnlLFVbkgWC4NhXWpYRxZ5M3HuO9alCfEATsL0lJGNgMuFa7
 vbQBNeSFB2AMHTg5sdlJsV4+pcWpQBXdjS8DRsK3zYxLj0rp4nlyuldPjd3jmVvhGEXs
 xQRmcCPhZ0jcUDxKRaJjMCYIpyZkW1OPlF7sAJpYjHmdCy6jetUc8+PMKJKaUNYPABiG
 b/o7fVwG7H8dAr1/oM3fNXFXbtlXodexb4FTj7zsQ0bleLLZdUk04iopuPMYZXpqezge
 pWrMc+M3qFDyQ3LEWZ8kH1I9k4bS9a48PffZvU0N6NrcimWDP1Hk2SObffMbiAW2tkAc
 YoBQ==
X-Gm-Message-State: AC+VfDyi028i/Xm1BNxXglVNf7PdhTjup8yHAG2XU6SvrnU01tLfMTyX
 0Z4tnyO1Iwh53I91CACDZDSdjWZqSO/u1KIxgxDBTg==
X-Received: by 2002:a05:6402:78b:b0:514:9248:d1dd with SMTP id
 d11-20020a056402078b00b005149248d1ddmr9442719edy.24.1686233137852; Thu, 08
 Jun 2023 07:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230517081204.30333-1-m.elsayed4420@gmail.com>
 <20230517081204.30333-6-m.elsayed4420@gmail.com>
In-Reply-To: <20230517081204.30333-6-m.elsayed4420@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:05:27 +0100
Message-ID: <CAFEAcA9hiOKsQ1DsLNEv6h5AJ9TGtY3S6=o6rJoJTCuiZiwCdQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] tiva c watchdog timers implementation
To: Mohamed ElSayed <m.elsayed4420@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hogvViOyr80k

On Wed, 17 May 2023 at 09:14, Mohamed ElSayed <m.elsayed4420@gmail.com> wrote:
>
> Signed-off-by: Mohamed ElSayed <m.elsayed4420@gmail.com>
> ---
>  hw/watchdog/tm4c123_watchdog.c         | 297 +++++++++++++++++++++++++
>  hw/watchdog/trace-events               |   3 +
>  include/hw/watchdog/tm4c123_watchdog.h |  97 ++++++++
>  3 files changed, 397 insertions(+)
>  create mode 100644 hw/watchdog/tm4c123_watchdog.c
>  create mode 100644 include/hw/watchdog/tm4c123_watchdog.h

This one's just a variant of TYPE_LUMINARY_WATCHDOG,
which you can find in hw/watchdog/cmsdk-apb-watchdog.c.
Probably you only need to add a new variant with
the ID register values different. You want the
"is_luminary == true" behaviour in this variant.

thanks
-- PMM
