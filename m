Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1120865ejc;
        Fri, 3 Mar 2023 06:25:35 -0800 (PST)
X-Received: by 2002:a05:6a21:3284:b0:cd:1709:8d57 with SMTP id yt4-20020a056a21328400b000cd17098d57mr2778535pzb.1.1677853535521;
        Fri, 03 Mar 2023 06:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677853535; cv=none;
        d=google.com; s=arc-20160816;
        b=O2NKlmQLxNefuBIIuydfOlq8D4ja8rlZicEpZwf4uOkZKcRpCTznQQSv9O7Um6/Qhr
         C8eJSwWjRXJUyaz4VhCiXeStdTKU9wsZS/iXBHxRjFYRZHWdafP0a4lqp8NmKbyooSDD
         GDXxyszXUraLDgoWo9hLpq8pD70D41N6GAT9LxI1gtWIJIbkwR18+0EVxh+4D5MuMWGl
         +fPrF+40oPbfifpFmMl3IJIE9mLOVkWb3G7HlXKcj5E1+oydGivM8tUdkQqtUfpzv0dv
         C1AQZtZQjV5PYw+j0ORZNgQwMi+ZaBy/mvd1cTS0t2Q/DtM5m85TL8nGHoJasU4e5vfb
         UmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wreAfFH2n1KmfuYHmZW0lu1AFMuh49zlqxQjUTSrbL4=;
        b=gcwFMhEN+aRIYnV/J3OtPk/OYMdvfjVV0JVSwQ1xAXQ1F+Ox4Tx+E5qIkIpR8b7ixq
         WHC4zaUGkGwxA3k7sxHGBa0RrcU++bCc4rlHz+FZZMCiUVWV4f8PvNmLgZ4Wut5+I8KQ
         /aDT6u0oQRpF5xQzNCXr2Zo6byI8tIMCf1ctsMRS3i9ENbuMJ/TLe7Zzp/07eOZ8z5Vt
         hKh2eOhd0uPAY9wJWJcXJE544TprWexta621anp9571sQAvDu55xpOvL/55JJ2JjgI//
         aD7Ns4+P82wtAjik8C8nj2LNEGtXdl8m1+CdC/3A4szODd8s1UnOOahUbnh9AKr1hlFO
         /8PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pb5l3OBJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o21-20020a63e355000000b004fbb86c7dedsor980978pgj.16.2023.03.03.06.25.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 06:25:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pb5l3OBJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677853535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wreAfFH2n1KmfuYHmZW0lu1AFMuh49zlqxQjUTSrbL4=;
        b=pb5l3OBJ4/VrxZuYj5sdgTGscya20VlIbl3uhfXBO3PFUDLNuz2pkNio4LA/G89UrP
         mqBo9XI7DnG4/4hpcy6wL7hFDameeM1anJKn8TCIqrVvPj0bfTVfariCWdWwL+PWIaZf
         e9P0mOD1QcZcO+HTKPZNcBc/emzSVHTxUCBBXYshcWfLxIh+Nmnyxm28Cmxutnyu+ecZ
         KznupPRW1y37O00kjEFWgvdNeCmZ2+ca0TsnCcfpsZjSva68p6m3absYOBVrAdTjfFop
         m0bQLz7QJCvHtYkqcJm6PCNtBM0dVoOpPV9i2XSdwzUyBDqqvkBPO63RGCcbNHVZyaKY
         CWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677853535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wreAfFH2n1KmfuYHmZW0lu1AFMuh49zlqxQjUTSrbL4=;
        b=jSCybaltW0Z0JNd2bXrVS3WWb4ijedGrzzWDyL/eL3YE9KksORmNze+Pck2ykYUDoH
         j5rFjFkF/Zb6ag/pTzMpomIzViHqFJnjqX6Ox/9/0Fdz6zTIDvPx/dcQ9LOHl6bu4Ty4
         YqS2YQmHTiCeKggmh9h77urt1KD1pUIX6BhZdb5COAwSEG5AIMMsPIxkxmF7vgWwhm3d
         qAGaqDHPn4/AHOb+CK6HZeUP4o9NLefteVrCMDMsvedjA5dmDKcs28k8zLXguYwb2Lv2
         Cwu4BVWDLdjMBYaHqE1DRlo617ELreAUxH5sDUfASdGwXIX5cWiCTXt5HU1N0t4dh2n0
         IqtQ==
X-Gm-Message-State: AO0yUKV/mrlWmK1+gsriBBx1d25LkWvh8pPn+Aoxbse+IIJwzLrqchHn
	+eZGSmaPq1sImejJjXbMOEcBRFzAC0lMzVTZOnXlcXmo
X-Google-Smtp-Source: AK7set+aFBMdAQ1d//x474Hx4EVA9ORGWoauSD+kgab8MPzWbHq0jpAVJIYDK2LG8vFS1oINcOSLiPEJG51muaMrasc=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id o12-20020a63a80c000000b0050300a7d244mr555119pgf.9.1677853534929;
 Fri, 03 Mar 2023 06:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20230223105308.559632-1-ardb@kernel.org>
In-Reply-To: <20230223105308.559632-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:25:23 +0000
Message-ID: <CAFEAcA8Nd+Eq8iGGSLgzoOAXB_GoumETKZMnSEz6cBa7ZOfSWw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw: arm: Support direct boot for Linux/arm64 EFI
 zboot images
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AqsWYT3maiIt

On Thu, 23 Feb 2023 at 10:53, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
> format, using gzip compression for the payload.
>
> For doing EFI boot in QEMU, this is completely transparent, as the
> firmware or bootloader will take care of this. However, for direct
> kernel boot without firmware, we will lose the ability to boot such
> distro kernels unless we deal with the new format directly.
>
> EFI zboot images contain metadata in the header regarding the placement
> of the compressed payload inside the image, and the type of compression
> used. This means we can wire up the existing gzip support without too
> much hassle, by parsing the header and grabbing the payload from inside
> the loaded zboot image.

