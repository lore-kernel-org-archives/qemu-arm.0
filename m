Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp671226njc;
        Thu, 8 Aug 2024 14:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6ZZqfe1/JSMVQXLkaoRxS0ilO8PAWNYZOGFWRzg9zsJOqpiqzWYbzO0niG4J+b5Xp3XXB0fTsC+wtphvE64RE2Ir7qv7P
X-Google-Smtp-Source: AGHT+IHe0HSNzgSIpLWVZnqbDdBufivNP2CtoiUKa9PstAOZuVwkuUmvcFQq4+1nlUp/O2/DxMKP
X-Received: by 2002:a05:6122:3682:b0:4f6:b094:80aa with SMTP id 71dfb90a1353d-4f9027bbbf3mr4306408e0c.9.1723154214968;
        Thu, 08 Aug 2024 14:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723154214; cv=none;
        d=google.com; s=arc-20160816;
        b=BI0wHwjhbMbn2oB8TzseO93acXecW8v3LOxeUuCm15wuWT3LmJaArtUkAA+9Vsz22Q
         zKbsfFLmbo77oqk0Pz5G/n/hFDsWciEU6YMzMSaFbfBkJeXtjEH5JYyy9+QuOfy+D5i+
         3/Nvti+bvzSYsYHrLLkAONyvI2qOhUbs6fRDObdXtvd9/g9+AD5l1heKlLT4szAlvSSL
         1vEFIIVsyFUSy2lGtuavVG8hzyYm6iTEgQwmPFCYLKuhBQdJAb4DpHloufm9IgBMlZZc
         WLLEyo0Cw4J+Kw2n2xuxGdmwY94Z4ZEEGz7a4zcgIYZCv31YljA0COfbc3gJsjkZF/Eu
         x3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JKSkilWUIC+jCq6c4SorERinI9rQXtTtfoHMqRlGGy8=;
        fh=qbAfheFy+h2pkdQXzU7yZM5jfPp0YhY4xROwBCuFl0k=;
        b=SxHqdPDqTAr9ezCDj9mzLqyXOalQ2FJYkJajKa0tnz5ljgF/o3yFjy1PSHYxLunHsF
         3rBhS8SP8uCDEu59hwhyFOdOnN1g4jeCSelfYkPes1kgE53Y9wOAZf2jxAfV1pfY2LjR
         Mdfy3ZiIdLO2XBq9ftsf2jYr9gr9NBxZ7X7HE7wT/iRFDKo/b96KptBxynuAMRtSDXQZ
         7F2KqQ1e8Hca4esQX390mr8xsO7148Y1KJ7vX2QWFG5c0ZqfRt89N9LfbAJrbDUMj9D+
         C9M15MknkmQmVI2wu/V+ZNn8VUhwEQYcUYMOde/2NdbG6YgFioV6eycfT2IvplIRPxfH
         AsWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NnU2Q5vw;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a378873c3csi521305685a.758.2024.08.08.14.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 14:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NnU2Q5vw;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723154214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKSkilWUIC+jCq6c4SorERinI9rQXtTtfoHMqRlGGy8=;
	b=NnU2Q5vwf6vIRrczS/EiOjzDwoSdXcXNabnid+WgBsa3PrajHBZ3SjwwwGKTOw1rB44/eN
	vOLHc3h0dQmF6xiKY8VHrebAziiuPW9hWBQwDxvZdKCYCLkgm7Q/C0uMITVM59dHBpf2bG
	rcJH9K2S5eNuN5m4HgVB0YYk8LIs0bc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-noD9W8VGM4avuPIXQGPfog-1; Thu, 08 Aug 2024 17:56:52 -0400
X-MC-Unique: noD9W8VGM4avuPIXQGPfog-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d1989d103eso1888503a91.2
        for <alex.bennee@linaro.org>; Thu, 08 Aug 2024 14:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723154211; x=1723759011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKSkilWUIC+jCq6c4SorERinI9rQXtTtfoHMqRlGGy8=;
        b=tsAUJKTrE5Lqr82E55bMJuaY8hvHceYeSZbkEX+wZxX4SoxnkaoPy22t2ZRJuYvkyj
         k+MQOGoTzCRzQ786yvDxo6poE1sn7h5iM0QiEYuKmDe6s8o3PimcSv2iIgk4xKFa7Hff
         G+xaBMPLif8S7l8BVNMyq2Y2tnXvYNTnp4QlZTAnSOL9tKGR5xteBmzmxUsM7RM76O8N
         m128Jwm6Be9Y1t00YZFYMi3Tif6N7gdiGKIwRa29Sz+AbjxOJa8QXljCgtT5rkQfJwk3
         B5Kp3jWBfFv2gtRJserF3uH2cWXRXwsScF+Y3sgPjRXSSOKzEbimVpYHHX9Agpgv+3Cn
         0WEA==
X-Forwarded-Encrypted: i=1; AJvYcCXj4Nl8DEzVzE2QQnLuTE8vhYpqa0DcJyQ/fIVTIv51QlnW5DIZYGJLdpzrA2Cah2UzJn1p3uoUHOYaJaTjeEEWqy45q1ct
X-Gm-Message-State: AOJu0Yz6Eutkhx3Gl1doZGVN/gycJLKLv+0E6RuTzR2lz/ESZ0CT+w7Z
	zDB1KzuQ6i2Svl9obz6vYFCExJsGMpe4bwKoMxgy7R2kQG0Ry55BYIn5s9VYfRXrt9g42k5StIh
	HX8jWGt1HsjUNIV4x/Ly1iKcIXqr6uMiif//XDTrPcQPm+FQNXCNWRl+4Ko8qxf/R4Bf2/YnfdC
	+7D9AyW0+BjsamnxwSF3rDQYfV7Eml
X-Received: by 2002:a17:90a:ba8a:b0:2c9:63ef:95b9 with SMTP id 98e67ed59e1d1-2d1c33b632emr3985263a91.14.1723154211235;
        Thu, 08 Aug 2024 14:56:51 -0700 (PDT)
X-Received: by 2002:a17:90a:ba8a:b0:2c9:63ef:95b9 with SMTP id
 98e67ed59e1d1-2d1c33b632emr3985228a91.14.1723154210551; Thu, 08 Aug 2024
 14:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-4-tavip@google.com>
In-Reply-To: <20240805201719.2345596-4-tavip@google.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 8 Aug 2024 17:56:38 -0400
Message-ID: <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	peter.maydell@linaro.org, marcandre.lureau@redhat.com, alistair@alistair23.me, 
	berrange@redhat.com, philmd@linaro.org, crosa@redhat.com, bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009d12d6061f331ae1"
