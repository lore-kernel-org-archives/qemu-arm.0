Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp679762njc;
        Thu, 8 Aug 2024 15:30:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwzoZw+Q7bju9pOgYTuFD0AFc8G0rQWAXR38yT7dn36PfkQ2Zjs/c7FS1VeK/mV5P7Q2aKMy29N5xyey+tfXqH0K3AOUT4
X-Received: by 2002:a05:600c:a01:b0:428:f79:1836 with SMTP id 5b1f17b1804b1-4290af0a329mr24860455e9.26.1723156228458;
        Thu, 08 Aug 2024 15:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723156228; cv=none;
        d=google.com; s=arc-20160816;
        b=HDR1FGqwXuimTi9gVuripQYfDNhubxWucD9dp4EJSbrWmrZzCK4b6yLjlRIg6QfxLf
         qygLfXYXFTPyLcagEIup3Go2fCYCU13+3uC+aP+WkrNWnyuhXDy3uj4c23adIUO5GcM/
         FvWcV2IJMm+fZtTlcP9v9Jc+b7ss3pL4dAdFusjCE4t02QzbAE/dRyppdb6BAWjgtr5k
         UfvcyyDmXlrjE4idGR97pyPJfm9LNUyZR4kz5NKZw46ph1g2I8cl1x6wdL9ycRzpOEoW
         r/IsSyOkqvsr5sOiqfgqw9SxfV29HcjNfV6c5Z1l52Ly15gJGDRjU0nEf2F45DjBe8ys
         gSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MDbWf7S+jHvhWYJgarJBEzT2BmhIx+/fg/YGtekisbM=;
        fh=6Xgw1hvi29KbnXHXZmI7/EHA2u+OEJGhgyApuB4zHgc=;
        b=I7quAYmAIcrGpNJv5kxEvu4HrgjSrJvkvKqD3vvYNCG+wEpHF3bqXOIcLiDNIIrh2X
         9znya2xcH3B0klFopCmQk357bMeVucgC89KiOuA849LTrvVkIWziDzF1JRJcj5r9uh0q
         bfyWzHeU0kuNjKDRwOs+z3kYejD2TU0OEhBFBp13wO6LanJoC9dqdtEuQ7U2KEdoaG1J
         v3qrTTAUH31P2UHWxDiIWgQsNy+oHwfGzQp6N457E6EcFa4ENNyXt3EsgAE+h4SRz8hI
         G9mu6F2l/7P9BtFevVE+TIbzgQWlATrAbZkA6tVVMPkSj8hbpO+ZAbliRgzbkrFEHW3u
         tjgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iS6BH7Xa;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4290579e71esor10624105e9.4.2024.08.08.15.30.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Aug 2024 15:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iS6BH7Xa;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723156228; x=1723761028; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDbWf7S+jHvhWYJgarJBEzT2BmhIx+/fg/YGtekisbM=;
        b=iS6BH7XaRYtsbZTne3R56JkbKokPogLh7G84pmce28cQSoC49MIn4xBi3QAuShDcg5
         YigO0q3MEEvX7i2rkesp/o96tIT15pcwkLjpsXgHpBgSWq9VyzCtMEkkozBHRqpWYMXk
         4sPngFshjZ5UhkcbXntjvU4mJA7JztZN1gNyfZFSr+C8+xEMj6nXb1vOnlM9pSkWl9zF
         YaO7J1L0Yhq8m4ywp4bP7DWvqrvLqbvO3WX41Or+nJsF1iu1EtT28CRTrX6pJkrbzrlO
         yBhEme2zZKVzhZ56IyDfF5zxrt+6WQBwikCQDnoVuyV8Jopl5oqfzxsXQnnZbeg2Hn+5
         qfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723156228; x=1723761028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDbWf7S+jHvhWYJgarJBEzT2BmhIx+/fg/YGtekisbM=;
        b=WZmqrFFCLScyh7HXEiw+t8a02erzuKZKMS7BoTOk+pDowj//MW2x292T5dCkDPktQP
         4Pm/LpKV8VzadX+/6RZ8muZRHDn3mI5NrLDx480DqQJSZlnuI9Lo3rxuyhKlaNtsicEc
         UQ4cEmrN8caWYPttcji+CBFAJO0fpCUe9GAFfu4JtrnzEm97EDJ9IFDTbopOL+GRQL/M
         dj0GCYpBub628xcmZ9/nc4V5dK8ND8Mji/dNBaTFaXiLO0zQmAsHxxoUqQIefqehUoGC
         +lB+32oW8ELfqEFjXl0pngBLj47zOQWed9Gfl1t2Spt/Ej00t2+pzOqEdLXIon2wQ5kg
         4POQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl9BBefuzbhaFrW5p+qdoxIZkzJsA3A6+QrlfQ7g/2GHZYBVhPdpYoWJ9zg6yXKRt+7aLAIJxX3j+0xyukcKdVAnnxD4th
