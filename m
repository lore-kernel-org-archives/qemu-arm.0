Received: by 10.223.188.70 with SMTP id a6csp3350760wrh;
        Mon, 21 Aug 2017 03:54:34 -0700 (PDT)
X-Received: by 10.55.207.21 with SMTP id e21mr6861668qkj.106.1503312874082;
        Mon, 21 Aug 2017 03:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503312874; cv=none;
        d=google.com; s=arc-20160816;
        b=sO84KNRHFbGcaOBymql/O0Km0qtkmcl+2ymjEZ//LQgtc9XgWMdf6fHRFHOKxXlV7f
         u0G6/sU24wDLKAEpMYd3DM9oO8pPlv9NWiusF49YPSQwopb/rHn1QlqfJz+TC0WsTDPZ
         8keXMwHUiO0go++zjkX98k+58AVPjNlezu78CL7Q39AR1li+dfgIkp4g/eAqb+0PViOm
         ygCXVM5ArlwODpeqmYyjofFwX0nR8V3Te5f6bsj3BJm/BD5EPA2PhnecFuPHpxAwEtg9
         xpuvtxWCe1xO+U5Ey9//wWBHlnR4OIed6UfHCbjqnpYcUxkw297xRT0Z6uSRppB59pVu
         TIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=NiWq2y98QcK3yniLDjzmCI4Fij995zlg/JZ7sEYDHig=;
        b=DqWmamQrIppZilWfZLy5NH5x4p6LX/0AcIifH4AkRKP+iKMAMHA8LqtQLBXfdbiSV8
         /7pwohpZaqYPoEnCS5wj9jtgG5Y/1rk1/dAhzbvrcrmY8/u0fQGMVmqAlYa2SJld0L0A
         M93AZppVt0cP1sMTXOmr/ZfXoSVCVM3e1LLLWlEF1LQ3HqFg0C+UYuofnBWH+GFTkjMb
         EFU1L5TP0W4GO6rK+ecxnKL/7gy905FTdbc0eV1xVKYT/uozVoO/ZDGMbHwruye0xdyk
         5O1v/pw4oKVFqm05GUCGhP7ejjwVIs52SXOE6tTMij3WraQd9i/lMDVGIUaNCpOcdTyO
         lCmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f62si11113982qka.408.2017.08.21.03.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Aug 2017 03:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:33128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1djkLn-0007tM-KO
	for alex.bennee@linaro.org; Mon, 21 Aug 2017 06:54:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1djkJL-0006Mf-Ai
	for qemu-devel@nongnu.org; Mon, 21 Aug 2017 06:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1djkJG-00028q-9O
	for qemu-devel@nongnu.org; Mon, 21 Aug 2017 06:51:59 -0400
