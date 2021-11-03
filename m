Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp130635lfv;
        Wed, 3 Nov 2021 15:19:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1e0e:: with SMTP id pg14mr17494512pjb.143.1635977975143;
        Wed, 03 Nov 2021 15:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977975; cv=none;
        d=google.com; s=arc-20160816;
        b=friQNS6WT2Uagwu+nLYPgdrHnnYVRJkyKc0ePRX8IoHsEYl+eiZNi/l1pRitlCCunq
         g9b9lM70WY5mYInSZ5aXkbZpthqddz4pzTkw4DpPv/cSU1ee1w7wyM0P+Juk1NcrUh3g
         WvA1gR/Oj7EocNwZ5to/IlFJ/4HQnW8C4Hg2j/w2qcQ6F/avNiJpPh1xIn1NCPescl/c
         pd2HuVA4TzSqaELeZd01Ur39zcO/pJrLMNvGi2euYX0mr7mlUlBVM1ez3HM2NhIg9Zun
         EnxU3ozhGQyeX9zlzKDrQ0FnK3ztKqU9fGbkxF8m8OfDZqz5smtyWzieW49N6rKIW6NH
         uXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HpKGD1/YQAzrLzLvCFCuoI39gFi3w1OnNEmpr9hkwgc=;
        b=J+hJJjdR7/YyslEfFkrofN2S970iqBu1obpugmxBLCiuv8HazPEe6fkX++r9NatNiR
         +JAyGH1CVVBG8iAxwmt1yqZ8F4xrdPd7XR2G0AMmMW1sqiNxsiOBYzC9zsWnEkV6jH38
         BLdlOYVtkM1vhltzvmkAMuR1cnpJw63H9HtQadTiMr3t67cC6jjDq3UwfQbYGIO+TRoa
         k8X63w3G4k+XpKp8GsSeOCktiuVED6AV+PedO+dHxKZ11nSgcJ5fr1VB6xiqHw3UlVok
         AtRmA48/B+NWHRAtHKHwZFiccl5XyXkwjBbLCNEe1TJCFJo24cA/u0vui+fv/Jm+MIm0
         TmRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPPbNcQf;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t2sor2030431pfg.53.2021.11.03.15.19.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Nov 2021 15:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPPbNcQf;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HpKGD1/YQAzrLzLvCFCuoI39gFi3w1OnNEmpr9hkwgc=;
        b=iPPbNcQf7rvfDuS0Y/8PntqTs5it0GiuQb2/7f3ke5k560Xsr5912juIcYoPh7C8R3
         e6kLjLleWPXwQ/sHNXW4K2QyDzKVH+NHc3lWsAV7jw2IkIPR9WcPhsGYB8PhAvx9KHoj
         yUPwWd21QQF4kzCskCo+TtFYpFQaWXxe2wWoT9PGKWCGMv/2w+M0HbStAoyNs2ntAyMg
         xjJwi1qhnyuf/erZiAm51jKnVNJMP7Vdjik3TGNXFKelgxxCSThgW/+q4eOt9tc3JBLo
         Z/yCZVDQELY3ZoNKmAgWkeFxDElcQgR2uQ0Rv7UJkGmNSD+BSewpDIgD+7N3gojL/l++
         xXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpKGD1/YQAzrLzLvCFCuoI39gFi3w1OnNEmpr9hkwgc=;
        b=wkM9bQ6m1v97HZTu9TO3YIkfB0xTxPTTqPsoTTcOYPeyEGTW5tNU4IoCotEx3IHl1k
         I/opwxt5M1/kD+l43A6HHQOk2E3W8ndE/O4IA9JpxQ0gk8hTE5EQn7fSQNoKNLU4uuqA
         J1GUXWq/X1Lv6gN4EkYStAnQuCpiLNSbJ96xLakocpBOhA9IDr5znlvrlUHyuwpWbCXB
         ZYjZObeMsmYAdQm4VNZ5OUijJ/zwg5c28Yhhil67xXI+9OHRRIPU8qxu62pGLw303VWT
         y6nGIYsi9w0dL1PyG+nIPefLQvMVLSeB9X24Ms7EZp4WYrecMocr5GzTRTKuM0akyJaR
         yyEQ==
