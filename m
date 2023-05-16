Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp430130ejq;
        Tue, 16 May 2023 06:56:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fWwg+VfRt4N6rEki92bjVvKxXcwFLyUiQfxoYIaJDIkElKY74Gk/AeyezSOTHxd51kHaG
X-Received: by 2002:a05:6214:d8c:b0:623:82ae:8a63 with SMTP id e12-20020a0562140d8c00b0062382ae8a63mr1129721qve.30.1684245419178;
        Tue, 16 May 2023 06:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684245419; cv=none;
        d=google.com; s=arc-20160816;
        b=rjte+pHbqWGGGtx9iZ8oVZC8nbpkdUBDt0W+GOqzQBa+77YxIFQ8ygavGcnUdjqHNI
         NzuG+YlHfoE+MXbnrSJ+AO+L6nwPU3xsQmMGahfk1QuPsE28N9/630L1qZenQxnehWwg
         pSihSBeAMXR9hxW/oTmmoXP39QojCvztK8FidXZBc+iHsBoKbfIIjFT7az2IX7nfAeHm
         jeoC6IJUIcivS8CrVltsyBXdDCyXCVaHdFDPiUBZSNl9D09zLnhxyyasMBPdJilGfk52
         QSclI/ZZ+Zgwmk1lmuU4S7WF6iIxcFOz9Hd2aJYbC4tcqLFxmMmJ1eFpNaJzyGvSCsjJ
         Cd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M82qPfc37cflgM9Qrg8K8cFf1191N58/L9fMjQxmpko=;
        b=M/cT+Jc8mOktthaGwPaOy9H/U3Jg666Th2mh7UDz+sn7bXnJl/qZEohJ5kBbQ1RVp+
         rjH2cYXdp2mx7pi6ZI8F67PU+f0oCRTERI6DPAIbwwhjZcrV3GjWehg7+VUfAGXb8scM
         XGjCycsO5CPbr/VAzDyO+sq/6Fstxo3uvWBR/TRuQp83bJUKsS3sMTzB/2xgNzbv9bm2
         PV+JpFK1QmOYfu9y3IC2sZfqc5TYiR9KyynTbbGH1SrboCZ4gC69r4+Lg7559UXMZRrD
         TQEYwMBBbXd5a5+VeiKr6nCRgZvKxTyR0ibWK3pj1nSkeVD/Ynpoe3i3Wpi/4B3vs7Ka
         xWkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pT61ZwKv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv4-20020a056214262400b005f166fc7a7esi11692195qvb.471.2023.05.16.06.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pT61ZwKv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyvAU-0008J3-W1; Tue, 16 May 2023 09:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyvAT-0008FQ-7t
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:56:45 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyvAR-0005qy-DC
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:56:44 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-510a59ead3fso449854a12.2
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684245402; x=1686837402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M82qPfc37cflgM9Qrg8K8cFf1191N58/L9fMjQxmpko=;
 b=pT61ZwKv5zKxm6QmFuJjBD2g9qkmhNT5cLhUcLMtCAL4QhODV2TS5t1YKkYh9ZXw8X
 oYvLFsTJnS52sHjFgwWwZlQmKNu4I56gZV+9ewdzipU5tUzKw/Amt93T6TQHzTd0QypN
 lHHiHNP58Vbak2P2ZXw+PU11R+fTsdJMcE7bSrlAyW9fIATgADq3bfA1wJ2cyjD29cRQ
 th7fKxthdAYVn31oLCeSo9IEfhyreA6qdJMlhKJ+KDMOL+YKmzGYVyGAc8iVzsijNrwg
 lL9LDkhAbsFUKdrDNQqhQhY+vuw/pFgWGMO3Ct7pTmBx6g8dLB2r9qKm13gSDlTQQegN
 h2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245402; x=1686837402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M82qPfc37cflgM9Qrg8K8cFf1191N58/L9fMjQxmpko=;
 b=HpPcvliScMI2mA8XDqp64iLYnkDJ5j8tQPY8UTz/aqJzKIv5BdnClwBC2eI+Ng4TYF
 swe9jYBjDf0nY5FLyLfbVm0dBNaasGlxPDRftGR7PNdN/9Ngf7gACM/dkUwVeSNqMTCl
 zt+KNEvcNqY+lmJFsIgzYTASxznSRLqM/F6nqSfMz4y8appsHecag7QJMHjUVkqI10vh
 x9iEOzrB35YYZ8+vLPeNSRaAjoKOBupoMBe2sOB3X472QN7OaGUjqkGJFF7Zbqa8UE68
 Sdg8QxyaCUbKrE7CBh1US1SEhpJ1V3Qg3E0f5uRJKWE7zIs6rQlav7G0eIYKzjgfBDr/
 5myA==