X-TUID: TgiIAxjJxCxE

--0000000000009d12d6061f331ae1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 4:17=E2=80=AFPM Octavian Purdila <tavip@google.com> =
wrote:

> From: Stefan Stanacar <stefanst@google.com>
>
> From: Stefan Stanacar <stefanst@google.com>
>
> The CMSIS System View Description format(CMSIS-SVD) is an XML based
> description of Arm Cortex-M microcontrollers provided and maintained
> by sillicon vendors. It includes details such as peripherals registers
> (down to bitfields), peripheral register block addresses, reset
> values, etc.
>
> This script uses this information to create header files that makes it
> easier to emulate peripherals.
>
> The script can be used to create either peripheral specific headers or
> board / system specific information. The script generated headers are
> similar to the SVDConv utility.
>
> Peripheral specific headers contains information such as register
> layout, register names and reset values for registers:
>
>   typedef struct {
>     ...
>     union {
>       uint32_t PSELID;              /* 0x00000FF8 Peripheral Select and
>                                      * Flexcomm module ID */
>       struct {
>         uint32_t PERSEL : 3;        /* [2..0] Peripheral Select */
>         uint32_t LOCK : 1;          /* [3..3] Lock the peripheral select =
*/
>         uint32_t USARTPRESENT : 1;  /* [4..4] USART present indicator */
>         uint32_t SPIPRESENT : 1;    /* [5..5] SPI present indicator */
>         uint32_t I2CPRESENT : 1;    /* [6..6] I2C present indicator */
>         uint32_t I2SPRESENT : 1;    /* [7..7] I2S Present */
>         uint32_t : 4;
>         uint32_t ID : 20;           /* [31..12] Flexcomm ID */
>       } PSELID_b;
>     };
>     ...
>   } FLEXCOMM_Type;                  /* Size =3D 4096 (0x1000) */
>
>   #define FLEXCOMM_PSELID_PERSEL_Pos (0UL)
>   #define FLEXCOMM_PSELID_PERSEL_Msk (0x7UL)
>   #define FLEXCOMM_PSELID_LOCK_Pos (3UL)
>   #define FLEXCOMM_PSELID_LOCK_Msk (0x8UL)
>   ...
>
>   typedef enum {                /* FLEXCOMM_PSELID_LOCK */
>     /* Peripheral select can be changed by software. */
>     FLEXCOMM_PSELID_LOCK_UNLOCKED =3D 0,
>     /* Peripheral select is locked and cannot be changed until this
>      * Flexcomm module or the entire device is reset. */
>     FLEXCOMM_PSELID_LOCK_LOCKED =3D 1,
>   } FLEXCOMM_PSELID_LOCK_Enum;
>   ...
>
>   #define FLEXCOMM_REGISTER_NAMES_ARRAY(_name) \
>     const char *_name[sizeof(FLEXCOMM_Type)] =3D { \
>         [4088 ... 4091] =3D "PSELID", \
>         [4092 ... 4095] =3D "PID", \
>     }
>
> Board specific headers contains information about peripheral base
> register addresses.
>
> Signed-off-by: Stefan Stanacar <stefanst@google.com>
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>  configure                 |   2 +-
>  meson.build               |   4 +
>  python/setup.cfg          |   1 +
>  python/tests/minreqs.txt  |   3 +
>  pythondeps.toml           |   3 +
>  scripts/svd-gen-header.py | 342 ++++++++++++++++++++++++++++++++++++++
>  6 files changed, 354 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/svd-gen-header.py
>
> diff --git a/configure b/configure
> index 5ad1674ca5..811bfa5d54 100755
> --- a/configure
> +++ b/configure
> @@ -956,7 +956,7 @@ mkvenv=3D"$python
> ${source_path}/python/scripts/mkvenv.py"
>  # Finish preparing the virtual environment using vendored .whl files
>
>  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
> -     ${source_path}/pythondeps.toml meson || exit 1
> +     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
>

I haven't read the rest of this series; I'm chiming in solely from the
build/python maintainer angle. Do we *always* need pysvd, no matter how
QEMU was configured? Adding it to the meson line here is a very big hammer.

If not, consider looking at how sphinx (the "docs" group) is only
conditionally installed into the configure venv and mimic that using the
appropriate configure flags that necessitate the availability of pyvsd for
the QEMU build.

We also need to provide a way for pysvd to be available offline; some
packages are available via distro libs and if this package is available for
every distro we officially support, that's sufficient (but requires updates
to our various docker and VM test configuration files to add the new
dependency). Otherwise, like we do for meson, we need to vendor the wheel
in the tree so offline tarball builds will continue to work.

It looks like pysvd is a pure python package with no dependencies, so it
should be OK to vendor it in qemu.git/python/wheels/ - look at
qemu.git/python/scripts/vendor.py and consider updating and running this
script.

(The real blocker here is that RPM builds are performed offline and
dependencies that cannot be satisfied via rpm can't be added through pip.
We need any one of these to be true: (A) pyvsd is available (of a
sufficient version) in all distro repositories we target; (B) This build
feature is conditional and nobody minds if it never gets enabled for RPM
builds; (C) The package can be vendored.)

~~js

That said, you might be the first person I've seen outside of Paolo and I
to brave mucking around with the python build venv. You deserve a bravery
sticker :)


