Received: by 10.223.197.9 with SMTP id q9csp4840526wrf;
        Tue, 17 Oct 2017 10:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RAzvN7GtuJpNM+6Vhseju/rIoRlR+naXRdVsKVDIpPJ+oUpSA3bb4O1/2YlHJojhPnabY/
X-Received: by 10.200.20.146 with SMTP id l18mr3832610qtj.189.1508261644761;
        Tue, 17 Oct 2017 10:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261644; cv=none;
        d=google.com; s=arc-20160816;
        b=uQqFWYxRAzl0ku8jWQ2MGhCirbWEmAyUKLbyBvTLesIBVL04nL6tUXKc/blXh4uvr/
         KEonblZTZ9Sy410GpgkkFVEm1If4G+3RJKXxbI+coF6U5T/heUplrAEg174XY6jmhaWp
         Ke5yx4n21atSv4upGhsqMliN8sAbDkTEpW+C4LKaHKRpib6bEbP0XS+fUWGEAzGzQi+U
         OnEIchZAft+yKpSncmHBvAEmpQvgJvULkWXNtIKHDZvBvJnbwd5s/dZ5Kbhesc7I/xfI
         OQlEHDFEiU85mkozLKtbrQWNYc8231LWxfsyWZO9UxE2hiy6ftltapmEl4ar2sED+NDB
         LG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=EzYOU8PpSIPpZGMl73KBPg/PDK9NJUPxEvo68+u8KIw=;
        b=NSEjBMlgapK49LeDyKHw6p69zAkdRvYUuS8emJwy/v16rkcvS4zz+V51P2uejEf2sb
         35hgilgFIygClME4XeZKcWbNG2JZ1r1FcLETG+dYKjBBdxQIet80QmpBFazDrPEAKKJm
         iCWPKxOQmRs1FD7LEjwEi6N1e0Q0q2zh3CJHqttr4qplt60vhvMyuDevsKXSD8+z0gp4
         wke+Wo31++0SXe9/On2fI/fWEa2GyBThGkCMXBbs17+Bj10qA8y/6BLWytxcpOrnL9Oe
         dBSvVVPnB3iz2CN5vW5++JbBSV77UIBTegSed4K1UZ+YBYpL6cAd7kO4VeIwaFItCEil
         hsNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=f1cKnqDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si2944408qkl.212.2017.10.17.10.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=f1cKnqDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Vkg-0004yj-Dl
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:34:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkU-0004wt-MF
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkT-0006Kw-Jc
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:33:50 -0400
Received: from mail-sn1nam02on0073.outbound.protection.outlook.com
	([104.47.36.73]:9672
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkN-0006Gv-Qu; Tue, 17 Oct 2017 13:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EzYOU8PpSIPpZGMl73KBPg/PDK9NJUPxEvo68+u8KIw=;
	b=f1cKnqDj61R5rFbGdB+7j92dM++PkRk3ClT659qx3HqgLBLdToy28FY8b/cSSFoca82MPEAl0eoZViYgs7iJNiPlzSuwNlKRxjZ0lXYFNj51f+J2mGJrr5PCpjOWApqPfXTyza2V6pw3BBQf0tgiizjv80FDiRho8JfXilYzDVk=
Received: from BN6PR02CA0099.namprd02.prod.outlook.com (10.161.158.40) by
	MWHPR02MB3389.namprd02.prod.outlook.com (10.164.187.166) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:40 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BN6PR02CA0099.outlook.office365.com
	(2603:10b6:405:60::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.77.21 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0002Qa-8C; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0000mb-4h; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkH-0000mV-LD; Tue, 17 Oct 2017 10:33:37 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:48 -0700
Message-ID: <2c8b07b555fa6f97f4c741e3fa5b478ee80bc68f.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(189002)(199003)(36386004)(81156014)(50226002)(36756003)(8676002)(8936002)(81166006)(189998001)(4326008)(63266004)(39060400002)(316002)(76176999)(305945005)(356003)(478600001)(110136005)(2201001)(54906003)(106002)(16586007)(106466001)(33646002)(118296001)(77096006)(2950100002)(6666003)(5003940100001)(50986999)(47776003)(9786002)(48376002)(2906002)(50466002)(5660300001)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3389; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT024;
	1:C2MK0t7SJiNxL7gjMTHpcX8KeUSUMSst0AK/4UaiiueZkCkFwlsvx5t07pjrTkFRotltYfpN7mWwuPp59BmyM1lNG+Ot41bklUxWWatv0Ysg//Jc8HpKULr3r7BOTdPa
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9deab61b-a879-4b8c-617e-08d515853491
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR02MB3389; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3389;
	3:AQ6Al3VPX25ORMvib/1xP0SJweszg1vDz9ev515g4i4x0PUvOFT+cRYJKhFS4HLs/BgZObbBITGuFrDG/PtS/ndFanECTD+q+WUCkW5FrL1EfZuBK6aIeujFD3TNrXgBpFhA6aByRMWZ5Or4gp7iOroOFhVAGlrUIi8E4suo3cqKCry/ZU/R1Ddg73fLnW5xZCNnX9iuWkPx442LC16Rfug06P/9kJZWsk98O9HoFLh7Vzqv0JiVbaoAZ5L1BKzSEnWuuVb7hB1o6WJejp7H0ud1Lf7Dlvco3P5WSZLPK6wdHARXoVy0asRbTysOR5XYlUvJUH2pXTHTYkIAk9bpY4mXk55urxTkWSPgwhKfhb4=;
	25:qqPZgoYVYT6kGyUduS4cvwce1rcdOlzrkTJZKAm3Qkmiib3WcXdZpeW8wMs1LPW2eLr2/44TI7QGygVMSTtDShC1h/kAHUkN6Im5AKDrkb89mMKetc0GVoTjMhQY5mLTKp3tK7n2wJyNDz2F7F8ZLJrZ+YgG9DiBXDo2aPB793ercDa0E2WuYntz4qU0WPgaBkXuiNW8iPunNKt7WeAavS+5F2HpvknaYZbBGwPerNzC8wdgf271tS+KrQjZ6lkNF6Qk0xnWuDW284NVZAkjCWdJvpwq8osKeBcgIcYZI3jUvYnP5WY8RW2KQ66UbpQwpFPj47Kn8/+LbkhgZ1b1TA==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3389:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3389;
	31:GcRQRM5Q2sJIMuQfgfMxuhK4sWJEK33Y8MtLZetILLZ5wO5b32TN0/uwoZZOSFzLkI+fIRnVpCLiKBli1sOGXYhkaQ1j0nkPyBWp3NykgCztNLMwkiH3YO9FOxWqegITA3+ftOPyTjPmPVWkWKgKwTAes3rdiqeytUd8daT/5h5bUAYxM9sxWLpYvXTAKPcnlRsOMuNdH/FbCUVcwaHwfG/+8SCaPc+A2BgJHHIgk+o=;
	20:t1/cMZMV7r/MAJVTOqh4sAibsvM4UqWlA5bvMh3wOoRFN6cDIy/8g2KAaf+SmnmqOXGBJAzWCPKQKc9+oIxL6MfU6NRaWr1jE7NlfB03/21BXfsXvCfvnytkZFRmNXhAT4kRQ16drCYrY5pjgKIeqdgRpBj9gaf5HfVpFe/uXu3uxB6fD9HmKTWcRHh5ve2mOsZZibjfsYCGEM2fbmh5sCkewa7ubxUkAOvVZ/T1YLxx4V2akfjY02qd5JfoL0A+IgWx/M2Qy+aqOKOigDw7yk1yz2MjLIgtOJuZllgnJlYuepr1PEcLXmcMOwz8uPdzbY/U+1B4y+wkNVjWdcwnDRdNMIhWIlUntLXPB0dkJqgIuaaYREG1nOvZahVCbQrSIwpAavXSrWr9/AbbyNFmzifLdQVsiDiJvkfjhIFRBaSObm0mVuFHveGblYo9mpFqK9hnZHf69tTO9lhGc0epdFNQrC1f7efXl/heFs7zmiP4kQtcCMKyuEGaceTKwav/
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <MWHPR02MB338977D41DD6662ABB6D00C8DC4C0@MWHPR02MB3389.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3389; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3389; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3389;
	4:3WSEDjN6JvMFWbFy1wD9cJZvLdpDy7+31/pxPn7RdQcwT6gOTd2HjyR8n++w2/UffK3MxhcsscdED5afmsZGPaZeOgA0ZyntlWRpkFJ/Qlku1uXmLo906EM5JhzcTNn1awvGCGVTA9OAIpZ1rAfWk2yowKTi3XUlUKEgagFdkIByaWfewcGPwB23d4B3o7fxo5g5NjWx9OOe1emiJwjdD1QrK747eOMt1imavpRrU68sbL5m3QNrj9LvDMYjGDcl4gF/7H8BQsWkLmS+rj8KQln76Y2VuA2q3igMQHHhccI=
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3389;
	23:xHIg/zBctvxnst5RaG+leL4fxZvi6FMaN2CB+R3M2?=
	=?us-ascii?Q?9OJGgTWLepirwgvYVKWx3rcliPrB5YCxhNkv/gwBT0PsNX7ZWl+Xg3/Nc/Fm?=
	=?us-ascii?Q?3Klt2nOHo90HX75AeWwCiI4SmqrnTRDN8WGyUbp4eQvseNkiR+3TZOgFfj+r?=
	=?us-ascii?Q?ch/6LZfj6GTytsHyS/yEbYrUT6P4YYMQgYdVL/Kr1hA08ig8L/FwgjEFYoEy?=
	=?us-ascii?Q?bQYd07Eg+Y/FZbiDhF6Ytp/H0utCNNFkB0ftqGR91A9HgA1io+abqxBUnk0R?=
	=?us-ascii?Q?Qz1wRlzQbIaTY0Er0+WGzc8UTcutME/WHb4WpcZNtfzXbAqwX/tXQj8G+Sjn?=
	=?us-ascii?Q?PHlnQZkePWdvcpHIHfGbC7DyLPjswGAHgyIlqjEQYcAUyuvoGN+kuCpmcVUT?=
	=?us-ascii?Q?JU8+6BWJsokR3TAsuvSCf3bnoFicDdD442sYPZrc+GipwGGq+AFn8NBbPJ9t?=
	=?us-ascii?Q?s2FfBvrrHCHUIpDAjV2MEI7wscX3PcXARP3A6yml+YsFQj8xlz0z1UYjixUS?=
	=?us-ascii?Q?Qo+OFO3rsjy6vA6z4gg06r0iG5uk1hok03qJ6oCKhwXbaFuOJgZO3DEmpZ/2?=
	=?us-ascii?Q?Esqr8ESru7dpFmPTLQHkUcLMg+3/LCSnPSdRGipQgfk/o2avtGGZUQdNTeLP?=
	=?us-ascii?Q?yc9GDFfHMApTwjB4+gljYroXer3exzr9pcrMrYC9kgULQNLMCxD+hSgwsKU5?=
	=?us-ascii?Q?hOALwSEytGSrjUNk/DLAh8D90giMvs/VgB8ephzpg/vChIEgt1hmL7igrg5Q?=
	=?us-ascii?Q?dGf6p6tA5pd7GR2qecrzJK7V+OaNHoxiVPWmY295Y681RFIUQR0pirnL6ARs?=
	=?us-ascii?Q?mJ2aBRBnOGAcKuCEHJttIDGb4d+nC/8P9v2hBXCaK6KidHm7lSH3gbVT3NIo?=
	=?us-ascii?Q?KgJRykbmuX7XTzSfjtBY/siAoHhwyYaWuZ3sPt0drKRDP8G6xK/1GKErJ638?=
	=?us-ascii?Q?JzTPPB2JEH3x7kha5ZtkyarEIAlBzsT6idBFvpTLHWi6TmOttCkejF0r8OYW?=
	=?us-ascii?Q?CxSmc6S0ADcOjzjgk8ERWMDrsOTlC62SE6gvKCUoskPOh8FNWh7sjTnQIhTV?=
	=?us-ascii?Q?n0wpwN0llSYU4bVdcapv2hcjDrO?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3389;
	6:UPFlQ1NJBEfVbC4nelAvaetdKsfttPtB3YaAwwyPCwrbc88l0x8fDueyQy9chOAc7fGAq5QmlaOX4eB/VhrTQOS2WzjH2sunmRi1bnMYuVhih+sgOSVoRl6K4mUvO7/ohqqq97cW59zXpTCsxFOOgypSYdlxNoI5nmUymT2KHVRk7ycQ+gjqyHm3Wb3+Lgy/LYvn+4rLOjmLEB8X4JJ5ln5hAi2xfxISZqR5y0n/PVbYtaTzHTEpGH7kR20HEw8jkGWJDHOQAG32hqee4c0eAVBvuiZd2i3Dd09Qc9TlIL7sZIS6amgCewR8JyCZ3eIMKX01GKT+wn3fIdyZJ3xBMQ==;
	5:ib+CLQKzf/fe/IfI/9m5UWRSv3Dejf/R1JGOvY4AwfhCqvKvwDSGgzS11GMPNPVIh8wsHcpEeuD1JaDr601nsNBjEBLUGFkrOy9P6dlaRw7od37Ra407DHCcMFY0ip0eWM1J04yj58JTExJmDVVgl8/cM2RQwlXqvkLb1RRnxuo=;
	24:vzi1xx4FT/i4+gSP757X7ax2806Iw3f4ft7uHmLeYsprQut7JvcPFQWm6I8aHRJfPnSjkVvOBZDlKTP9PpPEpU7+IZAmLPnFTyb/p3gyBo4=;
	7:Z+ALfcviCVl5fDKYAe2WYpZkyNi5a7yjbY1ceqbdRPOixrsCTLpuQZdOziASREqyAzNq1IQyOlC9g4Ww6Ho5eSOyp5+doEUoIgQzU0LOWrJuOpkMdfFkjfLGL0/uP4+lw+HOzkh0fILLLbjAv/6tdIF8rD0wHDzJg5PLcBDBlJP0IczJcvrmj1VzFfmXs0OFgZHFXGf2/qVOyjpuj6ZSsex3kx0xngsjVv+VakwYSWI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:39.7850 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3389
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.73
Subject: [Qemu-arm] [PATCH v4 3/8] aarch64-softmmu.mak: Use an ARM specific
 config
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dG8Srp/iCw07

In preperation for having an ARM and MicroBlaze ZynqMP machine let's
split out the current ARM specific config options.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---

 default-configs/aarch64-softmmu.mak | 1 +
 hw/arm/Makefile.objs                | 2 +-
 hw/display/Makefile.objs            | 2 +-
 hw/dma/Makefile.objs                | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 24494832cf..9ddccf855e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_XLNX_ZYNQMP_ARM=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2794e086d6..1c896bafb4 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -13,7 +13,7 @@ obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-zcu102.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 551c050a6a..d3a4cb396e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -40,4 +40,4 @@ virtio-gpu.o-libs += $(VIRGL_LIBS)
 virtio-gpu-3d.o-cflags := $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs += $(VIRGL_LIBS)
 obj-$(CONFIG_DPCD) += dpcd.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dp.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dp.o
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 087c8e6855..be98d5d3d8 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-$(CONFIG_ZYNQ_DEVCFG) += xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) += sparc32_dma.o
 common-obj-$(CONFIG_SUN4M) += sun4m_iommu.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dpdma.o
 
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
-- 
2.11.0

