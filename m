Received: by 10.25.87.130 with SMTP id l124csp474488lfb;
        Tue, 6 Sep 2016 01:38:29 -0700 (PDT)
X-Received: by 10.200.36.13 with SMTP id c13mr43529066qtc.45.1473151109901;
        Tue, 06 Sep 2016 01:38:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y31si10160739qtb.44.2016.09.06.01.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Sep 2016 01:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:59929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhBtl-0002fo-BE
	for alex.bennee@linaro.org; Tue, 06 Sep 2016 04:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bhBCS-00073J-TU
	for qemu-devel@nongnu.org; Tue, 06 Sep 2016 03:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bhBCN-0003Dq-4h
	for qemu-devel@nongnu.org; Tue, 06 Sep 2016 03:53:43 -0400
Received: from mail-db5eur01on0098.outbound.protection.outlook.com
	([104.47.2.98]:6464
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>)
	id 1bhBCM-0003Cn-NL; Tue, 06 Sep 2016 03:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rFmUVdq6/rzGFUlI9pbONJXRmN5yAyJJgL5oWsY3gfU=;
	b=NldfLQ1w9Z3KtqFCNQfybW0FBUY+DGFPRMhiDTArOuzlxcRmJQW5ldMnHc67FTM8fC+YdTbWW0G5EoyJAIecAYaZx9PiQbeInlS14c9riDNnrKts9BgqZTw+wZoOkOxLf80BQGOX7uyqsYnKzhjk62rEJ+eXLgfrIX5tiE3GLIY=
Received: from VI1PR07CA0043.eurprd07.prod.outlook.com (10.164.94.139) by
	HE1PR07MB1082.eurprd07.prod.outlook.com (10.163.177.144) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.21; Tue, 6 Sep 2016 07:21:02 +0000
Received: from DB3FFO11FD005.protection.gbl (2a01:111:f400:7e04::143) by
	VI1PR07CA0043.outlook.office365.com (2a01:111:e400:5967::11) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.609.9 via Frontend Transport; Tue, 6 Sep 2016 07:21:02 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.240)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.240 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.240; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.240) by
	DB3FFO11FD005.mail.protection.outlook.com (10.47.216.94) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.587.6 via Frontend Transport; Tue, 6 Sep 2016 07:21:02 +0000
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u867K6JK001485
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 6 Sep 2016 10:20:06 +0300
Received: from CNU418C7XK.nsn-intra.net ([10.154.155.123])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u867K5o2001412; Tue, 6 Sep 2016 10:20:05 +0300
X-HPESVCS-Source-Ip: 10.154.155.123
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 6 Sep 2016 09:19:06 +0200
Message-ID: <1473146346-27337-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.240; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(8936002)(77096005)(2351001)(305945005)(97736004)(5660300001)(19580405001)(110136002)(8676002)(48376002)(5003940100001)(8666005)(189998001)(36756003)(2906002)(81166006)(47776003)(19580395003)(50226002)(229853001)(626004)(33646002)(106466001)(92566002)(86362001)(11100500001)(86152002)(87936001)(50986999)(68736007)(53416004)(586003)(356003)(7846002)(16796002)(4326007)(50466002)(81156014)(2876002)(7059030);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR07MB1082;
	H:fihe3nok0734.emea.nsn-net.net; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD005;
	1:XoXVMX5KOZmHBepKAEJTs6/L7fEvGImb2kYDmb+Mav0IOiYUdPNtT+upjPwq/vCwOY04zDQ8Uyr9eI6hhJ/grMwFh5E0312+RykDnc8eMM7Ma9+fUhMTGMJYxNN82JSulOw00k/YyFBfbGNoRGgCLZ+eAZuPVPb4TRbKwR0pVllWPMzGlNBaUVkSTDkhh4ErzEhZuDGln1kWQL+aq+d11aqgDWXXMREWVv7fv7EB466vh8S00qsapI9rdGw67qfuNBn+j/wkOcfg7/YIVMzf6nsi32EoSM5gV9UPHEhfhTiS25fXvQziBcQlJMXLDBpdq4s6tsl0XxJSDV2bwajuKSV6duK3cPP/A3q5a0s/RRy1/xuZz8CeTvafy73pI7tob0es1k9SPAW5Kk7v9BC7TOcl1HQrLibfi1aAEX2XSdYPPsyfvz17dE/DvVakvecHaqun6lItoodS1cyGYaPJNVQGWenWgwOMAlqVygGra2yJKjajzSrL7QlBe+QIZoqWvXLY1pnQCV6gykJlHkL5ig==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3e7ed2d-b2f2-4f6e-c354-08d3d6265b93
