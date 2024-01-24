Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm248736wmo.36.2024.01.24.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 12:48:05 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D81A55F754;
	Wed, 24 Jan 2024 20:48:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org,
  qemu-block@nongnu.org,  qemu-arm@nongnu.org,  Bin Meng
 <bmeng@tinylab.org>,  Richard Henderson <richard.henderson@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PULL 33/36] hw/elf_ops: Ignore loadable segments with zero size
In-Reply-To: <20240119113507.31951-34-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 19 Jan 2024 12:35:02
 +0100")
References: <20240119113507.31951-1-philmd@linaro.org>
	<20240119113507.31951-34-philmd@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Wed, 24 Jan 2024 20:48:04 +0000
Message-ID: <87r0i65ugr.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Wp+DRCJLT0+m

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> From: Bin Meng <bmeng@tinylab.org>
>
> Some ELF files really do have segments of zero size, e.g.:
>
> Program Headers:
>   Type           Offset             VirtAddr           PhysAddr
>                  FileSiz            MemSiz              Flags  Align
>   RISCV_ATTRIBUT 0x00000000000025b8 0x0000000000000000 0x0000000000000000
>                  0x000000000000003e 0x0000000000000000  R      0x1
>   LOAD           0x0000000000001000 0x0000000080200000 0x0000000080200000
>                  0x00000000000001d1 0x00000000000001d1  R E    0x1000
>   LOAD           0x00000000000011d1 0x00000000802001d1 0x00000000802001d1
>                  0x0000000000000e37 0x0000000000000e37  RW     0x1000
>   LOAD           0x0000000000000120 0x0000000000000000 0x0000000000000000
>                  0x0000000000000000 0x0000000000000000         0x1000
>
> The current logic does not check for this condition, resulting in
> the incorrect assignment of 'lowaddr' as zero.
>
> There is already a piece of codes inside the segment traversal loop
> that checks for zero-sized loadable segments for not creating empty
> ROM blobs. Let's move this check to the beginning of the loop to
> cover both scenarios.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-ID: <20240116155049.390301-1-bmeng@tinylab.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This has broken Xtensa system emulation:

  =E2=9E=9C  /bin/sh -c "cd builds/bisect; ninja; make check-tcg"
  [8/8] Linking target qemu-system-xtensa
    BUILD   debian-xtensa-cross
    BUILD   xtensa-softmmu guest-tests
    RUN     xtensa-softmmu guest-tests
    TEST    test_bi on xtensa
    TEST    test_boolean on xtensa
    TEST    test_break on xtensa
    TEST    test_b on xtensa
    TEST    test_bz on xtensa
    TEST    test_cache on xtensa
    TEST    test_clamps on xtensa
    TEST    test_dfp0_arith on xtensa
    TEST    test_exclusive on xtensa
    TEST    test_extui on xtensa
    TEST    test_flix on xtensa
    TEST    test_fp0_arith on xtensa
    TEST    test_fp0_conv on xtensa
    TEST    test_fp0_div on xtensa
    TEST    test_fp0_sqrt on xtensa
    TEST    test_fp1 on xtensa
    TEST    test_fp_cpenable on xtensa
    TEST    test_interrupt on xtensa
    TEST    test_load_store on xtensa
  qemu-system-xtensa: Some ROM regions are overlapping
  These ROM regions might have been loaded by direct user request or by def=
ault.
  They could be BIOS/firmware images, a guest kernel, initrd or some other =
file loaded into guest memory.
  Check whether you intended to load all this guest code, and whether it ha=
s been built to load to the correct addresses.

  The following two regions overlap (in the memory address space):
    test_load_store ELF program header segment 1 (addresses 0x0000000000001=
000 - 0x0000000000001f26)
    test_load_store ELF program header segment 2 (addresses 0x0000000000001=
ab8 - 0x0000000000001ab8)
  make[1]: *** [Makefile:187: run-test_load_store] Error 1
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:56: run-tcg-te=
sts-xtensa-softmmu] Error 2

