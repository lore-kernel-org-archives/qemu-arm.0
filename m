Received: by 10.223.197.9 with SMTP id q9csp4844600wrf;
        Tue, 17 Oct 2017 10:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RPWmDmMFNuoAjU6/qThK3VlYRvT+3vL3wSnbLBvEv7GTYV3cJ8+i8vw1OKMYfwobb9WktT
X-Received: by 10.200.3.210 with SMTP id z18mr7178298qtg.26.1508261959434;
        Tue, 17 Oct 2017 10:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261959; cv=none;
        d=google.com; s=arc-20160816;
        b=Fy3/DoQYHh4YucNIyzkq9QKLtUUBY1qwC0kYzyD2+ybeAJQK51S28/hqbAURWX+NeJ
         FkG6J4q4Ts/168fksTLEDCy7lBgJnzzkCDaxUVvf9Jl/SPc4HLkAH3KqkeKZtNwhlgxP
         fHXKtG1FkqUoqzgGNqyP8AiafNCHrdOWsjLmOQz2JvTnq0+CmwDOLN5AZgHaQ/Jl++Fs
         PMAySzU+PsIyL+CgTQ7BCAJvJzkbnIVZl+d5UNst7eCiMUpXgfBwjp29Q09CauTHKWDp
         ntUzJoMpUBaLIn1xFe2Hk+C/CAb5EmODHQcZ95q/y/IfZYmcv164HxYBb1uZ1nZVFdNa
         kmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=GWBzmC0nxls+1+1GbTw2ChPNol9jt0y8owOEPKmYAVM=;
        b=poNCqfmsbMjlFT5X9eU8YJvSMWsgorM1tFG/gWRRorLlElaOQN7w13HooXOO2F18sY
         /qurc4+gNYbcH9rm3PfmvROE2uu/m2tRl6T9Sj54LZ1AnyG97fJzVEGwq785EV711+R8
         HN58hC6nTDMahze2q3+Pl9ihMYOwsw1Q90+Xeb9JVjq0no2TBigXLo27TLBYgWSwBhBv
         W8O0fe8cgElmScEzKTKSEvpLYC+wddPK0+FpAzX1U2tZh6xt6MqFstkgbGnSsjwxczzP
         a+8Wud84spXsa61r3++FBMSfy1xaeL/3zir1NgWMLnfcBn/pecx2OqISkQhN+8iNcA53
         uRrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=3yJh5VZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d128si8823356qkf.137.2017.10.17.10.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=3yJh5VZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Vpl-0000WV-3E
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4Vkc-00056L-7s
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkX-0006Nx-SA
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:58 -0400
Received: from mail-bl2nam02on0042.outbound.protection.outlook.com
	([104.47.38.42]:7612
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkX-0006NF-Iy; Tue, 17 Oct 2017 13:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GWBzmC0nxls+1+1GbTw2ChPNol9jt0y8owOEPKmYAVM=;
	b=3yJh5VZCtnhx/5Ao4TvtLoCP98hPoy7YAwgmMDO18cMCvgROFJCxuYJsgeW8OaPMZypMBNLdUePW2GWwvOgSP/JV1TVGR6FKAmHhBAlBPafnSkRv2pQgaq5rGJl9sM0JCcCpvS0ZYzYpOPg6i1OrhB38ZQXeiPZ4FSdtRNcNDvw=
Received: from MWHPR02CA0058.namprd02.prod.outlook.com (10.164.133.47) by
	BY2PR02MB1331.namprd02.prod.outlook.com (10.162.79.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:51 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by MWHPR02CA0058.outlook.office365.com
	(2603:10b6:301:60::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.77.7 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55999
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0003jV-Re; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0000oi-Gd; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkP-0000o4-2e; Tue, 17 Oct 2017 10:33:45 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:56 -0700
Message-ID: <2d15ee794016babca409bc65f1662337aea54e48.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(189002)(199003)(81156014)(63266004)(50466002)(8936002)(478600001)(8676002)(230783001)(575784001)(50986999)(81166006)(76176999)(36756003)(9786002)(305945005)(33646002)(356003)(50226002)(4326008)(106466001)(2950100002)(5003940100001)(77096006)(316002)(189998001)(16586007)(47776003)(54906003)(36386004)(106002)(110136005)(2201001)(5660300001)(48376002)(6666003)(118296001)(39060400002)(2906002)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1331; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT032;
	1:HSYIP0VdvYJaefOEmgAdyhNEI0yVXARaRRBS5psycuJ6Hg3s7P8ediMqK62KpO/aoih9+tbLRefUd7ILG+37z/4Lrd0RTKjFrjapv2zlLthYWXUGaRIFqjL/1srFm1UK
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1846c0f5-2e4e-4aa9-4dc5-08d515853afb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	3:dFu8PunVbeenojIcCOdTpE/1i4os3rMPzXVXYBexaB/59WvnOkf7qzfIHtggK8ZimFZrsmcx81XvXolPuAutcyXHoNMeeEWDj/eQi7rBPA/WhJssrDP5yedzV2nBxzKczC/VOBxlUwDjJD5SyPg7g8wMA7MrgnFLTEMKBr6XKpc8NTQmf309leGdN96uMckJAqOBRrnZRUAbqEBMb41CQRqNPljqfCVsAGxgLbTmpQMWen0aIG7TvNSLxY7SNBNoL88RwWrEwxDr1RCie48GnRtWfUTBHX2T4XeRjVVThSiK3FS/bFE4myVmAbCY7AyZn6PmSAQ/tCb+mFr7raepqCw7pNAowMVrFhGh3Y8YQNU=;
	25:SrvYH8anDqTZen5K+P8v8q0TzHtemPAj3ZYjXnHLr1xCmAmDp1t9FPLixeum7DdDhRHKA1TQsHs2TJ8asA9aMfO3qSwuwKvKhYmM4BdRtFcui+waFI2iFbN1BJsEIAOO114jdtwJvGHl0GCqi5h0njUGZG2RgaFf7tiuge9j0VEmRPoD+TgcekfNQjq/bFMvPpa598kTD9Sjj1mog5jfBeOtd7akWFOf3+gjurxxsrYPPaBEMYei3toTWORxkxWvkFDHj2Nq38Sh+/HsbM/LYwJcQGClIdk2lPtKP1jPFvMkEisy044yP40XVz0s8x75fKsdycEzLq5XZpcseRBhkg==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1331:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	31:Hr1ikd2IU6cbfwD84F+HEbDVuo13GsiEkA9W78NI0bGUKZ/2cUt6dP931RB6ICEqS8NVjdMPdsfGjp2o9FMpDfXiUlYJpK2e6Q6kHAiyAg1hIHSayMcfZMepEf+cpXm2260GZTYi6XkmGFzK9mVuj2FXbLvrBjLlu2zHtgcTSsRLCo/eTNWQr3av+OCF92sP1k1SRxOPpHfFxCrrvblgsq5Zw4dNG040B9sesCCnSMY=;
	20:MdpapknxBLW7JHrNktUEuPfrNArR5NgCyS1MOZ56SDCuR/Y+TRh8T9w1ZSI2Y/jljSODDMGW5d629mfl+TYsLfK0tFn4EQxJ9W3V3aQ0/pOxKdFnfgvTnmVNjiF55p8vWqRi2HpxNQCJ1YrcZWYCv8QT+jq5OmnoicJf0+c4Uo5U6rV2w7kJC0XwH51RYAbd3HFiAqA2k87AeBVbS36ySMZUWJfJUvtzx+GSEqRbkW8GgSpb2/yCchw8zYRqLomnK1sODeOjH6cjZkTuPxcJ8zv6Dsjjbsx2yOkN7B4Wwl5hwk2uf22S90aWfiVhbc4sHvnc+QvnxqfJ7Nd9YFc5J1yotW+RaYrUk1dTANk3AOm8rF52Y40WC5+Hakj8UL6eA5hiP2qqVSnQWQCjs5UtCdcy0KCAcDQNF7xlmWYXjgfJNcV/qNXJDJUKkB0uxFZW5nthRLvbmz2KWqrtbj7lM0UkpY0hlcGm9e1WCVK1JtUEHg7Pz9ZZJZLjXPTPRe8n
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BY2PR02MB1331B74D117C3AA109E4325DDC4C0@BY2PR02MB1331.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123560025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR02MB1331; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	4:sG4qMC2zApsUfxD0yQ+j/HISdNjQDWh3yCXE5bSEo6DUZZ9DUgzuk/Y9gFqyxWST/5TficUP9n6Zr0tcJnqWyHxKrQukbpmQUPqzFIiwL3gDIQ2YJgvCzBgkreDPKU/19mQF1thbpALlbx3noho3mqIt5fZhOyKN83WaNAX4Ot6bU2Xv5vbc2Lb84ExJXnUtcmsZuuvp67BVqI04WbF0G9Rzs+DoTXpej5oJDjSvu4euGSUL1mu6tGNPUMOhK0e4kMMoafYd5KF2C7+syLqpQoalmCWWhhg6q94rJa6zZsY=
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1331;
	23:nthzSw4ioOaGm0nwWpj0VC9VydWHa1zT74ctQyPH7?=
	=?us-ascii?Q?EJnNEoCsPbfHEnhDKV9FLNIihcsGhsrMs9bCyBIPXNIUAIOam+D32+ITxCL1?=
	=?us-ascii?Q?LqVIU7kgJzy9gatoBYzDYHyVEJ/Kpj5KpOPkD+NHYbpmgUVShWeAhAQaArlO?=
	=?us-ascii?Q?0B8laRM+b8n7sNRgsnaEMD8SApQ57l0H4Zc2dAte3AeOF5T5gbmI48Is+EXb?=
	=?us-ascii?Q?Xhr2ljHRqPW9sAUpYThiRsqVJBvBZqcY0p2Qwd0dGK/cV+zn8Fdg2kCm/uTN?=
	=?us-ascii?Q?+eJmjZH5Zx529QiDj8q4Sf+9hPVANo6hRNMf2yq7vOwRgV5IHNEAZaQ/e+sc?=
	=?us-ascii?Q?f+wiAM8k0Gu1gmit8UfpGS74TH5yzwx3Y8yMcrqvHQOIYJgF7l/78ABjEQTK?=
	=?us-ascii?Q?LAIQel+jVePBICu03s4xtYhQVK7odOCFs937Ku9V0mJCMK3luu9f94qvKYrq?=
	=?us-ascii?Q?lqi0uVcnQ8xDAnbI1qqqaFPofEp7VQ/9Xif4Ab0gEVyVbXKPIXC+ruMC2mkU?=
	=?us-ascii?Q?C10ym2uzcvpAH6LZkagUGFM4Jr6ca1tc0i7LXcLNX2vmOAgdfJEJcgzUYIWq?=
	=?us-ascii?Q?2xd3VjqGcHitUfSlc6LHRMbW7ZMnR98U/oAPQs8V3EkctfzEoEcLRM9wPd92?=
	=?us-ascii?Q?Se7+DQxPRylSX29vqad8TFSQuKSk/Aie4kdI4ZRMAVmMYvUHOzslS5MjVP/d?=
	=?us-ascii?Q?Aw1o38FSzDFA1fTykKv9x+4x7spEmG0AFBEeQtJpwn2QK793wCq6zqEFgsE+?=
	=?us-ascii?Q?0qf2MsWKJxHCY/2Wub9MyLpgerHM4CvoiS7d1E5LHIexC2sfBrgH20nj3dvm?=
	=?us-ascii?Q?mNKutooZmg7XPI/ZuiR1ImRSa6PPYhktQ1hzwrv/etM1JH8+F/4nC4yNytwB?=
	=?us-ascii?Q?5Z/QoaunQy6ASkcSB9NK6gCTlFl8doChE0koHkHSe+nGdQzanIeNp3/sGejb?=
	=?us-ascii?Q?YYmpUwCpE0voRqrGQXZLNi9mhIF+/AJcsOPBX3np25tN1RhU8OWNDaPsJvii?=
	=?us-ascii?Q?TJfrY+IFbY43Kg2YCDyXafxXhWejQujZUgf0P64Z/qes+3g4RJy3uyb0ZLEE?=
	=?us-ascii?Q?9QfAvNELjLSrdYNjBF7lgsMbv+LJUJqfOfFZjFIUc4qLVxC2idxSJ/MPY9F2?=
	=?us-ascii?Q?MKXGtP1o6f78oUNDMBAj24VN0eFzUnf?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	6:xX8EwL8SJVClx9F3cKcSp29fxANIDpoDXv9ZzYRaMXJ6L7TIfNOGMP8jR301GVRmBN5wTuAGzRB3fYEReQzMQEbpKw3nu7Mu5YDytPRMVVo2/4XMOLyEtfC8ncgNjgGm0szHF3bgT/mcVu+v9ARWZwqEr2eM9uQ5EY7lZmPt03vHdC0oM/YK9iQxMg8TT6JIiEigCgphMbFzGr1k3syLM9SQsfbNWr72lymp6uwyWqkAZzjDucZfxr+jlsudNoVdj8m0DedR6SDHVZXNKVZMhsu+FCZWunvotyw473w4TW7Pr8G94ZOTfM4EWAogGCoDk00EHWj/ULfWKnaUWWSdVA==;
	5:MVjBgIE+iEfzZl10FGk6oR0PVU42HSo788tsVlGPJhkh2XDngsbzJIhvJ4teTvGuqIC+MUiwTlVamDJf8UD7UUxzWFz9lNW6G/edEJghYgke/XH/q3dmYeL3dStOlEwXKnY97Db1YvyNobaycx9d5/n2YppgQMQdeydZ5JxFgLA=;
	24:kQb9xrPM3J/0Ql/lgoSID5cgDXccT3vY1fiaN0Qj7TkE1FFq0jn0ikzyn/UyYVv3NPVaVuW96AP99mSu7fdBaRSL9RE0JDwswzGNtG4WSOU=;
	7:kKqgOPooyGVQV5fopPYkNA/yM8X15F6EJVqVSkgPZwqvtyLI4cG7S9yfMWD7oJqb8WBpkxlmskAEc/aWJ5IsX0nSZzHDQi12PZWrp4NaiJofEQuC9ZxJzBpgqPZMjfHdVm6qWEINTdwPGZk+GYDopZ2Yr7EhnLe1cp+Bq3x7nz1NfQry/bF5E8xrxee1iQve41MSHYMKnPeQDjpP6IjhcBkW8GVBQ7XV1/EnmqybXls=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:50.3737 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1331
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.42
Subject: [Qemu-devel] [PATCH v4 6/8] xlnx-zynqmp-ipi: Initial version of the
 Xilinx IPI device
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UgDzlvWf6OAM

This is the initial version of the Inter Processor Interrupt device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/intc/Makefile.objs             |   1 +
 hw/intc/xlnx-zynqmp-ipi.c         | 377 ++++++++++++++++++++++++++++++++++++++
 include/hw/intc/xlnx-zynqmp-ipi.h |  57 ++++++
 3 files changed, 435 insertions(+)
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 0fce61e2ce..8497d05695 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
 common-obj-$(CONFIG_IMX) += imx_avic.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
new file mode 100644
index 0000000000..6203b27e56
--- /dev/null
+++ b/hw/intc/xlnx-zynqmp-ipi.c
@@ -0,0 +1,377 @@
+/*
+ * QEMU model of the IPI Inter Processor Interrupt block
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "hw/intc/xlnx-zynqmp-ipi.h"
+
+#ifndef XLNX_ZYNQMP_IPI_ERR_DEBUG
+#define XLNX_ZYNQMP_IPI_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_ZYNQMP_IPI_ERR_DEBUG >= lvl) {\
+        qemu_log(TYPE_XLNX_ZYNQMP_IPI ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IPI_TRIG, 0x0)
+    FIELD(IPI_TRIG, PL_3, 27, 1)
+    FIELD(IPI_TRIG, PL_2, 26, 1)
+    FIELD(IPI_TRIG, PL_1, 25, 1)
+    FIELD(IPI_TRIG, PL_0, 24, 1)
+    FIELD(IPI_TRIG, PMU_3, 19, 1)
+    FIELD(IPI_TRIG, PMU_2, 18, 1)
+    FIELD(IPI_TRIG, PMU_1, 17, 1)
+    FIELD(IPI_TRIG, PMU_0, 16, 1)
+    FIELD(IPI_TRIG, RPU_1, 9, 1)
+    FIELD(IPI_TRIG, RPU_0, 8, 1)
+    FIELD(IPI_TRIG, APU, 0, 1)
+REG32(IPI_OBS, 0x4)
+    FIELD(IPI_OBS, PL_3, 27, 1)
+    FIELD(IPI_OBS, PL_2, 26, 1)
+    FIELD(IPI_OBS, PL_1, 25, 1)
+    FIELD(IPI_OBS, PL_0, 24, 1)
+    FIELD(IPI_OBS, PMU_3, 19, 1)
+    FIELD(IPI_OBS, PMU_2, 18, 1)
+    FIELD(IPI_OBS, PMU_1, 17, 1)
+    FIELD(IPI_OBS, PMU_0, 16, 1)
+    FIELD(IPI_OBS, RPU_1, 9, 1)
+    FIELD(IPI_OBS, RPU_0, 8, 1)
+    FIELD(IPI_OBS, APU, 0, 1)
+REG32(IPI_ISR, 0x10)
+    FIELD(IPI_ISR, PL_3, 27, 1)
+    FIELD(IPI_ISR, PL_2, 26, 1)
+    FIELD(IPI_ISR, PL_1, 25, 1)
+    FIELD(IPI_ISR, PL_0, 24, 1)
+    FIELD(IPI_ISR, PMU_3, 19, 1)
+    FIELD(IPI_ISR, PMU_2, 18, 1)
+    FIELD(IPI_ISR, PMU_1, 17, 1)
+    FIELD(IPI_ISR, PMU_0, 16, 1)
+    FIELD(IPI_ISR, RPU_1, 9, 1)
+    FIELD(IPI_ISR, RPU_0, 8, 1)
+    FIELD(IPI_ISR, APU, 0, 1)
+REG32(IPI_IMR, 0x14)
+    FIELD(IPI_IMR, PL_3, 27, 1)
+    FIELD(IPI_IMR, PL_2, 26, 1)
+    FIELD(IPI_IMR, PL_1, 25, 1)
+    FIELD(IPI_IMR, PL_0, 24, 1)
+    FIELD(IPI_IMR, PMU_3, 19, 1)
+    FIELD(IPI_IMR, PMU_2, 18, 1)
+    FIELD(IPI_IMR, PMU_1, 17, 1)
+    FIELD(IPI_IMR, PMU_0, 16, 1)
+    FIELD(IPI_IMR, RPU_1, 9, 1)
+    FIELD(IPI_IMR, RPU_0, 8, 1)
+    FIELD(IPI_IMR, APU, 0, 1)
+REG32(IPI_IER, 0x18)
+    FIELD(IPI_IER, PL_3, 27, 1)
+    FIELD(IPI_IER, PL_2, 26, 1)
+    FIELD(IPI_IER, PL_1, 25, 1)
+    FIELD(IPI_IER, PL_0, 24, 1)
+    FIELD(IPI_IER, PMU_3, 19, 1)
+    FIELD(IPI_IER, PMU_2, 18, 1)
+    FIELD(IPI_IER, PMU_1, 17, 1)
+    FIELD(IPI_IER, PMU_0, 16, 1)
+    FIELD(IPI_IER, RPU_1, 9, 1)
+    FIELD(IPI_IER, RPU_0, 8, 1)
+    FIELD(IPI_IER, APU, 0, 1)
+REG32(IPI_IDR, 0x1c)
+    FIELD(IPI_IDR, PL_3, 27, 1)
+    FIELD(IPI_IDR, PL_2, 26, 1)
+    FIELD(IPI_IDR, PL_1, 25, 1)
+    FIELD(IPI_IDR, PL_0, 24, 1)
+    FIELD(IPI_IDR, PMU_3, 19, 1)
+    FIELD(IPI_IDR, PMU_2, 18, 1)
+    FIELD(IPI_IDR, PMU_1, 17, 1)
+    FIELD(IPI_IDR, PMU_0, 16, 1)
+    FIELD(IPI_IDR, RPU_1, 9, 1)
+    FIELD(IPI_IDR, RPU_0, 8, 1)
+    FIELD(IPI_IDR, APU, 0, 1)
+
+/* APU
+ * RPU_0
+ * RPU_1
+ * PMU_0
+ * PMU_1
+ * PMU_2
+ * PMU_3
+ * PL_0
+ * PL_1
+ * PL_2
+ * PL_3
+ */
+int index_array[NUM_IPIS] = {0, 8, 9, 16, 17, 18, 19, 24, 25, 26, 27};
+static const char *index_array_names[NUM_IPIS] = {"APU", "RPU_0", "RPU_1",
+                                                  "PMU_0", "PMU_1", "PMU_2",
+                                                  "PMU_3", "PL_0", "PL_1",
+                                                  "PL_2", "PL_3"};
+
+static void xlnx_zynqmp_ipi_set_trig(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        ipi_index = index_array[i];
+        ipi_mask = (1 << ipi_index);
+        DB_PRINT("Setting %s=%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_trig_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_set_obs(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        ipi_index = index_array[i];
+        ipi_mask = (1 << ipi_index);
+        DB_PRINT("Setting %s=%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_obs_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_update_irq(XlnxZynqMPIPI *s)
+{
+    bool pending = s->regs[R_IPI_ISR] & ~s->regs[R_IPI_IMR];
+
+    DB_PRINT("irq=%d isr=%x mask=%x\n",
+             pending, s->regs[R_IPI_ISR], s->regs[R_IPI_IMR]);
+    qemu_set_irq(s->irq, pending);
+}
+
+static uint64_t xlnx_zynqmp_ipi_trig_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_trig(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_trig_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    /* TRIG generates a pulse on the outbound signals. We use the
+     * post-write callback to bring the signal back-down.
+     */
+    s->regs[R_IPI_TRIG] = 0;
+
+    xlnx_zynqmp_ipi_set_trig(s, 0);
+}
+
+static uint64_t xlnx_zynqmp_ipi_isr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_obs(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static uint64_t xlnx_zynqmp_ipi_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IPI_IMR] &= ~val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static uint64_t xlnx_zynqmp_ipi_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IPI_IMR] |= val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo xlnx_zynqmp_ipi_regs_info[] = {
+    {   .name = "IPI_TRIG",  .addr = A_IPI_TRIG,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_trig_prew,
+        .post_write = xlnx_zynqmp_ipi_trig_postw,
+    },{ .name = "IPI_OBS",  .addr = A_IPI_OBS,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xffffffff,
+    },{ .name = "IPI_ISR",  .addr = A_IPI_ISR,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .w1c = 0xf0f0301,
+        .pre_write = xlnx_zynqmp_ipi_isr_prew,
+        .post_write = xlnx_zynqmp_ipi_isr_postw,
+    },{ .name = "IPI_IMR",  .addr = A_IPI_IMR,
+        .reset = 0xf0f0301,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xffffffff,
+    },{ .name = "IPI_IER",  .addr = A_IPI_IER,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_ier_prew,
+    },{ .name = "IPI_IDR",  .addr = A_IPI_IDR,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_idr_prew,
+    }
+};
+
+static void xlnx_zynqmp_ipi_reset(DeviceState *dev)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(dev);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_ipi_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(opaque);
+    uint32_t val = (!!level) << n;
+
+    DB_PRINT("IPI input irq[%d]=%d\n", n, level);
+
+    s->regs[R_IPI_ISR] |= val;
+    xlnx_zynqmp_ipi_set_obs(s, s->regs[R_IPI_ISR]);
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_obs_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(opaque);
+
+    DB_PRINT("OBS input irq[%d]=%d\n", n, level);
+
+    s->regs[R_IPI_OBS] &= ~(1ULL << n);
+    s->regs[R_IPI_OBS] |= (level << n);
+}
+
+static const MemoryRegionOps xlnx_zynqmp_ipi_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void xlnx_zynqmp_ipi_realize(DeviceState *dev, Error **errp)
+{
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_ipi_handler, "IPI_INPUTS", 32);
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_obs_handler, "OBS_INPUTS", 32);
+}
+
+static void xlnx_zynqmp_ipi_init(Object *obj)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+    char *irq_name;
+    int i;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_IPI,
+                       R_XLNX_ZYNQMP_IPI_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), xlnx_zynqmp_ipi_regs_info,
+                              ARRAY_SIZE(xlnx_zynqmp_ipi_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_zynqmp_ipi_ops,
+                              XLNX_ZYNQMP_IPI_ERR_DEBUG,
+                              R_XLNX_ZYNQMP_IPI_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        qdev_init_gpio_out_named(dev, &s->irq_trig_out[i],
+                                 index_array_names[i], 1);
+
+        irq_name = g_strdup_printf("OBS_%s", index_array_names[i]);
+        qdev_init_gpio_out_named(dev, &s->irq_obs_out[i],
+                                 irq_name, 1);
+        g_free(irq_name);
+    }
+}
+
+static const VMStateDescription vmstate_zynqmp_pmu_ipi = {
+    .name = TYPE_XLNX_ZYNQMP_IPI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPIPI, R_XLNX_ZYNQMP_IPI_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_zynqmp_ipi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xlnx_zynqmp_ipi_reset;
+    dc->realize = xlnx_zynqmp_ipi_realize;
+    dc->vmsd = &vmstate_zynqmp_pmu_ipi;
+}
+
+static const TypeInfo xlnx_zynqmp_ipi_info = {
+    .name          = TYPE_XLNX_ZYNQMP_IPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPIPI),
+    .class_init    = xlnx_zynqmp_ipi_class_init,
+    .instance_init = xlnx_zynqmp_ipi_init,
+};
+
+static void xlnx_zynqmp_ipi_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_ipi_info);
+}
+
+type_init(xlnx_zynqmp_ipi_register_types)
diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqmp-ipi.h
new file mode 100644
index 0000000000..4afa4ff313
--- /dev/null
+++ b/include/hw/intc/xlnx-zynqmp-ipi.h
@@ -0,0 +1,57 @@
+/*
+ * QEMU model of the IPI Inter Processor Interrupt block
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef XLNX_ZYNQMP_IPI_H
+#define XLNX_ZYNQMP_IPI_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_ZYNQMP_IPI "xlnx.zynqmp_ipi"
+
+#define XLNX_ZYNQMP_IPI(obj) \
+     OBJECT_CHECK(XlnxZynqMPIPI, (obj), TYPE_XLNX_ZYNQMP_IPI)
+
+/* This is R_IPI_IDR + 1 */
+#define R_XLNX_ZYNQMP_IPI_MAX ((0x1c / 4) + 1)
+
+#define NUM_IPIS 11
+
+typedef struct XlnxZynqMPIPI {
+    /* Private */
+    SysBusDevice parent_obj;
+
+    /* Public */
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    qemu_irq irq_trig_out[NUM_IPIS];
+    qemu_irq irq_obs_out[NUM_IPIS];
+
+    uint32_t regs[R_XLNX_ZYNQMP_IPI_MAX];
+    RegisterInfo regs_info[R_XLNX_ZYNQMP_IPI_MAX];
+} XlnxZynqMPIPI;
+
+#endif /* XLNX_ZYNQMP_IPI_H */
-- 
2.11.0

