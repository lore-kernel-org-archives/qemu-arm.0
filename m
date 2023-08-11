Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1248610ejc;
        Fri, 11 Aug 2023 02:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGakTXEZo97vthW6OKi4r8x5d0/03Z6QhFFyMJmCugGppHHsiAPMxZ3fLhlrZUSrHispLR3
X-Received: by 2002:a05:622a:1488:b0:40f:d1e8:4b9b with SMTP id t8-20020a05622a148800b0040fd1e84b9bmr1673159qtx.23.1691747777541;
        Fri, 11 Aug 2023 02:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691747777; cv=none;
        d=google.com; s=arc-20160816;
        b=D6NeA985wO7bz3LfJLuQxZYcKkFeZ5vD5/74nueakshjURX2Fg3Xrg1dP5EOkJ2TAp
         l5NJPkH/8RroEaO0/dA1jCWS+gM4NY7GKvT4xHEFYpv6cIGc/iKBGYbd0gUMRlaTWp6R
         6UkI/Mwishve4ks6q3yuHtOO3b/zRX0DlZpd9ZBzjxvGCQg6ntKs6cqOcW6VeGdvhsp+
         0xr/VCHiZQRvS6NVoDc6oA8rOpSM2w+kXETp9EiCyCxQ0VPCLYZMwqgWVA9pxUSsyTAo
         0O4bUI4bt/GlE/6kAatq6haiTQh0Wqg9LV1RkYwuA62SY+BekppmJP9IC3uNxZ5DRdy2
         rVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tOBooZ3v+WXGtRHmSt+Sm6Zx4Er6lpKedMxrO3X7A2A=;
        fh=k4XCDcV5u9fk9vPvzvtIw/DKQuSqhFL8lGQ3XQ8NiJ4=;
        b=cOBZXWsb4dUppIAz5kT01KFL1UIdwYV8G0K11bYgq0iYESxbYywhRVr6HFlUtEj4JF
         GAjb5BAEYJSrESu5QQYxjeB9c7VdXP7EjoEUYD2nSVMMeQaZIFLX6CnCr9hyaZX/1CgC
         8aAOGzw36v8AupUKFFq2Xoj9Rt7R2Rt0bLl6wvU+TFKAnxcym5mLF6Q3vNX2oR29aQFR
         gzNI6HfOUoLUm7giNQS3BRqWywJCX3IEfBG9kMr+nBQHvETOGUNLe7peXpQUubu2T+jl
         194AK9ILNQHKvIsWyisYXhXL5NQ6aHfEI9jIWw2khRIxXX/hsLrWUXddGEvWxNB9J67j
         mvGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tyANfAmD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac85e4d000000b00403e84b789dsi2044284qtx.721.2023.08.11.02.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 02:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tyANfAmD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUOrp-00029g-L2; Fri, 11 Aug 2023 05:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUOro-00029F-EJ
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 05:55:36 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUOrl-0000sV-W8
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 05:55:36 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5234b80e9b6so2338578a12.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691747731; x=1692352531;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tOBooZ3v+WXGtRHmSt+Sm6Zx4Er6lpKedMxrO3X7A2A=;
 b=tyANfAmDWFl7VeuGbAi2agHqDPUuCqKXygOMVL69CAsYlkUKTRjYLiMsoeWNdIw6Sw
 L8t+N/1sLeNPinMTsaaTPvf2oRrLM8aeD4+ouwjPovwQa3IJXN5DOMNnok2F5jSWD1sq
 IR4jUl++noLqUmij53aZqHTBKKqIPmhC1NRbTH8mvhmd5zFIJ+iNiBi9E5yAGiGyUjzi
 pzcNhVHr0X4qpknbE2hSMgPC/HXnPsRHRoGpcd4RYfVjyKcIS7OgjTURFMTxycl9bgA8
 oKxzoPHVBFNTeg/QMmZjCFhG7A8rPh/JPpYcOvrTt07tn3/kWUHOUGTaLsjO/vdeKRhz
 772g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691747731; x=1692352531;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tOBooZ3v+WXGtRHmSt+Sm6Zx4Er6lpKedMxrO3X7A2A=;
 b=W/k2z0+pH9WTtUuU5FgATzcUmYJMreA+d68C5kWWve4cNGJKwRxujXZyUawlX409oV
 Kfdl2gJEZRKbYkDekyCXme/sKN9TpzzquJwdMz6Q+5zTiTZse99hvjjfqD5kuf8xUouA
 Ol+t6ONYQE+RnbgVcnOhYzUB/qQvwA0Q8+/HBOVjfqFsJ/imo6sLsvKDbx0K143gwAtM
 bAIe2ImNOSEgM0EXhSeOi1Ob1rowyxTV7nWOfI0nvP+19D181QIz0C9m7FHf1Er3mhQ+
 9fT8R2OVm4u+MrrEdfPHiOJx6A7tIJoH845ilpRI9YLWFOd0JKtPE3wmk7RwtfcgGOIh
 IBGA==
X-Gm-Message-State: AOJu0YzdlQ3XX+vJaWDFTTAS7WDXljCFRpef42qb6FPIf8Vood1SbkM8
 Cn2+GCV8JnHXpVTiXnSdlFqFgyYXQrbUmorwaFHBiQ==
X-Received: by 2002:aa7:d3d3:0:b0:522:1bdd:d41a with SMTP id
 o19-20020aa7d3d3000000b005221bddd41amr1261414edr.4.1691747731314; Fri, 11 Aug
 2023 02:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
 <20230810135050-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230810135050-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 10:55:20 +0100
Message-ID: <CAFEAcA_B5W5CX7-C_a7iWTL87kpcLsGEjAsqs5t54sgjTKi3Eg@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oZnpbLygsqYg

On Thu, 10 Aug 2023 at 18:51, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> > In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> > bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> > the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> > the root PCIe bus. Thus, the extended configuration space is not accessible
> > on "dw-pcie". The issue can be resolved by adding the
> > PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> >
> > Signed-off-by: Jason Chien <jason.chien@sifive.com>
>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> I'm not planning another pull before release, hopefully
> another maintainer can pick it up? Peter?

At the moment I don't have anything intended for 8.1 either,
so whoever of us does it it would be a 1-patch pullreq...

-- PMM
