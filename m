Received: by 10.25.208.211 with SMTP id h202csp88194lfg;
        Fri, 26 Feb 2016 16:20:20 -0800 (PST)
X-Received: by 10.140.102.142 with SMTP id w14mr5478332qge.58.1456532420658;
        Fri, 26 Feb 2016 16:20:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si15611987qka.50.2016.02.26.16.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 16:20:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZScO-0007uK-0E
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 19:20:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScL-0007qK-B0
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 19:20:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScK-0001Uz-8G
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 19:20:17 -0500
Received: from mail-bn1on0115.outbound.protection.outlook.com
	([157.56.110.115]:58784
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZScE-0001QD-0u; Fri, 26 Feb 2016 19:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=U2oSaNxUdePSzxX+ewZKb8IicBIS8ZN+Dn7NxxVJywU=;
	b=domYsNvcSXMKrTYWV+RvtMgjzcrPSd+YHlz7B+jjQnutcjMGnCk4q8/AekQAsTg4TZ25n8qf19F2eJOmN7+6IpFvdVqLh40QJtIz4epIVnwNqvKv72FCAhllYPViwAuN5Vd1OvjENYDyaioN17q95s+DH6DEaABqUW+HDqOpIEg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:f::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.409.15; Sat, 27 Feb 2016 00:20:07 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 16:16:10 -0800
Message-ID: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:f::724]
X-ClientProxiedBy: CO2PR20CA0016.namprd20.prod.outlook.com (25.163.96.26) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-MS-Office365-Filtering-Correlation-Id: 4cfedaf5-2d6a-4372-e89b-08d33f0bbf81
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:g0D1thwn+DhShH7XTe+PpodhKmIgFWzqS1LTvEvArjDWh20HoK5Ed9ZUQshGzsN3hOzYOpaWhAFlVGS3K6oyAScGKzlqdf/EqGXCtfN5fKZyAtP/EkGWGQF6A0AJ91FSuHzu06RPUqsezhLrgxzqFArTupZvjOifA1E07ZD7Hxx5Eqvw9kyBhkI7RBwk2KYS;
	3:TA2mBoxdDZa2ujK3Im+9DqtLFLyP1DDQ0iOLgX+5PVyUvtGG83pPM1wvbNjYP+EiCnaE2BHFfg7xBA9syTaB/41Lq6XGlMAJPjdWajraP4kGUq8EwU5c7wTGG8Mh1lbj;
	25:HjaXb1TWkAInJnS1o9AkaNXADCjpBHImBWaTIuRxVerOckbwY6XA2AF4C/1aaDQmAPNntRlBc/8r1yZQCx+jwq5w8XxMfY+lhmhIVDI0/SXhMYkmtdsDQagQKmnvf4OyWjlGLdAKlvPdy23kjohcnjVaERc+3Cn2K+qdpEyrY5sa9HngL2U10nM4D56IVSxRVJSwaQkZVHIE+GcyrkMvv9tWT+Tt4qcouFBK5M9oEVWZSf9fdD/M4lb04qBZXn9NA8Z2Dh7NiRcZENo5AujtTqYVRjslyoTafjkWSaUOt33cBzw5ltsK8YmGD7lCyRIJhFvNwcoPvV9/fr6ySK0caA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:jxymVnEzyaZxCjrZFnGjudwTQDeQBEeaIRPF3mg9m0vFqLPIPGV8LQzvtOErO4BSOGS9OfYpzMox8qy35Sx/7mBJGBre2uf/PZ+Q2CR1Ep163BfSP/Oc4DxCskC5krHsOqLdJbJxbisq3SsbpFAjh1TclQ0KszOIPN0gmBKQTnJgkZxffKoaOls0Yj5FGCgbQBIUxOlFVmGbApL+yYyHnZssTWiELSMYHiCS+F8htGuBNOFwaJ4/LmCAwGiD550rTq+uZyUdUIEhJJ9IazepTvkDCd0Gd6IMb8kWU7BwVBVXZja6+coupZbWmaiCVjW0sgCzW4DGp+lcQU3tcRMNelmhLPkY/a6NyJ3vUZaD+bq5IaSk1qMVrvAZ3k6WeAsRHxiz71EYyqVOlB2HNNj0PyQRiWJVdNpYqOH33AUfTV3El04ysLcRMKcgfWIhUEyrBSTrRMtMhC15I7hXkeDhFieE09DbsVC9LSXAA8u+8mLx9f8vN4pRIAtEqPWYDJR5;
	4:7p2pIDOLv4JCC6DhZX2GVLZ35hncJd9JNeYeYDCK61i1aPgu9gy8qy8bu/GyYMkgL9s2iKJHnlGjCzK/+NIbjqbxJmt1M4gOpM2kFP89tddtOD73Lmu5vzNzbNI8ZRLDLB3rGVb++LYg8S6qAdyoVIOu35fGwCBIQ6xslJPNlQnHiFZ1adaAMPsL/iWyTsT3m0yzwaAh1OTeC7J4LMlqRGmAEYiaQOePBYBoR7kvW2EJB+yiEteOyuHUy1XbZD9uTHXdYOKcG8SqbjUiAlXpYNIN9H3x8pJBpOj9dxSyLeSF9LliWtoHJtv5gA84/jumN1PUO5tXYMXXCJr/kLZpEWEKPsUl7r4wE7tIOliquGX+JRckadMjSDhTdGpV9uVP
