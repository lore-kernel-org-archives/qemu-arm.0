Received: by 10.182.158.201 with SMTP id ww9csp582231obb;
        Tue, 17 Nov 2015 00:26:19 -0800 (PST)
X-Received: by 10.31.136.211 with SMTP id k202mr2375759vkd.93.1447748779152;
        Tue, 17 Nov 2015 00:26:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16si1842819vkd.73.2015.11.17.00.26.19
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 00:26:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:56594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zybak-00067q-NR
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 03:26:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1ZyTcZ-0006BQ-1w
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 18:55:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1ZyTcU-0005JG-Mp
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 18:55:38 -0500
Received: from mail-bl2on0106.outbound.protection.outlook.com
	([65.55.169.106]:31806
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1ZyTcU-0005JA-B5; Mon, 16 Nov 2015 18:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Upoa7SkKw9uAEW0HD4Daa3avVMsGrR9j1Jk3nbckTHA=;
	b=M2hZ6Ksx7id+0leoLZQ2Hj35y6QgVAxR+zmNjJCdoKMkMT1VU1ZbiASwKwCmJUbMpRhda5FYKW1KsdQOkJgmrRefARBw5YIERgXyNVw+jQ5QxlYdJ7dLr6MbGe0I7WXwszSsINsLsydB+IO8+12AYjiYEPdnELmv+6uLzvTExyU=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Mon, 16 Nov 2015 22:22:32 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0325.003; Mon, 16 Nov 2015 22:22:32 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: RFC: raspberry pi / pi2 / Windows-on-ARM support
Thread-Index: AdEem9sZHjs9/bX/Q4+JMP7QmdOAYQ==
Date: Mon, 16 Nov 2015 22:22:31 +0000
Message-ID: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:e::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:/fWLe3+O5pWoJJ1UiRI+iMzEvT59s4/j8upYYyaSUOEhfE71a0mJcbpb0JYnaH6RYCNmDkBy2YhNplnJViy69lLV6l9Q6iYSDFeX+mH7DCy3QVJ5v5t3EDDSVVDdeE+h6Iot4lqETsiR0/9w1WuW5w==;
	24:Rs3PSe424s5dFwTtdCfNCp4G6hVArLqPVJQvdwmyoXnS9antyxX+tHDNX+jECzoIh4HBngv/GSWkAw4A0Q19ZZ0SlLpFPif8lXcTG1Ehid4=;
	20:HWACL5IX2ZH8kJ5aFkQTMZXxbrDKXbjvJPcS+p/uc2ImlM/gE4D2mSUQ+CvUE6F1dCe3zuHtn1D4/VjEI5u8pQ==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB20361D171C14C697EC4D41059E1E0@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425024)(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001)(61426024)(61427024);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0762FFD075
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(199003)(377424004)(189002)(53754006)(110136002)(74316001)(5005710100001)(97736004)(10090500001)(10400500002)(122556002)(87936001)(10290500002)(54356999)(5004730100002)(5008740100001)(105586002)(5001960100002)(50986999)(86612001)(11100500001)(229853001)(101416001)(86362001)(2501003)(586003)(189998001)(575784001)(76576001)(33656002)(19580395003)(16799955002)(5003600100002)(5007970100001)(77096005)(5002640100001)(81156007)(99286002)(102836002)(230783001)(40100003)(2351001)(2900100001)(15975445007)(19625735002)(106356001)(92566002)(8990500004)(3826002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2015 22:22:31.6433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.106
X-Mailman-Approved-At: Tue, 17 Nov 2015 03:23:23 -0500
Cc: Stefan Weil <sw@weilnetz.de>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?iso-8859-2?Q?Jan_Petrou=B9?= <jan.petrous@tieto.com>,
	=?iso-8859-2?Q?Gr=E9gory_ESTRADE?= <gregory.estrade@gmail.com>
Subject: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
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
X-TUID: pteeTFqLvWuf

Hi all,

I have been working on Raspberry Pi 2 emulation, building on the previous w=
ork of Gregory Estrade, Stefan Weil and others on the original Raspberry Pi=
 target. My current working tree (based off a recent master) is here:
    https://github.com/0xabu/qemu/tree/raspi

The present status is:
 * The original Raspberry Pi (-M raspi) support works only with older kerne=
ls from Raspbian releases up to 2014-09-09, for unknown reasons that I have=
n't investigated. [1]
 * Pi 2 (-M raspi2) supports both Raspbian and Windows.
 * Raspbian boots on pi2, but fails on an implemented SETEND instruction in=
 early userspace. I'm told there are patches/workarounds for this floating =
around, but have not tried them.
 * The Windows IoT image [2] boots completely, but the USB emulation is bro=
ken, so the only IO devices are framebuffer and serial console (which can b=
e used for a kernel debugger).
 * All four Pi2 cores must be enabled for Windows, since the bootloader pan=
ics if the expected cores are not present. Conversely, Raspbian fails to bo=
ot if multiple cores are enabled, but I haven't debugged this, since qemu i=
s faster with a single-core guest.

I realise that getting this code integrated will require a series of smalle=
r patches, but wanted to solicit any early feedback before I start doing th=
at. I've verified that checkpatch.pl is happy, but if there are other styli=
stic or general problems with the code it would be helpful to know about th=
em sooner rather than later :) If anyone has specific suggestions for how t=
o split up the patch, that would also be welcome. If not, I will start subm=
itting patches for the individual pieces, probably starting with the machin=
e definition and then the larger devices, followed by the Windows-specific =
fixes described below.

