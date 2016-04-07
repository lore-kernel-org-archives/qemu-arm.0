Received: by 10.25.208.211 with SMTP id h202csp402522lfg;
        Thu, 7 Apr 2016 02:59:22 -0700 (PDT)
X-Received: by 10.55.71.146 with SMTP id u140mr2297615qka.14.1460023162199;
        Thu, 07 Apr 2016 02:59:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si5299337qhw.25.2016.04.07.02.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 02:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao6if-00059C-3f
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 05:59:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1ao6ib-00056P-VN
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1ao6iY-0000pC-Pk
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:59:17 -0400
Received: from mail-by2on0066.outbound.protection.outlook.com
	([207.46.100.66]:17058
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>)
	id 1ao6iY-0000os-Dj; Thu, 07 Apr 2016 05:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-caviumnetworks-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hhXYsX7wnXC0JgzxAa5Ls5YzT1Xo2KInyVA/7/nOZnY=;
	b=PCWmHnIS1saBuxtMZRAr/YzCKr43FELQroiEEkOBZFZ/lj9KjiAi9+6EJnMpaTfSAs8gYbfr1JIU8AARZ1C/Ss9sYSQ3TZnNr9UiOZnffAAMEpAbPZfZGJjqTqO97/wBLkd0zFRf0M+M+TfoOvOB1+cDkyCmkt5+I8sZkG1CPgI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none
	header.from=caviumnetworks.com;
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BN3PR0701MB1686.namprd07.prod.outlook.com (10.163.39.152) with
	Microsoft SMTP
	Server (TLS) id 15.1.447.15; Thu, 7 Apr 2016 09:59:08 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>
Date: Thu, 7 Apr 2016 15:28:05 +0530
Message-ID: <1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0036.INDPRD01.PROD.OUTLOOK.COM (10.164.146.136) To
	BN3PR0701MB1686.namprd07.prod.outlook.com (10.163.39.152)
X-MS-Office365-Filtering-Correlation-Id: 9f46e79e-5427-4d2b-f77b-08d35ecb4530
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	2:ce9vrfjlNBww3PQBk6Vgob5+bWFsJ9HoAuIKkCuAl5aj9pYYFnP4/Rib5r+KgKRpHcXtrqk9J7dH4t/E7B+JR0m0omsj18bCcPyxh/Z0ry4ysJRbEKoXDA6uSvPYR4Hh0lMu2mcGXwfRjn0C6SvGenvXWO2018x5eXa4xvQFyQ/Bo8OOPHZjP+GTfGFXwm+h;
	3:CYchiFIrOn1PQ3o2N5VACfpCOdCm3uOfWj8ojHYNYvy+yex3Z3naKSetKQx0iDkPvXZIu/5/mo37yns3YT8izXvlxmKLtp4l0X+GjmsW8PUMMsukEnTmQX5e2w8aBJ52;
	25:s9HknNXX1Hk/FzvlIO5P54Yu42HDwYzht7AyzQu7I5leU6cr+IOgivfL1YiUhVOgUYQ07YQAEoYOqa+KASANpNnfIkhdDoC3VPx4CBUYgIGsOrY48PTDtxwFL23DCQR3Pd9OPKyuP9YU1LW5l8SX9MtFTtmPDqyDym7BUrDa+Sppjc+LHhFtxlelDvkynvc7nJ9F+jnAZwUXTOlQQzetk6W83M0UN6aUgdEesy5B5UGxYlfWVsH0ixSi7wL3riHmJbTicTduLJjWog/FNU9mjfviy+YICQgfkeHTZFhRQVAZhdMcSiI6ioO3A9LXQq0/JKM/poYFxPkWxlFcf+dLKdyZoPjIU6M5rfzg7II1UAJoELCcUeVnI8Ec7Tk9TY4W4+UEEpDg5bjNSd5OdVxvYDi1cz4AUKEFi8LGLwt1sWJKpsdEu8bdN3ANXCfMK4Jd1Zl2gKPSqXXUhiY9Lvyq7U5dZieNXhfVv+aH8jp8vK8fD1+v5JZaw3mJ+/rIgQgU6N/fgkVsz/KPKrFmm2dmGI2bKLcuMvT+2VETYNZyEWilb6tXoWDgo8WLOQ539Ai6/MJLQTpiWxaxRBcOgtDw21dmz8NUbGd8xk+CdBvRNrY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0701MB1686;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	20:tb9MdC4uf1RVhz7Vp8kCxjp/BZur/dduesyRrZ0EwDCETFCMNa7kpH4cJnQip8eIMJFAAWikV/JYcWSie8bY8c+38u7oaSBWEnnjM3ukaHeX83EBLWy3OEBjJe5M8mIxcoT8GARg2Dtq+i8z2jMGzRWR1na2NdgPJkcH+vveb0an5284PtFwfq0nm8xFxhRz6GgNH2LpROXjVqqqTo9/x6NysBZ5ac6cYMD48uVHEQECT1qMk5zqNG+pFOUbVhisFUQ5a9kMZtlwu1Z1wCtLR8KalzQC6ojtQSoB5O937oTpqqzc8HScd00i32e15t8bI6W22EZj67kDiehwqzPrs0qEtMA9yDPG26/x7c2B842vtvAVxiYEEsmcNYhEcC4FypcbmwcMm/A9GozjMifzCHuroRrykjZd3gN72HU4r5aIhNKB1OJghQ6vF9YkIz2ykVh1tA9Lr/bTwA2IDaXNJWux0MEZy56VnFLaY4mOzdJ+oqL05+IAqc7zQsv8Rsar8NKR5zmd9Icbp+LGSSPADxPFdBGnQzKVEZ+PQQhCSnhn5N+Z544qHf1BF3sgf+Iry8USz/EnurpPtdrdX8RZZr2ZyR21r1IuMnteZj30U9s=
