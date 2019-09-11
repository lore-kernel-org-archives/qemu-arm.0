Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z25sm2405620wmk.0.2019.09.11.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 02:19:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 834631FF87;
	Wed, 11 Sep 2019 10:19:28 +0100 (BST)
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-3-alex.bennee@linaro.org>
 <alpine.BSF.2.21.9999.1909111015260.4726@zero.eik.bme.hu>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 "open list\:PReP" <qemu-ppc@nongnu.org>, "open list\:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, "open list\:S390-ccw boot" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH  v1 2/4] elf: move elf.h to elf/elf.h and split out types
In-reply-to: <alpine.BSF.2.21.9999.1909111015260.4726@zero.eik.bme.hu>
Date: Wed, 11 Sep 2019 10:19:28 +0100
Message-ID: <875zlz197j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +XabYeqy3CmU


BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Tue, 10 Sep 2019, Alex Benn=C3=A9e wrote:
>> diff --git a/include/elf/elf-types.inc.h b/include/elf/elf-types.inc.h
>> new file mode 100644
>> index 00000000000..35163adb2b5
>> --- /dev/null
>> +++ b/include/elf/elf-types.inc.h
>> @@ -0,0 +1,63 @@
>> +/*
>> + * Elf Type Specialisation
>> + *
>> + * Copyright (c) 2019
>> + * Written by Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> + *
>> + * This code is licensed under the GNU .
>
> You're missing end of licence sentence here. Also original file did
> not have copyright and licence header so you may want to fix that too
> or leave it out here as well for consistency,

The fault of my header macro - I'll try and fix it up when it's
expanding on the QEMU tree.

I'm going to assume that is should be the whole project license (GPL
v2). Most of the original file dates from 2003 and is Frabrice's commit
with the occasional commit mentioning be copied from Linux.

>
>> + */
>> +
>> +#ifndef _ELF_TYPES_INC_H_
>> +#define _ELF_TYPES_INC_H_
>> +
>> +#ifndef ELF_CLASS
>> +#error you must define ELF_CLASS before including elf-types.inc.h
>> +#else
>> +
>> +#if ELF_CLASS =3D=3D ELFCLASS32
>> +
>> +#define elfhdr      elf32_hdr
>> +#define elf_phdr    elf32_phdr
>> +#define elf_note    elf32_note
>> +#define elf_shdr    elf32_shdr
>> +#define elf_sym     elf32_sym
>> +#define elf_addr_t  Elf32_Off
>> +#define elf_rela    elf32_rela
>> +
>> +#ifdef ELF_USES_RELOCA
>> +# define ELF_RELOC  Elf32_Rela
>> +#else
>> +# define ELF_RELOC  Elf32_Rel
>> +#endif
>> +
>> +#ifndef ElfW
>> +#  define ElfW(x)   Elf32_ ## x
>> +#  define ELFW(x)   ELF32_ ## x
>> +#endif
>> +
>> +#else /* ELF_CLASS =3D=3D ELFCLASS64 */
>> +
>> +#define elfhdr      elf64_hdr
>> +#define elf_phdr    elf64_phdr
>> +#define elf_note    elf64_note
>> +#define elf_shdr    elf64_shdr
>> +#define elf_sym     elf64_sym
>> +#define elf_addr_t  Elf64_Off
>> +#define elf_rela    elf64_rela
>> +
>> +#ifdef ELF_USES_RELOCA
>> +# define ELF_RELOC  Elf64_Rela
>> +#else
>> +# define ELF_RELOC  Elf64_Rel
>> +#endif
>> +
>> +#ifndef ElfW
>> +#  define ElfW(x)   Elf64_ ## x
>> +#  define ELFW(x)   ELF64_ ## x
>> +#endif
>> +
>> +#endif /* ELF_CLASS =3D=3D ELFCLASS64 */
>> +#endif /* ELF_CLASS */
>> +#else
>> +#error elf-types.inc.h should not be included twice in one compilation =
unit
>> +#endif /* _ELF_TYPES_INC_H_ */
>> diff --git a/include/elf.h b/include/elf/elf.h
>> similarity index 98%
>> rename from include/elf.h
>> rename to include/elf/elf.h
>> index 3501e0c8d03..2e264c1a7a0 100644
>> --- a/include/elf.h
>> +++ b/include/elf/elf.h
>> @@ -1696,49 +1696,7 @@ struct elf32_fdpic_loadmap {
>> };
>>
>> #ifdef ELF_CLASS
>> -#if ELF_CLASS =3D=3D ELFCLASS32
>> -
>> -#define elfhdr		elf32_hdr
>> -#define elf_phdr	elf32_phdr
>> -#define elf_note	elf32_note
>> -#define elf_shdr	elf32_shdr
>> -#define elf_sym		elf32_sym
>> -#define elf_addr_t	Elf32_Off
>> -#define elf_rela  elf32_rela
>> -
>> -#ifdef ELF_USES_RELOCA
>> -# define ELF_RELOC      Elf32_Rela
>> -#else
>> -# define ELF_RELOC      Elf32_Rel
>> -#endif
>> -
>> -#else
>> -
>> -#define elfhdr		elf64_hdr
>> -#define elf_phdr	elf64_phdr
>> -#define elf_note	elf64_note
>> -#define elf_shdr	elf64_shdr
>> -#define elf_sym		elf64_sym
>> -#define elf_addr_t	Elf64_Off
>> -#define elf_rela  elf64_rela
>> -
>> -#ifdef ELF_USES_RELOCA
>> -# define ELF_RELOC      Elf64_Rela
>> -#else
>> -# define ELF_RELOC      Elf64_Rel
>> -#endif
>> -
>> -#endif /* ELF_CLASS */
>>
>> -#ifndef ElfW
>> -# if ELF_CLASS =3D=3D ELFCLASS32
>> -#  define ElfW(x)  Elf32_ ## x
>> -#  define ELFW(x)  ELF32_ ## x
>> -# else
>> -#  define ElfW(x)  Elf64_ ## x
>> -#  define ELFW(x)  ELF64_ ## x
>> -# endif
>> -#endif
>>
>> #endif /* ELF_CLASS */
>
> Is there anything remaining in this #ifdef ELF_CLASS after this patch?
> If not why do you keep it?
>
> Regards,
> BALATON Zoltan


--
Alex Benn=C3=A9e
