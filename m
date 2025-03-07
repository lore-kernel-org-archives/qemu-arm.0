Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2353137njm;
        Fri, 7 Mar 2025 09:48:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUN2v1fnZyYdIHhhL7p7Yee1vnoMGzTeAbc6SyZKbVUt/UqKp7TWc2Jbe9DxN1JaQl0v/fcAUoMfZ3vhA==@linaro.org
X-Google-Smtp-Source: AGHT+IGYbCaRgf2ebhcKt/Fhky5Dy3qYxckOW1pwlAstUvPpD/kmMzZ0nyyM0KwZOBCenMyC43bs
X-Received: by 2002:ac8:5dd2:0:b0:471:f185:cdcf with SMTP id d75a77b69052e-47618af3525mr50481691cf.51.1741369700040;
        Fri, 07 Mar 2025 09:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741369700; cv=none;
        d=google.com; s=arc-20240605;
        b=GAHZZ47bxuzWQjZCRSHvYuXgWYqWLeQKjxPBvipJcF1lRlPCE9ZIMI97Ah2TrBbcOX
         klKUN78Ic0OlKYXygZqkhzhAaGp+PfKDF4xh3iR7fw26sew3+XOVCBeTwISz5VJk3BfK
         V2SGsv/bTyaXqDYN3Q8O4NeVZzCOYax0k+0TPpBRhsaenbRwWwh09y0RO41VrfyiONS8
         Zbxps1onZMs7V2GSDBCcM0ttDTQ1bi+EvXqZBzwwoqo2CRH1cNbF2USseoXfI10xsJ7D
         RE3N67XqbjWNa/glSu+pXXFBcWFPN/vVXD/tf/b468BgZNOVl91j9zELf4L/JMmBskg4
         vKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=feL4R4ZJXF6MyVjUyjqzY2Z+HJ2fBwu7I/n7r1qbgbM=;
        fh=bBBzmEIxYIwKNOgGnvm425OmYTouOuWIWGa+ZodkVQc=;
        b=SLoUcLaWJXKH34aoxWTZYsy9qinD+M/5eH8SsQK4Uhpu2sl+/wwevHqebswEw/aqGe
         NqVgVWN79jtMNPMDAOfJkM1YWj+Q8L4vK4W9fmTqC6yew4UIyFQsKUK5k+TLahrXrWUT
         FyByewqI8Wc8kuih9Y1N2yzOqPsztAEkqkvN1Ddhy9uUBFclBjKF2TYhmmdw+KsraNPK
         oIjzAkaZt85SbHxO9VTc/B1cTAEGVaP2x7eK5Mx/HVl/LkoMP5MiFNhyNh/Ik1v9tbtB
         iGX6tqCfjpPOHwGqcgLUs8EsAiI+YY3ahTszBW+78dzxTKE5hh4jlCB1rPr4YnmcqOE3
         I74Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2jOQrzhz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d985a44si37141771cf.56.2025.03.07.09.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 09:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2jOQrzhz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqbnS-0004YQ-9N; Fri, 07 Mar 2025 12:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1tqbnQ-0004Y2-Kh
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 12:47:40 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1tqbnO-0007gF-Lq
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 12:47:40 -0500
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-474e1b8c935so5281cf.0
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741369657; x=1741974457; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feL4R4ZJXF6MyVjUyjqzY2Z+HJ2fBwu7I/n7r1qbgbM=;
 b=2jOQrzhzPwcYbNMTAGRnZ4bAAZAIjvg+FnKVt3mp4oLccBxlXlfzN0Ht/7RdZqwF0b
 jQ31DFYgZc1RfOqTUnRIiGkafKW0htAhBrr929WHRDpP167PdU+eaSPqAFSp2pMov5wy
 ClL5zhv+YqVdF+VVQkqqD0Jq88jxDcXz/X00m6+/0ir8iz4FwOOipShVJsSQA0bvRrvA
 D+LaSEjurTRcOwJIDLBjhS2yG7AKdzcjmpSjNUvNkpgtoAbjEjpYeroZLHFJ9aRulePw
 7xr6brMO4ejxjbvr7zDoem0Mghq2RELpsHReUdsZhJxNoTlCYW04k938Pka5wJeQGLBH
 0wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741369657; x=1741974457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=feL4R4ZJXF6MyVjUyjqzY2Z+HJ2fBwu7I/n7r1qbgbM=;
 b=cPLbRueXIOIjmBPJe9Ty6inKH03Ab73Kbk8P1iVha0ODcqugotJmVZQZmuGzX2WzSA
 HQAgoiEC6U1V2vtfuXG6FCQhMqW3dR0sKQj6lAGtqiWdmIh4fGhBhmne7R/NH27sDwuF
 wxStGoo9c4+FIa++hhy8Z+XIUaa7k5xwXPzuV6/bEATT6JNOYigB+3Jeglq1OunT7X7B
 Z7xjT3nTrgb6fuovCUPIwK+W3E6akLAbMS+SgygGuJmjmijQXDAhkzeAKW0UdTRgQCnH
 BGdLsJLuQQTGJLQa3cp9NKR0ZgyKlVnHyhJiqCmDpz2gbq4iQBg2w6J779rtacVeolbw
 K2Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKcydI+9UzhZGT7PyfMz7X8X31YNuZXQbfhamE+yX6eSKUV9W8LhaxSL5IbLkcdj4UMOt/ejw0dg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/2uoKZa6WTb14dybE2dtu6EWH5sVcy6rN5lcrJTTvRBkbWtBV
 3Mq6qNjhMIkRoTuIvvZPjX4wNCRs9zb8YBMo4k11QGPdUt6vG5kr6kUaiMtKqrJGpC3ytsydHkx
 JevEaZM2wZPTF6nek+svXzhdBFJO41dg+sEm2zOzTnoDMdrZnv66HxvXZ8w==