X-Microsoft-Antispam-PRVS: <BN3PR0701MB1686603CCAA1E7A7C703DBB3FF900@BN3PR0701MB1686.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BN3PR0701MB1686; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0701MB1686; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	4:UaFVbQx/2jWxhcrgPP9DFMGBu3uEN/miylUIS6ya+AQMlsahsNQ+F0ZFWYU4QObjTpzKF20XSMVU0snBvDHhdQPCzVmdsybHvuOj1EyIxFtjGT22TMiQ0MTGptHgnyJBC5BmTGdS4Hkj3D5OJ9PAkl4CTsnLNHXCvu1eib6mfJOem+Z9niXvf4U9/49yKc1fdh9P8xKqLAt5mSVSSJ33asb2JpYDvoZkuOUDYALINDfgbQpMNoaeEgzpsosMaLuq4Qy1+IWZ12lwi6MM/qSLmOIS36F7UjXCXbZmeO5S5ew9nc16y3P39OvNjyxshGRcl3sQONVK//Sd1Kg6aHQ/sHB0erP4YiO3diKvPtEOiYpPwUIHxSCFsl23N+JyagFF
X-Forefront-PRVS: 0905A6B2C7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(4001430100002)(53416004)(5009440100003)(76176999)(5001770100001)(36756003)(2876002)(50986999)(1096002)(189998001)(3846002)(81166005)(5008740100001)(66066001)(6116002)(586003)(47776003)(42186005)(50226001)(48376002)(77096005)(5003940100001)(19580395003)(86152002)(2201001)(19580405001)(33646002)(2906002)(107886002)(50466002)(92566002)(229853001)(4326007)(2950100001)(7099028)(217873001)(4720700001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0701MB1686;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0701MB1686;
	23:+fj65qkBqQje4NKIsMI9T5+Un60lmdHLwvNmqQ1?=
	=?us-ascii?Q?d4pTvZSZKBW0DSdXbM0gVH7yERdjxLfhfMFtg+YBYelF5nX968iSgob1aKJ7?=
	=?us-ascii?Q?xpbyM02FnCGE98NBbPowgSVxaaQhq+ShQO8LC2dy8vndaqudE+RJQ8wx25mH?=
	=?us-ascii?Q?XUfGWHl0XCmLcxscVuVSlisSio0o/pVuaOPZzPbCkEz/Zy5L9kzaqq06WpyZ?=
	=?us-ascii?Q?jlZYk7oTF8ICy3G6IGP5IfguI19SPVmHHurdH1v4gtUe1LFMnJg38hHfdg8I?=
	=?us-ascii?Q?+8Ie/S3poR6jAmnrZ1W7dBkgoL41klInEMwQh63vR+H8LwXj49OskHIMHi7J?=
	=?us-ascii?Q?BJBiVeNaWftmzzGM7+YgYc3Ac4F0fF4WlYJPSSsmDSDeG9Usf90nU07JXqBi?=
	=?us-ascii?Q?xMPdwBYbqIB/at/DQvqZZyMGub9LDas3Fiiug63pMJ4Zgqk3XxN42A8a20ZR?=
	=?us-ascii?Q?wgkDfi6Eak1KKJaCQNS0s/o0IFLLPfdN89LLgI8KuZyKmq3Su2Tty+pg5q90?=
	=?us-ascii?Q?IcjVaJf0iHd/wK/Ox0XWMz5uKyfaoJUlhU/zTIjeVF8xAkDpvfT6cQsO+vQD?=
	=?us-ascii?Q?vLPYMxOVpsXx6PIC3ZHf7SMyKpuZyaeVZm8nGgemq6zEUNq9sHM8WP7JPE4R?=
	=?us-ascii?Q?y1El/6icQ4JStDuVj9Oj/8ID344cz1AEqqxgOkCR8MUpeqffGgCbLd0RDJP3?=
	=?us-ascii?Q?EwCwjWbl0DtvsDifvC45wr9SB3KlXuOSmTAq3fHoTNLpjawvCd/DgLF0GzTM?=
	=?us-ascii?Q?oD5/qie01d6kTKAqWp/iyaxR8VX6iAC2ua2dI3SBA0FtPJS3I2gYyCduChOL?=
	=?us-ascii?Q?2zSbR8P69Z+l4qdhbKyumD62zVQgVUm8353MmZerWVfR/TIgYJtveslmmUdK?=
	=?us-ascii?Q?M6lFXffanfVYOsxiGNEi82CMENiRj3nZiEwqVAr3l5MTnrTSGEIrilEPFM/E?=
	=?us-ascii?Q?dPPxD3T7RH+nm4vUAg1q8tRRQoG/f5HhpCXVHJ8WXm9liWPwbEwIf2HlFiJ3?=
	=?us-ascii?Q?Ce43DT75iPCeR24ki0+o5FiWSH078UzKXPN9Pebjidyl6y/GaZoCm4N4Jmya?=
	=?us-ascii?Q?q/GzhXuiLgRg9EfC6yPAm1LWx2oKk?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	5:FwrxvLPMemsLGSh3H2O7TnlvvHOwFxvfAE7kF1IkY9qooHIKreKZIQC07uttDr59cXz7L0mQDuGUHNNSjdC33lwVvD5kFq3vopCU1f0q0fLEK6aBExw17JZHHCjGk9nuvvwy3vnzkWQf8v7Pdz6FDQ==;
	24:RiW0b1HAE9HPZ95fnQMudJIyK8GNU74OctBq/Ab2lG3LFlqGrsxhatRHOFxjzAQ0OOri/LJ+DPEfi5qfaqQU400Aoywbv9bnCwQu1schpuw=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2016 09:59:08.6736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0701MB1686
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.66
Cc: vijay.kilari@gmail.com, Prasun.Kapoor@caviumnetworks.com,
	knv.suresh2009@gmail.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Suresh <ksuresh@caviumnetworks.com>, Vijay <vijayak@cavium.com>
Subject: [Qemu-arm] [RFC PATCH v2 1/3] target-arm: Use Neon for zero checking
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
X-TUID: L/ZBQ836BLJO

From: Vijay <vijayak@cavium.com>

Use Neon instructions to perform zero checking of
buffer. This is helps in reducing downtime during
live migration.

Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
Signed-off-by: Suresh <ksuresh@caviumnetworks.com>
---
 util/cutils.c |   74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 43d1afb..bb61c91 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -352,6 +352,80 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
     return func;
 }
 #pragma GCC pop_options