X-Microsoft-Antispam-PRVS: <SN1PR0301MB2046322BF589F9E027DDA76E9EB80@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 086597191B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(55674003)(36756003)(122386002)(87976001)(5003940100001)(10090500001)(86612001)(50226001)(40100003)(50986999)(86362001)(189998001)(4326007)(47776003)(5005710100001)(10290500002)(5008740100001)(4001430100002)(92566002)(2351001)(6116002)(229853001)(586003)(1096002)(15975445007)(42186005)(110136002)(50466002)(77096005)(2906002)(107886002)(19580395003)(5001960100002)(48376002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:ZbtIKROapT5zojymcvAurQBIOgFmS4aYONEpmhX?=
	=?us-ascii?Q?UF8QYlrs4VU665vxjNgQGbBq50s9r4ff+Bw4C9E7kRUGMJAAxa2H/8aFm5J2?=
	=?us-ascii?Q?EXwzAG2GBExSyEkg8LKchqACzbH8KTYkWS728hWDKVYI4f5ILee/HfXGcaI/?=
	=?us-ascii?Q?OgowSVlBmDtqrTkHIJI1hIpCj6IPgjO8KZGdE7QbqpnbUnuYj3s/s+aa2ucm?=
	=?us-ascii?Q?3yKY/J8PVTn46rfxakrEE1OPvgtKvZbiOmZZ1t+llZtvP6g3Z12CMA3h9Nk8?=
	=?us-ascii?Q?21GabaisibSrF1w0MxcMHMZAnvqPxZDWcbY7EGh+S5y+y1qbGScZhQabd9HI?=
	=?us-ascii?Q?c1SBOIXoJTKG4D/IZ5gx+BT1Ln5PVCq1JGFeK2Xamn+pOFKzE+IwUTol6fyH?=
	=?us-ascii?Q?8iefTED9xudqZf+bkTSzBLD6PM+zBx88p2JYujTgErEn+BN+Xy2phUBom48D?=
	=?us-ascii?Q?ZkrqHf23Qj3kr45pNbocRJkZJ+kT60yqyQlRTTU4tzOtwkDAltF7TEky3f9i?=
	=?us-ascii?Q?OZ+qrCn+01LmlMacUYbX6AVe0OK3OGpQKYozRMHjjHQEi2MRnBCNpVsQXbBp?=
	=?us-ascii?Q?GWGX7m4aeq8+fOSSGqALZbymUJhRxg5NuFPL6fLhS5GAiSXdVfYgZ+VnC4CV?=
	=?us-ascii?Q?miAwpj3XZwJEYsm4rnS91ExesbaJf7WrgIkzgpYfUU2vjVLH4BIth4e6sYdA?=
	=?us-ascii?Q?wp4UE0ejDLE09UgkwiKnNnOcSKv18tGeUOVghdB7coKCPH6+KghUU+Ig3WJe?=
	=?us-ascii?Q?C2QrUsmus6C66W8gcboH9FTqW7skvIrzctPZbhxMiWYOQxSsISMJLyfJ1bKK?=
	=?us-ascii?Q?p3uV+tGKBaEPLVC/R6b+wxW0KYuCpw+AX3SBDB8pr5ELx9VI10SyXhuV2n6X?=
	=?us-ascii?Q?EHWZ2ZBPry8Hw28jpV5xB0ipc5QrWtNLBoowzRQbDrhRbau73IXm3Hlo++pw?=
	=?us-ascii?Q?sCAcxUKVTB7CyqVmgOexaFYEUTDnX+ntxucxBbzngUU5us/JDf375c/imjdk?=
	=?us-ascii?Q?vcW4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:6cNEU//7p61wB8He5Wg9+VBL5HSphfXyt7txcJoKL7ELD8DLbGOClhjoB01yplXRijY2816Z+mN0EL1RVGl28DsXG0FWjXjzDiCsUcWuC0HNcFzZDTs/EbABmCnQqFQwJnvHeqNegQVhXxJ2ujfEpQ==;
	24:qkqU2hEjxEJ4EbLcELYNvD4Xwu9+5oFQvfOw1TlUq/tR72qKB2uT22419Ut6ZRxn0oU/Bs67q9iWWjfNEVxFTNBNmyKccdEn63TkjaFB5qE=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2016 00:20:07.4367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.115
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH 0/4] Raspberry Pi framebuffer and Windows support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3ReyyWA6C7bm

