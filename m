Received: by 10.25.27.66 with SMTP id b63csp732587lfb;
        Thu, 2 Jun 2016 07:10:59 -0700 (PDT)
X-Received: by 10.55.16.234 with SMTP id 103mr36754618qkq.147.1464876659224;
        Thu, 02 Jun 2016 07:10:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si468502qhz.11.2016.06.02.07.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 07:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8TKs-00035A-E2
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 10:10:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1b8SDu-0003Qb-R6
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 08:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1b8SDs-0004xA-Nk
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 08:59:41 -0400
Received: from mail-bl2on0073.outbound.protection.outlook.com
	([65.55.169.73]:60576
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>)
	id 1b8SDi-0004v6-FT; Thu, 02 Jun 2016 08:59:30 -0400
Received: from BN3PR0301CA0080.namprd03.prod.outlook.com (10.160.152.176) by
	BN1PR03MB202.namprd03.prod.outlook.com (10.255.200.144) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Thu, 2 Jun 2016 12:26:28 +0000
Received: from BL2FFO11OLC004.protection.gbl (2a01:111:f400:7c09::127) by
	BN3PR0301CA0080.outlook.office365.com (2a01:111:e400:401e::48) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.506.9 via
	Frontend Transport; Thu, 2 Jun 2016 12:26:28 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC004.mail.protection.outlook.com (10.173.161.188) with
	Microsoft
	SMTP Server (TLS) id 15.1.497.8 via Frontend Transport; Thu, 2 Jun 2016
	12:26:27 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.73.16])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u52CQMY9027054;
	Thu, 2 Jun 2016 05:26:25 -0700
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: <eric.auger@linaro.org>, <crosthwaite.peter@gmail.com>, <agraf@suse.de>,
	<peter.maydell@linaro.org>