> ---
>  include/hw/elf_ops.h | 71 +++++++++++++++++++++++---------------------
>  1 file changed, 37 insertions(+), 34 deletions(-)
>
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 9c35d1b9da..3e966ddd5a 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -427,6 +427,16 @@ static ssize_t glue(load_elf, SZ)(const char *name, =
int fd,
>              file_size =3D ph->p_filesz; /* Size of the allocated data */
>              data_offset =3D ph->p_offset; /* Offset where the data is lo=
cated */
>=20=20
> +            /*
> +             * Some ELF files really do have segments of zero size;
> +             * just ignore them rather than trying to set the wrong addr,
> +             * or create empty ROM blobs, because the zero-length blob c=
an
> +             * falsely trigger the overlapping-ROM-blobs check.
> +             */
> +            if (mem_size =3D=3D 0) {
> +                continue;
> +            }
> +
>              if (file_size > 0) {
>                  if (g_mapped_file_get_length(mapped_file) <
>                      file_size + data_offset) {
> @@ -530,45 +540,38 @@ static ssize_t glue(load_elf, SZ)(const char *name,=
 int fd,
>                  *pentry =3D ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
>              }
>=20=20
> -            /* Some ELF files really do have segments of zero size;
> -             * just ignore them rather than trying to create empty
> -             * ROM blobs, because the zero-length blob can falsely
> -             * trigger the overlapping-ROM-blobs check.
> -             */
> -            if (mem_size !=3D 0) {
> -                if (load_rom) {
> -                    g_autofree char *label =3D
> -                        g_strdup_printf("%s ELF program header segment %=
d",
> -                                        name, i);
> +            if (load_rom) {
> +                g_autofree char *label =3D
> +                    g_strdup_printf("%s ELF program header segment %d",
> +                                    name, i);
>=20=20
> -                    /*
> -                     * rom_add_elf_program() takes its own reference to
> -                     * 'mapped_file'.
> -                     */
> -                    rom_add_elf_program(label, mapped_file, data, file_s=
ize,
> -                                        mem_size, addr, as);
> -                } else {
> -                    MemTxResult res;
> +                /*
> +                 * rom_add_elf_program() takes its own reference to
> +                 * 'mapped_file'.
> +                 */
> +                rom_add_elf_program(label, mapped_file, data, file_size,
> +                                    mem_size, addr, as);
> +            } else {
> +                MemTxResult res;
>=20=20
> -                    res =3D address_space_write(as ? as : &address_space=
_memory,
> -                                              addr, MEMTXATTRS_UNSPECIFI=
ED,
> -                                              data, file_size);
> +                res =3D address_space_write(as ? as : &address_space_mem=
ory,
> +                                          addr, MEMTXATTRS_UNSPECIFIED,
> +                                          data, file_size);
> +                if (res !=3D MEMTX_OK) {
> +                    goto fail;
> +                }
> +                /*
> +                 * We need to zero'ify the space that is not copied
> +                 * from file
> +                 */
> +                if (file_size < mem_size) {
> +                    res =3D address_space_set(as ? as : &address_space_m=
emory,
> +                                            addr + file_size, 0,
> +                                            mem_size - file_size,
> +                                            MEMTXATTRS_UNSPECIFIED);
>                      if (res !=3D MEMTX_OK) {
>                          goto fail;
>                      }
> -                    /*
> -                     * We need to zero'ify the space that is not copied
> -                     * from file
> -                     */
> -                    if (file_size < mem_size) {
> -                        res =3D address_space_set(as ? as : &address_spa=
ce_memory,
> -                                                addr + file_size, 0,
> -                                                mem_size - file_size,
> -                                                MEMTXATTRS_UNSPECIFIED);
> -                        if (res !=3D MEMTX_OK) {
> -                            goto fail;
> -                        }
> -                    }
>                  }
>              }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