Received: from mail-sn1nam01on0048.outbound.protection.outlook.com
	([104.47.32.48]:48038
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1djkJF-000286-VS; Mon, 21 Aug 2017 06:51:54 -0400
Received: from BN6PR03CA0080.namprd03.prod.outlook.com (10.164.122.146) by
	CO2PR03MB2264.namprd03.prod.outlook.com (10.166.92.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1362.18; Mon, 21 Aug 2017 10:51:51 +0000
Received: from BL2FFO11FD011.protection.gbl (2a01:111:f400:7c09::129) by
	BN6PR03CA0080.outlook.office365.com (2603:10b6:405:6f::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1362.18 via
	Frontend Transport; Mon, 21 Aug 2017 10:51:50 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD011.mail.protection.outlook.com (10.173.161.17) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1341.15
	via Frontend Transport; Mon, 21 Aug 2017 10:51:45 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v7LApQtE004847; Mon, 21 Aug 2017 03:51:39 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Mon, 21 Aug 2017 16:18:54 +0530
Message-ID: <1503312534-6642-3-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131477863105707380;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(53936002)(36756003)(47776003)(104016004)(8656003)(305945005)(105606002)(106466001)(50466002)(68736007)(48376002)(72206003)(54906002)(39060400002)(2201001)(85426001)(7416002)(626005)(86362001)(76176999)(5003940100001)(5890100001)(498600001)(50986999)(97736004)(189998001)(2906002)(5660300001)(4326008)(6666003)(2950100002)(77096006)(50226002)(356003)(8676002)(81166006)(81156014)(8936002)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2264;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD011;
	1:XyFC/3z9P9B9cZM2ko2gXeITTbdN2nZ23V8ScMOfytdrip050/tLSg4gLTAOjQ36yhh8Kas/p/Gyw8HF8C6C1v+eWt6sWPHt89NVzwly7Ke9zkxpJzXo5ZJdqqZfwdPX
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307dcbc7-e4f3-4ec2-3d74-08d4e882a0b5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603157)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CO2PR03MB2264; 
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2264;
	3:OhrJ0Bm0kK4k5xY0nV05V4Lmnd0+odVOs62io0nqmnLaNNnpbcPFe7hI4MFW3trwzBGu65M58rN74Ni8S+svLtmjV/7mhC3Pvr1JYx++9xqvM9FG2isCu9xITVWA3nonsnAoXI4MBRi8T7in7mteKSaKnVSUm2V49k9kcVpvtFeux7VWrSqFFNcTKM0oBS4eXYnqi2koneVP7ydu4441gwwGEvapIt5llii/IDGLYeATQJeGdBXiRcAhR53WCqbHVOs0d4ClZ/kS4bj0kID5wnfPuoNT5QEfinDL8bQtXW4bzGxlHd1vfaFzcxLUpRYmHBY9WHAKnXM0948tx4V2Rf1Zmkg8sI/tQaeO8jMYtCI=;
	25:QQOMMfa24mgX+NGx6uR8emTn3Mo9K5qwsmydyVmQASp04efu9WF/tAuAg1HSuAFYPfACiefjwVGRrM9ZeHACKqsScV0P3I7f8nOTo2ZDeHT2aT/uAcl0dznpVebnNvxHmaqeznQG7BolBVL8C9BjTt7RdjaKbRx09WIJzBxU3VxwHlxz50oeR7xM7cz14IcuvBzrSckbIRgn/oCb75m/EZRGiBYG60ZFGlJypz/pWu7mqWoIEs1L8vlLCqXKdb7el6RQ1y1eK52dlyn4psQKt6cqQnKl23vdXWeraJH3j8r3no1B6mDgvjwEFop7x4/epiUi+rPe+LcOPmPu/5S5jw==
X-MS-TrafficTypeDiagnostic: CO2PR03MB2264:
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2264;
	31:uMlEZVxnx7Kk9Qxdx/Ne5ejM6wHdO+7Tgqbd4VPsi3dk4Rw9gmXcFh3KOruB0XWJJ4+ZKaxGeL+utzXPixqHtwRXTichz/wWBlgqhCe7m1XClMFx2iiWMPG12vOQj1wocggOOKqIjdnBiscnK5Q4AaVCcchf4zgB7Wa7si/jy6l7wYlrRJgOeABvupY/3rjiP6RXTchNp6MoHnj2GF6vI73J97AK07cAXmuAxuFnHOQ=;
	4:J4y6l3YBtd9BGN4kMT6wVrWgyh1e09PdWdDLDZKKv+sDVkV+4cdUcOoeQPP/19HtQGvJQA9UuBiq0kIG7Zq80+IAsK1Y7dHSWWfY6OvzFYUi3vZvbX9HFKCJS/uHEitkOdcWMoS+gLoQdRHTuyeAVcCUP1wYMsyTPTUwkyMEZ1LEENzJ1oCJcRyX7Xun38RW83yXtlF5sjpUMcao2DNCzfLrtV8Ck2g0SLOxIkw7RNTNKRI/UZn1nGhA/z7Ge8QWDGT2Ptt1bJ/PfPw3ZNVYHTekZQG+EGznpydKp1hynefNVovN70E7thXaaA/4lX9ls6P4lU8DhFQQ3VIhhFwXEQ==
X-Exchange-Antispam-Report-Test: UriScan:(190756311086443)(185117386973197);
X-Microsoft-Antispam-PRVS: <CO2PR03MB22645700574E6CFCE42660549A870@CO2PR03MB2264.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(8121501046)(5005006)(13018025)(13016025)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123561025)(20161123559100)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123565025)(20161123563025)(20161123556025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CO2PR03MB2264; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CO2PR03MB2264; 
X-Forefront-PRVS: 040655413E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO2PR03MB2264;
	23:/43XxJ6vBCcbYD/AgYH838cPm+LV3CuOgNVos/v/f?=
	=?us-ascii?Q?SdjRUCP+0I6gTruuqFqkesJYDx77rzxR54NKX/0fzTQ/mDyO7WFkX5vMljiT?=
	=?us-ascii?Q?oRcWV1ngNSEbrhT5/8rR6tSSUtL7PGwAN/PQnJrumA5henRLpnMmJZpP97+E?=
	=?us-ascii?Q?xSlAhcinB18ZDrkLevqT5Xd3f/0sBha56Nxxi8FjWqIvmk2/bRI6UGQrS/tB?=
	=?us-ascii?Q?5ZYkQvJRlMFe9CGdyebV/Qn4an2KSNTtmuccMoOd6sC90pWLBxw2qMvbkMW5?=
	=?us-ascii?Q?u5KA3cHetS6TlqlTH31XhGCZUEfKFd4MW1+3J1UyGRNzVOkh/BvlSRdGpCYt?=
	=?us-ascii?Q?Vbb5dv1aWc0cIw6CBQ92CO5iryKNGI8d4bIdEB8v55M/QJwq7Denjhljssy0?=
	=?us-ascii?Q?zqvWB4Imse//WlYYrjyWwfehMmdHsyRtKbvjyITfJ4tc280MzwLyg3UGkdjA?=
	=?us-ascii?Q?DelKnvDS4ei7mA+LIoV/78BdmOW0mClvXPGS0zqFtSn4K1q147whrGI5TPiz?=
	=?us-ascii?Q?s9NADZXd4c3gv/2HR13rfPMq1ycUcCVmyBfqZyPzeyn4YK0ez9DW0LXgStsz?=
	=?us-ascii?Q?vJfdiP+cjJ73UKhGZ1AT/idEbcRn7TqULEJMnvvKMgTCATD6d2/XhlcVJLAL?=
	=?us-ascii?Q?d+zezJbCiEVy5gvQjw47g/BN96aLFyRuMSTa7PEGIpyn/JjJ06K/kczOo/W4?=
	=?us-ascii?Q?MghUBH3r80OZc0j/8V6D2khtLlmqOBETU84ApJ5gKsfV47KRaI8CE9uvpiNP?=
	=?us-ascii?Q?UG7Mv3MxnzNWzZlVlG4nD9Qa3z43QMko3cWTi/c7W2u6du4/uO+J/4wSFmIq?=
	=?us-ascii?Q?Vxhob+PaQCuh+5cffS0+qq/rgqSt95kojj0vG675UJK0l4Qa6z3zR4BlMaOT?=
	=?us-ascii?Q?+vMSlsRHvCBOYlkqolfDANE20zZOWjNSi+EYy+pd+ehLet03ziqCwsu5LlM9?=
	=?us-ascii?Q?NVAq0++Qfo9Lyu+RFqRCPYeYEBDzpXh5kTspzl4lBiDlsjKy+aky61kmi7+i?=
	=?us-ascii?Q?/lpxByAzHpumvNC71HWLfeMpvVu0RNs3v7KNt7AeCFiHgMHmd0Xs0m6DSYCR?=
	=?us-ascii?Q?yWls1LFtse0oiQCyczXiPt2fYdOjn54WT/k/7/o7sLdnoabGvgU4kZSpezhA?=
	=?us-ascii?Q?T2iXFgJIyrQSrj6rOkK/4B/6AZo0iZwzPDLcIlF+usA3wyYzWr1LuCZy07XL?=
	=?us-ascii?Q?JfE8i4tbHPkw/Y=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2264;
	6:hQX8Vzz66kpnsRZhOYP2PAikEB4L1F+7J1Ka6cQPDr1pIGpSFRCZcQocVJ2i9/flzz13BIOY4oCD77A0+A8N7JWSCSMAmbWOqUfeXOxIgYXozk0MScOXMpcsZm8lQc3EXy+lZcIM9OfvJA2PVV/y3b5jmJjMbKGSIvWOEL2TjuBp3aJ23JhWpfBUXMA1pVgZQu+DE/xTTitmxq5ELl1RYD0P2S8kfeariSKXu1PMsHd1szD+8Yew86urcOqGcKRrHOdrRABGaNRsWNj7Zsy/G7TghzVzOL7dVvGMLX8qmrPgS7mRYiYbXFMVIUmSrhFx/SePDCITHIc/6HTQZr0JTw==;
	5:hWrQdF6M61UUlzHsVQe2vH7Rq3LgZ7DDmayQ+xJ3sziBCr038NcpU8h2qGm2wI2veBWx9zCuJCGGEiU5Kadq1X5nRBiTEM1ssZC7nJ70jEkkvYhBZ9bhRMuryySLbiTLWgWtZZLSLbNCITuMMsTrOw==;
	24:QpnGobGGpBnRei9qxHkF8dIQ4zfaJ+hVVzSKb/iMY3RDFi/dtcjX0cwVy9RG5DuBjBQU+xm9sQS63XwPv+ShYQdgDgdoj/iK1luFiTEm0eQ=;
	7:xUr3/fgSEYe2FMGsTE4zcc49TSvF8naHG0bVhlmHNFIZY9R0KHsPYnH2wUQ0OekxHNXqpkuwRaNTBYTv3TC7rluW68aanPINwsI/ZgQfn7PqjEtg9BD2VpRFBnMDktbVdvalNVw7qvzARljJm+ghCTRurxJHsSrqzZ/gPwWya1x9sGr8nO+qv62mv4TMINKxt3nopnOyemAFImYofc4nW9jyHPoWuiRXx6+MjWXQZrI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2017 10:51:45.3291 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2264
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.48
Subject: [Qemu-devel] [PATCH v3 2/2] virtio-iommu: vfio integration with
 virtio-iommu
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
Cc: wei@redhat.com, kevin.tian@intel.com,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dB8sMTHw5VD2

This RFC patch allows virtio-iommu protection for PCI
device-passthrough.

MSI region is mapped by current version of virtio-iommu driver.
This uses VFIO extension of map/unmap notification when an area
of memory is mappedi/unmapped in emulated iommu device.

This series is tested with 2 PCI devices to virtual machine using
dma-ops and DPDK in VM is not yet tested.

Also with this series we observe below prints for MSI region mapping

   "qemu-system-aarch64: iommu map to non memory area 0"

   This print comes when vfio/map-notifier is called for MSI region.

vfio map/unmap notification is called for given device
   This assumes that devid passed in virtio_iommu_attach is same as devfn
   This assumption is based on 1:1 mapping of requested-id with device-id
   in QEMU.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v2->v3:
 - Addressed review comments:
    - virtio-iommu_map_region function is split in two functions
      virtio_iommu_notify_map/virtio_iommu_notify_unmap
    - use size received from driver and do not split in 4K pages
 
 - map/unmap notification is called for given device/as
   This relies on devid passed in virtio_iommu_attach is same as devfn
   This is assumed as iommu-map maps 1:1 requested-id to device-id in QEMU
   Looking for comment about this assumtion.

 - Keeping track devices in address-space

 - Verified with 2 PCI endpoints
 - some code cleanup

 hw/virtio/trace-events           |   5 ++
 hw/virtio/virtio-iommu.c         | 163 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   6 ++
 3 files changed, 174 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8db3d91..7e9663f 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -39,3 +39,8 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
+virtio_iommu_remap(hwaddr iova, hwaddr pa, hwaddr size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_map(hwaddr iova, hwaddr paddr, hwaddr map_size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_unmap(hwaddr iova, hwaddr paddr, hwaddr map_size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 9217587..9eae050 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -55,11 +55,13 @@ typedef struct viommu_interval {
 typedef struct viommu_dev {
     uint32_t id;
     viommu_as *as;
+    QLIST_ENTRY(viommu_dev) next;
 } viommu_dev;
 
 struct viommu_as {
     uint32_t id;
     GTree *mappings;
+    QLIST_HEAD(, viommu_dev) device_list;
 };
 
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
@@ -133,12 +135,70 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     }
 }
 
+static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr iova,
+                                    hwaddr paddr, hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = size - 1;
+
+    entry.iova = iova;
+    trace_virtio_iommu_notify_map(iova, paddr, size);
+    entry.perm = IOMMU_RW;
+    entry.translated_addr = paddr;
+
+    memory_region_notify_iommu(mr, entry);
+}
+
+static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
+                                      hwaddr paddr, hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = size - 1;
+
+    entry.iova = iova;
+    trace_virtio_iommu_notify_unmap(iova, paddr, size);
+    entry.perm = IOMMU_NONE;
+    entry.translated_addr = 0;
+
+    memory_region_notify_iommu(mr, entry);
+}
+
+static gboolean virtio_iommu_maping_unmap(gpointer key, gpointer value,
+                                          gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_unmap(mr, mapping->virt_addr, 0, mapping->size);
+
+    return true;
+}
+
 static void virtio_iommu_detach_dev(VirtIOIOMMU *s, viommu_dev *dev)
 {
+    VirtioIOMMUNotifierNode *node;
     viommu_as *as = dev->as;
+    int devid = dev->id;
 
     trace_virtio_iommu_detach(dev->id);
 
+    /* Remove device from address-space list */
+    QLIST_REMOVE(dev, next);
+    /* unmap all if no devices attached to address-spaceRemove */
+    if (QLIST_EMPTY(&as->device_list)) {
+        QLIST_FOREACH(node, &s->notifiers_list, next) {
+            if (devid == node->iommu_dev->devfn) {
+                g_tree_foreach(as->mappings, virtio_iommu_maping_unmap,
+                               &node->iommu_dev->iommu_mr);
+            }
+        }
+    }
+
+    /* Remove device from global list */
     g_tree_remove(s->devices, GUINT_TO_POINTER(dev->id));
     g_tree_unref(as->mappings);
 }
@@ -171,6 +231,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     if (!as) {
         as = g_malloc0(sizeof(*as));
         as->id = asid;
+        QLIST_INIT(&as->device_list);
         as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                          NULL, NULL, (GDestroyNotify)g_free);
         g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
@@ -182,6 +243,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     dev->id = devid;
     trace_virtio_iommu_new_devid(devid);
     g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
+    QLIST_INSERT_HEAD(&as->device_list, dev, next);
     g_tree_ref(as->mappings);
 
     return VIRTIO_IOMMU_S_OK;
@@ -219,6 +281,8 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     viommu_as *as;
     viommu_interval *interval;
     viommu_mapping *mapping;
+    VirtioIOMMUNotifierNode *node;
+    viommu_dev *dev;
 
     interval = g_malloc0(sizeof(*interval));
 
@@ -230,6 +294,11 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
         return VIRTIO_IOMMU_S_NOENT;
     }
 
