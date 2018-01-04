Received: by 10.223.134.117 with SMTP id 50csp12830733wrw;
        Thu, 4 Jan 2018 08:24:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBoua2Kdgw+vxbGWX4xBtRU/Ta3J5CzE3ejEBgPe8CM3nEXxPHGRJT8RciWfY3vxLqw9PE0Ad
X-Received: by 10.37.9.66 with SMTP id u2mr86028ybm.379.1515083096878;
        Thu, 04 Jan 2018 08:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515083096; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/Qw34imXwGId2DV1q/ULuViYL9W2sFZCW9F6TfE7uGKjSu1Sfk8iokulZ+Ioj82Wt
         FPK/X9WGzfN9PhPf4MTiHpx8DtjoO0IwH4U5j8JToH0Yg/aRcFiVrO0MleYZoIkYmiDJ
         qIT4IVxmGADfZyasgoGtv+Pzc6nj5Q76WHNnBbOCPJ8ygDOIhnej5YDnYjsBTe21GHWS
         3ZtjVnCuoz1c5m2YimBk5tJpUft1gsVgqt22iU9T7ZmCIXq0kaiylb51vqf6wfJmZ1XG
         iDsYLigGU2B9o1q4kFtZQALh+SeCIPnP+bjKcGo/XU3LlpcH4ObvA9lbFzwnfCA/ty2I
         MYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=rPECjCDn8ANMhZ9DJ5X0xAme7nLXoKvYcSIueIZy3Zo=;
        b=SLoZVCt0nhof9J59aSQcEzh1Z60ybfovYgsWkWOW8EHECDaV7/78oDut4cVffpmv6X
         jqcs/lRTfknsjQ+YO0khPZnW7KxdMLEVJRs5mL1souAXvp4ypXTxLt+TeYXs8ko/popJ
         hoCNXeAGpHsw0kYFwquqvAnRrZni/pWRXj8o9gkpnfADLACrGXrKVRpUzzMGgHLsQ27r
         JayUpZ2zdvLZKF77g/lU/hUuMKFpzwbhPl/ylNmJ57svKHoGkJ6KoNq9SSLUxWpk/h7a
         sem2qOQoOQhCw1MzvGkiLnLiyAYHRS8kxqHy3g8bp7cs36x5AqaxqST+NAREf3CyK2Pu
         knzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i12si754511ybl.640.2018.01.04.08.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 08:24:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX8K8-0007nE-CC
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 11:24:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eX8Jk-0007cX-Gl
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 11:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eX8JT-0006Ac-Gw
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 11:24:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1eX8JT-00068u-60; Thu, 04 Jan 2018 11:24:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BA7D8125C;
	Thu,  4 Jan 2018 16:24:14 +0000 (UTC)
Received: from work-vm (ovpn-116-225.ams2.redhat.com [10.36.116.225])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2FBE60181;
	Thu,  4 Jan 2018 16:24:03 +0000 (UTC)
Date: Thu, 4 Jan 2018 16:24:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180104162400.GB2618@work-vm>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180104144046.30793-3-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 04 Jan 2018 16:24:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 2/6] hw/net/e1000: real
 device name is 'e1000-82540em', 'e1000' is an alias
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lf7Xetm/Jw0O

* Philippe Mathieu-Daud=E9 (f4bug@amsat.org) wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/net/e1000.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index 05a00cba31..2280f7fdf9 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1648,6 +1648,7 @@ typedef struct E1000Info {
>      uint16_t   device_id;
>      uint8_t    revision;
>      uint16_t   phy_id2;
> +    const char **aliases;
>  } E1000Info;
> =20
>  static void e1000_class_init(ObjectClass *klass, void *data)
> @@ -1695,10 +1696,11 @@ static const TypeInfo e1000_base_info =3D {
> =20
>  static const E1000Info e1000_devices[] =3D {
>      {
> -        .name      =3D "e1000",
> +        .name      =3D "e1000-82540em",
>          .device_id =3D E1000_DEV_ID_82540EM,
>          .revision  =3D 0x03,
>          .phy_id2   =3D E1000_PHY_ID2_8254xx_DEFAULT,
> +        .aliases   =3D (const char * []) {"e1000", NULL},
>      },
>      {
>          .name      =3D "e1000-82544gc",
> @@ -1725,6 +1727,7 @@ static void e1000_register_types(void)
> =20
>          type_info.name =3D info->name;
>          type_info.parent =3D TYPE_E1000_BASE;
> +        type_info.aliases =3D info->aliases;
>          type_info.class_data =3D (void *)info;
>          type_info.class_init =3D e1000_class_init;
>          type_info.instance_init =3D e1000_instance_init;

Can you just check that this doesn't break migration compatibility
either way please;  I think there's some alias code somewhere but I
can't remember the details.

One thing I do remember that broke when it previously changed was
entries in PC_COMPAT_* tables like the one in hw/i386/pc_piix.c's
PC_COMPAT_1_3 - so check with an 'info qtree' that the property is OK.

Dave

> --=20
> 2.15.1
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
