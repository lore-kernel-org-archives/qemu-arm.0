Received: by 10.25.208.211 with SMTP id h202csp1202445lfg;
        Mon, 4 Apr 2016 08:35:45 -0700 (PDT)
X-Received: by 10.140.230.18 with SMTP id a18mr7785265qhc.3.1459784145263;
        Mon, 04 Apr 2016 08:35:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si22617501qka.102.2016.04.04.08.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 08:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an6XY-00079U-PC
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 11:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1an6Ct-0002fY-EZ
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 11:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1an6Cp-000533-B5
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 11:14:23 -0400
Received: from mail-bl2on0099.outbound.protection.outlook.com
	([65.55.169.99]:24848
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>)
	id 1an6Cp-00052V-1U; Mon, 04 Apr 2016 11:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-caviumnetworks-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZcQFmIGhz/76MgNdxogjCAVSP9sJOdoTAmq6xalaoSY=;
	b=a3i+mdxRktrayVxhYxKUYD9nHbiiekS8Zy+tZjgP5uSZvB/RuNPTI86KGDK4b1xhnquHYmPNfjPM/DmHltse69DBiHTXHtinl6WMHlyG7GOYibFrbcvGcLcpgFLWz0Z8MDg7RLAFm+U/QiOV0dKDKgJruLSl2AL1r37SgUtk5qc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none
	header.from=caviumnetworks.com;
Received: from localhost.localdomain (106.51.142.172) by
	BLUPR0701MB1683.namprd07.prod.outlook.com (10.163.84.29) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 4 Apr 2016 13:40:57 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 19:09:55 +0530
Message-ID: <1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [106.51.142.172]
X-ClientProxiedBy: BM1PR01CA0025.INDPRD01.PROD.OUTLOOK.COM (10.163.198.160) To
	BLUPR0701MB1683.namprd07.prod.outlook.com (10.163.84.29)
X-MS-Office365-Filtering-Correlation-Id: 9bcfb453-5068-41f8-ea7f-08d35c8ec238
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	2:8H4u2HNaMaFz7suGS7wwA+fhAhazSPHGusTvq2PF4x8nkk8TEnSCEuV5zRI/6ZrpDpD0vr6UuPH+vWkKRcAJbDzAU7vqRWg3NzjMf92bmBnQVCZ9QHdntaQTnVBDtqxffCU7K4VeslGWrtZtcbKFLgy0rwVtxwaGnFcj9zZCiRPeYhQllG/KmK4sAJnHTVj4;
	3:klJgmadUInq4CTh/p/BbDC4TywQpp8Bq1CdrLdf5iDeSV4l0fcCHW3lGirr9ZN1v3Oob/x+Nz8DBbRgnC9UtruK8GPr9/0LAq+PtcwIdgDMD9uZznTqglzqsYDGrw34I;
	25:WGeyf+c0nhvoWvIMN6LwGdIRiSk835TcpwKDB8BHDxGXyFt95japUk+RNraHvLM0zr/MP2r+vl8D7ciWkkWwBGbDdlWvaa3+4sP7aUYS/tSMg8PHEXVCM/eaZtyXz7ZRxFxcmnUYV6P12xbyMaaNUCEb/ISSewEqA4dGpm03GNZm/T7nwsXv1jfZo059Y/Y3gcQTr6QCEzsa5v8/qsLjUBDpd28ag/ta/PNxiA5k5ohIc4fw4hMN1joCe77anufed9XUbmwKeEigWN2cSqKbooNfkhW4xVnZTFMdjEgaI0wosBQQ5/M/BZSOM9W/UmbUbEhhCmZetdmJ9V3UEIY4EeH0I2+OyZUcuqqr06fIQ9s=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0701MB1683;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	20:StKDZHW0gLIPAlJKhuQ8rAx8G5cL7pP5oyHRsDpun2pgOtwJowZnpddygNQoqz/lqmnUvUJVwTuqeQHSYiUSuMBBnAcWzVMDrXW6wbCRLgKSD3TEaowJMxM1ni3G+wYpKWdR21XZvyp0iqW/kjN5q1i2B8DPEay+GJO+hr78bOSGyW2uBUc5iwCaR2G7UmWmg0oJO3DCGxuwXH41NtClyaR+nPpE4cePCAqJsYmxZxAhPlcN6SMQcT7K/M4rOS9Tzo2oG6wIzSx1+Qbf1VrosXMD1FkopUkH2dJ9cKpqWlHaw900GuljxEMqIXMW5CnTEeXcmYxMjRCDFuDV0gxYHfWoRxu0Ym2zminTVsDJOsUyKnsZzfuZAtCL5Zak5IS2fFw77kAJ9c0SQhgo1WDQN6BMKm6CyVbf1wtMhtTaQ6oRMw7O72DWIrctp1g08OY1fa7nz0X7WdNWO3eUkdcsCfX079jfAOodvnymOGkh3D/n+S1gGCXMUPFVLHOMkV8bM8XlvTLnny4XamLcD2a77vUcWMUT1TEafi3Y8gUDFqs+tfDFHKKPbRBY6dai0F5Mxm1J+HCcW2O/82gY/4AZrsxaDvjLy6IqAxTJuT5qTT0=
