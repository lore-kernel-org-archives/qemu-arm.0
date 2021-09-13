Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3728117lfb;
        Mon, 13 Sep 2021 07:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF5dwpZl9G4kqwhzVsVBZGQBAeFkwW45MkD3+ENHSm/0FP9BzHgKHTVs7jCL6yfxnhpHnr
X-Received: by 2002:a05:600c:1550:: with SMTP id f16mr11760351wmg.111.1631543363149;
        Mon, 13 Sep 2021 07:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631543363; cv=none;
        d=google.com; s=arc-20160816;
        b=GBYqR2pbwoyfIE59mgAEENIHQZNXw4ghHniB0i1U3XH+yI/DJFL9Du8zmJZk3ZuGCX
         q1TD+60lBUMtT1iE7Ank4RvkHNSMHrAMviWUAdYMlWNW7tz8hXkHfd2Ek+91SkfRx+wf
         9wYoihv0fhsNf/2vZ6iT4gs87ukRBDDReCiX8vz8aruNDg9mipz0vIQhJovBDoABazSz
         sSbcfqNJYqjPukDxMz9rrR9i93gB1N95nL6Eckh4++iCp3anTJ85yn8/OXarCda3LkOo
         eNJeul++byZ7geYFARST3Kh1LF3/50i6s8xq71XJ/1MyP+t3ydljCaK89Fpr3RWT+415
         qd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=35uQoY4Q4y9EDz8ZvvpU8PTgWIzZndf4tiLrgn2j7u0=;
        b=KYyK1Xq8q48pKom2NGf2Iwpx+U1p2E0dazRgB1uzYJlOz4VlmWFgkwCpY7lRXPMCCR
         Tr1WinYk5ejSaWD1b9fNlsvXKFsr0qippWKYn5aUy4dLL7j9ILZdJ5uXjBgzDme9cPI8
         4Rxn6kHD9OTIHzsyD5Fn4XftpJ792aEAX0Y29fWvAwXNwQeQCOtg+cn2LiVPHl5gwvZq
         T5iADPw9ryZx0St1FnD4fYW7H07n7GAv79NPSGWoMGYVtsjqhXZ9gXYvf3qgxCXIYk+C
         RNMdQRjYtiDGopQ/cqI09dB9kRXJotYoTJKCn3Z09lSdeUXKtMAsKKPx4Xdtt9yS1qbt
         Y/Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GNS/8mKS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si8532472wrg.454.2021.09.13.07.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GNS/8mKS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmxW-0003qf-Ac
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmr0-0000Bh-Fb
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 10:22:39 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmqx-00066o-R3
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 10:22:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 140so3380299wma.0
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35uQoY4Q4y9EDz8ZvvpU8PTgWIzZndf4tiLrgn2j7u0=;
 b=GNS/8mKSPvabsksf6/5dBY1tRPtODceSEGsQYwa+YJEnWdqbymnA6ljeqs8loQjbGS
 3yuRWBaA9e4QIDCnldzeyTq0GfPxDfpy+FCzC49Ed08dkXujyAoYgcdVuiIM7hk0mvCK
 p++EDq5LihVRwUoFFBv6vtJiv3TisgpVaRdt0UZWQylUQKT66d2RKxS0RgHyj7l3El8+
 weJQ9+8aUZ4rpuzftmJ2A3FRosJNr66GzclwdYsn6HlHHm8OXJmmOrYF7GOGx2HvVDuB
 w1KurvYdTG5fICCz71cs75xlxvNlh3CUV5RqKywEtD12njFInI7Ituds3aql0AZO1EpJ
 rLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35uQoY4Q4y9EDz8ZvvpU8PTgWIzZndf4tiLrgn2j7u0=;
 b=NpuPDIVAubn/EzRwqzA+YtYXcisYulDMOLTO9mzzKjUu3mNO3C2rSaWcjJSZWDON76
 ibmWnX/Yk/XuiG+Troawu8dgqJcPx5CSTj0C5GRisNdDetpufQiRHb8HWqO7mm91pMbF
 8k3pZP4PtjmWuygBf5Y+pjXGgJZmjJbQY/YOunruZKyO7hnYHoG5oMuwJDPZf9xJG1SL
 lUISTOGrE3p+IxprOLX9Jz9zx3U2X/5QHufuU8wAktFXx7tJzgl4lQC3YbWFYXlJbJsj
 XI4i22MeFho68zPqEEJyyldJ8ueZDelZ3uPsLn3mnPCExQExohfnBnCP2+6RGWnEBSe0
 KQ0g==
X-Gm-Message-State: AOAM530pkHe+0iWKGpke/TWezDPlthKTRsMAeHayH6u/9EPiwRdYnBAt
 wAK2HJGqxEyQy0bpBY04OOyz6TjHDcZvqaPlKZYWVw==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr11536164wmj.37.1631542954165; 
 Mon, 13 Sep 2021 07:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
In-Reply-To: <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:21:43 +0100
Message-ID: <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL,
 VSHR immediate forms
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjkRkYUjWAYN

On Mon, 13 Sept 2021 at 14:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/21 2:54 AM, Peter Maydell wrote:
> > +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
> > +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
> > +{
> > +    /*
> > +     * We get here with a negated shift count, and we must handle
> > +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
> > +     */
> > +    shift = -shift;
>
> You've already performed the negation in do_2shift_vec.

Here we are undoing the negation we did there, so as to get a
"positive means shift right" shift count back again, which is what
the instruction encoding has and what tcg_gen_gvic_shri() wants.

> > +    if (shift == (8 << vece)) {
> > +        shift--;
> > +    }
> > +    tcg_gen_gvec_sari(vece, dofs, aofs, shift, oprsz, maxsz);
> ...
> > +    if (shift == (8 << vece)) {
> > +        tcg_gen_gvec_dup_imm(vece, dofs, oprsz, maxsz, 0);
> > +    } else {
> > +        tcg_gen_gvec_shri(vece, dofs, aofs, shift, oprsz, maxsz);
> > +    }
>
>
> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.

I'm not convinced the resemblance is close enough to be worth the
effort...

-- PMM
