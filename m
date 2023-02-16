Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp512686ejb;
        Thu, 16 Feb 2023 05:53:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9yqkojKNm6NgOA4MjSkLBFO2pYAbl0J9PVbKER8PljQTJOQqz4wlrXlSBQlQK+KYRCSH4L
X-Received: by 2002:ac8:5cd0:0:b0:3b9:bb27:e11a with SMTP id s16-20020ac85cd0000000b003b9bb27e11amr10113039qta.0.1676555616927;
        Thu, 16 Feb 2023 05:53:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676555616; cv=none;
        d=google.com; s=arc-20160816;
        b=kDf3iG1ZZMyndrNzsYvBlQkAO/ShZYVklPUUWAVyptzpykKmTuhfkMaddm0sb+gAWK
         AWkZHCz9IxPb1LYT4VHSvrBFJeFrUK2njvzWCGar/eq2KBme3FXOKAPedRMJinT+3sAU
         jPyvvu+jmbExWHLJdl3wk0LhyPyjEivT5CKC1YzWC7IN1INuUJcIuX95og0moqh9N/ll
         xWPvcWYCiKi3Sa8tkkm6y+4XRX3PXDkAD55QfAo8ADlzt+hTcqTpRYnGcLruDqUKQnLC
         OouRaWLH2Jyf4rI011qdGUjmZ4lWmittpSNIZJbK9Rdzd1RaJjVTUPn8tczFY2D4OEWw
         PAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A+QqRXMpaYZVQ9Gicgre5gq9JZrSFvw6aCTI66YFRKw=;
        b=ZviUyIvUt+jQmBQt2yU+Rmi4DLGVywkymn1JWAva5geyXZD/kueZhs30RmLSUGPWaC
         AyWnXFzKh8S08qXH/ygTMliWFHRcp44b/wnnimM3ZyPOauVwKt2+uId2UD1c06nGZ1mo
         nJ/F+KiLHXC8/uQ/hdzmwNUuImVPH4nYW00qPrNDiDmC+mpw0InFrBUGEbPTuFui7di7
         her0KLlsqtSd7G6yeAyK3a6vCvJnF2nzBOgC8GLLUhwP1nocY0kB93JQipC877m7/pAp
         Xy4dEKHEELhe0vPQoPIxhVjSj16PlFr8PgiHjdqSSYhSasY3d14i18X50MyNyIIBFDIu
         +FTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDVOK5RF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05622a014400b003b85473ae55si1636642qtw.142.2023.02.16.05.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:53:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDVOK5RF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSehJ-0000XA-9V; Thu, 16 Feb 2023 08:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSehI-0000Wu-Bf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:53:16 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSehG-0006fb-LS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:53:16 -0500
Received: by mail-pf1-x42c.google.com with SMTP id bw10so1526853pfb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A+QqRXMpaYZVQ9Gicgre5gq9JZrSFvw6aCTI66YFRKw=;
 b=uDVOK5RF/0PYFOxyy0NKuGuvNRXwJ43DvtDPpUrqANJC2OK5ZBQ+sIvlMwsaycG1pl
 M7XChx6Kaa2b2yyj5+1gUUcNl8J1/nt6CR62Nrz+FNqbbQB6eTJftrZLQXbEZKADJrJV
 P8SJcULnbWcmI+Xmtaqta16RuvEcGy91VoS62uNtj57xXVglP990mP31aXCNPSSb5Jqg
 5oBf5yFQPSZj9CdLw82FZP2kPDpNYXUfegsZHZ0NWdmJAsuKFwfBunRC8Egq/ewDZe12
 y1u6ILIbr0V4AXF8qE1j9/cmAtj2B8H0f+xR9G+irca92cYTL9W3IgeDcBP4kPvl95rS
 JrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+QqRXMpaYZVQ9Gicgre5gq9JZrSFvw6aCTI66YFRKw=;
 b=dRVngGbyv4D5Wvy8d1RSwMKMrn9mcCyrzInEBLDqUG890+pTJM5oGPEe1n9UC1MoOF
 /nIp8gkBiMNQtbaTLcup9b+f5ksJJ0+HjfTTw/tDk2zD8d2LVXno7IpPcoAw2Q5F3iD2
 QeEWW2pjDXC/NALU+jymGaFl5p3fy9k44hSduwdXdg09CUG/tcDGlnlwc0wnmeL4/U4W
 g6+hv7/ZKddIX4ecRIISj4UfPxqMSE/jl4W0LvxXdsBGe40bNbFjRwS0W0B469ojJbBq
 mu5ut3aBLQn62NmtbgZDl9MeFLjAOvyA4o9PB+DePEAbGqRCRfme44i89sa2MGb9kAz7
 Tqeg==
X-Gm-Message-State: AO0yUKXYlEmCjrEOw2psM+1cPjHgll7K/HVT15pE4u2R+GSJ4D6CacSc
 1Gnrf85JqEcM0yg2LJlOFHj/cP333fch3axy7VZJ3w==
X-Received: by 2002:a63:770a:0:b0:4fb:86d2:654b with SMTP id
 s10-20020a63770a000000b004fb86d2654bmr882083pgc.6.1676555593246; Thu, 16 Feb
 2023 05:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
In-Reply-To: <20230214171921.1917916-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 13:53:01 +0000
Message-ID: <CAFEAcA_iTkDhrY-rxg-BjMPsvOqdQWNN=TXOuDPSZo28gXEJjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/smmu: Fixes for TTB1
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, ola.hugosson@arm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i5vgQ7c7/Bxo

On Tue, 14 Feb 2023 at 17:21, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Two small changes to support TTB1. Since [v1] I removed the unused
> SMMU_MAX_VA_BITS and added tags, thanks!
>
> [v1] https://lore.kernel.org/qemu-devel/20230210163731.970130-1-jean-philippe@linaro.org/
>
> Jean-Philippe Brucker (2):
>   hw/arm/smmu-common: Support 64-bit addresses
>   hw/arm/smmu-common: Fix TTB1 handling



Applied to target-arm.next, thanks.

-- PMM