X-Gm-Gg: ASbGncs2TbmrlXXzh0FyCjnEjCWyrKtEvJ5Ub4wT1REqA/h+pD7TPZ7u0Up89VcS842
 9IGyv5hhi/mdLqwHFeKkLtt4iyxjzC9eMNevc0wIHImdhEfZecxLQU0CDgXTKPexGHpl89d/vA7
 sWMYv4Owzor6MeWKvtztMNKUAdtiJkCBg/QOpAa8H1cZXAU5RXMc8P9g==
X-Received: by 2002:a05:622a:1894:b0:474:fb73:6988 with SMTP id
 d75a77b69052e-4765ddb1ed8mr1478191cf.24.1741369657309; Fri, 07 Mar 2025
 09:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
 <3485cd84-2aab-45e7-a72c-ca1d85e007ec@kaod.org>
In-Reply-To: <3485cd84-2aab-45e7-a72c-ca1d85e007ec@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Fri, 7 Mar 2025 09:47:26 -0800
X-Gm-Features: AQ5f1JoblDUizINNZLSUGnYrySK2OuouiegF02eg93wjuonbRuAGBeOHodrgb-o
Message-ID: <CA+QoejWqZvhr6XWNxGGEJD8JEbeeRWf61dPDPY3ofzf_2z3cHg@mail.gmail.com>
Subject: Re: [PATCH v6 00/29] Support AST2700 A1
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YkGmmrf4jvT1

It already got applied, so idk how worthwhile it is, but for
what it's worth: I was just able to test this whole patchset with our
custom A1 machine + custom A1 image!

I'll keep an eye out on future AST27x0 patches that we can help test
so I can test them earlier in the revision process.

Thank you for the development Jamin, and thank you for helping review this
C=C3=A8dric!

- Nabih

