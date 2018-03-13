Received: by 10.28.91.67 with SMTP id p64csp938375wmb;
        Tue, 13 Mar 2018 10:01:07 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuqSGK2yziyCWqVyB0q4hxXs4YKhakz8twLtt/ZoaNhGWBR4Z1L0SEV7F83vEe0hmLjUdB3
X-Received: by 10.200.23.91 with SMTP id u27mr2144811qtk.209.1520960467464;
        Tue, 13 Mar 2018 10:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520960467; cv=none;
        d=google.com; s=arc-20160816;
        b=wTvm+Wiry6Ko0oUcMUlyKuK6okVvrOiO3KtuKd4EBYfWVrB4IVRcUTtIrvSp6lU445
         zl8SxHrBXyATtGfMnuomfU3Q/jmhptJIfzEz6APsxQonqIjoP/maVnBSE93EYan/de4a
         Rb+CGnZToAXFpA0I+T/mvK14VYl1vKyN8yKeSMGMJHGqE+yNycjAnYY1Zn1E6+NJ/daz
         IyDItB0GUFoukMS8k5kAs8lYkzOBLew641czQ6qIAJcmD3/hnhklb9hPK2RNrOjh3uX1
         rycopHU4SFl39GF8dFV1y6Q6+q/xCVT1hpDVZgBMSf8cgp5bV5YwVCGQnbXNNaHhKbPf
         //nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=7z1UYemBJUWY1dtNmSYhRGdgA48DkM2N3/V4nA0p2Kc=;
        b=Dwq1m+gavj2xy1YeHxDH9v5YtVKyJFXF4uRF2+IFseX4gq+Vfutr5oCQVujqdsm450
         BIyOzqDp5upskBQp2HBHKXd2H8Ilw8EPjANOp7KT2fXxLTc5vzOCvlUKehjphjrZboRV
         Etay+IxXfV8zxjUaX9n4Dv+BRloXybEq8KBFpN0gkXz9ZolgEzj8Fd0Ih3IL4ccEgjUX
         PWqCGEigR2DRwjeIpGli+0RiJbH6MGxZcYHDbqJlrQe6vSCLlRSI9WYGldBUB3LMDAHL
         1FYocBLeXKJKXeNrKZqjHT2KD2D9vKFUQehcFlfDDgRZ84nHUFW2+BSX/Bi7h6Eg5+wu
         oSkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=MZfgPPSn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g49si644219qtg.87.2018.03.13.10.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=MZfgPPSn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnIQ-0004xg-Tg
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:01:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evn6s-00032M-0x
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 12:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evn6r-0001UC-71
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 12:49:10 -0400
Received: from mail-by2nam03on0134.outbound.protection.outlook.com
	([104.47.42.134]:17024
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1evn6g-0001Qs-WE; Tue, 13 Mar 2018 12:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=7z1UYemBJUWY1dtNmSYhRGdgA48DkM2N3/V4nA0p2Kc=;
	b=MZfgPPSnEmmogJwXe+BQVAzjlrXnJO9V/nm7GQ+52LugDNHHVIuqe+/YI5iN/YbQ3ueVHqqgfk0qenuhHrkTrKLl6rNAbNaxbQZ/yORNa2I/6Jn1tS4VT4isRcmF4HQJe2jYkw6bri4O7K7+AmPgoeD4ohc+Opv29jXtpSxvwL8=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0750.namprd21.prod.outlook.com (10.173.51.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.3; Tue, 13 Mar 2018 16:48:56 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1]) by MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1%12]) with mapi id 15.20.0609.006;
	Tue, 13 Mar 2018 16:48:56 +0000
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 7/9] hw/arm/bcm2836: Use correct affinity values for
	BCM2837
