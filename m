Received: by 10.25.21.96 with SMTP id l93csp692312lfi;
        Tue, 5 Jul 2016 23:55:49 -0700 (PDT)
X-Received: by 10.55.215.141 with SMTP id t13mr29159340qkt.31.1467788149069;
        Tue, 05 Jul 2016 23:55:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e74si1611915qkj.11.2016.07.05.23.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jul 2016 23:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:59692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKgkO-0001FT-EI
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 02:55:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1bKgh4-0007lL-QV
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 02:52:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1bKgh3-0001Wa-Kt
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 02:52:22 -0400
Received: from greensocs.com ([193.104.36.180]:35170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>)
	id 1bKggx-0001Vu-LV; Wed, 06 Jul 2016 02:52:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 48F2A197EAA9;
	Wed,  6 Jul 2016 08:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1467787934;
	bh=hoECXfFcR0ESb9Uok736pKXPlQSzoV27z+Wa24Oh27Y=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=GrAUP4yrkA6A9VaUpN7oPP25V8FDrfcTJ7RYj6WfvXTjDyDlPOOjD8Uhe3zTQWPtk
	lF0EO92ZS8CMELyNVmnLtHmXSj4tdG8L4i3xIXNFAmh4CO4Q69t8FLhdT3WE+QoK92
	l9eWSfAODN1Lyk9aybXBUa2+O1ZfBx3+eNHYJyww=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PEWhnpDJjiQ; Wed,  6 Jul 2016 08:52:13 +0200 (CEST)
Received: from corsair.home (AToulouse-659-1-28-150.w92-149.abo.wanadoo.fr
	[92.149.135.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: fred.konrad@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id AB5A8197EAA4;
	Wed,  6 Jul 2016 08:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1467787933;
	bh=hoECXfFcR0ESb9Uok736pKXPlQSzoV27z+Wa24Oh27Y=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=X6e1NAiB+SlSd6POGY6EsvEw05W1iGMnSXLRVzj30CRZRN9NnCLIrHGrb0fUpg2JW
	ervvTfgjK+1WOgdIyTrWmW2T2nIrl2G0PiLQ9IQ+jpRMYvXVt+e4cm2ykIk2CWVOW0
	TYeXojl5blQS16ZiNuIRjYLhuPSLYz0V99Rj485g=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
From: Frederic Konrad <fred.konrad@greensocs.com>
Message-ID: <577CAA9C.1070804@greensocs.com>
Date: Wed, 6 Jul 2016 08:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-devel] [PATCH for-2.7] aux: Rename aux.[ch] to
 auxbus.[ch] for the benefit of Windows
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org,
	=?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JrRg9GA0LPQsNC9?= <akurgan@yandex.ru>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xgngsIFSE9gC

On 07/01/2016 02:45 PM, Peter Maydell wrote:
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

oops sorry for that :).

Tested-by: KONRAD Frederic <fred.konrad@greensocs.com>

Thanks,
Fred

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

