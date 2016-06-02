Received: by 10.25.27.66 with SMTP id b63csp733567lfb;
        Thu, 2 Jun 2016 07:12:41 -0700 (PDT)
X-Received: by 10.55.116.69 with SMTP id p66mr43615232qkc.129.1464876760969;
        Thu, 02 Jun 2016 07:12:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z8si452306qhz.76.2016.06.02.07.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 07:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8TMW-00043x-94
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 10:12:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1b8SF2-0003iq-SS
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 09:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1b8SEx-0005IQ-Se
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 09:00:52 -0400
Received: from mail-bl2on0065.outbound.protection.outlook.com
	([65.55.169.65]:27626
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>)
	id 1b8SEx-0005IF-Kb; Thu, 02 Jun 2016 09:00:47 -0400
Received: from BN3PR0301CA0065.namprd03.prod.outlook.com (10.160.152.161) by
	BY2PR03MB205.namprd03.prod.outlook.com (10.242.36.147) with Microsoft
	SMTP Server (TLS) id 15.1.485.9; Thu, 2 Jun 2016 12:26:26 +0000
Received: from BL2FFO11FD036.protection.gbl (2a01:111:f400:7c09::148) by
	BN3PR0301CA0065.outlook.office365.com (2a01:111:e400:401e::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.506.9 via
	Frontend Transport; Thu, 2 Jun 2016 12:26:27 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD036.mail.protection.outlook.com (10.173.161.132) with
	Microsoft
	SMTP Server (TLS) id 15.1.497.8 via Frontend Transport; Thu, 2 Jun 2016
	12:26:25 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.73.16])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u52CQMY8027054;
	Thu, 2 Jun 2016 05:26:23 -0700
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: <eric.auger@linaro.org>, <crosthwaite.peter@gmail.com>, <agraf@suse.de>,
	<peter.maydell@linaro.org>
Date: Thu, 2 Jun 2016 12:26:20 +0000
Message-ID: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131093439861449315;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(104016004)(106466001)(2201001)(8936002)(49486002)(50226002)(81166006)(92566002)(189998001)(6806005)(50986999)(85426001)(5008740100001)(229853001)(4326007)(2906002)(33646002)(5001770100001)(105606002)(50466002)(87936001)(86362001)(77096005)(47776003)(5890100001)(36756003)(5003940100001)(586003)(8676002)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB205;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD036;
	1:ScQvlX7cms7ivAzRPlGqZo07077t0iC/pdstzo3FS2b8xrWsoiYLKChF/4xcEb+HmrUTW5EzXlZlVs0JNnyDveCOInhWccdubW8zGKnTauBseeFtDx0IAUXKwHk6pBlnpruzEyj32mx34ZXYpbUHiNV4AvflMduNLzyFTELKYG5gMpiWJVYE4h9IxDTm0W9PvjjEUnDKZtX61BV3f3CZge9SXPYO+AgVPQ15FaECYFPdHsW0U+qiXmAyA/dfLzXRYsig2+dKX/UUqDbgp5qfNDX91jw21bGcL7B8h2qUJJ12i1jD24DC1edhkTBrVg7tbtlDx1OEX1Qd5T+Rjz0wzNnM/MkftUq0vUvZE/BSwSm4LOaGgRS0vBEIfOKEk8rjBbfvEvy1He59MXHrR2Esc3Nkw6M6KvzYrUh3nexZAE7lciGUqz12lf2bobTAnk5XHTknPZZ9FVt9Oy/bcxTK9R+DGWhupaJtAuL0IwkN9epBg06Q03xz+pzWofXYrBewG0UCLWjtq383XM3Ln08ouiRbJB9sqhrnUAmeaqsuiFIJUikLghLQceOql0xGKcfVww/jSFFe1xyZCTtR/6gT7g==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 54ef12bf-5cc4-48bc-575b-08d38ae11db7
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB205;
	2:WTpIz9sByDGI6y0IRqtbIhTAz7fn3fGDC03wdyXnO86wZf5YxGbimjf3Q/5Nejgcc6E/JWHcPIXGD/KnsGypmc6g9Dx87V4Kgo9UtSRE4zzIXQ8KcmHH+gMUHB754UcXdoVfXOojVOHKYH33eHgo/WNU0n18HVcqIqs8PqXF8ipraTESeEilQ1w1Od+pKxCl;
	3:l7Kq4EbxzwgJ7TKgKGKpehTH0tIGyQwh8xDSAlFFBCC6pi5li0R05L9ysKC33QFosxUEyB2vfHlUeU5dyT1i7cVXjroRc7E1qPvPkNA+TWk1JaHIOBrVfUglIz0lEpM1CuFliddK+HLsCsl7snzDY6LAb4M2geN3NkB52AIOt6rHuGWMifHdViSqKBvtGr0a4U2HgXvXJq7TzLZpJFACTbymMaSz6R0TOaYu9W29Eac=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB205;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB205;
	25:1Pz3DDK3bCyG0JCF7ePapnZi8BrHyAzdNRNRcV02kb2k1OyGb5dV2BsrGTT/vOLYizogtNFnwmiLhE1NHcrFuDwjN/MlENjMnSSzt7EfLXWvEiXykTHRSeB5xTkvKQGjkgbAEYRxXuJ4xguJ1fjOKuNMGqvic0rT1VrpefiHC8oIEooMuDrs8JkWYN0mV8om5c+HVO8vgyC7FqpEvyVvJ0QeirMCtVwmtlzSYp/Xq1GyV4SJ4rm1qs5M53h+35Rdaig7g6Vgw8gFKfPb5ZbTz8UTYelCayjuO/ALKNCYE0kZul6dDGuEAlTy5H5ymebTiBnwvL9jYcN3TQmXEeNGYmMKdfW/70tWFow0hVSr8INqAL7Prc85WO6kbeez/6WQxZnBKUxrLwUYsd7EAFW2p3WH0sAg7TroryvDeY1DZHMtZ/0tK+w5JKiji/j/e0GLQc7GK6RZut5saswtXLq0HM6Ol/3Q6p1nsOosjEPvbVwaHkPLew0QueGwhCnbKymIL64FbGaE1ClXYipoG04LJYuBId3NcoR1zGA2Tsa+d6hTesmVjGIsCAJNbzLZyegKgzVgWWE8jdayGe6P6ejvwo8yH6RuLZzq9M8WwoqNTN1ngM129UqRUmrfmQqV6ClWenL91zghwHqAKbg1zosw4PqZoVe9COKpmIwNdqR7xS7Kwg99m+C88Pmij0mFS0rKMw3OWHttTbc3irFSTKWMrWmuHvA7gMAY/MHIyQ3hlC8TSaZg/tW4tmLigLkyG/6VxDkt4X5Ua3RwX38XaSM6og==
