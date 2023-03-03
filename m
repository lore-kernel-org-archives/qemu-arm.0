Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1140966ejc;
        Fri, 3 Mar 2023 06:42:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9kSyEWPcZAgDJDPYYhmyOg0rnxJlNaemRt2VhZt3aJWDD61XV8Dp4eTL+YkvNtgE8jD2EW
X-Received: by 2002:a05:6871:546:b0:172:29ce:f7ee with SMTP id t6-20020a056871054600b0017229cef7eemr1063182oal.43.1677854533701;
        Fri, 03 Mar 2023 06:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677854533; cv=none;
        d=google.com; s=arc-20160816;
        b=NpK6Q8ZoHJz9WyrJVMAYuA+IHkXd2PcHxbL7Z6qwXMiQyKG7rmytJj9NIUKeELawlk
         eV3xoOlaL/fSg2hrOXf1aMhmt3zZrvc4sDn7rG+8Shh3L9KHXuDCbxP71880G2vA6bDH
         nUR9FhnCXoCTpa+1m/M0xiZTsfktgUesKAZrx/tQW/pEy/pwNU5Ietexx+VwWdY70XCX
         fDsWu/Ug7cY4VqV4vbKCYac3u7pGxCXGCpKrwQIzUkr1LPYidBA9HGG96gIDl5TkZPU2
         RpfRu6vrcdbgNsqrJa7fRqCmDEl406GHXaIaqwL2pZQzufXnj4S6ksHLW0AQpmeZ2r/0
         MWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0W4DjC/C/55MXxSDk0u68ynMzJEKeFnaJ8PybW6/rls=;
        b=jtextnLP82NdzMwk9X8w1iZrY5FEg/pgR/BYmGdPzxfJbAFgfK+uNklQ2ZHsvkoeHU
         u9VAZU/fuHnZEvWZTUFQIl4LIWD3+2BDO/r5mUCsKb7fq5LWYOkbB/fZguF29vDI7ipa
         EwOpe1OduyLKUGXOhnLRKAmbct/L9nn2H5bndAj6/xtSLwpJtVGfuSV4RQOkbv5OhqCA
         5ByDiUPdgglk78teiYFNj3VbBjT9Yik/8H1n2SU2jbqbfzhSnFtcEJ+C0RhTYbBOa2Gq
         i/qvfJm1aT3eJGtIiBCATqmBgrin38pXDsAv0GqFmMgPz3zpIK7C5Ea6bWFN/McZkeew
         7o9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bfSIhSaY;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id z5-20020a544585000000b0037ab610638bsi2086447oib.220.2023.03.03.06.42.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2023 06:42:13 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bfSIhSaY;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BEE16183C;
	Fri,  3 Mar 2023 14:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0301C433EF;
	Fri,  3 Mar 2023 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677854532;
	bh=0JM10F5PMODKCvEmazXYPgxh7xrkgs21jXZOuwT5VdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bfSIhSaYKk4H2IvHZ2P8IwqynUsNtVLU0+qrAwQfNTkJyEul50x541XZSx737XbQG
	 zioogvuxxOKJuZw1AaToRpVV/uBldT96uvRlnpeU235ilrLbjYwX2/Y8OhbGngx9fz
	 +Q+nOpc4YJ2BRRfIx+rB2ht/JjVm1Ym5y8h5fIvgDecxQ03yTCOtl/0SVbzdMj5Iq9
	 TS+2OWzcKh7QLbrGBdFGin6GA7HrCzOSOEi5RWH/llGCiyvq3HJwpMdP5027UF59C/
	 6i1jR1a0FOAtuqhkWmki0+dwgmGB/c42fwEYRUg60IlZKIzme1JkANz6hj5alKvTUY
	 5sGc888iGLcOA==
Received: by mail-lf1-f47.google.com with SMTP id i28so3968748lfv.0;
        Fri, 03 Mar 2023 06:42:12 -0800 (PST)
X-Gm-Message-State: AO0yUKX77z2nchqLE81tcCNMeBLi7OvhFk7WPX55RtUFNu74OF1p8cHW
	cjvRRDSk/2QVWrrzAE2qmtxyHC9ezyuh/u7hTBM=
