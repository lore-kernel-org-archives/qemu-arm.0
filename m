Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2278934lfc;
        Sat, 29 Aug 2020 06:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKWAf7h1tKe4JCAlfdritPlly11J8/INimfeXUv5zTxF1dl09sCLUJEoEZgu+aQ9X7yKrT
X-Received: by 2002:a25:bad1:: with SMTP id a17mr4517967ybk.387.1598709095309;
        Sat, 29 Aug 2020 06:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598709095; cv=none;
        d=google.com; s=arc-20160816;
        b=H1mM1wh0Da9pETuXxkV59pncsuiPPo6pPUv7T9u3o6b/6WBY7qCsrLKtF7quGkMSwJ
         Jc9WXBGi/haeMb73mtwA9hSjtt5JyU+Xs+oig6dZBOtaJ5j+9MfIaEK6Y6tPe4FJ/zww
         D4PRg0Pmhsv6LbxJZtcKF54+7PVJ9cdxdO8Ld6iEMt+wg+8WZAxPo1f1tPbgrSRQlCqT
         hAuiRtuFq1/8tfhQCrjttXMF7fOas8BXiCn2jIfMv6nnm1f8VHjN2Bg8iVahs8n10V63
         o2Y7UG6mM/b4ONUiM3d4DB56ZUnisWzaSFUVPDcHSuLCcHbP6rNsRXH//clsiqFkCkbR
         HxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KH9nr6joWT50Gqz1LjlhoH5FgAQwIqhLeZ95q8fYRM=;
        b=E9IlpjZBkyQohjrrko4gIVJa4/9xYbGgXDxhpJ06B6iS8J1Ovu6Pj1cGaZ5gHKp+a6
         msyx28nFlVFP53Pa6k1o974iVsbq/KkfQTJU2L6TjvHkrrZvNpGhrJHCA8QVjHDR4/wx
         fYvHbrmFHgzBh0zE4O0gV3gXSqfA6RbZZN6tnvTmAtDeSxU4w/TIFhaXS5YtpKzELNx5
         4EsGCbf8Rgjoe+MfNISjmafZcsz8hLhFEv1KxIBAHqEIWPiXeKOxErh3YtHdNM/rW6Dq
         zhAQNZ4u/wour0abZQX4r+lY8F0qfHiVQePSfQHtxQrBlGHf8DS4v7OIW7+bGFZo4+n5
         calw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L24Cjb2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si2203620ybh.280.2020.08.29.06.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Aug 2020 06:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L24Cjb2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kC1GY-0005ra-Oi
	for alex.bennee@linaro.org; Sat, 29 Aug 2020 09:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kC1GR-0005qR-He
 for qemu-arm@nongnu.org; Sat, 29 Aug 2020 09:51:27 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kC1GP-00037V-24
 for qemu-arm@nongnu.org; Sat, 29 Aug 2020 09:51:27 -0400
Received: by mail-ed1-x544.google.com with SMTP id u1so1590348edi.4
 for <qemu-arm@nongnu.org>; Sat, 29 Aug 2020 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KH9nr6joWT50Gqz1LjlhoH5FgAQwIqhLeZ95q8fYRM=;
 b=L24Cjb2dhWhZen6EmLvpzVFVaEBU8UitY2T4QuVyv88+8Zp9GW4Cv4RvUYhCuW4YKb
 R9uWfR9EnFSusK7uFtJT6MEkm/ciR/11MhWky+EigzHxXd4CyZhYdSodRpfELqge8tiF
 3fH/W8KMfqVfidkaQMRzpXfUIVkPTftfqmBpGkVDD1MlJBynafOeNKZNtuhMfXD9HayN
 F7CJFlKToUt3GXcdD4s4RFM1SydaiSfeT8DVyh4qXtDqZsAz8/k6P3bnneEJWm5+IcWJ
 ErQ0B0gwMzvS+SO/Ellcw/FATqMJgWH27cgVci1qhjXVYZRIzR9/I1EuVfm81uxoGR81
 60QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KH9nr6joWT50Gqz1LjlhoH5FgAQwIqhLeZ95q8fYRM=;
 b=Yw336s+rZYnc8w/D8No2fcgmjeioa3ACQJCHbD8i8LvkIjYg4FfQ715udx8Hmeo1Q7
 fi7C+BmtpwHPBgcnSNv7vOD50xytltSi0UCzGy6VlGxWa6oxvFIV8SHQE9eTa5L5bhqq
 QGI9bR0JwwmAByt+7UAzuv9ObKt3oD/OZEZULaWl8HjMMtxovUASW4aHrdkFJZFg91o3
 JJAHEBgXKXGcbSNQoUVkqbouATkgxVadmH/I3DITEb8i/8zqAPEHJuon04PTL4kxO4O5
 B8CxVZMzklhrVv1ZrHX1NmOyW7ajRyHJhUUsxcjKIWumHO1C644fx2u2u+xtAmZWz+TM
 +KFA==