X-Microsoft-Antispam-PRVS: <BLUPR0701MB16839B5F9E88168F9C13C727FF9D0@BLUPR0701MB1683.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0701MB1683; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0701MB1683; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	4:5daljZeBhQB+VeysicTnRc1hwMu2NdBjXF6fKo5RUrZ+yFlsaVv0CJ76ESiU5u8tucLf0yhuyduyGhLHBKZvWLlOIsAVAlld0WEMi7T3ZmyITNYS0TCfp5q/+XnUrJyEzMzTOI45f5x6uOabfPYzA97gdOQ9lBYGqmO+WxFFmUIGuUPDrIKoPSmUQ4tIaKgvl7q5QG10GCYEHK3CQjxJBeNVJekj3KhTFvmgY/naedghg9bOn5QkHq40nWi94fhIP4bWEHFwnO/N9LpjVzZ2kOlJJ1ATOq3tEXk+xweqdlj1uP4CiRxllxiRQywstnIwCZXQksDfWISGSctqQNbgRSCqxWWY/QA+a8rgFTs33Ttadp90m7/cHzgGlsDvHMmw
X-Forefront-PRVS: 0902222726
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6069001)(47776003)(36756003)(1096002)(5001770100001)(6116002)(3846002)(229853001)(50466002)(50986999)(76176999)(2950100001)(586003)(19580405001)(2906002)(4326007)(5008740100001)(19580395003)(5004730100002)(81166005)(2876002)(4001430100002)(86152002)(5009440100003)(42186005)(66066001)(5003940100001)(92566002)(50226001)(77096005)(48376002)(107886002)(33646002)(189998001)(20860200002)(32040200001)(217873001)(4720700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0701MB1683;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0701MB1683;
	23:XiLH/YyCdRPej9Sg5up5qnnf3jKbQY07Vqoc+ke?=
	=?us-ascii?Q?IhlHhl44HzszvC9y837kXxGqFBwNazi/5nw2LXvYW//ilUn84VUE6ifCrfMS?=
	=?us-ascii?Q?Wonx9HBHMbGzlHHokJEzAGlmxnwwuKv4I3DfIr1vaquzIZ8u61oNsyenAP/E?=
	=?us-ascii?Q?2Y+MEgMV3HDR7U1ce1jwM2XikUXa/JaaaS9fxaf16+R9ygt848gIIlYO78W5?=
	=?us-ascii?Q?AysAGC6QPStaWF+Q4/TdpAhM4NZKHRGOjWuVKL0R6VZMx29Q3w6o4BtendbF?=
	=?us-ascii?Q?41fulpof8/i603ZntJ+ZU01WZJZ8DPUkZF+BDBXXZY7VTHO0nVmIA1rDzl3V?=
	=?us-ascii?Q?qVg2GX6hloLyrswj3UJWXHGwFCSFrekPA424I1118XZzTIqImBRpRpR+OHoA?=
	=?us-ascii?Q?ZAJ+vC8qgRn3+23aqayrazMsvN91Ug6nXMkAE72WJ0eXYMsK1eB2I48+espG?=
	=?us-ascii?Q?deTEhmP5cs49TF/VtOSiqOtPO5EGHJeEbPluy8EsAAF0nbVxkvao3m8Ve/MD?=
	=?us-ascii?Q?vOiV1kBrNdmYXKAmgbBGfei58z4xjnfDQEy2tLnkyYdD/CBtwS/924vVFz7A?=
	=?us-ascii?Q?rnFGR20Icwuat7/oPby9urnuW6c2FEhcGCz8JHUQrHM7/0NtPzYJiO2LU5R8?=
	=?us-ascii?Q?k6m6gTAPM9OIVU2sjDqGQeVPFvYvQDrMOSWsSt2YBGygbTpL6Ft9pvlRjoFr?=
	=?us-ascii?Q?aDN1d3OfcZ9kkEcvSaS/YIkT8lkkR+QUUyH25nM5HbFbMv/Ft0U/dlUxB+85?=
	=?us-ascii?Q?FNAYNAm70IAV79+ysBxf678nYYu9d3692N0naXfN/w1quCF89XAClDnrHpdr?=
	=?us-ascii?Q?zYBqSvh2zO5RibNDJO3EctpsRE21sbx81OJNc/rhz/uNKk09dU6W/SfNcmaX?=
	=?us-ascii?Q?/7jL2e7PlbgYRizqO0Q1lDJVU3yV+iDwB1lkwcTb7PxlEjEts4ug2E03Kxd+?=
	=?us-ascii?Q?nS1/Zj7BZ2DrBqeBaJ3Vv3esUKBMsjdku9Y2CcPWeyCTWfSTHiEVhDNbAQQV?=
	=?us-ascii?Q?49U3OtUuQ6d0+Nf252Cc9lQK6GaQSqsod1apOW/DU7OfgziLL5an5S02UW6I?=
	=?us-ascii?Q?+VSbTnwwbthaQdELnv22paE5tGc6IZFzSFt8lArgeULyXjC9rkg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	5:iBSt/mFCzZ10DhMI8zNtpzwkErIZOuiKRvvKz3X0PUt8Q+wO66hECU/epKz+6+NQRiJekNNVyiTLRqm+qX/d71S6uzBE25Hytwwc4utVSSF/hxUG7usL0OsCzKshOZSgL4f3Pe1ae+uCG1JIy5w9hg==;
	24:hngzZ5yZa576mWDEQqGLgZVPhPeu0Qjeowv44irgLinDjQd8H3ID9h/akpwhmI5W/zHHfO8WyIDnL0n14gr1Z8VSQLlWpKWSHdPkGDqyUnM=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2016 13:40:57.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0701MB1683
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.99
X-Mailman-Approved-At: Mon, 04 Apr 2016 11:35:41 -0400
Cc: Prasun.Kapoor@caviumnetworks.com, Vijay <vijayak@cavium.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Subject: [Qemu-arm] [RFC PATCH v1 2/2] target-arm: Use Neon for zero checking
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
X-TUID: EE6Cg7S1M+o2

From: Vijay <vijayak@cavium.com>

Use Neon instructions to perform zero checking of
buffer. This is helps in reducing downtime during
live migration.

Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
---
 util/cutils.c |   81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 43d1afb..d343b9a 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -352,6 +352,87 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
     return func;
 }
 #pragma GCC pop_options
