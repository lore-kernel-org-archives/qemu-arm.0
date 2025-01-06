Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp12046782njk;
        Mon, 6 Jan 2025 13:45:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV97OVYYe8rK8OsxUgzf9NhPGwMjNgZ6xii3MBDaKLPHO6hvkvo3xmq6+iJZsdQmfE+ACog7ik9imsq4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHhjxqANXGkHqnAm7gPnVRyETrhMFDeTZdtK2UNkKMqnam0mssYcNRK8G3exSIUJ6O3h/Ld
X-Received: by 2002:a05:6102:2923:b0:4af:e077:8a73 with SMTP id ada2fe7eead31-4b2cc38f5efmr48022380137.13.1736199942612;
        Mon, 06 Jan 2025 13:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736199942; cv=none;
        d=google.com; s=arc-20240605;
        b=LEIaPj3mE9e+4g4DE1HIwJpaeS7MafRxxC0EkAk2VC6rF2OQ3XRHfmdzbo0TtHBrYm
         b2XcwkqnDipu91hybOl+eVe0ovNi5z9qgLaTRBUXc9g1cRMhur1NN1KXNXBChpKREfbX
         IY7/62dEkJZtXbFbmG4qrIpDsEZa28cPkxo6vP2rvVg2llBG6NhOGsWpgBZ6GRoTGjdR
         KUSHlGoRpmsp6gcsTJ3bhcL0NJLXhRHoorxMzc9BXAMom8xO8f6SuS7jpjWPgYkyTgh7
         KqbvGCmafLTc3AbuSrb1XzudJrrFsHWxifddh0ALypH0AtxXkwEoXo95wKrNwdMNomDR
         GigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Q1fK9bXE7L4EjYg2zKsnZZ1K2teUmx39u5sxbf95Jis=;
        fh=RpWChb+Deuy3D8nIuyQYSL+dXlnL1pD8uvzvw/OS44g=;
        b=Y6oQAowdIbvi0uvUmXTwgxz8+licHiQ+CqlA7/RkdqsoJQZM/AebYnyb1zw1BQkdYm
         1Gk+ADu7pVUklMU16levVg3Njh7BmyPEYy8zwlZAGU8Ro8aMg87o2CtTDajsh+K21SkF
         Z2mVeEir1H7xSQHIFVTmWq531s+s/ewZzGw2g9A5HlC32OxP5A9EL+k9sWUYzicL6j3a
         w250pm/MsizobZnEbXhkhAry3PXnKQD5cSpMb9h+MuWzb3nAkkNYWo7vEv8G8AJjd/Ui
         UHglRsSfBmlyOVJwMyf3GxEqk+njvl8nzNHV6p0TYjglHcBH/qeVIGAc8RRJoPHUfw/N
         NyZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uX5UrFur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bfb7387dsi11171243137.396.2025.01.06.13.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2025 13:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uX5UrFur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tUuuV-00077a-52; Mon, 06 Jan 2025 16:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tUuuT-000745-Hi
 for qemu-arm@nongnu.org; Mon, 06 Jan 2025 16:45:17 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tUuuP-0005PF-VC
 for qemu-arm@nongnu.org; Mon, 06 Jan 2025 16:45:16 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso4922488276.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2025 13:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736199913; x=1736804713; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1fK9bXE7L4EjYg2zKsnZZ1K2teUmx39u5sxbf95Jis=;
 b=uX5UrFurxOdBRURURwWZgR/uRa9bSZTYos9d4Tr5wSWTEaiA9rQX1X/UrIeQpVOoSN
 CaXEpRkqTnhxcpsEx41kHNy0uyQZxoAwWOOQGlLjgt1noTrXKaSKhVoC7f0H49d7hfWd
 puMQdJ4X1OSkJMG4vsc30DCVVBLRx60TYSw0unsnQ93chrfeJHv8ZcKiv6sR3niOC1f8
 wrSuldH54so7/vWqhYOIrGtMqklKUukBeFahoaaivosOJ/Ysz3JXiNgfDi7EJjXwYUx9
 HDeCVbE6v7jZkEbhh3qnvY1zV2l3G9vTBoVsCUjUecIS55k6v9hPIAqKV5VewQcRYVvf
 Y9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736199913; x=1736804713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1fK9bXE7L4EjYg2zKsnZZ1K2teUmx39u5sxbf95Jis=;
 b=M7Ur/iRQ9rbMJPOyqdB63eRda1qG2d65l5aI720SD4RlAHUhEljNC1DHFwJIgMFtdP
 4NbNAj7sd4jJZhGJVqixusVjTus5Tx6Pw6lfDnt8UrVrJek+2EKdb3iWuCt7iy9/vi+i
 lWsXomj0vcD+KeH8HspJ9UbCi+XSgED1PtcxSLFjh1BsvENYJJzEBbkWycM8l988pqWe
 /ejGq6aMS97jV5b4ttxtR6pwFF7hPxAVdC0r7b9x76tHAiCyJaH3SLUbVDNh8HObJ0CZ
 3xsysek7Pb6ekELURj19GULZB94RPRwziaHloP/4NKJV6KmM3sqb5//GwxOZaqPhVMpE
 DzGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5r2wXFVdG7gWBVEqpE9a4rq8ikvF40mvKQ1wjcnP1bZZmYo48nF6WLavz7yln3mSZc/Dfwd1vOQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyhc3CyIggSalUYQpJPTxaWSVfAZZFVqyoiksXxd7g3dGFxOlla
 ZKBKvrfm9g9/xuSzLNQb6szl3xUAmTzAz7xkxfxuqw2xJIjphF1MtO3F9Y9/O4mjPXB230Hbgtx
 Oc0X5BPk0H4a9M860JjxvURLgOR5L4GHOL3NL9A==
