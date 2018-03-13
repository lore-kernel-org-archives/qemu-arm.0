Received: by 10.28.91.67 with SMTP id p64csp974194wmb;
        Tue, 13 Mar 2018 10:33:12 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuJ14KZBoiEUWLJFO4i4ppOqsXcF9CyeHL2+CRkqyeUsduSaz12Fag+zHWAU0jj38AKUT49
X-Received: by 2002:a25:af03:: with SMTP id a3-v6mr1205257ybh.432.1520962392537;
        Tue, 13 Mar 2018 10:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520962392; cv=none;
        d=google.com; s=arc-20160816;
        b=qQ1vAosK++6Pm3XQKA8iQKJ05Z2wnafpOZTv3FVVob0fRu4maqKFTsrye1PDPZXBAa
         H5EPhFhQNmGYWCQZzc9fj9CUOLW0CzK0VCqz9M/v2Ty64owEuTLDN5lwYB7dy9NVFc5m
         s+Z9O3VHh340x+oHzOzHxltstjjNIOpg2KOHeuD+REj0b9Nu/LuoK+gp8Trb/czEUBlq
         wjxxGNCTtp+Df3L1vPYmmVM7u00DZwqHjmbovY4GEsSsa8PsLDlg6BlHjODH2pZR0iRa
         2OTvSULCX+DUHTpXOILBYq2pu8SUws0YRdfwlvQhsOllrQvRdS4w/l82O7sfnx5xJ6vJ
         ip1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=1+a/sSQ0t3BPAZGnCk8SrrPoWa4zt3+nrg4D9dPxg6Y=;
        b=B5ZYMkNcbymXHwSrv6/wSi09BbIdVyprlD2FOFyw5XgLUM/+jnUACZtN0x92xmYJLK
         C8zKStHPEt4+IaXnpJRqabsXdO9MG95iM8L1m0jnE1jNYy4HNQTeriL7NVZXWI1tbjt1
         ZY8y/2Gt061VhsbmVQhBY+7RJVksx4XfXbspUxobjtov1cN50OFEYwOyrCVDKhmqdaHw
         k4+KPkfiePJgsZA/XT8YYIDMnEG9U3j9KoeEPXXWDrW/UY4O8Plj9dYIkv8zaQPv3hdS
         10Azh5rOLhHNkrwxgeSFi6lY2ujh4h9K62DCo6Q4TLuAsVnzJ4fnIzHL/Ude/BhGDImZ
         u1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=gGdpmS9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si722117qtn.205.2018.03.13.10.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=gGdpmS9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnnT-0006rw-UL
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:33:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evnD3-0000B0-Uc
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 12:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evnD2-0004Wi-TJ
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 12:55:33 -0400
Received: from mail-by2nam03on0105.outbound.protection.outlook.com
	([104.47.42.105]:62240
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1evnCw-0004Uk-Hz; Tue, 13 Mar 2018 12:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=1+a/sSQ0t3BPAZGnCk8SrrPoWa4zt3+nrg4D9dPxg6Y=;
	b=gGdpmS9m/X1IvD3cYcvEX1JbBXgqsNoB5ZLzweanBTsdhwV7ZvSsW0SDWmuN0jSqfsBgszaSGMn4LLXpuk4K+P/Kew31FIddk3Ey4sU6lRPObIe42kVizVSoOKAseyKwNZldf7kOZ7KfLnifZV4AkmhArjsQ6DBlw8wFzJOv2w8=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0845.namprd21.prod.outlook.com (10.173.51.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.2; Tue, 13 Mar 2018 16:55:23 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1]) by MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1%12]) with mapi id 15.20.0609.006;
	Tue, 13 Mar 2018 16:55:23 +0000
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode correct CPU
	type
