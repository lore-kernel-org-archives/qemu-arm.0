Received: by 10.25.85.209 with SMTP id j200csp1127915lfb;
        Mon, 13 Jun 2016 03:42:47 -0700 (PDT)
X-Received: by 10.140.160.135 with SMTP id g129mr13453651qhg.47.1465814567641;
        Mon, 13 Jun 2016 03:42:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y89si14840991qge.17.2016.06.13.03.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPKP-0001rH-7F
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCPJ5-0000Qm-23
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCPJ0-00077N-UN
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:41:22 -0400
Received: from mail-bl2on0058.outbound.protection.outlook.com
	([65.55.169.58]:60904
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bCPJ0-00077A-Dx; Mon, 13 Jun 2016 06:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IcYRUej3akC2bushsK0U7hU56xKjE4dECq7i0O+VV5E=;
	b=edV9ygkK3F29d6lyhm0Y/3aHCt36ygsGT5SjY85rCKHJ6SVJFwzQCoUjHLzrwtSC4dp+8E0dn7nTD2Tmz+aPdm9nwEDe/Y2nvkslomFHUUz1sfYg52M+XEuwdGhTKTtOHMb/eDX7TobEgxtF+2Ka4CCINlySE879VS2CrJpkmAM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.511.8; Mon, 13 Jun 2016 09:09:34 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>, 
	<quintela@redhat.com>
Date: Mon, 13 Jun 2016 14:38:32 +0530
Message-ID: <1465808915-4887-2-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (10.164.147.22) To
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27)
X-MS-Office365-Filtering-Correlation-Id: bb017257-4412-42c3-6f1d-08d3936a716d
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	2:cNX3HyaEaeqCiJ1vd/ut+F9OXjKvnADokUpoAcZX8mb81Av+VW9sYxVQIxBL48NIIMRz1quBuIKOfOFk6kcrKjzaram/hYcfqDGlOOXtdi7rdX/cZsivRsRK5XcLefV+ltFDyafIxt38dX6wJbWajnodH26MUY8+AeByI9T9Xxc7b7GR936kHC5sLjHlU7fL;
	3:1EcsgLVRiEuZTbSRxiRMoi0yott0B8DBGlN9Z0n2CvwvUtF55gtD2wnM6sew6juT+ZLV6nWmN5o7SsWxKpm+vXpJDx+pqLenX1uZ3P9Vir7Hy/OuH3hTpBO4CnPjdwN0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1689;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	25:IW/8nz03DcSG3UrbuWvO4Q1CwSGps1hTHM56KVfyXKUnmb5wDkCd8bQr+OB48XyTJQtsKmFd86dhTPiiaImcL6ifig+FSbbDoAJb7IZldcdmQuhvNgZqldSZ6kF8BPDWmECAb6ddMtEHb7H6L81KHmSmUTANv23dGfpmp4UTzLbmfYgvuWCceHR7U4SMRRXfp5+iuG99ZQxRNYbt3cMFUCPA7kAxvGpzwdy5LuYMSxx7k4u+4kHdDQmhkZrv+LDn1kecp+p3xENRUE8POs0hONQ6ElKcAsyoX8tYt/Afm6zs0fq4REM/lyyO8BfM3p4KNpBSD+BRfY/U+0SwX+2AHmZoUgQ9KWHP7cvtsz4/t6RDneRhQcALD3JRxHjQ/NWGFqHXryeXdXtP3dXVn1drnPSKpJ84P5IzuJypBXD1TwSjdFjV+6ITwVfNmL/ypRzYfTRk3NJ1L6PftCtmv9NGLlOMqupCLlYETWsRyXWcYPzpdYwLpWSE/ZjFSw1UUtEm6n9k51AsqLeqHQ2dLYvkZ1eiCQr3iXI5Em8ztKRdBTWJgUjIb8JD5n4iM8y6V4AEIGlCq7qlUBQQ/ULaq8Kd/hyXj/bdJ8DWHuepJzIuI387HE+pnCKLlD090pV3KRsA05kNmDA5Y4n7gg9NNIqoaCvpzVS0D+cOtg8qZRu1gMh81xxCMYAviM/jScW1Ye6Q2rk9x2EzX7S8Pl3uIPFXTTn/JqpaG/2qKgillAqH5Ys=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	20:wR3xGJh0kVTlxSeSlB/P0L2r6dTiyAjI6G/cFWnLEX5fKqxxdBF2foAW5B4hN1ZE58H02YFPt3aTCbCsEq9WTJEY/zWQX6jEKgxiSmOqK7CieilqJbLb54fmHOyJlwAlCkIGqwQ4e+V54NGRTznZ3Fhbpn4c+f9mkzNWgTxWDfr3I0PyEXaSQ9UaViIf3S/T2RunT/gS9gp5Sbv/PGr9ou863Z9UiGCe8MoBK0CsO0trHVh7c2BupDB9N+CaI20iJqIXdDm5ZECvRMjAq2saYI8tPB+SN5zrNrpmnAF9GB+WcS+nP03IN5fpylkVIH3uq8pTefZUHbHPdc96MY9GdgKqCcnbZRgrUwqOpc3iY2HFcZatqGgG92puCwR80NjhF6AyyvKqOMtGCSWnGXTkvCC1GpnOSq0Hlc1LIAhwU/lpPaHa+Zty3JTSSUwZs8/qa4AZMdDiOQsiEHwFnwcusaDPiF1E/Z6JQNCp25rS33015qCw++ygNLwvi/wBrvINrJ/KoopN8axNLIo/T0HPCJga3fmmoHORJUbT2RhwyPi5ph0BxMmV6ODWjVDj/HfcsO+/lDMqEEDX7omj45VGXlatpyX+hHdK2w+OQpJyhR4=
