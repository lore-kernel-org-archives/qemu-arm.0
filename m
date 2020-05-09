Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1144166lfb;
        Sat, 9 May 2020 09:08:17 -0700 (PDT)
X-Received: by 2002:a5d:4801:: with SMTP id l1mr8639439wrq.235.1589040497882;
        Sat, 09 May 2020 09:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589040497; cv=none;
        d=google.com; s=arc-20160816;
        b=zW2OHTIfGItDqMCRd4kxcGlLrxKMYEL/pCkFN2lT87SV0YT/vhS0evHxMiLs2zb6SM
         fx2XwR5OvdAVWSk0dfC/d0IgTFSIyMDPAZlYQsydKNm7KJ1JLdJ17DIMlAHF50DJoq/u
         iHzmwZTKvcc7j9Xbk7aCbCFcp+AwAE4gd7Cb6JK+x0caKYFBtOTSlEsTU9vqsvmKSw/m
         /1ikm8fZZMEwwu5QPnzbdvwdUlEvFAWaO09ZirUJgtkfo7wgDcolVn0tKYHNQdJgCL4f
         z5BCSQT/97y3mbMNPo6bDllreAxZbtO9FM7/lKKWNjuHerwR46PTV5BiN4VUJlP8wudz
         AQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=KKufh5BT6a1UYTGLsqZj6CC3M1OVbx8BNKL5Xs7X+qc=;
        b=pG9jQayX2PGlbSuOudw8bmtQF7RaxisSKI8kq9pfBESVOIejjllggH2KWmbBYRyBxq
         FT/leqhpmDCSLO+X7RYW4NuDrUf9QHA47DpNPaxrfnfgDfNj5AEZEtmE/9fy8wKm5Fjh
         f2IO62fJ7y/FjekJnxawFdvbvJaAOu1ZdxQD8mpm00KKeTmeL2xjsY/bic1gnIn9x/qN
         IhdV6TqtPs/ZN5oH/K6tVARDbRiGPCulkgYOXaS1NqU80/CCo4jg/meAI2+SjleRjN5n
         4pXsdXzfu1pedZ9GxkNpvvR28jocapGnviogc7pNR+38zmDN3LghaAwsPIbBDGeBXU3m
         MsUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YJv7bFlA;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y6sor3046829wrt.40.2020.05.09.09.08.17
        (Google Transport Security);
        Sat, 09 May 2020 09:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YJv7bFlA;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KKufh5BT6a1UYTGLsqZj6CC3M1OVbx8BNKL5Xs7X+qc=;
        b=YJv7bFlARZfY+zeDPXp4vT1yQrfZ9jBFJ+oQvJAHmVeafJQt0k2qakBRUYRUHdqfci
         GdgI3cpAfIYOm97zQJiMFIMFWE9wk9ChRM2oq5kW7Jr9cUuRyTO8NYumFLg8Lz5Wms+j
         yTaz2Ui/y/8F1PFglv90J1pqxBud/dp2B1WgljZ4SUevn17dXUj43wBLuGBuEplbUgBg
         frRewC6i3lBIo7jbLUZUpZW9XHvKNcXbjijhJ7iUlS+O47BA2ihLknQsCu+U58tPUdKf
         YvxMJtnMUyW04d3c0xbX9G9epOjN7BgKFlOhbJEf/6VMu5Jc4XQW2TQXobuC+oItcU0m
         7edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KKufh5BT6a1UYTGLsqZj6CC3M1OVbx8BNKL5Xs7X+qc=;
        b=NmsCEIywCCzouf6FOaFpvVqhV0WRqVuidYXNoKxA1bBXix+yNc8dRMExnTJHwy3KYT
         5Ab5CzScoROFtxD5xr562jy8asKtOV9GycH8ktAQkhw53C+H2XsvsqqsN72wIGJtkFAe
         Mrf9qo2y3jESTnSGJZ+CtKqnxqkqyqk9bHEGLSjC+WoidnOWMsRNXPcR/XOcD70JVUvR
         v799jVL044ZXLV80RNTuJv5cPBKkYexydOIVudgGHs7VAZbUkE4SNMjSZnDgIhLLB8Iu
         38MRoT5+JVKrCW/R/0FPV4glD0JMyfzrY9HPopd4myUMmWl6HROvnyIidtFsc21hzQMq
         Fnaw==
