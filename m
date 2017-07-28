Received: by 10.25.44.15 with SMTP id s15csp90207lfs;
        Thu, 27 Jul 2017 23:56:01 -0700 (PDT)
X-Received: by 10.55.40.218 with SMTP id o87mr8516881qko.50.1501224960971;
        Thu, 27 Jul 2017 23:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501224960; cv=none;
        d=google.com; s=arc-20160816;
        b=MQ2yFgrq+uNiNYx/CGKzIMFTm5VAnXXPXz/VPLXS8jkl9F7eTPXZUZvVpZewdq80r3
         wbAGquFBJutACD2Lya5fE1vDd5L2BYvdVazOByHZixMiGZRZmTsaHequi7D5wboVnSa4
         yD3w3xGXZg5OfL4k8Hn4m8hQQqHJuA4lwAm0d4DCD/y4Q+VnQzW1LweClK02qaO3HljE
         9tAc9/Ep2oAiaB4VTS98OqRopdmIQr4pz4IHHWvzowzAjtbpnQkEn6WL84sTOqe32Q7w
         fJYeteTaf4Doajdpij8WOM0W3TSMeI/rMIcY+nF6YqxeEISdCYfIbbyq5H/dkXC6Nmbj
         iB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=Qqb8mkSLQZDjJhLTMM9xDgKsXAWqPQr6leRCwU2nC8Y=;
        b=bYFLbBrd1LWM/vqAoTyiwj2xSn+QimdhdKCnpfe76rwPHSVIzX5FuGzMXWmd4bO15R
         jovNFHzoQlWXIjZMoNj/ZiUpBRc15/9aGuOeqYUDMAdgVbG9mc1iQjy8VLqI6BzEFU/z
         9HJQQ24jilzMj0s6+RVLldjXay6toNMh9K7r44aS3XzczMLaNXB+WtJ9746HZDX0JGdD
         y3Y1Xvyhy+JiITdTPSXUqxWmWQofUZklpynQ55cSBu+JfXKhiJTNUdJ3N1YDJOshtS2n
         aAmUqjZdSJltgM6Ru90s+1CHpxpoNgh77H1G3hMCEkGRl3UyqSRXp0ObNpk3vp20KSb0
         RwEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n134si12545612qkn.515.2017.07.27.23.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 23:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dazBm-0006yf-9O
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 02:55:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazBf-0006yX-Ss
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 02:55:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazBb-0004V8-T0
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 02:55:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dazBb-0004Uf-Mx; Fri, 28 Jul 2017 02:55:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7354C365923;
	Fri, 28 Jul 2017 06:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7354C365923
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 837AA70902;
	Fri, 28 Jul 2017 06:55:44 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <db19cb55-ab00-d889-521c-836d0f7e6464@redhat.com>
Date: Fri, 28 Jul 2017 08:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 28 Jul 2017 06:55:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/47] MAINTAINERS: add missing
 ARM entries
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WUYKQojsuQaj

On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 972118e70b..795f89f709 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -120,6 +120,8 @@ F: include/hw/cpu/a*mpcore.h
>  F: disas/arm.c
>  F: disas/arm-a64.cc
>  F: disas/libvixl/
> +F: default-configs/arm-softmmu.mak
> +F: default-configs/aarch64-softmmu.mak

You've added this to the TCG CPU core section, but strictly speaking
these files are also used for the machine emulation in general (and also
for KVM). So not sure whether this is a good fit here ... up to Peter to
decide.

>  CRIS
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> @@ -380,6 +382,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/char/pl011.c
> +F: include/hw/char/pl011.h
>  F: hw/display/pl110*
>  F: hw/dma/pl080.c
>  F: hw/dma/pl330.c
> @@ -402,14 +405,19 @@ F: hw/intc/arm*
>  F: hw/intc/gic_internal.h
>  F: hw/misc/a9scu.c
>  F: hw/misc/arm11scu.c
> +F: hw/misc/arm_sysctl.c

According to a comment in that file, it is about RealView/Versatile
boards instead, so this is the wrong section here?

>  F: hw/timer/a9gtimer*
>  F: hw/timer/arm_*
> +F: hw/timer/armv7m_systick.c

How about rather removing the underscore in the previous wildcard entry?

>  F: include/hw/arm/arm.h
> +F: include/hw/arm/armv7m*.h
>  F: include/hw/intc/arm*
>  F: include/hw/misc/a9scu.h
>  F: include/hw/misc/arm11scu.h
>  F: include/hw/timer/a9gtimer.h
>  F: include/hw/timer/arm_mptimer.h
> +F: include/hw/timer/armv7m_systick.h
> +F: tests/test-arm-mptimer.c
> =20
>  Exynos
>  M: Igor Mitsyanko <i.mitsyanko@gmail.com>
>=20

 Thomas
