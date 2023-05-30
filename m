Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2194767ejb;
        Tue, 30 May 2023 06:59:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Id0X2lYwegbzAhK4wd5uAGLy5GL2GBZuPeyU9i/vjzHMwiydPygN/TGPpXkXIFC9re8Rb
X-Received: by 2002:a37:6888:0:b0:75b:25a2:c284 with SMTP id d130-20020a376888000000b0075b25a2c284mr1910847qkc.30.1685455166485;
        Tue, 30 May 2023 06:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455166; cv=none;
        d=google.com; s=arc-20160816;
        b=VQNInfChCmMZObmCaRBbLrFBSfBjDq6U+lTWQIXeL01tH0VlRBV5HMOVYODxoFmrqv
         zIGmTd3DMNLnkX6IWpiftPczHpock2j2k5HgaLkwoUm7WOtyaC+fcvCj9KiJMQsCnBAV
         8ioTE1FO1FVNIo4cT7QRpdutJ1thKDhZkNY8n2YezUzMtiqPL9kMqG/iHFwYwrYLIzbi
         EexRhuccqNkIwD7U4og5BDJOcPtu4tvC2bOvGsIjJW8E6kI+FbiMqiiLjtGtYhTS+oMR
         YFkaqApJBkJlAZow+pvRrPhh64b2vQWQDAgULMSVlLRhFfAHPSTzVizmmElj+dLrdg/Q
         tBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0DpdQlAz0cb9SoWMpce1jvoE8z2VnSLG/dl85u0yh8w=;
        b=ClnDjc3bCu4xfyhDyvvi3f+FnrwHvzgmXUqDAllduo6EtfxqdJ/YenuvGXpthYnpue
         FNUJ+IntS8KGdwaWiLmyQYfZ889Y4rqL6TyuPO2FH4kALplx7i3PlaUYen/SdMpByS4K
         NZuPjhTNO1+Z+lJEh+ss/oYqX67jao4FRbCdcirgKMDVzW/4Nwcq4rUiaOhT2ETfwzXr
         4Siyyb1jOTHT1ANM2kmqcc1REh5rwmfilW1pfn5xl4uBY4wOrkHoYfsl/aVKoQ+FzHYV
         nh0fBvHFe4CnvdsbAf/0Ppqorf6kcnyLlx2lOG0VuisTy8DuDKgX00cskzEw74HJEE9v
         cdLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7Dxa3m1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05620a136f00b007590714dccasi6155446qkl.540.2023.05.30.06.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7Dxa3m1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zsI-0001bZ-C4; Tue, 30 May 2023 09:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zsF-0001aa-Gg
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:58:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zsC-00033D-6S
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:58:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5149390b20aso5566828a12.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455130; x=1688047130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0DpdQlAz0cb9SoWMpce1jvoE8z2VnSLG/dl85u0yh8w=;
 b=g7Dxa3m1npiPNdNAXIwl9eWdoMV0TfbrHwNApLO+XUXG3+bLiATH/QYnpRLUeO7Hcg
 23Bd7rXkP1jHkJjh/4h9BgzHu9C/6X59SDkRis6WtyGQBUrmzdZDsZ8ZTrHhnQYNc3uT
 oO9IzHD+OmfJso8G9wooeBBviEPGm096Id93D670fnZRW9NtPHe43h+J237u6zWUNMpX
 bK23gheAFYkERs5Y9eJPeszCdimwYqtQBzC+AJ9rinf5Q9+NhcZBeWqf6pbB0BqNQwqX
 j9eMTfUt5L00hBa+wL9E/Bd/p5NsolHZYIiPfvVhvUIpGWx70p4W5Awux9OrMH4Q2623
 +PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455130; x=1688047130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0DpdQlAz0cb9SoWMpce1jvoE8z2VnSLG/dl85u0yh8w=;
 b=F/cw0pKYoO1swAf5gfcrTF/J37uQdw6r3QgDm1Re+2pAJGCbYsxxOFQVheVd6vnh1p
 24pF3Z38BNEQFgabNUlNCY0rUair+MkO8vfUPU8UJmi8s/dPKVH+mU08lKMsIK77kgBf
 qPfaiCJoxIxjIGcr4WKLt+QNxk0Ou34drhBnQsGFHjSlNJn79hrBCE3HaDQQK4xr5n6Z
 TlAZHDMG5h3+SmtdYN2a/TdBUmBZ3ETDJt8ju1soVcxOmw/7CM1bIu+SQ0onNVdR4W37
 3NBfVoOO2Ph/xpExEPCngjtzJU1Z8Vm6yGRBUcVzpos+gp7A7erVyI6JbI4/U8mjwS8J
 5H/w==
X-Gm-Message-State: AC+VfDzKtOya1Ku13KWpVc/Hefv/lUO32FV6l1O2RD1d+XwVjW0lhqmY
 R0WVnN5pCCxwftqhREyi8g/UZrAZm7FbxzdQjtwnZApCXn4x+amS
X-Received: by 2002:aa7:c61a:0:b0:514:9c74:4cdc with SMTP id
 h26-20020aa7c61a000000b005149c744cdcmr1870374edq.15.1685455130595; Tue, 30
 May 2023 06:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-13-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:58:39 +0100
Message-ID: <CAFEAcA9YoR4WegRiHSTOjx+cPtYUV8gL3z692so2oADGeEWpEw@mail.gmail.com>
Subject: Re: [PATCH v4 12/16] accel/tcg: Extract load_atom_extract_al16_or_al8
 to host header
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WePt+ClFPizh

On Fri, 26 May 2023 at 01:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .../generic/host/load-extract-al16-al8.h      | 45 +++++++++++++++++++
>  accel/tcg/ldst_atomicity.c.inc                | 36 +--------------
>  2 files changed, 47 insertions(+), 34 deletions(-)
>  create mode 100644 host/include/generic/host/load-extract-al16-al8.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
