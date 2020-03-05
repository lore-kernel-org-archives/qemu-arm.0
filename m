Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2972192lfi;
        Thu, 5 Mar 2020 06:21:39 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsMtwSC3XD9f8ngym/PTyhOuCOf3uwEd5LNkm9OesYx96HNdRdvqwRIv/Fck9MHBAtpXEsT
X-Received: by 2002:ac8:76c1:: with SMTP id q1mr7659300qtr.66.1583418099765;
        Thu, 05 Mar 2020 06:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583418099; cv=none;
        d=google.com; s=arc-20160816;
        b=a0vfNUbKhAylL8B3qoTq1IskStfJgtWAk/sAIqUCYD0hRdlTxKZRREr11BHctQAixh
         q5ZB9APBGZ3F424Rj11XegsQz5OHjq97qFODaEVA96OlS4oODU2BstI65Eb8I3l7YqnA
         ag/KDp0ThSafmuLI9cNhSnOCZcvNSN03qaRwi/MAoj+k2wMxYJP+ziouohHtTOd+bflZ
         5Fw9upo/C2+Zxh4Wpwip/v+FhhDGQxOQxwmI4yA517Orn5GlZ46fzPuIsNwVoNDwYQbu
         qsnRuyW97BPbYEUUCFmVSNfhXWgP0PT/FGcr22fHaqVd8misC3Cqb91DXlU+GCgDYFNO
         7dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MmVNlVoG5+r9EgwrJZuwCWK7AZ0/9oroAwsFmb1pWHs=;
        b=J4rcd2C1NbMtpTFJv8O4aFQFUZXxUdtn000lALk621Os74IfTFIk3wUR6Y5Yb34LlR
         toCbNQpKgWp/zwUP2u/fzfDX+EHxgPXN+BB2CFp6bRt+N+NhvIJb0JZ9ec+qUy7fJjlJ
         Va5MRGTAsAcRC8zrE8CpPd7wvpDffZEjloX6IVCqjuSeDqDLlFMfc/VZ1IReWvsg437A
         0tu6L1MNdZQBoeyn5mtHQlpaIqKnWYxhtuicmFkQaF5dzqBAbMWSwuVHGISNJkORyZCr
         mQRVPgib5DhjVOGxjN1J7Kob9V1+8Mjx0YY3glviwe9XM0lddTpid8FuDxT5AmJpsr+d
         /sdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zGoyRrPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si3683692qtp.242.2020.03.05.06.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 06:21:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zGoyRrPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9rNb-0007rL-5T
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 09:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rNR-0007lZ-Cp
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:21:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rNQ-00020y-At
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:21:29 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44403)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9rNQ-0001zI-5u
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:21:28 -0500
Received: by mail-ot1-x341.google.com with SMTP id v22so5787618otq.11
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MmVNlVoG5+r9EgwrJZuwCWK7AZ0/9oroAwsFmb1pWHs=;
 b=zGoyRrPeSq5RPtJL+rqfrcS5WrsKke3+ZWZUS8L9Em8xhosmhEQ8a5DaUQMEJUDel8
 j1CB9h0wXh3pSw0QaDs4t37AFgwJFlDQeJvZzekp/6YdfJN9RkuYwIDlN09QIhRSoVTR
 YvPQD5mD+vuMNNJpK8oxR+XQvhohg4xzSg5REJ7JeGxGuQmEXUCpLMnuyBYiRyMK8+Mu
 2XiCpPpcaV0QuRLI5Vp1a+m2nFczApV5HBtcB7xsads42AqAbbhySqrzqOSqBYiZB4O9
 8ZchsHsdjfzFv9u9pzeGjmNvU5GIYEiFgOQYU7zRwkfMklS2/xmEJtA4CFlI852VYc56
 je9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MmVNlVoG5+r9EgwrJZuwCWK7AZ0/9oroAwsFmb1pWHs=;
 b=Dp+Z6O1gluMa03QCxWDgEv0mmupD9gVDprVXcLmtfX9yJ8l8Cj+5oi2gSvJmDqE8zE
 u5e1vjIjLYdLkUoAObLp+apM+Lv7wNh6lgy2+VzgPnJoB+Pr/0zwpaU1zR1zzpnC80Q8
 0ymndkIwZK0eYEA4NMVVGO2G6JdGQMa4xahGdP+s9psm/MwQnMEFVU0plkahnGiFdtpT
 2qqnUEkyDfprBLWFYWihCnkNw0HVQQTKl0X5RdgJ+GMpxaM3YIqjZ72S/KTBYgp1+0bz
 +zmlrsq478Yewm8dKTtAdaHk2WnpdczUbURodAqBAfGkLs2RZdMts81BuPXUlsHVoVaP
 6IoA==
X-Gm-Message-State: ANhLgQ1DRmg2wOk7zIEPrhC7ORV4E7sDZkfTxkQ3BU4OTzfkbv3QkKUW
 xQ7hlaonnNpx/8RkoFH1ct+U1SATAiVBgUOcuco6hQ==
X-Received: by 2002:a05:6830:30ac:: with SMTP id
 g12mr5538264ots.221.1583418086899; 
 Thu, 05 Mar 2020 06:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-9-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 14:21:14 +0000
Message-ID: <CAFEAcA8vEHctFuYfaziQs1QobbrHJgMioATwF7QkWL-e=gLxJw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] target/arm: Check addresses for disabled regimes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-TUID: kRrx4NBq43GJ

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We fail to validate the upper bits of a virtual address on a
> translation disabled regime, as per AArch64.TranslateAddressS1Off.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index addbec91d8..0ef32d3c24 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11634,7 +11634,38 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>      /* Definitely a real MMU, not an MPU */
>
>      if (regime_translation_disabled(env, mmu_idx)) {
> -        /* MMU disabled. */
> +        /*
> +         * MMU disabled.  S1 addresses are still checked for bounds.
> +         * C.f. AArch64.TranslateAddressS1Off.
> +         */
> +        if (is_a64(env) && mmu_idx != ARMMMUIdx_Stage2) {

This looks weird -- why do we care about whether the current
EL is aarch64, rather than looking at the controlling EL
for the translation regime ?

thanks
-- PMM
