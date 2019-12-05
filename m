Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2461361lff;
        Thu, 5 Dec 2019 10:40:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTUSbD6K/Ws1A2w2iKZ+6rqbTKNGt/0jjV0IBeM2u1swACif2uvER7gKmIxpB7bLW3IuP+
X-Received: by 2002:a05:6830:232c:: with SMTP id q12mr7524570otg.168.1575571231002;
        Thu, 05 Dec 2019 10:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575571230; cv=none;
        d=google.com; s=arc-20160816;
        b=n++sn6qgiZee/n77v2Jew1eZ/P33k3kGCmIUieMrCWxWAlTaoklrfKmJCncEl4g6Rg
         bqYV1gmma/Y0mcUNGq0gvgqs3Dg7Fl1P/AozqmxUgu7OEk/uNSSIgdr5yHKozRRgBuXo
         AEvyOYzttoTn2d3OOXbzbC2419iZnoM0smGD8myTJibQVqc3W3vc46dbiA9VV5DCJv3v
         8VMdGCiXVfJCpX9U+tKEJ3lTiP6syqUzKpp2lXU1YI+AA7Qy9vr4Xrq2fUmcWejpmORa
         BiP1w/NswDhQy5x+E9EkcNqjT+cMwUItXKQHsBY81PDvotEThdse6Ewx86eo37Ad9I7D
         AW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpET3lzcKB22iPNVtFlsEzKa/4+3mu1B+c0PsjFBF2Y=;
        b=VnMdcxYeWFJvEejO0ZkvuKObxrThzRlGL+OanEZTYOVw0vG93bA/nqV14wJpdTWTH6
         F0c3L/TpL4ISumdbERV8LMZSGC90SufOYB9lDoX0/jiOXY90LCpTU2jT51vUjao9vcdi
         kdtXcyrZPHfHxvxHnGiEHdFhFi+UAR5HLnE9SWukk9cBdSXDGipoupgLpj0SHzsZ/RJD
         ofNSdkDU7x8PSSGV5AT0s9FNbICZcOQqLO49C5LOZHlNl9eVOsMkepzOcCQJDUqNAGLI
         ydIyMlU9CBvwnQBFWicVwIjtJvk0cEfMHi2SNcKw3r3W2yrocfGPQk/Hnj9vJd0CkLsf
         E6hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PkcPrGAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a197si5747709oii.199.2019.12.05.10.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 10:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PkcPrGAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icw3C-0003IZ-4I
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 13:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icw2x-0003IA-O9
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:40:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icw2w-0004YC-2L
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:40:15 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icw2v-0004U7-Lr
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:40:13 -0500
Received: by mail-oi1-x242.google.com with SMTP id i1so3687957oie.8
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 10:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpET3lzcKB22iPNVtFlsEzKa/4+3mu1B+c0PsjFBF2Y=;
 b=PkcPrGAhkb+DaTfiZwjROMKVihOXHHwj2emaoP151g9t7Wbca8W9qESxPnIT06fNuz
 0adVpiSY/67REJmRnpeC/Aq0q01tc3rnJTJGy7Ehj2EyCqMYR5y3PRWxUEXoYniJvTOy
 Z9cyE//zazj9I7urZ0hRZ6EGn17+jaV9EZwCPrrEAu6F2mmDvYvVfSwHWw0eX/5cIJl9
 YSTJGvBvLc9tTgszfGuvfdfE2Lx7lRE6LlTuTXev4GXDuH8tijs/LNvko8dATrJpBGVD
 2Zig4WdzNVEyiaV0/hxhJmx0wNrqLqhySjay7P9wyxBkL8gUKSkM4dd9VJqJoNFcmUKL
 WNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpET3lzcKB22iPNVtFlsEzKa/4+3mu1B+c0PsjFBF2Y=;
 b=KB9Gd1dZ505Mhf5c7AE9fUDOLu4Q2fVyO+3X//toUvZB6PTwzcryvM2kHLOuC+OIrH
 OlE0G6jAKYn5Ukv4eOrjRvXP/eqA4//4UXco4m2vCr9HibOxTzTrj3kJj/WorH2cqZy7
 IZDvsNJFCSqBm1dz9b8qFbEbkmgrbgrikRDhS5s0/YLYJm/Ywkxd+s8k17d9vZRGGr8Z
 L3SaXGgsAvgCBp/AQiNnE7gqeXAOIN4ooKMZ7QXUkau9CHjK70NEPXrA2VDz4voUUbgV
 Vb+6rdin2/BTRRLeStw/kDWNqXDRQ5MJm1sC/hWegxpH6AsajtCODnLeG9MZiyqYyZhr
 IeMg==