Date: Thu, 2 Jun 2016 12:26:21 +0000
Message-ID: <1464870382-385-2-git-send-email-bogdan.purcareata@nxp.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131093439881769930;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(76176999)(85426001)(50986999)(50226002)(19580405001)(47776003)(5003940100001)(189998001)(87936001)(92566002)(33646002)(2201001)(586003)(86362001)(48376002)(104016004)(49486002)(8936002)(50466002)(77096005)(5008740100001)(6806005)(36756003)(105606002)(11100500001)(2950100001)(5001770100001)(19580395003)(2906002)(8676002)(81166006)(229853001)(106466001)(4326007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB202;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC004;
	1:fzxCdiOCfxmsleqi3QHetsDeQ8MvoFvT/1NFO9+d9qa/WF+Os74VMGDi5gXPtT7E3w5I+KVZVtPf42LO7Cz/1w8vT4rJccVPqw1lDMAlynvf85l69gWpbJqYf2Cth2+AVD8NPp6YwJ+TyMfQCARacOA01U6pLobPecK4RpoFmuWju159n6YlVX36a1tSFblRgyc+7a/x/f9b9Z/FzhYwuEMAZ6BZgxjoTaWgIzON04uBPW45k9V53yoSAxIvWilSacGPPW0vHp+NdGkPNOI2OoFYWEHa8XEp1u5Xm/3FowkTbR9Wz2lMKtJmkgHuzxXp5iBi6zzuMMCuqJnrVJNWcci6beBIGQbpZ9vG0H84HuHmASURGiHSMS5oMM/FqNXP2jJFC2lC2TbDtKJsPdlMhsXk9vE5DPqRSx9uiSCz4WInS6AkpQNfKi/oBi6pfwsIFSJ+FkTQeswU4h4IxurnWBF8mS/NCbO7wqStQVJLr4S9lv/vTzzr6Bfx3ZVtBAW/+RFgj5udlQXSieMoQImRvcidq4igx2YKS94aa3LHaDtD/gRHkgbh0vkTG4P02XNVnmXdOW1lE54cWnW8M1LFZw==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46678237-ba92-4d0b-73ca-08d38ae11f00
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB202;
	2:UKkQb3Tbd5+cuAZRq3IX7YYj8e5A3aX1CC3/X6y5JK9zg49iLvIwdQ1r4a1C98Yav634y5XgLQMkq/fUMwUzgMnRI8E7l2UU4mjRKLatxMhcr8aI1xC4YCFKxNEMX88qeFzXYouHOjTTgth83Y7TxKnfJGoljz48oCypF3qUl90un1rnkJQbSPwisKHjh9td;
	3:CHP0OwESurqxwYrA9EcLRAF50NKpdZ3yCl+YTlaHEDyutDK07xhNO5A6IS5m/2AVhdNv6TmSJ4Nke7tAD+zpA0NTwbqfBp5gSRmFPWSKE+KyZnhbdBDaL5tFEYe5EQb0Cvu7aZYzkceUcJqpG1Qxm0Ssq2NO2LM/CEpBwODbRpPUSRqKA0sNwsFQX0RVqDDp85cB3ll8oziTZxs0mtnplEjWlriNS9+D0p1MEUXh1LQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB202;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB202;
	25:W1WlwHSW2AiJD/OgWGw/K8qdP05bL9OKb8fe1Y5l+gOgwr2uAm+g0TbLSLuUqCQnb8ZeavGBoF0MzsSbSKXa7eQl4SfLyFtFdfNJCIb2RVNF0ybpR/Q2ZgDTs6cnjoNC9rwQy8FHTNL32GSqkcp19+c0i8q6Ep/917p9hz6Tb7hGGddpCZ3UcdRZT+ZRF8AsQ6p4yBZ7PM2hu/H51x37MU/7gI0G/lefXDQlOKmTMx73GAWZke+hAUUMhIhAZSdplobfvYsSqHo5RdNK88lAbYEMA48+3w+Y5WUpOYFpRxtlas52tJfsEeDwvTbM8PQ8mjuQz408rlESyjB49NiLwD7BWwmdWaXJha82PG1j9z5PVnPOQLU5iFbJVggpFCtBucXuCwFX0GqIAKlbB03x+KIPyqZOxiZ3N76DHnMX5yw32EHfSlrRp8+YlGtZ9gi58lbziVDpPIjqnFzyf9NtesIgGyJUCnSX1NNaUByFxhbOuv7kdmtlVC++BcaFSfPXxku2CoklVi5wIlBFHtU/VNnHGefSSrIEms/eUCQ53F3BITpfea+TDwUyx08y0v4xfyD1Zjkg2W8MYnas/TsNxnJtRqFI9u/j8jZEOucp/LinVyjlbZjkRiYkFfrS0oA01Oq4NE82b5UbHpv12jp4V3e82AlqksKS+p4DdV4w2NWBqxzmZHd4T15yZqjs13AppXliDa5RjI8InQy9fyKe4iGFpJTvMWBlrEJV+fWaZ9rVFjs6flNBZzs5OmhgDxW5
X-Microsoft-Antispam-PRVS: <BN1PR03MB202076C0949797C76C4B53BEA580@BN1PR03MB202.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(13018025)(13023025)(13015025)(13017025)(13024025)(3002001)(10201501046)(6055026);
	SRVR:BN1PR03MB202; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR03MB202; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB202;
	4:m7OW51vB0jGnoOlgBntFfUVFm0a4f5FQ/BEbaHRxD5R4E1tGLaBTOrhR/k+1tuj79P6om0jUqIwbFlDIG2lAIzoPF132BHWuWBulGgcIyYyi9Ewzud0Cqzl6pQqJdORtWbbG0HG4OqVWiLFbGZ8afpkVbrXn6HHu34PQKNJ5R3sPfku4lsaj0GJ9DszIMoXURsKEU+SMbRpqOAtKUotxPvxffoJWnCFeqTmIv0i6hE6kUOaA24SlhjW18ieLMsRHmZzPsZPtI7ecrsoGyQqPl9FhPbOMpqCjgo5cXDr/sAnX7QJi36DNapPA6idIc+8gryYpnH7oZZtjnv9q2kMbMV0RtS7z7U1wos3v/PCneoJXHvJQDMx0Y9eImDgIqaqKefpvkQiSrtvxq5HOomqcZQFpSvKHlv6oxa0BtdT9nqgmd8O6TSIXV75dKle3tW6wl0ZspRUbsXsDV2oVlRKdv2p7P8In9i+WrpXkecKr47F8dJuvhCqoUsOe5d/x7bqfxR5SGlrnc0IUHyUuEbhL1g==
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB202;
	23:rQ7xCiAYMpw64gSRdMYAXGp0gKeDxWmci33HkiTnXc?=
	=?us-ascii?Q?V9OYypPVeqBNzYpslMLyCw3oi2lkWW1NQcWUMs6XdyorC7g+NoCSXRLIQJ9h?=
	=?us-ascii?Q?AodRQX+Yh3xULBpRCpQsTuInZwoPC5OqQcoDKvl+mHE/wQBZFM5klkjKkI4Q?=
	=?us-ascii?Q?kvdnL2AimLX4ZL7nwFa+2EJFSzQRZ0NT/G2lr30fgmKRc4zr0nGHJrK+j1Uh?=
	=?us-ascii?Q?euZwOUkvktVUMvKML8sieFcuh/1SPvTgzZXYs6/GwUG6d8F5FtQ1rSIyeild?=
	=?us-ascii?Q?iMpzJndjyxrErrWYT+hmemI/e9jIqwetswA2dYNLokQKGpiQGiryPdJM1FtH?=
	=?us-ascii?Q?wHVGFQ6ABQdQop2Cfo8wnTvLSS3U7HaqCQSjtHGTOxG9vwWZc3+t3B3yL7PS?=
	=?us-ascii?Q?7YHgoYq02Zzx2BUEj1Awpusf+swQisvRoMlY0Pvp1jhbZ7JGLm8hTNvoC5dv?=
	=?us-ascii?Q?fb4MZfXwZOuuxpE+Q1KC9ZUEWHwqcYCIvfKR3zbWJrmJk6j3QkJQJYSY+r/F?=
	=?us-ascii?Q?r9CKA95sw8u7KzsL1lJdGZdg7Zejkdoiwtse64tFFFh2+PnuMBFKlwXmVRmg?=
	=?us-ascii?Q?6bequsxZqcKYW3aFOKqhSHlmPvpNOZhqjxd8xHWA8hRL7aSHYMf995UGtac+?=
	=?us-ascii?Q?wT/0UdUDt4D+bHeeGQITqaK/G/R6PtLSz0cjuMmimGXy08z5Tm6YmBN9Rk1k?=
	=?us-ascii?Q?Qkvmo/hGUdjfOAGdt2xqRCLKEh+F2+gHxEvXsvLOuF13g29IeH+aMoXmX4dl?=
	=?us-ascii?Q?l1aXVKF+W+T9xLVBNHyIIFWkBxveJzUwHV7BIaHj0WoAmklzLyt60pl1+yfW?=
	=?us-ascii?Q?KZX0k0t03SN9RU74dIr4lyoSq0WPtX5eORCWpxw4tBh8KuVMm+H8dq1m3o4T?=
	=?us-ascii?Q?Rsvr72CTBvIXlMxnpdqoihlIGvK3o7h0Jx43FhAVPcKxHgKmMBggQ5QDIR44?=
	=?us-ascii?Q?/oVeJmchZSTI8sT8uq5880vicqlykQH7q/scMK+e45DGpPFyVU7DmNUEHZ9t?=
	=?us-ascii?Q?wQpj8XDmO8v8gB9l58pUU6zab8lX3OqbDxJKSKyMqcRUpd0c7rgysPj2xDVP?=
	=?us-ascii?Q?zUItTdrMeFd7vVnT4dmVjMY3tul7u9OW3VC2PKuZZG1UA66A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB202;
	5:qEzdLAyahWh35OVqS/uhn/GQOPHPXRl8Chu/FszfP86OyO3MgTJKfQrD+EwxkghWvKH6sOusi8EAo1N0x8IQEw0AIGnrrDAyCbphKhyzgOXUZEL2+uT/vc3cql2wNIh2Yg5NSkG7x0Zx/XiQbVefLBMMX36+yv92XmT4ThRyg7Q=;
	24:1Wx9mAWDksG9nUe0geXyDFHdJ336b+1eJy5r67c0ykPrmUl08XlDN0OMIxoZaDoI02Zd/xmuXq9htzVw8WSMV2hP06PiOvUkPyjhr6IgGyQ=;
	7:PTEuEElZBFMTJ5I7jQXLl0smxJht4+lvCTtcAfaGFEeT9sAqnNjptVrjaTqRxqui7IlBt2kttV8S3BMmlwX4n56M7lw7WOoVifjpgiWNAVzswe0MkPE6f6Y33gF3wGYdC/fuOJIVmXoqMOulD3XZjP7etR6XtbZB3pKKPKwaKQaKsh31360+x1rjQFwmT0lW
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2016 12:26:27.9429 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB202
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.73
X-Mailman-Approved-At: Thu, 02 Jun 2016 10:10:02 -0400
Subject: [Qemu-arm] [PATCH 1/2] device_tree: introduce
 qemu_fdt_node_path_prop
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f62HhqdQ91Pa

This new helper routine returns a NULL terminated array of
node paths matching a property and, optionally, a name.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
---
 device_tree.c                | 59 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/device_tree.h | 20 +++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index ccba1fd..85c81cc 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -281,6 +281,65 @@ char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
     return path_array;
 }
 
