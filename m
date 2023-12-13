Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1772662ejo;
        Wed, 13 Dec 2023 09:13:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK2Om9G1vJgeRujcN9UA8QodJogKJSlqIeZAlAR8Es74QHLGH3OgwdJq5vQIYNGX6ogSmb
X-Received: by 2002:a05:6808:2f0a:b0:3b5:9724:9687 with SMTP id gu10-20020a0568082f0a00b003b597249687mr13910765oib.1.1702487609658;
        Wed, 13 Dec 2023 09:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702487609; cv=none;
        d=google.com; s=arc-20160816;
        b=t61pRtRKEU4j+u9DwVvXJZluEFuvZjmiLNnpfiMWZhPbt+qHp554I/E8q+GzmqtIpB
         o76xmwARhT5PIXxbnsYHMn3Chy7HHg5YcOeNaISJFVxByYfaPWgXT9q4aMvOhC0otSJk
         V0VU9EIVNuLw3NS4ucarWD7LJLQ9g4ZbQRtLB8ukjBRtdVHCKgNofE+mqyyfQc6DNZZe
         uqfmItCR5GBDnQaYmhwcSVwLqmuGoCS/QGRfSgjh10al7bA+be00ODdFGd9x3bEJRf4m
         DLAA/EoVcCGKo0vKdPqt5AqQb9GL4LWTLWkSMK2wb9g5/F4OcZgLXKu0J6SchKExl5bA
         GDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ohAuAXAUDvxSXP+S/F60txeSzIFypiKunEroHwRI7Qk=;
        fh=p6d0HljL3TfZZso3OVd0gl1SvOL4hxBeFvQKkScDXvs=;
        b=QuSipVT/HUau6g2BS6DB4lF6LBdlMyhvXSDD9RwWQ92m3aVMJVoIwuKyIN7/73jZry
         BdKIDzmjT+3l0HWQUBhr/aIwrwyRdSX1wxSXGFrGmybNtXANqd7GMGsu/fA7Azlx2zu1
         ImSFZOvlB0/+WLT87OC6Qmmuxigtd/6ZfxbQVi9RAskOjrfu9fnURvwG+V5KIot3G1V6
         FrD9MEVXTwbqhgw9SfRq8ldIOeiLR5ttVL7QS3tHD9YCw1SJybidrzTH8GWOp28YGs0t
         jAzeAQfYVoI8Wg09do2xdHqF49Bauj5wnxisMcMKxzQ2VD3UH6PaBvyXEuqH9NqRtCsd
         BGYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n7AMloTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a67fb0a000000b0046491980a3dsi2392321vsr.86.2023.12.13.09.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 09:13:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n7AMloTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDSnA-0002rI-W8; Wed, 13 Dec 2023 12:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDSnA-0002qZ-0f
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 12:13:04 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDSn7-0006B0-91
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 12:13:03 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-551c03adfc6so2336807a12.0
 for <qemu-arm@nongnu.org>; Wed, 13 Dec 2023 09:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702487579; x=1703092379; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ohAuAXAUDvxSXP+S/F60txeSzIFypiKunEroHwRI7Qk=;
 b=n7AMloTlgcW9oJDqN3QZzYZkY3a1ipDiBh0XS50CAmRgjLR2VJp6r3s2ChTkC8qY6Y
 gjkjdg2lvhYeFYoD0oZqMGrjQNzn+fCi+vl0gZnE0jWuCVgu4+QFd2xd5I8LbBWcW8Xw
 +GLUzkWoAFBc84VTpDsOMZ/dcR1nifwoz+OpbGzHMdd854+ypbipSrxL+JlERzok8nQd
 dzGgBJ+dMvtHYVcpbrUOQ3t/kgERXnwlyPJFTVoOZCbcpwDXIg+oVcHZM5IXcxt2xPs+
 uw9IyAHfKvrChf9AmhxSdAQrAXU/AFmradbGGtBSCnDpyGLwH7WSRdZJPVGeDvqXAwmm
 GiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702487579; x=1703092379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohAuAXAUDvxSXP+S/F60txeSzIFypiKunEroHwRI7Qk=;
 b=K5RDUTYMjuba9WXf00UvWnfBKU4HJZj10XG1BB6OmfmHKfgRTmktvXiyF5TlaH0HxC
 Gk4lfux/wr3y31uW3rcoQNovYIjEOFL7ZZlOQqED8isttghv/BGI2LUZ66Wc7cWbVaRk
 ddMVd2UuVr2Bh/ozJzPY1VfI0shbdl3vDX0dz57a3jWNOl3m9cwvKw7C2lD764L6Lpmp
 lC2mIvBk0oJ+3t9CHAUwg/Nc4VH4It3EeJgfJlDuD2270Iz8SsfDvqN2lM595ORLCqAR
 47PisGXXoOIYbfKkMbGFlTg1l7Vy7B9ShNJbtjJ/3VNn4cjYZbG7EKxj+MRMk6g8jIJP
 heRw==
X-Gm-Message-State: AOJu0YwX/UHROh5mq4UvopWtBNOokPHGDPG/TGUn0gscJUR+0K+EcCQr
 cSrqoMiUfqLQQH9dWDafaLXxfnk3Wyjc0waeU6g1Zw==
X-Received: by 2002:a50:cbcd:0:b0:54c:b889:9c11 with SMTP id
 l13-20020a50cbcd000000b0054cb8899c11mr3115043edi.98.1702487578923; Wed, 13
 Dec 2023 09:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20231213014932.1748323-1-linux@roeck-us.net>
In-Reply-To: <20231213014932.1748323-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Dec 2023 17:12:20 +0000
Message-ID: <CAFEAcA9KU855jn8xDQtbf58Byg0NCq-aB3tPcf8sB6YLyLkvWQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/pxa2xx_mmci: Disable reentrancy detection
To: Guenter Roeck <linux@roeck-us.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MJ23qxgQOdmg

On Wed, 13 Dec 2023 at 01:49, Guenter Roeck <linux@roeck-us.net> wrote:
>
> All tests using pxa2xx_mmc to access mmc cards on pxa2xx platforms
> such as borzoi fail starting with commit a2e1753b80 ("memory: prevent
> dma-reentracy issues"). Disable reentrancy guard to fix the problem.
>
> Fixes: a2e1753b80 ("memory: prevent dma-reentracy issues")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/sd/pxa2xx_mmci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 5e8ea69188..27ae8f2888 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -555,6 +555,8 @@ static void pxa2xx_mmci_instance_init(Object *obj)
>      qdev_init_gpio_out_named(dev, &s->rx_dma, "rx-dma", 1);
>      qdev_init_gpio_out_named(dev, &s->tx_dma, "tx-dma", 1);
>
> +    s->iomem.disable_reentrancy_guard = true;
> +

All patches that set this flag should include a comment which
explains what the device access path that triggers the reentrancy
is, please.

thanks
-- PMM
