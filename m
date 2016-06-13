Received: by 10.25.85.209 with SMTP id j200csp1154874lfb;
        Mon, 13 Jun 2016 04:48:35 -0700 (PDT)
X-Received: by 10.55.24.212 with SMTP id 81mr14156112qky.146.1465818515714;
        Mon, 13 Jun 2016 04:48:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b69si14987482qga.1.2016.06.13.04.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:48:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCQM7-0007qv-34
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:48:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCQHR-0003mb-U4
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 07:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCQHM-0005eD-My
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 07:43:44 -0400
Received: from mail-bn1bon0058.outbound.protection.outlook.com
	([157.56.111.58]:53768
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bCQHE-0005aR-NW; Mon, 13 Jun 2016 07:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YfJZGLj4juKEtEk7eT71irH0yQuUh3pt/sjtXPy2TRk=;
	b=HxXp3P9QpCwUofl3BO/IeoLvr8mKBSf1cbsZwjyGjXwXN2hyB2oRwwK4jf2r9gi3RnX2zxk9riLwkkvtMspC7dzKvDaRazJ6+DeVadRiqHDd6Aqhmq47DB7xoONWIItf0hK473muQHPjVnZ/nEkTRSvh1POMYrEA+WqrO55Mxi0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.511.8; Mon, 13 Jun 2016 09:09:40 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>, 
	<quintela@redhat.com>
Date: Mon, 13 Jun 2016 14:38:34 +0530
Message-ID: <1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (10.164.147.22) To
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27)
X-MS-Office365-Filtering-Correlation-Id: 95460b9b-2fd0-4fd9-29d1-08d3936a759f
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	2:APZBfnuFqRfBe3uuJdMryBSLJfGLKkacwT3C6GSLPbJGBwsil345iSlC8rjzOrAAg8FFj3/a+Zg3BBTUrxLT6LfBblPLxPbA9KD6awjKfnCSTmTCuDP7UZkq0ID5gQYQE44QQBr17Pn1f1BZdL7/yh8gU61Pv4jsgGsiJu6ej9WUybnDNEIfpSNH/9YjLimU;
	3:ll2SNWtYQbp4JLZZ5YWwTJIF/2xoNSx9S88pHP72Shy7OvBAZDDqWWc/k4SkIiBE7vRVNkTE36o/pJfB32CwNWZ+0hYq4rcavYEtsif/i+MsqrcLVVt1TyM0Fgd9/Fy8;
	25:+9Ylu1B5DQvIgKTCzh9pbTAt9CfGx7gJaTOiX9psh8PDPhIvflZ6raDQMejOHJ/AAs5yINQUjE6aBK4O0clLjUASTfIF8Rc8vHFXO91Eq6kJ0aXcqc5yGyc4yr4uXbhK8HJi6Z7WBZDKyUErjESBFC4ByvryfzT+bx7nws3iE6EcM2aai7Z57TA3sRh+AcAkftm8jvQ24k8vGedue2hkxQ9kF42/WIrSITPLxOkD48+fXglMV84rsMKydCUi9JuPqx8a3+xN7uzP6XSu5PCbjz92g6ZYStHbxpKTPdkwOlOErMGrfqYpdMo0wT/8xrYcouUp0wGI/6Rk7oyotXheV1b163uM7I5bRyYOl/c7w7714tp39CD3IHZG1Pnub5tIQ5o2Eyk4OvGzjYJaehkPcMj1U+9pH9/hlsv0TKemXfQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1689;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	20:kxNvx8k79A2CXRH6LkOD60Cs6XqG+7dElO876kQQciOVg0JH643kjXlwDV+u1r8n990OydQM4XkyiioN1br6w6vDps4IrQAoeIQSsRVVyCLFK/xJWIPSJHzTAVsllxVZ2pTQsqvlmf/UjzVlplqRmD30s8jlTIzOIDNhsPHtgfO9a8bmIEyrheSyfHCZI71rMwHtEY1gkxlmfL47I+wv48IoVO9fMT33lgiWKEODyAFobvPUi5JLOu7jLzIyHqoefnQq0Nd7oHQafgMELh86HYEDgNJdaL4CDymTvt05SvLC/AyB3eqM1OkC4VzIE3nY58spb+/lu4qUg5FZOf5AV3BgFKQ79E7AHkMWFlvY5XxjSQFkrOwMRtOJupMQEKn/HlpVe9AQ06F/9Joob7NchJTRVhPuxVTHNWgGBGMMy0e4St/ERQrQQP7+jDiAbr36O0lEiq+ASLvCO6SW5k7FkmkaZchFAWTge1hy9KyKLYlH8tYSIdzpVqLerUM+aSDAepNFy2mkGaknlXZqsSP1T7spAsUqlqSEpYfG4Zb4EFe6BFGJQoZXx46ytR300ayeSZMD0fM1uqKEAJwX/82JZMF9XF47f9WhLyPTaFRZSm0=
