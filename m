Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d4a8e000000b00332e073f12bsm18335888wrq.19.2023.11.29.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:44:07 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F006E5F7AF;
	Wed, 29 Nov 2023 16:44:06 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Cc: <peter.maydell@linaro.org>,  <qemu-devel@nongnu.org>,
  <qemu-arm@nongnu.org>,  <quic_tsoni@quicinc.com>,
  <quic_pheragu@quicinc.com>,  <quic_eberman@quicinc.com>,
  <quic_yvasi@quicinc.com>,  <quic_cvanscha@quicinc.com>,
  <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v0 02/12] update-linux-headers: Include gunyah.h
In-Reply-To: <20231011165234.1323725-3-quic_svaddagi@quicinc.com> (Srivatsa
	Vaddagiri's message of "Wed, 11 Oct 2023 16:52:24 +0000")
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
	<20231011165234.1323725-3-quic_svaddagi@quicinc.com>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Wed, 29 Nov 2023 16:44:06 +0000
Message-ID: <87leag8q7d.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wNLxJw5Z+jPw

Srivatsa Vaddagiri <quic_svaddagi@quicinc.com> writes:

> gunyah.h containts UAPI definitions exported by Gunyah Linux kernel
> driver. This file will be referenced by Gunyah accelerator driver in
> Qemu.
>
> Note: Gunyah Linux kernel driver is not yet merged in Linux kernel.
> v14 of the patch series has been posted on mailing lists.
>
> https://lore.kernel.org/lkml/20230613172054.3959700-1-quic_eberman@quicin=
c.com/
>
> One of the subsequent versions of the patch is expected to be merged
> upstream soon, after this this change to 'update-linux-headers' can be
> run against the main Linux kernel source repository from kernel.org.
>
> In the meantime, a version of Gunyah kernel driver is available in
> Android kernel repository, against which this change can be run.
>
> https://android.googlesource.com/kernel/common
> Branch: android14-6.1
>
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>

with fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

although it will need another fixup on rebase due to other headers being
added. Maybe now is the time to sort the header list to lessen the
chance of clashes in future?


> ---
>  scripts/update-linux-headers.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
> index 35a64bb501..3f3608bcbe 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -161,7 +161,8 @@ done
>  rm -rf "$output/linux-headers/linux"
>  mkdir -p "$output/linux-headers/linux"
>  for header in const.h stddef.h kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost=
.h \
> -              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h=
 vduse.h; do
> +              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h=
 \
> +              vduse.h gunyah.h; do
>      cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
>  done

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
