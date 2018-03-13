Received: by 10.28.91.67 with SMTP id p64csp961794wmb;
        Tue, 13 Mar 2018 10:21:02 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsDamit3PhCUU7yBuNqdDjntMZsj9h2M7diiDBSQkBPVVpxrFoJ98zqnNLp7flSC4hfCk6p
X-Received: by 10.237.42.56 with SMTP id c53mr2196735qtd.199.1520961662525;
        Tue, 13 Mar 2018 10:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520961662; cv=none;
        d=google.com; s=arc-20160816;
        b=qzcVgrbtCluiU7D56ixjoSRiV0FyjFeydgUSk+WJRzIfeGmsI6EEjYs+o1NyOAtb+s
         8uzKuUHM88mDVVHNEF7GC7SWFRS/bKFtVQYQCemmROtuBGRDmrYoeayEuazM+y7p7NRt
         NkesZ9Q8y5RVKwVGCAXLtqcNEZxdp1Cy7OoFpW3vjKX/lelSg3F7WZRjXRTSGHXMfSj6
         /24n1c2/HUPENn1L2nuZx6WuHOWJfZu7vf5KeFWmJ3sqhBRQ7rocYQqCh//PZRbLBmYJ
         QWkP6MfVihhDFj/2XR+98O6w6k7LrL/UJR4SdoaZ6Ga3nL9GeQ2flmHXWNoGHcqXQ0Er
         CjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=R2XSi4m3dMuW9zisPzSUDz5SHH4p2WWPIJsnCgGxFnE=;
        b=aOeGCZ/2MdIssvHdtZLcUwz0v4t0CCxEYPvn5lFum+aYMAb/KfQ5S9o6xukS6lc+eF
         Pqc3fxudktVTqpwMYuj3ZipdnjzkSDTgPBWU6OMAWEBYQ1amOCDEWvdqtrIdfLm1sxKi
         zSoIu7t9L7NTlSwsomygUazpLo8YWd07NyyRXJgcbbtmm4toWtCoq76E4sIMFXNnmJ7b
         R8BLF7fUQjzEpXziGoEWCZKw+JiUYQPGfScM+mck8MWmTPwpDjIJ3GHLl/VsBf0Q09t5
         7VOx6AMEBRFZEfV75Hmq1bJq7jjfb9+SZ99B7ivekmlmMUyQP7DkHbdiqkB+n/eRPNKP
         O4IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=hryUqo2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si671293qtb.202.2018.03.13.10.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=hryUqo2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnbh-0004rY-Vd
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:21:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evn5O-0001pe-Eu
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evn5J-00011y-LM
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:47:38 -0400
Received: from mail-by2nam01on0129.outbound.protection.outlook.com
	([104.47.34.129]:57158
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1evn5J-00011O-8j; Tue, 13 Mar 2018 12:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=R2XSi4m3dMuW9zisPzSUDz5SHH4p2WWPIJsnCgGxFnE=;
	b=hryUqo2t9Ns97QVLYUvD/S7uAq9WUxac+92yZgq7gAG2iMxAXCfzJ7TGEFgLggZ2I/3HRL7qC0NUKOqTzAMqFJn1kEf57gsJWIeuE71QFYMlwHDkeKo42/GEmSkVv+l3iPIYUHctZI1fDQTp+dEbWYvfNmUnE0AV3zeoTNd4y7o=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0846.namprd21.prod.outlook.com (10.173.51.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.3; Tue, 13 Mar 2018 16:47:30 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1]) by MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1%12]) with mapi id 15.20.0609.006;
	Tue, 13 Mar 2018 16:47:30 +0000
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 6/9] hw/arm/bcm2836: Create proper bcm2837 device
Thread-Index: AQHTuuDlTml0a2vNtEaecfOxKwpnD6POXxMA
Date: Tue, 13 Mar 2018 16:47:30 +0000
Message-ID: <MWHPR21MB018956AFEA7FC79D5ADF870F9ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-7-peter.maydell@linaro.org>
In-Reply-To: <20180313153458.26822-7-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-03-13T16:47:28.3203142Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:f::610]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0846;
	7:Nz2P7HnnGs78M4Bch7J0mfHLauursa3ABEe7hD58nK0lDrpNmQJQYg1D982sMT19+O/2+WPDYY26Ky0ejZ1SdwjKSlUKTuqwhoIWq/geZl052UOvRMUr1eMSr5r9x5lZt39I7hyXtK4NNiEoZ/hpuD7WaLMzUu/It2zQV2FKPXNBHhsvOWdHRHPqHz7GbBHwni4Abh9mQh+CCkl2KOO4rEoxbmdm2jFKcfK+Mvcj6xugZJBvlLN91+CRZ+XUqhm1;
	20:JnKH6haeGOb8BL6bNXZWcGp/F3IHioiO0sCpRIjrtejmTcaPav0cyfQw4mE05RrNNTobbgnyScrHFB/Byau8WdIByDzc/l1Woq2HTZP+KeV3s8iiSgOtVGUS8bSiAnJOqMf872fTB/pTtobg+Yfg0xVgggS6dDPflmYEdx37hso=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a825633-2679-403c-c3d2-08d589021c82
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0846; 
x-ms-traffictypediagnostic: MWHPR21MB0846:
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <MWHPR21MB0846D335A91BC24A2611C9519ED20@MWHPR21MB0846.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(61425038)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501255)(52105095)(6055026)(61426038)(61427038)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR21MB0846; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0846; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39380400002)(396003)(376002)(366004)(346002)(39860400002)(189003)(199004)(9686003)(53936002)(6246003)(7696005)(2900100001)(229853002)(54906003)(102836004)(2950100002)(110136005)(14454004)(81156014)(105586002)(68736007)(33656002)(8676002)(55016002)(99286004)(6506007)(97736004)(6436002)(86612001)(81166006)(305945005)(74316002)(7736002)(316002)(6116002)(10290500003)(2501003)(5660300001)(3660700001)(10090500001)(5250100002)(72206003)(8990500004)(8936002)(2906002)(86362001)(76176011)(3280700002)(478600001)(6346003)(25786009)(22452003)(2201001)(186003)(106356001)(4326008)(46003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0846;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: kVuyz2Qkdz6UH43dmv30NvxK73T56fYY1LD4AsywHnj2Z+PsdSeSCpHDSVtOsTCrBxZMnu3ncTwD2GoVS4Ou0QG52Op17oDhKSG9KqGmXbLjxTclQYQg3spMZXjlo4MLmRD1PweIPY4xsl32EqjL7I1SHE9RAN/zwPsz12UODyOA7XJpF3e2fD0Fa0SlH+TxsAlOBfRPLvS2NJ8SlFlF5mz+RdQrPFY8JuDHRmUIi/pW6HZWf7tqpohENyoq8GaH7LBPiqPXIQ9srnlgMfW/H5YNJ+cb0ecpSN7gC1MDoHdmbL2UzXvbRrOE01zDrdRbp0yRCf42loR2np0+99koZQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a825633-2679-403c-c3d2-08d589021c82
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 16:47:30.3084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0846
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.129
Subject: Re: [Qemu-arm] [PATCH 6/9] hw/arm/bcm2836: Create proper bcm2837
 device
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
Cc: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>, "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PyECyuyMXXX2

> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Tuesday, 13 March 2018 08:35
>=20
> The bcm2837 is pretty similar to the bcm2836, but it does have
> some differences. Notably, the MPIDR affinity aff1 values it
> sets for the CPUs are 0x0, rather than the 0xf that the bcm2836
> uses, and if this is wrong Linux will not boot.
>=20
> Rather than trying to have one device with properties that
> configure it differently for the two cases, create two
> separate QOM devices for the two SoCs. We use the same approach
> as hw/arm/aspeed_soc.c and share code and have a data table
> that might differ per-SoC. For the moment the two types don't
> actually have different behaviour.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/bcm2836.h | 19 +++++++++++++++++++
>  hw/arm/bcm2836.c         | 37 ++++++++++++++++++++++++++++++++-----
>  hw/arm/raspi.c           |  3 ++-
>  3 files changed, 53 insertions(+), 6 deletions(-)

I haven't tried to understand enough of QOM to review this one... (It looks=
 sane to me though.)

Andrew
