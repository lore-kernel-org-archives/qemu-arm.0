Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp922539wrq;
        Wed, 6 Jun 2018 07:53:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLKqJbSa9Iti3JfJVfjQ32RWWJ4HGt6qCI/ZtrU2XHhSCHcjx1A0HYmawpHAqXwsg7rWRwZ
X-Received: by 2002:ac8:6045:: with SMTP id k5-v6mr3173932qtm.204.1528296800962;
        Wed, 06 Jun 2018 07:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528296800; cv=none;
        d=google.com; s=arc-20160816;
        b=HVtDfuD8+H6zByFiuHFSEKmNiqw/EcpiKPpLKVjK9Khb5B8fY8vmMbtUKR16wLXH3k
         ceJbtfKxC8szlTWdXSrDqUYXUUqtYc4OQpP9vjkVW6t7+uKQ4ZHC4jrL/PrHBuysIcXr
         ZidydgdBxMo2hBMm13nuoi49fSEf76JcoFzGfaGOc0kRvj3mE7eCrxkAsBXtMQ9j/GCf
         vvVjJ/GJwWszIoHlwivcBQmXe1jsRBpSTtiQbmTsmVt9lNilWlHad9ay4jMHhWDGLLBn
         vWuKJzeK5YzfRKt9vOQsGfar6eUefuGoZVot3PMgA8EbTbL+giQWFoe3zik5Qz5wP1v+
         PRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=4p36UTYQ8vD8Uc8BRW+ZC81BHzFEQDsAk3TG0yjBZ8A=;
        b=VfaWhLAyhjNo2zIlJwupwt7u2buD2/8Es/lZKboGu9RQnR+bwRd1lw2hacrga1iM9U
         qhoP5qqzuvMH1DrsMqvBvY89uMfKhOuw5Sd4ju9KzNFIdIkdNWCYwpl7/Svfz7nYnPrX
         jSsNlGyGpqntht4Dvj1tZqh/G2OQ/aXMREviwXNDgodkQPRUSWwu4yHIgCHJ9JVPZ6lY
         DeiY0s4Qfs7l8VA+lR5C0SO78KQCKI4gYeVCj2EzZdBY0iupCsgsaqvAauqRTGwJPg4I
         W73VPYBGlR+jwja9898CcvSFXuBFchKAdv5aUNQFrE+yIzqMX+Ab6Y62PZd0EWEN8iN+
         sO5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14-v6si3813288qks.385.2018.06.06.07.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 07:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQZoO-0000QA-F0
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 10:53:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fQZoC-0000Nk-4g
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 10:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fQZo9-00041w-0C
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 10:53:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49754 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fQZo8-00041i-Ro; Wed, 06 Jun 2018 10:53:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 249DA401DE66;
	Wed,  6 Jun 2018 14:53:04 +0000 (UTC)
Received: from [10.36.116.65] (ovpn-116-65.ams2.redhat.com [10.36.116.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5766511301CD;
	Wed,  6 Jun 2018 14:53:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180606144706.29732-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1160f838-5625-b9bf-6c34-3071ed185074@redhat.com>
Date: Wed, 6 Jun 2018 16:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606144706.29732-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 06 Jun 2018 14:53:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 06 Jun 2018 14:53:04 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Adopt the Gumstix
 computers-on-module machines
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FDXdKIei93ta

On 06.06.2018 16:47, Philippe Mathieu-Daud=C3=A9 wrote:
> These COMs are hard to find, and the companie dropped the support
> few years ago.
>=20
> Per the "Gumstix Product Changes, Known Issues, and EOL" pdf:
>=20
> - Phasing out: PXA270-based Verdex product line
>   September 2012
>=20
> - Phasing out: PXA255-based Basix & Connex
>   September 2009
>=20
> However there are still booting SD card image availables, very
> convenient to stress test the QEMU SD card implementation.
> Therefore I volunteer to keep an eye on this file, while it
> is useful for testing.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41cd3736a9..1825deb762 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -491,9 +491,10 @@ F: include/hw/arm/digic.h
>  F: hw/*/digic*
> =20
>  Gumstix
> +M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  L: qemu-devel@nongnu.org
>  L: qemu-arm@nongnu.org
> -S: Orphan
> +S: Odd Fixes
>  F: hw/arm/gumstix.c

Great! So we can also remove the Gumstix entries from
https://wiki.qemu.org/Features/LegacyRemoval ?

 Thomas
