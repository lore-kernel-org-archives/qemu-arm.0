Received: by 10.25.208.211 with SMTP id h202csp3479624lfg;
        Fri, 26 Feb 2016 09:47:48 -0800 (PST)
X-Received: by 10.141.28.149 with SMTP id f143mr3778172qhe.66.1456508868904;
        Fri, 26 Feb 2016 09:47:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si14108054qgf.98.2016.02.26.09.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 09:47:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:51417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZMUW-0006Al-F1
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 12:47:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZMU8-0005tD-Pb
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 12:47:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZMU5-0005yQ-Fd
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 12:47:24 -0500
Received: from mail-bn1bon0111.outbound.protection.outlook.com
	([157.56.111.111]:29616
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZMU5-0005yK-6U
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 12:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zTbTd1PX12ojSnSw9Z2XaqGgbBXomhT+KRHSKFzp6WU=;
	b=JqEGh8TQxBoG8M/4dUPOpMxBFqdEbHgW/g5yE7cb2XCdFlPO9RRuSbfHq8OvM4vZPhXnFt5dOIn0F2TUpM7UudzOMinOfS2Ssdi7WfmBZaKBlpvjnpMvCf5UEo7rzJy6obt7KR/R1e5QGQR/+h35jup53LsFwq6OESdrmOWpss4=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Fri, 26 Feb 2016 17:47:19 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0409.024; Fri, 26 Feb 2016 17:47:19 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH 2/2] sdhci: Implement DeviceClass reset
Thread-Index: AQHRcJj6RB/NvOrXA06y7QWL2OFsl58+mWHg
Date: Fri, 26 Feb 2016 17:47:19 +0000
Message-ID: <BLUPR0301MB203462756BB2601B05695E1F9EA70@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
	<1456493044-10025-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1456493044-10025-3-git-send-email-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:a::724]
x-ms-office365-filtering-correlation-id: 7d65adee-e612-4b65-1071-08d33ed4dfc1
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:uAKyClL+XKCFOzFgWO/W18VPAAOmQ7ChZspN9skxqAkmDDFxBcLwBYRJSYriZe33T47CUkqabaEEFSdxLBgugWrHOoEaCw/byIYJWDec/b70RU+qGw6/Ey7rwoDOGOYQkDqVgrIAsxAo3JukeDLO5A==;
	24:5iTph09opaP98Ywyi64NYBLb7UDSltQjhK9dMrWCP0pUaTnJ6vTLu1l4xtervJAwvh+2dKCkqGNbISoymFP555HVLoFixGCRVcUMDV8r6rk=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB2033B11201003A21D92F948B9EA70@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 0864A36BBF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(2501003)(3660700001)(74316001)(40100003)(3280700002)(92566002)(2906002)(122556002)(99286002)(4326007)(10400500002)(2900100001)(106116001)(5005710100001)(2950100001)(87936001)(77096005)(586003)(5002640100001)(19580395003)(19580405001)(1220700001)(5003600100002)(5008740100001)(5001960100002)(10290500002)(5004730100002)(1096002)(33656002)(189998001)(11100500001)(5001770100001)(102836003)(6116002)(86362001)(8990500004)(76576001)(10090500001)(54356999)(76176999)(50986999)(7059030)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2016 17:47:19.4051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.111
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"patches@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 2/2] sdhci: Implement DeviceClass reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sde+s+mEBij2

> From: Peter Maydell [mailto:peter.maydell@linaro.org]
> Sent: Friday, 26 February 2016 5:24 AM
>=20
> The sdhci device was missing a DeviceClass reset method;
> implement it. Poweron reset looks the same as reset commanded
> by the guest via the device registers, apart from modelling of
> the rpi 'pending insert interrupt on powerup' quirk.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/sdhci.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index e087c17..d28b587 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -207,6 +207,21 @@ static void sdhci_reset(SDHCIState *s)
>      s->pending_insert_state =3D false;
>  }
>=20
> +static void sdhci_poweron_reset(DeviceState *dev)
> +{
> +    /* QOM (ie power-on) reset. This is identical to reset
> +     * commanded via device register apart from handling of the
> +     * 'pending insert on powerup' quirk.
> +     */
> +    SDHCIState *s =3D (SDHCIState *)dev;
> +
> +    sdhci_reset(s);
> +
> +    if (s->pending_insert_quirk) {
> +        s->pending_insert_state =3D true;
> +    }
> +}
> +
>  static void sdhci_data_transfer(void *opaque);
>=20
>  static void sdhci_send_command(SDHCIState *s)
> @@ -1290,6 +1305,7 @@ static void sdhci_pci_class_init(ObjectClass *klass=
,
> void *data)
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>      dc->vmsd =3D &sdhci_vmstate;
>      dc->props =3D sdhci_pci_properties;
> +    dc->reset =3D sdhci_poweron_reset;
>  }
>=20
>  static const TypeInfo sdhci_pci_info =3D {
> @@ -1332,10 +1348,6 @@ static void sdhci_sysbus_realize(DeviceState *dev,
> Error ** errp)
>      memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s,
> "sdhci",
>              SDHC_REGISTERS_MAP_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
> -
> -    if (s->pending_insert_quirk) {
> -        s->pending_insert_state =3D true;
> -    }
>  }
>=20
>  static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
> @@ -1345,6 +1357,7 @@ static void sdhci_sysbus_class_init(ObjectClass
> *klass, void *data)
>      dc->vmsd =3D &sdhci_vmstate;
>      dc->props =3D sdhci_sysbus_properties;
>      dc->realize =3D sdhci_sysbus_realize;
> +    dc->reset =3D sdhci_poweron_reset;
>  }
>=20
>  static const TypeInfo sdhci_sysbus_info =3D {

Not tested, but the handling of the Pi quirk looks good to me, and it's tri=
vial.

Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

BTW, now that you've done this, we could unify sdhci_pci_properties and sdh=
ci_sysbus_properties. Let me know if you'd like a patch for that.

Cheers,
Andrew
