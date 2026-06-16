Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14958CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:36:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTxR-0006Lr-62; Tue, 16 Jun 2026 09:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTxQ-0006LY-EA
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:36:00 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTxO-00086K-WA
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:36:00 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-66077f6c438so4539245d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781616958; cv=none;
 d=google.com; s=arc-20240605;
 b=GncWgwxfRjmW7B+pG5P5fDAnkk/CfpTM3/KNE9ItEWrJEr7m43vocgmDfsAQtegLM3
 olsBErZM9G4qSPHGk70YURxeQpFUlcfdiXkvvG3G2Zl1x2na3X9SuBOhaJmJV9mKTgan
 n7fC6TOm8ksZAPBquNG4NljKLqHoeZut+Ycir3BoQ8GaMpyAWP2AFAmTTBhzDVX2RaBV
 4kUWh63j+Ot6fJhpfFRyu/96aw4uyaTPUKV6EtPR72D7cWIO+8VRXgaF7jqqfykHpBAS
 102oHicmwci/6bTEjjhzQtbVvU/f+6q3kAbFNbcEZH5mlkMAaRVsEDA1W4otKpQxY1vn
 6x/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jVdCM0vm9fG8/nik0JzNJlA9w2tO0XZ4Hh14ixz2hhQ=;
 fh=hYw8942qeNcdlt0lmkRFQ/e1Xdxxrl59AWbJGnIAis4=;
 b=UF7hslqOJ44f6OWBn4zKn/NTJvuZUvj42cyxFEaDCHrPO/RzKfqeeLxsiDdzUyZwUg
 +Cs6gvIgyIcBgPUktAICsXo6VneaKvM1/FTtSE7eDFQFRC9BFKaQt6EIC30BIu+aNmt6
 EBWuGsH3JWbUKM8ea6P+CHUK/9J6lZ4GPEk2gzAIsAd7Ju7rFqMFw8H4mEVJdHFFfgM+
 7bc4IPp71RpZh4lDXd0/QGMolJlplVargk2aPRbWRWelQPF9iMRwQoAZ5s+UWQ9tfHul
 KRFy/lBgynzxkLqi5lOwZcFOYOCQOXUnKWpyTipeWn8xH2pd54vws7el+nGR4K+fO3wt
 h54g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781616958; x=1782221758; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jVdCM0vm9fG8/nik0JzNJlA9w2tO0XZ4Hh14ixz2hhQ=;
 b=D3iSPrjlc0vFkwQ8xx/ayKLj35Fi3ZEvbFzo/vYsDXQevcPziyZYzw3DcyeY8gVsFb
 oOXHVYOFo1LbR/9sIo1DlYWS1i0+dkhC+yfwazWPC3acMYs1lmZeAWWPSxrboVWgvmLE
 4CTFEgoW9N/gVGZ6gI283qCkGZIFavPDGL0jksJhPgr69NarS1uMSjen3MOLdeNI/VIh
 D9cIJ8yVZH+XJ5hnNFbj+l5qXlLfv9d1sx0vvORHbbFzqaXem0xSeUsv+rT25HkyV9ki
 pQ/nFcaPEPtmj97RDcZ6KpXXCQnEWA8s4rA+UDsqGvfdlHhm5qNBSNPML9yJwBIYYS8c
 TcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781616958; x=1782221758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVdCM0vm9fG8/nik0JzNJlA9w2tO0XZ4Hh14ixz2hhQ=;
 b=Uz+3LFi/tTtw0iRYaM3bIyYpzKAwgCPUFNBFb5OJ2vZ/sv4l/KoxA9OmjNYy5K+e9G
 joSC3iV9VVhFcHcDyY3fw+45vwwbBQa1fURjBAzFz0t11+cZxKndbzbl2l5X3VeKHvbs
 l8T7cfTRXnkxaFXRu7gIr+YOKTmOc4d3QEM1Wz6Jr2mRLYL21hd1UNYXMZGcxHNv4TcB
 DsBM5/NTvuomdrKkx7plAfb5vuJPXNEiHtPKrLVaPlvGg2rSEWtPVRKQmBjnc69I6Ug0
 NNJS9ToTksaGpYCnirT121+J9M80s0tG4vYC7vvi7kxII9aRGHI5SgNnoHMJCarDvkzG
 6IFQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SpxjlJSdOOiMMwiTzZjWsJFIVoB3F18SEhLk4MEvgbQuswesaXCiKBb9zKmO7oJV4d7K1Y9x2ow==@nongnu.org
