Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5913529lfp;
        Tue, 18 Feb 2020 01:12:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIqIoCo4oWwiO0erxxbwaRqKHQ0/sOgjJHdclbjoBNB6PDjLcwqjy/QTGELBvZC6Fmie0G
X-Received: by 2002:ac8:108:: with SMTP id e8mr16685663qtg.101.1582017151324;
        Tue, 18 Feb 2020 01:12:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si1608593qkh.45.2020.02.18.01.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:12:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Xd1UjH3A;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3yve-0008L3-Jx
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1j3yrC-0003zv-Ku
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:07:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1j3yrB-00058h-Mw
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:07:54 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1j3yrB-00058V-HD; Tue, 18 Feb 2020 04:07:53 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 21EF196EF0;
 Tue, 18 Feb 2020 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582016872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcbrpJn7ZNHEBPmVPSCnoiPsS8wYKfqB/hJ7sXmcHNo=;
 b=Xd1UjH3AELoJcIJyYOoMfQGKbNiMwKPv1w1MEvc/sUgBbMlZySRb+WEiJ9lnEUNQxYg4yB
 KcS/ZZqIlMmzp9W7eLXH0P4CFdwfmyNHA+M8t7Oy78OuLts+SM4wgLzA84X8jAnn568jla
 oAFpuD/n/N4gcs5oXzeuomah30LAsBo=
Subject: Re: [PATCH v2 01/13] hw/arm/raspi: Remove
 ignore_memory_transaction_failures on the raspi2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-2-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <043ba4f7-4973-7c55-cc4d-84bb18a778aa@greensocs.com>
Date: Tue, 18 Feb 2020 10:07:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217114533.17779-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-PH
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582016872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcbrpJn7ZNHEBPmVPSCnoiPsS8wYKfqB/hJ7sXmcHNo=;
 b=AtNeMtYjUdDuQ5f1//Rt8jMDPBZe8TVA2KFGL4fQyxTPuPcqM0cSHJWw+TL7VCjcvQ8+X8
 xSsgiGh7Vymbk1Aqo7vmA5ZPMEXW6JbM+eLkVKkdS1RxfvuVwhiqJqzChViEi+1aW1Rykn
 xVyx82hfu4/dajarBCfF92TL3Z1J5A0=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582016872; a=rsa-sha256; cv=none;
 b=t+DEneg9wQZsm97k2+/GhQdGRi7hJvz78pwI1BuM5nW3ZiRlmkLaP+pV8IeNtLAiR36q3O
 96Jr7dek1OLvwKhlEOWgFR/4FGn5n9xKVSXmOn+jcVlltUlcLIgfDYoVqm0oTbNeb9ikzr
 Tz21qX4syr07NZx8k+iblayQbPxJL38=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtykCGq2z7qT

On 2/17/20 12:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Commit 1c3db49d39 added the raspi3, which uses the same peripherals
> than the raspi2 (but with different ARM cores). The raspi3 was
> introduced without the ignore_memory_transaction_failures flag.
> Almost 2 years later, the machine is usable running U-Boot and
> Linux.
> In commit 00cbd5bd74 we mapped a lot of unimplemented devices,
> commit d442d95f added thermal block and commit 0e5bbd7406 the
> system timer.
> As we are happy with the raspi3, let's remove this flag on the
> raspi2.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/raspi.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 90ad9b8115..221356933e 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -324,9 +324,6 @@ static void raspi_machine_class_init(ObjectClass *o=
c, void *data)
>      mc->no_cdrom =3D 1;
>      mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D cores_count=
(board_rev);
>      mc->default_ram_size =3D board_ram_size(board_rev);
> -    if (board_version(board_rev) =3D=3D 2) {
> -        mc->ignore_memory_transaction_failures =3D true;
> -    }
>  };
> =20
>  static const TypeInfo raspi_machine_types[] =3D {
>=20
