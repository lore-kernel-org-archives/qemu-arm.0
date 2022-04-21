Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp582524lfk;
        Thu, 21 Apr 2022 12:13:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPUMjRurEh/kwVkOUBHRKUeFcpCctFZsIJpMgPO3A5LVfEC515aHXC/dGt5mWNnWPNA9ch
X-Received: by 2002:a25:c742:0:b0:641:3846:ebc9 with SMTP id w63-20020a25c742000000b006413846ebc9mr1245885ybe.404.1650568426122;
        Thu, 21 Apr 2022 12:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650568426; cv=none;
        d=google.com; s=arc-20160816;
        b=de72Y4jSK898oUwNfnXlfOMKvuTMQ3AXVML2OnOf1vYcfH2oZb1Z3XYezxTk+m+3Fm
         koPlbUTDFZRcecgzGvdPQsgvo5sbhCNPJt1JMQ+FhJWwASOZliTp5CdBkDa3NeNsbYzZ
         HuUcg9wr5CHl5WDo9QgTQhwRZh8u2hl7RHyJiwLqFe6PFKkHc7UX5qUhQDxM3SPEKomj
         YqP0AzFdiEzVfh2Xxz5OdbdlPFe2AHrhMMzqCwYDVnyhWkztbNKesMZ6aYoa3HPtaoDK
         2s2N4LmbkunFZ+qavGc1figvi6EbaJPal2hV16lmAVUDU7sSyfEyOXZLu+LxOVFuG/Fn
         liYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7GXejyT0h4UksFxHnb4Z5L4Ve+Mgt1/oZACuTAXAXpc=;
        b=bBHs50b71epwYuquaG1rnQ2hHy02tGlpmA81VLj+CWdyw8jRr2rOXP4YQ7CGP65jrm
         UHVTPdStRAncdRuoDMoGrnknEJnxCUvoO0LkcPo3c+wisinvczQXSMVKFuhBWtDFciE9
         R8uyO4f/W0lLd2c8a0UFr8XP7aWagRKmPrhm039JkbWwpNFkKTLOuq/0UGD/1AWwY2mY
         yIoHEhpyRRA4GJ8PBvt/b3XCNuL71SjA18zzG/9y8qKIVgYozR3LdL3OW+dwwk1DZgOS
         52hVffCTyD8GNMAQDsUE+ou8y3nSlA834/E8SVEKhqxya+PSG60z4us+f93W1DXyuMoT
         rKUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ewaGdL6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a256f07000000b00641d11f9e86si3222103ybc.501.2022.04.21.12.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ewaGdL6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhcFN-0002Zn-HD
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcAa-0003Rr-SM
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:08:49 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcAY-00024R-P1
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:08:47 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id j2so10499271ybu.0
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GXejyT0h4UksFxHnb4Z5L4Ve+Mgt1/oZACuTAXAXpc=;
 b=ewaGdL6b/+cQw8o4IpFM5wJKkFb4IknCM0lm6vDs8HuRTJXnt4pESYSffoQysuHHvT
 uilQ594RDcgGUzszrxIxu43rzDUSs6wVqdAg1FAAJy9bP8SCzE7i8Nz+SPd27TIQWzub
 5bsPlIghjkAvQ6hS51JVNQKtfwdhxrwNX7Az4adT3AJBQInqv8vUjvmKffhpph6UgQSK
 PhPemRyvtCxi+BLBYnKM2IiPWyVthC6huikMNPm8eeWhF9NmrGdLM+xEIvoPStLHLThg
 UO3ByAtVlmidunhS7sHz0NUMfL/YcZBFEdfYW5Yc5g0sJH1wOw5+OuG6zdFcjHCsyH1l
 rURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GXejyT0h4UksFxHnb4Z5L4Ve+Mgt1/oZACuTAXAXpc=;
 b=bZO1OnrEz+q9WD6IwG7T1mQU/Lsf04UvK6UeUuz/F0J/aVmSbUYpkhpnCpQA/mBr83
 SYk7WILbVIoCSz+GWt6I+/z+PlSLR7LiR5cYWxSzqNLiLwfWmrHoh/Rqro/EmFqOwPNl
 ejugnGYhPAA7YjgUZz8o1B+q+TJpGnBb46ppU6zlPlrdGSyeK1MP73A7n7EnjqJbC0ap
 OVXGFE1wXYhZaM8B7JjNQMBxPy6mDA+lYHLr/k6qDxQhpIexYUmUHlzYeIpmdWM7MD4Y
 iNDTKQhDO4ytXRETCMTFK5LqMAumVF6UMV8lkYhgRF3qMazE0SlfCn1q33SgC1E4Owcq
 Dc+A==
X-Gm-Message-State: AOAM531Y8Dxy56zBsZJRZKE9Ilrrj5WSXnuWl7XBheUua4GR87mfrhNM
 asaTa6IYhXqhyZstIVaH/ZEDqnZ3bRGCvtzcEvoCgQ==
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1174841ybi.479.1650568125846; Thu, 21
 Apr 2022 12:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-22-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:08:34 +0100
Message-ID: <CAFEAcA-84gFANHDa-3WOD0BT50Vg+ivCM_vpHp_ZmSrxNZvJfg@mail.gmail.com>
Subject: Re: [PATCH v3 21/60] target/arm: Use tcg_constant in translate-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GxO5q9kuGL4e

On Sun, 17 Apr 2022 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 198 +++++++++++++------------------------
>  1 file changed, 68 insertions(+), 130 deletions(-)
>

Too big, again.

thanks
-- PMM