X-Gm-Message-State: AOJu0YxKBZ+wiu+Gdj1dwUcmpmY9qzS+auzEfruCUzPFj4lAzTk626DR
 in3y3mBmgP9uGJ6h/ooDNnZvXKz9Z9Zl+G4D71vuJPGBYOSCsapl0lt7r++60xbod+tMmCRxwqq
 ze551/xwE8As7QPywx91KHMeHFp1EMqS34RoCIYNRTQ==
X-Gm-Gg: AfdE7cnZ68ngtDh1M49yKfwH2hh7wkiYh644U2qV/izoG7vVdGguLlBYgEx7sRzEun0
 Yyy7S3ws7Ph+lULy8MH2FKNmpGCxCouj6wwhBk6bSaMKb9MishgNFOl3XcGqrByl7fLr5RWyNwd
 e6a/Il18Cz9tuPG7Fkf9QUOsbXhez3K0fLSRrKJUIAxSb/bQiTNE1Pu7SX3hNN44jmtOv2AH0kw
 mnJaAV9tggFlhncr2Ys4AICD/obep8WRyV6jzs2pYxOBcaIR7YGeMa9g7fL67AxFT0I6HbG/JjG
 q41LFqboBSu1baNvSzubg3rmaz17CPUppc9OZ8yynxucYBxhBA9T0S6K6Wxp3nT2FT4=
X-Received: by 2002:a05:690e:124a:b0:660:6971:db6c with SMTP id
 956f58d0204a3-662b6136872mr2697099d50.44.1781616957358; Tue, 16 Jun 2026
 06:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-21-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:35:45 +0100
X-Gm-Features: AVVi8CcycCkRH0RFQNH7U70Z8i_r5BS5KfBphlJLe4QnrTZ1PqY2l2wE96vKVUY
Message-ID: <CAFEAcA8Vnncc0dfz8D8DRe0npH9FSRPsNWg+_-PDFdiqyWHSdA@mail.gmail.com>
Subject: Re: [PATCH 20/25] target/arm: Generalize sve_compact_[sd]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 5 Jun 2026 at 00:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement with a DO_COMPACT macro and general purpose
> predicate handling.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 51 +++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
> index a13ccf4b85..40cf567b0d 100644
> --- a/target/arm/tcg/sve_helper.c
> +++ b/target/arm/tcg/sve_helper.c
> @@ -3637,39 +3637,30 @@ DO_TRN(sve2_trn_q, Int128, )
>  #undef DO_UZP
>  #undef DO_TRN
>
> -void HELPER(sve_compact_s)(void *vd, void *vn, void *vg, uint32_t desc)
> -{
> -    intptr_t i, j, opr_sz = simd_oprsz(desc) / 4;
> -    uint32_t *d = vd, *n = vn;
> -    uint8_t *pg = vg;
> -
> -    for (i = j = 0; i < opr_sz; i++) {
> -        if (pg[H1(i / 2)] & (i & 1 ? 0x10 : 0x01)) {
> -            d[H4(j)] = n[H4(i)];
> -            j++;
> -        }
> -    }
> -    for (; j < opr_sz; j++) {
> -        d[H4(j)] = 0;
> -    }
> +#define DO_COMPACT(NAME, TYPE, H)                                     \
> +void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
> +{                                                                     \
> +    intptr_t i = 0, j = 0, oprsz = simd_oprsz(desc);                  \
> +    do {                                                              \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
> +        do {                                                          \
> +            if (pg & 1) {                                             \
> +                *(TYPE *)(vd + H(j)) = *(TYPE *)(vn + H(i));          \
> +                j += sizeof(TYPE);                                    \
> +            }                                                         \
> +            i += sizeof(TYPE);                                        \
> +            pg >>= sizeof(TYPE);                                      \
> +        } while (i & 15);                                             \
> +    } while (i < oprsz);                                              \
> +    for (; j < oprsz; j += sizeof(TYPE)) {                            \
> +        *(TYPE *)(vd + H(j)) = 0;                                     \
> +    }                                                                 \
>  }

Why do we have special versions of the predicated loop for 64-bit operands
elsewhere (eg DO_ZPZ vs DO_ZPZ_D, DO_ZPZZ vs DO_ZPZZ_D, etc) but we don't
need to do that for compact ?

Similar query about do-while to the previous patch.

-- PMM

