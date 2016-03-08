Received: by 10.25.208.211 with SMTP id h202csp2131928lfg;
        Tue, 8 Mar 2016 12:06:52 -0800 (PST)
X-Received: by 10.55.192.154 with SMTP id v26mr24976543qkv.36.1457467612009;
        Tue, 08 Mar 2016 12:06:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si4597488qkw.52.2016.03.08.12.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 12:06:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adNu7-0005Bj-D2
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 15:06:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt7-0003ol-D6
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt2-0004G7-HM
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:49 -0500
Received: from mail-bn1bon0131.outbound.protection.outlook.com
	([157.56.111.131]:1638
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adNt2-0004Ez-EK; Tue, 08 Mar 2016 15:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0NDp1xNE10gm3XgWdqpbr7ySVY8sPS7Dr78hfwPvn7M=;
	b=gpF1xXBOD97j1bEn9cZ7Jpf2gEiyFbyc4694AqTtq8N6N5iSpDOmM1eEv/ST1NfIphbQzUE9f73eRGjgk78CSQY55nQ6KynGxiYSsuoJVpugtoKkl8WAABdG1sjLv0t0tj8qN0jlquGteG8K7/zjEvy5Hz+wCasyscvBxPtWtZE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8::5f2)
	by BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 20:05:42 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 8 Mar 2016 12:05:22 -0800
Message-ID: <1457467526-8840-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8::5f2]
X-ClientProxiedBy: BY1PR10CA0031.namprd10.prod.outlook.com (25.160.197.41) To
	BLUPR0301MB2036.namprd03.prod.outlook.com (25.164.22.26)
