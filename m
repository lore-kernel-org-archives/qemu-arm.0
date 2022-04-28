Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1658258lfu;
        Thu, 28 Apr 2022 04:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+qxoIdCrXjwCqf2POjQgiM93NLLABVAfMbcoH11KfX+63jEcjmB17zwzCMg3nPTwwVbA0
X-Received: by 2002:a05:6214:20af:b0:446:787a:e748 with SMTP id 15-20020a05621420af00b00446787ae748mr23375118qvd.79.1651145696412;
        Thu, 28 Apr 2022 04:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651145696; cv=none;
        d=google.com; s=arc-20160816;
        b=G4kS5gG4JkzmpORFxcfS9q+NF/Bt+4Zoar882mmUSIwrXLvOSZfPJoXnpQvYC4YGey
         AgsGj8ep4BKy4cNcDP9zfsBu34d6H9Rn89a84D48L5jPBRQ7LJMr4hCEF7IhQ1+XE0bg
         Q4Ceo08GHJTnsbkLzmL/7BH5sjibh3BwkLHgDe5bJ7s84sT3RtE3KZcQFY5MSJrUWXsL
         CFfoUGJdpFM/KnZCBGtllE61STkJoBk1FuP4PSGKVo27kI/VehXOMA09FKZJocTwNVKe
         Gv17ZxGRKABiF5N8DQZ9jW+vRehA3Hc5Jsur+CESpsFQ9mpITEpnXkzGCJSbWxzOqPJ4
         2TGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fnWy7HWaVlx6qb9olD5NiDncSntiQ6WGufZzwpPX9eM=;
        b=TOH6r7UQf8cJRFuq25vXYQ0UamMiprMUsIKLzlyVpDzh3lkd3IgHPZSIXaZRAvNtD1
         18ERCxslxf4yDDOgK11wrgmB8dxGYqZFWjCMnF+BgTI5eY8pT3e+RLH38ULazlFFjRJp
         tpKKaFVFtFnAsaXLhwiCG+7AC64tjLCCJ3xoH4wgfgjypBHKl3xM2yeZNxHtJ4qFaTLq
         f+VAcmf0GsJ8B76sgZApu7+6aIJHXzR3nH+GPWbmIO6x6OauwwgW6y0R1EeQrBaNM3DF
         rJlcR6GflVg0KUbOz6UFcdW7PPP8DXema4F8rcJCwXJnw4PBRcv2e5csr452M8i1CGOl
         Uymw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T9K+XLH6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw6-20020a056214238600b004564dc404c1si1418596qvb.245.2022.04.28.04.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T9K+XLH6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2QB-0007Xu-U3
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1mp-000497-FA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:54:16 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1mn-0002uS-12
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:54:14 -0400
Received: by mail-yb1-xb34.google.com with SMTP id g28so8272818ybj.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fnWy7HWaVlx6qb9olD5NiDncSntiQ6WGufZzwpPX9eM=;
 b=T9K+XLH6l9xus7mPq8s97Y4vyQFS2x5rMWg9/QF2/JbqruMhRKFe2mes5sudxr1uyn
 pghjMtlVgcYybF07cRsaEHdP2s7sVwRh2qgmQgBS1Lzr9k1jxX0Ii2rhrAF6bdrQ2yfa
 jKOZGvlPTXZx+xzVLeABolwyO7oe9nlQ0rI33MG2PBVq2t8LZt4/5wzhDSqTouv88VcZ
 LqlT3K1pMEtxzA8zxVTyDpcgTNpPmJ4zb1aeNO0HlFP5tqylm8O3pvclfTtGM4aNH+3U
 e3nEmWmb6zbvdub9f7iXXKWqS/Tn4yl76rvTogbRnB+hXkIj5ncu3648TpQBkSZhbPnJ
 RcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnWy7HWaVlx6qb9olD5NiDncSntiQ6WGufZzwpPX9eM=;
 b=zowBMIRjHaTSUs1/M+3gKn3GL69E1cj0j1fTJ4O1WqCwI+rv0Ov7JeFr2OB4r0Pdfx
 SM8ztkVMViWil5Rd57n2w9ysfWVls5q7DR4vNh/O2JIBgbBvkvirPBPat75ojYvtfClY
 Km3+z2IZD3ocTE2UWyxV+IV33qcmQXhlUz8vxGMz0LDbLw2X7Yhnhqls+LudNLur3Am5
 4k4HB2mE6dR9w5hsIQ1KTYnK6t7Ccv7Q56kzqej3O4VZKD+hLkPyyfrM97dxXdJRH6VG
 BrsWiIrS/rXYVxdZMGszYsDujf3stGNtFPi1vs8v0PEyPvUPIDqDCyFGT/63Fkta8fT4
 h88w==
X-Gm-Message-State: AOAM533E1n+z2GGPPr3PVrcZNdSyMhZg9CA8SJ0NXm0fVBuEvlkc9OSN
 IzEtHXiEkZDfGzB7iXr84KtiusvTocSN1KA2RQPW1e7ecKY=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr29971491ybq.67.1651143251458; Thu, 28
 Apr 2022 03:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-48-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:54:00 +0100
Message-ID: <CAFEAcA8bgShHLzF94Cpkn70_csE4ehGkAFLLw3tmnx_=jzSWPw@mail.gmail.com>
Subject: Re: [PATCH 47/47] target/arm: Use tcg_constant for vector descriptor
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lal5F4u4b0dw

On Tue, 26 Apr 2022 at 18:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 54 ++++++++++----------------------------
>  1 file changed, 14 insertions(+), 40 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