X-Microsoft-Antispam-PRVS: <BY1PR0701MB1689C441A6FC6B706126CF7AF2530@BY1PR0701MB1689.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY1PR0701MB1689; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0701MB1689; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	4:kNXUhs/E73xKzWU/8OWQxk7xTXGZv8O/sFwCPF9iGMTZ8dsizYazmns+m6wZCovj8+d2e3Vu6tWLWENBQrnV8U2+dOyAPO6bl7Tc0FC5JAukay1HN9Ie6wQqH7HmZFQlbHmXG0sFLJmIdbeRxWX/BD9KGpfXhavO7y28H6oH6c3l3dLftsCmjZ3n1sjj+Ebh9zo/dzVjMzqM8Q89dXqHxvPq1GUoMwLongA+eaQrnx32KG9Qy6PYLa0Mi12XtryXbxYAcS2mKIcvSszNy/B4vCW97oUHXLvedfGVuR+DrKNm/iwjJMyLu38ot3bxiJjsyS19wMxZu4zZfaY0HlA3M8PpYEWCUFAEKGTiClcps1lnbu+loUloAVUgZtBDP88HA8AVhm647236dLXDNzZ1T1UxV+h1VTdr0sLycIbdX40=
X-Forefront-PRVS: 0972DEC1D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(47776003)(66066001)(5008740100001)(33646002)(8676002)(4326007)(48376002)(81166006)(50466002)(106356001)(107886002)(81156014)(105586002)(5003940100001)(229853001)(5001770100001)(97736004)(189998001)(575784001)(2950100001)(2906002)(101416001)(36756003)(5004730100002)(50986999)(50226002)(42186005)(68736007)(2876002)(53416004)(586003)(86152002)(6116002)(3846002)(69596002)(77096005)(5009440100003)(4001430100002)(19580405001)(2201001)(76176999)(19580395003)(92566002)(7099028)(2101003)(217873001)(4720700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1689;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0701MB1689;
	23:Lw+9kXmHSIcYegpSYjSCNii0RvJhqcexmLYfkom?=
	=?us-ascii?Q?bcdNv8I2Up4oeIw04L+ily8jTNiXFvrfja5miEy2yCZRg6vov8VhsNgjKujd?=
	=?us-ascii?Q?xdsu6/bCQ6ETLel4X+9R/LLdHvKZ5GSXcesmrxcEd8axzuUKYsWp5JWDrvpQ?=
	=?us-ascii?Q?sg4Q0cPKgmHvPSXpl/XW5HSRm/ORnNwwSWudLjkoTQWRXhTNViua8CaWF7iG?=
	=?us-ascii?Q?dcqA/H6RTlcX59uhvUqM32+ZZ3kHm2LW+POxaPb9SZa9rdVXPWgMA9NBVl/m?=
	=?us-ascii?Q?eGb4fbJ1uw0X96+IzXKClw8EhFhpAK4PO9nHRpNeUAa4W8XkCU7UOFLUAtwU?=
	=?us-ascii?Q?lCPzeIhUFlBxLMwWVSTxUHPsoESjuUw0KQO6sWRAKZ4Q8O6g2UiXPs4FlMfa?=
	=?us-ascii?Q?DLncYrkhdI5bf5+6X67Jd0xd9QwXzOxKBDgEqWgjO0pf5h0dCHRKb8+rmiNw?=
	=?us-ascii?Q?uUkzp0An+ENSi5gx5xy2CmtfIE+Emb71fORE+Wb+TrDRipvdSm+Df474rDbB?=
	=?us-ascii?Q?kFWRxDGuB+LKpPPQ/oh01s62FtExJI1oqycb4sME/hyk+06iFCy45PI0rt+2?=
	=?us-ascii?Q?7ApkxyTvUk4vBi3FW7Dn3ibQ1r1XwCoO8uaW3DszNlk4RVnutaQOGG1I9LA8?=
	=?us-ascii?Q?1xoo0repPD9ijY+Oer4zP8knb5vapRMtNVZ3xDF0/xf4J7a57B2l9AiuzEZ3?=
	=?us-ascii?Q?XR77IOSjjdnblBqcC/P3lTJEKETZ4QjE6uUvC5NQ/k0gI+6/iJPVXn4DxoM+?=
	=?us-ascii?Q?eWYM1A142ZdUHbH61RaMhc3pJAJzYEvIUt9aOde08V6aGBVntHRGjaLXcMkK?=
	=?us-ascii?Q?Lm8u9ZgiwMN/wwmH+kA42w5rSADnLl4QEaGOktXdgEWdhOQcylcfLXrLRIp+?=
	=?us-ascii?Q?ZFkzTLWS1Jaj9YQhQcABXgBa/zxTVDr6lLU1R3M8oE41AP2v0T0uW2WLQVc/?=
	=?us-ascii?Q?r8A882U1tlieArGMrTs1yMO8xF3SN9tb1qtGUflUA9GjF6RZNf+Zani91GfZ?=
	=?us-ascii?Q?hObq9MgYCZgRAMOiC/tRqEnavKKBqVBT20Z9qKh7+giwVWOcAsqjJrO4YvL4?=
	=?us-ascii?Q?aSPuLzkvvgKTv60HIUPaDfC5CWy5v8HlFNc9YYKvgtAAPcXg4Qlmi0EVjBYj?=
	=?us-ascii?Q?Ur7f0sluLvrhESBtRmbvr45i8YZNrhZyAZLtj7jV4xt6rTw9dlzyx2cEThDH?=
	=?us-ascii?Q?jY6GGcF8h3+s5wJ0j8gTD+502LKMjyUfkks4D862LVCdDmu8w9qwE1xTWlCy?=
	=?us-ascii?Q?wYUfxCjz4fU5zw9cPQnYH2iQTevw2nhDm8yV6TpXGBdpiltWIGqV0jH8p752?=
	=?us-ascii?Q?mQeNMx0naJiHMAzpcFAGQ596MHH/AR93UGNPNKtAzCdw5?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	5:yU2bw+sBO7ABTjbqi5ZVbZOztY7sSbibtOM7Z+8jbWPcwwuTVPvBwVCgnxUcTzlewc6ayd+C51lx4m/hov0oiv/V37hWsDwizjkw/PgsW8iArEvHA4lZND22yB/vE+ujI/s7ZZTT1D3g1P7f2TBTmA==;
	24:RnS/z/byPyc50mFaGJ3/YvZRB0clTFWzq1iuExyyPkGgaQdiN9Fqz2ipBwxPbLHlm4fghzx59UZA02TbgLdCIhDkqBZ1c0f5VPXIZ9mby6U=;
	7:qwnrfE6cUI+LiJPiLjP1WOiUhTekJP1BiFQZKNRQ+UlFS+uSpH7TO/orLPHctaEpvm+aaItVRHhBGeVX/4NQlm+ztavMgYEmVFjHJjee3HfCtkLJMjQ8zCjfpDP7QGOSMQppNsadFPprhFPTl30fnaGW9c++G8NNtyTFXkzLenqfVsMfCSvLYVEUUWAktwKnka08z03mDHeri+x5kM91wLWkwR3h1RFD6QsztcZe4qA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 09:09:40.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1689
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.58
Subject: [Qemu-devel] [RFC PATCH v1 3/4] translate-all.c: Compute L1 page
 table properties at runtime
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
Cc: Prasun.Kapoor@caviumnetworks.com, Vijaya Kumar K <vijayak@cavium.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTVaNLA6G0VR

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Remove L1 page mapping table properties computing
statically using macros which is dependent on
TARGET_PAGE_BITS. Drop macros V_L1_SIZE, V_L1_SHIFT,
V_L1_BITS macros and replace with variables which are
computed at early stage of VM boot.

Removing dependency can help to make TARGET_PAGE_BITS
dynamic.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
---
 include/qemu-common.h |    1 +
 translate-all.c       |   57 ++++++++++++++++++++++++++++++-------------------
 vl.c                  |    3 +++
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1f2cb94..d5f0450 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -129,6 +129,7 @@ int parse_debug_env(const char *name, int max, int initial);
 
 const char *qemu_ether_ntoa(const MACAddr *mac);
 void page_size_init(void);
+void init_l1_page_table_param(void);
 
 /* returns non-zero if dump is in progress, otherwise zero is
  * returned. */
diff --git a/translate-all.c b/translate-all.c
index 118e7d3..a580ca9 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -57,6 +57,7 @@
 #include "qemu/bitmap.h"
 #include "qemu/timer.h"
 #include "exec/log.h"
+#include "qemu/error-report.h"
 
 //#define DEBUG_TB_INVALIDATE
 //#define DEBUG_FLUSH
@@ -99,25 +100,18 @@ typedef struct PageDesc {
 #define V_L2_BITS 10
 #define V_L2_SIZE (1 << V_L2_BITS)
 
-/* The bits remaining after N lower levels of page tables.  */
-#define V_L1_BITS_REM \
-    ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS)
-
-#if V_L1_BITS_REM < 4
-#define V_L1_BITS  (V_L1_BITS_REM + V_L2_BITS)
-#else
-#define V_L1_BITS  V_L1_BITS_REM
-#endif
-
-#define V_L1_SIZE  ((target_ulong)1 << V_L1_BITS)
-
-#define V_L1_SHIFT (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - V_L1_BITS)
-
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
+/*
+ * L1 Mapping properties
+ */
+static unsigned long v_l1_bits;
+static unsigned long v_l1_size;
+static unsigned long v_l1_shift;
+
 /* The bottom level has pointers to PageDesc */
-static void *l1_map[V_L1_SIZE];
+static void *l1_map;
 
 /* code generation context */
 TCGContext tcg_ctx;
@@ -127,6 +121,25 @@ TCGContext tcg_ctx;
 __thread int have_tb_lock;
 #endif
 
+void init_l1_page_table_param(void)
+{
+    uint32_t v_l1_bits_rem;
+
+    assert(TARGET_PAGE_BITS);
+    /* The bits remaining after N lower levels of page tables.  */
+    v_l1_bits_rem = ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS);
+    if (v_l1_bits_rem < 4)
+        v_l1_bits = (v_l1_bits_rem + V_L2_BITS);
+    else
+        v_l1_bits = v_l1_bits_rem;
+
+    v_l1_size = ((target_ulong)1 << v_l1_bits);
+    v_l1_shift = (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - v_l1_bits);
+    l1_map = g_malloc0(v_l1_size * sizeof(void *));
+    if (!l1_map)
+        error_report("Allocation faile for L1 MAP table\n");
+}
+
 void tb_lock(void)
 {
 #ifdef CONFIG_USER_ONLY
@@ -408,10 +421,10 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
     int i;
 
     /* Level 1.  Always allocated.  */
-    lp = l1_map + ((index >> V_L1_SHIFT) & (V_L1_SIZE - 1));
+    lp = l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
 
     /* Level 2..N-1.  */
-    for (i = V_L1_SHIFT / V_L2_BITS - 1; i > 0; i--) {
+    for (i = v_l1_shift / V_L2_BITS - 1; i > 0; i--) {
         void **p = atomic_rcu_read(lp);
 
         if (p == NULL) {
@@ -819,8 +832,8 @@ static void page_flush_tb(void)
 {
     int i;
 
-    for (i = 0; i < V_L1_SIZE; i++) {
-        page_flush_tb_1(V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
+    for (i = 0; i < v_l1_size; i++) {
+        page_flush_tb_1(v_l1_shift / V_L2_BITS - 1, l1_map + i);
     }
 }
 
@@ -1825,9 +1838,9 @@ int walk_memory_regions(void *priv, walk_memory_regions_fn fn)
     data.start = -1u;
     data.prot = 0;
 
-    for (i = 0; i < V_L1_SIZE; i++) {
-        int rc = walk_memory_regions_1(&data, (target_ulong)i << (V_L1_SHIFT + TARGET_PAGE_BITS),
-                                       V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
+    for (i = 0; i < v_l1_size; i++) {
+        int rc = walk_memory_regions_1(&data, (target_ulong)i << (v_l1_shift + TARGET_PAGE_BITS),
+                                       v_l1_shift / V_L2_BITS - 1, l1_map + i);
         if (rc != 0) {
             return rc;
         }
diff --git a/vl.c b/vl.c
index b0bcc25..b6da265 100644
--- a/vl.c
+++ b/vl.c
@@ -4044,6 +4044,9 @@ int main(int argc, char **argv, char **envp)
     }
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine), &error_abort);
+
+    init_l1_page_table_param();
+
     cpu_exec_init_all();
 
     if (machine_class->hw_version) {
-- 
1.7.9.5

