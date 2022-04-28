Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1652812lfu;
        Thu, 28 Apr 2022 04:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWP+NjcbCHbjHv8il4OY5W6JfmfSKE0/TTHNBsD56wEBs294KYaqsfz9CfVKgaJo8XbfXT
X-Received: by 2002:a05:6214:da5:b0:456:390b:8b12 with SMTP id h5-20020a0562140da500b00456390b8b12mr14044450qvh.58.1651145083868;
        Thu, 28 Apr 2022 04:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651145083; cv=none;
        d=google.com; s=arc-20160816;
        b=EMpvTXaE/JAwMGK5hyNoo87BUbLTJgsiMTdw3Kg1b8tLaaCE/EUs8ed5CG9YuXP1KJ
         dmIgPcnjOiaJLj6n+4KK+ES6Y79wwdbZMIt5AIpVeqXJQUE+D4jQpqWGX/vJzNScQUSj
         Lu/b4fzYiW5Ia2p+twcyvkztJ6mp/uP3n5cd4ADCFLYB6bPuuZmvutH2c05MBma7Ni0x
         I3wivztY4vPVoukA7SCzjM/a8prIibGIapUQnZP9YeNf57Zks7fRlhIg3Y1hvCTVZ2Pl
         AbcI57F7S9IdSi3KZQPKTV0sp/How1tWn4S7ninuQF+GQq1RPmQ62V/wjKFS2GMA15vp
         kbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYZSHUBHvQx5MSum1c+TBChx9UAsxyxU1MuxeOkPMb0=;
        b=PFIUe083KBtngJgvQ/BUmCG4wMcGxwa0nwJwwvvxa2O2hei+z9U8E9rd368EvNZm21
         jA9FDEsxgrNfbWoVgk7GZU6xUY4wRYm3b+VH7xNEArTZlv79NMInhPco4TcT6jDVauJs
         JFH+yNJXP7WSLCzG6VpE/kjduFRgBUGwZrlmiGTKXAKjFnoMSc95lskxnNLHBd883Uy9
         et1Fo2+96XfeTItLu56JcDaBtXj4QZvYdRCAZVVmzwe/bz0yaPJYvbaawVArSSfaBOfB
         jkzYrMdqF2UmR8BUcXBD8i7I+nG4pYyxvEzXXpaWwLaozLWo96VcfPsCST+OjgXnt2Z+
         SanQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NpbmPzvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020a05620a280500b0069c2847a80csi1712924qkp.235.2022.04.28.04.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NpbmPzvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2GJ-0003x2-CL
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1bq-0003LY-G2
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:42:54 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1bp-00016x-19
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:42:54 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v59so8208693ybi.12
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYZSHUBHvQx5MSum1c+TBChx9UAsxyxU1MuxeOkPMb0=;
 b=NpbmPzvD+4AI2celowuCpUBxzjXzTY8q+1HgNkBj/EMdhPefVjTxKV3CwpIksh1SwZ
 9sNBtxQF09s4kPlFKAP66MMLQ0q4EdroJQPNfseRXP4QCsl47xIeCFX+t1ycUD+QHCbD
 bdomT1OqI9lL2Okv/yKnxqJaum73KraXpN1PTmExr0u3zMtUt0Ep10TuqpP5Lx4Xjefb
 ojXE6vjB57wu3YCkdoQJqQqMSOy/p4n3xaG4osF0gqLBitQiSXadGQcPpvtyxT5/xAEo
 eMfTEBXOHw6zJ/D42Uv6Jh/CLQ1Jk1mXOSN8LLsg9dR6Stca0712gHH5O7VfEOHtDB4A
 T6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYZSHUBHvQx5MSum1c+TBChx9UAsxyxU1MuxeOkPMb0=;
 b=vwa1hqgo50dIehfaTSALdrO2RICTwJ3LSbwySy5ky4RwT40OKCMNCDitPGW0heD26k
 12r5R26nb9xKYe8HMH2Cdax8FxHV43mFI5eF6c8AiS/Hmhq6Z5wH4OhGZPXHtPdBEldJ
 F6d99Cf062+5DZ8K8vnPhAP6OGf/zSSvwAvMxdCN/iBT/yutz1jXcyyoAV/3gqe2AcWJ
 /yaRpZuqcRiux4uHMPzulKSjb7LGADzUGSEY7h+s/oW7JjDTfTxxo4cLwaZJbMRYqdzr
 J/gkMOK2oZThSUMYC3uj6eawnMOb4C3Lk+/nqgHFtjxI2Sk8QiE2Qb+vxIomLUZUxXkh
 HVFw==
X-Gm-Message-State: AOAM532NhSLJdfarveW5OslWt5ot5epra9PUALrEeYB5ffX/Dkhl73yR
 Mny/ri+8KZCvydUYHsJca0Cob2+K/RkIGQfkQWpTVw==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29693229ybs.39.1651142571968; Thu, 28
 Apr 2022 03:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-41-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:42:40 +0100
Message-ID: <CAFEAcA_vgP5=8D3azMAdvtwvNFk2-51A6ywgPkBdj+MJMA8=6Q@mail.gmail.com>
Subject: Re: [PATCH 40/47] target/arm: Use tcg_constant in do_clast_scalar
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 70kedQgfIHk7

On Tue, 26 Apr 2022 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