X-Gm-Message-State: AOAM532nH1/P09Blf+PXEnT2zDirfKfRl/b96k2ECTwEu9CMhBVD1iE9
	grWIGuFzvsfZXBbtO3WxReWOrV6aw8JaqOq8J7w=
X-Google-Smtp-Source: ABdhPJy/4BY22mu/e6Gd9z+P1Y2OmO7VZg63vcXOXqc7Gg9eEFZl8Z6UohZwR+nFNe0xKrN9moI/ilJ5pPXM1uPwMhc=
X-Received: by 2002:a05:6a00:1901:b0:44b:e041:f07f with SMTP id
 y1-20020a056a00190100b0044be041f07fmr47371070pfi.52.1635977974688; Wed, 03
 Nov 2021 15:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211103211404.79953-1-willianr@redhat.com>
In-Reply-To: <20211103211404.79953-1-willianr@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 3 Nov 2021 23:19:23 +0100
Message-ID: <CAPan3WpHasiF6+Vs=4Aqpq+FWZ7gYtcW17vgkTi0BmruudPD_w@mail.gmail.com>
Subject: Re: [PATCH 0/1] tests/acceptance: rename tests acceptance to tests avocado
To: Willian Rampazzo <willianr@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Michael Rolnik <mrolnik@gmail.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000000ab1bf05cfe9cef5"
X-TUID: bK4+6oE/CDzJ

--0000000000000ab1bf05cfe9cef5
Content-Type: text/plain; charset="UTF-8"

Hi Willian,

For the Orange Pi PC documentation:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


Op wo 3 nov. 2021 22:14 schreef Willian Rampazzo <willianr@redhat.com>:

