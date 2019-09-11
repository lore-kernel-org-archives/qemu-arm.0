Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp574177wrp;
        Wed, 11 Sep 2019 01:30:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWDkZ/wVCTWKjFVmrJ0N1bvaN6oNyb1ku8cyl2VI8zHGknI/lgiEC/Yxc8Tvs/iNPi83ca
X-Received: by 2002:adf:e7cc:: with SMTP id e12mr29106342wrn.299.1568190601209;
        Wed, 11 Sep 2019 01:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568190601; cv=none;
        d=google.com; s=arc-20160816;
        b=h230gRnCjwDykCYJYI1Sd93xu3WUjevKGgMtZlkCPGKuuKqjcj7p1M7ue1H0B86485
         9AY4/0CGjUJdfJXU8kWIm7Y4/Z67RMZhUfVQPBK1ehmqSmRgQyP5U+sHjgh7FFL8+B4E
         SnP5Gop64r8qlSLSp4fCdhkqgUb8krmRpZkXoXGHU3JZAEIWLwXTzHwUQhtBXNoAK1Su
         epQJSA88lJ3J0/PYkbwnX+gdrkHx+/xm6v8q+jdZu/O4LPPKQ/K+t8/o3w75jwySY6pW
         tkauODfO7QHK9cXM4BccxnpAZOGzmeB61EBOlO8vFbOlVPv7U4TBn6grkw2cPPZYJ6mK
         MMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:mime-version:user-agent:references:message-id
         :in-reply-to:subject:cc:to:from:date;
        bh=+r4fR2OYhJiIqNZZD56mgTgVJJV4xhULE+nh2N+U++k=;
        b=ZHRpsmKvJRcypp1R5m52PA3ZzOui2eObcNyWjY093su4aAIx5n2z5ixwufFj2jCg6P
         MHRhed2l6tpsJg9FdtScaXAOQEuaskeJg/mDSORPfzfEeNEcY1o+78vHKVQ9zu/nSdf2
         WVn/tFcRZtGRQhZX1sVlvqW5RTW+r5/NfepxfUk9OmclhTmBne2+10GcLA0t2YbbqZ9a
         FSi2wnBCn6uI4H5mOCL9NSH3pRZaKyORZ2ivFDVUXP7K+hmUxABji2woSR3Sknwpnazy
         aoZtVUD4LAFImp86S2mTo8zXPFrXYh73I8JUG4sjgISQtVvfp4i97kkfZWAfBPj3MLz8
         Vabw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [152.66.115.2])
        by mx.google.com with ESMTPS id r14si20390572wra.89.2019.09.11.01.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 01:30:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) client-ip=152.66.115.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 3605D7456D6;
	Wed, 11 Sep 2019 10:30:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 04CEA7456CA; Wed, 11 Sep 2019 10:30:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 03AC47456D5;
	Wed, 11 Sep 2019 10:30:00 +0200 (CEST)
Date: Wed, 11 Sep 2019 10:29:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
    "open list:PReP" <qemu-ppc@nongnu.org>, 
    "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
    "open list:S390-ccw boot" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH  v1 2/4] elf: move elf.h to elf/elf.h and split out
 types
In-Reply-To: <20190910193408.28917-3-alex.bennee@linaro.org>
Message-ID: <alpine.BSF.2.21.9999.1909111015260.4726@zero.eik.bme.hu>
References: <20190910193408.28917-1-alex.bennee@linaro.org> <20190910193408.28917-3-alex.bennee@linaro.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="3866299591-1638113727-1568189959=:4726"
Content-ID: <alpine.BSF.2.21.9999.1909111026190.4726@zero.eik.bme.hu>
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.9.11.82118, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.9.10.5650002
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%
X-TUID: OKqfBShE7p3w

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1638113727-1568189959=:4726
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.BSF.2.21.9999.1909111026191.4726@zero.eik.bme.hu>

