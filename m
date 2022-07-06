Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4862629lft;
        Wed, 6 Jul 2022 09:54:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQ9HQMStc4AIFGxzsY67Pg9GxoLDSF/sl2TlyBXHNeqAA04szl+35iSJO5/4prBnEcwCsb
X-Received: by 2002:a0d:e254:0:b0:31c:e4ae:3df6 with SMTP id l81-20020a0de254000000b0031ce4ae3df6mr5509007ywe.238.1657126490117;
        Wed, 06 Jul 2022 09:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657126490; cv=none;
        d=google.com; s=arc-20160816;
        b=RoS7mJirn2kwBByy0hZliEvA22y9B1JdtIfH2zlf6WbdyyFk8Rw0fKriy/O2OYVgkD
         2y4GwlleydWHMmJ5NXQsONylbNInwsQD6jKdK8Lgf8bQ4oL6nLQapOLmqLWHFtXvNnH2
         a4HiysvCdUy+DOHa7LujTCilcR7EQqq5h/rZlnD13ThfGDfjixdSSZ6Exmt6uJ7vqNPm
         rMplkUruu7urYPhIsgpDemdyeXhm/T1pq9DOSZPyy+hQofXISdJsnwvLBvrpTKAM2U/D
         BMdqgcLOe4HWo+d5gjc7RHKI6Cc9q0NmsLd3JdAo7/OSdPAeGNRlrP0QQQvCFi/M87BR
         /Itw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vw8mdLuuEMPv584JDmqMvt5ubyIGjiXJjC5oKLTyb0w=;
        b=0PVt2e3pL55XqoGIqi4F0IjrdW/FSCEM/ray2B3W11JARMOH07R7SdhhTC5im2yq9W
         cf5n6nqGaPZ0WEMCpl9gUfz2cQ5L3qaPOK2WkvZ8kO8kETKds6fg4OiBMdvqK5EwuKda
         kbtmA1g6cPsbLmpgPkKy1IiabG0SRDM0D92REc5JLCAtVx6SOPg1Z5w3IDJIa+eBzwCx
         5XA4YAKC8NF1rE9xV3xA+ajOFoLgnn19m3toguHwIXM0B6VzVV5NEiuxbAgIJhQQ8fCU
         W9zGaem1D8/KiZoUA1DWr+rwTPtbigefUC6TTzMIsP/q2QGSEbKnQ4xYKFZ8JiaFk6U8
         pyjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ui/CCp2i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130-20020a250288000000b0066e38e9113csi14430596ybc.25.2022.07.06.09.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ui/CCp2i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o98Ib-000740-Hy
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98IK-00070q-3y
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:54:33 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98II-0004RM-KL
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:54:31 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c8bb90d09so92527387b3.8
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vw8mdLuuEMPv584JDmqMvt5ubyIGjiXJjC5oKLTyb0w=;
 b=ui/CCp2iGMIyyLGpcMihdGOpTbx8d888tRFk84V9wmPJjwQACgnzJ/oj2DfdlZfdjU
 gAOKlLmet6nVKEPa3M+lI+sePzugpj3EHGqoKPjOIsQJ0wvos1uROBSbqWXZ/+rbTq/Z
 r8c3cuXmw787CjpooLQmciXEe8oJm3APbKuL8VZcb1wJDNGIIdhWqkpErj9qhPtGV97w
 u6B65eng3VBlDlavHLZ2XB/v+Kd2nhPLEkt4REHIlkjRvOSPxTqiQwQlCSPVAlILExCT
 PTo64WjflSaX0EPrQc9MVQ8gENyxm0KHEytBSnn/B96grEFcEHWEy/ol7DzKqDwEt02F
 o6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vw8mdLuuEMPv584JDmqMvt5ubyIGjiXJjC5oKLTyb0w=;
 b=5JYZrDRfOg8Wy9g8c3dpfBLoqO+Y7dHbUtRVYqDfr/ijOXCk0i+lkjrGJ3mrIn+z/Q
 tWb1CwTyQ/5B5yyh1VbBEc+0U0umW4xv54r76wKqiqQzF/9x7Fx0LO1BcNLvf6jLDDDx
 g/u/3Cn//NuxXMI6wXvMpS9fEW/EN7iK4QnkTn9yF5crZMcaQO7+mEQXj20iYOqDvrBN
 SVC4OAeZEe0fIbBg6Bs3hVmMkek0nmJ9odB/7FE265y9bAJdoaVhlNf0tKhRf1LDB6e0
 kLd3mm554Is7D9cjnrzyCqIMJfRLO28Gig3UTVwFwV7eE8p8qMlOtuyU2ru4vB1eTFxL
 s7bg==
X-Gm-Message-State: AJIora+b1HU35W+lPCkr0QD2kfmewpTbKgK+76brTV/iRB14Bg3gKx88
 V1qATMA/RHMXWki2jk3w7dRukhkaN5GaBsaEHDLnqw==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr45627155ywg.329.1657126468987; Wed, 06
 Jul 2022 09:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-24-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:53:51 +0100
Message-ID: <CAFEAcA-UFwHkxtHEpEca2=HELeh8Ba9bHAvL3tFX5BDeGnwy=A@mail.gmail.com>
Subject: Re: [PATCH v5 23/45] target/arm: Implement SME ADDHA, ADDVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qVhOgdpI1vby

On Wed, 6 Jul 2022 at 10:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
> +    uint64_t *pn = vpn, *pm = vpm;
> +    uint32_t *zda = vzda, *zn = vzn;
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint64_t pa = pn[row >> 4];
> +        do {
> +            if (pa & 1) {
> +                for (col = 0; col < oprsz; ) {
> +                    uint64_t pb = pm[col >> 4];
> +                    do {
> +                        if (pb & 1) {
> +                            zda[tile_vslice_index(row) + col] += zn[col];

Doesn't this need some H macros to handle the bigendian case?
We process the predicate from architecturally least to most
significant, but because zda is a uint32_t* we don't handle
that in the same order I think. Similarly sme_addva_s().

> +                        }
> +                        pb >>= 4;
> +                    } while (++col & 15);
> +                }
> +            }
> +            pa >>= 4;
> +        } while (++row & 15);
> +    }
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