X-MS-Office365-Filtering-Correlation-Id: 00111637-2696-4f9c-17ba-08d3478d077b
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	2:jl0zdIMMuylMy2Pqadk8x9Cr+5TOFZIPE65tJSVFyaiTuO9i26MMKqws8RJxncyCphQ8VbDwf9P4syHtxXXvdpOTUd/g8Q3NmHleveSgtABzvs8dAPBcENsXwl1RXrM0J9QOC6KNEE2cNtEK+mcbyf9WyIwKNIZG6rl7aLCehIGNm7JnonTyN8cXFDp7gO6a;
	3:e+1MbbwUxcxTSGxYOH77YKPjvru77WLb7L8DqDGgrPzJDA7TLU3iViL1hXXcM+JpanI5AmrcY1ug2wbJgtZviPlaQlhsRRtoC9UHHS4Lhbwzncr3Ro6HzE7cQnOW6mFB;
	25:npFBINL6j6Nn1XbsN1VYq9mOvaTTAkVCVxzvIY7b2HdNDiEfso++8psIGrRSMx7rXfrDJ2bO5PUHOyo+pbmw42gyOwyq6zPbTAQVvaYYASRXINeSBD4gNXIup/qcgw4YNi7394jl5smpP5QjardftbhOH4buGAySquVwrte26Ah2QsHvDJilyEDljbCXzD7FRGUJ8deXw9/PshuLcyzyVksj/UC/zg59JMlaTZeV/+SA3rMcV0072phSg1GcGNhYyYPcJp+7YxIsIO6dmQKanAYirA+t1Yo9Y25DOHk+W1tg2N3A5MWrjhuWOQVrHlsV4/DtvJQJBJbSG9G0yDeEgg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	20:10MSmceIxxTXd9z4M1fRGBH2bodwPRSGAQ2iRjLU2I1w6CGuLKzJg6WazL0vMa/xuFnPDCUZliKt5AFPr5+VSF3DtQWfdK/HMVFGW9db7q2o1Fmeyd7zqoXnbSsh7JvqAs6cWD4Nk2H9s6Kr9Goiz4V71uK0+7LSKdcPs1M5DrARpsrVuqD2d/RvDMEEBGF4nghBWs6QMkDbkfa4maOzmXo3KhrPIr6ODAVtUBWljomFOkSVWocWmIFqsr+zoHRteuFSbvjH7nob659mlSc+mOiLGW4bVdZqBGfkcHWxLxgL2VU5W2ENFx+HRNIzWx9hUYX6NwKaNI5rcPtiCUQ/WWwWD7yvWwPWy2IKRC8icCRQl9+3cORuDA9fEXtb14XILAD7oqoDaI1MVwIcH5nsOq0jIunoPmo7P9jMJAiIWzL0Hk0msTZUGfwkuDABZGE6iig+en9hmyJOKwJz3t3RCWzxDrh+tXx8MeBrsj+XXXHOEYL5/G7sS9JPWcZXCti6;
	4:pSsELSk9dd/JBac/CkIlxT/KG5U1a3MrdOBTff5r/IYrhxcH9LExu0gC9LNd/iOUPJKZkhUioUND/q5EPwhkbooDGdsod5vrYAQQnQVGdJ2Abl4FRFlw7vuZX/KYWgM1g3r6fCHNyuIx5GFvP787DNQ0Jj3znFhFsIsGwWTf+5QuFVFfINymvqC1CYLLKIjhQ6jN/c901yYKOLa/WvevDCBZzpyQmrR/t66FxZedRTa9We5Y4Ei2jyxodPhI/cPNOm16usiZeN9P7p/UUWsoY//Gn7XFwRb+BWAKc7cWq+30eODltFq5k9fzlzMBBpbigjs82DAiXg4Bg08H+xf4iYnV+ic9hJg5WlcDXe7Kj5/W8iI1P6Gj+g++ag4i867/
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203656A0C6D30313117CCDB19EB20@BLUPR0301MB2036.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
X-Forefront-PRVS: 08756AC3C8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(10290500002)(47776003)(5005710100001)(2950100001)(86362001)(189998001)(86612001)(5003940100001)(36756003)(10090500001)(19580395003)(42186005)(2906002)(6116002)(586003)(5008740100001)(4001430100002)(50986999)(76176999)(48376002)(92566002)(50466002)(77096005)(2351001)(229853001)(19580405001)(110136002)(107886002)(5004730100002)(81166005)(1096002)(4326007)(50226001)(15760500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2036;
	23:qHiSqj+7pgl5WC243n/piNixDdSASqjdcmrEm5G?=
	=?us-ascii?Q?vK3lyuju2I5hNpFFYeRQ2S1ulmjEYHi5fyQ8rpVK//xKumilRxLIXbRmSgy0?=
	=?us-ascii?Q?5Gq6IWKxqYQ+ahZJKFo602D42AuTrS4xt0cbt4UBFa2MYe+OWxd/EB2i86Zi?=
	=?us-ascii?Q?1ZOqQy+4Sxu9aKp2TI7zYxtiJs6z67TZg8+iqp+3l8QurSJlD1bCXUw5WeIe?=
	=?us-ascii?Q?thS65FoiRq2ekdgQcsP/LoHhpC69ieLAqPsvKSB3E6k5L1Ih5eACoBfxg7TB?=
	=?us-ascii?Q?cef5E+5Q19arZZbluiFe7Y6XUR8Dmpcxr6D4wt1/mRQp+SOanFlZ4zrymGu7?=
	=?us-ascii?Q?pnvtwB7OLGzMmCIzl0GoLhLhDnsWJC16ClMrqybkmvVfT7M1q1ieJNV+3Xd0?=
	=?us-ascii?Q?jACX5XiMr0U8yW24LqK8e5n025jixoDYL8NxeR45hKrKKt9fo4JMLRDar573?=
	=?us-ascii?Q?6GaBVZo7cLu8pLgykzT/wd+eYGMXitv2wcRHskAvknag1HOyX23u9mf6Ef1Z?=
	=?us-ascii?Q?d9ZOUOMrpithf5diWauar4oeyn+ks5HxTsI6Mye7alxUqvpeoq+Xw/5u37O/?=
	=?us-ascii?Q?uADgUXSN64L0+0DrT8fA5YvK4mBCUwBycAnWgpcZORkOSMxjyiny1vwuRq+m?=
	=?us-ascii?Q?D+QOtSu5Ve2DrNpOFNDVsuIBC5V5QfjDbQO6sT/n3JzkT/+lkyx9t05WEOyZ?=
	=?us-ascii?Q?frxbXkwvzOB7HLpNEhaHpRGbbixshxRyjAkF25o/Hwenx7urQw1EoeP+ENel?=
	=?us-ascii?Q?4YKgUA75DxOoUvjjvKugbeicqtDhP56nEEVbaQdEWRU+f3QdA3xOLzd9yjMF?=
	=?us-ascii?Q?S9SQ+wmuoUpNAA39kKGz7qXtPksEwM3B1k1FYE4nWmEGAu4/3v1QDZj5XBhY?=
	=?us-ascii?Q?L5ypCNrmAMb3p0ywgXI6rnhzFcqqUuTMaMiXnBmX0LPDRB0EJuJYnH8SmPtK?=
	=?us-ascii?Q?OHEG4/p7AZTgxVucF1EUyzvSF5I2g6qCxKr4bok3vrihA3eMip+HCGFLyg9m?=
	=?us-ascii?Q?cQ0p/aD9gXeqvgJnkoV42MEu6?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	5:AI6DeYauHl5WmuSUqxqaeiTTtt+YSLloITXgROIBcHH0JQl3aMo8+qg5aKeYqHy5W1IGD+pOX5RwwV3uPz5s15SMAZVSm8FnxdxGmiS+et0NeSSXtmj/r6Inajgl8zDGZMsgrg+2MWT0eCBGNbJT0Q==;
	24:4HpF2Y9h+kjj014SdSNISMdvh3svtfy5u9wOKhZg+ATmIDIFbTyJuKDBY52k9Pi+M+glbXKa5PZy6xvmV5bv1Nbon1DRFBhlPKwvVcjBxr4=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2016 20:05:42.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.131
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 1/5] bcm2835_peripherals: enable sdhci
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
X-TUID: 71jcfY1mZ5yU

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
2.7.0

