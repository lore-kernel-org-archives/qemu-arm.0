Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1858337ejy;
        Tue, 20 Sep 2022 08:22:25 -0700 (PDT)
X-Received: by 2002:a17:906:8477:b0:77d:185a:b443 with SMTP id hx23-20020a170906847700b0077d185ab443mr17046978ejc.311.1663687345517;
        Tue, 20 Sep 2022 08:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663687345; cv=none;
        d=google.com; s=arc-20160816;
        b=sR7ku4qmNOpAkvz6lYqrzSz4l1dThtsC9jSQK9PgFr158XpQ00si+9VATMyvXMVpfw
         Vh3W4md3RHs3Nh9NlYMX0lnhJpMPTohKatH89yopMh+iEjr6DF3yRdLW9GHBXKJ7iBAg
         ZSYHwhR5VWqw/dr/Ll1Mm5IyLrHxeQaMj9tIXb9Gl1oFUm7EKnaFEBW6PJUduv5fRCo1
         bkK/+u1z0/AsNN2lNu/wIOneJIc5NOF8uRM/TcaL7Po4nRehQaKmm1aF7tBOBGZ8YtEq
         pzb79ix13RHTzTOo0qV8Mok7lAKd7tErYCqDBIqR3+G9hlXzyrWeXO0eNX2bnkrW3N6R
         m1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=URVMmKnCA0+G97ZAMzwPJmH66Bscm1vweKnh139K8WI=;
        b=oiVB4BgLFgzkTZSx9XN1xNTmDbg7TbGCaZW1E7XEMcuSzVo/jbpAtatbpC/Iu89lqC
         VaMh4WUEE5lF8t0sf+She66GeFt+4upqXf2TKu3htNNQBJdNyQd4Kl5mbtFthMcIGtMQ
         EEIJn+BFiYQyVsT/kdrpd3MRqq+qP+Ge13OacdYPxMQTj2pxlrcSIL1wk9TwoUuq41Fu
         KzLugejAMXqTIj3o7eSaZMYIXjgC1EbxDgk9zHsAT1z/nEss7rS2TgjVRsopsjYsdBLU
         /3ZgMcqCkBmPyFNgZq1QxJZISWOWWYQpHYnMq8eAtJ4rGLcfDBiIhRv+4rCbkFcd83AQ
         dYMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fFujuAEc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gs21-20020a170906f19500b00722f38adefasor76174ejb.6.2022.09.20.08.22.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 08:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fFujuAEc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=URVMmKnCA0+G97ZAMzwPJmH66Bscm1vweKnh139K8WI=;
        b=fFujuAEc6KbE5DjRcUenWMBELLEfH1YF2T+SjFuu5p6YbKJJDv9c60ih9AjtW9kRm4
         Et376KPU7pYJ0Psta8sr2+gAus0nFxHPNXmGzTBVcAlJi9GdIRRoUtkraL5dBrc2Flrl
         BtLBqcEQqr2zt9d2dE3GGagqH0KBBUo1R1Wv5KSeZ/Xw9xoEPNyYjegUmdzlxbQgYd/A
         aliSp4KZqvvhxEkaq+dmUGz2vyqPctexuehvEMc8v0g46XnQxbtYfSuTQUM0hnWZcfdE
         vSXzRAjFlIzW8IPtMvtt+y39epBq+9uZDKj9RRZwAflC2hg/otPpPDw/uGBJWz7FUKYQ
         Q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=URVMmKnCA0+G97ZAMzwPJmH66Bscm1vweKnh139K8WI=;
        b=b1K77YL+RBzgBkD1vILVUKM6kQi6eMd3KFgBN0I432/PUSU+l6y3+iOoIqE/faL9zm
         BW3Hx5MvNrgBB39JdTZTDbHRCJyoF7TQCPYLt1ykVZ1imDaMU13Z+hsMfTsT51vp9+3L
         ql+5V5bOhxAa0xgoCcRGRf/c6td9MjMDaoZEqJra3gRWN6XaysW16YSq3msLH+ilL4+c
         T+kdlMpEafVlVJ19SplcWKhLKNJRZsKzeIAP0wW001eyGD96bpMRBHjwSczeiAddkxE1
         hO6maWQpaTRg5q0ZZNf6sguOfwFJtoD/hVo05Qwwb/2M+o3ep50lIt2YWje6UHDh5M6t
         rWvg==
X-Gm-Message-State: ACrzQf1Sf331e7/WCryphC+HabDHENhUdTy7qhMvwrfyByNGY/3E4J+Q
	P69ovbWrcdWXnAwrmhPzDGstFy6elWaD2X+tO8ZuPWsW
X-Google-Smtp-Source: AMsMyM4M/UGHtoZDvKqLXibBQSuDgvrlY3xBBuQtesyAbGXkP01p1lOKJKGcK75LN10MgvuMO9d4ED77aWo+0nL1NL4=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr15394325ejc.365.1663687345323; Tue, 20
 Sep 2022 08:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-23-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:22:13 +0100
Message-ID: <CAFEAcA9xXUpO4ZZ0WGWySZLN4hi1fpdPmktagXkdrgOHqmR84A@mail.gmail.com>
Subject: Re: [PATCH v2 22/66] target/arm: Add is_secure parameter to v7m_read_half_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vH+9x+yMohhd

On Mon, 22 Aug 2022 at 17:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from v7m_read_half_insn, using
> the new parameter instead.
>
> As it happens, both callers pass true, propagated from the argument
> to arm_v7m_mmu_idx_for_secstate which created the mmu_idx argument,
> but that is a detail of v7m_handle_execute_nsc we need not expose
> to the callee.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
