Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1837681wre;
        Sat, 2 Jun 2018 09:11:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJzui9PS2E2JBGkFreK1ZMRJ4jfGjMp5lEIKzE/cX5H0toLyDvudwaIL2hyccddsA62HoI6
X-Received: by 2002:a37:34d0:: with SMTP id b199-v6mr13840662qka.89.1527955896178;
        Sat, 02 Jun 2018 09:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527955896; cv=none;
        d=google.com; s=arc-20160816;
        b=fzNnZuP7OR1KWiMs/QH48QmDwG2/e+qrXcbcY+r++NeuVg2kFP/Ay8o/3A5IdGNaeZ
         gHVlE+SaYPjniURLxb9ZSmDtwS34DGxOY4rN8PuHlXEjM9kcQV1q74hPSwe3EWqGL/os
         Yz/LS4/4GC4At1UA4fyBp3TqG76ubr8lAmHiO++AYaq300VADup/Ynj8TC9fUZ7kqa0C
         65gBwirT991eqgwGrr07vP6QVUlK7dGedVkWmgFO8nXheP1N/bs7VruboM8fqtBS8fx1
         LdkJZ/7yKB9JGwugfZBmaoXvhRwDdeat39tJp5/ySDp4OamECp7iJF2CG4w4QE/5LdnW
         EaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=G2O0wgVFxxA6U2bjb01xGZHqaAcD5ljE8tUuFRH/ouM=;
        b=TBkrsqFgyHEaxwF4GAN9/sEdudwfwqoDz2Ak5XjOEDkjRPwzixgZMZRVXkvgfR5qEH
         HG5CpN/y13T6CwWprJ7RrZDvCPMaAotmqwEA2U2bCBC5CK6kpKj++LNdTiGBOOQUNSW2
         ccGLxDj/7vQZbgXXIs/47z3SEeKtGtXYiY2RIO2UZ5JaosJmuIp3ycWHVfOzAPahU8h/
         EdTCeWMPpuAmgcl+x9kVOD342hsm7yn+dt9TrDxmA2ja0xEqpxVhIj9WYPD79gj6DFNB
         iAHZCRdbqAcT36fpgYE1BXxSKfQQCKerbrmCghIBbHIyJjYzrEUAd6zBpR2A5n8BzaNe
         xgUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K+WXpLRc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s13-v6si2704536qvk.21.2018.06.02.09.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 09:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K+WXpLRc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fP97v-0002kC-NY
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 12:11:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fP97m-0002hg-9S
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 12:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fP97l-0002vF-27
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 12:11:25 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fP97k-0002uA-Ss
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 12:11:24 -0400
Received: by mail-oi0-x241.google.com with SMTP id t133-v6so21394257oif.10
	for <qemu-arm@nongnu.org>; Sat, 02 Jun 2018 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G2O0wgVFxxA6U2bjb01xGZHqaAcD5ljE8tUuFRH/ouM=;
	b=K+WXpLRcWUjUib/FhJSACbSfpGkUKwdgDsv3P1D+u/1T7wOjbNPr7JDMUhIuUpU3Ts
	aCDzaZWqYr/Hf0nTOGM7Oap6eL3//UNja6AqP5dehHqF/7dDjiRCZaQi6aFyZPSP3P/r
	MJk6UiaGyNy8XZT1V5pFbzoXuV6uFQQn562Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G2O0wgVFxxA6U2bjb01xGZHqaAcD5ljE8tUuFRH/ouM=;
	b=Bi+LYQoBbVWogULDp6jAZf4aambIGfKY2V2TvhVmSWFI8lqOuiB8fP1UOeL6GPDe/7
	eNFwTDYwWBWKHIfaSoetk3oXyxfRgrdvElJCf/YzY3pVoApLcb5NRJXqViuOuv9bMZOo
	7wNAEO+a+8pNgQVdtkKn8xiulkxz6d066GPhmHJAxomo7/f7LLKYHIGQfB8kyCJl2xC5
	n8itMfZpt/2WYAYQpr2Vnlmqw7YvH5yrYU6c+xrcbWd+BU0VgQ1LWwwVCDAgXWFvgM51
	pvbhTzGzFswBtw+p3wHJ6OE2gKKZQkhtNTaJwxDBc3601Zv2vHUaMpC3kRdhVPZHoIjn
	qr/w==
X-Gm-Message-State: APt69E1qmRUf3VhlIz5dueQ3ZXhKT3+KrOnjPJBZrnk+ySvVpNDvQzOj
	ZzRkG2l8/tX0+MuNRl4UxXh/G4vMOSgMCoFztRjZ8w==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr9068022oig.102.1527955884095; 
	Sat, 02 Jun 2018 09:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Sat, 2 Jun 2018 09:11:03 -0700 (PDT)
In-Reply-To: <20180602141446.29982-2-stefanha@redhat.com>
References: <20180602141446.29982-1-stefanha@redhat.com>
	<20180602141446.29982-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jun 2018 17:11:03 +0100
Message-ID: <CAFEAcA9BdH+Qj9S17kVagbTP4B6j+SS64mmSbKu4Yf4H6EKOjQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [RFC 1/2] target/arm: add "cortex-m0" CPU model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /o8Pp73gly5R

On 2 June 2018 at 15:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Define a "cortex-m0" ARMv6-M CPU model.
>
> Most of the register reset values set by other CPU models are not
> relevant for the cut-down ARMv6-M architecture.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  target/arm/cpu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5d60893a07..aac224d809 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1215,6 +1215,16 @@ static void arm11mpcore_initfn(Object *obj)
>      cpu->reset_auxcr = 1;
>  }
>
> +static void cortex_m0_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_V6);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +
> +    /* TODO ARMv6-M doesn't support coprocessors, so how is this value accessed? */
> +    cpu->midr = 0x410cc200;

The MIDR is a memory-mapped register on M-profile (at 0xed00ed00);
we implement this in hw/intc/armv7m_nvic.c.

> +}
> +
>  static void cortex_m3_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -1796,6 +1806,8 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
> +                             .class_init = arm_v7m_class_init /* TODO rename? */ },

We use v7m for a lot of stuff that's really M-profile in
general (eg the v8m cortex-m33), so I wouldn't worry too
much about renaming the function.

thanks
-- PMM