X-Gm-Message-State: AOJu0YwWRUw+RR1Ug2qaFZNOGlrauGR9GEujNVhqRVRQlFsYExOVTDBX
	PiYVNBg7xSp6kI4kJ61D75W9m7f/9HeD7lPDQh4oej8qHesZIftHAvd9/q31xT3CKfo7A+uw4ag
	xQnWcrrVTCEMMirIoIrck0ejxCOdR3d0Tr5PN
X-Google-Smtp-Source: AGHT+IEqnvJN5Y8sJ84Lt3EX/WIwzzjj2cRxrnhn3i4tWNpHYPWHvOioRenvD2KjlQYtlcy2wzpsA57W8LwBT5yL5y8=
X-Received: by 2002:a05:600c:1f93:b0:426:647b:1bf7 with SMTP id
 5b1f17b1804b1-4290af18b73mr28261325e9.32.1723156227477; Thu, 08 Aug 2024
 15:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
In-Reply-To: <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Thu, 8 Aug 2024 15:30:16 -0700
Message-ID: <CAGWr4cQL_LMWmEUdoPprRSp2k=CkQ0UJp5Q45qbAtUvvE6fDHg@mail.gmail.com>
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	peter.maydell@linaro.org, marcandre.lureau@redhat.com, alistair@alistair23.me, 
	berrange@redhat.com, philmd@linaro.org, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wX4PM/CLKlfQ