X-Microsoft-Exchange-Diagnostics: 1; HE1PR07MB1082;
	2:KPASHjRh7mmnK9C3jc07Vhs3iO+n0DRszxeFG4HiKjDJ40dHYaXDUxe+qttH7ncR44rhq1Ti2Mz0xv0WUAPdrCzslErMGj5ws6nqkPxSvOsbsb9uLKMd8tFlC+Rh7SSn0yO6bYJbVat8tFHiTzg/OIaBAOuL3F/xOsiIFjBUL2hL8ZQkFCj6Uvq6klBnyBWJ;
	3:Q0tHOMmge6zUlkylTh8L3/E/QoxxIlpoJwfiZWMWy/43FbsG2bhmZzoTleEqdizo54HG6CEiLqeHBZA+zqNC7fSQaP066zEAAiXrzWzlNOA/IGCNC2IHZDCGL++k3KqThonjedoAQonZvjF7p9DSlRkKi4S8910R/Q5mJ6CCpvpvrCBvqOifjLd4pLaLFWf91YNb7PdCtcE2mHubAOGdCUwzW+V8llwM45ZN1ozJPW4508NmKL/2+glbF9jS56T2lro996EElaKtEmzF6G34oQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:HE1PR07MB1082; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR07MB1082;
	25:oQsxt1O8JRemKfiw4YVAgnaYilkMa9l5rPbr1tL5Qt+2J6qqOCsNCSzxboPRTQ7t2+nIki/kQ1Wetb4sxNdelsIh/4PidH/aqMLMDAY6AsZ9n1c8sjDAIbUygGGX75axy9bO+DwNYHUyug+wESaxeoM7l0waHJukuaBGqDbeQMSNLJlrYmTEzPRqidqfKzXZU/uSl0k4vSmPU2R/WwXM84S1dmH9Zl4gfXvS5b++24i27xdbLOcsmxnsd888TGbWyRH73Dcqu3DcefnAAkWX/of0RVeHFzbaoXNQgFRQIq2BCt4e+UTvXWNzEy+liBNWI1lAd7t4OQqYmyjXJBK5gYbqESKV/8Ap3WVkJEb/WuImcAlHwkpUB93zh0PjjxKp1pOfELN6y2FX5ZBhaxi1VHyJZCcADzY3PBiKELJSw8WOC/WfBNVFWcseZD06Q56rh9KQy4/nh63sVXU0SInPM/xgywlpNPYlrabWttn4crDGZU7RK6EQkRPyLOoyzEnj2izr/DmF8qBafrk7mcPj0sZEkRYUF+JR0kWQYguh09OKTWsjZ5QDeNjEIrz1DNbmkEEiuldgTExDrEEJE1UXpX1U1SHn10lHo+07uXQUqygjRnGkK+FFIpKRDOHRzYHOBYlRlkY7n0ZA+X+MevURxiGxtrI/P18O8OwgxubCPYeU8oItwoe4Mlp9UNxggnovYHBil89qk1JmnIGsyloKZktY3xMGb6OXlzYDtIuHFyo=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR07MB1082;
	31:3WSGqnscHDY3taWMxcG5/tVC/bNm9ez6xFAtPKwjDNmrqUgphC6HKXnvPsSx6pRwGgHrFd6+q1SmVbSiQCSWn1/Od4s5IUMLBvgQvqKpm75xsQKdaGKX46sNOhVf+1RnNYmmQaTlXyzbsPAO8OAm0H4zyp7eAO/DpizVdhxxSTihIENNjZtToX7IdTDHrbC2TnTUc052QnkKC9iplRYD6SaQe9Ch/supOFp+ny5oWmk=;
	20:n1y2FkoL1YBd1LYqAskoTDK/IbdC+ekq1AkzOBBdi3wbvawfFCt5Hl8scvyrntrHNG6v+/uqSb3NNpsgIF/+CZPJ14qOhmKRzHun6jC5zu4OdG3QCRGPBUfdFEynuzmrum+czx1MggcjBRwMqJxNdTnrRZ6l6U+ZXZpSDP2vz7KheKjYq06BgJu7KRgg+ftHxM1NBIjAiEe7VzuQbTH26QSPYB+aD6A/+zpcFGb6MQcGsinBW/sjrVD0mWueou4x7Oe2Tjng58XrU387DSgZeLAzYr4grsZtntjEK3zDjm+z/Qv/NoSVpm+pXcCE7ED+ZlqcNV1JR4jEyhFIgJ4FEsxXiUrl1/NUgGj7dG4fMJ04wQO/JRw+sRvvbEchMOu7C+6XJi682xjHiBBsAPmeQNMCN7ooiqRAgpDVB2vDpBnhHwTi4M3BLEupW2IQXrtC6AQg9ekN9epr9EVnuFKN/GBvu7DNZeMNVmmXLe3a38pUl3hy2LaFfvjJVfv7+A+TPHpgHZrnXwCnqj1baKYgs0gBVcd8QrOsbpTzN8+Ris1zWV0VWaUjjVNpbxkxClTtkGxJcvkFnngHXakiu8jsN/vD5eAYUIIJF9COpvLBmsQ=