>  # At this point, we expect Meson to be installed and available.
>  # We expect mkvenv or pip to have created pyvenv/bin/meson for us.
> diff --git a/meson.build b/meson.build
> index ec59effca2..dee587483b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3235,6 +3235,10 @@ tracetool_depends =3D files(
>    'scripts/tracetool/vcpu.py'
>  )
>
> +svd_gen_header =3D [
> +  python, files('scripts/svd-gen-header.py')
> +]
> +
>  qemu_version_cmd =3D [find_program('scripts/qemu-version.sh'),
>                      meson.current_source_dir(),
>                      get_option('pkgversion'), meson.project_version()]
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 48668609d3..bc830c541a 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -45,6 +45,7 @@ devel =3D
>      urwid >=3D 2.1.2
>      urwid-readline >=3D 0.13
>      Pygments >=3D 2.9.0
> +    pysvd >=3D 0.2.3
>
>  # Provides qom-fuse functionality
>  fuse =3D
> diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
> index a3f423efd8..7993fcd23c 100644
> --- a/python/tests/minreqs.txt
> +++ b/python/tests/minreqs.txt
> @@ -22,6 +22,9 @@ distlib=3D=3D0.3.6
>  # Dependencies for FUSE support for qom-fuse
>  fusepy=3D=3D2.0.4
>
> +# Dependencies for svd-gen-regs
> +pysvd=3D=3D0.2.3
> +
>  # Test-runners, utilities, etc.
>  avocado-framework=3D=3D90.0
>
> diff --git a/pythondeps.toml b/pythondeps.toml
> index 9c16602d30..8416b17650 100644
> --- a/pythondeps.toml
> +++ b/pythondeps.toml
> @@ -32,3 +32,6 @@ sphinx_rtd_theme =3D { accepted =3D ">=3D0.5", installe=
d =3D
> "1.1.1" }
>  # avocado-framework, for example right now the limit is 92.x.
>  avocado-framework =3D { accepted =3D "(>=3D88.1, <93.0)", installed =3D =
"88.1",
> canary =3D "avocado" }
>  pycdlib =3D { accepted =3D ">=3D1.11.0" }
> +
> +[svd-gen-header]
> +pysvd =3D { accepted =3D ">=3D0.2.3.", installed =3D "0.2.3" }
> diff --git a/scripts/svd-gen-header.py b/scripts/svd-gen-header.py
> new file mode 100755
> index 0000000000..ab8cb4b665
> --- /dev/null
> +++ b/scripts/svd-gen-header.py
> @@ -0,0 +1,342 @@
> +#!/usr/bin/env python3
> +
> +# Copyright 2024 Google LLC
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> +# See the COPYING file in the top-level directory.
> +#
> +# Use this script to generate a C header file from an SVD xml
> +#
> +# Two mode of operations are supported: peripheral and system.
> +#
> +# When running in peripheral mode a header for a specific peripheral
> +# is going to be generated. It will define a type and structure with
> +# all of the available registers at the bitfield level. An array that
> +# contains the reigster names indexed by address is also going to be
> +# generated as well as a function to initialize registers to their
> +# reset values.
> +#
> +# Invocation example:
> +#
> +# svd_gen_header -i MIMXRT595S_cm33.xml -o flexcomm.h -p FLEXCOMM0 -t
> FLEXCOMM
> +#
> +# When running in system mode a header for a specific system /
> +# platform will be generated. It will define register base addresses
> +# and interrupt numbers for selected peripherals.
> +#
> +# Invocation example:
> +#
> +# svd_gen_header -i MIMXRT595S_cm33.xml -o rt500.h -s RT500 -p FLEXCOMM0=
 \