+    dev = QLIST_FIRST(&as->device_list);
+    if (!dev) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
     mapping = g_tree_lookup(as->mappings, (gpointer)interval);
     if (mapping) {
         g_free(interval);
@@ -246,6 +315,14 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
 
     g_tree_insert(as->mappings, interval, mapping);
 
+    /* All devices in an address-space share mapping */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        if (dev->id == node->iommu_dev->devfn) {
+            virtio_iommu_notify_map(&node->iommu_dev->iommu_mr, virt_addr,
+                                    phys_addr, size);
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
@@ -259,6 +336,8 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     viommu_mapping *mapping;
     viommu_interval interval;
     viommu_as *as;
+    VirtioIOMMUNotifierNode *node;
+    viommu_dev *dev;
 
     trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
 
@@ -267,6 +346,12 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         error_report("%s: no as", __func__);
         return VIRTIO_IOMMU_S_NOENT;
     }
+
+    dev = QLIST_FIRST(&as->device_list);
+    if (!dev) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
     interval.low = virt_addr;
     interval.high = virt_addr + size - 1;
 
@@ -296,7 +381,15 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         } else {
             break;
         }
+
         if (interval.low >= interval.high) {
+            /* All devices in an address-space share mapping */
+            QLIST_FOREACH(node, &s->notifiers_list, next) {
+                if (dev->id == node->iommu_dev->devfn) {
+                    virtio_iommu_notify_unmap(&node->iommu_dev->iommu_mr, virt_addr,
+                                              0, size);
+                }
+            }
             return VIRTIO_IOMMU_S_OK;
         } else {
             mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
@@ -439,6 +532,36 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+static void virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                          IOMMUNotifierFlag old,
+                                          IOMMUNotifierFlag new)
+{
+    IOMMUDevice *sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    VirtioIOMMUNotifierNode *node = NULL;
+    VirtioIOMMUNotifierNode *next_node = NULL;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        node = g_malloc0(sizeof(*node));
+        node->iommu_dev = sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->iommu_dev == sdev) {
+            if (new == IOMMU_NOTIFIER_NONE) {
+                trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.name);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+            return;
+        }
+    }
+}
+
 static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