> In the discussion about renaming the `tests/acceptance` [1], the
> conclusion was that the folders inside `tests` are related to the
> framework running the tests and not directly related to the type of
> the tests.
>
> This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the
> CI related files and the documentation.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html
>
> GitLab pipeline with new naming:
> https://gitlab.com/willianrampazzo/qemu/-/pipelines/401431592
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>
> Willian Rampazzo (1):
>   tests/acceptance: rename tests acceptance to tests avocado
>
>  .gitlab-ci.d/buildtest-template.yml           |  2 +-
>  .gitlab-ci.d/buildtest.yml                    | 56 +++++++++----------
>  MAINTAINERS                                   | 52 ++++++++---------
>  configure                                     |  2 +-
>  docs/devel/build-system.rst                   |  2 +-
>  docs/devel/ci-definitions.rst.inc             |  2 +-
>  docs/devel/testing.rst                        | 49 ++++++++--------
>  docs/system/arm/orangepi.rst                  |  8 +--
>  python/qemu/machine/README.rst                |  2 +-
>  python/qemu/qmp/README.rst                    |  2 +-
>  python/qemu/utils/README.rst                  |  2 +-
>  tests/Makefile.include                        | 14 ++---
>  tests/acceptance/README.rst                   | 10 ----
>  tests/avocado/README.rst                      | 10 ++++
>  .../avocado_qemu/__init__.py                  |  2 +-
>  tests/{acceptance => avocado}/boot_linux.py   |  0
>  .../boot_linux_console.py                     |  0
>  tests/{acceptance => avocado}/boot_xen.py     |  0
>  tests/{acceptance => avocado}/cpu_queries.py  |  0
>  .../empty_cpu_model.py                        |  0
>  tests/{acceptance => avocado}/hotplug_cpu.py  |  0
>  tests/{acceptance => avocado}/info_usernet.py |  0
>  tests/{acceptance => avocado}/intel_iommu.py  |  0
>  tests/{acceptance => avocado}/linux_initrd.py |  2 +-
>  .../linux_ssh_mips_malta.py                   |  0
>  .../machine_arm_canona1100.py                 |  0
>  .../machine_arm_integratorcp.py               |  0
>  .../machine_arm_n8x0.py                       |  0
>  tests/{acceptance => avocado}/machine_avr6.py |  2 +-
>  .../machine_m68k_nextcube.py                  |  0
>  .../machine_microblaze.py                     |  0
>  .../machine_mips_fuloong2e.py                 |  0
>  .../machine_mips_loongson3v.py                |  0
>  .../machine_mips_malta.py                     |  0
>  .../machine_rx_gdbsim.py                      |  0
>  .../machine_s390_ccw_virtio.py                |  0
>  .../machine_sparc64_sun4u.py                  |  0
>  .../machine_sparc_leon3.py                    |  0
>  tests/{acceptance => avocado}/migration.py    |  0
>  tests/{acceptance => avocado}/multiprocess.py |  0
>  .../pc_cpu_hotplug_props.py                   |  0
>  tests/{acceptance => avocado}/ppc_405.py      |  0
>  tests/{acceptance => avocado}/ppc_bamboo.py   |  0
>  .../{acceptance => avocado}/ppc_mpc8544ds.py  |  0
>  tests/{acceptance => avocado}/ppc_prep_40p.py | 12 ++--
>  tests/{acceptance => avocado}/ppc_pseries.py  |  0
>  .../ppc_virtex_ml507.py                       |  0
>  .../{acceptance => avocado}/replay_kernel.py  |  0
>  tests/{acceptance => avocado}/replay_linux.py |  0
>  .../reverse_debugging.py                      |  0
>  tests/{acceptance => avocado}/smmu.py         |  0
>  tests/{acceptance => avocado}/tcg_plugins.py  |  0
>  .../tesseract_utils.py                        |  0
>  tests/{acceptance => avocado}/version.py      |  0
>  tests/{acceptance => avocado}/virtio-gpu.py   |  0
>  .../virtio_check_params.py                    |  0
>  .../{acceptance => avocado}/virtio_version.py |  0
>  .../virtiofs_submounts.py                     |  0
>  .../virtiofs_submounts.py.data/cleanup.sh     |  0
>  .../guest-cleanup.sh                          |  0
>  .../virtiofs_submounts.py.data/guest.sh       |  0
>  .../virtiofs_submounts.py.data/host.sh        |  0
>  tests/{acceptance => avocado}/vnc.py          |  0
>  .../x86_cpu_model_versions.py                 |  0
>  64 files changed, 113 insertions(+), 118 deletions(-)
>  delete mode 100644 tests/acceptance/README.rst
>  create mode 100644 tests/avocado/README.rst
>  rename tests/{acceptance => avocado}/avocado_qemu/__init__.py (99%)
>  rename tests/{acceptance => avocado}/boot_linux.py (100%)
>  rename tests/{acceptance => avocado}/boot_linux_console.py (100%)
>  rename tests/{acceptance => avocado}/boot_xen.py (100%)
>  rename tests/{acceptance => avocado}/cpu_queries.py (100%)
>  rename tests/{acceptance => avocado}/empty_cpu_model.py (100%)
>  rename tests/{acceptance => avocado}/hotplug_cpu.py (100%)
>  rename tests/{acceptance => avocado}/info_usernet.py (100%)
>  rename tests/{acceptance => avocado}/intel_iommu.py (100%)
>  rename tests/{acceptance => avocado}/linux_initrd.py (99%)
>  rename tests/{acceptance => avocado}/linux_ssh_mips_malta.py (100%)
>  rename tests/{acceptance => avocado}/machine_arm_canona1100.py (100%)
>  rename tests/{acceptance => avocado}/machine_arm_integratorcp.py (100%)
>  rename tests/{acceptance => avocado}/machine_arm_n8x0.py (100%)
>  rename tests/{acceptance => avocado}/machine_avr6.py (98%)
>  rename tests/{acceptance => avocado}/machine_m68k_nextcube.py (100%)
>  rename tests/{acceptance => avocado}/machine_microblaze.py (100%)
>  rename tests/{acceptance => avocado}/machine_mips_fuloong2e.py (100%)
>  rename tests/{acceptance => avocado}/machine_mips_loongson3v.py (100%)
>  rename tests/{acceptance => avocado}/machine_mips_malta.py (100%)
>  rename tests/{acceptance => avocado}/machine_rx_gdbsim.py (100%)
>  rename tests/{acceptance => avocado}/machine_s390_ccw_virtio.py (100%)
>  rename tests/{acceptance => avocado}/machine_sparc64_sun4u.py (100%)
>  rename tests/{acceptance => avocado}/machine_sparc_leon3.py (100%)
>  rename tests/{acceptance => avocado}/migration.py (100%)
>  rename tests/{acceptance => avocado}/multiprocess.py (100%)
>  rename tests/{acceptance => avocado}/pc_cpu_hotplug_props.py (100%)
>  rename tests/{acceptance => avocado}/ppc_405.py (100%)
>  rename tests/{acceptance => avocado}/ppc_bamboo.py (100%)
>  rename tests/{acceptance => avocado}/ppc_mpc8544ds.py (100%)
>  rename tests/{acceptance => avocado}/ppc_prep_40p.py (92%)
>  rename tests/{acceptance => avocado}/ppc_pseries.py (100%)
>  rename tests/{acceptance => avocado}/ppc_virtex_ml507.py (100%)
>  rename tests/{acceptance => avocado}/replay_kernel.py (100%)
>  rename tests/{acceptance => avocado}/replay_linux.py (100%)
>  rename tests/{acceptance => avocado}/reverse_debugging.py (100%)
>  rename tests/{acceptance => avocado}/smmu.py (100%)
>  rename tests/{acceptance => avocado}/tcg_plugins.py (100%)
>  rename tests/{acceptance => avocado}/tesseract_utils.py (100%)
>  rename tests/{acceptance => avocado}/version.py (100%)
>  rename tests/{acceptance => avocado}/virtio-gpu.py (100%)
>  rename tests/{acceptance => avocado}/virtio_check_params.py (100%)
>  rename tests/{acceptance => avocado}/virtio_version.py (100%)
>  rename tests/{acceptance => avocado}/virtiofs_submounts.py (100%)
>  rename tests/{acceptance =>
> avocado}/virtiofs_submounts.py.data/cleanup.sh (100%)
>  rename tests/{acceptance =>
> avocado}/virtiofs_submounts.py.data/guest-cleanup.sh (100%)
>  rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/guest.sh
> (100%)
>  rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/host.sh
> (100%)
>  rename tests/{acceptance => avocado}/vnc.py (100%)
>  rename tests/{acceptance => avocado}/x86_cpu_model_versions.py (100%)
>
> --
> 2.33.1
>
>
>

