Received: by 10.223.188.70 with SMTP id a6csp1889181wrh;
        Wed, 30 Aug 2017 22:07:55 -0700 (PDT)
X-Received: by 10.80.182.157 with SMTP id d29mr501558ede.287.1504156075701;
        Wed, 30 Aug 2017 22:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504156075; cv=none;
        d=google.com; s=arc-20160816;
        b=1AR/9H6Gv2BTTQKQBbzfOwcdJGTZ5YYFDhLyklEsFyiZEGOoqwtVP+x8Ji8xxtyXRo
         8ONpsEeX9qBg3//avV+cgRPhtdJzG3wWNsQ9B4yN0vSLZu3D8aKgWXUaRfL1oYPxRucV
         QtaEVKUQPpe4VIhOvQWD6WgTdXU0ru1vRoKyB/SXMJ1vlh9+GDsqZtc3IkEFb8EWndd3
         ewp1klytzvo4ytyKYX2V/CJnq4kyjbrnZpTkAp6L6sVm+vsEk3kEEDgNJqPZbOwumLxK
         cj34BPVD8A8lMkx4xeuecb7PKYapPu3EOuLSfz5JCEvxF6LoAX6EH7Aq9a0BemwFzg/A
         rJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=AKo8pe6ay5mOcU+GqS4OaPNxJOFkMIrKhZIsV7gkb6s=;
        b=tts2Q5sCizXI7d9N++cyvc5WlBTILB8OxJyGyIvjanJ8xTA9mqegY3HQT0ETZdgikS
         4T8Y7J2dm3xgGSOCIyhpWmH61UGyo56oBh/yPwxOFHSNRWmTHPCj+GdrALfwboLRodNL
         L0kA9gt3BqXzs5ToSnagudKBWnLCLpDZv7asOkykU+zActLXPocnANYwYbUQC/q+cBWd
         Tydm8BFAeHSJAekWZ7fwOF38SYPruyOrtZTlr9j6D8GJwAZPCtU8b+TC50/8wT34WH68
         JM5v/87kQ2ATIHH366MDCT0WAcQGAjX7hecHceP33y73TWs4A4BJM3It2Ria4sLHEHUc
         tYtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u35si6505116edc.485.2017.08.30.22.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 22:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnHhq-0005s7-NB
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 01:07:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnHhg-0005rm-P6
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 01:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnHhd-0006B0-Ks
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 01:07:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dnHhd-0006Ap-EK; Thu, 31 Aug 2017 01:07:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B5C080E7A;
	Thu, 31 Aug 2017 05:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3B5C080E7A
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.27] (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F9B18B2A;
	Thu, 31 Aug 2017 05:07:38 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3fae2ca1-90d0-b62a-d932-8c0d2cf2b62c@redhat.com>
Date: Thu, 31 Aug 2017 07:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170830215523.25278-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 31 Aug 2017 05:07:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 01/17] MAINTAINERS: add missing ARM entries
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
X-TUID: 3M5v2pVAXWc0

On 30.08.2017 23:55, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccee28b12d..b363e1b9c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -380,6 +380,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/char/pl011.c
> +F: include/hw/char/pl011.h
>  F: hw/display/pl110*
>  F: hw/dma/pl080.c
>  F: hw/dma/pl330.c
> @@ -403,13 +404,15 @@ F: hw/intc/gic_internal.h
>  F: hw/misc/a9scu.c
>  F: hw/misc/arm11scu.c
>  F: hw/timer/a9gtimer*
> -F: hw/timer/arm_*
> -F: include/hw/arm/arm.h
> +F: hw/timer/arm*
> +F: include/hw/arm/arm*.h
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

Reviewed-by: Thomas Huth <thuth@redhat.com>