X-Received: by 2002:ac2:54b9:0:b0:4d8:62e5:4f66 with SMTP id
 w25-20020ac254b9000000b004d862e54f66mr710260lfk.7.1677854530770; Fri, 03 Mar
 2023 06:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20230223105308.559632-1-ardb@kernel.org> <CAFEAcA8Nd+Eq8iGGSLgzoOAXB_GoumETKZMnSEz6cBa7ZOfSWw@mail.gmail.com>
In-Reply-To: <CAFEAcA8Nd+Eq8iGGSLgzoOAXB_GoumETKZMnSEz6cBa7ZOfSWw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 3 Mar 2023 15:41:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFPdL-zMnsrwg-MH9-AP8oHMJMJ_GPDxfr17RwmWj2sJg@mail.gmail.com>
Message-ID: <CAMj1kXFPdL-zMnsrwg-MH9-AP8oHMJMJ_GPDxfr17RwmWj2sJg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw: arm: Support direct boot for Linux/arm64 EFI
 zboot images
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wtHrUTLrrDkn

On Fri, 3 Mar 2023 at 15:25, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Thu, 23 Feb 2023 at 10:53, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
> > format, using gzip compression for the payload.
> >
> > For doing EFI boot in QEMU, this is completely transparent, as the
> > firmware or bootloader will take care of this. However, for direct
> > kernel boot without firmware, we will lose the ability to boot such
> > distro kernels unless we deal with the new format directly.
> >
> > EFI zboot images contain metadata in the header regarding the placement
> > of the compressed payload inside the image, and the type of compression
> > used. This means we can wire up the existing gzip support without too
> > much hassle, by parsing the header and grabbing the payload from inside
> > the loaded zboot image.
>
> Seems reasonable to me. Any particular reason for marking the
> patch RFC ?
>

Nothing except for the fact that I contribute so rarely that I may
have violated some coding style rules inadvertently.

> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  hw/arm/boot.c       |  4 ++
> >  hw/core/loader.c    | 64 ++++++++++++++++++++
> >  include/hw/loader.h |  2 +
> >  3 files changed, 70 insertions(+)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index 3d7d11f782feb5da..dc10a0788227443e 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -924,6 +924,10 @@ static uint64_t load_aarch64_image(const char *fil=
ename, hwaddr mem_base,
> >          size =3D len;
> >      }
> >
> > +    if (unpack_efi_zboot_image(&buffer, &size)) {
> > +        return -1;
> > +    }
>
> It seems a bit odd that we will now accept a gzipped file, unzip
> it and then look inside it for the EFI zboot image that tells us
> to do a second unzip step. Is that intentional/useful?

No and no.

> If not, probably better to do something like "if this is an
> EFI zboot image, load-and-decompress, otherwise if a plain gzipped
> file, load-and-decompress, otherwise assume a raw file".
>
> > +
> >      /* check the arm64 magic header value -- very old kernels may not =
have it */
> >      if (size > ARM64_MAGIC_OFFSET + 4 &&
> >          memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) =3D=3D 0) {
> > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > index 173f8f67f6e3e79c..7e7f49261a309012 100644
> > --- a/hw/core/loader.c
> > +++ b/hw/core/loader.c
> > @@ -857,6 +857,70 @@ ssize_t load_image_gzipped(const char *filename, h=
waddr addr, uint64_t max_sz)
> >      return bytes;
> >  }
>
> I assume there's a spec somewhere that defines the file format;
> this would be a good place for a comment giving a reference to it
> (URL, document name, etc).
>

It is de facto defined by the Linux kernel's EFI stub - I can link to
the right file here

> > +// The Linux header magic number for a EFI PE/COFF
> > +// image targetting an unspecified architecture.
> > +#define LINUX_EFI_PE_MAGIC        "\xcd\x23\x82\x81"
> > +
> > +struct linux_efi_zboot_header {
> > +    uint8_t     msdos_magic[4];         // PE/COFF 'MZ' magic number
> > +    uint8_t     zimg[4];                // "zimg" for Linux EFI zboot =
images
> > +    uint32_t    payload_offset;         // LE offset to the compressed=
 payload
> > +    uint32_t    payload_size;           // LE size of the compressed p=
ayload
> > +    uint8_t     reserved[8];
> > +    char        compression_type[32];   // Compression type, e.g., "gz=
ip"
> > +    uint8_t     linux_magic[4];         // Linux header magic
> > +    uint32_t    pe_header_offset;       // LE offset to the PE header
> > +};
>
> QEMU coding standard doesn't use '//' style comments.
>

