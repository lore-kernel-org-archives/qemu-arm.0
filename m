Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2371731lfo;
        Mon, 14 Mar 2022 12:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVI+9O+M6arNNvW+8fGIzyvuVLK5tsr8rHB+p9rD1nPTJCiedGFBmv1FRJmwlEAyuPEMZ7
X-Received: by 2002:a25:3482:0:b0:628:c004:56a8 with SMTP id b124-20020a253482000000b00628c00456a8mr20032306yba.637.1647286428540;
        Mon, 14 Mar 2022 12:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647286428; cv=none;
        d=google.com; s=arc-20160816;
        b=rrD/jyRMRceYX8RYT1Jtgx9e+Ov5VJRn/s/AuPruX39ComkS7TCzbmjpXAk5Qblj+c
         AExf7JBQzOzV/DjKZfOwIp1ICDPzBXFqF4K361BRZI/WBPh5n6H5HqUbjWn9czzE+JBC
         yqg5mV+YrAvIYNkhwQqJ/5UBuAr8OzRehT+XRYwESKS7WzhEzYNGp06PwHzooQXOk0fx
         F88S28hVk1XDf4PBcS6ldXsSFR3NJzykrpXqubADbWahmTn6mDzFGEPOaOit5UdjVe03
         vUS6UEWHxhEOebLW+tfkwAT4BuMq5RWvmVzxmx5V8fHWGHnE9dsOIYSnewerjTK8OqNs
         e4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NypDElBryCRX8rDkQJfbavXCt788KUUXgH9C0LgqFNE=;
        b=IgNFBjjDtTDrbKKgXzIjeBHmSZKjdEMad8DWlsORJaej7to2ATI0YhTU36S8qt7thy
         Ch0851X5DUBDPZn7G/q8/sZJ3aPmvcM/8j4Yvl/f4HPPQ9PtOWVpaoQ1vWeyrlSx4GVg
         87bhrb92AGjoJQQ0uVelBLQQShmDZdpmBOPqMh1KRPcpE/RFM+K4LrbArUJeTbbq+WIp
         iY0EAzeLtrXQe+Vc5E9MDpLF4p5plLITI0zag1fZsZYQSoEmUsGqtkatcSWi2O08BBGz
         ZcNU/TE89TcHgyYp6OFU9s/Hd4LRbvuECib5eCc0N3zmus6AU8RC7/H5RiOpqftujAeH
         ziqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DrU6HamT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a25ac54000000b0062916a10393si10299290ybd.296.2022.03.14.12.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 12:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DrU6HamT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTqRv-0007cQ-VC
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 15:33:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTqRm-0007aE-8H
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 15:33:38 -0400
Received: from [2607:f8b0:4864:20::112d] (port=43251
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTqRk-0000r2-Rp
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 15:33:37 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e580bb920aso7414177b3.10
 for <qemu-arm@nongnu.org>; Mon, 14 Mar 2022 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NypDElBryCRX8rDkQJfbavXCt788KUUXgH9C0LgqFNE=;
 b=DrU6HamTshFRaIZTya+xqU3GdMLM09HLrgsWdLcyiCgRcMXhMh2/VLj+oLCRWZsmzj
 5DsAfH7c/TuhmCnDm50EbYdfHNwI6aomXt9rQcloOUFoChNz16fFu7Znh1RL6yQz3pQS
 7ZuZH6SAZAcwo6RpEjkPkxt5zdR5GG3hj65oSKk+D3Dxd0glmRL0btuumz21vkg015lw
 4HsGwo1yL7NuhpqhZfLoQXEcwd2VmobiG86YIl16O3Zc9UAwZbr47k85vlVnbJxcPmsP
 FmrnWRJNNeXl6nUqqcf6mVfi79/viHE0eeXTHQJdMlhmJGTGSiTEAmHlXHMGhJ/hFmLQ
 e9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NypDElBryCRX8rDkQJfbavXCt788KUUXgH9C0LgqFNE=;
 b=kKATiPvJpjhW/tBycnWijpcXadupM9FIXZu0vamK11IxjOl5DQvbORq7510PBWWyFd
 RRQOY7ewHMBMR3h+a9vpd2xtw9c3IHu/ndZEyhaTYT1ryXqmzwv94kE0FO7cwq2r3cGE
 FVyoUnz9mIMSAy+ZAu4uAFPeJQjI7kts26cnEqWfKSmmWkUO9tO8uW3NPN+LljBGUiPT
 iMR3wZTAbieGhbB/s9EAGyk7OB4v7aK66ozTB27hNOR22CX4WjADLLeOZGjmusYqW3Ug
 of7HBxVTZoqTdjSWIPlXiowFJFAJsl7XnFXhcktYqtGslsZtRsrUCI6qmBcPhJsuGNtA
 2nfQ==
X-Gm-Message-State: AOAM530NrSLtcn9CgRxzmaitoCOkueHu3bUt3hUqFJGZbyqLxsMmYjgk
 Ewm0vLnZIKM+juOTCuS5dNx3Yp1TI/YLWDgrbPchiw==
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr20088001ywh.329.1647286415838; Mon, 14
 Mar 2022 12:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220304165628.2345765-1-peter.maydell@linaro.org>
 <942e09d4-13c9-d36a-b54c-920e570dcd38@linaro.org>
In-Reply-To: <942e09d4-13c9-d36a-b54c-920e570dcd38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 19:33:24 +0000
Message-ID: <CAFEAcA99ZLFZedFaVXrEHM-1bVw9=HmU3f0SW4Csjh=L9hV0dA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix handling of LPAE block descriptors
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fd6N0Q8Bv7s6

On Mon, 14 Mar 2022 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/22 08:56, Peter Maydell wrote:
> >           page_size = (1ULL << ((stride * (4 - level)) + 3));
> > +        descaddr &= ~(page_size - 1);
> >           descaddr |= (address & (page_size - 1));
>
> As is,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> though I wonder if it reads better as
>
>      page_bits = stride * (4 - level) + 3;
>      descaddr = deposit64(descaddr, 0, page_bits, address);

I thought about that, but we specifically need page_size
anyway to return it later:

    *page_size_ptr = page_size;

and calculating both page_bits and page_size felt a bit awkward.

-- PMM
