Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5355112lft;
        Thu, 7 Jul 2022 02:51:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVYt3szXR77AJEPPQu4rBc0E7NIEGo5jS4X+s5SpeUcR1RocA8YrL4gYKgdxDvHrKiEl/a
X-Received: by 2002:a05:622a:514:b0:31d:351b:e366 with SMTP id l20-20020a05622a051400b0031d351be366mr28991972qtx.277.1657187484926;
        Thu, 07 Jul 2022 02:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657187484; cv=none;
        d=google.com; s=arc-20160816;
        b=KKQvCI0fica8j7692YNWsNgms++f1QDIk7t0k9fZX5x7CXD/UFfYO6Anwmfao6Vum+
         ScteB/C6Ja5CVF8aNsdXpb6MLbsfFMnxVDlrNTfu9y/pOfoI9jjiHYOq5mqmvc5aHamq
         knQHpne4wt17/1Tg/ocDGdcXmQ0dbOaCIanrPb4e/MIt8cJL8FHh4yCX3qWTdPvoUSXD
         u1J91zRmbTdckUN9KN/9wZ3cCRYOIF7kPubfQQQBM/Xyw9x8T6VPl9YXoEGoJV9iWyIm
         FvzkplqBSzzP/vMAKrXdpJdUDggv/+DZ5f7sF6Rwzlq696XSwE+fVtfdFOn4g5Nwmzc3
         rAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2+7wSShS7IOa9zHLBriGTQZefWIupB7YBUOj0bBdgqg=;
        b=YRqa9d7RPD6CrxqB2MpdShals55TBmoCBJIdI/GDv9Ygcnq/A4Ek3L3O8enzSiu7L1
         8yp1tHmfegCXwb8jbN90Rp5k5Js/S9RMdLSodnNU0edrb4SrBzpK9GDFdfX1X/P4UnMH
         1VGew3LoqqOq++0m4rkxaJE8GzXdroRvE0mju2QJ1GmUlNqESeZad46LUM4miUxLsXft
         QEAMvEK+waN5cwxz3swk4Bku0LBu/xagB9V6MXKkgrmgAjLCTHW/r1Xh2g1IshUxLt+k
         BWVhV6PJc7nXlklMzE7xCm9fdSQBbgGyIy9nCwRJ/f4ogeqcFHTk83GEirAwdRT4N5iy
         2llQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gAbmPDEa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a37f70c000000b006b3583a107esi6057006qkj.634.2022.07.07.02.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 02:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gAbmPDEa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9OAO-0000Fj-Dj
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 05:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9O9n-0000B0-6t
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 05:50:48 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9O9l-0003IN-JU
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 05:50:46 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ef5380669cso164561527b3.9
 for <qemu-arm@nongnu.org>; Thu, 07 Jul 2022 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+7wSShS7IOa9zHLBriGTQZefWIupB7YBUOj0bBdgqg=;
 b=gAbmPDEak+kQlzi1wzrYT7SfLIO6SFgfMN6bFM9kEDc2/MKlsLnAZi/5Rge/q/zT5/
 arw6TJvhRFYezNDzvuTeuW5guJ0piwaNxB4HyxF9DYpdR3Wr40+cpN8jG8XuPskfVRG+
 yJRdsZM4KUVaEi9RNttBJfQz3gB+u8YMHhDXppI9JrA34YaolRIEGQH6P3ck2Hcojwg1
 fkhhGXc8o/CB9Jgg695yL6udU1UdC//TPCXUhNq2HZM/DE/QvYosyCMCgQjP9wGINhww
 rZF/KTnXAKDSbbfYHFcN2Kn0aIm6jsMKV1dYz2vK/oX4bMqlJ3XHszpSo6HHa6L5FhGA
 unWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+7wSShS7IOa9zHLBriGTQZefWIupB7YBUOj0bBdgqg=;
 b=Y6T7eUsSWeUMEfjHmr2ubv4XxThqMLjyCXnOIaLnh3yT3CoydEcsEm7FkGox9GRO+N
 BT1CaDw3tPdB2oOM+CGRDp7KFdbxxmSNmPqMzQrzQPKUSTHcE44z9Dx6c5rk9+Zf5kQk
 kEW6MwWBZDnXwVhKUWhE4jDbFh7KTgNVHiWaMW4s2iPqxCOQOqlSEnRe7LDqWFNv8GLH
 db38ZYTxhI6D8cesdtwLUBuHWJ7ntJTg9+FSrYBN93nMPaFaXdGTYZC2BR1ffpFyswI+
 Cy+Na60BuxqG8bqXhaNXCwQd5j9THJOIM82y3fNYL+n/HKfiUXfraD9vr0N8j+OAZFgr
 VwyQ==
X-Gm-Message-State: AJIora+E2iCog2XmTXXMlI6H6EDwUoPErFMd9u6citk2uCqQc0MXrz1n
 zK+NWTLEzLOIsPEAkAn5Kx6/I71Ij34qd/BhXcvD0A==
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr19171030ywb.469.1657187444238; Thu, 07
 Jul 2022 02:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-27-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:50:05 +0100
Message-ID: <CAFEAcA9pv2xH9mvydFK4zqB1viH1DebLB_s7bCYXDGqsCKatew@mail.gmail.com>
Subject: Re: [PATCH v5 26/45] target/arm: Implement FMOPA, FMOPS (widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fj6vaVfqEyk

On Wed, 6 Jul 2022 at 10:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
> +                          float_status *s_std, float_status *s_odd)
> +{
> +    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_std);
> +    float64 e1c = float16_to_float64(e1 >> 16, true, s_std);
> +    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_std);
> +    float64 e2c = float16_to_float64(e2 >> 16, true, s_std);
> +    float64 t64;
> +    float32 t32;
> +
> +    /*
> +     * The ARM pseudocode function FPDot performs both multiplies
> +     * and the add with a single rounding operation.  Emulate this
> +     * by performing the first multiply in round-to-odd, then doing
> +     * the second multiply as fused multiply-add, and rounding to
> +     * float32 all in one step.
> +     */

I guess if we find we're not producing quite bit-accurate results
we can come back and revisit this :-)

> +    t64 = float64_mul(e1r, e2r, s_odd);
> +    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
> +
> +    /* This conversion is exact, because we've already rounded. */
> +    t32 = float64_to_float32(t64, s_std);
> +
> +    /* The final accumulation step is not fused. */
> +    return float32_add(sum, t32, s_std);
> +}
> +
> +void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 15;
> +    uint16_t *pn = vpn, *pm = vpm;
> +    float_status fpst_odd, fpst_std = *(float_status *)vst;
> +
> +    set_default_nan_mode(true, &fpst_std);
> +    fpst_odd = fpst_std;
> +    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            void *vza_row = vza + tile_vslice_offset(row);
> +            uint32_t n = *(uint32_t *)(vzn + row);

More missing H macros.

> +
> +            n = f16mop_adj_pair(n, pa, neg);
> +
> +            for (col = 0; col < oprsz; ) {
> +                uint16_t pb = pm[H2(col >> 4)];
> +                do {
> +                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {

Wrong condition again?

> +                        uint32_t *a = vza_row + col;
> +                        uint32_t m = *(uint32_t *)(vzm + col);
> +
> +                        m = f16mop_adj_pair(m, pb, neg);
> +                        *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
> +
> +                        col += 4;
> +                        pb >>= 4;
> +                    }
> +                } while (col & 15);
> +            }
> +            row += 4;
> +            pa >>= 4;
> +        } while (row & 15);
> +    }
> +}

thanks
-- PMM