OK

> > +
> > +/*
> > + * Check whether *buffer points to a Linux EFI zboot image in memory.
> > + *
> > + * If it does, attempt to decompress it to a new buffer, and free the =
old one.
> > + * If any of this fails, return an error to the caller.
> > + *
> > + * If the image is not a Linux EFI zboot image, do nothing and return =
success.
> > + */
> > +int unpack_efi_zboot_image(uint8_t **buffer, int *size)
> > +{
> > +    const struct linux_efi_zboot_header *header;
> > +    uint8_t *data =3D NULL;
> > +    ssize_t bytes;
> > +
> > +    /* ignore if this is too small to be a EFI zboot image */
> > +    if (*size < sizeof(*header)) {
> > +        return 0;
> > +    }
> > +
> > +    header =3D (struct linux_efi_zboot_header *)*buffer;
>
> This isn't valid, because *buffer might not be properly aligned.
> You can deal with that by defining your uint32_t fields to be uint8_t[]
> and accessing the contents via ldl_le_p().
>

OK

> > +
> > +    /* ignore if this is not a Linux EFI zboot image */
> > +    if (memcmp(&header->zimg, "zimg", 4) !=3D 0 ||
> > +        memcmp(&header->linux_magic, LINUX_EFI_PE_MAGIC, 4) !=3D 0) {
>
> Do we not care about checking the msdos_magic[] ?
>

We could check it as well, sure, although LINUX_EFI_PE_MAGIC implies
that it is a PE/COFF image so it would be more of a sanity check.

> > +        return 0;
> > +    }
> > +
> > +    if (strncmp(header->compression_type, "gzip", 4) !=3D 0) {
>
> Is this field supposed to be NUL-terminated? If I am not confused
> about strncmp(), I think this is comparing only the first 4
> characters and so would match both "gzip" and "gzip-but-not-really".
>

We've already checked the header size, so I suppose a plain strcmp()
is fine, with one argument being a literal NUL terminated string.

> > +        fprintf(stderr, "unable to handle EFI zboot image with \"%s\" =
compression\n",
> > +                header->compression_type);
>
> This assumes the field is NUL-terminated and will do something
> silly if fed a file where it is not.
>

It should be, but I can limit it in the printf() i suppose - will fix.

> > +        return -1;
> > +    }
> > +
> > +    data =3D g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
> > +    bytes =3D gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES,
> > +                   *buffer + le32_to_cpu(header->payload_offset),
> > +                   le32_to_cpu(header->payload_size));
>
> I think we should bounds-check that the payload offset and size
> are actually all within the input buffer first.
>

Good point.

> > +    if (bytes < 0) {
> > +        fprintf(stderr, "failed to decompress EFI zboot image\n");
> > +        g_free(data);
> > +        return -1;
> > +    }
> > +
> > +    g_free(*buffer);
> > +    *buffer =3D g_realloc(data, bytes);
> > +    *size =3D bytes;
> > +    return 0;
> > +}
> > +
> >  /*
> >   * Functions for reboot-persistent memory regions.
> >   *  - used for vga bios and option roms.
> > diff --git a/include/hw/loader.h b/include/hw/loader.h
> > index 70248e0da77908c1..d1092c8bfbd903c7 100644
> > --- a/include/hw/loader.h
> > +++ b/include/hw/loader.h
> > @@ -86,6 +86,8 @@ ssize_t load_image_gzipped_buffer(const char *filenam=
e, uint64_t max_sz,
> >                                    uint8_t **buffer);
> >  ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t=
 max_sz);
> >
> > +int unpack_efi_zboot_image(uint8_t **buffer, int *size);
> > +
>
> New global functions should have a doc-comment format comment
> describing them in the header file. (This is one of those areas where
> we have a bunch of legacy code that doesn't conform to our ideals and
> are trying to gradually ratchet up by imposing a standard on new
> contributions.)
>

Fair enough.