+
+#elif defined __aarch64__
+#include "arm_neon.h"
+
+#define NEON_VECTYPE               uint64x2_t
+#define NEON_LOAD_N_ORR(v1, v2)    vorrq_u64(vld1q_u64(&v1), vld1q_u64(&v2))
+#define NEON_ORR(v1, v2)           vorrq_u64(v1, v2)
+#define NEON_EQ_ZERO(v1) \
+        ((vgetq_lane_u64(vceqzq_u64(v1), 0) == 0) || \
+         (vgetq_lane_u64(vceqzq_u64(v1), 1)) == 0)
+
+#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16
+
+/*
+ * Zero page/buffer checking using SIMD(Neon)
+ */
+
+static bool
+can_use_buffer_find_nonzero_offset_neon(const void *buf, size_t len)
+{
+    return (len % (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON
+                   * sizeof(NEON_VECTYPE)) == 0
+            && ((uintptr_t) buf) % sizeof(NEON_VECTYPE) == 0);
+}
+
+static size_t buffer_find_nonzero_offset_neon(const void *buf, size_t len)
+{
+    size_t i;
+    NEON_VECTYPE d0, d1, d2, d3, d4, d5, d6;
+    NEON_VECTYPE d7, d8, d9, d10, d11, d12, d13, d14;
+    uint64_t const *data = buf;
+
+    assert(can_use_buffer_find_nonzero_offset_neon(buf, len));
+    len /= sizeof(unsigned long);
+
+    for (i = 0; i < len; i += 32) {
+        d0 = NEON_LOAD_N_ORR(data[i], data[i + 2]);
+        d1 = NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
+        d2 = NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
+        d3 = NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
+        d4 = NEON_ORR(d0, d1);
+        d5 = NEON_ORR(d2, d3);
+        d6 = NEON_ORR(d4, d5);
+
+        d7 = NEON_LOAD_N_ORR(data[i + 16], data[i + 18]);
+        d8 = NEON_LOAD_N_ORR(data[i + 20], data[i + 22]);
+        d9 = NEON_LOAD_N_ORR(data[i + 24], data[i + 26]);
+        d10 = NEON_LOAD_N_ORR(data[i + 28], data[i + 30]);
+        d11 = NEON_ORR(d7, d8);
+        d12 = NEON_ORR(d9, d10);
+        d13 = NEON_ORR(d11, d12);
+
+        d14 = NEON_ORR(d6, d13);
+        if (NEON_EQ_ZERO(d14)) {
+            break;
+        }
+    }
+
+    return i * sizeof(unsigned long);
+}
+
+static inline bool neon_support(void)
+{
+    /*
+     * Check if neon feature is supported.
+     * By default neon is supported for aarch64.
+     */
+    return true;
+}
+
+bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
+{
+    return neon_support() ? can_use_buffer_find_nonzero_offset_neon(buf, len) :
+           can_use_buffer_find_nonzero_offset_inner(buf, len);
+}
+
+size_t buffer_find_nonzero_offset(const void *buf, size_t len)
+{
+    return neon_support() ? buffer_find_nonzero_offset_neon(buf, len) :
+           buffer_find_nonzero_offset_inner(buf, len);
+}
 #else
 bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
 {
-- 
1.7.9.5

