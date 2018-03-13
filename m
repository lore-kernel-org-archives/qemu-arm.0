Received: by 10.28.91.67 with SMTP id p64csp962683wmb;
        Tue, 13 Mar 2018 10:21:52 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs97rpbt1qvlv9LkKbXd1Sve2e0q1LI2enhDMf4rnQbtaVbh1wC63c8fGLl9b0B2ZBI5bzr
X-Received: by 10.129.27.4 with SMTP id b4mr1175162ywb.169.1520961712553;
        Tue, 13 Mar 2018 10:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520961712; cv=none;
        d=google.com; s=arc-20160816;
        b=lcTBu0/bcmdtBBZXLobKbyUWuTvJ6r5DOitmLeEbg6JLm8j0gz7hQATOkqRN80BJO0
         yJeC9PijyEwp3poySeVgrTcICm6wg5hoK4WhWLke9yQq0joEe8NYRZ9EVF8wMa61T84+
         mtslDDzFT/SkyNa3BFt9C+kcL6wI1doVR4uVRLaPslSUf9jgqOuokohAQSK95xty0GM+
         q5UqahPX32/ev3pRO5e8SJvvy3IwE25uSbbr+NXNMXnHYnvbmgrv7BhbuRkIX8K8kmX0
         dt7ZNrega2P3IQNVAJ65kkIt+VpCwvT9L1hZInZ9ztRrgaSsIY/UBDUBwYBQOYDWKN01
         BIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=GhxFleO1On916ZMjHmfUzCkYUd18MFA6lA0gBjXWeXc=;
        b=y1sWTQ/mwz16+CC0wOsyru1l03egqq3fLLL2ZrOilfIt1ciry/MIf2teVcfXYWbdoX
         vSytCUhZ3UpM7DuAcJ3CQhI5wN8szzvDt+D5AbpBB3/YDfwpX9GpfpkYWeAezbJabnCc
         vT5K+577AFLACRHb0XtETsBTLDRzrrgY9rb2Od1WTFBEbdYmXRK6J9TXD0GiNkiS+82V
         jzvQv4f30Y5tXgSylmN8NFAJbsPs/JU0L5qYPDh4lSbG1Vg72f4yNgrF+1960+SF1PAI
         6Q9PLIh/O73g9IRfjOh2n1ttMipFbD3+ie/E6hLt9jET+4e21O43wmxZvupp3zjY1ihE
         wHVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=jmLdAoSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h55si680220qta.179.2018.03.13.10.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=jmLdAoSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evncV-0005Yw-UJ
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:21:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evmyj-00045g-SM
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evmyf-0006WC-9t
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:40:45 -0400
Received: from mail-by2nam03on0118.outbound.protection.outlook.com
	([104.47.42.118]:46016
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1evmye-0006Vj-Vy; Tue, 13 Mar 2018 12:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=GhxFleO1On916ZMjHmfUzCkYUd18MFA6lA0gBjXWeXc=;
	b=jmLdAoSO7qBCw6KAQFXOS7KskKDt2m1b8lrT3oMetzl2CvslRpUPaoevOmVH9CSjNQXfxhDt0EAyBR9BZIdgHa1SAhmJNwKK4tVchnZjvPhoZ/xU9/acx7HgFyfgoQ+ryMqOI1hOd0SXX849+eysl0hxU7mGP/4fAm2ZAFwGKDc=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.2; Tue, 13 Mar 2018 16:40:38 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1]) by MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1%12]) with mapi id 15.20.0609.006;
	Tue, 13 Mar 2018 16:40:38 +0000
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 4/9] hw/arm/bcm2386: Fix parent type of
	bcm2386
