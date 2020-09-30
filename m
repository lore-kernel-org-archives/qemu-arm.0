Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5289360lfq;
        Wed, 30 Sep 2020 00:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh+xvjm1GZekSNuZdqLw7GHj6cAMuP+sqffy7/rIjGGQW8eNl9AIAiLDG1K9ZLMNEmxNbi
X-Received: by 2002:a17:906:d8cd:: with SMTP id re13mr1536035ejb.140.1601452732853;
        Wed, 30 Sep 2020 00:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601452732; cv=none;
        d=google.com; s=arc-20160816;
        b=rZ213eMgUuMpoiPnfMTlFrOiS3QKzPShd5H0/IQ8y0EFE4UaQuzn+7+/Nu5fDKAxY2
         uQE/Fxux+P2YSOemRIUcBHFMnR03cKq+OhzWRVmgMOAS91BoJp1s/twlihdo4mzb6dz6
         6IYNPu413N7rt8+1foKdhDNyzNYJhCAKe52m/PjOTDosLkMV8nVG05Sj61yuYnWJlirG
         bTqM4zFcmXMuLhr9LA5q2fGRYnSssCMOD+zNv5H8y4VR1LBwpCYacx5/BbK2MqXBVM+1
         /ElwJKwiYLk7vwW66xq1GAzf2bSiNxM2Se5ZXMbTTCSSbkeoJCptSDuPNC8HLJrFEXgD
         qF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=9UK1L1ZkImu26Sre+1+L0kxvnt8evmM4tiE1NkrMAeg=;
        b=DfnXPL4dqHVHuo7lbb4wEF8Tc73BlmRDlgMiOZY68ku4dX10tIRmMwDOYqvRvDPxgp
         b4NyYDsOU7LyGVP5xosBwKwVDKxTv+3/lhC4tzeYt1Ar4gsYlPMOUGGbRJle0QjhxA+H
         DhqXCMNdCJEmi4k+X0t/XMByPg+ah7E2+Xac4AyHduv+SA8EZR9mERL958nlGFgYORdt
         tv6bi+jIluKsHk51kupMTNH3ULrBmeyOwvq/DkrLLfFxfMUWvxA4ga9pS1EIgJUdBTeM
         ptdJOfVq7lW8qPuqVDAwNNTxP54y6M90gmnLusHPUBp4S3JmC8V6VFeMvlld5c1Tl2MD
         bH8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D5dLbpD9;
       spf=pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id e18si535622edv.524.2020.09.30.00.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 00:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D5dLbpD9;
       spf=pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601452731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UK1L1ZkImu26Sre+1+L0kxvnt8evmM4tiE1NkrMAeg=;
	b=D5dLbpD9lY22YccFeDEYuVEJhuNsgTPe7E2jXV/KEnfWRc1CkRnAZdmkaRcdMnlJPdKp5V
	x7mGFCxX9+KG9EENHKHygLe6jgvZr2geNDKiWjvAuveM00PaakZZo2N8WGWdqt1WdCnk8l
	xlxGFjNa0kXi3uGu2FJirPIoiwrTZzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-TJ916KJOOwqggiYIDRRdIw-1; Wed, 30 Sep 2020 03:58:46 -0400
X-MC-Unique: TJ916KJOOwqggiYIDRRdIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C030E1074652;
	Wed, 30 Sep 2020 07:58:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DE085C1CF;
	Wed, 30 Sep 2020 07:58:42 +0000 (UTC)
Date: Wed, 30 Sep 2020 09:58:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Richard Henderson
 <rth@twiddle.net>
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
Message-ID: <20200930095841.3df7f8ee@redhat.com>
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-TUID: DNrw7lyngtyT

On Wed, 30 Sep 2020 00:43:43 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Cover from Samuel Ortiz from (part 1) [1]:
>=20
>   This patchset allows for building and running ARM targets with TCG
>   disabled. [...]
>=20
>   The rationale behind this work comes from the NEMU project where we're
>   trying to only support x86 and ARM 64-bit architectures, without
>   including the TCG code base. We can only do so if we can build and run
>   ARM binaries with TCG disabled.

I don't recall exact reason but TCG variant is used by bios-tables-test
to test arm/virt so it will probably break that
(it has something to do with how KVM uses CPU/GIC, which was making
ACPI tables not stable (i.e. depend on host), so comparison with master
tables was failing)


>=20
> v4 almost 2 years later... [2]:
> - Rebased on Meson
> - Addressed Richard review comments
> - Addressed Claudio review comments
>=20
> v3 almost 18 months later [3]:
> - Rebased
> - Addressed Thomas review comments
> - Added Travis-CI job to keep building --disable-tcg on ARM
>=20
> v2 [4]:
> - Addressed review comments from Richard and Thomas from v1 [1]
>=20
> Regards,
>=20
> Phil.
>=20
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
> [4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html
>=20
> Green CI:
> - https://cirrus-ci.com/build/4572961761918976
> - https://gitlab.com/philmd/qemu/-/pipelines/196047779
> - https://travis-ci.org/github/philmd/qemu/builds/731370972
>=20
> Based-on: <20200929125609.1088330-1-philmd@redhat.com>
> "hw/arm: Restrict APEI tables generation to the 'virt' machine"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg745792.html
>=20
> Philippe Mathieu-Daud=C3=A9 (10):
>   accel/tcg: Add stub for cpu_loop_exit()
>   meson: Allow optional target/${ARCH}/Kconfig
>   target/arm: Select SEMIHOSTING if TCG is available
>   target/arm: Restrict ARMv4 cpus to TCG accel
>   target/arm: Restrict ARMv5 cpus to TCG accel
>   target/arm: Restrict ARMv6 cpus to TCG accel
>   target/arm: Restrict ARMv7 R-profile cpus to TCG accel
>   target/arm: Restrict ARMv7 M-profile cpus to TCG accel
>   target/arm: Reorder meson.build rules
>   .travis.yml: Add a KVM-only Aarch64 job
>=20
> Samuel Ortiz (1):
>   target/arm: Do not build TCG objects when TCG is off
>=20
> Thomas Huth (1):
>   target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
>=20
>  default-configs/arm-softmmu.mak |  3 --
>  meson.build                     |  8 +++-
>  target/arm/cpu.h                | 12 ------
>  accel/stubs/tcg-stub.c          |  5 +++
>  target/arm/cpu_tcg.c            |  4 +-
>  target/arm/helper.c             |  7 ----
>  target/arm/m_helper-stub.c      | 73 +++++++++++++++++++++++++++++++++
>  .travis.yml                     | 35 ++++++++++++++++
>  hw/arm/Kconfig                  | 32 +++++++++++++++
>  target/arm/Kconfig              |  4 ++
>  target/arm/meson.build          | 40 +++++++++++-------
>  11 files changed, 184 insertions(+), 39 deletions(-)
>  create mode 100644 target/arm/m_helper-stub.c
>  create mode 100644 target/arm/Kconfig
>=20
