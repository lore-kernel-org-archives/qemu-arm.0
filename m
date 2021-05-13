Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp370988lfg;
        Thu, 13 May 2021 03:54:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTfG3pHy2kXeODrL7jKJwP6+dt2XhHl4Mgq/N6oYb5fzbbmx4csyTXbrQXK8cAp16UPRuU
X-Received: by 2002:a1f:c345:: with SMTP id t66mr32201256vkf.20.1620903269740;
        Thu, 13 May 2021 03:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620903269; cv=none;
        d=google.com; s=arc-20160816;
        b=UUW4AYe74m2XXu0f9Eh8iF/Qr6VPF5ZG517BURM69CrdhL6iLfoYf9BJmjY98eNN6+
         tlL3DGE4NvdfJsf1VLfsYkGCXQLztXxYw7pWFt/7J9LbvzQy+9t/CoRcb1vN52DsA4m5
         tY0I4nXjH72+CKC+VrR7a8cOqePqlw/W+uXgA9zGhhCtN6qRHCKJmUaWKnFgLVlUum4v
         CO4dRl6YRZ4x5YqFblqHg+Pz++NzqDERQfRUMX6kx4c3FlrHWzGMJue2pQGy1EoOdkgl
         SJgp/Ymb1nHfUUzIA2Dz/7fTm49LmtU5FjiccHqbqeacFXWC38x5+vf4G4F/3PUKUgh0
         E03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hSkMw/ImLL2Mr3IS+864xbBtJJEtKnuBqALEId8wJMQ=;
        b=1IhctYUahAkngk2dbm3/V1/5qaIFv7oaDB+dlFNRv/9vT0In+wUQLVcxqwkJNl/tDV
         Te4wKDG/2YEPbxQPUjNaeAD1GkwEO73AttxbpzVYuGGLiAhcr9XIlijD222518v+DA6c
         scs2mvD1hhkibq4G5OMFoM9bISG7D9o6YZ1MDuD8sfuRlHIaTKfNS++NXTsw6JkVBGl2
         0zmvC/ToNBtiUYtsk1fm2mtlWfuhcRwB6GwRsX9NyC2g0ziYD/cexCdmjH5rGG/BHYYk
         BmQNPgsIXC6e0R6npigj80DsHM6utCdT69IPL8hIhYxuGYrf12WXqwKKTfPObIt3cR63
         H7eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A0ibHRgH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si1456900vsn.164.2021.05.13.03.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A0ibHRgH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh8z7-0003Yk-1y
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8uh-0003YN-Ha
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:49:59 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8uf-0004AY-9K
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:49:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id c20so3849604ejm.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hSkMw/ImLL2Mr3IS+864xbBtJJEtKnuBqALEId8wJMQ=;
 b=A0ibHRgHQ+hxWN5RUxbreSK0L5QM1FUDDOOnYsbqvHmjNqF2Cvacv5qQaE5gtHcGg8
 VKy4dyncQOi8Ul2hEshaVYj8ulxIoPglwR2o8tW2h/uDUV/kiUzAyKra/h/agRSVo7Jo
 wSjENLz6r2gf+EqUNFyA2KuXN3OK1OUBj0xXsF979PvEdd5bGV11CZGTkC1u9mBnPprU
 mq8i/odN0H83Sssss0o/v8bmnp7sCmfj88gV7dTNfuUIYuuFCv7EWnfte99bb4cSYQh2
 1HCnyoNnwWsMHi79Ny1p/wYRw+cE493IaoSVVKeGZtqJ++VMmz2mcMsfbHRGy3a+3jKt
 zkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hSkMw/ImLL2Mr3IS+864xbBtJJEtKnuBqALEId8wJMQ=;
 b=GZmgHJ8WVnIowuyJ2D3jMCp1SPzMP18P/CQ0eGudT61nlrikmgbT3hgMBTOSX2p3i7
 pWrjBH0x+mepC+tvWoKhQ4gx5OAScfiTjpJLZ45ThR4VqHEWqeO+8N94DdIoB+AT3L1A
 H+PJ4T4KdZIwF4mMMXkUWUTwp/zKg+5IuXcVtVFIF3TCe3ed3koAK01XTiTrPfiFnXYR
 AK7Hq/RKKqf51W/nT4mUAwEZiwGpd55YtrdcYRxpj6KyoOFwxu+k0osacRQ8m5hcOmus
 nxUxtuXP8060yYPUmXCVBbpYysmkErUtA1LQCOvFYQPR/uvBZXq1T+Obzd/FgWA4JWWB
 aIhQ==
X-Gm-Message-State: AOAM532FgglG1xtc5MoifSKDp45OESwCdacBd7MKXmmwy4vbVRIK0I0D
 1bh9bRKizGkFs6Q2wOSAi8aPa8sFLPDXcI8ZnrJd7Q==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr13506587ejb.482.1620902992008; 
 Thu, 13 May 2021 03:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-51-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:49:40 +0100
Message-ID: <CAFEAcA9XDSdSpD_5_WJN+0EQ1C3x-ZDFJ9HkU3hrgAuiWSwChQ@mail.gmail.com>
Subject: Re: [PATCH v6 50/82] target/arm: Split out formats for 2 vectors + 1
 index
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ujhU/v7WhmCd

On Fri, 30 Apr 2021 at 22:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Currently only used by FMUL, but will shortly be used more.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode | 14 ++++++++++----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