> +#                -p CLKCTL0 -p CLKCTL1
> +#
> +
> +import argparse
> +import datetime
> +import re
> +import os
> +import sys
> +import xml.etree.ElementTree
> +import pysvd
> +
> +data_type_by_bits =3D {
> +    8: "uint8_t",
> +    16: "uint16_t",
> +    32: "uint32_t",
> +}
> +
> +
> +def get_register_array_name_and_size(register):
> +    """Return register name and register array size.
> +
> +    The SVD can define register arrays and pysvd encodes the whole set
> +    as as regular register with their name prepended by [<array size>].
> +
> +    Returns a tuple with the register name and the size of the array or
> +    zero if this is not a register set.
> +
> +    """
> +
> +    split =3D re.split(r"[\[\]]", register.name)
> +    return (split[0], int(split[1]) if len(split) > 1 else 0)
> +
> +
> +def generate_register(register):
> +    """Generate register data.
> +
> +    This include a field for accessing the full 32bits as we as
> +    bitfield based register fields.
> +
> +    """
> +
> +    data_type =3D data_type_by_bits[register.size]
> +
> +    out =3D f"    /* 0x{register.addressOffset:08X} {register.descriptio=
n}
> */\n"
> +    out +=3D "    union {\n"
> +    out +=3D f"        {data_type} {register.name};\n"
> +    out +=3D "        struct {\n"
> +
> +    fields =3D sorted(register.fields, key=3Dlambda field: field.bitOffs=
et)
> +    last_msb =3D -1
> +    for field in fields:
> +        reserve_bits =3D 0
> +        lsb =3D field.bitOffset
> +        msb =3D field.bitWidth + lsb - 1
> +
> +        if last_msb =3D=3D -1 and lsb > 0:
> +            reserve_bits =3D lsb
> +
> +        if last_msb !=3D -1 and (lsb - last_msb) > 1:
> +            reserve_bits =3D lsb - last_msb - 1
> +
> +        if reserve_bits > 0:
> +            out +=3D f"            {data_type}:{reserve_bits};\n"
> +
> +        out +=3D f"            /* [{msb}..{lsb}] {field.description} */\=
n"
> +        out +=3D f"            {data_type} {field.name} :
> {field.bitWidth};\n"
> +
> +        last_msb =3D msb
> +
> +    if register.size - last_msb > 1:
> +        out +=3D f"            {data_type}:{register.size - last_msb -
> 1};\n"
> +
> +    reg_name, reg_array_size =3D get_register_array_name_and_size(regist=
er)
> +    if reg_array_size > 0:
> +        out +=3D f"        }} {reg_name}_b[{reg_array_size}];\n"
> +    else:
> +        out +=3D f"        }} {reg_name}_b;\n"
> +    out +=3D "    };\n\n"
> +
> +    return out
> +
> +
> +def generate_pos_and_msk_defines(name, periph):
> +    """Generate Pos and Msk defines"""
> +
> +    out =3D "\n"
> +    for reg in periph.registers:
> +        for field in reg.fields:
> +            reg_name, _ =3D get_register_array_name_and_size(reg)
> +            field_name =3D f"{name}_{reg_name}_{field.name}"
> +            out +=3D f"#define {field_name}_Pos ({field.bitOffset}UL)\n"
> +            mask =3D ((1 << field.bitWidth) - 1) << field.bitOffset
> +            out +=3D f"#define {field_name}_Msk (0x{mask:x}UL)\n"
> +
> +    return out
> +
> +
> +def generate_enum_values(name, periph):
> +    """Generate enum values"""
> +
> +    out =3D "\n"
> +    for reg in periph.registers:
> +        reg_name, _ =3D get_register_array_name_and_size(reg)
> +        for field in reg.fields:
> +            if hasattr(field, "enumeratedValues"):
> +                out +=3D "\n"
> +                out +=3D "typedef enum {\n"
> +                for enum in field.enumeratedValues.enumeratedValues:
> +                    enum_name =3D f"{name}_{reg_name}_{field.name}_{
> enum.name}"
> +                    out +=3D f"    /* {enum.description} */\n"
> +                    out +=3D f"    {enum_name} =3D {enum.value},\n"
> +                out +=3D f"}} {name}_{reg_name}_{field.name}_Enum;\n"
> +
> +    return out
> +
> +
> +def generate_register_names_array_macro(name, periph):
> +    """Generate register names array macro"""
> +
> +    out =3D f"#define {name}_REGISTER_NAMES_ARRAY(_name) \\\n"
> +    out +=3D f"    const char *_name[sizeof({name}_Type)] =3D {{ \\\n"
> +    for reg in periph.registers:
> +        reg_name, reg_array_size =3D get_register_array_name_and_size(re=
g)
> +        if reg_array_size > 0:
> +            for i in range(0, reg_array_size):
> +                start =3D reg.addressOffset + i * reg.size // 8
> +                stop =3D reg.addressOffset + (i + 1) * reg.size // 8 - 1
> +                out +=3D f'        [{start} ... {stop}] =3D "{reg_name}{=
i}",
> \\\n'
> +        else:
> +            start =3D reg.addressOffset
> +            stop =3D reg.addressOffset + reg.size // 8 - 1
> +            out +=3D f'        [{start} ... {stop}] =3D "{reg.name}", \\=
\n'
> +    out +=3D "    }\n"
> +
> +    return out
> +
> +
> +def generate_reset_registers_function(name, periph):
> +    """Generate reset registers function"""
> +
> +    out =3D "\n"
> +    fname =3D f"{name.lower()}_reset_registers"
> +    out +=3D f"static inline void {fname}({name}_Type *regs)\n"
> +    out +=3D "{\n"
> +    for reg in periph.registers:
> +        reg_name, reg_array_size =3D get_register_array_name_and_size(re=
g)
> +        if reg_array_size > 0:
> +            for i in range(0, int(reg_array_size)):
> +                out +=3D f"    regs->{reg_name}[{i}] =3D
> {hex(reg.resetValue)};\n"
> +        else:
> +            out +=3D f"    regs->{reg_name} =3D {hex(reg.resetValue)};\n=
"
> +    out +=3D "}\n"
> +
> +    return out
> +
> +
> +def generate_peripheral_header(periph, name):
> +    """Generate peripheral header
> +
> +    The following information is generated:
> +
> +    * typedef with all of the available registers and register fields,
> +    position and mask defines for register fields.
> +
> +    * enum values that encode register fields options.
> +
> +    * a macro that defines the register names indexed by the relative
> +    address of the register.
> +
> +    * a function that sets the registers to their reset values
> +
> +    """
> +
> +    out =3D f"/* {name} - {periph.description} */\n\n"
> +    out +=3D "typedef struct {\n"
> +
> +    last_reg_offset =3D 0
> +    cnt =3D 0
> +    for reg in periph.registers:
> +        reserved_words =3D 0
> +        if (reg.addressOffset - last_reg_offset) > 0:
> +            reserved_words =3D int((reg.addressOffset - last_reg_offset)=
 //
> 4)
> +            cnt +=3D 1
> +
> +        if cnt:
> +            show_count =3D cnt
> +        else:
> +            show_count =3D ""
> +
> +        if reserved_words =3D=3D 1:
> +            out +=3D f"    uint32_t RESERVED{show_count};\n\n"
> +        elif reserved_words > 1:
> +            out +=3D f"    uint32_t
> RESERVED{show_count}[{reserved_words}];\n\n"
> +
> +        out +=3D generate_register(reg)
> +        last_reg_offset =3D reg.addressOffset + reg.size // 8
> +
> +    size =3D periph.addressBlocks[0].size
> +    out +=3D f"}} {name}_Type; /* Size =3D {size} (0x{size:X}) */\n"
> +
> +    out +=3D "\n\n"
> +
> +    out +=3D generate_pos_and_msk_defines(name, periph)
> +
> +    out +=3D generate_enum_values(name, periph)
> +
> +    out +=3D generate_register_names_array_macro(name, periph)
> +
> +    out +=3D generate_reset_registers_function(name, periph)
> +
> +    return out
> +
> +
> +def get_same_class_peripherals(svd, periph):
> +    """Get a list of peripherals that are instances of the same class.""=
"
> +
> +    return [periph] + [
> +        p
> +        for p in svd.peripherals
> +        if p.derivedFrom and p.derivedFrom.name =3D=3D periph.name
> +    ]
> +
> +
> +def generate_system_header(system, svd, periph):
> +    """Generate base and irq defines for given list of peripherals"""
> +
> +    out =3D ""
> +
> +    for p in get_same_class_peripherals(svd, periph):
> +        out +=3D f"#define {system}_{p.name}_BASE 0x{p.baseAddress:X}UL\=
n"
> +    out +=3D "\n"
> +
> +    for p in get_same_class_peripherals(svd, periph):
> +        for irq in p.interrupts:
> +            out +=3D f"#define {system}_{irq.name}_IRQn 0x{irq.value}UL\=
n"
> +    out +=3D "\n"
> +
> +    return out
> +
> +
> +def main():
> +    """Script to generate C header file from an SVD file"""
> +
> +    parser =3D argparse.ArgumentParser()
> +    parser.add_argument(
> +        "-i", "--input", type=3Dstr, help=3D"Input SVD file", required=
=3DTrue
> +    )
> +    parser.add_argument(
> +        "-o", "--output", type=3Dstr, help=3D"Output .h file", required=
=3DTrue
> +    )
> +    parser.add_argument(
> +        "-p",
> +        "--peripheral",
> +        action=3D"append",
> +        help=3D"peripheral name from the SVD file",
> +        required=3DTrue,
> +    )
> +    parser.add_argument(
> +        "-t",
> +        "--type-name",
> +        type=3Dstr,
> +        help=3D"name to be used for peripheral definitions",
> +        required=3DFalse,
> +    )
> +    parser.add_argument(
> +        "-s",
> +        "--system",
> +        type=3Dstr,
> +        help=3D"name to be used for the system definitions",
> +        required=3DFalse,
> +    )
> +
> +    args =3D parser.parse_args()
> +
> +    node =3D xml.etree.ElementTree.parse(args.input).getroot()
> +    svd =3D pysvd.element.Device(node)
> +
> +    # Write license header
> +    out =3D "/*\n"
> +    license_text =3D svd.licenseText.split("\\n")
> +    for line in license_text:
> +        sline =3D f" * {line.strip()}"
> +        out +=3D f"{sline.rstrip()}\n"
> +
> +    now =3D datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
> +    out +=3D f" * @note Automatically generated by
> {os.path.basename(__file__)}"
> +    out +=3D f" on {now} UTC from {os.path.basename(args.input)}.\n"
> +    out +=3D " *\n */\n\n"
> +
> +    # Write some generic defines
> +    out +=3D "#pragma once\n\n"
> +
> +    for name in args.peripheral:
> +        periph =3D svd.find(name)
> +        if periph:
> +            if args.system:
> +                out +=3D generate_system_header(args.system, svd, periph=
)
> +            else:
> +                out +=3D generate_peripheral_header(
> +                    periph, args.type_name if args.type_name else
> periph.name
> +                )
> +        else:
> +            print(f"No such peripheral: {name}")
> +            return 1
> +
> +    with open(args.output, "w", encoding=3D"ascii") as output:
> +        output.write(out)
> +
> +    return 0
> +
> +
> +if __name__ =3D=3D "__main__":
> +    sys.exit(main())
> --
> 2.46.0.rc2.264.g509ed76dc8-goog
>
>

--0000000000009d12d6061f331ae1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2024 at 4:17=E2=80=AFP=
M Octavian Purdila &lt;<a href=3D"mailto:tavip@google.com">tavip@google.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Stefan Stanacar &lt;<a href=3D"mailto:stefanst@google.com" target=3D"=
_blank">stefanst@google.com</a>&gt;<br>
<br>
From: Stefan Stanacar &lt;<a href=3D"mailto:stefanst@google.com" target=3D"=
_blank">stefanst@google.com</a>&gt;<br>
<br>
The CMSIS System View Description format(CMSIS-SVD) is an XML based<br>
description of Arm Cortex-M microcontrollers provided and maintained<br>
by sillicon vendors. It includes details such as peripherals registers<br>
(down to bitfields), peripheral register block addresses, reset<br>
values, etc.<br>
<br>
This script uses this information to create header files that makes it<br>
easier to emulate peripherals.<br>
<br>
The script can be used to create either peripheral specific headers or<br>
board / system specific information. The script generated headers are<br>
similar to the SVDConv utility.<br>
<br>
Peripheral specific headers contains information such as register<br>
layout, register names and reset values for registers:<br>
<br>
=C2=A0 typedef struct {<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 union {<br>
=C2=A0 =C2=A0 =C2=A0 uint32_t PSELID;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* 0x00000FF8 Peripheral Select and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Flexcomm modul=
e ID */<br>
=C2=A0 =C2=A0 =C2=A0 struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t PERSEL : 3;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* [2..0] Peripheral Select */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t LOCK : 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* [3..3] Lock the peripheral select */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t USARTPRESENT : 1;=C2=A0 /* [4..4] USAR=
T present indicator */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t SPIPRESENT : 1;=C2=A0 =C2=A0 /* [5..5]=
 SPI present indicator */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t I2CPRESENT : 1;=C2=A0 =C2=A0 /* [6..6]=
 I2C present indicator */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t I2SPRESENT : 1;=C2=A0 =C2=A0 /* [7..7]=
 I2S Present */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t : 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t ID : 20;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* [31..12] Flexcomm ID */<br>
=C2=A0 =C2=A0 =C2=A0 } PSELID_b;<br>
=C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 } FLEXCOMM_Type;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Size =3D 4096 (0x1000) */<br>
<br>
=C2=A0 #define FLEXCOMM_PSELID_PERSEL_Pos (0UL)<br>
=C2=A0 #define FLEXCOMM_PSELID_PERSEL_Msk (0x7UL)<br>
=C2=A0 #define FLEXCOMM_PSELID_LOCK_Pos (3UL)<br>
=C2=A0 #define FLEXCOMM_PSELID_LOCK_Msk (0x8UL)<br>
=C2=A0 ...<br>
<br>
=C2=A0 typedef enum {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* FLEXCOMM_PSELID_LOCK */<br>
=C2=A0 =C2=A0 /* Peripheral select can be changed by software. */<br>
=C2=A0 =C2=A0 FLEXCOMM_PSELID_LOCK_UNLOCKED =3D 0,<br>
=C2=A0 =C2=A0 /* Peripheral select is locked and cannot be changed until th=
is<br>
=C2=A0 =C2=A0 =C2=A0* Flexcomm module or the entire device is reset. */<br>
=C2=A0 =C2=A0 FLEXCOMM_PSELID_LOCK_LOCKED =3D 1,<br>
=C2=A0 } FLEXCOMM_PSELID_LOCK_Enum;<br>
=C2=A0 ...<br>
<br>
=C2=A0 #define FLEXCOMM_REGISTER_NAMES_ARRAY(_name) \<br>
=C2=A0 =C2=A0 const char *_name[sizeof(FLEXCOMM_Type)] =3D { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [4088 ... 4091] =3D &quot;PSELID&quot;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [4092 ... 4095] =3D &quot;PID&quot;, \<br>
=C2=A0 =C2=A0 }<br>
<br>
Board specific headers contains information about peripheral base<br>
register addresses.<br>
<br>
Signed-off-by: Stefan Stanacar &lt;<a href=3D"mailto:stefanst@google.com" t=
arget=3D"_blank">stefanst@google.com</a>&gt;<br>
Signed-off-by: Octavian Purdila &lt;<a href=3D"mailto:tavip@google.com" tar=
get=3D"_blank">tavip@google.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<=
br>
=C2=A0python/tests/minreqs.txt=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0pythondeps.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +<br>
=C2=A0scripts/svd-gen-header.py | 342 +++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A06 files changed, 354 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 scripts/svd-gen-header.py<br>
<br>
diff --git a/configure b/configure<br>
index 5ad1674ca5..811bfa5d54 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -956,7 +956,7 @@ mkvenv=3D&quot;$python ${source_path}/python/scripts/mk=
venv.py&quot;<br>
=C2=A0# Finish preparing the virtual environment using vendored .whl files<=
br>
<br>
=C2=A0$mkvenv ensuregroup --dir &quot;${source_path}/python/wheels&quot; \<=
br>
-=C2=A0 =C2=A0 =C2=A0${source_path}/pythondeps.toml meson || exit 1<br>
+=C2=A0 =C2=A0 =C2=A0${source_path}/pythondeps.toml meson svd-gen-header ||=
 exit 1<br></blockquote><div><br></div><div>I haven&#39;t read the rest of =
this series; I&#39;m chiming in solely from the build/python maintainer ang=
le. Do we *always* need pysvd, no matter how QEMU was configured? Adding it=
 to the meson line here is a very big hammer.</div><div><br></div><div>If n=
ot, consider looking at how sphinx (the &quot;docs&quot; group) is only con=
ditionally installed into the configure venv and mimic that using the appro=
priate configure flags that necessitate the availability of pyvsd for the Q=
EMU build.<br></div><div><br></div><div>We also need to provide a way for p=
ysvd to be available offline; some packages are available via distro libs a=
nd if this package is available for every distro we officially support, tha=
t&#39;s sufficient (but requires updates to our various docker and VM test =
configuration files to add the new dependency). Otherwise, like we do for m=
eson, we need to vendor the wheel in the tree so offline tarball builds wil=
l continue to work.</div><div><br></div></div><div class=3D"gmail_quote">It=
 looks like pysvd is a pure python package with no dependencies, so it
 should be OK to vendor it in qemu.git/python/wheels/ - look at=20
qemu.git/python/scripts/vendor.py and consider updating and running this sc=
ript.<br></div><div class=3D"gmail_quote"><br><div>(The real blocker here i=
s that RPM builds are performed offline and dependencies that cannot be sat=
isfied via rpm can&#39;t be added through pip. We need any one of these to =
be true: (A) pyvsd is available (of a sufficient version) in all distro rep=
ositories we target; (B) This build feature is conditional and nobody minds=
 if it never gets enabled for RPM builds; (C) The package can be vendored.)=
</div><div><br></div><div>~~js</div><div><br></div><div>That said, you migh=
t be the first person I&#39;ve seen outside of Paolo and I to brave mucking=
 around with the python build venv. You deserve a bravery sticker :)<br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0# At this point, we expect Meson to be installed and available.<br>
=C2=A0# We expect mkvenv or pip to have created pyvenv/bin/meson for us.<br=
>
diff --git a/meson.build b/meson.build<br>
index ec59effca2..dee587483b 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3235,6 +3235,10 @@ tracetool_depends =3D files(<br>
=C2=A0 =C2=A0&#39;scripts/tracetool/vcpu.py&#39;<br>
=C2=A0)<br>
<br>
+svd_gen_header =3D [<br>
+=C2=A0 python, files(&#39;scripts/svd-gen-header.py&#39;)<br>
+]<br>
+<br>
=C2=A0qemu_version_cmd =3D [find_program(&#39;scripts/qemu-version.sh&#39;)=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0get_option(&#39;pkgversion&#39;), meson.project_version()]<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index 48668609d3..bc830c541a 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -45,6 +45,7 @@ devel =3D<br>
=C2=A0 =C2=A0 =C2=A0urwid &gt;=3D 2.1.2<br>
=C2=A0 =C2=A0 =C2=A0urwid-readline &gt;=3D 0.13<br>
=C2=A0 =C2=A0 =C2=A0Pygments &gt;=3D 2.9.0<br>
+=C2=A0 =C2=A0 pysvd &gt;=3D 0.2.3<br>
<br>
=C2=A0# Provides qom-fuse functionality<br>
=C2=A0fuse =3D<br>
diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt<br>
index a3f423efd8..7993fcd23c 100644<br>
--- a/python/tests/minreqs.txt<br>
+++ b/python/tests/minreqs.txt<br>
@@ -22,6 +22,9 @@ distlib=3D=3D0.3.6<br>
=C2=A0# Dependencies for FUSE support for qom-fuse<br>
=C2=A0fusepy=3D=3D2.0.4<br>
<br>
+# Dependencies for svd-gen-regs<br>
+pysvd=3D=3D0.2.3<br>
+<br>
=C2=A0# Test-runners, utilities, etc.<br>
=C2=A0avocado-framework=3D=3D90.0<br>
<br>
diff --git a/pythondeps.toml b/pythondeps.toml<br>
index 9c16602d30..8416b17650 100644<br>
--- a/pythondeps.toml<br>
+++ b/pythondeps.toml<br>
@@ -32,3 +32,6 @@ sphinx_rtd_theme =3D { accepted =3D &quot;&gt;=3D0.5&quot=
;, installed =3D &quot;1.1.1&quot; }<br>
=C2=A0# avocado-framework, for example right now the limit is 92.x.<br>
=C2=A0avocado-framework =3D { accepted =3D &quot;(&gt;=3D88.1, &lt;93.0)&qu=
ot;, installed =3D &quot;88.1&quot;, canary =3D &quot;avocado&quot; }<br>
=C2=A0pycdlib =3D { accepted =3D &quot;&gt;=3D1.11.0&quot; }<br>
+<br>
+[svd-gen-header]<br>
+pysvd =3D { accepted =3D &quot;&gt;=3D0.2.3.&quot;, installed =3D &quot;0.=
2.3&quot; }<br>
diff --git a/scripts/svd-gen-header.py b/scripts/svd-gen-header.py<br>
new file mode 100755<br>
index 0000000000..ab8cb4b665<br>
--- /dev/null<br>
+++ b/scripts/svd-gen-header.py<br>
@@ -0,0 +1,342 @@<br>
+#!/usr/bin/env python3<br>
+<br>
+# Copyright 2024 Google LLC<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2 or later=
.<br>
+# See the COPYING file in the top-level directory.<br>
+#<br>
+# Use this script to generate a C header file from an SVD xml<br>
+#<br>
+# Two mode of operations are supported: peripheral and system.<br>
+#<br>
+# When running in peripheral mode a header for a specific peripheral<br>
+# is going to be generated. It will define a type and structure with<br>
+# all of the available registers at the bitfield level. An array that<br>
+# contains the reigster names indexed by address is also going to be<br>
+# generated as well as a function to initialize registers to their<br>
+# reset values.<br>
+#<br>
+# Invocation example:<br>
+#<br>
+# svd_gen_header -i MIMXRT595S_cm33.xml -o flexcomm.h -p FLEXCOMM0 -t FLEX=
COMM<br>
+#<br>
+# When running in system mode a header for a specific system /<br>
+# platform will be generated. It will define register base addresses<br>
+# and interrupt numbers for selected peripherals.<br>
+#<br>
+# Invocation example:<br>
+#<br>
+# svd_gen_header -i MIMXRT595S_cm33.xml -o rt500.h -s RT500 -p FLEXCOMM0 \=
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -p CLKCTL0 -p CLK=
CTL1<br>
+#<br>
+<br>
+import argparse<br>
+import datetime<br>
+import re<br>
+import os<br>
+import sys<br>
+import xml.etree.ElementTree<br>
+import pysvd<br>
+<br>
+data_type_by_bits =3D {<br>
+=C2=A0 =C2=A0 8: &quot;uint8_t&quot;,<br>
+=C2=A0 =C2=A0 16: &quot;uint16_t&quot;,<br>
+=C2=A0 =C2=A0 32: &quot;uint32_t&quot;,<br>
+}<br>
+<br>
+<br>
+def get_register_array_name_and_size(register):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Return register name and register array si=
ze.<br>
+<br>
+=C2=A0 =C2=A0 The SVD can define register arrays and pysvd encodes the who=
le set<br>
+=C2=A0 =C2=A0 as as regular register with their name prepended by [&lt;arr=
ay size&gt;].<br>
+<br>
+=C2=A0 =C2=A0 Returns a tuple with the register name and the size of the a=
rray or<br>
+=C2=A0 =C2=A0 zero if this is not a register set.<br>
+<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 split =3D re.split(r&quot;[\[\]]&quot;, <a href=3D"http://re=
gister.name" rel=3D"noreferrer" target=3D"_blank">register.name</a>)<br>
+=C2=A0 =C2=A0 return (split[0], int(split[1]) if len(split) &gt; 1 else 0)=
<br>
+<br>
+<br>
+def generate_register(register):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate register data.<br>
+<br>
+=C2=A0 =C2=A0 This include a field for accessing the full 32bits as we as<=
br>
+=C2=A0 =C2=A0 bitfield based register fields.<br>
+<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 data_type =3D data_type_by_bits[register.size]<br>
+<br>
+=C2=A0 =C2=A0 out =3D f&quot;=C2=A0 =C2=A0 /* 0x{register.addressOffset:08=
X} {register.description} */\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;=C2=A0 =C2=A0 union {\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 {data_type} {<a =
href=3D"http://register.name" rel=3D"noreferrer" target=3D"_blank">register=
.name</a>};\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {\n&quot;<=
br>
+<br>
+=C2=A0 =C2=A0 fields =3D sorted(register.fields, key=3Dlambda field: field=
.bitOffset)<br>
+=C2=A0 =C2=A0 last_msb =3D -1<br>
+=C2=A0 =C2=A0 for field in fields:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reserve_bits =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsb =3D field.bitOffset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msb =3D field.bitWidth + lsb - 1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if last_msb =3D=3D -1 and lsb &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reserve_bits =3D lsb<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if last_msb !=3D -1 and (lsb - last_msb) &gt; =
1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reserve_bits =3D lsb - last_msb =
- 1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if reserve_bits &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {data_type}:{reserve_bits};\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* [{msb}..{lsb}] {field.description} */\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 {data_type} {<a href=3D"http://field.name" rel=3D"noreferrer"=
 target=3D"_blank">field.name</a>} : {field.bitWidth};\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_msb =3D msb<br>
+<br>
+=C2=A0 =C2=A0 if register.size - last_msb &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 {data_type}:{register.size - last_msb - 1};\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 reg_name, reg_array_size =3D get_register_array_name_and_siz=
e(register)<br>
+=C2=A0 =C2=A0 if reg_array_size &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }}=
 {reg_name}_b[{reg_array_size}];\n&quot;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }}=
 {reg_name}_b;\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;=C2=A0 =C2=A0 };\n\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def generate_pos_and_msk_defines(name, periph):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate Pos and Msk defines&quot;&quot;&q=
uot;<br>
+<br>
+=C2=A0 =C2=A0 out =3D &quot;\n&quot;<br>
+=C2=A0 =C2=A0 for reg in periph.registers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for field in reg.fields:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_name, _ =3D get_register_arr=
ay_name_and_size(reg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field_name =3D f&quot;{name}_{re=
g_name}_{<a href=3D"http://field.name" rel=3D"noreferrer" target=3D"_blank"=
>field.name</a>}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;#define {field_n=
ame}_Pos ({field.bitOffset}UL)\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D ((1 &lt;&lt; field.bitW=
idth) - 1) &lt;&lt; field.bitOffset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;#define {field_n=
ame}_Msk (0x{mask:x}UL)\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def generate_enum_values(name, periph):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate enum values&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 out =3D &quot;\n&quot;<br>
+=C2=A0 =C2=A0 for reg in periph.registers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_name, _ =3D get_register_array_name_and_si=
ze(reg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for field in reg.fields:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(field, &quot;enumerat=
edValues&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D &quot;\n&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D &quot;typ=
edef enum {\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for enum in field.=
enumeratedValues.enumeratedValues:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum=
_name =3D f&quot;{name}_{reg_name}_{<a href=3D"http://field.name" rel=3D"no=
referrer" target=3D"_blank">field.name</a>}_{<a href=3D"http://enum.name" r=
el=3D"noreferrer" target=3D"_blank">enum.name</a>}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =
+=3D f&quot;=C2=A0 =C2=A0 /* {enum.description} */\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =
+=3D f&quot;=C2=A0 =C2=A0 {enum_name} =3D {enum.value},\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;}}=
 {name}_{reg_name}_{<a href=3D"http://field.name" rel=3D"noreferrer" target=
=3D"_blank">field.name</a>}_Enum;\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def generate_register_names_array_macro(name, periph):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate register names array macro&quot;&=
quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 out =3D f&quot;#define {name}_REGISTER_NAMES_ARRAY(_name) \\=
\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 const char *_name[sizeof({name=
}_Type)] =3D {{ \\\n&quot;<br>
+=C2=A0 =C2=A0 for reg in periph.registers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_name, reg_array_size =3D get_register_arra=
y_name_and_size(reg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if reg_array_size &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(0, reg_array_size=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D reg.addr=
essOffset + i * reg.size // 8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stop =3D reg.addre=
ssOffset + (i + 1) * reg.size // 8 - 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&#39;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [{start} ... {stop}] =3D &quot;{reg_name}{i}&quot;=
, \\\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D reg.addressOffset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stop =3D reg.addressOffset + reg=
.size // 8 - 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&#39;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [{start} ... {stop}] =3D &quot;{<a href=3D"http://reg.name" rel=
=3D"noreferrer" target=3D"_blank">reg.name</a>}&quot;, \\\n&#39;<br>
+=C2=A0 =C2=A0 out +=3D &quot;=C2=A0 =C2=A0 }\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def generate_reset_registers_function(name, periph):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate reset registers function&quot;&qu=
ot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 out =3D &quot;\n&quot;<br>
+=C2=A0 =C2=A0 fname =3D f&quot;{name.lower()}_reset_registers&quot;<br>
+=C2=A0 =C2=A0 out +=3D f&quot;static inline void {fname}({name}_Type *regs=
)\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;{\n&quot;<br>
+=C2=A0 =C2=A0 for reg in periph.registers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_name, reg_array_size =3D get_register_arra=
y_name_and_size(reg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if reg_array_size &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(0, int(reg_array_=
size)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=
=C2=A0 =C2=A0 regs-&gt;{reg_name}[{i}] =3D {hex(reg.resetValue)};\n&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 re=
gs-&gt;{reg_name} =3D {hex(reg.resetValue)};\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;}\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def generate_peripheral_header(periph, name):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate peripheral header<br>
+<br>
+=C2=A0 =C2=A0 The following information is generated:<br>
+<br>
+=C2=A0 =C2=A0 * typedef with all of the available registers and register f=
ields,<br>
+=C2=A0 =C2=A0 position and mask defines for register fields.<br>
+<br>
+=C2=A0 =C2=A0 * enum values that encode register fields options.<br>
+<br>
+=C2=A0 =C2=A0 * a macro that defines the register names indexed by the rel=
ative<br>
+=C2=A0 =C2=A0 address of the register.<br>
+<br>
+=C2=A0 =C2=A0 * a function that sets the registers to their reset values<b=
r>
+<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 out =3D f&quot;/* {name} - {periph.description} */\n\n&quot;=
<br>
+=C2=A0 =C2=A0 out +=3D &quot;typedef struct {\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 last_reg_offset =3D 0<br>
+=C2=A0 =C2=A0 cnt =3D 0<br>
+=C2=A0 =C2=A0 for reg in periph.registers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reserved_words =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg.addressOffset - last_reg_offset) &gt; =
0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reserved_words =3D int((reg.addr=
essOffset - last_reg_offset) // 4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnt +=3D 1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cnt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show_count =3D cnt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show_count =3D &quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if reserved_words =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 ui=
nt32_t RESERVED{show_count};\n\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif reserved_words &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;=C2=A0 =C2=A0 ui=
nt32_t RESERVED{show_count}[{reserved_words}];\n\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D generate_register(reg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_reg_offset =3D reg.addressOffset + reg.si=
ze // 8<br>
+<br>
+=C2=A0 =C2=A0 size =3D periph.addressBlocks[0].size<br>
+=C2=A0 =C2=A0 out +=3D f&quot;}} {name}_Type; /* Size =3D {size} (0x{size:=
X}) */\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 out +=3D &quot;\n\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 out +=3D generate_pos_and_msk_defines(name, periph)<br>
+<br>
+=C2=A0 =C2=A0 out +=3D generate_enum_values(name, periph)<br>
+<br>
+=C2=A0 =C2=A0 out +=3D generate_register_names_array_macro(name, periph)<b=
r>
+<br>
+=C2=A0 =C2=A0 out +=3D generate_reset_registers_function(name, periph)<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def get_same_class_peripherals(svd, periph):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Get a list of peripherals that are instanc=
es of the same class.&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 return [periph] + [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in svd.peripherals<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.derivedFrom and <a href=3D"http://p.deriv=
edFrom.name" rel=3D"noreferrer" target=3D"_blank">p.derivedFrom.name</a> =
=3D=3D <a href=3D"http://periph.name" rel=3D"noreferrer" target=3D"_blank">=
periph.name</a><br>
+=C2=A0 =C2=A0 ]<br>
+<br>
+<br>
+def generate_system_header(system, svd, periph):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Generate base and irq defines for given li=
st of peripherals&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 out =3D &quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 for p in get_same_class_peripherals(svd, periph):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;#define {system}_{<a href=3D"h=
ttp://p.name" rel=3D"noreferrer" target=3D"_blank">p.name</a>}_BASE 0x{p.ba=
seAddress:X}UL\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 for p in get_same_class_peripherals(svd, periph):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for irq in p.interrupts:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;#define {system}=
_{<a href=3D"http://irq.name" rel=3D"noreferrer" target=3D"_blank">irq.name=
</a>}_IRQn 0x{irq.value}UL\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot;\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 return out<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Script to generate C header file from an S=
VD file&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser()<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-i&quot;, &quot;--input&quot;, type=3Dst=
r, help=3D&quot;Input SVD file&quot;, required=3DTrue<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-o&quot;, &quot;--output&quot;, type=3Ds=
tr, help=3D&quot;Output .h file&quot;, required=3DTrue<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-p&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--peripheral&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;append&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;peripheral name from the SVD file=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 required=3DTrue,<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-t&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--type-name&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type=3Dstr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;name to be used for peripheral de=
finitions&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 required=3DFalse,<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--system&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type=3Dstr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;name to be used for the system de=
finitions&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 required=3DFalse,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 node =3D xml.etree.ElementTree.parse(args.input).getroot()<b=
r>
+=C2=A0 =C2=A0 svd =3D pysvd.element.Device(node)<br>
+<br>
+=C2=A0 =C2=A0 # Write license header<br>
+=C2=A0 =C2=A0 out =3D &quot;/*\n&quot;<br>
+=C2=A0 =C2=A0 license_text =3D svd.licenseText.split(&quot;\\n&quot;)<br>
+=C2=A0 =C2=A0 for line in license_text:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sline =3D f&quot; * {line.strip()}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D f&quot;{sline.rstrip()}\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 now =3D datetime.datetime.utcnow().strftime(&quot;%Y-%m-%d %=
H:%M:%S&quot;)<br>
+=C2=A0 =C2=A0 out +=3D f&quot; * @note Automatically generated by {os.path=
.basename(__file__)}&quot;<br>
+=C2=A0 =C2=A0 out +=3D f&quot; on {now} UTC from {os.path.basename(args.in=
put)}.\n&quot;<br>
+=C2=A0 =C2=A0 out +=3D &quot; *\n */\n\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Write some generic defines<br>
+=C2=A0 =C2=A0 out +=3D &quot;#pragma once\n\n&quot;<br>
+<br>
+=C2=A0 =C2=A0 for name in args.peripheral:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 periph =3D svd.find(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if periph:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.system:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D generate_=
system_header(args.system, svd, periph)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out +=3D generate_=
peripheral_header(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri=
ph, args.type_name if args.type_name else <a href=3D"http://periph.name" re=
l=3D"noreferrer" target=3D"_blank">periph.name</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&quot;No such peripheral:=
 {name}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
+<br>
+=C2=A0 =C2=A0 with open(args.output, &quot;w&quot;, encoding=3D&quot;ascii=
&quot;) as output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(out)<br>
+<br>
+=C2=A0 =C2=A0 return 0<br>
+<br>
+<br>
+if __name__ =3D=3D &quot;__main__&quot;:<br>
+=C2=A0 =C2=A0 sys.exit(main())<br>
-- <br>
2.46.0.rc2.264.g509ed76dc8-goog<br>
<br>
</blockquote></div></div>

--0000000000009d12d6061f331ae1--