Thread-Index: AQHTuuGsKX5gGysltUiZqgwf6OUp6aPOXbNw
Date: Tue, 13 Mar 2018 16:40:38 +0000
Message-ID: <MWHPR21MB01892B2C5E46E3189C9898A49ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-5-peter.maydell@linaro.org>
In-Reply-To: <20180313153458.26822-5-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-03-13T16:40:36.3138142Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:f::610]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0864;
	7:0JG128+adoDYdAabHCoF1ctXzg72MzYnssLC6G7g5F2TkDtB6pwp1D5yLJ5oErLyWssk7Y5/N3QOXerISEETquQDA/cVocpX+/a4s1x0KiovBdkZqlbstffctsQofjvLx+rCbRKir93eJFC1ED1TfqYcOC99rMsyR+UvsyBJ/ewM4nRE9h7lkWxCUWGrLllnEZJ8ZTDrQFxw7KKQj7lOpAKHaUMRIV/Rpoc495HNSoa6kAD0Iynn4i338QDYGkqz;
	20:e74u2Mfj2EhFUwGiWEcWqY8qf/A6N/udSyOSYwr42Y8LxTweB/zB75knph0thU3xdMmFkYiuD+AxV6NhV748Bga1ENtBvxporPPZqTbsi/SxnYJycBWB01Sf2AuRixx2+n2ZQJzYZVXwsi+sZTBqz6cGYVjlFoOvuFFxLBkULMg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dcc153f7-2645-4b20-1b19-08d589012703
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0864; 
x-ms-traffictypediagnostic: MWHPR21MB0864:
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <MWHPR21MB0864C693291C286661F7C4999ED20@MWHPR21MB0864.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(61425038)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501255)(52105095)(6055026)(61426038)(61427038)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR21MB0864; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0864; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39380400002)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(2900100001)(229853002)(478600001)(7736002)(33656002)(68736007)(59450400001)(2950100002)(186003)(8990500004)(14454004)(6346003)(6506007)(2906002)(102836004)(53936002)(46003)(72206003)(4326008)(5660300001)(6436002)(6246003)(55016002)(9686003)(105586002)(54906003)(305945005)(106356001)(110136005)(8676002)(2501003)(81156014)(5250100002)(81166006)(6116002)(74316002)(10090500001)(3280700002)(8936002)(97736004)(25786009)(3660700001)(10290500003)(316002)(86612001)(7696005)(76176011)(99286004)(86362001)(2201001)(22452003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0864;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: A/7sDG38p4Pca81lIXZtfYwIiAXRVlO+pmn3RqJSY4LFP8HemoQpwh8yC98g+K6v4fi4X81n9s0qk4n/M5eeQ1LX68czQpkiUjZtM/JSEU6hSK3S3SiSic9Vb7Ud1rCPc2G54O66mc52CJcAg6xLK8RqHqEATM+1kpyNBehLxzusANQ0y9nUzGqt6JlsZYDpfCQqV/65w9gMHwurPbRATavLsb9sKqp5FBMdX5PpsqLQTobE+XS5+gs+BuFfGlfQuyTHWnvQuPhC6pO1BseeMJ16KyopnP0G6lfT6M2IqB+Gg7jyWciIKr7kAq4I6HOrjk9tS6vrS5XRExw86kCnFg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc153f7-2645-4b20-1b19-08d589012703
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 16:40:38.3609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0864
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.118
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/9] hw/arm/bcm2386: Fix parent
 type of bcm2386
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
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
	=?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPBvJziBbirl

> From: Qemu-devel <qemu-devel-
> bounces+andrew.baumann=3Dmicrosoft.com@nongnu.org> On Behalf Of Peter
> Maydell
> Sent: Tuesday, 13 March 2018 08:35
>=20
> The TypeInfo and state struct for bcm2386 disagree about what the
> parent class is -- the TypeInfo says it's TYPE_SYS_BUS_DEVICE,
> but the BCM2386State struct only defines the parent_obj field
> as DeviceState. This would have caused problems if anything
> actually tried to treat the object as a TYPE_SYS_BUS_DEVICE.
> Fix the TypeInfo to use TYPE_DEVICE as the parent, since we don't
> need any of the additional functionality TYPE_SYS_BUS_DEVICE
> provides.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I noticed this when I tried to make the type into one which
> has its own class struct, because we hit the assert that the
> child's class struct had better be bigger than the parent's.
> ---
>  hw/arm/bcm2836.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 40e8b25a46..9266f27c14 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -165,7 +165,7 @@ static void bcm2836_class_init(ObjectClass *oc, void
> *data)
>=20
>  static const TypeInfo bcm2836_type_info =3D {
>      .name =3D TYPE_BCM2836,
> -    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .parent =3D TYPE_DEVICE,
>      .instance_size =3D sizeof(BCM2836State),
>      .instance_init =3D bcm2836_init,
>      .class_init =3D bcm2836_class_init,

Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Thanks for catching this -- it looks like bcm2835.c (which never got merged=
) has the same bug, and I copied it along.