There are also a couple of significant (non Pi-specific) changes that I mad=
e in order to boot a Windows on ARM guest, which also I plan to submit:
1. UEFI (TianoCore / EDK2) has a couple of bugs in its MMC support -- it as=
sumes support for CMD23 (set multiple block count, which is supposed to be =
optional), and also fails to initialise correctly if the card is ready imme=
diately upon issuing ACMD41. My tree includes workarounds for both issues -=
- I implemented CMD23, and modelled a small delay when initialising the SD =
card.
2. For better or worse, Windows relies on taking alignment faults on a misa=
ligned LDREX, however qemu doesn't perform any alignment checks, leading to=
 a bluescreen very early in boot. The changes in target-arm implement a gen=
eric infrastructure for testing/raising alignment exceptions, and add a sui=
table check to LDREX. (This is almost certainly applicable to arm64 as well=
, but I don't have a means to test it.)

Here's the current diffstat (ignore the minor unrelated bugfixes in lan9118=
 and tap-win32):
 default-configs/arm-softmmu.mak      |    1 +
 hw/arm/Makefile.objs                 |    1 +
 hw/arm/raspi.c                       |  514 ++++++++++++++++
 hw/char/Makefile.objs                |    1 +
 hw/char/bcm2835_aux.c                |  250 ++++++++
 hw/display/Makefile.objs             |    1 +
 hw/display/bcm2835_fb.c              |  384 ++++++++++++
 hw/dma/Makefile.objs                 |    1 +
 hw/dma/bcm2835_dma.c                 |  352 +++++++++++
 hw/intc/Makefile.objs                |    1 +
 hw/intc/bcm2835_ic.c                 |  248 ++++++++
 hw/intc/bcm2836_control.c            |  373 ++++++++++++
 hw/misc/Makefile.objs                |    5 +
 hw/misc/bcm2835_mphi.c               |  176 ++++++
 hw/misc/bcm2835_power.c              |  113 ++++
 hw/misc/bcm2835_property.c           |  409 +++++++++++++
 hw/misc/bcm2835_sbm.c                |  294 ++++++++++
 hw/misc/bcm2835_vchiq.c              |  113 ++++
 hw/net/lan9118.c                     |   18 +-
 hw/sd/Makefile.objs                  |    1 +
 hw/sd/bcm2835_emmc.c                 |  844 +++++++++++++++++++++++++++
 hw/sd/sd.c                           |   78 ++-
 hw/timer/Makefile.objs               |    2 +
 hw/timer/arm_timer.c                 |   39 ++
 hw/timer/bcm2835_st.c                |  201 +++++++
 hw/timer/bcm2835_timer.c             |  242 ++++++++
 hw/usb/Makefile.objs                 |    2 +
 hw/usb/bcm2835_usb.c                 |  655 +++++++++++++++++++++
 hw/usb/bcm2835_usb_regs.h            | 1061 ++++++++++++++++++++++++++++++=
++++
 include/hw/arm/bcm2835_arm_control.h |  481 +++++++++++++++
 include/hw/arm/bcm2835_common.h      |   35 ++
 include/hw/arm/raspi_platform.h      |  155 +++++
 net/tap-win32.c                      |   51 +-
 target-arm/helper.c                  |    8 +
 target-arm/helper.h                  |    1 +
 target-arm/internals.h               |    3 +
 target-arm/op_helper.c               |   21 +
 target-arm/translate.c               |   29 +
 38 files changed, 7141 insertions(+), 23 deletions(-)

The command line I've used for Raspbian is:
qemu-system-arm -M raspi2 -m 1024 -kernel kernel7.img -sd 2015-09-24-raspbi=
an-jessie.img -append "rw earlyprintk loglevel=3D8 bcm2708_fb.fbwidth=3D102=
4 bcm2708_fb.fbheight=3D768 bcm2708.boardrev=3D0xf bcm2708.serial=3D0xcad0e=
edf vc_mem.mem_base=3D0x1c000000 vc_mem.mem_size=3D0x20000000 dwc_otg.lpm_e=
nable=3D0 root=3D/dev/mmcblk0p2"

The command line for Windows is:
qemu-system-arm -M raspi2 -smp 4 -m 1024 -bios kernel.img -sd th2preview_pi=
2_iot.vhd
(where kernel.img is the EDK2 bootloader from the first partition of the Wi=
ndows image).

Cheers,
Andrew

[1] https://www.raspberrypi.org/forums/viewtopic.php?f=3D72&t=3D26561&start=
=3D125
[2] http://ms-iot.github.io/content/en-US/Downloads.htm
