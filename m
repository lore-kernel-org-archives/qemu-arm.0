Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3699FD2ED0F
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 09:39:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi8D4-0006Su-Np; Tue, 20 Jan 2026 04:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vi8D3-0006PY-8p
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 04:39:37 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vi8D0-00072m-SP
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 04:39:37 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7927b3e5253so41918957b3.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 01:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768901972; cv=none;
 d=google.com; s=arc-20240605;
 b=lbqOS5UWGEiAqE+Y0/mbA74xIynJuqdMxJmYtwtf7ycFzj49cd8kk1teUHmD1FliS7
 reJZG5eOxaMxwDNqeQh6YlSiQfgT4ECfvGoPytFZ4ne+ZN0i9KLiEqKlj4KAOfs4uvUk
 b338IvClm8JxjNuL6S5jLjaYNcW5JyrtE9be8bKSGIT2mv/qGpmpONuUBmOJM5S6yiN+
 efzZO3LGxldbzdlF7EdowkdSrLbAUqnRTf9qBaEHaAioYZ16OGN4/OTNplisNLV/4J77
 A9CHuFNmH0Zg6IDZ0p/35rtNUJo0jc9GT9/2mPz33tAUKSds+XWM+auRNffogrv6JWQ0
 +4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=p8F9xJC5CefwY0Abxs8+Wa9Hku769lMVUPA+ypcmtJo=;
 fh=XTMmlVB59BROUEMyuCfJztxoedaXQhjQyZOtTMiEJaU=;
 b=LHEPtCPmMS33ISENw+1rp6TgTrsY0oApZ2V/vQRCtcGg2Ai0nTwuQWVbX3I4GDakja
 Vv9ZrnRLSdnAege19ymZOuqvKVtq5FEAMJ2aGHu1UXdLntYVv+6PciZkzmqPhii5oAUj
 e5APIKqc+OiCOcwvguE8Hqye4YO/+IPMHQVfg3fKk60anV96ll64zlc1rSub+wgwcGFk
 IqPGuP1Cv3loAjfo5lM8UsjDB+cE7ho48HUiQE3QbRWM/u0Mo4R23ZVzw34nxwzNXIoX
 X558SmLkPDzDc9969esWLl9tVrtpIzPf066ahn1GW5IDWP73YJa8tWHYvjLnHZxNVas5
 AwHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768901972; x=1769506772; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p8F9xJC5CefwY0Abxs8+Wa9Hku769lMVUPA+ypcmtJo=;
 b=iBFflFDN8Ya0kb5Q0hEc5bXosY1Qeb5nC50W9b0mLitZMm5bvgaSA+vZnuIxfOaCYH
 Cl6Edqx7B9hmoKoN0kQ1G6yBQn2RJ4BQKAudhrgU326+RtAYCtqXWhG8Ujt2PdjMCyS3
 qFQJyP6S3XZnrYbNvL3oMMVZupVZAxIYy0pqlX75IrNzjIhMxXVYtoMXw+y7mHV4lKlO
 H4zz58+8WM4GJcpLhfG+B6+pjkkZDE1WvV/twi0Hui2hL1EfMcw2WudjCfZAOb+TPYs1
 GkYvY3o9GuU6RGpqel8ffuJecCnQSOz2nqNHBi29OgpiIkrFaH2wX1sdygCIDSAsAvQP
 Ro9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768901972; x=1769506772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8F9xJC5CefwY0Abxs8+Wa9Hku769lMVUPA+ypcmtJo=;
 b=GazSbpoEDJNw0q51IC11BAPUNmvyZCSdgPM75LEYt2qqfz10x78Qwq+Xy9EITKAPX8
 vNx1qzokXn8jobb6wefhJbvRkyG8tePv3CGmKKukVPsDoQmExVEK5zz2aUh4iM8opJvZ
 Z0/bttd9l+OUINuekCYLWOt2VfKZg8oxdcCj3D7xrr1lfuibzrhCjD39NzqcqSnLosaD
 8mf6HvgDwMtexAHbhi4rrbbu/ZGxCAOfbjvBAXBeWuwzUb0Aj8rSQ7ph4M/FCkNf8Rar
 +u1goONR6mzNGenvs4tBuvj+BWezmyAPss0b/Lc1c+ZVWsUrBG00ZL3u0yWXpW+w7pTm
 57ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV2S4QmwKIOUKZ51tZR3ejXpTt0MkZT0jrxf+SibC5lH9uHPcgwPilWjY5RCYyld8e787j+X4mew==@nongnu.org
X-Gm-Message-State: AOJu0YzlapAe1opSvq0h4wARQ/w0hwno4T2Q4dCcxiPHMjUs8I4W8Eqf
 Zow/yqiNrl5m/Ywgm0HGb+0eQlIs88xQ5BR+3CzXJwgarY+yXylNpU8Uet7X7cAjFNbDjepcD+9
 bDhOass86wCYK7IwGXATINoX/nXS7KYqtirlDbD8Bmw==
X-Gm-Gg: AZuq6aKJ2iJODvPt2SKiYF9J3MfVD54ZXmwSoEZOhcvxySGwq3GVKeHbC7tJ02GjjiN
 uyU+oTGK9T5gIOcqVrcT2SMvZlM5JCEGBgk2M9EHf7IuhzWHOP2AVNdDG0jf78Y+wkX5rfBUEfC
 z4KP3+9OyOM0Zv1RZKZ0H5CI/M6v6DPZoYPxoUbLREcIShJuUgVgyNc/OKntPZ8N3audlIkrZEN
 a7n0ZjLrBRQWUhYuWN3TXoF8HWbEwugDJaW260Tk6ovaZmCwtJixyeZ1zXkj/gAtwY1gg==
X-Received: by 2002:a05:690c:6d84:b0:794:3a7:e4a0 with SMTP id
 00721157ae682-79403a7e838mr20070107b3.23.1768901971519; Tue, 20 Jan 2026
 01:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20260114213227.3812-1-shentey@gmail.com>
In-Reply-To: <20260114213227.3812-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jan 2026 09:39:19 +0000
X-Gm-Features: AZwV_Qh7ikiAl9qlyWImqqvG1ssVxx8uwfWiZnqXgpeH4Hcv9Wuqb0U6HOmZiTY
Message-ID: <CAFEAcA_t_-Xj=5VExfHk8mNDqa8DB4oxGRy89fgTZ2y1U6HU5w@mail.gmail.com>
Subject: Re: [PATCH 0/2] imx8mp-evk trivial patches
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 14 Jan 2026 at 21:32, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series contains just some quality of life improvements for imx8mp-evk
> machine's CLI usage. The first patch removes the need to pass "-smp 4 -m 6G"
> and the second one does not suggest passing redundant "-cpu host" when using
> KVM.
>
> Bernhard Beschow (2):
>   hw/arm/imx8mp-evk: Provide some defaults matching real hardware
>   docs/system/arm/imx8mp-evk: Avoid suggesting redundant CLI parameters
>
>  docs/system/arm/imx8mp-evk.rst | 4 ++--
>  hw/arm/imx8mp-evk.c            | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

