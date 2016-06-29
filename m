Received: by 10.25.21.96 with SMTP id l93csp2177721lfi;
        Wed, 29 Jun 2016 06:41:39 -0700 (PDT)
X-Received: by 10.233.232.12 with SMTP id a12mr8754093qkg.25.1467207699799;
        Wed, 29 Jun 2016 06:41:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si3042301qkd.128.2016.06.29.06.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jun 2016 06:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIFkJ-0000lC-8L
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 09:41:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bIBA4-0006Xz-1D
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 04:47:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bIB9z-0007z3-2U
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 04:47:55 -0400
Received: from mail-bn1on0088.outbound.protection.outlook.com
	([157.56.110.88]:7548
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bIB9y-0007ym-QN; Wed, 29 Jun 2016 04:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=x4sxGhKVDdW34D7wqxposBhdcaXQOhRJFYYTQZDVQwg=;
	b=DSs5Wd2f7Bc12/ji4YkDCynGI84lG0SS0Ms8PxTnhQjHq0tZQWEPIzhjqEM6qHR2z3FZUxVzEUGV7LMOGqdvH1wfeZoo7eifSi1IBluNfOWQHFTB8uzPmXOQu2UedeWuzE/D5nvkt0zqtfGFm+EC35efiKw3qP7KRJKdSoUH2IY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	CY1PR0701MB1694.namprd07.prod.outlook.com (10.163.20.28) with Microsoft
	SMTP Server (TLS) id 15.1.528.16; Wed, 29 Jun 2016 08:47:43 +0000
From: <vijayak@cavium.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>
Date: Wed, 29 Jun 2016 14:17:09 +0530
Message-ID: <1467190029-694-2-git-send-email-vijayak@cavium.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1467190029-694-1-git-send-email-vijayak@cavium.com>
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: PN1PR01CA0037.INDPRD01.PROD.OUTLOOK.COM (10.164.136.137) To
	CY1PR0701MB1694.namprd07.prod.outlook.com (10.163.20.28)
X-MS-Office365-Filtering-Correlation-Id: 300a0507-517f-462d-4823-08d39ffa0ac4
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	2:U/gEWqQJpAmo94CuobQXrGu+7Ajt9cGIegHrB6jzvIj9I6AyjO1inIlAoPtOlnfFpYuGC1F3l2MItfWeFSt1pQW8QEfVssalObeM90UgLsg8j5l+CD52lE7CI/PlKAZmKIi7WqWzgDufVvrg2tlN1h5I+PWA+gUSg6Y73P09yx/gDx6O3pm6SHg2ZTGiBRZ8;
	3:8KmHVHK4Bruw+gc9ZSVYqLy9tI+la4uhA5CgKRoWWWoQahCvhko2gWIqOKQ3OlC6yMHoKE4N/w+r8r8i7kTR7zuPoJe/gghhXykSqbHUar5h3bayGCGjrwa/LSgmogNZ;
	25:DtnspuSVu/UGNt4pza0Rf0E/2/GSkMu0P058XtDOT9suTuuIWNoBBl5Bn5Z5cQV4mdH+FEE62xDBEvces3kYdHv4PrXR2S0O1fVa2bE6AY/h1yV8vHGu04/APWC+CRylFUuGXojddNs72FgmMfG5v95Sl1zozZhTVVdjiMfomqcLa5g2QIh1IXNDw9vU9XzPmNdmPD2jpUqcFATjIK2t23DCrDC+GZiORu5mo0lsL8pezqr4FmbgTtojJsXkH456HoqQaQPusQ34bRTB7B9o07aTnwidcqCdPM7yiTswmGHAauM4dDC3TMCNLFKKqZZWdoKR17QiZSMcC3VT6qFxor5LU5EpidISLJqhmbxCq+y0O7drMRV7tKfISn5rjMJ0DQar5ZvwgXISruOEpGvEKDm6N/Xpdaue+t6J1J773sM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0701MB1694;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	31:1cfeFfDMOhzK3jELz4TyRJsYBR1zhgrAkC7wpT9JjKidVZiDgHlsXVVDRxMPeeNUV8goHdqwx9dNGz/D02zPmuL+V6WcV4g651BeZG2ErD2izPduI3xXY1cyOKxUbkqPKTS2g1yEurCd8SZBYEgsk82Ehh/v2e447s/utO2mTJ2rFR9maCgo+CwZXHPlfQfuaCMa6Y50Xd6Sn+ZvQZiLgg==;
	20:8+gxBsez3+D/qwWnJ+MU43oVDRbaLhEaMXxupVsODyEIDCBqAhGGQZe64BibO2Pb0cKAoWzxOSzDSU7hr/GVP+F8qxu/1McCzviY8WYKxxd9GeGhF0zhQYoDG0KwZeJZMqtMVN3pibR9ahD7myhza7CMHeEvs/gYlwTNw1EX5UxrRQ0e86pMDbCOwDvyrQBiEArz5uFxBqcMi+18rNraoYXylLCJD6klekcgjZ7w+fcxjTGupahtE5aZGI5Cwl2yxEote308i26vxq8lBhCWQZ10rxTJnHwScmHFwf5KFETANhXd4AL9d2CrN4tz/RgiPWdAZsUZK93hOyP8USZj7YthpBgFh1nUNXJ2CTEByB69TLjWcZssNfdCKxLo9Ew3rcFQKcImEcEie2QFwPdpDwSTT+p5jZQuUHCpm6+UWEnwnjQUaI2RFdYbrcsrtK9To9jScqF2pyoLg/2lzOutJ6CTNdg46x9oGWdI+IXanjKLXkLJyoSmlrM1ZJ3gOv1u
X-Microsoft-Antispam-PRVS: <CY1PR0701MB1694C121ED284D0623DBA169F2230@CY1PR0701MB1694.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:CY1PR0701MB1694; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0701MB1694; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	4:dco8ItJtjyMPaoA2kK1ug6vG9ZBQ+3V47+apSnGM7pTUehO4WUlW3oLtxSw9vLPs4g76FmnmFDD31Q5ryP6epDK5vYvx8BcvYpl8TersIbREOon8hqe2Pffpf5/oGYjtHw11Y5NymscVpA/eHqXSVtXav9gqm2sp/lLXZUuJ3BVVPeLm3YaM4yu2K1IazP6Jr9jD4jvIwLF7BNmDDqOibj90Sf/S+K87JWwds3/4POYWk84s4f/POEUncQF016h/6OwIGxaUtSiqabjXU5z67sWuT+G05N5xaFPDfHlIX9VFTpur1HcSYCN/+6x1NZHfJwIyOz/m+yfuy1Ys90eE6gJwJduNBOjp7pU4LMolrPsPqYeBGvIxFdTOPOT6csHD
X-Forefront-PRVS: 09888BC01D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(199003)(189002)(33646002)(76176999)(50986999)(6116002)(3846002)(107886002)(586003)(50226002)(5009440100003)(2201001)(86152002)(4001430100002)(92566002)(50466002)(7736002)(47776003)(189998001)(42186005)(7846002)(19580395003)(68736007)(5001770100001)(97736004)(69596002)(2876002)(48376002)(53416004)(2906002)(5003940100001)(305945005)(4326007)(2950100001)(19580405001)(77096005)(81156014)(81166006)(8676002)(101416001)(105586002)(66066001)(229853001)(36756003)(106356001)(7099028)(4720700001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0701MB1694;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0701MB1694;
	23:wMnttf5TKSV1Z14iEXAddar14TITwcARYbld6Hg?=
	=?us-ascii?Q?2+24ePUzlePDMSLMC2RV7yt5Sj63CSKkM+Z6E3Ha6k1PAPIXJwfc9Q2ESatO?=
	=?us-ascii?Q?g7dfjvXMuiFXNPit1sMfQ+kgQhyI9XDHg17AcB8ibs6D8z6bCDT+go3snnib?=
	=?us-ascii?Q?o9YyQFLSJoKAupAPNvzqNwStUjMtYMT2TgRRKYVkIB44roiQMjNc6gxHYHrj?=
	=?us-ascii?Q?tymP5r/43P307yMqjjU0oFevD8joY8QXsLeEWwJFfNCM6ipJYlLDkBv8VM0U?=
	=?us-ascii?Q?TFk4jGspIGlfG2ZJqc6sfx+qjlNAToG8hAU0zmLZuqnZun82+6i/rEZLIdQr?=
	=?us-ascii?Q?kbWlBw5BOCYjkF1xiwMP0nHrILsaV4sTO9pMn2cybMVBg5UysonQ/3ExGfA+?=
	=?us-ascii?Q?K2F3oJUxBnL9W2y3OwF/t1AVyHb1/iOEZ7KFZuR5XPT4nCBKSDjvo43X4tE+?=
	=?us-ascii?Q?ce0XAr/8zcgj9101nFJfDL2/XWJZ7L9iUFVxoVt3p0VamS7xK1Ys13Xun78E?=
	=?us-ascii?Q?dxP3WbernTjFCk9CMzNerAAt6h3+TwbDPotGMalWsMPdh9hEfUI9nwt9sELk?=
	=?us-ascii?Q?PFFch7IQjpX4eJLactXMCPnLGfUWWRerVkOmYwsCZmOX308tme++EmL0lmFU?=
	=?us-ascii?Q?abYxvfQ7Jab85Lgr3vDVXcc4oK1CEofP+GtoVPIZ5hDtOq5S0+RMAnjSVEhr?=
	=?us-ascii?Q?winCgtu7sRxJerySMVT6LtQieIutwPntCQKjuyJa8HOBJGUUaUsnHq978+6o?=
	=?us-ascii?Q?ZQFk0o75uV7On8WdkztZrTax68aF9h7OkuwPZd1IYnM1oVjqfYYk9IS2nJxs?=
	=?us-ascii?Q?SRpFsBhi/AEuyyXk0UgKwIEoQ3Kao0JJSpwcYPne4rhzYuA6iZF+TMrWFPV8?=
	=?us-ascii?Q?XWvdsJboOngmMRBDDz5gM2akiu5bNGgnwb9RepQUamCajyDhBYfBgSLhCMx0?=
	=?us-ascii?Q?xn2X/g7I2H1Mxja82MOQ1P8alFoLfnMl9nqPFiGz1LymJ8dwE+IVRFNY7RZT?=
	=?us-ascii?Q?KGBqcnQXrOWe+69H91XwEsIl1MNGKr9zLTTlEtzcDso7AriMFYqS5mOqxxUP?=
	=?us-ascii?Q?Ws5b2XoZkizNbN3o//1tOz8SLizSEvQMcLp5hBLwzG3vyOrAjsDadN4ncLCq?=
	=?us-ascii?Q?NSzF8ukGtb2rURTR80h8hwcjSJ6D0nkRwy/ij1FSM1ZUKuJQtRbtiGpREZtg?=
	=?us-ascii?Q?wwOlN6WnGoxcZ0XudrIsBnsxWa7rDTBLyLrlFL921hznqoLIjhumFodj+bMK?=
	=?us-ascii?Q?qDMaBaPRnQNy6cuzAWwKH6bDdOLl3aBs1A3Q9bktHFVMsexvUCQ0WXpkAbTH?=
	=?us-ascii?Q?elA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	6:qZ9iMRPYGMfsMq+/fKB4VWOBPakeyZvDwz/vqJq5AuzGV9rWp3FJk940UkpiAk2iblVr/bQh94Ym4NICN1Xa/xJyJ/adUWrnRTAYYb2mXPXgcN6JBwOxEZoW3OWFGjEtUj59CJcSFbcHzCDuBSa/kOHgBPZUOWBd5R65p8NBozH1qUd8VrPQeTx32TTZ6BgJKz+GouTgctOse/NS7w99Tr8QzxoohG2Xf/GQsFeWdV4pJUcLl7yJN8WmFN3Ox5K0J0z/fsFtdch20LsqYz380WcO1EWfkNk2uFTjaz/iPEo=;
	5:mrgg8OVjt0X6Ro08gOBP2f9h+9Mud9u/eO3g9lqXPp9Ly3Hzpz0EGB7o1e0xJsvgSnC15lE8aiuy7KlaUOjgvDJN/MfA0ikbuvM526qEFlt066H6VaCQgBaxxuGTZAoOaNVapBe1vd6XFUCszljdNg==;
	24:ZAkBEVbU0N6lMT4eDFubrpAKoUkwXQRQrR5dT5N816rZBssrA64xCMc6aV7vqAZR6MkM6gD0nmwImnlSjbieFj6z2l+tZGLxU0XvsvVLucY=;
	7:BGBvfkoXiCM2yeBscHp1apkfPlwaCVizuChw9AnHWQHc2a6MuRvjiIEd0rfzvRJ9/rYJmiTnYDjTpT32Rwfv1cOimgJspxtAmQYlM6OP7veZM0P/NgttXhketfT3LIishkVSZ6Nbskp6US+6s57feQbrK4+/sAIMSXx7jqjNRordrRKBGgxZHVl2Xc5YnQY1lahpyDrZB/w7J01vhIEOpSZgjaiX/8sjjkWi5tMHvCleaXm2TKcB9h3SNheMcJXb
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2016 08:47:43.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0701MB1694
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.88
X-Mailman-Approved-At: Wed, 29 Jun 2016 09:41:32 -0400
Subject: [Qemu-arm] [PATCH v3 1/1] target-arm: Use Neon for zero checking
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
Cc: Prasun.Kapoor@cavium.com, Suresh <ksuresh@cavium.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com, Vijay <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1J9IzdavBjig

From: Vijay <vijayak@cavium.com>

Use Neon instructions to perform zero checking of
buffer. This is helps in reducing total migration time.

Use case: Idle VM live migration with 4 VCPUS and 8GB ram
running CentOS 7.

Without Neon, the Total migration time is 3.5 Sec

Migration status: completed
total time: 3560 milliseconds
downtime: 33 milliseconds
setup: 5 milliseconds
transferred ram: 297907 kbytes
throughput: 685.76 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2062760 pages
skipped: 0 pages
normal: 69808 pages
normal bytes: 279232 kbytes
dirty sync count: 3

With Neon, the total migration time is 2.9 Sec

Migration status: completed
total time: 2960 milliseconds
downtime: 65 milliseconds
setup: 4 milliseconds
transferred ram: 299869 kbytes
throughput: 830.19 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2064313 pages
skipped: 0 pages
normal: 70294 pages
normal bytes: 281176 kbytes
dirty sync count: 3

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
Signed-off-by: Suresh <ksuresh@cavium.com>
---
 util/cutils.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 5830a68..4779403 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -184,6 +184,13 @@ int qemu_fdatasync(int fd)
 #define SPLAT(p)       _mm_set1_epi8(*(p))
 #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) == 0xFFFF)
 #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
+#elif __aarch64__
+#include "arm_neon.h"
+#define VECTYPE        uint64x2_t
+#define ALL_EQ(v1, v2) \
+        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
+         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
+#define VEC_OR(v1, v2) ((v1) | (v2))
 #else
 #define VECTYPE        unsigned long
 #define SPLAT(p)       (*(p) * (~0UL / 255))
-- 
1.7.9.5

