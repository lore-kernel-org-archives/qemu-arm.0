Received: by 10.25.208.211 with SMTP id h202csp88416lfg;
        Fri, 26 Feb 2016 16:21:09 -0800 (PST)
X-Received: by 10.140.231.80 with SMTP id b77mr6014300qhc.56.1456532469532;
        Fri, 26 Feb 2016 16:21:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f81si15610643qkb.82.2016.02.26.16.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 16:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZSdA-0000P8-M0
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 19:21:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScJ-0007pz-EY
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScE-0001QQ-IA
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:15 -0500
Received: from mail-bn1on0115.outbound.protection.outlook.com
	([157.56.110.115]:58784
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZScE-0001QD-DE; Fri, 26 Feb 2016 19:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NX+DmrEnLPBLKlrChwGeNcf6qbfWKQHURE3YAp1WzGo=;
	b=e0zMWT5IwCGa8rESSk39s5hghK2opDLLB3srVpw0t30BnUiCVL/bT4AMmDrogyCJB7lZIwv6OR/JTaOXf3ESVaBAisSnwMcObAF8IZOpRd2rhWdpybqmXzzsYAd/xszJLGpJHNgFlLAkkaDeu/XIPOThy8XH3ne19foDhbFgJIc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:f::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.409.15; Sat, 27 Feb 2016 00:20:08 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 16:16:11 -0800
Message-ID: <1456532174-17432-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:f::724]
X-ClientProxiedBy: CO2PR20CA0016.namprd20.prod.outlook.com (25.163.96.26) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-MS-Office365-Filtering-Correlation-Id: 036159b4-c56e-40a7-bbe8-08d33f0bc015
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:BR90s/8bcjyUsiFgq8bilVFXAO2qZHrzhq5o/q/FtFIgDyRQk8QyKhD+jIYgm3xWFDLAEjcnjeOTNYR5bA8zJbQsmsB8VW5NewsbbucyMp3uz8wuNZpt9GBf5Tlo07Ftnw5nYyyiXmpvsYR/6hsJ2Nz7xqt86k94kyc+sknWmmZcLfL+drHXftYbnvIwoFCi;
	3:wg9RGTMSSo39c3c67abl+smb1gH4ejC6H7Zz9qZ7q5Ue+X/uNMRab01OQxmdlAfyPODA+TKXbcvexRaITSP+bedyIrDAHx7xm+qkDUZA5DsArjfHOngqc11aIQ6qA8ec;
	25:erJHqneynVKuwZWpxeRfyGV2OgZhQ/Zh5OPdvMgLYjUjIOyJXrtpF72vzUPzQRdlh/hnf+OANyjFM+GXsLOANFgBCZVDE/KtL3BHOfvHLQRKq7umbbNVW1alL4Zq0uR4bqRzNsZy0GX60vnK0/zI9xsoVa0LspRCbbZXfg4LkFPSFTFqVZg6egMnLY2hHkypGVj86pfzbF4K/LkRWBRTmCOG9/iaCu/+IU6eIpdBWSDCeM6nQe/MniAGmmM6PEBC/bLmHBAuENxltV/1iztj//uS/Xyu+eaVUf2+FKL4FX/DD2HO19BzsJ1MwiN8tQ0vDgvm3MDGWpCLM/LyYozRoA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:GLDgjNujlC7AgNyAOcm1veXlKEzWCfPRcEpKdWcm7Kz01vlCMs7BfEN/aIyhTwmsaCa6pNviki/8tOJwZh/9B6CW2xjY0zcCNSNb3WB2tcczQK5Gb7saZqkJdIN45laVW3ZhmC+1vEVKBgjZ6cauayPQHiMmLeu5AjZO9nfQHfYa9Edq4xQMKPE6ESvbMPut6ZXXAT1Cl3xWg0wmGDGkr1yx2AHSSDdc6q3NCGxWuemr6BZgmo5KPnkx/QN4DQKdxV25cI1DcdUeoAbSzGKVdG3/6l3xRHXsy80urL22WrztSmdZYZUKE4lOflnp9Pu+tRCOEJtiuaHk0lwaY5wkS9nNOSvgjb3yr67SsOwCd1miYSt0eK0yEuhAQs0weMb898rsoxI7sep3fEX7vRShqGUWLMkax1mxicRwfKOQfDtKUfV6GSIxLajm2g9cXbUtzW3XceXfvJDYhAzgHPhtJvZGZauMoeiYgpBMAMN7jfBdrh6+RLL+Yzj0YmbAqH1M;
	4:X7V+2kEeiD5qzzWpIrpsuLlgQF/Zz3AaEPDWLbKVvui1YAT2PA2+X/4KpswiM3Jb34RN0I66HTtjBufmCb7qE99EPgXDCA/XbcGGUeAp/IoiF7fKJn8rYV0ZuwL7hjdp3yYMYTRdK6M+byYSxW1JxtriPBwHypqA13wVCpxpux72yjQVwgNU5Z8hSyNBis42WwKUhRahIPL8Lhu4iSUO3qHq1BFTIG7Z01CAJ/8q9+u3az4vwpWGycEsx68l2tzaYD5Wupqhjdg7Bo+tMzIZgTpouacxTis13yZhybR93uZXuU6VPFbdtRsOUzbj1Tk5v+OD9ZBtxCi9knVhZkTUq+MYuYjf8tCP0yipq9ggthRPQIS6v1Z/ZxfWV1Nni7v3
