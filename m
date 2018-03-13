Received: by 10.28.91.67 with SMTP id p64csp941177wmb;
        Tue, 13 Mar 2018 10:02:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuXEDpM4Y56qJ6988TljK4SXPo5JARQ22yxWW8P+ji28YabvipiDT4A9wQlMweh92rEhZ2U
X-Received: by 10.55.249.19 with SMTP id l19mr1987151qkj.237.1520960579138;
        Tue, 13 Mar 2018 10:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520960579; cv=none;
        d=google.com; s=arc-20160816;
        b=jdCM8qzFVEFhLladMPgwScNMI4F0xWua6X4UxDhYsD+baSOI8CgGJbRs4/juAwI7ac
         WelNQlDj4exSlMCPDOBev+22A9T7Et1Cu1FuvPGmSp7QcAtoUSpBovJx9v/p0DdKnfYI
         DSM7Hc/I+pwNoDV9H1ObbyQU+5tMeS01lXmk5Pl67VpQIZOSEBwXz3PtdIA994sMMmGd
         MdYT8iFAHRoawF/UHlIc2rVWn8RE+lQ2/pvTPA9bS/HKocmlEiOYqb6eQHr2FzY2oMo9
         Uj2xu+vaNTO6HskdUxAjoQIctBMg3yhimn/QAoipylPnxE6Y6Fyj/HFu31JsZcZ7yrpz
         2KQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=RzYCmSRx+Xd5puWJBxWesWkANE2uNk9AfjcllupdWRY=;
        b=WbzzGhzJhpUOMafwa8K5LxKNMjg2spCUmNK1Aeb0CrVfxOh55oqt/wPCFU2+tAa5wu
         mcJC91VY2klzg4JQ+XbH8j/9cvSyJQeRupA426g5eLCKhS+DHYeDbftCt6ssAgg0nDdp
         oMs14avEuzZkQeuAZkC2BqYp/MSAZ9WO+Nq1K/LzXAclSPucubXFPGBODw/9jFR234GS
         roLzL5g74RIG+sVnbHcomvmfMWl5d2AdKpfeLaozAqjiDqKTGAds2afewMzyMIv4CveO
         Qd7pvnAJYcOfqLL0Upesd9ohJZ6Z6SQViTxHUaYVkzESrk52HgKtJI/xwfdaTmAp1LCm
         HYig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=g8pawrgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5si134764qkc.37.2018.03.13.10.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=g8pawrgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnKE-0006gc-I5
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:02:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evmsl-0007LO-RI
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evmsi-0003Ov-LS
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:34:35 -0400
Received: from mail-bl2nam02on0137.outbound.protection.outlook.com
	([104.47.38.137]:32387
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1evmsi-0003OB-Bp; Tue, 13 Mar 2018 12:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=RzYCmSRx+Xd5puWJBxWesWkANE2uNk9AfjcllupdWRY=;
	b=g8pawrgJxBrsPhDBYiAUE4Vk0o/vpx2j15/ufjhQ7aewvdNYjLnU+HCcbwj8yLAJCfGw6jZuD7koYXmI5JxtEnZidnEmo7/PepIpu0EeAbb5FIN1RQ4MdUL4R6L+KNS+GJkacL1/UGiEZJny3DMGz/hswe6ryqheWqC8V8L+sTI=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0781.namprd21.prod.outlook.com (10.173.51.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.2; Tue, 13 Mar 2018 16:34:30 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1]) by MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1%12]) with mapi id 15.20.0609.006;
	Tue, 13 Mar 2018 16:34:30 +0000
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 1/9] hw/arm/raspi: Don't do board-setup or
	secure-boot for raspi3