On Thu, Aug 8, 2024 at 2:56=E2=80=AFPM John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Mon, Aug 5, 2024 at 4:17=E2=80=AFPM Octavian Purdila <tavip@google.com=
> wrote:
>>
>> From: Stefan Stanacar <stefanst@google.com>
>>
>> From: Stefan Stanacar <stefanst@google.com>
>>
>> The CMSIS System View Description format(CMSIS-SVD) is an XML based
>> description of Arm Cortex-M microcontrollers provided and maintained
>> by sillicon vendors. It includes details such as peripherals registers
>> (down to bitfields), peripheral register block addresses, reset
>> values, etc.
>>
>> This script uses this information to create header files that makes it
>> easier to emulate peripherals.
>>
>> The script can be used to create either peripheral specific headers or
>> board / system specific information. The script generated headers are
>> similar to the SVDConv utility.
>>
>> Peripheral specific headers contains information such as register
>> layout, register names and reset values for registers:
>>
>>   typedef struct {
>>     ...
>>     union {
>>       uint32_t PSELID;              /* 0x00000FF8 Peripheral Select and
>>                                      * Flexcomm module ID */
>>       struct {
>>         uint32_t PERSEL : 3;        /* [2..0] Peripheral Select */
>>         uint32_t LOCK : 1;          /* [3..3] Lock the peripheral select=
 */
>>         uint32_t USARTPRESENT : 1;  /* [4..4] USART present indicator */
>>         uint32_t SPIPRESENT : 1;    /* [5..5] SPI present indicator */
>>         uint32_t I2CPRESENT : 1;    /* [6..6] I2C present indicator */
>>         uint32_t I2SPRESENT : 1;    /* [7..7] I2S Present */
>>         uint32_t : 4;
>>         uint32_t ID : 20;           /* [31..12] Flexcomm ID */
>>       } PSELID_b;
>>     };
>>     ...
>>   } FLEXCOMM_Type;                  /* Size =3D 4096 (0x1000) */
>>
>>   #define FLEXCOMM_PSELID_PERSEL_Pos (0UL)
>>   #define FLEXCOMM_PSELID_PERSEL_Msk (0x7UL)
>>   #define FLEXCOMM_PSELID_LOCK_Pos (3UL)
>>   #define FLEXCOMM_PSELID_LOCK_Msk (0x8UL)
>>   ...
>>
>>   typedef enum {                /* FLEXCOMM_PSELID_LOCK */
>>     /* Peripheral select can be changed by software. */
>>     FLEXCOMM_PSELID_LOCK_UNLOCKED =3D 0,
>>     /* Peripheral select is locked and cannot be changed until this
>>      * Flexcomm module or the entire device is reset. */
>>     FLEXCOMM_PSELID_LOCK_LOCKED =3D 1,
>>   } FLEXCOMM_PSELID_LOCK_Enum;
>>   ...
>>
>>   #define FLEXCOMM_REGISTER_NAMES_ARRAY(_name) \
>>     const char *_name[sizeof(FLEXCOMM_Type)] =3D { \
>>         [4088 ... 4091] =3D "PSELID", \
>>         [4092 ... 4095] =3D "PID", \
>>     }
>>
>> Board specific headers contains information about peripheral base
>> register addresses.
>>
>> Signed-off-by: Stefan Stanacar <stefanst@google.com>
>> Signed-off-by: Octavian Purdila <tavip@google.com>
>> ---
>>  configure                 |   2 +-
>>  meson.build               |   4 +
>>  python/setup.cfg          |   1 +
>>  python/tests/minreqs.txt  |   3 +
>>  pythondeps.toml           |   3 +
>>  scripts/svd-gen-header.py | 342 ++++++++++++++++++++++++++++++++++++++
>>  6 files changed, 354 insertions(+), 1 deletion(-)
>>  create mode 100755 scripts/svd-gen-header.py
>>
>> diff --git a/configure b/configure
>> index 5ad1674ca5..811bfa5d54 100755
>> --- a/configure
>> +++ b/configure
>> @@ -956,7 +956,7 @@ mkvenv=3D"$python ${source_path}/python/scripts/mkve=
nv.py"
>>  # Finish preparing the virtual environment using vendored .whl files
>>
>>  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
>> -     ${source_path}/pythondeps.toml meson || exit 1
>> +     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
>

Hi John,

Thanks for reviewing!

>
> I haven't read the rest of this series; I'm chiming in solely from the bu=
ild/python maintainer angle. Do we *always* need pysvd, no matter how QEMU =
was configured? Adding it to the meson line here is a very big hammer.
>

I think the minimum we can do is to install it only if CONFIG_ARM is
enabled. That might change in the future if the models we create with
pysvd are enabled for other architectures.

> If not, consider looking at how sphinx (the "docs" group) is only conditi=
onally installed into the configure venv and mimic that using the appropria=
te configure flags that necessitate the availability of pyvsd for the QEMU =
build.

Thanks for the pointer, I'll take a look.

>
> We also need to provide a way for pysvd to be available offline; some pac=
kages are available via distro libs and if this package is available for ev=
ery distro we officially support, that's sufficient (but requires updates t=
o our various docker and VM test configuration files to add the new depende=
ncy). Otherwise, like we do for meson, we need to vendor the wheel in the t=
ree so offline tarball builds will continue to work.
>
> It looks like pysvd is a pure python package with no dependencies, so it =
should be OK to vendor it in qemu.git/python/wheels/ - look at qemu.git/pyt=
hon/scripts/vendor.py and consider updating and running this script.

Thanks, I'll look at it and add it in v2.

>
> (The real blocker here is that RPM builds are performed offline and depen=
dencies that cannot be satisfied via rpm can't be added through pip. We nee=
d any one of these to be true: (A) pyvsd is available (of a sufficient vers=
ion) in all distro repositories we target; (B) This build feature is condit=
ional and nobody minds if it never gets enabled for RPM builds; (C) The pac=
kage can be vendored.)
>
> ~~js
>
> That said, you might be the first person I've seen outside of Paolo and I=
 to brave mucking around with the python build venv. You deserve a bravery =