X-Microsoft-Antispam-PRVS: <BY2PR03MB2055DC3FB2EC6A90B17ACDBEA580@BY2PR03MB205.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13018025)(13017025)(13024025)(5005006)(13015025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BY2PR03MB205; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR03MB205; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB205;
	4:AVYM6uMNOXToV05qR9FZ0/KwWdnABX0Dof3lv4neWdjv5vOZT8Q+uP/YrwebWVY2ghpQqW4MK5OUUzIxV/IyOIOVUEkEoGL/utcQEL8v2FvsEr4SFsBii1ybjDYiAYkE1pN36LZySwy5HYG4RQJMZp+CD33l1gJRnyOnpP7+A2dabNmbxmPm4IO1dF0sYqtZWm2hujtlA5b8GLYoa6YxKYwPhRxC8hOjVB16RMSdiuwzyhGI61hJ8wHfvef7jd9x+wj5wpZ+vqJppCnUXYr+9xCOOJHPWLDjwV+Vis/SWkvDieAepijeKbASnvw9yXAhi0pKPOKbC3Rv9pMX3Z0hTAc/z+dylNPLkJ4qSUFM5IprrZf5kg73TgBnE+xBIMpyWZjzeiNwTUzxWCAqvl8BOnsY5Lej67LNsM4wsjnnk0DPF0iGYX5mY6uDkB7LznHd/XRf7aRqPYDZTurCHFEhchPrMKq3CsTvlPaKM2RcP34=
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB205;
	23:qoJiR14zGhLW2NCbeF/ggZQBHMjLpzKlo96vHk7vhm?=
	=?us-ascii?Q?G93ARcidKZ78csONWbNSknt15Xr4hcyhQ82h68NOYY1Ayp18HUgcvP3ejXj/?=
	=?us-ascii?Q?O0hRQvBV++HBK5lpTvE7FJGHXe1wfnKa7olw2xSrkGZhnUbc7uwAhC9MbMcg?=
	=?us-ascii?Q?Z25A6SNtn8RD6qnrUtZKzsvjAms87CV0N+0e0x1LCAAD8Pq9HCdKKh/eBec2?=
	=?us-ascii?Q?CkCWjcqT4xcipgQyo8NKGaBn0B07/N8/5fO3q2mZdP3hwO732oidrABOig+a?=
	=?us-ascii?Q?lf8dnrmv8yaez0mth2J4Uykorm+qIGnX6UR9+jlOf/fZQNdnse1Yn0sVjA9l?=
	=?us-ascii?Q?m+MLNpGVcr2zoqKN4O6fSkj2qnoTFHELvsvoGu/Hr1FF587Tj4gLqq6CAQAF?=
	=?us-ascii?Q?DLFsMuds+qJTi3DGooKBmps4EBKudK73Anr333hLszRGdNMBbnGMW6LEnrez?=
	=?us-ascii?Q?qFsqlkSskoZKFub5C/pq8lrsGpxNyEQMigyp7EQTRVoYdlQGPOo1N+8LgIas?=
	=?us-ascii?Q?aXqa0bLeq/7MXL7AmC4ikhbICIyN5z0M08YZssMgJdO+0TJ02+7BgljnrzvX?=
	=?us-ascii?Q?8H2nHKYsMANHyk6hTN36lG0FTyRDoANbVZ/JTvvO/s0tdeKumwi8Koo4xxJU?=
	=?us-ascii?Q?UWkMKbIVLzMobhqRVhgGn0RMqrTdmy9taqGn9vbBlxDLDBgBXpeOV3SOzVVl?=
	=?us-ascii?Q?afjnTSwBw3UuYjjtmU4vWnB8EKqtIWk05zb1+iaF51YwrhgwwyWLInO7TSle?=
	=?us-ascii?Q?frn1imPIw6B8obOnKwtHi/o7on4+euZaYKV3Nop3gGbqUWSf/9CWmOhaGYhb?=
	=?us-ascii?Q?yTCXCZzdjcpvxg2jU5IiBocibX+uPmFqc4SMGHewJLETem2Z8HwRkKX3n7nW?=
	=?us-ascii?Q?H4DUgjQkDO6DshGq55yfT9pxWJ5axGgR/tZcXhvQaPkweDF0j+KhcljYOadf?=
	=?us-ascii?Q?vVhWaJATtYEXUnnUE3JmsPMCp9aZUWCPdKCKlfw/eWLldgCn9LsgNiW2sJtL?=
	=?us-ascii?Q?0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB205;
	5:FavfQOvf8ZBr77RsiyObmuc4oIeBSuAM9wOaKiHzGG6WU4ZX5kp5GXqopS4WU3T8mWi8jxdI1vR0NBSxd6wGq7k35r5xwwwrsxWr/45C22kGcl2ND3ehYo3SeoM6D1vr7EqWkpuMDVOxEzeJ2VJMJoU1iNjnqzZ0GVevpk/khaY=;
	24:IEwQ33alAvGKXYqBDjuOPeGX00jrgjzbvOxsdr1lZPM4Gjy4FAgdZXGSNcvmkEAzflnEuOzi8gLaBT+jBw/68njRhEwEIpJTCCQfo540J4s=;
	7:OJiDICqh39va6/ZZUVfcYBXJcLiw0pyh7h/11SoEO2VtWoLLxUl8mY6ZwhcOsJkJ5ikWk66Dck9PBJGyfky2x+r6xHmICbNXwbzOizjr+fOtYoRpmPKXf0f4VsZdswbKdUQtwzs1l57w6xcAGGx2P7/IASuroAZAnX9yrEaQRJh8XzopkFGunfI/4O7S51B5
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2016 12:26:25.7549 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB205
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.65
X-Mailman-Approved-At: Thu, 02 Jun 2016 10:10:09 -0400
Subject: [Qemu-devel] [PATCH 0/2] arm/virt: Propagate pcie DMA coherency
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqc1yENyeE9P

A PCI device is marked as coherent according to the "dma-coherent"
attribute of itself or of the associated controller. This property will
determine how it will issue DMA transactions, and how it will map its DMA
memory. When passing the PCI device to the guest using VFIO PCI, this
isn't taken into account. QEMU emulates a single generic pcie controller,
regardless of how many PCI devices are passed to the guest and to which host
controllers they are attached to. Also, the device need not be described in
the device tree at all (e.g. e1000e).

In a scenario involving aarch64 and ARM SMMU v2, I noticed that without the
dma-coherent property of the guest pcie controller, the eth interface
descriptor rings read stale data without explicit flushes - hence causing
VFIO PCI to not work. Since the host pcie controllers and interconnect are
coherent and described in the host device tree accordingly, this needs to
be passed to the guest as well.

Add a routine and device tree helper to configure the guest pcie controller
based on the host device tree.

Bogdan Purcareata (2):
  device_tree: introduce qemu_fdt_node_path_prop
  arm/virt: Mark pcie controller node as dma-coherent

 device_tree.c                | 59 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c                | 31 +++++++++++++++++++++++
 include/sysemu/device_tree.h | 20 +++++++++++++++
 3 files changed, 110 insertions(+)

-- 
1.9.1

