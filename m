Received: by 10.25.0.144 with SMTP id 138csp87987lfa;
        Fri, 7 Apr 2017 22:58:39 -0700 (PDT)
X-Received: by 10.200.49.123 with SMTP id h56mr5764227qtb.172.1491631119380;
        Fri, 07 Apr 2017 22:58:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f124si7419700qkc.185.2017.04.07.22.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Apr 2017 22:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cwjOQ-0007cl-Tn
	for alex.bennee@linaro.org; Sat, 08 Apr 2017 01:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1cwjNb-0007Jb-0a
	for qemu-devel@nongnu.org; Sat, 08 Apr 2017 01:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1cwjNX-00055M-W8
	for qemu-devel@nongnu.org; Sat, 08 Apr 2017 01:57:47 -0400
Received: from mail-sn1nam01on0106.outbound.protection.outlook.com
	([104.47.32.106]:18592
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1cwjNX-00054m-L3
	for qemu-devel@nongnu.org; Sat, 08 Apr 2017 01:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=8fXH0XeSP+lctwOI1GbwEjZfPLWmH+SM6ashmUU4x6U=;
	b=VX996G+Wumj6Q0lNkWnu0v/c2NU9KMEM2gUDYR4sGwvdLOSwlYUyHcZOn1UMaQ+bEaiZo9l1XUJFWm0kjCri158dAIhMIEbFyNmPOm6Lhki45d7JztAEdC72uZLlWVWODDKhXB4Hj59xfvwvmEz9c2+sni+9O5IyPDR6fc9bL0A=
Received: from DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) by
	DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.0; Sat, 8 Apr 2017 05:57:32 +0000
Received: from DM2PR21MB0060.namprd21.prod.outlook.com ([10.161.140.26]) by
	DM2PR21MB0060.namprd21.prod.outlook.com ([10.161.140.26]) with mapi id
	15.01.1019.024; Sat, 8 Apr 2017 05:57:32 +0000
To: Omar Rizwan <omar.rizwan@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH] raspi: Add Raspberry Pi 1 support
Thread-Index: AQHSsCsTEf3dQbLwekqJsp96j8QypKG69+5Q
Date: Sat, 8 Apr 2017 05:57:32 +0000
Message-ID: <DM2PR21MB00601A5A86C3F935CCCBAC0D9E0F0@DM2PR21MB0060.namprd21.prod.outlook.com>
References: <20170408054318.19830-1-omar.rizwan@gmail.com>
In-Reply-To: <20170408054318.19830-1-omar.rizwan@gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [50.47.115.53]
x-microsoft-exchange-diagnostics: 1; DM2PR21MB0060;
	7:Xia922gBZzDlSSZY3HULcjGbLH3LUQH7inGWUDE4sHPtTNmduD1A3UIV3AoxwWDjaq5+4bZvWSKEIbn98nUGbzJdbrLQdopAGPTH588UlkW7VSZsH84XNJpCJbmwskE9S2PB63xyIUkgoDJrOFaPSfqCoQOdCQDxI2E1wlIQVH4i0yswyyjSiI1JnLE3Tx/D9z9repMmXAwx6N0Ze2r1sTtsdQCu3C3khYBHxKEdPEmSq8ji6fOO4ZFGGsczP7cYj0lkWU/jFz1lr+R1uuzAD8IIFGeNC+WTSaeCH6Muxqorkm+WlceqcYfMA+sy8kBzQq0vk8Yxb4dJFvHCNN7mAx2fda6gOXkhNGsqFKiJ4XE=
x-ms-office365-filtering-correlation-id: d9e85056-03e6-4662-854f-08d47e4425f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM2PR21MB0060; 
x-microsoft-antispam-prvs: <DM2PR21MB00607CEA75E6A12586B491379E0F0@DM2PR21MB0060.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6055026)(61426038)(61427038)(6041248)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(20161123555025)(20161123562025)(6072148);
	SRVR:DM2PR21MB0060; BCL:0; PCL:0; RULEID:; SRVR:DM2PR21MB0060; 
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39450400003)(39860400002)(39850400002)(39400400002)(39410400002)(54356999)(74316002)(76176999)(2501003)(2906002)(305945005)(50986999)(7736002)(2900100001)(7696004)(122556002)(8676002)(33656002)(81166006)(2950100002)(5660300001)(229853002)(10290500002)(38730400002)(5005710100001)(189998001)(6246003)(102836003)(8990500004)(39060400002)(6116002)(3846002)(6436002)(99286003)(54906002)(9686003)(55016002)(77096006)(53936002)(6506006)(8936002)(3660700001)(86362001)(10090500001)(4326008)(66066001)(3280700002)(25786009)(86612001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR21MB0060;
	H:DM2PR21MB0060.namprd21.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2017 05:57:32.4831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR21MB0060
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.106
Subject: Re: [Qemu-devel] [PATCH] raspi: Add Raspberry Pi 1 support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwzXiPyTprQD

Hi Omar,

> From: Omar Rizwan [mailto:omar.rizwan@gmail.com]
> Sent: Friday, 7 April 2017 22:43

Did you do any testing of this? One of the reasons I never got around to up=
streaming this was that I couldn't get Raspbian working reliably (there was=
 some problem with stalled DMA reads from the MMC controller), and I didn't=
 have the cycles to debug it further. Also, IIRC Raspbian on pi1 depended o=
n the system timer devices, so it might not make sense to have this board-l=
evel support without adding that first.

> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -34,6 +34,7 @@ static void bcm2835_peripherals_init(Object *obj)
>      /* Internal memory region for peripheral bus addresses (not exported=
) */
>      memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 <=
<
> 32);
>      object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr),
> NULL);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->gpu_bus_mr);
>=20
>      /* Internal memory region for request/response communication with
>       * mailbox-addressable peripherals (not exported)

This line looks like it might have snuck in by accident?

Andrew
