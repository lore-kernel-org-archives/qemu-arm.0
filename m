Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3265559lff;
        Wed, 4 Aug 2021 01:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa4siU3zilxZAIfP2wBFVdsZLWjwI2TyH/7g/YoasCTclcv2nbgaLvrGjp2Y8Ha7K1ym91
X-Received: by 2002:a05:6638:41a7:: with SMTP id az39mr23206989jab.52.1628066797678;
        Wed, 04 Aug 2021 01:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628066797; cv=none;
        d=google.com; s=arc-20160816;
        b=KLT6tOyDWXK4CTdVM+w1RRJcutMno2hvjTpNYMrclJH7CMOyIpMrhuh79PE4LR2UpP
         cmgxucgeC+cW0afn82yfOtMgfebFyJ6Cm+td17kLQ2v3bx13cuUs76wNcftOmAs/+j2K
         GtnaOHfIQwpVAQJdEhtcb/NxhVqAAmMt6do9Y0ApbhY3DTcR2Lbbaeu74e0hUfMl8Kuq
         TRYq5gniMwPoqK4HdSA4bhfqjlC+wv66ACVx5VGXJ+MB5tm+L1CPEUh82IsEjf0cF5m/
         fkns3RbcOMKvAZmsDnM59P5I57N3TnG6hsw7xfYhOVyQaLbbvUYZ/FHG3WUvtH24mFAv
         tKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8NuGWI42+Ef64QTmdDDcE3ywS8cE80ooau2g30lFw5E=;
        b=VcBdP/Z5aRRWeEYCkwXyqhFHK/RM0FyLVIW/2/IhUagQ8AOGHIMP/HS1UnTH7zRM07
         Ooyrzv2+ZukxJ5efEMSPnoFYQG3XERURnqVlU794bH41vLgS7vTWP+17gYhdrtOMv8Z4
         1zbBT9yIXPjoSdSR9wfgka8fiUX4x0kjtF2HGsnV2zgWYH/qlijFDzxdAcXbLQG3fXUU
         vp21iJefkIoGkzErTm5E9tx84Vw5mdsW9ZHnv0JqLzKkOONZWdRflId8hGNt2WVGtB9o
         EU8OJhCQcHGdqeFbJ6EktuMdjwKkd2HmPrNiA1rv91MUD60+iWJ4EhzBjL5XdTecrJAI
         l3FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPpScOgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si1961597ilk.78.2021.08.04.01.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Aug 2021 01:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPpScOgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBCXs-0005hQ-RL
	for alex.bennee@linaro.org; Wed, 04 Aug 2021 04:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBCXb-0005XF-2a
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 04:46:20 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBCXZ-0005MN-Gz
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 04:46:18 -0400
Received: by mail-ej1-x629.google.com with SMTP id e19so2587645ejs.9
 for <qemu-arm@nongnu.org>; Wed, 04 Aug 2021 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NuGWI42+Ef64QTmdDDcE3ywS8cE80ooau2g30lFw5E=;
 b=fPpScOgFhgX4R/IxBBOGu9wRnKWcmYnhi0C/luxQea4R2ocZTWp01cctPtf80oxUbv
 bVBQkWfMADhe6xtpMOCBnXPJNuFwr3wNKLrye8vc8cObnpOcMqYheqhFYq1/jMm1a6bE
 z6uC/iKBl5VbHUznFbHVd6UyMgdjNM22WKU7DZN3QoXKX9VP5NiqhhjXDJhpM6nYmD8f
 QVHEmxGjsV5fXlGp444PHQuNrTYEoCFMphaJ5ir6IhjyGSkpStTqx7rkCaBbqPRNoTcs
 Nih5suPUW455Wme5C377lg8udMOpdleqYw3NMqB8fpaiMgVb0hxBpT8T2DIOqnyjhUGa
 1+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NuGWI42+Ef64QTmdDDcE3ywS8cE80ooau2g30lFw5E=;
 b=a70X6lm7Abq76ZhBHXPbCNj46iLhfIH0nUe6XePBGkOY3mHKKyyZQjiwGZXpMyyOTJ
 kQnF16Vx0eaE2kMei56rGfcasnTVDlj9BzwC9VCK4hmoPYOUKE4AJmJOnUx4BbzejI7Y
 MoB07P1SEsxGxeX1Me/0tlPa5OlYsNHS+trJglohZRO80czI21iB+ZskmAoaNqN95mDl
 tLYlXBns3PPQyUQ49Rx62/iGnxwcQftzoRYCd/BQyV0BFhZ8RfvnMwHNxxcgELwctLuy
 v0kutHYfk3V3dwqHjvfLOoI1yMiuK+aTM3IKnJ0pAnqvfpADeNa8g3hFhBqktyN3qHki
 d6FQ==
X-Gm-Message-State: AOAM533pcAaw2n1nLaoKuhnYG9fNyT3LD8UfeoYjJriMathcBy+VhJSM
 nj59CX0pPdgzpKDvV1zsLk8G+F5gZZPjryeTAQ6tOA==
X-Received: by 2002:a17:906:6b90:: with SMTP id
 l16mr5819332ejr.85.1628066776035; 
 Wed, 04 Aug 2021 01:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <1628066148-29133-1-git-send-email-chenxiang66@hisilicon.com>
In-Reply-To: <1628066148-29133-1-git-send-email-chenxiang66@hisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 09:45:32 +0100
Message-ID: <CAFEAcA_szNgL0W6D1y6iJNjvxjN4kfFZEePstxn=g6u8TbiL4w@mail.gmail.com>
Subject: Re: [RFC] hw/arm/smmuv3: add device properties to disable cached iotlb
To: chenxiang <chenxiang66@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T0rGxE/ycwGe

On Wed, 4 Aug 2021 at 09:41, chenxiang <chenxiang66@hisilicon.com> wrote:
>
> From: Xiang Chen <chenxiang66@hisilicon.com>
>
> It splits invalidations into ^2 range invalidations in the patch
> 6d9cd115b(" hw/arm/smmuv3: Enforce invalidation on a power of two range").
> So for some scenarios such as the size of invalidation is not ^2 range
> invalidation, it costs more time to invalidate.
> Currently smmuv3_translate is rarely used (i only see it is used when
> binding msi), so i think maybe we can disable cached iotlb to promote
> efficiency of invalidation. So add device property disable_cached_iotlb
> to disable cached iotlb, and then we can send non-^2 range invalidation
> directly.
> Use tool dma_map_benchmark to have a test on the latency of unmap,
> and we can see it promotes much on unmap when the size of invalidation
> is not ^2 range invalidation (such as g = 7/15/31/511):


Hi. Can you send all patches to the qemu-devel list, please (you can
cc qemu-arm if you like)? The automated patch-handling tools and some
developers only read qemu-devel.
https://wiki.qemu.org/Contribute/SubmitAPatch has some more detail
on sending patches.

thanks
-- PMM
