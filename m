Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp284351lft;
        Fri, 24 Jun 2022 05:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5UOU4YkxvNV3kpKIKmQmy5hQUj2WQfpoWmxDeGmqN7vnOGxGMBdZYMG3fpQSIjPHslBEI
X-Received: by 2002:ac8:590b:0:b0:305:35:9f6a with SMTP id 11-20020ac8590b000000b0030500359f6amr12212685qty.122.1656073939117;
        Fri, 24 Jun 2022 05:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656073939; cv=none;
        d=google.com; s=arc-20160816;
        b=CGvJUvmpIynPQS2Glz2tLeX2VCPeHrXP68k5L4SXDrylWGPk/1DjhvhkljW25ouRng
         XN8/p120JpERTSQ6JwpV+eGvbT4xBs0u9e+Nbzq/ehXK1lgEiC20Xtl1fEd08JPchkVO
         TLPkDQ/krRwPq687yDunM274KoM8yT154TLwqCLh+uCiSHvNy0itOFSiIk8SwASlrzM8
         QR6lVjGBSaJPxev1/gmymLat5eny7cWErlW+fiFtCqsY+73v1RhK7bwnpTjsklIkovkY
         yLEQj0vI7gk8S8+nYEkggn/uB0ICPrIuzaIyYMgJHyOlfr6Dxlc9ohAop/iMVd6WLcVm
         lEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A2zsBKlm84Kh8579BFURJASeL9cYA63ljvqLGC2kaLk=;
        b=oIdLr0+94q7s++N/o7/ePgRVclVfihQSQr0geb/1L6PB8UP2QWkvvsA+TCURwjeBdR
         orWC24jQi/7u7xEjYtIAzUlyOPtsStDssZOEvYLL25M5UxKnubd3aziGCW6gAYnJqeLi
         ex+tACx8YuDisUpWdjLQCynGQikDUDqFHGNLlU6X0LRAAKAaIwMRETD35+N7NAads6NJ
         QqS63WB60TLn8n2fGQrQckdAY+XfJE50NCet0rZDYVJ5iWiu6G9sSvGZa7VQI9OIjyX0
         NCqSlby4BeoVM6dsGztIIRuFgbsphyJWCaQeFSKOqWFZpVmqIXNVGVhcNJVntVwlWdkw
         hreA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJQNmPSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a05622a174800b00317c5b36792si1747952qtk.563.2022.06.24.05.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 05:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJQNmPSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4iTy-0006CV-Ks
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 08:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iTl-0006CD-Sd
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 08:32:05 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iTk-0000XO-5v
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 08:32:05 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-317741c86fdso23399297b3.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2zsBKlm84Kh8579BFURJASeL9cYA63ljvqLGC2kaLk=;
 b=VJQNmPSQs2oGlzftRyoYeEskz7FMXhCVvYlhFZg1T29dLcVU7qvJTXdXJHM3zx9VcF
 66UDyY/FfPmEu3NxQncV/Z9PyjNjIPQpCjI27l7OLx/ItzBjspdVQWk71lqtxfIEcyeX
 Z454J1Pwv3u/9vgIi4zwE/bO5oEQw9K3vbFKmQVqGXh+2SeqMsH4nx4Z8iCM2BRXfNSw
 rYKjgXH7d0ZaGeZs73QOF6xUKs7ncNGLUSZE9OLzvm9b2cucJeIqxgAadAgXcLzCT9n4
 Kn44hZ1tcIob8AXSawBbel14Ko5XdULJgtI676TQ0Npn6z2VUYvXptkRQAu0fmfk8jqU
 sdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2zsBKlm84Kh8579BFURJASeL9cYA63ljvqLGC2kaLk=;
 b=A8uk1ezEXdNslKb2YnhlkQheTRjmT0B3+CMxQj8DaFkDWBonK0WIh6dqdgDjAzU5s2
 QuRScqBCnRlWHA7H0PS2vozfpfmsUGJi0JluzmUCO6QzKX2uY10pKBk9l/x2MRH8KIhd
 1k25rRlVabG7ySAIKl2KhZPJ1TrtdqLyC4gKESdTZmNk8PsLQbvdY8c5i0TGFKri5fWL
 F8LpzjH0RzvD2gucYXqqNnjqJJ05qR9PEFjJGOQUipW65RKMZXzTWgm1g+LBTXcKo842
 FcR2+3FLOtFAeyfl9d2SlQQSIL0IUgnvya9V8epg9N5Rw3e3SNM2fNoakbqLpUDBdrPt
 Lbwg==
X-Gm-Message-State: AJIora//uZ/t2UkiQLwUYLDKE8aVj9opof259R1spI7BV5D9rvkmQKds
 2Xze/94H2yOCTKY/kKazZiGGkkDo7zC/GsQL0aAYSQ==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr16743999ywb.10.1656073922661; Fri, 24
 Jun 2022 05:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-31-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:31:24 +0100
Message-ID: <CAFEAcA-y99PmUdPbdrWSj=_vUy35tRRFOJgkG2Lyg1A_iK6qRQ@mail.gmail.com>
Subject: Re: [PATCH v3 30/51] target/arm: Implement FMOPA, FMOPS (non-widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: ixgcSDbaDuJs

On Mon, 20 Jun 2022 at 19:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 31;
> +    uint16_t *pn = vpn, *pm = vpm;
> +
> +    bool save_dn = get_default_nan_mode(vst);
> +    set_default_nan_mode(true, vst);
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            if (pa & 1) {
> +                void *vza_row = vza + row * sizeof(ARMVectorReg);
> +                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
> +
> +                for (col = 0; col < oprsz; ) {
> +                    uint16_t pb = pm[H2(col >> 4)];
> +                    do {
> +                        if (pb & 1) {
> +                            uint32_t *a = vza_row + col;
> +                            uint32_t *m = vzm + col;
> +                            *a = float32_muladd(n, *m, *a, 0, vst);
> +                        }
> +                        col += 4;
> +                        pb >>= 4;
> +                    } while (col & 15);
> +                }
> +            }
> +            row += 4;
> +            pa >>= 4;
> +        } while (row & 15);
> +    }

The code for the double version seems straightforward:
row counts from 0 up to the number of rows, and we
do something per row. Why is the single precision version
doing something with an unrolled loop here? It's confusing
that 'oprsz' in the two functions isn't the same thing --
in the double version we divide by the element size, but
here we don't.

> +
> +    set_default_nan_mode(save_dn, vst);
> +}
> +
> +void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
> +    uint64_t neg = (uint64_t)simd_data(desc) << 63;
> +    uint64_t *za = vza, *zn = vzn, *zm = vzm;
> +    uint8_t *pn = vpn, *pm = vpm;
> +
> +    bool save_dn = get_default_nan_mode(vst);
> +    set_default_nan_mode(true, vst);
> +
> +    for (row = 0; row < oprsz; ++row) {
> +        if (pn[H1(row)] & 1) {
> +            uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
> +            uint64_t n = zn[row] ^ neg;
> +
> +            for (col = 0; col < oprsz; ++col) {
> +                if (pm[H1(col)] & 1) {
> +                    uint64_t *a = &za_row[col];
> +                    *a = float64_muladd(n, zm[col], *a, 0, vst);
> +                }
> +            }
> +        }
> +    }
> +
> +    set_default_nan_mode(save_dn, vst);
> +}

The pseudocode says that we ignore floating point exceptions
(ie do not accumulate them in the FPSR) -- it passes fpexc == false
to FPMulAdd(). Don't we need to do something special to arrange
for that ?

thanks
-- PMM
