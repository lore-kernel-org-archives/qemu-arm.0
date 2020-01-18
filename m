Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp447575lff;
        Sat, 18 Jan 2020 05:31:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwI2QrWU2esd4/U7NufTOCWzI+rGRHVm1jojJ7frLqPOvTIaueQHKDRQF9Vzyu+4UmWGffJ
X-Received: by 2002:ac8:685:: with SMTP id f5mr11901374qth.199.1579354262845;
        Sat, 18 Jan 2020 05:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579354262; cv=none;
        d=google.com; s=arc-20160816;
        b=GOD7TgYxgU4LScmS2+LPBomUzjbiCBXUJZKlyRqvrGJRMxYe2sFAOMRukevE01Pgfw
         nweHaN5x1fMxI+fn/2SbDyh8nEyx6kXVC6ebN9WGy8xcr1OxAz/DLJkjtzsartgQk8pK
         ZvJ8gmTx87PP67+agb/7KMyUvKZapjTvxw5eMaUaz02bvduQpzq9KB1FUsVDnRwFDdbo
         bgDHGaH5HblvCuUVX81nXpij/pWnhvINKlx1V5RfQlWK23xqzgkfHZK49J22xs/lpOl1
         ecKwR2ZmyXbOa4kV4Zc87Ifeq9m+MAZqxn/063+8s3guvInEMoRjt7a8YuveW2I3TBcL
         qDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=Lf+UtRNOGS38Pwon3ps7Xnso3KHgL4d4xeGT+ZIesCc=;
        b=mteUYS1ihJZmCsXSNIp4XMbSRkQUc2grCIJVNbXa5fOHC04hmbWNyrkkMBZRMCp5Bv
         LKHLLHiNQK9hTyUR51z5252sWV+N+AFeJiiVBvf9ni/7DL+YpbnKi7k3SYFlyanzsWqr
         h5Uh/YefjN40R8p1in6Uls5LV8msnforh2tKYGmaPiETOSr7rMuWh0GXDykW67xvi6Ut
         8VMUE+iJ/uAGkRur/tfFQ138F8iqQGUBJB/ezM3fj1AHbypffQ5WqA0xAzLXcAAVMJXA
         tHcqaSF6tZu2HgbY+iKpgaXGErFSRmbHORd5Ih5yX+RQibCAWerWz96V3ngLXXe2qaFP
         LnUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HP42IC1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si17269921qkh.186.2020.01.18.05.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 05:31:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HP42IC1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isoBq-000724-7m
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 08:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1isoBh-00071c-Jl
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 08:30:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1isoBg-0001XN-BM
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 08:30:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29400
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1isoBg-0001X8-8A
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 08:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579354251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lf+UtRNOGS38Pwon3ps7Xnso3KHgL4d4xeGT+ZIesCc=;
 b=HP42IC1uPxI3dq1tpqG4KnOV7ulqtIcuAGKJPrM6NeI+pkPowMWkKUv/B6W8R5nPC57obe
 9DotAxR3CFLXmzsZaJ0E+xVMf2NnRa5NG5EJvlFFTW0JPuSMIQGQEfZfGEaDH1kFprdwt2
 Mcl1L3UGWDgVsd+2ECmR/MfW0kvEod0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-89VRmMybMbWWCryUOPm8Yg-1; Sat, 18 Jan 2020 08:30:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33C51107ACC4;
 Sat, 18 Jan 2020 13:30:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9990384BC9;
 Sat, 18 Jan 2020 13:30:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2611F1138600; Sat, 18 Jan 2020 14:30:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Move the OMAP section inside the ARM
 Machines one
References: <20200118085509.30182-1-philmd@redhat.com>
 <20200118085509.30182-3-philmd@redhat.com>
Date: Sat, 18 Jan 2020 14:30:45 +0100
In-Reply-To: <20200118085509.30182-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 18 Jan 2020 09:55:09
 +0100")
Message-ID: <87pnfgq4ca.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 89VRmMybMbWWCryUOPm8Yg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NPwxAi05az9V

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Add the Siemens SX1 (OMAP310) machines with the other ARM machines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 52fbc18566..e2c148d8d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -560,6 +560,13 @@ F: include/hw/arm/digic.h
>  F: hw/*/digic*
>  F: include/hw/*/digic*
> =20
> +OMAP
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/*/omap*
> +F: include/hw/arm/omap.h
> +
>  Gumstix
>  M: Peter Maydell <peter.maydell@linaro.org>
>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> @@ -1404,13 +1411,6 @@ F: include/hw/block/fdc.h
>  F: tests/qtest/fdc-test.c
>  T: git https://github.com/jnsnow/qemu.git ide
> =20
> -OMAP
> -M: Peter Maydell <peter.maydell@linaro.org>
> -L: qemu-arm@nongnu.org
> -S: Maintained
> -F: hw/*/omap*
> -F: include/hw/arm/omap.h
> -
>  IPack
>  M: Alberto Garcia <berto@igalia.com>
>  S: Odd Fixes

Commit message says "add", patch seems to merely move an existing
entry.  What am I missing?