X-Gm-Message-State: AGi0PuZPzJhVRG/Ao5mCBK7UQKIyhcHtt9qhBbrMsgw8AYMBFybgVO/C
	OLtr0ZsER3nTIeX8WTBeenY=
X-Google-Smtp-Source: APiQypJM8xAG79sIeKgcs9BdP6pxuviaphd3M6rHZ398H22ZOU7gakAJvDiC43fvmPm+hTtadVbywg==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr8965515wru.91.1589040496463;
        Sat, 09 May 2020 09:08:16 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.37] (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id z11sm8476488wro.48.2020.05.09.09.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2020 09:08:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 09/11] target/cpu: Restrict handlers using hwaddr type to
 system-mode
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-10-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ba3d3ba1-09bf-17a0-2116-549fa92e1ed6@amsat.org>
Date: Sat, 9 May 2020 18:08:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200509130910.26335-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: e05Hfrp6mLPN

On 5/9/20 3:09 PM, Philippe Mathieu-Daudé wrote:
> Restrict the following handlers to system-mode:
> - do_unaligned_access
> - do_transaction_failed
> - get_phys_page_debug
> - get_phys_page_attrs_debug
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h           |  8 +++++---
>   target/alpha/cpu.h              |  4 +++-
>   target/arm/cpu.h                |  6 +++---
>   target/arm/internals.h          |  4 ++++
>   target/cris/cpu.h               |  2 ++
>   target/hppa/cpu.h               |  2 +-
>   target/i386/cpu.h               |  2 ++
>   target/m68k/cpu.h               |  7 ++++++-
>   target/microblaze/cpu.h         |  5 ++++-
>   target/mips/internal.h          |  2 +-
>   target/nios2/cpu.h              |  5 ++++-
>   target/openrisc/cpu.h           |  3 ++-
>   target/ppc/cpu.h                |  2 +-
>   target/riscv/cpu.h              | 20 ++++++++++----------
>   target/sh4/cpu.h                |  2 +-
>   target/sparc/cpu.h              |  2 ++
>   target/xtensa/cpu.h             | 12 +++++++-----
>   target/hppa/cpu.c               |  4 +++-
>   target/ppc/translate_init.inc.c |  2 +-
>   19 files changed, 62 insertions(+), 32 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 5bf94d28cf..ed09d056d1 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -167,6 +167,7 @@ typedef struct CPUClass {
>       int reset_dump_flags;
>       bool (*has_work)(CPUState *cpu);
>       void (*do_interrupt)(CPUState *cpu);
> +#ifndef CONFIG_USER_ONLY

I forgot once Peter Maydell told me we can't do that for some reason I 
don't remember.

At least this changes the sizeof(CPUClass), so we get:

qom/object.c:315:type_initialize: assertion failed: (parent->class_size 
<= ti->class_size)

So we can't poison the hwaddr type? (final patch of this series).

>       void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                   MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr);
> @@ -174,6 +175,10 @@ typedef struct CPUClass {
>                                     unsigned size, MMUAccessType access_type,
>                                     int mmu_idx, MemTxAttrs attrs,
>                                     MemTxResult response, uintptr_t retaddr);
> +    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> +    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> +                                        MemTxAttrs *attrs);
> +#endif /* CONFIG_USER_ONLY */
>       bool (*virtio_is_big_endian)(CPUState *cpu);
>       int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                              uint8_t *buf, int len, bool is_write);
> @@ -189,9 +194,6 @@ typedef struct CPUClass {
>       bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> -    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> -    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> -                                        MemTxAttrs *attrs);
>       int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
>       int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
>       int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
[...]
