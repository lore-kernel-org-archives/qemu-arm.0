Received: by 10.25.159.19 with SMTP id i19csp779423lfe;
        Tue, 12 Jan 2016 14:56:44 -0800 (PST)
X-Received: by 10.140.221.17 with SMTP id r17mr135963523qhb.94.1452639404327;
        Tue, 12 Jan 2016 14:56:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si14503467qhy.0.2016.01.12.14.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 14:56:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:34503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ7rm-0005bU-Tk
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 17:56:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJ7rR-0005KY-EK
	for qemu-devel@nongnu.org; Tue, 12 Jan 2016 17:56:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJ7rM-0003a5-E8
	for qemu-devel@nongnu.org; Tue, 12 Jan 2016 17:56:21 -0500
Received: from mail-bl2on0137.outbound.protection.outlook.com
	([65.55.169.137]:2767
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aJ7rM-0003Ze-7U; Tue, 12 Jan 2016 17:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UdgLtzd2EYMCQrjRakicJhR7hvuDQfsWq6p6cmSN1kU=;
	b=hpzoYs1NBMmbVy83IpB/EQLfTKRw6EVChOmveDBVAtOk69dopr9fg8a7qgvlBr8uxf9CWvZf7PHG8quDQ028WO1HpydEGjKLAEHXRqgA3taHka6LDbzpvK2NjG0wSI2wxrd96N94R5ORBh/xwynOqTd8nJY9YbxgPYvv+DSb6qg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Tue, 12 Jan 2016 22:56:14 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0365.022; Tue, 12 Jan 2016 22:56:14 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v3 6/7] bcm2836: add bcm2836 soc device
Thread-Index: AQHRRCvQIPEuTVmAsEC1AOoPDIhrcJ73UiqAgAEZ3hA=
Date: Tue, 12 Jan 2016 22:56:13 +0000
Message-ID: <BLUPR0301MB20349F632BDD3C52631961259ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-7-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035645.GC3308@pcrost-box>
In-Reply-To: <20160112035645.GC3308@pcrost-box>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:6::724]
x-ms-office365-filtering-correlation-id: c503f1ed-a8f2-4fc4-f256-08d31ba3927f
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:Wnez00VjpYc9inkX+POZyRNt4x/dBA4Sc6gmTxpNxWIBLc6m/V+500C2ZuDM+zbbyEIVdd1oC9hbQ3PENpU8V123kUp5mnFVAmbZrf6Pw8WHshiIGULorDON27mwJONa9GivfgwHIVrNTbp/NeHepA==;
	24:CPvuJxBOpITmL0SDI079uJUh0WjOlJbEegiIRHFTp+1MLh7VMHYtfFmrR0keH0a4RrLkm3IuLR+K9JaNfwBbsShUrtj2MDltCiJDrkE8pjI=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB20355D151E26FCC1FD22CE9A9ECA0@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 081904387B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(43784003)(24454002)(199003)(87936001)(19580405001)(5001960100002)(110136002)(11100500001)(5004730100002)(8990500004)(99286002)(10090500001)(122556002)(81156007)(19580395003)(5005710100001)(105586002)(10400500002)(10290500002)(2900100001)(2906002)(86612001)(106116001)(106356001)(189998001)(4326007)(86362001)(40100003)(50986999)(101416001)(2950100001)(5003600100002)(6116002)(33656002)(77096005)(1411001)(76576001)(92566002)(586003)(97736004)(1220700001)(5002640100001)(76176999)(102836003)(1096002)(5008740100001)(74316001)(54356999)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2016 22:56:13.8505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.137
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 6/7] bcm2836: add bcm2836 soc device
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
X-TUID: HrjSBTssz0ti

Hi Peter,

Thanks again for the reviews.

> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> Sent: Monday, 11 January 2016 19:57
> On Thu, Dec 31, 2015 at 04:31:33PM -0800, Andrew Baumann wrote:
> > +    /* TODO: probably shouldn't be using smp_cpus here */
>=20
> I agree. I have started ignoring smp_cpus completely for new ARM SoCs,
> as if you change the number of CPUs for a SoC, it is not that SoC
> anymore. The virt platform is suitable for CPU scalability, whereas
> with ARM SoCs, cpu # variation is invalid.
>=20
> > +    assert(smp_cpus <=3D BCM2836_NCPUS);
> > +    for (n =3D 0; n < smp_cpus; n++) {
>=20
> So can we just use BCM2836_NCPUS here as the loop bound? Any
> conditionals out there check the existance of CPUs can be removed or
> promoted to assert() as a BCM2836 must always have 4 CPUs.

I'd love to do that, but there's at least one good reason to respect the -s=
mp parameter and not start all the CPUs: with full-system emulation, qemu i=
s noticeably faster emulating a single-core target than multi-core. E.g., L=
inux boots fine with -smp 1 (it fails to start the other CPUs but proceeds =
with just one), and many users will be better off running it this way, so I=
 definitely don't want to break that.

I tried always initing all 4 CPUs in bcm2836_init, and only starting a conf=
igurable number (based on a property) in realize. However, arm cpu_exec_ini=
t already adds the cpu to the global list of all CPUs, and if you try to st=
art the system in this state it quickly segfaults on uninitialized state in=
 the CPU, so it seems we shouldn't even init CPUs that won't later be start=
ed. However, I can't refer to properties in the _init method, which is why =
I'm stuck using the smp_cpus global.

If you have a better suggestion, I'm all ears :) Would it make sense to def=
er calling init() until the realize method, when we can access a property?

Cheers,
Andrew