X-Microsoft-Antispam-PRVS: <BY1PR0701MB1689EDAA02BEC21A777E5A45F2530@BY1PR0701MB1689.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY1PR0701MB1689; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0701MB1689; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	4:aJOKnvGLKeNKXe9nYwrMriycZKMBrW6N9pwmdQ7a6Q9xBBbe7V3EdyQXQ+BHZPTJudbTJ1IobOoFaM7bS+n2b8mfsSgYCphAuyNba8aFOJNgEhnhvdyfPjhfeghA//bE+UfrJ9ou1O50uxy2x9AIVWRS1AmVL1HF48TKqk8c1ltyGYr980w0hc0mCDaDpdLRoIXvhbFnTt3WBkbvKe3hNJ5cZMnq9HxGLfc4HfPsG6xgidvCe7m+r5H4sXqQzTFtBdYZJUGZUwKo3oCOt5MHZvzFy7y6ffMur+xsioKLfwPP6wu0boM6bWNfDlJRgXl6mhoLb949WnYlIospUZW1J8dRQdxx7cBVLX1I/xlqU36gFzbZKIXxSqS1Wnqz80Z9
X-Forefront-PRVS: 0972DEC1D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(47776003)(66066001)(5008740100001)(33646002)(8676002)(4326007)(48376002)(81166006)(50466002)(106356001)(107886002)(81156014)(105586002)(5003940100001)(229853001)(5001770100001)(97736004)(189998001)(2950100001)(2906002)(101416001)(36756003)(5004730100002)(50986999)(50226002)(42186005)(68736007)(2876002)(53416004)(586003)(86152002)(6116002)(3846002)(69596002)(77096005)(5009440100003)(4001430100002)(19580405001)(2201001)(76176999)(19580395003)(92566002)(7099028)(2101003)(217873001)(4720700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1689;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0701MB1689;
	23:GSH5hxHWF/zBxSVCEURkqCXKIB554xTkUOAyP/Q?=
	=?us-ascii?Q?kwI4MqTL+a5Fb/7ZprzDox5tDCpXMaU7Y152iaJtjWlDwJmvG3Ll29GSweWp?=
	=?us-ascii?Q?6+kteD+zhnr9JBsdzCyzj42QmrIxwOxFyAu+O47VoFLdUDPTkacxl9ps1bag?=
	=?us-ascii?Q?4plbvGspNf8i1oC6zT/e8jFkU4RBIImbyqzYsX1BdUn6zC6kKCWcoEDR30ar?=
	=?us-ascii?Q?CB8DN13IQD6EW/Pr7ImWyqvKzuodSY2ye8SxvvUUX+epd/Xe6VxZ2uynz7uv?=
	=?us-ascii?Q?AxJAOlZwtwk7Yzhl1jH39ncMYFNCGxIpsKomleXvyy4B4u84bWRqdn798RQD?=
	=?us-ascii?Q?HOtBxbpYAkmaHSJEAuocsxVvV5sVdVqpseXiJV+TXCQNO6mKRJb5Ke7c8dYk?=
	=?us-ascii?Q?d9dXDAEN19KXGJuHKQYpdWobFX8ZfitXheGmpnPHfIJI95srdm0/IwWixskx?=
	=?us-ascii?Q?aJ6OSZiMuMZtDmAKRLUenqqPWOssdlUipzN3MgmwVt7dnA35IJKJluF/0gfu?=
	=?us-ascii?Q?RHrMX9afvnZ7zlUdvSwMFcsypN5m9jyYU1QjlGCyjCwIBR3xVerxhqEHnXPQ?=
	=?us-ascii?Q?cDdX03Krk83QyjACd0tugCk8ZNxfiiVidTE/CiiIB6YtsC6/AzAx1LQnJWTF?=
	=?us-ascii?Q?pNkdFRK+dXaW7QJDO3jjJM9CZCkINfyIaWybPx5xd4PBxgYZMVISg101uWKv?=
	=?us-ascii?Q?30pmqAuE4stkslkXzP+qB9KJtDtZL2be3dv5hEhPZLob6cJAJcZT1xTvZzMg?=
	=?us-ascii?Q?89dq9Gm8P/I40W4vlnSFynK9xAV3Q5F5BJ6U7VqJntmProKw2I6zqz3V0JCB?=
	=?us-ascii?Q?LPZMnFEzvjb/ri5DCL2PQ3LQQoa+QKvRbM/fdUqodAdVUyNW6lPR/+2irxH9?=
	=?us-ascii?Q?o5RHGz4HyA9HFMg9gm3TwUAnFvrFDpN9jcWGCxD3n7ywTY5sU0LlsYLV1Xbl?=
	=?us-ascii?Q?Y1ozAvY0Q9ROht1CUeJJDOl4PnzVw0zL+xU9GkDzOQpyjPDrlN2bfU08Yiqo?=
	=?us-ascii?Q?bftoE25UshtO8jF0NVK22ZOLR2AsPLWjGJSJeKakJYIRYHP2nx+2xi3/k7hI?=
	=?us-ascii?Q?0dHtDOF2Kkraap74EpjvppfGpJ3yvHYpnpYSQ0dpr0MuI8/oh6ev5xJC2JDH?=
	=?us-ascii?Q?Sb80aGFZF1Daz0P/799Q9YACN/NDG7Hi4V0pnxY20PlINICTSlEBjGxA60TB?=
	=?us-ascii?Q?lLPXU1Pt7tK3JW4vyiXZndrYVgvNVZ70yIjPLGqF0U+Pof2hEsDFMP1sCyDF?=
	=?us-ascii?Q?1MtCmvGPadut2R0mi2GQf9Mm/xqa2IXIr6VLKhTF64qrhicSpJvobrWHaacI?=
	=?us-ascii?Q?fiW9jA+suPpXhEnu42u+dzyI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	5:XIcY7LlZOD/4UMRb/XW4CuuFMZXQNggbvFhtZRLMF2hFkMxKuFv6V3zy+qUZl95s7A21PHigcRTs0J/xhCvWUQWDl6kIM9cEPQQaZNNhyVsjfgA0nwtPnlurDGw437N5zJQBNx3VtFX0qNIegC/gVg==;
	24:6oaBS4dXoIjbeSHtfnzVXRgfZIuZ+/2fKVkt+jgIDOOuEbmT5Me2j/6ExcaDBDPiUvStOBDM1IJnOZU6l+5DpJiwWZtMV+odukPzjvLAcqw=;
	7:keKEMbLQu5fQESgL/cU1FG2Hs7+Uof8rCvBOTp84MhnIbrTo94vfvjnLYfp1/aK9gKPW/ocAvBq+4mhTbPaud3jjJq8MFgEKkrXlpyg1wEYG5kmhyZWiEPgi+MIUiDZdPLqDt+efsbyrqGuDsBXXIcfHi6BrrSUHivfKdz+XbaxXljidmYFZttSUHNFkrUzyJAhEtkc4XcvN4MGIITGEPqo2Yby1GmqoEK5jGZRLy08=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 09:09:34.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1689
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.58
Subject: [Qemu-arm] [RFC PATCH v1 1/4] migration: Remove static allocation
 of xzblre cache buffer
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
Cc: Prasun.Kapoor@caviumnetworks.com, Vijaya Kumar K <vijayak@cavium.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OgyLubnkTsr6

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Allocate xzblre zero page cache buffer dynamically.
Remove dependency on TARGET_PAGE_SIZE to make run-time
page size detection for arm platforms.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
---
 migration/ram.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 844ea46..ba3b352 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -69,7 +69,7 @@ static uint64_t bitmap_sync_count;
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 
-static const uint8_t ZERO_TARGET_PAGE[TARGET_PAGE_SIZE];
+static uint8_t *ZERO_TARGET_PAGE;
 
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
@@ -1437,6 +1437,7 @@ static void ram_migration_cleanup(void *opaque)
         cache_fini(XBZRLE.cache);
         g_free(XBZRLE.encoded_buf);
         g_free(XBZRLE.current_buf);
+        g_free(ZERO_TARGET_PAGE);
         XBZRLE.cache = NULL;
         XBZRLE.encoded_buf = NULL;
         XBZRLE.current_buf = NULL;
@@ -1893,6 +1894,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 
     if (migrate_use_xbzrle()) {
         XBZRLE_cache_lock();
+        ZERO_TARGET_PAGE = g_malloc0(TARGET_PAGE_SIZE);
         XBZRLE.cache = cache_init(migrate_xbzrle_cache_size() /
                                   TARGET_PAGE_SIZE,
                                   TARGET_PAGE_SIZE);
-- 
1.7.9.5