Thread-Index: AQHTuuIYO0O9GBFWEk+XCA9RyZ2/4qPOXBdA
Date: Tue, 13 Mar 2018 16:34:30 +0000
Message-ID: <MWHPR21MB01895D8620B67C98D730B25C9ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-2-peter.maydell@linaro.org>
In-Reply-To: <20180313153458.26822-2-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-03-13T16:34:27.7788855Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:f::610]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0781;
	7:gDh3vFsRhiGDBbpHMzdDyn09zoc/7VGo6SCjBxirAiRnooUBPEgvGnYpMF0EbM6dd8VYUqERV3XHnze6tRWL+nhU/fIUx1C/RlGcshIq7V/ZnMJllAMhpaQ48rTol+0xi7+/snBPzEQQIixGwUHEmN52R/yusG23NTEQFD+sVUhG3qjhZx1aXC4e+UH01Wc6FYoGC9r5vvoXMtfyv7ja6T6X976Ce1XYMi8QxkX5vrsqVR2g86qDufZZkacJO1a3;
	20:aDtaambEzfOgnX4j50WQ0XCpDQ+Wse2PBVZCkpLmiZ9vaxbZEhJiP7sgno8C3/Zs2WfEQrQDjD3eLnRrdYroozyX2zMiFo/+zDIC0QoeuPtSqlhr4zsixfBuC85+7AVT+2C9HOtxjCEzcwJRL6eWIUzjAu54Y93LpBFdi6OuKvM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae9b890e-f2ff-4665-57fe-08d589004b94
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0781; 
x-ms-traffictypediagnostic: MWHPR21MB0781:
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <MWHPR21MB078156B7BAA630DC4772BED09ED20@MWHPR21MB0781.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(61425038)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501255)(52105095)(6055026)(61426038)(61427038)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR21MB0781; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0781; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(346002)(39380400002)(396003)(39860400002)(189003)(199004)(229853002)(46003)(33656002)(316002)(106356001)(8936002)(3280700002)(186003)(4326008)(9686003)(53936002)(54906003)(105586002)(3660700001)(5250100002)(2501003)(110136005)(81166006)(81156014)(6116002)(2201001)(6506007)(8676002)(97736004)(6436002)(25786009)(55016002)(86612001)(59450400001)(10290500003)(2900100001)(76176011)(8990500004)(2950100002)(102836004)(74316002)(14454004)(7696005)(305945005)(72206003)(99286004)(7736002)(86362001)(22452003)(6346003)(6246003)(5660300001)(10090500001)(68736007)(2906002)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0781;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: DAGu9pmrCoTjsoGuCztG6qcsJMP1ze7VU8HjfDSi0uRxtYuMsUvWkeRNXkcbKoQmFLVxl4NttLjlXkg5Rvct1m16eeVSC/Zg2Kb9vsRFJn80RHjTXAU2tuLUdX++e7woh41LRQwwvYWClmAcPxkCbIfy4BrHXvtHr0hv24b6r8mJ4In0i+8Ww61nNp9cIVb8iTPAxgGFOkp8pMDx6lWFaxTWGkp4mfIHOLXQpIl/xmUu59gELFi56ClMDdoVxfGclDnagzZ2ElQxMYVFK5SEzSuVURRD9KK0wKAV/5JHEcSjLlU7b26ydCA1AwDZc5Pn6oWtVejVRu5pXEYQjbrVaw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9b890e-f2ff-4665-57fe-08d589004b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 16:34:30.2170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0781
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.137
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/9] hw/arm/raspi: Don't do
 board-setup or secure-boot for raspi3
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
X-TUID: ry3qyg0ZWP85

> From: Qemu-devel <qemu-devel-
> bounces+andrew.baumann=3Dmicrosoft.com@nongnu.org> On Behalf Of Peter
> Maydell
> Sent: Tuesday, 13 March 2018 08:35
>=20
> For the rpi1 and 2 we want to boot the Linux kernel via some
> custom setup code that makes sure that the SMC instruction
> acts as a no-op, because it's used for cache maintenance.
> The rpi3 boots AArch64 kernels, which don't need SMC for
> cache maintenance and always expect to be booted non-secure.
> Don't fill in the aarch32-specific parts of the binfo struct.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/raspi.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index a37881433c..1ac0737149 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -82,10 +82,19 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
>      binfo.board_id =3D raspi_boardid[version];
>      binfo.ram_size =3D ram_size;
>      binfo.nb_cpus =3D smp_cpus;
> -    binfo.board_setup_addr =3D BOARDSETUP_ADDR;
> -    binfo.write_board_setup =3D write_board_setup;
> -    binfo.secure_board_setup =3D true;
> -    binfo.secure_boot =3D true;
> +
> +    if (version <=3D 2) {
> +        /* The rpi1 and 2 require some custom setup code to run in Secur=
e
> +         * mode before booting a kernel (to set up the SMC vectors so
> +         * that we get a no-op SMC; this is used by Linux to call the
> +         * firmware for some cache maintenance operations.
> +         * The rpi3 doesn't need this.
> +         */
> +        binfo.board_setup_addr =3D BOARDSETUP_ADDR;
> +        binfo.write_board_setup =3D write_board_setup;
> +        binfo.secure_board_setup =3D true;
> +        binfo.secure_boot =3D true;
> +    }
>=20
>      /* Pi2 and Pi3 requires SMP setup */
>      if (version >=3D 2) {

Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