On Tue, 10 Sep 2019, Alex Bennée wrote:
> diff --git a/include/elf/elf-types.inc.h b/include/elf/elf-types.inc.h
> new file mode 100644
> index 00000000000..35163adb2b5
> --- /dev/null
> +++ b/include/elf/elf-types.inc.h
> @@ -0,0 +1,63 @@
> +/*
> + * Elf Type Specialisation
> + *
> + * Copyright (c) 2019
> + * Written by Alex Bennée <alex.bennee@linaro.org>
> + *
> + * This code is licensed under the GNU .

You're missing end of licence sentence here. Also original file did not 
have copyright and licence header so you may want to fix that too or leave 
it out here as well for consistency,

> + */
> +
> +#ifndef _ELF_TYPES_INC_H_
> +#define _ELF_TYPES_INC_H_
> +
> +#ifndef ELF_CLASS
> +#error you must define ELF_CLASS before including elf-types.inc.h
> +#else
> +
> +#if ELF_CLASS == ELFCLASS32
> +
> +#define elfhdr      elf32_hdr
> +#define elf_phdr    elf32_phdr
> +#define elf_note    elf32_note
> +#define elf_shdr    elf32_shdr
> +#define elf_sym     elf32_sym
> +#define elf_addr_t  Elf32_Off
> +#define elf_rela    elf32_rela
> +
> +#ifdef ELF_USES_RELOCA
> +# define ELF_RELOC  Elf32_Rela
> +#else
> +# define ELF_RELOC  Elf32_Rel
> +#endif
> +
> +#ifndef ElfW
> +#  define ElfW(x)   Elf32_ ## x
> +#  define ELFW(x)   ELF32_ ## x
> +#endif
> +
> +#else /* ELF_CLASS == ELFCLASS64 */
> +
> +#define elfhdr      elf64_hdr
> +#define elf_phdr    elf64_phdr
> +#define elf_note    elf64_note
> +#define elf_shdr    elf64_shdr
> +#define elf_sym     elf64_sym
> +#define elf_addr_t  Elf64_Off
> +#define elf_rela    elf64_rela
> +
> +#ifdef ELF_USES_RELOCA
> +# define ELF_RELOC  Elf64_Rela
> +#else
> +# define ELF_RELOC  Elf64_Rel
> +#endif
> +
> +#ifndef ElfW
> +#  define ElfW(x)   Elf64_ ## x
> +#  define ELFW(x)   ELF64_ ## x
> +#endif
> +
> +#endif /* ELF_CLASS == ELFCLASS64 */
> +#endif /* ELF_CLASS */
> +#else
> +#error elf-types.inc.h should not be included twice in one compilation unit
> +#endif /* _ELF_TYPES_INC_H_ */
> diff --git a/include/elf.h b/include/elf/elf.h
> similarity index 98%
> rename from include/elf.h
> rename to include/elf/elf.h
> index 3501e0c8d03..2e264c1a7a0 100644
> --- a/include/elf.h
> +++ b/include/elf/elf.h
> @@ -1696,49 +1696,7 @@ struct elf32_fdpic_loadmap {
> };
>
> #ifdef ELF_CLASS
> -#if ELF_CLASS == ELFCLASS32
> -
> -#define elfhdr		elf32_hdr
> -#define elf_phdr	elf32_phdr
> -#define elf_note	elf32_note
> -#define elf_shdr	elf32_shdr
> -#define elf_sym		elf32_sym
> -#define elf_addr_t	Elf32_Off
> -#define elf_rela  elf32_rela
> -
> -#ifdef ELF_USES_RELOCA
> -# define ELF_RELOC      Elf32_Rela
> -#else
> -# define ELF_RELOC      Elf32_Rel
> -#endif
> -
> -#else
> -
> -#define elfhdr		elf64_hdr
> -#define elf_phdr	elf64_phdr
> -#define elf_note	elf64_note
> -#define elf_shdr	elf64_shdr
> -#define elf_sym		elf64_sym
> -#define elf_addr_t	Elf64_Off
> -#define elf_rela  elf64_rela
> -
> -#ifdef ELF_USES_RELOCA
> -# define ELF_RELOC      Elf64_Rela
> -#else
> -# define ELF_RELOC      Elf64_Rel
> -#endif
> -
> -#endif /* ELF_CLASS */
>
> -#ifndef ElfW
> -# if ELF_CLASS == ELFCLASS32
> -#  define ElfW(x)  Elf32_ ## x
> -#  define ELFW(x)  ELF32_ ## x
> -# else
> -#  define ElfW(x)  Elf64_ ## x
> -#  define ELFW(x)  ELF64_ ## x
> -# endif
> -#endif
>
> #endif /* ELF_CLASS */

Is there anything remaining in this #ifdef ELF_CLASS after this patch? If 
not why do you keep it?

Regards,
BALATON Zoltan
--3866299591-1638113727-1568189959=:4726--