--0000000000000ab1bf05cfe9cef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Willian,</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">For the Orange Pi PC documentation:</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:n=
ieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"aut=
o"><div dir=3D"ltr" class=3D"gmail_attr">Op wo 3 nov. 2021 22:14 schreef Wi=
llian Rampazzo &lt;<a href=3D"mailto:willianr@redhat.com">willianr@redhat.c=
om</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In the discussion about=
 renaming the `tests/acceptance` [1], the<br>
conclusion was that the folders inside `tests` are related to the<br>
framework running the tests and not directly related to the type of<br>
the tests.<br>
<br>
This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the<br=
>
CI related files and the documentation.<br>
<br>
[1] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg065=
53.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu.=
org/archive/html/qemu-devel/2021-05/msg06553.html</a><br>
<br>
GitLab pipeline with new naming: <a href=3D"https://gitlab.com/willianrampa=
zzo/qemu/-/pipelines/401431592" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.com/willianrampazzo/qemu/-/pipelines/401431592</a><br>
Signed-off-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">willianr@redhat.com</a>&gt;<br>
<br>
Willian Rampazzo (1):<br>
=C2=A0 tests/acceptance: rename tests acceptance to tests avocado<br>
<br>
=C2=A0.gitlab-ci.d/buildtest-template.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.gitlab-ci.d/buildtest.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 56 +++++++++----------<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 52 +=
+++++++---------<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0docs/devel/build-system.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0docs/devel/ci-definitions.rst.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0docs/devel/testing.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 49 ++++++++--------<br>
=C2=A0docs/system/arm/orangepi.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +--<br>
=C2=A0python/qemu/machine/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0python/qemu/qmp/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0python/qemu/utils/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++---<br>
=C2=A0tests/acceptance/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ----<br>
=C2=A0tests/avocado/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++<br>
=C2=A0.../avocado_qemu/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/boot_linux.py=C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0.../boot_linux_console.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/boot_xen.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/cpu_queries.py=C2=A0 |=C2=A0 0<br>
=C2=A0.../empty_cpu_model.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/hotplug_cpu.py=C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/info_usernet.py |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/intel_iommu.py=C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/linux_initrd.py |=C2=A0 2 +-<br>
=C2=A0.../linux_ssh_mips_malta.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../machine_arm_canona1100.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../machine_arm_integratorcp.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../machine_arm_n8x0.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/machine_avr6.py |=C2=A0 2 +-<br>
=C2=A0.../machine_m68k_nextcube.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../machine_microblaze.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../machine_mips_fuloong2e.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../machine_mips_loongson3v.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../machine_mips_malta.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../machine_rx_gdbsim.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../machine_s390_ccw_virtio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../machine_sparc64_sun4u.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../machine_sparc_leon3.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/migration.py=C2=A0 =C2=A0 |=C2=A0 =
0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/multiprocess.py |=C2=A0 0<br>
=C2=A0.../pc_cpu_hotplug_props.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/ppc_405.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/ppc_bamboo.py=C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0.../{acceptance =3D&gt; avocado}/ppc_mpc8544ds.py=C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/ppc_prep_40p.py | 12 ++--<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/ppc_pseries.py=C2=A0 |=C2=A0 0<br>
=C2=A0.../ppc_virtex_ml507.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../{acceptance =3D&gt; avocado}/replay_kernel.py=C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/replay_linux.py |=C2=A0 0<br>
=C2=A0.../reverse_debugging.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/smmu.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/tcg_plugins.py=C2=A0 |=C2=A0 0<br>
=C2=A0.../tesseract_utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/version.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/virtio-gpu.py=C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0.../virtio_check_params.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../{acceptance =3D&gt; avocado}/virtio_version.py |=C2=A0 0<br>
=C2=A0.../virtiofs_submounts.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../virtiofs_submounts.py.data/cleanup.sh=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0.../guest-cleanup.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../virtiofs_submounts.py.data/guest.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 0<br>
=C2=A0.../virtiofs_submounts.py.data/host.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 0<br>
=C2=A0tests/{acceptance =3D&gt; avocado}/vnc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 0<br>
=C2=A0.../x86_cpu_model_versions.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A064 files changed, 113 insertions(+), 118 deletions(-)<br>
=C2=A0delete mode 100644 tests/acceptance/README.rst<br>
=C2=A0create mode 100644 tests/avocado/README.rst<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/avocado_qemu/__init__.py (9=
9%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/boot_linux.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/boot_linux_console.py (100%=
)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/boot_xen.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/cpu_queries.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/empty_cpu_model.py (100%)<b=
r>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/hotplug_cpu.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/info_usernet.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/intel_iommu.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/linux_initrd.py (99%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/linux_ssh_mips_malta.py (10=
0%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_arm_canona1100.py (=
100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_arm_integratorcp.py=
 (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_arm_n8x0.py (100%)<=
br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_avr6.py (98%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_m68k_nextcube.py (1=
00%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_microblaze.py (100%=
)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_mips_fuloong2e.py (=
100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_mips_loongson3v.py =
(100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_mips_malta.py (100%=
)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_rx_gdbsim.py (100%)=
<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_s390_ccw_virtio.py =
(100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_sparc64_sun4u.py (1=
00%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/machine_sparc_leon3.py (100=
%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/migration.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/multiprocess.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/pc_cpu_hotplug_props.py (10=
0%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/ppc_405.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/ppc_bamboo.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/ppc_mpc8544ds.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/ppc_prep_40p.py (92%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/ppc_pseries.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/ppc_virtex_ml507.py (100%)<=
br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/replay_kernel.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/replay_linux.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/reverse_debugging.py (100%)=
<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/smmu.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/tcg_plugins.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/tesseract_utils.py (100%)<b=
r>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/version.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtio-gpu.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtio_check_params.py (100=
%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtio_version.py (100%)<br=
>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtiofs_submounts.py (100%=
)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtiofs_submounts.py.data/=
cleanup.sh (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtiofs_submounts.py.data/=
guest-cleanup.sh (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtiofs_submounts.py.data/=
guest.sh (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/virtiofs_submounts.py.data/=
host.sh (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/vnc.py (100%)<br>
=C2=A0rename tests/{acceptance =3D&gt; avocado}/x86_cpu_model_versions.py (=
100%)<br>
<br>
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000000ab1bf05cfe9cef5--
