Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2105416lff;
        Mon, 14 Jun 2021 09:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3LgGlfssQ6DLhYpvBbQa2UaWmrLWb37HyXjE3eMeB490gt6AdZ1fzrKPq8oIH7f8SOx/j
X-Received: by 2002:a17:906:bfc8:: with SMTP id us8mr15986624ejb.217.1623686890295;
        Mon, 14 Jun 2021 09:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623686890; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy6464LGU0nyV3qhhegfMDj2q30SZHeUF+oXQ+DzJMXTxvXTwweZwxCPLKdKAcM1ba
         l4lx32XhkpxpzeHVQJphCFSODBqrTlWqGyMXKfaxlx8rLDoAMdcD2bYdzxYxjs7GK7Kv
         /hZ2niKIYdGlrTTRxLFpDsshJTUKz0DZEtLN0gyNekKGyjKziiWtiWVGpf2lYeBrnYz2
         bZZEm13AJFLsMpRETLsjhvpqZFFC/8XnA7FS2mZchkxsF9s7kNGan7yuLSDr/4fp624R
         0P/1pYxBOYXuRgHBk+A806XD0e/6KeTcuFJf2h484GrpiiG2xp06QIFyaw72DyeUdtWU
         dCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UvJ+jp1yIu+Nxb9vm3TJBC9KuS0gXjvRmQ52pvGBb6w=;
        b=RsOgHbnQ7iAty9pvHi/YksGINSsR7C+GboQhFPjOOvIgCiXwUbEUnilkIkgaAoHA1g
         hKn2onBRn8sKAEG6uCwLRWZuejulApu7QIpJylbrrgblwC0OPJi6VarKQWepOCs7qOt0
         WmuwBhtLwynF8Ii14iK2vCItkxjx86VNI8EbnK/oWxeH4TW043ZTVVCYQcOq6jE3X6Qu
         7YHvy9XvD6IdWrxyvA02q7h3cGFFlF6UVYmjO1gMT06qBVA1VKplvKJxUZseBjQHf+xP
         JWOErv5RdeA03FfNVbG7Kp3X4P5HvTeK0Seao+go2cPfZxL5pFtvlHPzoNlQUYU4otkT
         1Ugg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G15+5i6J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21si11846929ejz.696.2021.06.14.09.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 09:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G15+5i6J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsp8D-0001gd-CD
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 12:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsp6G-0008Lp-DT
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:06:08 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsp6C-0007VL-8n
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:06:08 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g8so17567174ejx.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvJ+jp1yIu+Nxb9vm3TJBC9KuS0gXjvRmQ52pvGBb6w=;
 b=G15+5i6J0syCnKRKN4lbCvMBS0beEn2i/tsq8yTBNvNY/WH0S9Dbe0Oa6QANv1IgWT
 CKH1K2hSj8gY0JsoncRX20IWQ6F6qbIN1fLZTqI4cI7s9YcPjMoPcqaFGd4qXLP5T1T5
 bFzQMIPj33n3JykttmMg8ky5UNxe1PVXdnyd46PeaQJlN/hZXSg9T3nBVH/AmSDchiOk
 GXRvxBK05xQ8kUIktaq5FqCTCUW79ujJowf17XywtULGt8/Y4Wmj2AGQm0AQtq6DvU1x
 4x/9sOIEsohZJIBS+Ovs10yFksrzYKD5QxEQFWST1C989QITjZCXCucSmVwH3Q7R57Hx
 5oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvJ+jp1yIu+Nxb9vm3TJBC9KuS0gXjvRmQ52pvGBb6w=;
 b=WPnaBWrQoxYo9d6KzndUoiL0kP4QWd+x+7VYr7gHW74CsscqVtZzJKzz8OMjPnNs1F
 AY9lYTUzpkca1e36r3m4qeT+JrZPyUrYwAJK7o8u4hWiPLXVog/fu/bJsAwOcYLkKBV8
 e9zH1UOI14RouZIuQYBtodZf/L7a+RRlo2t17oJhhlBbW5U2Rzlvu1Hi9NHYG7NR1Rdr
 dXN8JUb96LbErpbLvbGds/rVgryC/cd3jIgZq5TjhyDeLPEf20pwkXFsDRULthfCl3Dq
 l+ViOGCxqEoyq67W+9TS2ejbyVv5E1W1/HBosQd5rSQKXiaTrmSJ9hj17T4Rx5dXLir8
 uOsA==
X-Gm-Message-State: AOAM531oS5nD+eE/1IeWTq43Q3kdufGqqHtLiforz8rYljDnyOpTsZ7z
 /YO51Gvfq06jh1/9TY+EdQ4JR4gdPNiEPm2Y7myGdQ==
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr15683086ejz.382.1623686762733; 
 Mon, 14 Jun 2021 09:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
In-Reply-To: <20210608161028.4159582-1-erdnaxe@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 17:05:28 +0100
Message-ID: <CAFEAcA_Dx+7Gt-7bzRu7t27xQs-59oo2jnpybroPqN-46ak0Kw@mail.gmail.com>
Subject: Re: [PATCH 0/2] STM32VLDISCOVERY Machine Model
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owFHIWck/ohc

On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This patch series adds the STM32VLDISCOVERY Machine to QEMU
>
> Information on the board is available at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>
> Alexandre Iooss (2):
>   stm32f100: Add the stm32f100 SoC
>   stm32vldiscovery: Add the STM32VLDISCOVERY Machine
>
>  MAINTAINERS                             |  12 ++
>  default-configs/devices/arm-softmmu.mak |   1 +
>  hw/arm/Kconfig                          |  10 ++
>  hw/arm/meson.build                      |   2 +
>  hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
>  hw/arm/stm32vldiscovery.c               |  66 +++++++++
>  include/hw/arm/stm32f100_soc.h          |  58 ++++++++
>  7 files changed, 331 insertions(+)
>  create mode 100644 hw/arm/stm32f100_soc.c
>  create mode 100644 hw/arm/stm32vldiscovery.c
>  create mode 100644 include/hw/arm/stm32f100_soc.h

Looks generally OK to me, but cc'ing Alistair who wrote the
STM32F405 model in case he wants to have a look at it.

thanks
-- PMM
