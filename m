Received: by 10.25.208.211 with SMTP id h202csp402558lfg;
        Thu, 7 Apr 2016 02:59:29 -0700 (PDT)
X-Received: by 10.140.40.37 with SMTP id w34mr2292080qgw.85.1460023169094;
        Thu, 07 Apr 2016 02:59:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si5297539qkg.60.2016.04.07.02.59.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 02:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao6im-0005HT-22
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 05:59:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1ao6ih-0005DA-Gf
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1ao6id-0000qq-4t
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:59:23 -0400
Received: from mail-by2on0067.outbound.protection.outlook.com
	([207.46.100.67]:56152
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>)
	id 1ao6ic-0000qM-OM; Thu, 07 Apr 2016 05:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-caviumnetworks-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=X8pBb7C99mPj+YSnmAILB1qM4x7Y6D5akC0/4H3lILM=;
	b=lh2AKOxmGultSWp18pSKwj/0VBOKsc1TqwtvywF2RWcPrxRGKnUPI6t6OgVqRWOxb/WzdngoSNDvyBWX9u80sVu+rO03w65HgiPR5fDSDymfKaSwjPxdGncIDEduAaEeikLo1BUYAeLPiNWQgnTHxq+BmDz382uOwJftYA66jbQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none
	header.from=caviumnetworks.com;
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BN3PR0701MB1686.namprd07.prod.outlook.com (10.163.39.152) with
	Microsoft SMTP
	Server (TLS) id 15.1.447.15; Thu, 7 Apr 2016 09:59:13 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>
Date: Thu, 7 Apr 2016 15:28:06 +0530
Message-ID: <1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0036.INDPRD01.PROD.OUTLOOK.COM (10.164.146.136) To
	BN3PR0701MB1686.namprd07.prod.outlook.com (10.163.39.152)
X-MS-Office365-Filtering-Correlation-Id: cbb879cd-c534-4079-ee0b-08d35ecb482b
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	2:qw2xc1VHGabIC8m2rDj+dUQ7rrr0Kzg8r+wslBXZZBZXAM5zu8/gVpcKNbHPVGNVFT5d2+pqyo8iLaSz7AOfR6npipxkMyEkOvsFgT9sxtKEQL+M4nrIHaapsuX0F+Mo4stXarKG0GoEfjJyjIL71SLJtQjs2r7EnBSDSUhKMbtwgra0J4xanbD6FhkRUhPb;
	3:EigssJEE4Ea8leHMnnX8ojCNUr96ZBFnNwd574i0mnPb7omX0xXY8DxRQ9M5DtH4vWACcfy4XLgIcoRt42LTqfHGSuIF4tybaTlShTJrIsTApSbRzm/axm3xPFBfYzUz;
	25:/XJdGsVEDrn86zkFfIowQM11u6c03CUswFH6MHEvW9868cKn/dZAQhwZhFggArDa+hnj2vur15GIkEZ9qoFsMMDr9L/hW5/vSa6DbfkTaDhgsjT0LGs8ejcKMrpveuYoP5rVsFWN+9kJuA6BfAcS7WSmonJpwagEYUSPvc+etZ8GKhu9xX0FnOpk3mtvCVw7JBYryicop4Kx0yX3RNrlIwMHUo9aOHjcvZKnZP4r9LJoh7nZtEMftZ0eJxg22CAOIAp55KeoFakoCUV3ILPByIlO6wKU91hcc1bsWdFQ+CHhsFXCL6Y4PZZPALx1VC2DHLaQ23rnxbuzkgWLYbqZ5Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0701MB1686;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	20:uICoSfsEkRuXzQvZRADK/kOUpUhlF+AZabgFBN5PqXp9p4zIVuOCuo1/VKelsnVreIzW4f7bHzQ/o0D0CkkusyGIFKlGkK1LngQvBUOlkfsPC2OlkOgeb3WrWuxrldnR88b7H43vaVX/gCarAufGZ5w0nktcRQgCahaPYFJ0GQnIhtTxtv8u8dvrkDV+g8M1I9tPyhfydXbVYby/MTtKrNAJsP6DPeyOl9xx5ynd9HV8HTs0dTBlVOX8Q2Us7NnK90HvKpIHSAoab0OfiknKq7J7QkLebIGm5/9OMr7M8QRsmHksRnIZVDeb/zlWF9G08k2Yze34hbkqzXBsm7o5IkNpdqL+hcCZFAJqaFf4WziQyWhq29TjLpS5sZ9yGss7/zfkNJyzJZmPdgzIbX+3rScxoyVgfRZUYu99GQ8c3fVZRRozjEuh7eqslbRz0+d3KA2NpQVX0cqeaCruPsHJ/YwFDanRZg5u32I+BDxtTybDg21RvrlyK9u15jZVzT6g13K5pVEJIVSKP19sAmNqa7ikISDvwAw5IqXiy4isv8z8m57JcnPqGdv9fE/RIychhK5P03KF7Q91Rnf1dqhzvkwiImm8Ngp5Zb16ym4nbTg=
