Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3746182lfb;
        Thu, 24 Mar 2022 20:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuw+T+H0huINdvAnof1VQMJl3S70E7F6l3Jsb0NyurBRykf7hm+e1rVnyZdVjkQ3sVu4aJ
X-Received: by 2002:ad4:5b88:0:b0:441:5b5:e78e with SMTP id 8-20020ad45b88000000b0044105b5e78emr7134476qvp.14.1648177320271;
        Thu, 24 Mar 2022 20:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648177320; cv=none;
        d=google.com; s=arc-20160816;
        b=UYk2NuOvIVPInj5h1LtbNoxXNXdPBhv81pL26ZL2JiYJ5LMeWsIdNVXnkGKQ+knfJr
         LoXUprGt0lHza0NU5xvKoGWMPj1cas9i2HMturGHj4s9RsG5ruEnmhsGc96ltq+wyXI1
         L3h0BO7UlFuKT6xtti02WG/FOP184Py+Jm74oEQoX2w3tfdkOOmzq1PasoKvuoOyaO2S
         Mkx+X1t0X//WObFoLwSdhHQl+ZzhDwjG1Bjdonwj0W5o256Ov50n/7xnn4Ohe+AC0K2B
         5ETaHMYZ9YvRG8NrumQXcusqCVZ7TgZ9lzOIu8ec4VOLlyBjMDyYortCBJKxUnU5n/gM
         C89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fV8k8FAe6DiXJgw5SNgJSGYrGTEQ1JTWXuujuost+sM=;
        b=XSkAbpVXf2RfK/4unja6WJLu/5WTKMZXt2DK7TybgjUREwphvhrv4MdLtDOXrAbfzy
         CAfpUklbUysrxEn6ve3IHmbtUlfBpgSypbzhngEUcnkahWJ9rdyzo93XlGpbTDA6+B6X
         GpOSe7UQVF+PiC8q6Rj3mADXKaEcC+XMjygT9IMlbQd7M4/lwhsjKo4/u6s53xaxNZjt
         8yBUnxmabeJZwbUVxAkxCtbS/b/KrEjEzemIWm/UgkJmLXZ5PwBpnAGO4gSDiOQ2oHHN
         gTsMixoHrliFaN69YDGPDEzQiUR8T0KVZ8QYRzcYimGqaGqpLKbAZQRBiV2F4WubGq4+
         1n2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=SSWlJzoO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020ae9e211000000b0067e4be23a1dsi648610qkc.610.2022.03.24.20.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 20:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=SSWlJzoO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXaD9-0007Im-P9
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 23:01:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXaBM-0006TC-MT
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 23:00:09 -0400
Received: from [2607:f8b0:4864:20::82c] (port=38838
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXaBJ-0007gO-2F
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 23:00:07 -0400
Received: by mail-qt1-x82c.google.com with SMTP id v2so5539527qtc.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fV8k8FAe6DiXJgw5SNgJSGYrGTEQ1JTWXuujuost+sM=;
 b=SSWlJzoOPOwYe0JwoIrIeQyeHDiR1GDKvBF6pNzoEKde0s4na3C9w054ezzeu6lEic
 anAJW49Z0KQx8rGFaNn8eTrFjZPM9FL+JOOVqtIjCauN/55h7yvV2se/796SUEKt3VZa
 +xnvWAbXwDIUYC9jThT3iwKgAweSK0hV5L04ekFzOuqM/AYnveMcVSUUdIsgYdKHuTpm
 9A848Vw7iVoyV/fKJaBSU89FztRsuDjJHvb+tWdaOr8uhJxD5njuu8uSSEA4k6PA4650
 b1WHpZ8uZuavXcpxeztLsowg2tW1W5WU0uAg7/1fE0meISuJpTMXAX468f0+jTY3eTZA
 YRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fV8k8FAe6DiXJgw5SNgJSGYrGTEQ1JTWXuujuost+sM=;
 b=BDjuBzXMx5pvQugtRcJjN6jsu2cFzikLo54S9btZlRb8DPPDbHfTys4Fm24sR3AaAl
 QJa/QcVzqss0ilcsFvDBCfMykhD9LT9rBfM1VqAuH+b6qRaOawXZQoTa8kAqFci7cIKC
 QW3nCqsqSePUpa1pL/VjyerOhtqkJe2/iNErRm1fWbqHrjL071Ar+ITy+eGG1pSZ86xg
 JCwZl2d2DyR++5OcZqZK2f6qpMmAJ2j+BO7p0WDdndDMC3mnBUzOWwp+3KiWVh8lbIMd
 cHWiVnJOz8brfgz77bYzcux01gcjjjsDhqjumgp90KGp4rsXFIcjwX17nxqwVQ4R/TIg
 JOSA==
X-Gm-Message-State: AOAM532RifMb4fc11qWUCckN9PSCn3or1M3wqwgL39qnmRFi/YIyTXJT
 8hw9vI3fVuQSTIp2JMuQfSXVz90wjuo2oELs6I7huA==
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id
 p3-20020a05622a00c300b002e34bd016c2mr4091627qtw.575.1648177203387; Thu, 24
 Mar 2022 20:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
 <20220324171756.196654-4-zongyuan.li@smartx.com>
 <CAFEAcA9GA79yUQj3i5MdLWK6+r3bDObKQS+8_bfx=47TKbLHJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9GA79yUQj3i5MdLWK6+r3bDObKQS+8_bfx=47TKbLHJQ@mail.gmail.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Fri, 25 Mar 2022 10:59:52 +0800
Message-ID: <CADXGpueetjT6rgH3XHo1RNxNz-WGACWB0UqYH7qkMaBV1HMsYQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::82c;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: euvnNAvq1qgM

>
> > diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> > index ff8852f407..eb485dd7a6 100644
> > --- a/include/hw/core/split-irq.h
> > +++ b/include/hw/core/split-irq.h
> > @@ -42,9 +42,6 @@
> >
> >  #define MAX_SPLIT_LINES 16
> >
> > -
> > -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> > -
> >  struct SplitIRQ {
> >      DeviceState parent_obj;
> >
> > @@ -52,4 +49,6 @@ struct SplitIRQ {
> >      uint16_t num_lines;
> >  };
> >
> > +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> > +
>
> What's this change for ?
>
> thanks
> -- PMM

Some language sever like `clangd-13` will complain about the following
code if we use
`typedef` before struct definition:

> @@ -79,11 +80,11 @@
> #define EXYNOS4210_NUM_DMA      3
>
>  typedef struct Exynos4210Irq {
> -    qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
> -    qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
> +    SplitIRQ int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
> +    SplitIRQ ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
>      qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
>      qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
> -    qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
> +    SplitIRQ board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
>  } Exynos4210Irq;

Because `SplitIRQ` is an incomplete type.

regards,
Li