X-Gm-Message-State: APjAAAUA4dGwMRUWWM1C9+lb8Q1Z0O7t2jm6cVTB/GfS7fvXTm38uCvW
 DkEQVRJY5uEvZ8L3JO6f3FwNis3fQCl29t6O9ScpdA==
X-Received: by 2002:aca:f5cc:: with SMTP id t195mr8715903oih.163.1575571210836; 
 Thu, 05 Dec 2019 10:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-21-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 18:40:00 +0000
Message-ID: <CAFEAcA93AX9nikuqq9M1jZOxv1a7QJZpiocHnn=n-gSbsGBS7w@mail.gmail.com>
Subject: Re: [PATCH v5 20/22] target/arm: Create tagged ram when MTE is enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: X2plf006fcRv

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Assign cs->num_ases to the final value first.
>     Downgrade to ID_AA64PFR1.MTE=1 if tag memory is not available.
> v6: Add secure tag memory for EL3.
> ---
>  target/arm/cpu.h |  6 ++++++
>  hw/arm/virt.c    | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.c | 53 ++++++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 110 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 93a362708b..faca43ea78 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -765,6 +765,10 @@ struct ARMCPU {
>      /* MemoryRegion to use for secure physical accesses */
>      MemoryRegion *secure_memory;
>
> +    /* MemoryRegion to use for allocation tag accesses */
> +    MemoryRegion *tag_memory;
> +    MemoryRegion *secure_tag_memory;
> +
>      /* For v8M, pointer to the IDAU interface provided by board/SoC */
>      Object *idau;
>
> @@ -2956,6 +2960,8 @@ int cpu_mmu_index(CPUARMState *env, bool ifetch);
>  typedef enum ARMASIdx {
>      ARMASIdx_NS = 0,
>      ARMASIdx_S = 1,
> +    ARMASIdx_TagNS = 2,
> +    ARMASIdx_TagS = 3,
>  } ARMASIdx;
>
>  /* Return the Exception Level targeted by debug exceptions. */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d74538b021..573988ba4d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1330,6 +1330,18 @@ static void create_secure_ram(VirtMachineState *vms,
>      g_free(nodename);
>  }
>
> +static void create_tag_ram(MemoryRegion *tag_sysmem,
> +                           hwaddr base, hwaddr size,
> +                           const char *name)
> +{
> +    MemoryRegion *tagram = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_ram(tagram, NULL, name, size / 32, &error_fatal);
> +    memory_region_add_subregion(tag_sysmem, base / 32, tagram);
> +
> +    /* ??? Do we really need an fdt entry, or is MemTag enabled sufficient.  */

What's this '???' asking about? I would be surprised if the
kernel expected to have any kind of FDT for tag RAM
(with the exception that an implementation that puts tags
in a special part of normal-ram will want that not
to be described in the fdt as ram usable by the kernel), but
we should ask the kernel folks.

> +}
> +
>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  {
>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
> @@ -1485,6 +1497,8 @@ static void machvirt_init(MachineState *machine)
>      qemu_irq pic[NUM_IRQS];
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
> +    MemoryRegion *tag_sysmem = NULL;
> +    MemoryRegion *secure_tag_sysmem = NULL;
>      int n, virt_max_cpus;
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      bool firmware_loaded;
> @@ -1652,6 +1666,35 @@ static void machvirt_init(MachineState *machine)
>                                       "secure-memory", &error_abort);
>          }
>
> +        /*
> +         * The cpu adds the property iff MemTag is supported.

We've had confusion before from non-native-speakers and
non-maths-geeks about 'iff' in comments; better to expand to
'if and only if'.

> +         * If it is, we must allocate the ram to back that up.
> +         */
> +        if (object_property_find(cpuobj, "tag-memory", NULL)) {
> +            if (!tag_sysmem) {
> +                tag_sysmem = g_new(MemoryRegion, 1);
> +                memory_region_init(tag_sysmem, OBJECT(machine),
> +                                   "tag-memory", UINT64_MAX / 32);
> +
> +                if (vms->secure) {
> +                    secure_tag_sysmem = g_new(MemoryRegion, 1);
> +                    memory_region_init(secure_tag_sysmem, OBJECT(machine),
> +                                       "secure-tag-memory", UINT64_MAX / 32);
> +
> +                    /* As with ram, secure-tag takes precedence over tag.  */
> +                    memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
> +                                                        tag_sysmem, -1);
> +                }
> +            }

Are there really separate S and NS tag RAMs?

thanks
-- PMM
