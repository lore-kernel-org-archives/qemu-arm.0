Received: by 10.223.150.237 with SMTP id u100csp1046038wrb;
        Wed, 8 Nov 2017 01:18:12 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TIBhE0AQRKKU9luM6TL6O/6i2W3OgBmZTiZfel6xxf2heYh6QrLarM7H21OYbHXSuExPAV
X-Received: by 10.37.160.35 with SMTP id x32mr905205ybh.387.1510132692235;
        Wed, 08 Nov 2017 01:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510132692; cv=none;
        d=google.com; s=arc-20160816;
        b=LB/CK/iPmFVq7D1OEM6BygPKGbQ0hTvkRjxLBviRe2ELcbfvYFwEd+6N6F/ziC5t4t
         Sys84YcDMn1YhonOPgKdk6eTu9+UMi4/Ne+oEWKoHXLZIGQtB0dPyZDjwD/LQCzz1NS2
         hN5JjDr78gCIVK+RvttsEvxzw8eP20AdbqT6MTluZwjiR77theRq4gdUiulsn0P5M1Uj
         5qWAKZFw7iGZ/wEICub6yCEAu0dcENP6fwMbc2Qfhwzd6PZpD/HfgHgRMoaru4d5VXhB
         h1j9BWn1u9Rxd8UK4mjZcaMrnH7bsxx3OCQK2559++U54SxYDNTqkaVFYJ8/2xugWwDx
         Snfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=JNyGhzRuG0o2VbIzaL26xKnPvz26W9k2AGl0LGSnLdg=;
        b=pQ3xxtie+vlXUwed5d0g+AdxbmeG6d5p37StREStcMb01XiWxU3XrXkYrM1wZzXy9d
         3hrfSN4mU/DRv4z0jFJ3ZI7awKwXxnH0qYvPjcY3nKoC+tvJhq7SvC4+lVHW1pBjFHwz
         IwQVoOmAWR/yeb7E1KOlElsnzEy/wQb0l8eXKudDNPRNm4NoDMp80l7KjKhV17G5yHeJ
         i1mt0z5jK03wbikJz9cA6/6zGC3tm4LQTzqgaS6F+DjOxoC9q8fIAonPuoTfoIucOZQD
         LvQbElBXQefaigBKDQLSABGplhd5P37wOjPmQBrkvrx0yfzZUgwbkacQMb57PvvKP8de
         sQoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203si825785ybu.326.2017.11.08.01.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 01:18:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCMUt-00082N-O9
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 04:18:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eCMUh-0007zm-Iu
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 04:18:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eCMUd-0005Z5-MG
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 04:17:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27283)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eCMUd-0005Yb-Fo; Wed, 08 Nov 2017 04:17:55 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88E083683C;
	Wed,  8 Nov 2017 09:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 88E083683C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.33.36.57])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEF295D9C6;
	Wed,  8 Nov 2017 09:17:49 +0000 (UTC)
Date: Wed, 8 Nov 2017 09:17:45 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20171108091745.GJ12670@redhat.com>
References: <20171108022828.7242-1-f4bug@amsat.org>
	<20171108022828.7242-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171108022828.7242-3-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 08 Nov 2017 09:17:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 2/6] hw/arm: deprecate the
 EP108 board
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
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gR8FSoCFtzyp

On Tue, Nov 07, 2017 at 11:28:24PM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> From: Alistair Francis <alistair.francis@xilinx.com>
>=20
> The EP108 was an early access development board that is no longer used.
> Add an info message to convert any users to the ZCU102 instead. On QEMU
> they are both identical.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/xlnx-zcu102.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index e2d15a1c9d..d42b6e3d3a 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -164,6 +164,8 @@ static void xlnx_ep108_init(MachineState *machine)
>  {
>      XlnxZCU102 *s =3D EP108_MACHINE(machine);
> =20
> +    info_report("Please use the ZCU102 machine instead of this machine=
.");

Why do we need this, in addition to the generic deprecation message that
says basically the same thing ?

> +
>      xlnx_zynqmp_init(s, machine);
>  }
> =20
> @@ -180,11 +182,13 @@ static void xlnx_ep108_machine_class_init(ObjectC=
lass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> =20
> -    mc->desc =3D "Xilinx ZynqMP EP108 board (Deprecated, please use xl=
nx-zcu102)";
> +    mc->desc =3D "Xilinx ZynqMP EP108 board";
>      mc->init =3D xlnx_ep108_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->units_per_default_bus =3D 1;
>      mc->ignore_memory_transaction_failures =3D true;
> +    mc->deprecated_reason =3D
> +        "The ZCU102 machine has the same features supported";
>  }

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
