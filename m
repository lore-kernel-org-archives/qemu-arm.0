Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1527361lfq;
        Mon, 11 Apr 2022 03:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPOFoVigEPYEMNFzD7QtWT13IgYc7B+A1Nr8NJHCOfNQigKCDXIo5qkaV0FyAODv7SSPT6
X-Received: by 2002:a05:622a:4c9:b0:2e1:cd6b:e9fa with SMTP id q9-20020a05622a04c900b002e1cd6be9famr25460107qtx.319.1649674438233;
        Mon, 11 Apr 2022 03:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649674438; cv=none;
        d=google.com; s=arc-20160816;
        b=WnMh5EdhyZpIjddYft1o7CW+f8MjKmiP9jnTevdG2I0c2RSTSSbI68TKsrmRisS3dU
         xJb/OAKRO8b+WI3aqqdcuRU72nZD+ewaaDAeBYQH6TY8vCWW5sDzGAojTAjeQyQL1Uvn
         4nuIStJZrmsVKYOSg0H3RcJ0Q3dhhQcXD21g4LT9xf7GZo3UTlTdKs3l1LN9PTIvbZtt
         njhbIh3DIQ1sa5TX6JkTKNgQDQRCtkWjjQkbBDj8UAFrE298mE3m2AB3zK9jgNDxvZ4M
         /wupQJzdhwFHHGmVjTenjrrSTezFbfz8O5/KecwSLOFsiXX77f4PTQcEy2o3kKH1ir4k
         /zLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRXj/YyLfUwrdcfmKmFsxZyzXj/qjgtB4kR2XWnybdU=;
        b=ivNu2z8yiK0abmiuembPsqIcSLJfiMWWoaPnBS1EsqP1CASYENF26GGqG6gszHzMhu
         ybjnMdQGkPNYFC5ulvTOd5k0HczCsz8OnRTWyR+8bUkEHntItPbddmmfvQ/V2YbADFtt
         AcqBc2XcRNxemvgxTHsV7cR/krWEKcW65qu94L6xU1rErKhwhQIHuf8RjBkeV24DgfDK
         CoDTB0RZd+d5WAskGhGvgaGFQvNK7sq8m23bvGY3TrGfOQdgVjDR4f7wr0z0VXwLaxys
         qsKZUv10P6f/gO/ICp0Sk/O5CvQo+ZQ7OGMLCjoqSh/g5/CHQVZHGXBoHXxB9eACIF0p
         iPLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMobpC3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ac85e51000000b002e1fbf3bfebsi4756197qtx.476.2022.04.11.03.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 03:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMobpC3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndrgD-0007Cs-Nh
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 06:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrbh-00006T-VC
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:49:19 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:32796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrbg-0002tV-HK
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:49:17 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2eba37104a2so160891547b3.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRXj/YyLfUwrdcfmKmFsxZyzXj/qjgtB4kR2XWnybdU=;
 b=JMobpC3+jvQFjAqPz6rLSb6AIzb36JoPCP9HuqbBmKiVky6434Sx3LQ/C+hkOqqw/W
 JzS/Fb/VW/dnX6hRsPvXCxskormijoQXSIC0ByMLdJLv63DhJEX8ypFQw8ERt4ESTj+6
 wu2AZW5A2bkvs+A6bZjxJdZ6f4TUe1lC7Jx3ciM7IGdCtB6cFaSydTngCvjUwDUAYLvE
 4pQEanpQq6FrVwwmTNZWDQFs0smoRQBiJs4xxjq2Dhm32e/EC76V+ak8ToT7egWE75rW
 EbCdvVOOBrHKZU21nh27m8Hl0od0+IaNuT8p6wrWPWjLDtB2bxRQaLWP0i5keF2iz8C+
 VDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRXj/YyLfUwrdcfmKmFsxZyzXj/qjgtB4kR2XWnybdU=;
 b=w4IJviFseEClcOFFeExv3nmWWH6lGrYnnyCcde4cDyjYoRyVU3wOkQEJQCBSUG0zeW
 +jq8+sUklTiqgNAz/gxPQdiB5j+Z1DQ1MFzy3TTK3Ank9R0fRNdnzSULqeOY2mq1qlfO
 P9WucX+RQwMQ8wduP/l16ZplmqHacoNqbRUp1H/Mb2vg6ItS7YzZoVHyUCII8c01w7Da
 XsQodfwddR0GyHvZny43NngP9b/LrLTDatqeSn7cWmZkwupxwRDGe4D6Q8NZu/S8wqn5
 p3Rr/8lwavmTQpR9sqxAj/pXOI0jFucIazwHwTj8QwYOw9SPlOs+vpQ6l1FhGueU94VA
 0pCQ==
X-Gm-Message-State: AOAM530Sa03tf3/ya0LTFEDwJzmdz1vdL0nWPt+GfCYKKIYK7tbnY6Ie
 gE1DOsSuy+4jWma6klAz3C0dFWfb+9TScWPgbU0uJA==
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr15965910ywc.64.1649674154709; Mon, 11
 Apr 2022 03:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
In-Reply-To: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:49:03 +0100
Message-ID: <CAFEAcA8nt16PM+6w2h7zkjFWhO0H0T36HjbY=8soO7fXND3sbQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] hw/arm: versal: Add Cortex-R5s and CRL
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: luc@lmichel.fr, fkonrad@xilinx.com, edgar.iglesias@amd.com,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KJWAYvk/PJzv

On Wed, 6 Apr 2022 at 18:43, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> This adds the Versal Cortex-R5s in the Real-Time Processing Unit
> (RPU) subsystem.
>
> A model of the Clock/Reset Low-power domain (CRL) is also added
> allowing runtime release of the Cortex-R5s. The RPU subsystem
> is largely missing but has enough to run simple bare-metal R5
> apps.
>



Applied to target-arm.next for 7.1, thanks.

-- PMM