@@ -553,11 +676,49 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
+                             mapping->size);
+    /* unmap previous entry and map again */
+    virtio_iommu_notify_unmap(mr, mapping->virt_addr, 0, mapping->size);
+
+    virtio_iommu_notify_map(mr, mapping->virt_addr, mapping->phys_addr,
+                            mapping->size);
+    return true;
+}
+
+static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    uint32_t sid;
+    viommu_dev *dev;
+
+    sid = virtio_iommu_get_sid(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
+    if (!dev) {
+        goto unlock;
+    }
+
+    g_tree_foreach(dev->as->mappings, virtio_iommu_remap, mr);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    QLIST_INIT(&s->notifiers_list);
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
 
@@ -644,6 +805,8 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
+    imrc->replay = virtio_iommu_replay;
 }
 
 static const TypeInfo virtio_iommu_info = {
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index f9c988f..7e04184 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -46,6 +46,11 @@ typedef struct IOMMUPciBus {
     IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
 } IOMMUPciBus;
 
+typedef struct VirtioIOMMUNotifierNode {
+    IOMMUDevice *iommu_dev;
+    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
+} VirtioIOMMUNotifierNode;
+
 typedef struct VirtIOIOMMU {
     VirtIODevice parent_obj;
     VirtQueue *vq;
@@ -56,6 +61,7 @@ typedef struct VirtIOIOMMU {
     GTree *address_spaces;
     QemuMutex mutex;
     GTree *devices;
+    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
 } VirtIOIOMMU;
 
 #endif
-- 
1.9.3