Thread-Index: AQHTuuJxDRl1c5Pg4k+hUfGRvg0WkqPOYNQQ
Date: Tue, 13 Mar 2018 16:55:23 +0000
Message-ID: <MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
In-Reply-To: <20180313153458.26822-9-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-03-13T16:55:21.7973231Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:f::610]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0845;
	7:yxJ1m+NizFoaC8QlsP4Mbi05HWF2vD2xkrsD+EF2ugM+PW5Brh6itwoyLhng82j7Vy1gde9Fr819qmiwt59VaHDqaZIAVMzrIbV7cduqS2/qQtOtkjr05t2t57Nedd6+sAerOKMbCazW1m+s0BoONlJf3HrQfxtdi1EiSaAagb5EKZnEKd/i3nBWxmw6INXpQQiNklAXZgkm+faS7DR3eVW/+LDXFUUwJnUd9KrZorRwzks15BCbIosbrq5FgFyb;
	20:L+fDzYUvY+l7FU3UJZXFt/WpkxJyXaodISBlPOpNfc/pl6Mi3TIwNPn9G+MNmAQkBbTdfQtiKIGOe/cWvqXLSSRKNvWYa8Pu6tXeA1ODupxmzuiymFFy+fW3LRCVWu1Mr/vkf7St50OJ7ET/cO2llywR+koejLjjzy0MRRiJNX0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d6aec83-7801-498c-8cb1-08d5890336be
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0845; 
x-ms-traffictypediagnostic: MWHPR21MB0845:
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <MWHPR21MB0845CDCD548CF902D9FDDB5E9ED20@MWHPR21MB0845.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(61425038)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501255)(52105095)(6055026)(61426038)(61427038)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR21MB0845; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0845; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39380400002)(376002)(39860400002)(396003)(366004)(199004)(189003)(305945005)(316002)(7736002)(22452003)(74316002)(105586002)(76176011)(8990500004)(54906003)(86362001)(81166006)(81156014)(110136005)(106356001)(72206003)(478600001)(10090500001)(8676002)(6246003)(9686003)(3660700001)(6436002)(10290500003)(99286004)(55016002)(229853002)(4326008)(25786009)(2501003)(53936002)(68736007)(7696005)(2201001)(5250100002)(97736004)(2906002)(6116002)(2950100002)(86612001)(33656002)(3280700002)(186003)(6346003)(102836004)(8936002)(5660300001)(46003)(6506007)(2900100001)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0845;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: sseViDQfg52nv4w7a9TTo4yPIrDaj8SB4LxiI0qT7qaOqJW6+A5DHBXq+KzQtrfgIj6IPB4nT03DqRG0GPHm4Hdii0C20jf0Nxh+/LmME4PatrIpmFU7PNCjaDmGkOzsoGWzG/A8KdXSFs1mUx699rkU2rsPflh1qfOGc3AbiSWJ+mZpoVsK7EoQvqryvh05vPDrR7aE+ypnOLWIfd3Yjx2P2I+IpgL8w5/PZwV/PmSHE9ARuQ4F0FlQHfnWSx0slMmwX51PxaoYgwboKn8iou4vZarpV1lQ2lJI6XSGJYlyYkgz8jb7voA4z3lA06i25yKSRKkgRmPADcfGizYRHQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6aec83-7801-498c-8cb1-08d5890336be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 16:55:23.8557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0845
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.105
Subject: Re: [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode correct CPU
 type
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
From: Andrew Baumann via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
	=?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EpPneLTw9GA

> From: Qemu-devel <qemu-devel-
> bounces+andrew.baumann=3Dmicrosoft.com@nongnu.org> On Behalf Of Peter
> Maydell
> Sent: Tuesday, 13 March 2018 08:35
>=20
> Now we have separate types for BCM2386 and BCM2387, we might as well
> just hard-code the CPU type they use rather than having it passed
> through as an object property. This then lets us put the initialization
> of the CPU object in init rather than realize.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/bcm2836.c | 22 +++++++++++++---------
>  hw/arm/raspi.c   |  2 --
>  2 files changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 7140257c98..12f75b55a7 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,16 +25,19 @@
>=20
>  struct BCM283XInfo {
>      const char *name;
> +    const char *cpu_type;
>      int clusterid;
>  };
>=20
>  static const BCM283XInfo bcm283x_socs[] =3D {
>      {
>          .name =3D TYPE_BCM2836,
> +        .cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15"),

At some point I remember seeing a patch to change this to cortex-a7. Is the=
re a reason we didn't make that change?

(Background: the real Pi2 has an A7. When I first implemented the machine m=
odel there was no A7 emulation in QEMU, so I used the A15 which was the clo=
sest equivalent.)

>          .clusterid =3D 0xf,
>      },
>      {
>          .name =3D TYPE_BCM2837,
> +        .cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a53"),
>          .clusterid =3D 0x0,
>      },
>  };
> @@ -42,6 +45,16 @@ static const BCM283XInfo bcm283x_socs[] =3D {
>  static void bcm2836_init(Object *obj)
>  {
>      BCM283XState *s =3D BCM283X(obj);
> +    BCM283XClass *bc =3D BCM283X_GET_CLASS(obj);
> +    const BCM283XInfo *info =3D bc->info;
> +    int n;
> +
> +    for (n =3D 0; n < BCM283X_NCPUS; n++) {
> +        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> +                          info->cpu_type);
> +        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> +                                  &error_abort);
> +    }
>=20
>      object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONT=
ROL);
>      object_property_add_child(obj, "control", OBJECT(&s->control), NULL)=
;
> @@ -69,14 +82,6 @@ static void bcm2836_realize(DeviceState *dev, Error
> **errp)
>=20
>      /* common peripherals from bcm2835 */
>=20
> -    obj =3D OBJECT(dev);
> -    for (n =3D 0; n < BCM283X_NCPUS; n++) {
> -        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> -                          s->cpu_type);
> -        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> -                                  &error_abort);
> -    }
> -
>      obj =3D object_property_get_link(OBJECT(dev), "ram", &err);
>      if (obj =3D=3D NULL) {
>          error_setg(errp, "%s: required ram link not found: %s",
> @@ -168,7 +173,6 @@ static void bcm2836_realize(DeviceState *dev, Error
> **errp)
>  }
>=20
>  static Property bcm2836_props[] =3D {
> -    DEFINE_PROP_STRING("cpu-type", BCM283XState, cpu_type),
>      DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
>                         BCM283X_NCPUS),
>      DEFINE_PROP_END_OF_LIST()
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index f588720138..ae15997669 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -150,8 +150,6 @@ static void raspi_init(MachineState *machine, int
> version)
>      /* Setup the SOC */
>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ra=
m),
>                                     &error_abort);
> -    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-typ=
e",
> -                            &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>                              &error_abort);
>      int board_rev =3D version =3D=3D 3 ? 0xa02082 : 0xa21041;

What about the default_cpu_type field of MachineClass set in raspi[23]_mach=
ine_init? That seems irrelevant now... Also, if anyone cares (I don't), we =
also just lost the ability to override the CPU type of a raspi model.=20

Otherwise,
Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Cheers,
Andrew