X-Microsoft-Antispam-PRVS: <HE1PR07MB10827FE132A4CB9C2FEBD0E8FEF90@HE1PR07MB1082.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(3002001)(10201501046)(6055026);
	SRVR:HE1PR07MB1082; BCL:0; PCL:0; RULEID:; SRVR:HE1PR07MB1082; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR07MB1082;
	4:StttMqHvXX0Ro7EXd35NTBzWCYhSHNmSjuETZRpZJ061IaEaJdy4wHblSdHi4KBpt3K10mhWjLVlJ8G4UECOeY4sE4FasAuD8/bMwBEtbr5XEajHSZe6zG+aA9UMfPokOUjLg7eg6F6LVduSnOYhHb9FcyIMQ4Bh6LQDzvTBieindeflNRMUCR3WsQRYb29n0Jxnz6Da/knTpvFz8PmCtdXgjgv94si3ev1qyY45hERbGVsBxGg/anlGtolSft9U23+el9qQtCJNJu1G+w5B0yX3PK1S3O9HUQikdsnm3Aqvaw4dzMfL5POX+9J1nNEBPztnISxDNRdXpAFjSeU1KdlCdkbWdc+PvqZyNuUQfb50h1PAWInDoXqJTbnATZ8snriHAodA3uUz9XumGLLkZYZl07mPISUmARkv3p+xS+nTYHO6t/G7fq+lo26/VXBodF45XuCiGsCiwOk9Mc7/EIcTsW8HOv6UpTvpgLMDDNpFs92KNW04a1hwtSpK7O1EskW6vkZkCz4S47VhmwU94g==