+
+#elif defined __aarch64__
+#include "arm_neon.h"
+
+#define NEON_VECTYPE               uint64x2_t
+#define NEON_LOAD_N_ORR(v1, v2)    (vld1q_u64(&v1) | vld1q_u64(&v2))
+#define NEON_ORR(v1, v2)           ((v1) | (v2))
+#define NEON_NOT_EQ_ZERO(v1) \
+        ((vgetq_lane_u64(v1, 0) != 0) || (vgetq_lane_u64(v1, 1) != 0))
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
+    NEON_VECTYPE qword0, qword1, qword2, qword3, qword4, qword5, qword6;
+    uint64_t const *data = buf;
+
+    if (!len) {
+        return 0;
+    }
+
+    assert(can_use_buffer_find_nonzero_offset_neon(buf, len));
+    len /= sizeof(unsigned long);
+
+    for (i = 0; i < len; i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON) {
+        qword0 = NEON_LOAD_N_ORR(data[i], data[i + 2]);
+        qword1 = NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
+        qword2 = NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
+        qword3 = NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
+        qword4 = NEON_ORR(qword0, qword1);
+        qword5 = NEON_ORR(qword2, qword3);
+        qword6 = NEON_ORR(qword4, qword5);
+
+        if (NEON_NOT_EQ_ZERO(qword6)) {
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

