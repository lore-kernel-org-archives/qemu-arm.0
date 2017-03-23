Received: by 10.25.15.230 with SMTP id 99csp803679lfp;
        Thu, 23 Mar 2017 08:12:27 -0700 (PDT)
X-Received: by 10.237.34.150 with SMTP id p22mr2692994qtc.66.1490281947173;
        Thu, 23 Mar 2017 08:12:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si3916923qtf.75.2017.03.23.08.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 08:12:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:56944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr4Pa-0006t7-JZ
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 11:12:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1cr4OA-00064f-E1
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 11:10:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1cr4O9-00034Z-3B
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 11:10:58 -0400
Received: from mail-bl2nam02on0059.outbound.protection.outlook.com
	([104.47.38.59]:45217
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1cr4O1-0002vk-Rg; Thu, 23 Mar 2017 11:10:50 -0400
Received: from BN3PR03CA0060.namprd03.prod.outlook.com (10.167.1.148) by
	SN2PR03MB2269.namprd03.prod.outlook.com (10.166.210.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.961.17; Thu, 23 Mar 2017 13:37:18 +0000
Received: from BN1BFFO11FD001.protection.gbl (2a01:111:f400:7c10::1:156) by
	BN3PR03CA0060.outlook.office365.com (2a01:111:e400:7a4d::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14 via
	Frontend Transport; Thu, 23 Mar 2017 13:37:18 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD001.mail.protection.outlook.com (10.58.144.64) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Thu, 23 Mar 2017 13:37:17 +0000
Received: from fsr-fed2364-102.ea.freescale.net
	(fsr-fed2364-102.ea.freescale.net [10.171.72.66])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v2NDbEsv029966;
	Thu, 23 Mar 2017 06:37:15 -0700
From: Diana Craciun <diana.craciun@nxp.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 23 Mar 2017 15:36:50 +0200
Message-ID: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.5.5
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131347498381105601;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39850400002)(39410400002)(39380400002)(39860400002)(39840400002)(39400400002)(39450400003)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(4326008)(104016004)(33646002)(81166006)(47776003)(36756003)(6306002)(50466002)(2906002)(85426001)(77096006)(189998001)(50986999)(356003)(105606002)(6666003)(106466001)(86362001)(561944003)(8936002)(50226002)(54906002)(38730400002)(53936002)(8676002)(5003940100001)(8656002)(5660300001)(48376002)(305945005)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR03MB2269;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD001;
	1:xDQQc/qKvPopW/uzTekOo2eZ2na5RyPgiQGg/sSNPKfBk6DS1l5Sa46Ba2zp57FpozqwS6l4+klI2Id1DaaapWB9jxiPa3rNCFhowTeX47DkU8N6umqUWq0Go7XO1lN0nzXv3ET5qL1Ef1lS1da7mBYmhk6voF3NBby8WGW19PxpNqQLQbvsrz1TlKwGfW0BKnsp4tl0o+6k5pajX0TeLLYmMLDZnm/KudZRkRtGzJQ+YsoIt4Typ0Ze5LiW65Z9b58pmCfFOUnhM0SWOu+p80pBxmaf+kTsMwdA3N3AfLSq4uluKOr6RCrApuKz98T53Nw03NuNAGwLJmoRNA9sI6JGIIAENECJrfyk+/+tuP+d1cmtu/u5a1dtLMIUJx4TvV9zrkm1/rn3ySBolaUGhnIdudTmSPHfq14U/l78QRoYubPSycwPbUOM+7i2yAFPgT5wjLD6raXbv9/eUx7WxwODrape+3UP5rXXO7qrIdFV8/SZjp6RRWadR/2OmipH/MIW4o05S+mUy0T+4zZsORgjdJQH5C7perUmRoR5KnDwqLGL5gbyg0PLCU8jbsk70Fpuuhaq7t52kTb4goSjCztSgB53r5ExnI+SAKRWeK0Rl48g6IqxmIzwM/x8uJ7rNH1d42G1hyUCx1jueOCuTUN1XcXoK5O40j6uPXBBpCCG+33vyYVIcXrtka2q4Q32hoBfQ5L1g05e9mt6JpNbVA==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a2be46ed-e6cf-4ad7-4eb9-08d471f1b988
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:SN2PR03MB2269;
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB2269;
	3:qddPmJu1D3kIfI0se9VT/Y23FE4QB7o0QL+64EKAoUFUv3AchDYvugd/d2B2fXKmR7NOkeig3Wza4EGe+qWueDGMJsIz5hLrpsWpUhrm7UGIJ0srkb4ygdNWwKEPgZxasF+Rd7752h1kOV08RJ0v2I+bG19NbjeYIZKZLMTxHBTzHvrws0Ok4jGsS0ct9Q/uVhqc+pvLRvXjC5t3EPVJ3kR6C1VuzFnBYOl0eF9Ti+7VyszFJW2J1zEU2KmNsDvRvycFo49OhHwTjwdOFx0wuP5Yk1GuCeFC6qWX2Oghc9Qa3EBsksysciOTqR05CpfQprgudgjUCeJ3XZjkPrwVZjjwE587FLJ++vKOEDEzWxXRsC9C+vYJy7fw4/rgca1E;
	25:XdQXThF//MoZaqpu6IWtKJXgoRVPgZUS9RMjL2BQKZEacPyOK+2W8SJ1eo/YSUkkhJekXgDGPib7r8EK+iYqCgfFLTm17i3JioUWJa3cgU9fsfAg1Iv967q702MLXPxWvrLoEXrf6+wfTc/HY3wE0AOhxAVN6c762C1JJQ1HZ+l/gwX1yR9gscQrLR5C40noyp+xkqV1RP8sY7rcLTCwHvBI4+hjgYRKfIJbImckmB/YqgnohmoCWvc1Rj2RYMEwd/8mrz8OFGUWZeo3B83zR7tGjXE1GcPfL+4pvPXsc+ylV9ubkIE11Q2x4mvvi/gV43+alyCGL6tzX42q4O0TFq+l1Bi0qjZNNof4crp2iPsM6aNJKQuxLbHyRXWPyJTni4XqJBToHlH4R0zYyERSOtcI7Pit1daMEWqc8GA+NsurlAMQYsp8Ijb4Vf4omxITxRIMKEPAr8d2Rc3m3C5Q1A==
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB2269;
	31:Rvoo/VYHNHn7x/s+M3lHWDXXAvlTOcPiLhLwc6uIBBbtkdvydWKo0oHahQodrkGlccS2wcTZb3CfzetBgzB17b7h6vQ0Xuc4vH8N56AEsqgdhCpz6GfIrPMDQGIGUZI39imNgEISWrKSGMOdUTgsfAWzc3UeWAmWPx3r8Jsb15QM/CzbBkBBmXy+yfjkfCetgZZdUjd4MsQdcl5YecRRH38yuEwx+onRu5PUU+GHNQdFXvn8pdVon8ud1fwumzzWyo7skAQuq3pJaxT4Sn8pJN91rnl2tCf8OCE97HTaMvU=
X-Microsoft-Antispam-PRVS: <SN2PR03MB2269298867332166AF549A0AFF3F0@SN2PR03MB2269.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(84791874153150);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095060)(601004)(2401047)(13024025)(5005006)(13023025)(13015025)(8121501046)(13017025)(13018025)(10201501046)(3002001)(6055026)(6096035)(20161123561025)(20161123565025)(20161123563025)(20161123556025)(20161123559025);
	SRVR:SN2PR03MB2269; BCL:0; PCL:0; RULEID:(400006);
	SRVR:SN2PR03MB2269; 
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB2269;
	4:Wu/qZxxq70Nq14fmN9LEDn+DkYTkwFYrUb7youZk5e+X+oMGMeDnNI7E+o80V8JO2lZs3nhSuyC9H7j5janDyCgOSzyb75zeSoynI1j5qEz1t41PpD5BKsu/gHXgwUuNXuonFpX/lXgKWBfnOv89sP3eKuSvevoXea06KwP1IX89t/e5tkuDac053slV/PASOKYSKVY1Ut0ga8nWb2RTi5YA7vfrTPrslHdK9d8Eww+N+niWvx5XQk9o+aXTI0U01q36psetGz66We1YtiFUB9Ri06xCQVSQMqTEPeWigz+4HGXrJ3KlwBPdmFHWuV/UdUE9WVRPZTGx+0XOiESRAiPi8iSP5KY08FLyDR9odY2pHvnvPwkA6tkR6i/jgQzGOYGU6RjGehfoNoQKmFvHqHuyQXmWcsCU8N4xzAojtddiAw8Bbfxu7hkVV8JdHE61ZdOzMadCB++8581kilHPNbUtGf9+wm7E2P/jYtwM2z0VyF6Fpk7sYGtGOUmyG2GxJwgYvs6Yb2RMaZHdGfig/CkQUZURw3FDJ+B8hpHJNUZQ6obADf/nfOMj9FC6XAa4HcRU+tr/dgdZy7iVt6cQV1WGO+LfLWmNI4sbwwVvq96j+cElcs3cuF0Zva61qyywsD+YWNRePPAizVKeZFJ5Jfv09172pld+4KCWHe/zhrPCko/msj5QqUesqT9neJDoGHK0LaZpvGVRCdMvfCcG5dGpXFyV/MsHrV6Ym8JdNnhGhxEv2KaSSXubLSCocLc7
X-Forefront-PRVS: 0255DF69B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN2PR03MB2269;
	23:4qW8BhZsc/vwJpOHbCHNtFyF8PTzGTfx1lvF5cWUH?=
	=?us-ascii?Q?MneFHysBOnshXydlDSLZ1o806nMj1Bf8TQcJkkgAJXRn20UP7hjywYZhmKAT?=
	=?us-ascii?Q?PxZOqxcD74E4NCE8qqrMoyWIX5XXjYG3Vwxb9oBgvdCFR3C4J+qvgSuSwNbp?=
	=?us-ascii?Q?6E/pgph1JEQ4UccO/TjLHjuYTs4v9s9ccs/ye4GNjRlrNnLp2c6Dvo1CWlfV?=
	=?us-ascii?Q?THdWMh1iRAumpYlgxD/nRhO3zv8awCU+tS+1nK2FhMC6TUNWt18P90wQsX/S?=
	=?us-ascii?Q?beYdrprjCAzoW0kV6rYuY0sZbPXdx43E94ATjXYEe2D+9G8KwYt3vLXqDVU5?=
	=?us-ascii?Q?nK59/9EBHH0fzabkK4WIU+p1nHGklu3Om5EbX37xrOn9j+wvPTH74/iAN6PV?=
	=?us-ascii?Q?RxnEd0f6q1UtnW6gUiozZORmsn3PwgFIRVxg6OP5fjeSA5NzW+LkFdBdUaWy?=
	=?us-ascii?Q?ITb/DyTTUVrjaWNBAURYIzjnZ4RExvKXr40z10PjhDpCLFhvdCar5d5mTQAu?=
	=?us-ascii?Q?J47MJocNWBaAKstYTCCRLSfcX3HblRF+NArextJ2x/vnnU1dusFk9cFtK+uW?=
	=?us-ascii?Q?CqOye14l7/INn6e5uTVlawzQtx3YOQypmSzCkRVrQ1v5vIR5BjtORCV8t4w7?=
	=?us-ascii?Q?jCNkENTcNMlSegotHHQJ/PIs0ESI0dnItwnStLRWROIGvpXubfZxOfu5FlSJ?=
	=?us-ascii?Q?NBmiJJ66QP/GvTkaIaG8gaLptvqusJaLojQQ+0li9ShMQCj2jcNjrL5u4skb?=
	=?us-ascii?Q?UcBDPteQ4jUlxCHj4qTGLtynamG1mt1Q3t48fMy+GNh2u3+LE+NlO4MRnT5N?=
	=?us-ascii?Q?t5GJ4CeqsAegppfd1gZ/hnOpIQXOdR7qDTxTRD+po2i7ztr7vkigUFiQse40?=
	=?us-ascii?Q?MABCqPfTBotifmYVTlwMet7DwPtqOedRUScVD0WkMYUiouaB63aYEw/T8asj?=
	=?us-ascii?Q?tE1R9AdtsqfnnW4MRSVADA12YTRzTKaDC7Tda6QGTuwfGqclijsMbJYVw8Lj?=
	=?us-ascii?Q?2Z3aCjeR6TiyoN3qn/0erabK9rP7/NxZKSvoVxHDOtlpnt3Bc6CBmRAbct1E?=
	=?us-ascii?Q?N5KMFrhb8t7np59KITy4d2w8xoHIefvLqEb2I/h1GNI7noLDogalfiKauV0Q?=
	=?us-ascii?Q?iaDYUqet6HZMjfaeZiYP8yjRfKX2ZxrOZvywNhuxdxD+6HMH5yNloBPNUmsC?=
	=?us-ascii?Q?FCIYQcY8Q73/KI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB2269;
	6:ZLKyhRRBMdMNil7SXsy75HByj0DX6otDKvVqrsx62aosieeWs1eWEeJkXvQaKvz+w2glvago4aUBMuLPch0QKxE2DEMwmqVjmu+7gRhyJOu0pbrKQqGVU98eKdhai7I09Zr+86t7bp74iLckCEVzUjpjFpX3x1bHXV9hjtxjzdF+7+wzfEio/28SlRSYo7xBEXiZe5Ejvzy1RzyPqkYrZs0vo68H2nmyVdpa2JQ9MJ1DuE5KfyoruvuJKG6iw/+9vUuB1qm3/BdsIuR6iJDB4jHZysXx9k+B0tkY8GOoZpwJ+hroQHaF/hgO4A9InnoTSjKVQA/J80vI3wd0xZZmy0+/pj7qEVx4Q5pZRYl7zw2QpCg9PWICw9cPUhqrdiFxBR6qlj+tl87rcumr1k4FthdC4ry2I7DX8+2NBmNlazM=;
	5:wSLC6sBVkk9CCzAgxDMPod3e+gYevjhWcivRqIYlXyf0/lUwzz0DZt/nFCn28AW4va59IVyWETWt3DjnWcwsiBgwzhjn990nLW45uwNmDjplZ/jUNnmDb1hGvxa8dtWqbov2GpSlUfXA+0yfOIB5oLmwjMVY4QAZR4UdBa+3HS9DeGTL5eq5f9S2rn3KFSos;
	24:GtCHNf8W+UHhMqop9k+2feNvBF+Af0LgJUcKlUuqbY/3ks39JolVNlTpgIRgUNE13/fysJPVV787FxFhslaS5PIghMxSmuww/8odwwpuyXw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB2269;
	7:DGB8tpUXtnz8lZuPL3YLFnbbdrQvrI21emr7RaJ8ie7xMIecHx/U5gJiJB0Bev6IEU0UOW9ccA8nRiO12hh7Lwcamp+ZfEF16OSpNlFQPB/cD/rjB8t5W4jS5pzjrNOp/fAv2Xn/Fvr2nnwFzj/6t2Qd0xhIsgUq1jYZ6yP+OlD2dhccY2cmM7SWpKylUoC4HZv9MG0njxB0EqnmsD+NtcqUcwBjuRp23bUVg32RkA1BiIOCnJQgx6R8YvezkCJMmtu/re4fzaYistE8dtjXayeoLXbpE3UWWEDgtVkk5ZXF3ID8ygVHyhrJrOnuNOWyX5OKso+PG8bt8jZMOQlR7Q==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2017 13:37:17.7517 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2269
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.59
Subject: [Qemu-devel] [PATCH RFC 0/2] Add global device ID in virt machine
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
Cc: Diana Craciun <diana.craciun@nxp.com>, eric.auger@redhat.com,
	mike.caraman@nxp.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GdBE6y2+IJMV

The NXP DPAA2 is a hardware architecture designed for high-speeed network
packet processing. The DPPA2 hardware components are managed by a hardware
component called the Management Complex (or MC) which provides an
object-base abstraction for software drivers to use the DPAA2 hardware.
For more details you can see: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fsl-mc/README.txt?h=v4.10

The interrupts generated by the DPPA2 hardware components are MSIs. We will add
support for direct assigning these DPPA2 components/objects to a virtual 
machine. However, this will add the need to expand the MSI usage in QEMU.

Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
GIC ITS is using a device ID for interrupt translation. Currently, for
PCI, the requester ID is used as device ID. This will not work when
we add another entity that needs also a device ID which is supposed to
be unique across the system.

My proposal is to add a static allocation in the virt machine. I considered
that this allocation is specific to each machine/platform. Currently only
virt machine has it, but other implementations may use the same mechanism
as well.
So, I used a static allocation with this formula:

DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000 * Constant

This formula was taken from SBSA spec (Appendix I: DeviceID generation and
ITS groups). In case of QEMU the constant will be different for each entity.
In this way a unique DeviceID will be generated and the device ID will be
derived from a requesterID (in case of PCI) or other means in case of other
entities.

In order to have a clear picture of what I wanted to say, I have
implemented an RFC. There is a potential problem with this RFC,
the PCI tree is traversed each time a message is sent which can affect
performance. However if the general idea is good, solutions can be found
such as caching the device ID in the device itself.

Diana Craciun (2):
  Increased the size of requester_id field from MemTxAttrs
  Add a unique ID in the virt machine to be used as device ID

 hw/arm/virt.c                          | 26 ++++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |  2 +-
 hw/intc/arm_gicv3_its_kvm.c            |  2 +-
 hw/pci-host/gpex.c                     |  6 ++++++
 hw/pci/msi.c                           |  2 +-
 hw/pci/pci.c                           | 19 +++++++++++++++++++
 include/exec/memattrs.h                |  4 ++--
 include/hw/arm/virt.h                  |  1 +
 include/hw/intc/arm_gicv3_its_common.h |  2 +-
 include/hw/pci-host/gpex.h             |  2 ++
 include/hw/pci/pci.h                   |  2 ++
 kvm-all.c                              |  4 ++--
 12 files changed, 64 insertions(+), 8 deletions(-)

-- 
2.5.5

