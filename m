Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp800359wrt;
        Wed, 28 Nov 2018 01:26:34 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VLvc+TALFhteVfQ+Sz+dUT5gTpbGCAXtxZx8AgZWh1tIiLTYdP+U4aGotgFRo0jm2L9EGF
X-Received: by 2002:a25:6b08:: with SMTP id g8-v6mr36187040ybc.280.1543397194557;
        Wed, 28 Nov 2018 01:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543397194; cv=none;
        d=google.com; s=arc-20160816;
        b=KN2Yvpr3PXX88a/z46tD457EOu8cXhok5QXHpOnhYSY/Ebc0Yde7suwRiMU2IEz4uO
         1umin37r45Csje+2K28eE8nGebO0Kvgn63Wr7KmxYMMfzUthRZ81taAMvPefK/IjJ60z
         MZecCgT+Vsv0FoHw1dDVvus8uFkWwYUx6vCfZNaH1e5cwaQeVGi/v8QSO0aVPn5G0Jbc
         4PaSXvl1WiWdcKp47dGje2B3OW0wvaFgrEC/jQ9qqz8X8cQvehOiiKjptjsms/KWsqx5
         8kkR7JyRumDPmECWkNjDMYIt5LJkeOMLE1ZErNYwgIU2UbMEMhy+KzCGs2ScOexR6C3q
         siDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=0iS/iiSLcsu4uYfXBVDZwdlYqxDhn6z4zz9PeO+d+zU=;
        b=pLstuir9X5SNLk/oHvDDndluR9c0nuAJAjDQdkuBE0SYdNF1r11Jc09Taxi1vobkhq
         IYvCln6kybEA21foUrqP2gViwBUqobioudMFSKTQu2TEzmZZ0MwfUlDCG7WXusuPBGum
         P379zlJy33qMMXdTog+j8LhhLeHyubuCQzpTG6EyXHQCHkvpotU6IfZSpCf35nzkmZ6e
         SvwPb4B7spTVZGRrReNblvaL+LbTfXyMRnoZ3/TbqWrdAZkKuUf6UKbqGcXZsPNjfalc
         U/quIVMap2PK5ETMhURtJbWD1hvn3qSqPfNZTi1Iw7JOXVulxVBnxzIE3p6YVRENNOVw
         C0sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11-v6si4860675ybi.290.2018.11.28.01.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 01:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRw77-0007kN-ER
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 04:26:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gRw6r-0007j1-PN
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 04:26:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gRw6o-0007MB-Kz
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 04:26:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gRw6m-0007Hw-OC; Wed, 28 Nov 2018 04:26:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68A4534CB;
	Wed, 28 Nov 2018 09:26:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-167.ams2.redhat.com [10.36.116.167])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3404F6B8C6;
	Wed, 28 Nov 2018 09:26:06 +0000 (UTC)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-4-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <7291a08c-a291-c2b4-f520-71a516b391d7@redhat.com>
Date: Wed, 28 Nov 2018 10:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180921161939.822-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 28 Nov 2018 09:26:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 03/11] hw/arm/aspeed: Add an
 Aspeed machine class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4NG10Ibg+XyT

On 2018-09-21 18:19, C=C3=A9dric Le Goater wrote:
> The code looks better, it removes duplicated lines and it will ease
> the introduction of common properties for the Aspeed machines.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/aspeed.h |  46 +++++++++
>  hw/arm/aspeed.c         | 212 +++++++++++++---------------------------
>  2 files changed, 116 insertions(+), 142 deletions(-)
>  create mode 100644 include/hw/arm/aspeed.h
>=20
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> new file mode 100644
> index 000000000000..325c091d09e4
> --- /dev/null
> +++ b/include/hw/arm/aspeed.h
> @@ -0,0 +1,46 @@
> +/*
> + * Aspeed Machines
> + *
> + * Copyright 2018 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef ARM_ASPEED_H
> +#define ARM_ASPEED_H
> +
> +#include "hw/boards.h"
> +
> +typedef struct AspeedBoardState AspeedBoardState;

 Hi C=C3=A9dric,

this patch breaks compiling with clang v3.4.2 here:

 CC      aarch64-softmmu/hw/arm/aspeed.o
hw/arm/aspeed.c:36:3: error: redefinition of typedef 'AspeedBoardState' i=
s a C11
      feature [-Werror,-Wtypedef-redefinition]
} AspeedBoardState;
  ^
include/hw/arm/aspeed.h:14:33: note: previous definition is here
typedef struct AspeedBoardState AspeedBoardState;
                                ^
1 error generated.
make[1]: *** [hw/arm/aspeed.o] Error 1
make: *** [subdir-aarch64-softmmu] Error 2

Seems like it can be fixed like this:

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -29,11 +29,11 @@ static struct arm_boot_info aspeed_board_binfo =3D {
     .nb_cpus =3D 1,
 };
=20
-typedef struct AspeedBoardState {
+struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram;
     MemoryRegion max_ram;
-} AspeedBoardState;
+};

... does that look OK for you, too?

> +typedef struct AspeedBoardConfig {
> +    const char *name;
> +    const char *desc;
> +    const char *soc_name;
> +    uint32_t hw_strap1;
> +    const char *fmc_model;
> +    const char *spi_model;
> +    uint32_t num_cs;
> +    void (*i2c_init)(AspeedBoardState *bmc);
> +} AspeedBoardConfig;
> +
> +#define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> +#define ASPEED_MACHINE(obj) \
> +    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
> +
> +typedef struct AspeedMachine {
> +    MachineState parent_obj;
> +} AspeedMachine;
> +
> +#define ASPEED_MACHINE_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(AspeedMachineClass, (klass), TYPE_ASPEED_MACHI=
NE)
> +#define ASPEED_MACHINE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(AspeedMachineClass, (obj), TYPE_ASPEED_MACHINE)
> +
> +typedef struct AspeedMachineClass {
> +    MachineClass parent_obj;
> +    const AspeedBoardConfig *board;
> +} AspeedMachineClass;
> +
> +
> +#endif

 Thomas