X-Forefront-PRVS: 0057EE387C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR07MB1082;
	23:aDW4wiqbhtn7UGadxTMTZNMUM3X4LVeAspEYwSBQ8?=
	=?us-ascii?Q?aXI9aSCm7q1UWWlzVpKUBUWUKbKpVRFIUx9/zJ0R3fcDlJthvZBjuSHBPmo8?=
	=?us-ascii?Q?NYiMw/wuUsAjwGa9kcBB3JVRajHFN+I4oPpzspgCGxz94MrrnzjXSFmaPj6O?=
	=?us-ascii?Q?5L42IF5asGfXiCzen3DX4fuq+ShyURW/KeZ7iRiPatOpyrYKmQ80WkV5xgov?=
	=?us-ascii?Q?hunl24m4MZfYUxkJS9g29uo9Xn7nIv5ZNNhxekfrVIfsyCNpRG1ZLmclaDag?=
	=?us-ascii?Q?su9/+AszzuAruf856xlDBS515qHI1pTJg7n1fydrPNeuxxq7UK2i6Rjf45QZ?=
	=?us-ascii?Q?tZOlWm2H6DUPCzPj1nBy6CMa/oYYdrN3P2281zCztKYLF3oA3epZb6oLgGyx?=
	=?us-ascii?Q?3oHhjmrCz0es6/RXwn7adDPzK8/w2LVwB6PbBqon9X/L0DeaJyAxOENWe4n1?=
	=?us-ascii?Q?p94TBEnC1zKNIGcO9PXk4EddRs+nB622Njbb8atFgvH/pOYdxzQzQ5/0yQts?=
	=?us-ascii?Q?9NEdlgHqDxqaOpr3jXTzn1787XZ4wwBFQch9mA9dOKRExSX4Q7QNrV8DBPXg?=
	=?us-ascii?Q?8U3P7vncHcVMNaYLuVlaDwfUF9nWHu+GRavqEd07xp2G1u/R6iwMntGmgg3k?=
	=?us-ascii?Q?BKYeSjWzYmuoFhltrMklLdTQnQuCeCnGY5TMe3eisJA1QKxTuBV8eLoJ3Kni?=
	=?us-ascii?Q?gDtS3+v2PAn/ApJHKw/CFDavMNc0tRkVTo8lKCZzShDO8CIbdMj9cR3m2znD?=
	=?us-ascii?Q?1ZJJVPU5oJ+WMiySE/3b5MYy26oQBen3AG1mhsTob1CyTkLP/evSkbg3Zd6Z?=
	=?us-ascii?Q?ufKpzuZBuQATZJWuwizStlbURYQRKuBJsiqS/iCG5ih/E7EyW2GSjFMKSBE4?=
	=?us-ascii?Q?vUVyEmu3agHQoXqjdRm4dHCX/LIJlD0YIQ+IgtghNAY8Op7WvrZ6eV62N8Xl?=
	=?us-ascii?Q?BcbkRniu2mRnHzSZC5+FyEl0cTjj6plHBoNU/wnZLvcIsQQohdxUcdpsqJ7R?=
	=?us-ascii?Q?2PQA1ALC4aZ/kE4clBf0XbWz81QCgnWFDEVzQLfAyqOOQTjcYFDKruTpMIx1?=
	=?us-ascii?Q?crxmjlAL4u4bei15qBp0xAqmEDueSiCrqnMFMgf5xeNfeBS93f35/ms88b22?=
	=?us-ascii?Q?oLvzD6kFkoTTw4nhTJIKO/XnYC0ardJ?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR07MB1082;
	6:54RrBySLJ3ddKj4eFZ2/YXqNm3jLomZP/8By534VtHjh2+HJw1mnF6S3fGDZSQhWIsiTFbq64/CsHQd4pMDVsISIljERTrcT+kGnAk8LshfwCwQLwV4yCvgWHq5b9VbULT8fDCjjKp2lDZaRDAjBhiiopKop7urkAF3CrCoIHks5IX9Xa68UZ1DLeeuR0nW9p7Gp2aOlSrxPgoR07liQMFSSOKHTUzcy0bpwSVsek0PUB7T/o6NqD+mOtSW8BniaSqH2SboV85nbF7vKQetsYv3ylNinf4Ozkfl9C/IPZPck5rCouGSLVPfg2+s6bOXf05A80CBmaOHHkFAyLHt9oQ==;
	5:XGr4bCH4aJWwnqPltJAFw/rnKeS63Q2+6OV+UyaJjJYh0W2sB3bRRT2gLp3Ni2GVAqHJ7yTHq9kKSyxxvm0pMTTuJ7N9EAo78bkRxh/9e6+lJ0hJaUZGCQs+z6aItnnB+aXGOdJ6LRsCHvJGJ+wiDA==;
	24:xNyCYpSgeOGdteu0gMPqLu46fn8gHOUa6zFVtXO9PuPpV/bNxfLXqogv9YGYJSWMV3DMYXJflWJ0JtpRnQUoObQg7Ty9CpPDHzwkrjjtjiw=;
	7:PAsOLeN3oMXRZxeV/fSO7qSD9feoZuuio1GE+2RVPuBPh6aEgoxhqyzctSiBhHTSu5d5hHGH/YicAaQAW5zzTGLF5OluFvJ4+n0hhRk/kHErAXgCExJD2q/Yqyy+Ks6AA1244G32cWdMLd6Jc6cZ7LJuZCMFOeUNAe/48uX/D1AZn4F54KfjbXztw+KtXMsXzA5R+QS84Bdfw+3p7eyhGBh/TK08QuyLLnYHdrj9GhpftzrbqOgXGPijBbFTHhfp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2016 07:21:02.1011 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;
	Ip=[131.228.2.240]; Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB1082
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.98
Subject: [Qemu-devel] [PATCH v2] block: m25p80c Fix vmstate structure name
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
Cc: drjones@redhat.com, crosthwaite.peter@gmail.com, dgilbert@redhat.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	amit.shah@redhat.com, rfsw-patches@mlist.nokia.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L86h1yT3/3gT

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Correct bad name of the vmstate structure. Since this breaks
compatibility also update vmstate version back to 0 and make
all fields independent of the VMState version.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
V2: rewrite commit message

 hw/block/m25p80.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 9828ee6..d29ff4c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1189,9 +1189,9 @@ static Property m25p80_properties[] = {
 };
 
 static const VMStateDescription vmstate_m25p80 = {
-    .name = "xilinx_spi",
-    .version_id = 3,
-    .minimum_version_id = 1,
+    .name = "m25p80",
+    .version_id = 0,
+    .minimum_version_id = 0,
     .pre_save = m25p80_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(state, Flash),
@@ -1200,20 +1200,19 @@ static const VMStateDescription vmstate_m25p80 = {
         VMSTATE_UINT32(pos, Flash),
         VMSTATE_UINT8(needed_bytes, Flash),
         VMSTATE_UINT8(cmd_in_progress, Flash),
-        VMSTATE_UNUSED(4),
         VMSTATE_UINT32(cur_addr, Flash),
         VMSTATE_BOOL(write_enable, Flash),
-        VMSTATE_BOOL_V(reset_enable, Flash, 2),
-        VMSTATE_UINT8_V(ear, Flash, 2),
-        VMSTATE_BOOL_V(four_bytes_address_mode, Flash, 2),
-        VMSTATE_UINT32_V(nonvolatile_cfg, Flash, 2),
-        VMSTATE_UINT32_V(volatile_cfg, Flash, 2),
-        VMSTATE_UINT32_V(enh_volatile_cfg, Flash, 2),
-        VMSTATE_BOOL_V(quad_enable, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr1nv, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr2nv, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr3nv, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr4nv, Flash, 3),
+        VMSTATE_BOOL(reset_enable, Flash),
+        VMSTATE_UINT8(ear, Flash),
+        VMSTATE_BOOL(four_bytes_address_mode, Flash),
+        VMSTATE_UINT32(nonvolatile_cfg, Flash),
+        VMSTATE_UINT32(volatile_cfg, Flash),
+        VMSTATE_UINT32(enh_volatile_cfg, Flash),
+        VMSTATE_BOOL(quad_enable, Flash),
+        VMSTATE_UINT8(spansion_cr1nv, Flash),
+        VMSTATE_UINT8(spansion_cr2nv, Flash),
+        VMSTATE_UINT8(spansion_cr3nv, Flash),
+        VMSTATE_UINT8(spansion_cr4nv, Flash),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