Seems reasonable to me. Any particular reason for marking the
patch RFC ?

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  hw/arm/boot.c       |  4 ++
>  hw/core/loader.c    | 64 ++++++++++++++++++++
>  include/hw/loader.h |  2 +
>  3 files changed, 70 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 3d7d11f782feb5da..dc10a0788227443e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -924,6 +924,10 @@ static uint64_t load_aarch64_image(const char *filen=
ame, hwaddr mem_base,
>          size =3D len;
>      }
>
> +    if (unpack_efi_zboot_image(&buffer, &size)) {
> +        return -1;
> +    }

It seems a bit odd that we will now accept a gzipped file, unzip
it and then look inside it for the EFI zboot image that tells us
to do a second unzip step. Is that intentional/useful?
If not, probably better to do something like "if this is an
EFI zboot image, load-and-decompress, otherwise if a plain gzipped
file, load-and-decompress, otherwise assume a raw file".

> +
>      /* check the arm64 magic header value -- very old kernels may not ha=
ve it */
>      if (size > ARM64_MAGIC_OFFSET + 4 &&
>          memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) =3D=3D 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 173f8f67f6e3e79c..7e7f49261a309012 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -857,6 +857,70 @@ ssize_t load_image_gzipped(const char *filename, hwa=
ddr addr, uint64_t max_sz)
>      return bytes;
>  }

I assume there's a spec somewhere that defines the file format;
this would be a good place for a comment giving a reference to it
(URL, document name, etc).

> +// The Linux header magic number for a EFI PE/COFF
> +// image targetting an unspecified architecture.
> +#define LINUX_EFI_PE_MAGIC        "\xcd\x23\x82\x81"
> +
> +struct linux_efi_zboot_header {
> +    uint8_t     msdos_magic[4];         // PE/COFF 'MZ' magic number
> +    uint8_t     zimg[4];                // "zimg" for Linux EFI zboot im=
ages
> +    uint32_t    payload_offset;         // LE offset to the compressed p=
ayload
> +    uint32_t    payload_size;           // LE size of the compressed pay=
load
> +    uint8_t     reserved[8];
> +    char        compression_type[32];   // Compression type, e.g., "gzip=
"
> +    uint8_t     linux_magic[4];         // Linux header magic
> +    uint32_t    pe_header_offset;       // LE offset to the PE header
> +};

QEMU coding standard doesn't use '//' style comments.

> +
> +/*
> + * Check whether *buffer points to a Linux EFI zboot image in memory.
> + *
> + * If it does, attempt to decompress it to a new buffer, and free the ol=
d one.
> + * If any of this fails, return an error to the caller.
> + *
> + * If the image is not a Linux EFI zboot image, do nothing and return su=
ccess.
> + */
> +int unpack_efi_zboot_image(uint8_t **buffer, int *size)
> +{
> +    const struct linux_efi_zboot_header *header;
> +    uint8_t *data =3D NULL;
> +    ssize_t bytes;
> +
> +    /* ignore if this is too small to be a EFI zboot image */
> +    if (*size < sizeof(*header)) {
> +        return 0;
> +    }
> +
> +    header =3D (struct linux_efi_zboot_header *)*buffer;

This isn't valid, because *buffer might not be properly aligned.
You can deal with that by defining your uint32_t fields to be uint8_t[]
and accessing the contents via ldl_le_p().

> +
> +    /* ignore if this is not a Linux EFI zboot image */
> +    if (memcmp(&header->zimg, "zimg", 4) !=3D 0 ||
> +        memcmp(&header->linux_magic, LINUX_EFI_PE_MAGIC, 4) !=3D 0) {

Do we not care about checking the msdos_magic[] ?

> +        return 0;
> +    }
> +
> +    if (strncmp(header->compression_type, "gzip", 4) !=3D 0) {

Is this field supposed to be NUL-terminated? If I am not confused
about strncmp(), I think this is comparing only the first 4
characters and so would match both "gzip" and "gzip-but-not-really".

> +        fprintf(stderr, "unable to handle EFI zboot image with \"%s\" co=
mpression\n",
> +                header->compression_type);

This assumes the field is NUL-terminated and will do something
silly if fed a file where it is not.

> +        return -1;
> +    }
> +
> +    data =3D g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
> +    bytes =3D gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES,
> +                   *buffer + le32_to_cpu(header->payload_offset),
> +                   le32_to_cpu(header->payload_size));

I think we should bounds-check that the payload offset and size
are actually all within the input buffer first.

> +    if (bytes < 0) {
> +        fprintf(stderr, "failed to decompress EFI zboot image\n");
> +        g_free(data);
> +        return -1;
> +    }
> +
> +    g_free(*buffer);
> +    *buffer =3D g_realloc(data, bytes);
> +    *size =3D bytes;
> +    return 0;
> +}
> +
>  /*
>   * Functions for reboot-persistent memory regions.
>   *  - used for vga bios and option roms.
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 70248e0da77908c1..d1092c8bfbd903c7 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -86,6 +86,8 @@ ssize_t load_image_gzipped_buffer(const char *filename,=
 uint64_t max_sz,
>                                    uint8_t **buffer);
>  ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t m=
ax_sz);
>
> +int unpack_efi_zboot_image(uint8_t **buffer, int *size);
> +

New global functions should have a doc-comment format comment
describing them in the header file. (This is one of those areas where
we have a bunch of legacy code that doesn't conform to our ideals and
are trying to gradually ratchet up by imposing a standard on new
contributions.)

thanks
-- PMM
