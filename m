Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4858922lft;
        Wed, 6 Jul 2022 09:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlV6zza6vmlMFqjnjZycR4cZInaAC1fUhHNGkVIPIOw5JmZFChk4nkGeYU54cy7O3BO89S
X-Received: by 2002:a05:6902:114c:b0:66e:a56a:1783 with SMTP id p12-20020a056902114c00b0066ea56a1783mr2268175ybu.13.1657126105500;
        Wed, 06 Jul 2022 09:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657126105; cv=none;
        d=google.com; s=arc-20160816;
        b=ll0vwLbF0TvCOrISwOTWgmngMuwVZ0VZuf4Be8p9pFLhJd8/5anK6arUY/wcWowro1
         HpKweYVNs3uGYsMymL7mDwFu+of5htXRCjHGqntHrMnF7++W6kGADhBv/+MtruH3Mr0t
         wY/tVEujdBeFO8sySFhFR2zLoVD1eVKCbiiaBKJvh3fSXiT95+v6GL/d6ivHSvcyz6iE
         CaJFbjP2+34V46da3Whdc+PGN6s3FAX0bKr0Xqf7Rk7yKZ059Gc9P3OKkr10uvQJQood
         +2wrAcssnsKdzh2GSG5HlwgoEfG+qoSYXDo+kxAbutY03qHTnPseq6ILMxoaD9vhAYch
         7JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5id/fU6e4+BiyBLDcEg7NE/Z+ZXGnWqyK6G+oE3ni/Q=;
        b=IQzLP3UfabvDMW8EUMvrocJC8PyRleqMLhSMNASFcIi92jwXhbZ39zSAeCc8LrghGt
         sP2H/fLS8QKd3GXv/adYZ43Iu9C/lQHCkP4pqD5YenVXX5kMo6WMk90ul3Fhpo9hCcCB
         0W83VxPOwb2qxqu5Ts2jG6KsNMA3UbV1J8KF/1jWfYYLImA1pP8HY/o080bHnOJjTdwL
         iiX6JZq/+vc+BkE0AVYMByLpcqp5UMciOWryvXfGsOUlhAvK+9ctVBLwPjhv+ec3uBd/
         NQ1hqSDh+JBdeekodFVaXqj2r/bVAKF2cCiHdmBW5m8m57EiXrF4QePfdmb/3FRwPmsN
         V73Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HV1CK8K0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145-20020a810897000000b0031cb4d580c7si10011625ywi.374.2022.07.06.09.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HV1CK8K0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o98CO-0007gg-Gu
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98C4-0007fA-Ky
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:48:05 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98C2-0003Wh-M7
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:48:04 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3137316bb69so145859267b3.10
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5id/fU6e4+BiyBLDcEg7NE/Z+ZXGnWqyK6G+oE3ni/Q=;
 b=HV1CK8K0BfeINztORDcYwxyC+1DL9IXCRfNKQmZ05t9Z0MnaDkFBR63xQ6unkJVbKu
 9wi3n6I3Dy9Rhh6we5iNSQIMJ+hbSsAZ057g6VTs9wqkosztxrn2pyGOygh32RY0HDH9
 VJgek88Q1cUMmtN9b05E2S5lZwS9bEfk+IsORLlMPTq7myQPGw0hibP0A9KLSwZGasqb
 iTWeKyD/zZxuQ2WD150U1zuT2QjDFp9A4vAlGrj5ZsmF53AbR62lIqRraA6H+3KQ/kLw
 QUGN+IWQLZ16Y4sac/sqPnlZ89aZ7D/3kaLTNuclrfT9HmmjZdD+Z170ZZd5W19tnI0h
 sLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5id/fU6e4+BiyBLDcEg7NE/Z+ZXGnWqyK6G+oE3ni/Q=;
 b=ezGQk/tI5+052qdqcI6Gtd0VTANilDIy5jumhdEYdO4ohvacV8HaEJs4kl32Au638j
 7x0k6RucUTWFH6RzImWGbzr5kPfIWpY5pps7itORkUYIXb6PnuwZB25Vq6qH51C0lQ9K
 12hdux2TAZcTFlC23o0Nt2oPi26lFQDuBK3vzth5BLK8Q2CdnMKV1A56mkGmWH9vvBoG
 Em8xV5sIOtaz3cPDyz/pgE/Y7OcrUroquiDhcKVLZw2ingDGxgqz1OWHvuWqbGHVrQqv
 JJ92SB6aoXrYvB7JK6mPD95qzhoqS/3asFGeaDC+M7bQ54ykFB2rscn2qsLCQLYX2pAI
 dblw==
X-Gm-Message-State: AJIora8jjZgJYn46iT+1dBgV8L6JdciqgNRqPLeeFd9wLuedmjV5JAjE
 9agdB1Cl8ulHWcZUrJUmg4Z/afAaYKEnoUFlbHFdqg==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr45594571ywg.329.1657126081460; Wed, 06
 Jul 2022 09:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-20-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:47:23 +0100
Message-ID: <CAFEAcA91ibFPZy61jEJ3dx4foNRHpgnbAYe4W2wwtRpUsa3UfA@mail.gmail.com>
Subject: Re: [PATCH v5 19/45] target/arm: Implement SME MOVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: VdN35YwzCN3j

On Wed, 6 Jul 2022 at 10:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for implementing moves to/from
> horizontal tile slices, but we need new ones for moves to/from
> vertical tile slices.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +/*
> + * Move Zreg vector to ZArray column.
> + */
> +#define DO_MOVA_C(NAME, TYPE, H)                                        \
> +void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
> +{                                                                       \
> +    int i, oprsz = simd_oprsz(desc);                                    \
> +    for (i = 0; i < oprsz; ) {                                          \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
> +        do {                                                            \
> +            if (pg & 1) {                                               \
> +                *(TYPE *)(za + tile_vslice_offset(i)) = *(TYPE *)(vn + H(i)); \
> +            }                                                           \
> +            i += sizeof(TYPE);                                          \
> +            pg >>= sizeof(TYPE);                                        \
> +        } while (i & 15);                                               \
> +    }                                                                   \
> +}
> +
> +DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
> +DO_MOVA_C(sme_mova_cz_h, uint16_t, H2)
> +DO_MOVA_C(sme_mova_cz_s, uint32_t, H4)

i is a byte offset in this loop, so shouldn't these be using H1_2 and H1_4 ?



> +/*
> + * Move ZArray column to Zreg vector.
> + */
> +#define DO_MOVA_Z(NAME, TYPE, H)                                        \
> +void HELPER(NAME)(void *vd, void *za, void *vg, uint32_t desc)          \
> +{                                                                       \
> +    int i, oprsz = simd_oprsz(desc);                                    \
> +    for (i = 0; i < oprsz; ) {                                          \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
> +        do {                                                            \
> +            if (pg & 1) {                                               \
> +                *(TYPE *)(vd + H(i)) = *(TYPE *)(za + tile_vslice_offset(i)); \
> +            }                                                           \
> +            i += sizeof(TYPE);                                          \
> +            pg >>= sizeof(TYPE);                                        \
> +        } while (i & 15);                                               \
> +    }                                                                   \
> +}
> +
> +DO_MOVA_Z(sme_mova_zc_b, uint8_t, H1)
> +DO_MOVA_Z(sme_mova_zc_h, uint16_t, H2)
> +DO_MOVA_Z(sme_mova_zc_s, uint32_t, H4)

Similarly here?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
