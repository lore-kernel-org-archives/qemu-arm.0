Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5680342lfm;
        Tue, 28 Apr 2020 08:55:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwBRgMVsFNZdWQV86C9xBzfzAmoQhlHxufDqMLllqpNTyE0z35KkLZBBMMf5XtkcQrymlt
X-Received: by 2002:ac8:41d2:: with SMTP id o18mr28981094qtm.162.1588089324976;
        Tue, 28 Apr 2020 08:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588089324; cv=none;
        d=google.com; s=arc-20160816;
        b=yTl4ZCokEXghdWmnv5htoq5uPbQlC/6+2z6dE46pzjJimrDWo4UtvsZrTBqspRBWrZ
         XF6iK3rUZjJSOqHTJ7xRkoWnAUSXGakb66mQeuMKaq5vt5P5Hrf16S0jwRPdTbZqodzF
         g1orRmncVrXqiSaYBBMOgsJZqz6Nxio2la9K/Ivdyj5JAuiPbB+jhWg5Z+TcjQ+36GK9
         dys3ZBw39D4/GYEQ6G72Hdb40KZjFV8qmvLn0t49sEKP0iRfixUFBIvQYPo9Iw2tPB4r
         jOKM14T1PpkW5lfqNf1v5/WKBp0pCS1z+46k3CkzorkFixYy7n7FUR5FwyyLyeKzj2wZ
         lCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=flpQKJYfY4iUD2dDeTZMCKPErH9CMN9MNsuZ9OMb6ic=;
        b=IcyGryAoyqUMKNzxOQySjMmyXOGabLYLSthxXmuR7qPJtGHBe+0yWuUb+OTJx1dMNi
         VC4V4IcATIToCl/Ay4KBoSb46xqzWjrNKwb2mbouO4wQ0w4anL1fNqPyiPXtj7udHm5e
         8zV5k4p93GscUz6yPiF6s9iV8HBoKeuPW7Fdpy6HjfurJCAdxUJvIL52ezMlXnXLazOT
         H6PHBf+1wt7ErwgP6Udls6pWAMTLkanND4QMCzSNGefXWvzsNiem6Mu0nTyWY3+fDoD5
         rJGEfkCgxdkTZQDtepd6OMQHp1hrO1ll0mItiICRGbSUrLXqA+kLTQ6N4JToeHyP/lYh
         6mdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UqOmYo2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si10835262qtk.213.2020.04.28.08.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 08:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UqOmYo2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTSZw-0002eV-8z
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 11:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jTSZK-0001uj-Jo
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 11:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jTSZD-0001gR-6p
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 11:54:46 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jTSZC-0001fc-Fy
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 11:54:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id m18so33398558otq.9
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2020 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=flpQKJYfY4iUD2dDeTZMCKPErH9CMN9MNsuZ9OMb6ic=;
 b=UqOmYo2+0RAeM7+neaQXKlhMZE1vovZbhjhE5GIxwZdy0ypYSbUydQTfnwe/B2ipPT
 Y3k/+oSGW0KFZUh/Wdo96lTNtiB2K8030d9Pr3XTePDYJaxm3IFk7aBQq5ZR801U+OPL
 uM0ai3yz1TzI292GjmWDWA575ZCd2PT45dQqN59N+YV5dKsdN2//+5R6ltrwX5dq0ApK
 MtxVIt2ncYQFb3+LP/RmTIEaSAzOl7HnwAG70x+pIHrELZKL1lg1rQO6GVyLmIzozb1O
 +PeI3bVhLGkNbHrvNZbiGI/BOcOjcULP3mfBN88Kckaps487adUGzIqmeOBXKZV8z+C4
 pEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=flpQKJYfY4iUD2dDeTZMCKPErH9CMN9MNsuZ9OMb6ic=;
 b=lHpk0AIQ0cR0Lpd8xdZRMSEB6EsORf8SnQFUsTfmC8TfPwOjvO0zxHb1aoiQlxjGrw
 qPGBLf07VYOChHUOJheu8dg8Q7Jz/r8N6FxI9pyKfcP6d1U+HSB/3+rMG79hfVQSziz/
 dTiHRcyfYIEvxWpRlJxX/osgYgV17cIkUtZtoqq2+XmmiYLkFQebHzKVc4HrFl6+/kc6
 8jSJyZkBiWcP05dHPgo3mMQ9YlAwddM5j/CNZLfnW5TCqP8cygyjn43v7yreBqxSfoid
 vYKe0aco2576p13YbFeb5mchlm29U5awwfwT4oIMge1D89KHzKRkH9yawxpdagRdr5pW
 ozCQ==
X-Gm-Message-State: AGi0PuZV/4Jxa6AzJywYgxSOCxipBty5AxK1/3jYjxibGqquceqKKvEE
 L8g+AvxlQrbOFotCPTZHT75Nj6lbxCJ68StBiJJEDw==
X-Received: by 2002:aca:c751:: with SMTP id x78mr3447296oif.163.1588089276802; 
 Tue, 28 Apr 2020 08:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200428155005.25537-1-f4bug@amsat.org>
In-Reply-To: <20200428155005.25537-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2020 16:54:25 +0100
Message-ID: <CAFEAcA_WPpXTLpfHuqoZcy2yeNmiOwtMwwQDZsUT-XdbqzhPpQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Use correct variable for setting 'max'
 cpu's MIDR_EL1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yQgZXOSKtymD

On Tue, 28 Apr 2020 at 16:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:

Looks like you forgot to edit the commit message subject line.

> MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.
>
> This fixes when compiling with -Werror=3Dconversion:
>
>   target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
>   target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may change value [-Werror=3Dconver=
sion]
>     628 |         cpu->midr =3D t;
>         |                     ^
>
> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I suppose cp15.c0_cpuid register in target/arm/cpu.h as uint32_t is OK.

Yes, that's a 32-bit aarch32 system register.

>
> Since v1: Follow Laurent and Peter suggestion.
> ---
>  target/arm/cpu.h | 3 ++-
>  target/arm/cpu.c | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8b9f2961ba..4d1be56df9 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -894,7 +894,7 @@ struct ARMCPU {
>          uint64_t id_aa64dfr0;
>          uint64_t id_aa64dfr1;
>      } isar;
> -    uint32_t midr;
> +    uint64_t midr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
>      uint32_t ctr;
> @@ -1685,6 +1685,7 @@ FIELD(MIDR_EL1, PARTNUM, 4, 12)
>  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
>  FIELD(MIDR_EL1, VARIANT, 20, 4)
>  FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
> +FIELD(MIDR_EL1, RESERVED, 32, 32)
>
>  FIELD(ID_ISAR0, SWAP, 0, 4)
>  FIELD(ID_ISAR0, BITCOUNT, 4, 4)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a79f233b17..aaa48e06ac 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1182,6 +1182,8 @@ void arm_cpu_post_init(Object *obj)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
>
> +    assert(FIELD_EX64(cpu->midr, MIDR_EL1, RESERVED) =3D=3D 0);

I wouldn't bother with the assert; we don't generally do that
kind of check on ID register values.

> +
>      /* M profile implies PMSA. We have to do this here rather than
>       * in realize with the other feature-implication checks because
>       * we look at the PMSA bit to see if we should add some properties.
> @@ -2757,7 +2759,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>  static Property arm_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, fal=
se),
>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
> -    DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
> +    DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
>      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                          mp_affinity, ARM64_AFFINITY_INVALID),
>      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID=
),
> --
> 2.21.1

Otherwise looks good.

-- PMM