sticker :)
>
>>
>>  # At this point, we expect Meson to be installed and available.
>>  # We expect mkvenv or pip to have created pyvenv/bin/meson for us.
>> diff --git a/meson.build b/meson.build
>> index ec59effca2..dee587483b 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3235,6 +3235,10 @@ tracetool_depends =3D files(
>>    'scripts/tracetool/vcpu.py'
>>  )
>>
>> +svd_gen_header =3D [
>> +  python, files('scripts/svd-gen-header.py')
>> +]
>> +
>>  qemu_version_cmd =3D [find_program('scripts/qemu-version.sh'),
>>                      meson.current_source_dir(),
>>                      get_option('pkgversion'), meson.project_version()]
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index 48668609d3..bc830c541a 100644
>> --- a/python/setup.cfg
>> +++ b/python/setup.cfg
>> @@ -45,6 +45,7 @@ devel =3D
>>      urwid >=3D 2.1.2
>>      urwid-readline >=3D 0.13
>>      Pygments >=3D 2.9.0
>> +    pysvd >=3D 0.2.3
>>
>>  # Provides qom-fuse functionality
>>  fuse =3D
>> diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
>> index a3f423efd8..7993fcd23c 100644
>> --- a/python/tests/minreqs.txt
>> +++ b/python/tests/minreqs.txt
>> @@ -22,6 +22,9 @@ distlib=3D=3D0.3.6
>>  # Dependencies for FUSE support for qom-fuse
>>  fusepy=3D=3D2.0.4
>>
>> +# Dependencies for svd-gen-regs
>> +pysvd=3D=3D0.2.3
>> +
>>  # Test-runners, utilities, etc.
>>  avocado-framework=3D=3D90.0
>>
>> diff --git a/pythondeps.toml b/pythondeps.toml
>> index 9c16602d30..8416b17650 100644
>> --- a/pythondeps.toml
>> +++ b/pythondeps.toml
>> @@ -32,3 +32,6 @@ sphinx_rtd_theme =3D { accepted =3D ">=3D0.5", install=
ed =3D "1.1.1" }
>>  # avocado-framework, for example right now the limit is 92.x.
>>  avocado-framework =3D { accepted =3D "(>=3D88.1, <93.0)", installed =3D=
 "88.1", canary =3D "avocado" }