X-Gm-Message-State: AC+VfDxagXdpnTJOS00gVBQw/SxTFZ2jYPIiLFh53djwwriX7kXZ3srb
 zcl/LIYLFaEvIadmuinBbt06mfErOow9CZyAl3pWxw==
X-Received: by 2002:aa7:dad1:0:b0:510:5155:444 with SMTP id
 x17-20020aa7dad1000000b0051051550444mr5859644eds.31.1684245401706; Tue, 16
 May 2023 06:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-12-richard.henderson@linaro.org>
 <CAFEAcA-En1=iy_M7o0Ky+5ZwOJ4TWxoNz7Yq27ftYgnbV9j8OA@mail.gmail.com>
 <0e0a1d89-8d7f-5ad7-f920-b361a19c8ef9@linaro.org>
In-Reply-To: <0e0a1d89-8d7f-5ad7-f920-b361a19c8ef9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 14:56:30 +0100
Message-ID: <CAFEAcA-endaUPopDahNVGbe91=OfK0HPzKtsLBgpuScKAPc_og@mail.gmail.com>
Subject: Re: [PATCH v5 11/54] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VBXC0pnHnfAB

On Tue, 16 May 2023 at 14:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/16/23 06:29, Peter Maydell wrote:
> > On Mon, 15 May 2023 at 15:38, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We have code in atomic128.h noting that through GCC 8, there
> >> was no support for atomic operations on __uint128.  This has
> >> been fixed in GCC 10.  But we can still improve over any
> >> basic compare-and-swap loop using the ldxp/stxp instructions.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
> >>   1 file changed, 57 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
> >> index 69c1c61997..c3b2b35823 100644
> >> --- a/accel/tcg/ldst_atomicity.c.inc
> >> +++ b/accel/tcg/ldst_atomicity.c.inc
> >> @@ -263,7 +263,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
> >>        * In system mode all guest pages are writable, and for user-only
> >>        * we have just checked writability.  Try cmpxchg.
> >>        */
> >> -#if defined(CONFIG_CMPXCHG128)
> >> +#if defined(__aarch64__)
> >> +    /* We can do better than cmpxchg for AArch64.  */
> >> +    {
> >> +        uint64_t l, h;
> >> +        uint32_t fail;
> >> +
> >> +        /* The load must be paired with the store to guarantee not tearing. */
> >> +        asm("0: ldxp %0, %1, %3\n\t"
> >> +            "stxp %w2, %0, %1, %3\n\t"
> >> +            "cbnz %w2, 0b"
> >> +            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
> >> +
> >> +        qemu_build_assert(!HOST_BIG_ENDIAN);
> >> +        return int128_make128(l, h);
> >> +    }
> >
> > The compiler (well, clang 11, anyway) seems able to generate equivalent
> > code to this inline asm:
>
> See above, where GCC 8 can do nothing, and that is still a supported compiler.

Yeah, but it'll work fine even without the explicit inline
asm, right? It just might generate slightly worse code.
Is the performance difference critical enough to justify
an inline asm implementation that's only needed for older
compilers ?

thanks
-- PMM