X-Gm-Message-State: AOAM533121UA9gSslSbUlDDG8GruW1Ksg0GV0ui8UdDqftDgL0Zij6ZC
 Tvki+7gTI8PQs1iZxmQCqI6T8lAiyRU/Os5OGvfiJQ==
X-Received: by 2002:a50:f28b:: with SMTP id f11mr700070edm.44.1598709083473;
 Sat, 29 Aug 2020 06:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-44-peter.maydell@linaro.org>
 <a9995eb6-6cb6-f041-ea09-9104e9dc293e@linaro.org>
In-Reply-To: <a9995eb6-6cb6-f041-ea09-9104e9dc293e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Aug 2020 14:51:12 +0100
Message-ID: <CAFEAcA_w4t4XsDbkws3MgDVW-9V6pzCY09pNU++9WGvtCCma2Q@mail.gmail.com>
Subject: Re: [PATCH v2 43/45] target/arm/vec_helper: Add gvec fp indexed
 multiply-and-add operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g1EH9qX1Sn+T

On Sat, 29 Aug 2020 at 00:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/28/20 11:33 AM, Peter Maydell wrote:
> > +#define float16_nop(N, M, S) (M)
> > +#define float32_nop(N, M, S) (M)
> > +#define float64_nop(N, M, S) (M)
> >
> > +DO_FMUL_IDX(gvec_fmul_idx_h, nop, float16, H2)
> > +DO_FMUL_IDX(gvec_fmul_idx_s, nop, float32, H4)
> > +DO_FMUL_IDX(gvec_fmul_idx_d, nop, float64, )
> > +
> > +/*
> > + * Non-fused multiply-accumulate operations, for Neon. NB that unlike
> > + * the fused ops below they assume accumulate both from and into Vd.
> > + */
> > +DO_FMUL_IDX(gvec_fmla_nf_idx_h, add, float16, H2)
> > +DO_FMUL_IDX(gvec_fmla_nf_idx_s, add, float32, H4)
> > +DO_FMUL_IDX(gvec_fmls_nf_idx_h, sub, float16, H2)
> > +DO_FMUL_IDX(gvec_fmls_nf_idx_s, sub, float32, H4)
> > +
> > +#undef float16_nop
> > +#undef float32_nop
> > +#undef float64_nop
>
> This floatN_nop stuff is pretty ugly.
>
> Better to pass in either floatN_mul, or the floatN_muladd_nf helpers that you
> added earlier.  Although I guess you're missing float64_muladd_nf so far.

I thought about doing that, but the float*_muladd_nf functions
don't have the same signature as float*_mul -- they take
(dest, op1, op2, stat) and float*_mul only takes (op1, op2, stat) --
so it doesn't work. You'd have to construct a wrapper for
the mul function that took and ignored the dest argument,
or split out mul entirely into its own macro rather than
using DO_FMUL_IDX for mul and muladd. The nop macros seemed
the simplest.

thanks
-- PMM