>>  pycdlib =3D { accepted =3D ">=3D1.11.0" }
>> +
>> +[svd-gen-header]
>> +pysvd =3D { accepted =3D ">=3D0.2.3.", installed =3D "0.2.3" }
>> diff --git a/scripts/svd-gen-header.py b/scripts/svd-gen-header.py
>> new file mode 100755
>> index 0000000000..ab8cb4b665
>> --- /dev/null
>> +++ b/scripts/svd-gen-header.py
>> @@ -0,0 +1,342 @@
>> +#!/usr/bin/env python3
>> +
>> +# Copyright 2024 Google LLC
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# Use this script to generate a C header file from an SVD xml
>> +#
>> +# Two mode of operations are supported: peripheral and system.
>> +#
>> +# When running in peripheral mode a header for a specific peripheral
>> +# is going to be generated. It will define a type and structure with
>> +# all of the available registers at the bitfield level. An array that
>> +# contains the reigster names indexed by address is also going to be
>> +# generated as well as a function to initialize registers to their
>> +# reset values.
>> +#
>> +# Invocation example:
>> +#
>> +# svd_gen_header -i MIMXRT595S_cm33.xml -o flexcomm.h -p FLEXCOMM0 -t F=
LEXCOMM
>> +#
>> +# When running in system mode a header for a specific system /
>> +# platform will be generated. It will define register base addresses
>> +# and interrupt numbers for selected peripherals.
>> +#
>> +# Invocation example:
>> +#
>> +# svd_gen_header -i MIMXRT595S_cm33.xml -o rt500.h -s RT500 -p FLEXCOMM=
0 \
>> +#                -p CLKCTL0 -p CLKCTL1
>> +#
>> +
>> +import argparse
>> +import datetime
>> +import re
>> +import os
>> +import sys
>> +import xml.etree.ElementTree
>> +import pysvd
>> +
>> +data_type_by_bits =3D {
>> +    8: "uint8_t",
>> +    16: "uint16_t",
>> +    32: "uint32_t",
>> +}
>> +
>> +
>> +def get_register_array_name_and_size(register):
>> +    """Return register name and register array size.
>> +
>> +    The SVD can define register arrays and pysvd encodes the whole set
>> +    as as regular register with their name prepended by [<array size>].
>> +
>> +    Returns a tuple with the register name and the size of the array or
>> +    zero if this is not a register set.
>> +
>> +    """
>> +
>> +    split =3D re.split(r"[\[\]]", register.name)
>> +    return (split[0], int(split[1]) if len(split) > 1 else 0)
>> +
>> +
>> +def generate_register(register):
>> +    """Generate register data.
>> +
>> +    This include a field for accessing the full 32bits as we as
>> +    bitfield based register fields.
>> +
>> +    """
>> +
>> +    data_type =3D data_type_by_bits[register.size]
>> +
>> +    out =3D f"    /* 0x{register.addressOffset:08X} {register.descripti=
on} */\n"
>> +    out +=3D "    union {\n"
>> +    out +=3D f"        {data_type} {register.name};\n"
>> +    out +=3D "        struct {\n"
>> +
>> +    fields =3D sorted(register.fields, key=3Dlambda field: field.bitOff=
set)
>> +    last_msb =3D -1
>> +    for field in fields:
>> +        reserve_bits =3D 0
>> +        lsb =3D field.bitOffset
>> +        msb =3D field.bitWidth + lsb - 1
>> +
>> +        if last_msb =3D=3D -1 and lsb > 0:
>> +            reserve_bits =3D lsb
>> +
>> +        if last_msb !=3D -1 and (lsb - last_msb) > 1:
>> +            reserve_bits =3D lsb - last_msb - 1
>> +
>> +        if reserve_bits > 0:
>> +            out +=3D f"            {data_type}:{reserve_bits};\n"
>> +
>> +        out +=3D f"            /* [{msb}..{lsb}] {field.description} */=
\n"
>> +        out +=3D f"            {data_type} {field.name} : {field.bitWid=
th};\n"
>> +
>> +        last_msb =3D msb
>> +
>> +    if register.size - last_msb > 1:
>> +        out +=3D f"            {data_type}:{register.size - last_msb - =
1};\n"
>> +
>> +    reg_name, reg_array_size =3D get_register_array_name_and_size(regis=
ter)
>> +    if reg_array_size > 0:
>> +        out +=3D f"        }} {reg_name}_b[{reg_array_size}];\n"
>> +    else:
>> +        out +=3D f"        }} {reg_name}_b;\n"
>> +    out +=3D "    };\n\n"
>> +
>> +    return out
>> +
>> +
>> +def generate_pos_and_msk_defines(name, periph):
>> +    """Generate Pos and Msk defines"""
>> +
>> +    out =3D "\n"
>> +    for reg in periph.registers:
>> +        for field in reg.fields:
>> +            reg_name, _ =3D get_register_array_name_and_size(reg)
>> +            field_name =3D f"{name}_{reg_name}_{field.name}"
>> +            out +=3D f"#define {field_name}_Pos ({field.bitOffset}UL)\n=
"
>> +            mask =3D ((1 << field.bitWidth) - 1) << field.bitOffset
>> +            out +=3D f"#define {field_name}_Msk (0x{mask:x}UL)\n"
>> +
>> +    return out
>> +
>> +
>> +def generate_enum_values(name, periph):
>> +    """Generate enum values"""
>> +
>> +    out =3D "\n"
>> +    for reg in periph.registers:
>> +        reg_name, _ =3D get_register_array_name_and_size(reg)
>> +        for field in reg.fields:
>> +            if hasattr(field, "enumeratedValues"):
>> +                out +=3D "\n"
>> +                out +=3D "typedef enum {\n"
>> +                for enum in field.enumeratedValues.enumeratedValues:
>> +                    enum_name =3D f"{name}_{reg_name}_{field.name}_{enu=
m.name}"
>> +                    out +=3D f"    /* {enum.description} */\n"
>> +                    out +=3D f"    {enum_name} =3D {enum.value},\n"
>> +                out +=3D f"}} {name}_{reg_name}_{field.name}_Enum;\n"
>> +
>> +    return out
>> +
>> +
>> +def generate_register_names_array_macro(name, periph):
>> +    """Generate register names array macro"""
>> +
>> +    out =3D f"#define {name}_REGISTER_NAMES_ARRAY(_name) \\\n"
>> +    out +=3D f"    const char *_name[sizeof({name}_Type)] =3D {{ \\\n"
>> +    for reg in periph.registers:
>> +        reg_name, reg_array_size =3D get_register_array_name_and_size(r=
eg)
>> +        if reg_array_size > 0:
>> +            for i in range(0, reg_array_size):
>> +                start =3D reg.addressOffset + i * reg.size // 8
>> +                stop =3D reg.addressOffset + (i + 1) * reg.size // 8 - =
1
>> +                out +=3D f'        [{start} ... {stop}] =3D "{reg_name}=
{i}", \\\n'
>> +        else:
>> +            start =3D reg.addressOffset
>> +            stop =3D reg.addressOffset + reg.size // 8 - 1
>> +            out +=3D f'        [{start} ... {stop}] =3D "{reg.name}", \=
\\n'
>> +    out +=3D "    }\n"
>> +
>> +    return out
>> +
>> +
>> +def generate_reset_registers_function(name, periph):
>> +    """Generate reset registers function"""
>> +
>> +    out =3D "\n"
>> +    fname =3D f"{name.lower()}_reset_registers"
>> +    out +=3D f"static inline void {fname}({name}_Type *regs)\n"
>> +    out +=3D "{\n"
>> +    for reg in periph.registers:
>> +        reg_name, reg_array_size =3D get_register_array_name_and_size(r=
eg)
>> +        if reg_array_size > 0:
>> +            for i in range(0, int(reg_array_size)):
>> +                out +=3D f"    regs->{reg_name}[{i}] =3D {hex(reg.reset=
Value)};\n"
>> +        else:
>> +            out +=3D f"    regs->{reg_name} =3D {hex(reg.resetValue)};\=
n"
>> +    out +=3D "}\n"
>> +
>> +    return out
>> +
>> +
>> +def generate_peripheral_header(periph, name):
>> +    """Generate peripheral header
>> +
>> +    The following information is generated:
>> +
>> +    * typedef with all of the available registers and register fields,
>> +    position and mask defines for register fields.
>> +
>> +    * enum values that encode register fields options.
>> +
>> +    * a macro that defines the register names indexed by the relative
>> +    address of the register.
>> +
>> +    * a function that sets the registers to their reset values
>> +
>> +    """
>> +
>> +    out =3D f"/* {name} - {periph.description} */\n\n"
>> +    out +=3D "typedef struct {\n"
>> +
>> +    last_reg_offset =3D 0
>> +    cnt =3D 0
>> +    for reg in periph.registers:
>> +        reserved_words =3D 0
>> +        if (reg.addressOffset - last_reg_offset) > 0:
>> +            reserved_words =3D int((reg.addressOffset - last_reg_offset=
) // 4)
>> +            cnt +=3D 1
>> +
>> +        if cnt:
>> +            show_count =3D cnt
>> +        else:
>> +            show_count =3D ""
>> +
>> +        if reserved_words =3D=3D 1:
>> +            out +=3D f"    uint32_t RESERVED{show_count};\n\n"
>> +        elif reserved_words > 1:
>> +            out +=3D f"    uint32_t RESERVED{show_count}[{reserved_word=
s}];\n\n"
>> +
>> +        out +=3D generate_register(reg)
>> +        last_reg_offset =3D reg.addressOffset + reg.size // 8
>> +
>> +    size =3D periph.addressBlocks[0].size
>> +    out +=3D f"}} {name}_Type; /* Size =3D {size} (0x{size:X}) */\n"
>> +
>> +    out +=3D "\n\n"
>> +
>> +    out +=3D generate_pos_and_msk_defines(name, periph)
>> +
>> +    out +=3D generate_enum_values(name, periph)
>> +
>> +    out +=3D generate_register_names_array_macro(name, periph)
>> +
>> +    out +=3D generate_reset_registers_function(name, periph)
>> +
>> +    return out
>> +
>> +
>> +def get_same_class_peripherals(svd, periph):
>> +    """Get a list of peripherals that are instances of the same class."=
""
>> +
>> +    return [periph] + [
>> +        p
>> +        for p in svd.peripherals
>> +        if p.derivedFrom and p.derivedFrom.name =3D=3D periph.name
>> +    ]
>> +
>> +
>> +def generate_system_header(system, svd, periph):
>> +    """Generate base and irq defines for given list of peripherals"""
>> +
>> +    out =3D ""
>> +
>> +    for p in get_same_class_peripherals(svd, periph):
>> +        out +=3D f"#define {system}_{p.name}_BASE 0x{p.baseAddress:X}UL=
\n"
>> +    out +=3D "\n"
>> +
>> +    for p in get_same_class_peripherals(svd, periph):
>> +        for irq in p.interrupts:
>> +            out +=3D f"#define {system}_{irq.name}_IRQn 0x{irq.value}UL=
\n"
>> +    out +=3D "\n"
>> +
>> +    return out
>> +
>> +
>> +def main():
>> +    """Script to generate C header file from an SVD file"""
>> +
>> +    parser =3D argparse.ArgumentParser()
>> +    parser.add_argument(
>> +        "-i", "--input", type=3Dstr, help=3D"Input SVD file", required=
=3DTrue
>> +    )
>> +    parser.add_argument(
>> +        "-o", "--output", type=3Dstr, help=3D"Output .h file", required=
=3DTrue
>> +    )
>> +    parser.add_argument(
>> +        "-p",
>> +        "--peripheral",
>> +        action=3D"append",
>> +        help=3D"peripheral name from the SVD file",
>> +        required=3DTrue,
>> +    )
>> +    parser.add_argument(
>> +        "-t",
>> +        "--type-name",
>> +        type=3Dstr,
>> +        help=3D"name to be used for peripheral definitions",
>> +        required=3DFalse,
>> +    )
>> +    parser.add_argument(
>> +        "-s",
>> +        "--system",
>> +        type=3Dstr,
>> +        help=3D"name to be used for the system definitions",
>> +        required=3DFalse,
>> +    )
>> +
>> +    args =3D parser.parse_args()
>> +
>> +    node =3D xml.etree.ElementTree.parse(args.input).getroot()
>> +    svd =3D pysvd.element.Device(node)
>> +
>> +    # Write license header
>> +    out =3D "/*\n"
>> +    license_text =3D svd.licenseText.split("\\n")
>> +    for line in license_text:
>> +        sline =3D f" * {line.strip()}"
>> +        out +=3D f"{sline.rstrip()}\n"
>> +
>> +    now =3D datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
>> +    out +=3D f" * @note Automatically generated by {os.path.basename(__=
file__)}"
>> +    out +=3D f" on {now} UTC from {os.path.basename(args.input)}.\n"
>> +    out +=3D " *\n */\n\n"
>> +
>> +    # Write some generic defines
>> +    out +=3D "#pragma once\n\n"
>> +
>> +    for name in args.peripheral:
>> +        periph =3D svd.find(name)
>> +        if periph:
>> +            if args.system:
>> +                out +=3D generate_system_header(args.system, svd, perip=
h)
>> +            else:
>> +                out +=3D generate_peripheral_header(
>> +                    periph, args.type_name if args.type_name else perip=
h.name
>> +                )
>> +        else:
>> +            print(f"No such peripheral: {name}")
>> +            return 1
>> +
>> +    with open(args.output, "w", encoding=3D"ascii") as output:
>> +        output.write(out)
>> +
>> +    return 0
>> +
>> +
>> +if __name__ =3D=3D "__main__":
>> +    sys.exit(main())
>> --
>> 2.46.0.rc2.264.g509ed76dc8-goog
>>
