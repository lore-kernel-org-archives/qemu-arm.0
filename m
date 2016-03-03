Received: by 10.25.208.211 with SMTP id h202csp13091lfg;
        Thu, 3 Mar 2016 10:25:48 -0800 (PST)
X-Received: by 10.55.74.141 with SMTP id x135mr4881901qka.20.1457029548050;
        Thu, 03 Mar 2016 10:25:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z69si6216923qgd.9.2016.03.03.10.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:25:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abXwZ-0004oL-Ef
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:25:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvl-0003pl-Q5
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:24:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvh-0007Yz-5v
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:24:57 -0500
Received: from mail-by2on0131.outbound.protection.outlook.com
	([207.46.100.131]:35372
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abXvg-0007YX-Vj; Thu, 03 Mar 2016 13:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MbzuKiQ4iYNIK8y+NseEQ95K4eLx98a3eQZ7FtRHBr8=;
	b=CaxK95JyctUhaWxEN/R6aEq3a9gvseiQE0k3+K11n3Ed3kZZWnKEegPW3hJNV5/F3bMkgdoqezEEn0afLBlmqW/1hvmyMZXTgFbFTZjprYENFwWC5LXIOZ7hOR6kiFtPQctTU+DNF5zJ2sJpfPszWUpDBS3ju0TNc9VkAb8CXQI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by CY1PR0301MB2042.namprd03.prod.outlook.com (10.164.2.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Thu, 3 Mar 2016 18:24:50 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 10:24:35 -0800
Message-ID: <1457029479-11312-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CO2PR20CA0017.namprd20.prod.outlook.com (25.163.96.27) To
	CY1PR0301MB2042.namprd03.prod.outlook.com (25.164.2.24)
X-MS-Office365-Filtering-Correlation-Id: a4767377-7f98-4fb9-653a-08d343911c0b
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	2:MaPTr+WxQK/b7E2IjeiixuVumHL9sqK1Rr3WXxsaDPtQZUL5BexLh9Gt5IHw5yutIiJCcGjPpws1qQpdu01tWoXYwvx1RT1ozKVOIW1q3RrRUHE9eJAeUjRwRhZadLItOx72m6lJ26SmmYwPppeJbFPFVrZdo5M7FToM2NMXz8a8j92A2VSEjVNKQUbmIXMR;
	3:+VYZvlGSezKRAmjGnFKLM6+cgkOFMakWlnuL5MWpeQth3NvcEBkOUxCLGyBdcJ+pRkAH2utQj4k2FxgAljsh7LmRICmUjNgEHU0HRczHnYGPpss56lnC1A76C9929VgQ;
	25:BKCp4Zctr5CErQXt9sEgMYWgOyha31upmzqz6WPeZOr5rd+gWdRM05+Snkjwy5rr4TlBrWPFRLxAqFSUdZZqC2IGOZlMKBnxQbQQJsuJjp3Guy4KsUuuOVKYbPA617m/ikRPy1yp+gN2GRi/lmiCu2/2uued5iQyZ6B9y6gcebfjvYiZnSBPsiW+8lEeTvrKrjl7stYCMiSUzrZ6UAeAzG8ssLlQ+b88wFAT8fMH1LoHGF7o78mypL+Dkp5yn+c5NLGxBBt6C4Aw4dHwM6MkJL6xAXBASD1GPaE+XL3PoJPPtBlh1LIpJkNNmguONeA24cswG2iSeJnW0UrHY3YRdQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2042;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	20:lReD+yCfNKT2GZdbIDQT1K6qIXyRx/EWAibSWMKnxytCsouAK/BTJaN1b9w3+aigSP0e/MCLhohGTyA9JwDDab7agx/3ywr7KV//4ymbjHJDHEfGTPGv6B8mTYJ5HcW6YtcyaPvOenJ4+ZZg/nAn/7/pX0V4O5fI88VMFtv3BJnREdij2XohZQvjrYWfwZIIUI2M0kYafeqpWkXIn4wpZVoZbARN+IuFOrlTM0Z3JD9Oa2jI6hBUWzc2Zh+hT7aIM3yf+8k78ojibf2DnXeArCbP8ZxdOFe/aL6IyXFgvmcTxRcpP47Tf+LggMrNM4GZjJ+obhfIgqkMjixXvgv+uh8dlXe0ZvQi5DyAnm/8qOB4FEncQQF7xY+CFZnSH4c31er05xGbtbRJ6gPI0K7y7ZQ+NSEaiEuFaEff0zZzBqV4/q8y/xwioLBXcsEDzIE02G1XNdBgxZ/YRZkl/AupvnXA2p6oRmJwEcJmpc0CJIR+hGEfOj+SR1y2xjwPNoKb;
	4:qO6+8plqKxGZwZHihWfzj9+XTyltsWz5vAAqnfttTEglyT3r5k2NP0HPOt+shAJHwACA6zUyMF9a34XfYnFtUIfjJfwv+a1AtqVNPEDCwfF1nWWGUA+/utLCOGrFCr1nKwf/2rRWr3ZAD3Tq9LfAhYzjNXjR5+hd36Bxbrg9DZaxf82hgJgZzamESTCJmL1VlydzK/xG8U0s6v2Nu1+kmapoFuo9Iu+bjSGSGOjUGwKs1uRoUoYsnanlHQwXgcA90AjMYHrAL6x9L0J65Y8+PSXw429iwTZcMwTtM96emb/moxJPLNcb5bvT0yqmlWuurPM3sdSIVzQCp/wDHvq4ZTkiBU6JP+Vkak8FvT3nDGdRg7sUF8nm1+Q5NU4nRpUJ
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2042166EF50CA2554CE541839EBD0@CY1PR0301MB2042.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2042; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2042; 
X-Forefront-PRVS: 0870212862
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(2351001)(50986999)(4326007)(76176999)(1096002)(2906002)(5005710100001)(87976001)(10290500002)(40100003)(36756003)(4001430100002)(6116002)(47776003)(586003)(122386002)(42186005)(92566002)(86612001)(19580395003)(77096005)(10090500001)(5003940100001)(86362001)(19580405001)(189998001)(2950100001)(50226001)(229853001)(48376002)(5008740100001)(110136002)(50466002)(5004730100002)(107886002)(81166005)(15760500001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2042;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2042;
	23:9p+3evTMYODD4tD/vMLqzjSJZXvU7cnjFnm8W8e?=
	=?us-ascii?Q?laTq3wgbYTl2rJjZlOAbm0YnXNtJb5x7JmE95acT+n0LeMTenhiEZhwDbMMp?=
	=?us-ascii?Q?r5Lwq1bEoMb7bYe445TydhrMJKYtoLH2TgoQdVdUC6LPAUmE+yyC1Nt9vAje?=
	=?us-ascii?Q?LlhFJ2J1Lhi1yGO0FKW5qj541M/5TXyPwn06gZ7rD7+jDP+XRqrGUp+PS8OD?=
	=?us-ascii?Q?dN7xaLcUI6W70zMbBTfsLt6gZcxtXVS1tvpG/eX3L4rnt27TlPwISNcIOmBt?=
	=?us-ascii?Q?t/66AVTxR49NigaNUUWqtxuXtIQGspGp1m6ldsfE+1nuAOx0SWWnjv0dRgv2?=
	=?us-ascii?Q?KT+aQeIgdHuDx63TpDBCZxGg+EKuX0sBSOlx6Pn0XdK72Ixm/TqAjrifYTpR?=
	=?us-ascii?Q?yrRsPFQeeeKeVpcRjxi0vTtWihQis55TrSqnygiQMVM2um+3YvJ+jl0YGij0?=
	=?us-ascii?Q?Gixqh3GZkJ+Q4eoW6CFVg/O/ABJHilwnmgslNniJ7AVQY3hQ4omTJOEvaDuZ?=
	=?us-ascii?Q?o9aiTiuXoWJ5Q8rvg/JM20tkBvIi12YHsUep3l/NpPvGWnPVbHNQ762WiokM?=
	=?us-ascii?Q?/LPRhY8C6L2ssqC+0B+3bn/6RyrkkvdzSmmvf5Q2/RYr5YN/LxFMfJ38eVWa?=
	=?us-ascii?Q?E/jO+F6mKpAjAoa9YIEmhySxJe8Jeo16/vK7TZxHhXLc9JnaaoDlZeE6BT4E?=
	=?us-ascii?Q?CutWDUWgeeH435nkm03c3ZG2Z6j2xJDMp2/SPtvB53WP2UupnF279qsrCGb5?=
	=?us-ascii?Q?EVl+77QVJarzjksSt+iw6unCL/UGGFDD1DGNnbbsVj1spHDeaEac3ZVwtxV2?=
	=?us-ascii?Q?nkyb5zMWwdgdblmIw9QhkLelkBarwElss4eaRTEO02LYBG5OCpoAsFGlud79?=
	=?us-ascii?Q?qoxTddazTHwkuE/SinzVm00rV3LgoAwY+Lez3Uujz8nGPoS/gXf/Vw+BoVTA?=
	=?us-ascii?Q?Rki4MYpgTZgBiuikU6WkZikzQ2SDajbZDiDVrbHzX2sV/aKfWRT33L4nknQ2?=
	=?us-ascii?Q?FB0zSG38HYq+eDghKnmr7P5/TRsXp8g9Kub6L1UsytMYYu0nOzingobTfDwM?=
	=?us-ascii?Q?w34BnBMIsRSHLTt9Jn1W1YgM+LwsU/KVqM9mmjYhfVHanIYr95Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	5:8sluv2qazTl81plQYrWx71h3qRPFxGMdEYEhpqxe8EzMUvUDC3jDYAMDFdAl/AJFIKtiMlv6iX+++rC6miZ9d30VrOSrbqrbT7sAJq19pGirmVU9iJccoNpLOYoruOO33Una8sSwldie75YwsrjTDA==;
	24:BiWvVk3DzKKCNDp33M97BMg8Tvdhk/TRJIWKJ45ar4YT2F4BBn3npyOvw4wDPBkS2Uktmi4dgsQ+dHQ9FgsYHYBCPUjnib1FL6vPg++Nm2U=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2016 18:24:50.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.131
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 1/5] bcm2835_peripherals: enable sdhci
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
X-TUID: wMGuHFly+hUv

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

