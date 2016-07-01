Received: by 10.25.21.96 with SMTP id l93csp335571lfi;
        Fri, 1 Jul 2016 07:57:11 -0700 (PDT)
X-Received: by 10.237.37.8 with SMTP id v8mr6726957qtc.28.1467385031286;
        Fri, 01 Jul 2016 07:57:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v29si2579850qta.107.2016.07.01.07.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 07:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIzsU-0003zb-M6
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 10:57:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bIzkU-0000Ay-QD
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 10:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bIzkQ-00045w-Ki
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 10:48:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bIzkQ-00045j-CY; Fri, 01 Jul 2016 10:48:50 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F0EE7D0DA;
	Fri,  1 Jul 2016 14:48:48 +0000 (UTC)
Received: from [10.10.52.131] (unused [10.10.52.131] (may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u61Emkkc017870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2016 10:48:46 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
From: Wei Huang <wei@redhat.com>
Message-ID: <577682CD.9040806@redhat.com>
Date: Fri, 1 Jul 2016 09:48:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 01 Jul 2016 14:48:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.7] aux: Rename aux.[ch] to
 auxbus.[ch] for the benefit of Windows
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: KONRAD Frederic <fred.konrad@greensocs.com>,
	=?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JrRg9GA0LPQsNC9?= <akurgan@yandex.ru>,
	patches@linaro.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h7WLgufykUz6



On 07/01/2016 07:45 AM, Peter Maydell wrote:
> On Windows 'aux.*' is a reserved name and cannot be used for
> filenames; see
>   https://msdn.microsoft.com/en-gb/library/windows/desktop/aa365247(v=3D=
vs.85).aspx
>=20
> This prevents cloning the QEMU git repo on Windows:
>=20
> C:\Java\sources\kvm> git clone https://github.com/qemu/qemu.git
> Cloning into 'qemu'...
> remote: Counting objects: 279563, done.
> remote: Total 279563 (delta 0), reused 0 (delta 0), pack-reused 279563R
> Receiving objects: 100% (279563/279563), 122.45 MiB | 3.52 MiB/s, done.
> Resolving deltas: 100% (221942/221942), done.
> Checking connectivity... done.
> error: unable to create file hw/misc/aux.c (No such file or directory)
> error: unable to create file include/hw/misc/aux.h (No such file or dir=
ectory)
> Checking out files: 100% (4795/4795), done.
> fatal: unable to checkout working tree
> warning: Clone succeeded, but checkout failed.
> You can inspect what was checked out with 'git status'
> and retry the checkout with 'git checkout -f HEAD'
>=20
> (bug https://bugs.launchpad.net/bugs/1595240)
>=20
> Rename the offending files for the benefit of Windows.
>=20
> Reported-by: =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 =D0=9A=D1=83=D1=
=80=D0=B3=D0=B0=D0=BD <akurgan@yandex.ru>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

This patch looks legit. I tested compilation on aarch64 platform and
didn't see any problems. So,

Reviewed-by: Wei Huang <wei@redhat.com>

-Wei

> ---
>  hw/display/dpcd.c                   | 2 +-
>  hw/misc/Makefile.objs               | 2 +-
>  hw/misc/{aux.c =3D> auxbus.c}         | 4 ++--
>  include/hw/display/xlnx_dp.h        | 2 +-
>  include/hw/misc/{aux.h =3D> auxbus.h} | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  rename hw/misc/{aux.c =3D> auxbus.c} (99%)
>  rename include/hw/misc/{aux.h =3D> auxbus.h} (99%)
>=20
> diff --git a/hw/display/dpcd.c b/hw/display/dpcd.c
> index 5a36855..ce92ff6 100644
> --- a/hw/display/dpcd.c
> +++ b/hw/display/dpcd.c
> @@ -28,7 +28,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "hw/misc/aux.h"
> +#include "hw/misc/auxbus.h"
>  #include "hw/display/dpcd.h"
> =20
>  #ifndef DEBUG_DPCD
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 54020aa..4cfbd10 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -51,5 +51,5 @@ obj-$(CONFIG_MIPS_ITU) +=3D mips_itu.o
>  obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
>  obj-$(CONFIG_EDU) +=3D edu.o
>  obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
> -obj-$(CONFIG_AUX) +=3D aux.o
> +obj-$(CONFIG_AUX) +=3D auxbus.o
>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
> diff --git a/hw/misc/aux.c b/hw/misc/auxbus.c
> similarity index 99%
> rename from hw/misc/aux.c
> rename to hw/misc/auxbus.c
> index 25d7712..df2414b 100644
> --- a/hw/misc/aux.c
> +++ b/hw/misc/auxbus.c
> @@ -1,5 +1,5 @@
>  /*
> - * aux.c
> + * auxbus.c
>   *
>   *  Copyright 2015 : GreenSocs Ltd
>   *      http://www.greensocs.com/ , email: info@greensocs.com
> @@ -28,7 +28,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "hw/misc/aux.h"
> +#include "hw/misc/auxbus.h"
>  #include "hw/i2c/i2c.h"
>  #include "monitor/monitor.h"
> =20
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.=
h
> index d3a03f1..ee046a5 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -24,7 +24,7 @@
> =20
>  #include "hw/sysbus.h"
>  #include "ui/console.h"
> -#include "hw/misc/aux.h"
> +#include "hw/misc/auxbus.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/display/dpcd.h"
>  #include "hw/i2c/i2c-ddc.h"
> diff --git a/include/hw/misc/aux.h b/include/hw/misc/auxbus.h
> similarity index 99%
> rename from include/hw/misc/aux.h
> rename to include/hw/misc/auxbus.h
> index 759c3bf..af39db7 100644
> --- a/include/hw/misc/aux.h
> +++ b/include/hw/misc/auxbus.h
> @@ -1,5 +1,5 @@
>  /*
> - * aux.h
> + * auxbus.h
>   *
>   *  Copyright (C)2014 : GreenSocs Ltd
>   *      http://www.greensocs.com/ , email: info@greensocs.com
>=20