This patch series adds support for the AUX (second UART) and
framebuffer devices on Raspberry Pi 2, and enables booting Windows on
this device. As with the previous series, it is heavily based on the
original (out of tree) work of Gregory Estrade, Stefan Weil and others
to support Raspberry Pi 1.

After this series, it is possible to boot Windows by following the
instructions at https://github.com/0xabu/qemu/wiki. There's also
documentation for booting Linux on that page, but note that you can't
load bcm2709-rpi-2-b.dtb because the DMA controller is not included.

I plan to add DMA, USB, and reamining timers / system devices in
future patch series, along with support for pi1 (bcm2835). In the
meantime, the complete code is available at https://github.com/0xabu/qemu

Cheers,
Andrew

Andrew Baumann (4):
  bcm2835_peripherals: enable sdhci pending-insert quirk for raspberry
    pi
  bcm2835_aux: add emulation of BCM2835 AUX (aka UART1) block
  bcm2835_fb: add framebuffer device for Raspberry Pi
  bcm2835_property: implement framebuffer control/configuration
    properties

 hw/arm/bcm2835_peripherals.c         |  63 +++++-
 hw/arm/bcm2836.c                     |   2 +
 hw/arm/raspi.c                       |  12 +-
 hw/char/Makefile.objs                |   1 +
 hw/char/bcm2835_aux.c                | 241 ++++++++++++++++++++
 hw/display/Makefile.objs             |   1 +
 hw/display/bcm2835_fb.c              | 421 +++++++++++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           | 139 +++++++++++-
 include/hw/arm/bcm2835_peripherals.h |   4 +
 include/hw/char/bcm2835_aux.h        |  31 +++
 include/hw/display/bcm2835_fb.h      |  47 ++++
 include/hw/misc/bcm2835_property.h   |   5 +-
 12 files changed, 954 insertions(+), 13 deletions(-)
 create mode 100644 hw/char/bcm2835_aux.c
 create mode 100644 hw/display/bcm2835_fb.c
 create mode 100644 include/hw/char/bcm2835_aux.h
 create mode 100644 include/hw/display/bcm2835_fb.h

-- 
2.5.3