X-Gm-Gg: ASbGncsxtQQpBPIP51Qd2G4vecbOoj0JwhBj4Q6BAE8CvCdNg3zMJyTrdztWxwUQYrk
 pEBCkvwAHPAR0kMzduNTaNCaQNgjRmchWyoRA1jM=
X-Received: by 2002:a05:6902:1683:b0:e39:8558:d9c5 with SMTP id
 3f1490d57ef6-e538c25ca62mr43210270276.18.1736199912829; Mon, 06 Jan 2025
 13:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20250106182343.35859-1-philmd@linaro.org>
In-Reply-To: <20250106182343.35859-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2025 21:45:01 +0000
Message-ID: <CAFEAcA8mxMP=aSrd1=dL0dMzWzHZAF4B5TC=READYiDRLuURQQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm/arm-powerctl: Restrict to ARM cores
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Anton Johansson <anjo@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: r6zR4K3YD8Da

On Mon, 6 Jan 2025 at 18:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When running on a heterogeneous setup, the CPU_FOREACH()
> macro in arm_get_cpu_by_id() iterates on all vCPUs,
> regardless they are ARM or not. Check the CPU class type
> and skip the non-ARM instances.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/arm-powerctl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index 20c70c7d6bb..a080a6ab79f 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -36,9 +36,11 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
>      DPRINTF("cpu %" PRId64 "\n", id);
>
>      CPU_FOREACH(cpu) {
> -        ARMCPU *armcpu =3D ARM_CPU(cpu);
> +        if (!object_class_dynamic_cast((ObjectClass *)cpu->cc, TYPE_ARM_=
CPU)) {
> +            continue;
> +        }
>
> -        if (arm_cpu_mp_affinity(armcpu) =3D=3D id) {
> +        if (arm_cpu_mp_affinity((ARMCPU *)cpu) =3D=3D id) {
>              return cpu;
>          }
>      }
> --

Makes sense -- the function is "get me a CPU with this MPIDR",
so in a heterogenous system we can happily scan all the Arm CPUs
(even if they're in some other SoC) and trust that the caller
passed us a MPIDR that makes sense. (The callsites might need
some work if we wanted to use those SoC models in a heterogenous
setup where they're not the only SoC -- eg the imx6_src devices
assume the CPUs in the SoC are numbered 0,1,2,3 -- but we don't
need to do that now.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
