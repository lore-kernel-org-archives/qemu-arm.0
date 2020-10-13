Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2302477lfa;
        Tue, 13 Oct 2020 13:41:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCjFhH5iQESw2zTWuMYtKWoUFlJbUgdkLpNQucbqDDoyChOdnMr1wUvHZyD9aZe50Y6YOF
X-Received: by 2002:a25:af90:: with SMTP id g16mr2404991ybh.259.1602621684180;
        Tue, 13 Oct 2020 13:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602621684; cv=none;
        d=google.com; s=arc-20160816;
        b=GZnGMo10gUlGKnub1Ro1n6nPB2eeJE3c6yM6MGOo6wiSkeBQ3BSZHQl34wmX9lZYiG
         keosY3QYMR7Tzly2bycLOMPWzHrZjIrJpv/+XMqXbSMIXi6J3MdjXtR3zotlm31j6ne7
         uqZwYtMmALkdyR4tWwkXfW7tefQKtap/NP1fecx1mlRrpd63z/BqgK90e/gsneQtj6as
         BPaUCP6AzUWH5/2D7h1QDQsxgvZkgViftTGUJpM/7Wfqt/iqvyZ06Eg6G1XLM4LUEzBF
         +yJ7CjePSNS3mLbhJjAr0GpJNdeU4ncsL59FX0elStJBsYlJg7Van60oAB8nN2pO5rEP
         ZN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l83+7C5w6SrBLDoIP7sfm4KiVqcNwbJfo79YId+KRcM=;
        b=JVY5gcdGKYGGYQIhUSp3v6wfNUTF+FPuTQAgK52yfalSEKiNWybb25svpNEXj/Rh1Z
         5YJRJyFiU9j+arDS5YEdb0M8Sa9fHTntS8En7nslwEKySfxv+4JNVn1Q3cw+g7XsgwNV
         hrpdcoJ9DL5X2nkYC3m0GRf22PcB/D+rYi35DdOebFQ3YNCHFdD/SaaIZnqxZMIKyH9s
         +sl0456lWbip7+dBQVQ1l1fUwNr3eDkOYR3FB2Rzs7FDjBdhoW3xUxnm2G0hqvEzHckT
         fVnBo2mVXQQXzz6ItQS+rAVO5w1hVFgtWdbGHgLGshivSZ88bYWI+h9718ATawtySlre
         2h3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ikyoT2Zh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d94si1147544ybi.469.2020.10.13.13.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 13:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ikyoT2Zh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSR6p-0000Pt-Fp
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 16:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSR4e-000765-2z
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 16:39:08 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSR4c-0001Ja-AC
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 16:39:07 -0400
Received: by mail-ed1-x543.google.com with SMTP id l24so845166edj.8
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l83+7C5w6SrBLDoIP7sfm4KiVqcNwbJfo79YId+KRcM=;
 b=ikyoT2ZhlT+JzMcAyoVfSTQE3Otcvg+lYn3hQS+C/OeEW9dRi0pEoP/i1OWcryjgBY
 dFTcW3UjKmfujVgWpECsMNE2m6+gzbecOsC+mihsS8D68u42Gnx1m7/IlvOoIfzss9u5
 Sjf4rjqrel75LtbbNFBhU4lajnsWMYeO56LnTSdcBHE5Ulc0Aflv+0FQ94A9JEVW3J+o
 2PoNHZ3LncXVP4xCt4BixID0kQl3qoZEpvRYKxW/L1S7WqW9U/cVdW0UM+EwVShFio3M
 cniWp4oRwtx52f/TpDV5KEmVPCr9PnlBO75CXQ+nhUjgBgFmFFbXBaExjbGDEbEs6QMv
 67gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l83+7C5w6SrBLDoIP7sfm4KiVqcNwbJfo79YId+KRcM=;
 b=DyJRNOy3/rgIvY8qEEMA/bP2n39zWtu+BsUI/alj8GqWA2eQNnz5g233Q8mz76O6ro
 TzxaAYGjfCrAZxj1vH25Q5GTy88Fsq7Gs0YOIhoOJUF69zDam+xzz9ttR93UJ2fLSe26
 zKzPuCNZ72vK8fAn9aBZrQZh90OH6LIONLU7gutC0axM/bnVEozo/KnERv/L1g9RLvfr
 MfhvD73OANsezQHrfeJN+VmBJcqV06m4VUJeyiJ8OEooADgyecj0iBECMYAjlg8ZhDR6
 q7YLsILwbVPMxvhk0kwIPAVePP8Idwy/9a4E1HDX1D/JXS9PBf0WrUjZXpIXRXLZwmdO
 +bsw==
X-Gm-Message-State: AOAM533dm2sEJZZ51bu56Tjg05lUCGHMxNxlLvsg5b/kVzDNZpf99SCf
 M88Bd2V8T18bds3ZQkjAQQuqbCH4UcbN/oQ6kGflUg==
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr1608685edf.52.1602621544584; 
 Tue, 13 Oct 2020 13:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-10-peter.maydell@linaro.org>
 <dbba485a-b69e-9138-5db4-d146ceec3c3a@linaro.org>
In-Reply-To: <dbba485a-b69e-9138-5db4-d146ceec3c3a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 21:38:53 +0100
Message-ID: <CAFEAcA_v3f4meMrENphpXSHNz=dNBQDE0LA=_3DMjxvSKL6wnQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] target/arm: Implement FPSCR.LTPSIZE for M-profile
 LOB extension
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mWWwgvbcFUoz

On Tue, 13 Oct 2020 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I think these two sets of masking are confusing.
> Perhaps usefully rearranged as
>
>     if (!fp16) {
>         val &= ~fz16;
>     }
>     vfp_set_fpscr_to_host(env, val);
>
>     if (!m-profile) {
>         vec_len = extract32(val, 16, 3);
>         vec_stride = extract32(val, 20, 2);
>     }
>     val &= 0xf7c80000;
>     if (lob) {
>         val |= 4 << 16;
>     }
>     fpscr = val;

Yeah, probably cleaner.

The other thing I wondered about is whether we should
be setting vec_len/vec_stride for an A-profile CPU which
doesn't implement the short-vector extension (ie where
MVFR0.FPShVec is zero). But that gets a bit awkward: v8A
allows an implementation to make Stride and Len be RAZ,
but v7A didn't permit that and so I think we would need
to distinguish:
 * has short-vector support (eg Cortex-A9)
 * v8A, can implement FPSCR.{Stride,Len} as RAZ/WI
 * no short-vector support, Stride/Len can be written
   but the only effect is that some insns must UNDEF
   (eg Cortex-A7)

I think at the moment we currently provide short-vector
support for everything, which is wrong but wrong in
the direction that means more guest code runs...

thanks
-- PMM