On Thu, Mar 6, 2025 at 11:35=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 3/7/25 04:59, Jamin Lin wrote:
> > v1:
> >   1. Refactor INTC model to support both INTC0 and INTC1.
> >   2. Support AST2700 A1.
> >   3. Create ast2700a0-evb machine.
> >
> > v2:
> >    To streamline the review process, split the following patch series i=
nto
> >    three parts.
> >    https://patchwork.kernel.org/project/qemu-devel/cover/20250121070424=
.2465942-1-jamin_lin@aspeedtech.com/
> >    This patch series focuses on cleaning up the INTC model to
> >    facilitate future support for the INTC_IO model.
> >
> > v3:
> >   1. Update and add functional test for AST2700
> >   2. Add AST2700 INTC design guidance and its block diagram.
> >   3. Retaining the INTC naming and introducing a new INTCIO model to su=
pport the AST2700 A1.
> >   4. Create ast2700a1-evb machine and rename ast2700a0-evb machine
> >   5. Fix silicon revision issue and support AST2700 A1.
> >
> > v4:
> >   1. rework functional test for AST2700
> >   2. the initial machine "ast2700-evb" is aliased to "ast2700a0-evb.
> >   3. intc: Reduce regs array size by adding a register sub-region
> >   4. intc: split patch for Support setting different register sizes
> >   5. update ast2700a1-evb machine parent to TYPE_ASPEED_MACHINE
> >
> > v5:
> >   1. Rename status_addr and addr to status_reg and reg for clarity
> >   2. Introduce dynamic allocation for regs array
> >   3. Sort the memmap table by mapping address
> >   4. ast27x0.c split patch for Support two levels of INTC controllers f=
or AST2700 A1
> >   5. tests/functional/aspped split patch for Introduce start_ast2700_te=
st API
> >   6. keep variable naming for reviewer suggestion.
> >   7. Add reviewer suggestion and split patch to make more readable.
> >
> > v6:
> >    1. rename reg_size to nr_regs
> >    2. Fix clean regs size
> >    3. replace g_malloc with g_new
> >
> > With the patch applied, QEMU now supports two machines for running AST2=
700 SoCs:
> > ast2700a0-evb: Designed for AST2700 A0
> > ast2700a1-evb: Designed for AST2700 A1
> >
> > Test information
> > 1. QEMU version: https://github.com/qemu/qemu/commit/50d38b8921837827ea=
397d4b20c8bc5efe186e53
> > 2. ASPEED SDK v09.05 pre-built image
> >     https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.05
> >     ast2700-default-obmc.tar.gz (AST2700 A1)
> >     https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/=
ast2700-default-obmc.tar.gz
> >     ast2700-a0-default-obmc.tar.gz (AST2700 A0)
> >     https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/=
ast2700-a0-default-obmc.tar.gz
> >
> > This patch series depends on the following patch series:
> > https://patchwork.kernel.org/project/qemu-devel/cover/20250304064710.21=
28993-1-jamin_lin@aspeedtech.com/
> > https://patchwork.kernel.org/project/qemu-devel/cover/20250225075622.30=
5515-1-jamin_lin@aspeedtech.com/
> >
> > Jamin Lin (29):
> >    hw/intc/aspeed: Support setting different memory size
> >    hw/intc/aspeed: Rename status_addr and addr to status_reg and reg fo=
r
> >      clarity
> >    hw/intc/aspeed: Introduce dynamic allocation for regs array
> >    hw/intc/aspeed: Support setting different register size
> >    hw/intc/aspeed: Reduce regs array size by adding a register sub-regi=
on
> >    hw/intc/aspeed: Introduce helper functions for enable and status
> >      registers
> >    hw/intc/aspeed: Add object type name to trace events for better
> >      debugging
> >    hw/arm/aspeed: Rename IRQ table and machine name for AST2700 A0
> >    hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
> >    hw/intc/aspeed: Support different memory region ops
> >    hw/intc/aspeed: Rename num_ints to num_inpins for clarity
> >    hw/intc/aspeed: Add support for multiple output pins in INTC
> >    hw/intc/aspeed: Refactor INTC to support separate input and output p=
in
> >      indices
> >    hw/intc/aspeed: Introduce AspeedINTCIRQ structure to save the irq
> >      index and register address
> >    hw/intc/aspeed: Introduce IRQ handler function to reduce code
> >      duplication
> >    hw/intc/aspeed: Add Support for Multi-Output IRQ Handling
> >    hw/intc/aspeed: Add Support for AST2700 INTCIO Controller
> >    hw/misc/aspeed_scu: Add Support for AST2700/AST2750 A1 Silicon
> >      Revisions
> >    hw/arm/aspeed_ast27x0.c Support AST2700 A1 GIC Interrupt Mapping
> >    hw/arm/aspeed_ast27x0: Define an Array of AspeedINTCState with Two
> >      Instances
> >    hw/arm/aspeed_ast27x0: Support two levels of INTC controllers for
> >      AST2700 A1
> >    hw/arm/aspeed_ast27x0: Add SoC Support for AST2700 A1
> >    hw/arm/aspeed: Add Machine Support for AST2700 A1
> >    hw/arm/aspeed_ast27x0: Sort the memmap table by mapping address
> >    tests/functional/aspeed: Introduce start_ast2700_test API
> >    tests/functional/aspeed: Update temperature hwmon path
> >    tests/functional/aspeed: Update test ASPEED SDK v09.05
> >    tests/functional/aspeed: Add test case for AST2700 A1
> >    docs/specs: Add aspeed-intc
> >
> >   docs/specs/aspeed-intc.rst              | 136 +++++
> >   docs/specs/index.rst                    |   1 +
> >   include/hw/arm/aspeed_soc.h             |   3 +-
> >   include/hw/intc/aspeed_intc.h           |  36 +-
> >   include/hw/misc/aspeed_scu.h            |   2 +
> >   hw/arm/aspeed.c                         |  33 +-
> >   hw/arm/aspeed_ast27x0.c                 | 329 ++++++++----
> >   hw/intc/aspeed_intc.c                   | 667 ++++++++++++++++++-----=
-
> >   hw/misc/aspeed_scu.c                    |   2 +
> >   hw/intc/trace-events                    |  25 +-
> >   tests/functional/test_aarch64_aspeed.py |  47 +-
> >   11 files changed, 978 insertions(+), 303 deletions(-)
> >   create mode 100644 docs/specs/aspeed-intc.rst
> >
>
> Applied to aspeed-next.
>
> Thanks,
>
> C.
>
>
>