X-Microsoft-Antispam-PRVS: <SN1PR0301MB20460FD6EC5626278C9B21D49EB80@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 086597191B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(36756003)(122386002)(87976001)(5003940100001)(10090500001)(86612001)(50226001)(40100003)(50986999)(86362001)(76176999)(189998001)(4326007)(47776003)(5005710100001)(10290500002)(5008740100001)(4001430100002)(92566002)(2351001)(6116002)(229853001)(586003)(1096002)(42186005)(110136002)(19580405001)(50466002)(77096005)(2950100001)(2906002)(107886002)(19580395003)(5001960100002)(48376002)(15760500001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:QU9LBgzwq36+CL+fUwpq9BBwZJF9ohXJ9CzRJh8?=
	=?us-ascii?Q?iN+DUNWBXfVWb02jyd+lhw/KkyakyYvaCTPViSuXzsRi56RRCuXvpaDuuUAy?=
	=?us-ascii?Q?a21rS4f8NdQ2BRKFeAyLY91HNyo+07gn+dCMInJUBs/h9SwThp0X6DVJaiN6?=
	=?us-ascii?Q?gGDHV9MaEb4JQtpMJUSvSX+jqDDIyrM+txcQpKuM8StTxo4cD2x/mRLTL+e7?=
	=?us-ascii?Q?b82fNCl+g/TLlEVm2W+w8j6mLDwckpM5IWwOGgwAqVoHvNBYSodTpEPKpNit?=
	=?us-ascii?Q?dQBlFcLpjwGvDROX0dd+R4P0V5LjGPbFiBrwo+51i/utexYc3m5muHO0rhIU?=
	=?us-ascii?Q?WcwYDzu9gRM7uk5zXXeJOz95QBJGolmuoKKUv5+Aqk+YG2estcySQuMuDWCG?=
	=?us-ascii?Q?M1AZOS+EJ/f9WLQvu4iEVLEweInzm4hhewukycqjzu2BsQe3ThelyYhn2ctW?=
	=?us-ascii?Q?z19c33yTkNnWRNBh6EpGPMt3hZ7v2nqy9urVqUCW0w769cLI5eJT18/IHrAj?=
	=?us-ascii?Q?pRd+sfRuNPZMOsDt2L3z20+9vbjlxa3/qKGanOvoCODRX+j5WktrorLG7dOw?=
	=?us-ascii?Q?UbKB8824qxeye4/UZjLGDNp5b/DVCNnsLy1QKHnAxVRKDMB3jQGnLHpMpqYC?=
	=?us-ascii?Q?MWIKQ2Vd1BFc0G+N/ZvzMY6rocm1/l6KQAgMEVaIjd+B+ZWzcE3jsgkhdWUZ?=
	=?us-ascii?Q?JQxO25cAXaOJkh5MfR6h2dGhFL4ozAgrOt3Yw0G1XozOb/TlTAAKn0JzV0w8?=
	=?us-ascii?Q?IETwo2t671y5UPoThdi9uUYH39xbAcWi7VlGxuLpZMq5pz2Wgig4Y3QZUb9o?=
	=?us-ascii?Q?yykAyNQO7XmJ/+WM+LCOTbFKuHejD2oKzI/3HMuy3YwdZZvcTRXec7PvwN6D?=
	=?us-ascii?Q?g/PVPGchlXCLN3oXsPyA4J1PaovrukED+PbkkJKD1qJJuDW7chRNuaQ988yu?=
	=?us-ascii?Q?XKHA8ao0ypboOIx9WSt894fIsR5YhKsYgGQVgnrRvdh5hMUOAbKASwipD0wb?=
	=?us-ascii?Q?JQ/W15mcYB1XVN7nKNJfeH3X4ulmKuCDd+pQJP2BwVAY213O0G84BymOkpPT?=
	=?us-ascii?Q?6g5m9skE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:jS8/Hl7YGWQed5/sbtP58NwUMFXeBoIBu0+5wEVHkQho3XkI+Dtwpx+/egctfIBQxTxW0s2YIhKuqLeGn0FPGxILp0x11uaLwXZC2c4wOInWic49Zy8j8bAZuRZFDsbZFYmJpqd/foaWT4bJQd4Tng==;
	24:4qkSary7GOw1ETUjZEpT7QFGM0YCIRaPSMemusmxyblFQqP6RekfJAVkm331IfxHYP5v+vOLQH9pqA5E+6DgmTFRDR6wpTMD84yz263LI7o=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2016 00:20:08.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.115
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 1/4] bcm2835_peripherals: enable sdhci
	pending-insert quirk for raspberry pi
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wEyABia4cga6

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/bcm2835_peripherals.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6d66fa0..6ce9cd1 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -171,6 +171,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.5.3