+char **qemu_fdt_node_path_prop(void *fdt, const char *name,
+       const char *pname, const void *pval, int plen, Error **errp)
+{
+    int offset, len, ret;
+    const char *iter_name;
+    unsigned int path_len = 16, n = 0;
+    GSList *path_list = NULL, *iter;
+    char **path_array;
+
+    for (offset = fdt_node_offset_by_prop_value(fdt, 0, pname, pval, plen);
+    offset >= 0;
+    offset = fdt_node_offset_by_prop_value(fdt, offset, pname, pval, plen)) {
+
+        iter_name = fdt_get_name(fdt, offset, &len);
+
+        if (!iter_name) {
+            continue;
+        }
+
+        /* if the node doesn't match the name, move on */
+        if (name && strncmp(iter_name, name, strlen(name))) {
+            continue;
+        }
+
+        char *path;
+
+        path = g_malloc(path_len);
+        while ((ret = fdt_get_path(fdt, offset, path, path_len)) ==
+                    -FDT_ERR_NOSPACE) {
+            path_len += 16;
+            path = g_realloc(path, path_len);
+        }
+
+        path_list = g_slist_prepend(path_list, path);
+        n++;
+    }
+
+    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
+        error_setg(errp, "%s: abort parsing dt for %s/%s: %s",
+                   __func__, name, pname, fdt_strerror(offset));
+        for (iter = path_list; iter; iter = iter->next) {
+            g_free(iter->data);
+        }
+        g_slist_free(path_list);
+        return NULL;
+    }
+
+    path_array = g_new(char *, n + 1);
+    path_array[n--] = NULL;
+
+    for (iter = path_list; iter; iter = iter->next) {
+        path_array[n--] = iter->data;
+    }
+
+    g_slist_free(path_list);
+
+    return path_array;
+}
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size)
 {
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 705650a..03c8193 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -43,6 +43,26 @@ void *load_device_tree_from_sysfs(void);
 char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
                           Error **errp);
 
+/**
+ * qemu_fdt_node_path_property: return the paths of nodes matching a given
+ * property and, optionally, a name string
+ * @fdt: pointer to the dt blob
+ * @name: node name (can be NULL) - if NULL, will return all nodes mathing prop
+ * @propname: property name
+ * @propvalue: property value (can be NULL)
+ * @proplen: property length (can be 0)
+ * @errp: handle to an error object
+ *
+ * returns a newly allocated NULL-terminated array of node paths.
+ * Use g_strfreev() to free it. If one or more nodes were found, the
+ * array contains the path of each node and the last element equals to
+ * NULL. If there is no error but no matching node was found, the
+ * returned array contains a single element equal to NULL. If an error
+ * was encountered when parsing the blob, the function returns NULL
+ */
+char **qemu_fdt_node_path_prop(void *fdt, const char *name,
+    const char *propname, const void *propvalue, int proplen, Error **errp);
+
 int qemu_fdt_setprop(void *fdt, const char *node_path,
                      const char *property, const void *val, int size);
 int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
-- 
1.9.1