Thread-Index: AQHTuuDgCOzjeMMbg0mFWbVp3r7LsKPOYDKg
Date: Tue, 13 Mar 2018 16:48:56 +0000
Message-ID: <MWHPR21MB01894A8E274ED18E666D43019ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-8-peter.maydell@linaro.org>
In-Reply-To: <20180313153458.26822-8-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-03-13T16:48:54.6786548Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:f::610]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0750;
	7:hbwAvzV62SiMfOv1c60I99lZlteaqjjK6y77aPeXZGG0GHaNxxbShXHpDTuxwXpGD6cAMebsGxDq9skWsPShEYo6nWguR+Pd/F2qJH4G2AOyxvr+BLPFIIYQNEUGX7Oeo5rqj1vLh9iRz8Ootp74vDO9FymCSPGAeDGC1ovp2WmRDls5VEFbph3FqlLIugqzBN8O0+61JQmCYUzHL0b654Qz4VWE0banDag/faAqZqs6655QL8NaXHLTO5vGWXOd;
	20:LQWCrg4RcIWt2Qe9xD9Z+SiLVL6lQOfSUGnFNU7HT/wUcBWlUg53zJdMp9vIu3ZUQLM7t2YqOTuD3sADRDZ6cR7z47HTZabpK15Fhu+WJxSqgfJYo1fKxWUvZZB5OJQPTx53q6cRcygr/tL9YvKU/oy6hPDwKzI+b7VvRRyr/38=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c3e41259-7021-4179-15f9-08d589024ffa
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0750; 
x-ms-traffictypediagnostic: MWHPR21MB0750:
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <MWHPR21MB075043E457058616EC04ACE59ED20@MWHPR21MB0750.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(61425038)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501255)(52105095)(6055026)(61426038)(61427038)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR21MB0750; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0750; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39380400002)(396003)(346002)(376002)(39860400002)(189003)(199004)(10290500003)(97736004)(68736007)(46003)(186003)(10090500001)(14454004)(4326008)(25786009)(7696005)(6506007)(229853002)(6346003)(22452003)(5250100002)(2501003)(5660300001)(59450400001)(72206003)(478600001)(2950100002)(102836004)(316002)(2201001)(76176011)(8676002)(86612001)(3660700001)(33656002)(2906002)(81156014)(81166006)(6246003)(53936002)(3280700002)(6116002)(305945005)(74316002)(8936002)(99286004)(86362001)(2900100001)(8990500004)(7736002)(110136005)(106356001)(9686003)(54906003)(105586002)(55016002)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0750;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: L/QijpHIRCIP3lr7nnQcPsFsyPDY52l25XJjHccyGYHGLx8oedkk21+slWYlzkue2vCFDZCyj73fA6byLafOxQ9rCvPzWhcEKCpejxJB6nnN3czYv97Q+ccFya34hOfaMUNVocD4PVv87glrlLRmS21o5TKDOG9gC+uhPAROO4vv37QGK24Nv0gBKW3hzIm7Z4SV3ex6HNPZXcvhvm4ofYrFKm4jH2FhRCxvTSc1Abkb6mLCZtso/Vv1iiMtfqhGUyJoPN2nxST/1tQkyASXU29qv5OUqaVQRDEb9RaiU6JMPma9gU2IOjJQitkRaVrVICRDE/o9cIfh9vwA+q8OCw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e41259-7021-4179-15f9-08d589024ffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 16:48:56.6271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0750
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.134
Subject: Re: [Qemu-devel] [PATCH 7/9] hw/arm/bcm2836: Use correct affinity
 values for BCM2837
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
Cc: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>, "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dVo4hcUmZUfZ

> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Tuesday, 13 March 2018 08:35
>=20
> The BCM2837 sets the Aff1 field of the MPIDR affinity values for the
> CPUs to 0, whereas the BCM2836 uses 0xf. Set this correctly, as it
> is required for Linux to boot.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/bcm2836.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 07d2705f96..7140257c98 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,14 +25,17 @@
>=20
>  struct BCM283XInfo {
>      const char *name;
> +    int clusterid;
>  };
>=20
>  static const BCM283XInfo bcm283x_socs[] =3D {
>      {
>          .name =3D TYPE_BCM2836,
> +        .clusterid =3D 0xf,
>      },
>      {
>          .name =3D TYPE_BCM2837,
> +        .clusterid =3D 0x0,
>      },
>  };
>=20
> @@ -58,6 +61,8 @@ static void bcm2836_init(Object *obj)
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
>  {
>      BCM283XState *s =3D BCM283X(dev);
> +    BCM283XClass *bc =3D BCM283X_GET_CLASS(dev);
> +    const BCM283XInfo *info =3D bc->info;
>      Object *obj;
>      Error *err =3D NULL;
>      int n;
> @@ -119,7 +124,7 @@ static void bcm2836_realize(DeviceState *dev, Error
> **errp)
>          /* Mirror bcm2836, which has clusterid set to 0xf

The first line of this comment should probably move or just be deleted. It'=
s not relevant here.

>           * TODO: this should be converted to a property of ARM_CPU
>           */
> -        s->cpus[n].mp_affinity =3D 0xF00 | n;
> +        s->cpus[n].mp_affinity =3D (info->clusterid << 8) | n;
>=20
>          /* set periphbase/CBAR value for CPU-local registers */
>          object_property_set_int(OBJECT(&s->cpus[n]),

Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