X-Microsoft-Antispam-PRVS: <BN3PR0701MB1686E4929F3DC60E5F51D682FF900@BN3PR0701MB1686.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BN3PR0701MB1686; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0701MB1686; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	4:DlCszv7XqwpWnaaRdyPDkxzFojp1ki+H0vNgjkHZ2myn4/QE3bQAIyFzGPoAjSTBHm7Pme4QLaMwKDNtgSNXqjI+kEiBhuJOmId1MOSRvK0i2kqXpG5susXyuG36XNdVhNn+0rdrT35lo8bGBjy3z+asrh9z/VRC2WyoyZZuk6mbpb4rDfbPuRkXzJ91Dv9WCfmt+bAVWNhCIKe15PyPUOQKA4ZfozZ65VZ4KcEqK911kJ8jCmgf0Ozdzkvk0IU7UnUzxgYqoPDz0cHWFu7a6Hd4hCX713/JWsAn21lxYMFuMG8nnErNeuz1S+XNAnAAXJX5eUycieK6sVbzovQ4D0IMTm4pIRaBDnVhXX16vEhAViO35aH56PQNtYkugNhd
X-Forefront-PRVS: 0905A6B2C7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(4001430100002)(53416004)(5009440100003)(76176999)(5001770100001)(36756003)(2876002)(50986999)(1096002)(189998001)(3846002)(81166005)(5008740100001)(66066001)(6116002)(586003)(47776003)(42186005)(50226001)(48376002)(77096005)(575784001)(5003940100001)(19580395003)(86152002)(2201001)(19580405001)(33646002)(2906002)(107886002)(50466002)(92566002)(229853001)(4326007)(2950100001)(7099028)(217873001)(4720700001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0701MB1686;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0701MB1686;
	23:44jVYB5LtpG1zZ4/G176BIc3qBSWnQqYmmaykaL?=
	=?us-ascii?Q?OqIrdG57oDvaJGcMPhm9QA2whsA3OENmB5XpBF8lQdunGHKvW1Yy5cfeIa5U?=
	=?us-ascii?Q?hlpsiMDXVIsItk9DL4v9yW9B0cNx/Z6DM0YtCXjWgntkYHvH44n898F9EJgL?=
	=?us-ascii?Q?581xe1JsO549xu1WZj7SgMWGV9NObTJzGECZy5xnUIHdGZ/dGTSgO80EQtNX?=
	=?us-ascii?Q?GkKiE+X2RfJB/5ygrZq4hzqHZttl0BKEyq03raQGzxvTlE4nFrYTJXtYupdp?=
	=?us-ascii?Q?8HabeodIwVRNqXLMI37X0xi39NPKsnKnw345txs5lkrfEUz5t5jFD41L5wsU?=
	=?us-ascii?Q?eiOWIGX+w1M/I1IiI+Yjm+2Bp1PoylSR/MFq/X0bmXRgTtDWcEj1I/qHX2eI?=
	=?us-ascii?Q?FrtIPZ/ZTpKw2toVROBYgX3p4Mbp5JiDGDYM0nRmoL5yrgEa/50jCja8g59g?=
	=?us-ascii?Q?FxAcVj3ZFOWglLhgKcB9RPjRJ5VguhyoSePR6zOg9v51PtoJdiy3Qqi/R1f8?=
	=?us-ascii?Q?kTHR4FaIuyefGrYD//jGFV+CZ/+WmFrDmpAwO3U87oqmhwGrsJRCbJFlIBPj?=
	=?us-ascii?Q?O9KSwvTA4//sUNlUdgIHoXY8u6csfyFSiTQRIDtHmuo/SJxEAVg2c53IDSkQ?=
	=?us-ascii?Q?Cww3W8ZPIGl+l6dZ5qyWP9HnV3Idq3tzEhKjMDjmd5jOOF1qx618hE10vF9k?=
	=?us-ascii?Q?Yk3GOuH9oDKvAc7AUv0OVbc+wt77vyfGa2H1s+GnqNRix13B1Mv4E5Kj4r8I?=
	=?us-ascii?Q?i5HrMbHDdIk363wsqpT5CHQy06UzHfpKLH5D1+u/hkYFcdvrRka7QP/UOWV0?=
	=?us-ascii?Q?KXfwcVY6OWU93TCC42LndgmMkqLxOfPWVKSXhMsEC44KTn4vYTSd8+e2oM8w?=
	=?us-ascii?Q?P4TBm7yAEafG8vZvi82d14Q+7qipi0T1V0DLe50GlLBRzirS2tpoYhBxQydf?=
	=?us-ascii?Q?uXgzb/2sY1c8iQCBoReUgwbkwPXgIeT4Y58cQhvugn2cmR/pZFjWi1vGrUV3?=
	=?us-ascii?Q?vlhB1qbYpEyyVmdK/vry+fnebmm+1ecHb67OoA5BbSoqrEvHyl/WyLyrnbqm?=
	=?us-ascii?Q?hz/WZgl8vHLX6F+lTn3Z2NG5NpgcJKZtr7/izSv7iiIKhXP3rjA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	5:o9MNlInw82KWA3s/N7/3B33EfrxlMiKJGJIJYqIBJ2SI5yHAaXK0Cd9lPvt/bSbK21qVY38XpcppEzheR6VmrfxKJgQrPIj+wcGO5485Zak2AvBS0qHqEnVhkZ8/JmScPZZkRtHjh1T6XfH0D2xEbA==;
	24:8HLqU//ELIA+IX4lRhonVb66Whs+6Z0H3PlFYn9M8fZpV/RQZrkIMOq9gasie8mgOXPPv8I4kOCt0jrWRi5xcncazBtjGrCaRvEuE7JfBA0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2016 09:59:13.9393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0701MB1686
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.67
Cc: vijay.kilari@gmail.com, Prasun.Kapoor@caviumnetworks.com,
	knv.suresh2009@gmail.com, Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Suresh <ksuresh@caviumnetworks.com>
Subject: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to fetch
	/proc/cpuinfo
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
X-TUID: FHNTWaKllBku

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

utils cannot read target cpu information to
fetch cpu information to implement cpu specific
features or erratas. For this parse /proc/cpuinfo
and fetch cpu information.

For now this helper only fetches cpu information
for arm architectures.

Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
Signed-off-by: Suresh <ksuresh@caviumnetworks.com>
---
 include/qemu-common.h |   11 ++++++
 util/Makefile.objs    |    1 +
 util/cpuinfo.c        |   94 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 163bcbb..364aa0a 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -170,4 +170,15 @@ void page_size_init(void);
  * returned. */
 bool dump_in_progress(void);
 
+/*
+ * cpu info structure read from /proc/cpuinfo
+ */
+
+struct cpu_info {
+    uint32_t imp;
+    uint32_t arch;
+    uint32_t part;
+};
+
+void qemu_read_cpu_info(struct cpu_info *cinf);
 #endif
diff --git a/util/Makefile.objs b/util/Makefile.objs
index a8a777e..59cde64 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -32,3 +32,4 @@ util-obj-y += buffer.o
 util-obj-y += timed-average.o
 util-obj-y += base64.o
 util-obj-y += log.o
+util-obj-y += cpuinfo.o
diff --git a/util/cpuinfo.c b/util/cpuinfo.c
new file mode 100644
index 0000000..e049672
--- /dev/null
+++ b/util/cpuinfo.c
@@ -0,0 +1,94 @@
+/*
+ * Dealing with /proc/cpuinfo
+ *
+ * Copyright (C) 2016 Cavium, Inc.
+ *
+ * Authors:
+ *  Vijaya Kumar K <vijayak@caviumnetworks.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1
+ * or later.  See the COPYING.LIB file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include <string.h>
+
+#if defined(__arm__) || defined(__aarch64__)
+static uint32_t read_arm_cpu_implementer(char *str)
+{
+    char *match;
+    uint32_t imp = 0;
+
+    match = strstr(str, "CPU implementer");
+    if (match != NULL) {
+        sscanf(match, "CPU implementer : 0x%x", &imp);
+    }
+
+    return imp;
+}
+
+static uint32_t read_arm_cpu_architecture(char *str)
+{
+    char *match;
+    uint32_t arch = 0;
+
+    match = strstr(str, "CPU architecture");
+    if (match != NULL) {
+        sscanf(match, "CPU architecture: %d", &arch);
+    }
+
+    return arch;
+}
+
+static uint32_t read_arm_cpu_part(char *str)
+{
+    char *match;
+    uint32_t part = 0;
+
+    match = strstr(str, "CPU part");
+    if (match != NULL) {
+        sscanf(match, "CPU part : 0x%x", &part);
+    }
+
+    return part;
+}
+#endif
+
+void qemu_read_cpu_info(struct cpu_info *cinf)
+{
+    FILE *fp;
+    char *buf;
+#define BUF_SIZE 1024
+    size_t bytes_read;
+
+    cinf->imp = cinf->arch = cinf->part = 0;
+    fp = fopen("/proc/cpuinfo", "r");
+    if (!fp) {
+        return;
+    }
+
+    buf = g_malloc0(BUF_SIZE);
+    if (!buf) {
+        fclose(fp);
+        return;
+    }
+
+    /* Read the contents of /proc/cpuinfo into the buffer. */
+    bytes_read = fread(buf, 1, BUF_SIZE, fp);
+    fclose(fp);
+
+    if (bytes_read == 0) {
+        g_free(buf);
+        return;
+    }
+
+    buf[bytes_read] = '\0';
+
+#if defined(__arm__) || defined(__aarch64__)
+    cinf->imp = read_arm_cpu_implementer(buf);
+    cinf->arch = read_arm_cpu_architecture(buf);
+    cinf->part = read_arm_cpu_part(buf);
+#endif
+    g_free(buf);
+}
-- 
1.7.9.5

