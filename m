Received: by 10.25.21.156 with SMTP id 28csp1862329lfv;
        Tue, 26 Jul 2016 11:28:49 -0700 (PDT)
X-Received: by 10.55.78.146 with SMTP id c140mr32432076qkb.48.1469557729258;
        Tue, 26 Jul 2016 11:28:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14si1238493qtn.142.2016.07.26.11.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS760-0002rQ-HF
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73u-0001Kr-Rz
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 14:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73t-0006Pr-1c
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 14:26:38 -0400
Received: from mail-bl2nam02on0066.outbound.protection.outlook.com
	([104.47.38.66]:62176
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73l-0006Lg-Ep; Tue, 26 Jul 2016 14:26:29 -0400
Received: from BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
	(10.152.76.56) by BL2NAM02HT191.eop-nam02.prod.protection.outlook.com
	(10.152.77.248) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:27 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT014.mail.protection.outlook.com (10.152.76.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:27 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52077
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73i-0003qr-Q9; Tue, 26 Jul 2016 11:26:26 -0700
Received: from [127.0.0.1] (port=57365 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73i-0006O7-Ns; Tue, 26 Jul 2016 11:26:26 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJfJl016360; Tue, 26 Jul 2016 11:19:42 -0700
Received: from [172.19.74.182] (port=41278 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73h-0006O4-To; Tue, 26 Jul 2016 11:26:25 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:25:55 -0700
Message-ID: <40e8bff80a5e957ed68226aed569f676f7c78f2e.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--9.192-7.0-31-10
X-imss-scan-details: No--9.192-7.0-31-10
X-TMASE-MatchedRID: X8U+ZgfjRBJnPo6E5MV+9FVN8laWo90MlIvcAfYJnEo0QmmUihPzrAOk
	uVkkJKW7gML9UOgCBPce/q8NHnlIYDvsSwE6Lz763ZsI+hkqIjskMBkEieOjZtilG/maIsZ8LPJ
	tWpbJjY0tx19X4JNSyr8G5FZpgcqG3drJ6tQCW57il2r2x2PwtW51jMx4o6uk0SxMhOhuA0Te9i
	ux8ViNawVgJPeVoo1fSs97DSzjg9PQf/Mt4GBfb5JrW03DacWEOjpYQcUotRoUnhXZChKvF3ROw
	AUH8TPXOfAiJ/eonC3BowxuB9F6wiIdmtkBwO3DQpxiLlDD9FU3GofkGVB3jluLVkUNPNw0tePP
	VOPX6wJPiiF3yvgxQGYlLqTvfoxMu+Ep/j1O1gCeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJOOKL7CZMhwA5bccV0uX6KV8A2r+FmqYEHVzZuww7vX2ftwZ3X11IV0=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(11100500001)(47776003)(5003940100001)(50226002)(105606002)(8676002)(85426001)(50466002)(19580395003)(19580405001)(50986999)(76176999)(229853001)(71366001)(189998001)(4326007)(2906002)(586003)(8936002)(33646002)(81166006)(77096005)(81156014)(64026002)(86362001)(118296001)(305945005)(48376002)(5001770100001)(87936001)(36756003)(9786002)(7846002)(356003)(106466001)(92566002)(5003600100003)(7696003)(2950100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT191; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT014;
	1:lne5t7g4Ck7+quIUoFIA+lBzQJnwj/UK5RJLnkvpzXiJ/2HSWU2cZJyUyKsuTUk9h4t/8ss14ZHsRH/3XbYUj0h28qTA5bDT8ibooSPATgM7poOBoQpDD0lBr6MliPCUAm+ZT1PEwDktYFG8UDUypwVi3H8afexqaipEMq6qFmNEPQU8tIDrZikcdsr8BO9OIxPkeUNbQ/3AT2B5LA2gyvivFqcDFVFbVtT3wgqi7Fn5qkdx7FcBpyqM4yJt9Uqm8CsmNjX/8InyQNkGcbinsBP7+dyuiuuf6gx9BRCKXi6TJalEpXgaYv9GWJ9+NSPS0fqxOwlurFMh3JPmoBJB4c9DmQcw+Jf1p/7Bf+O6bupwb2H61Ui9ftGu5yzks1ERDlByyqb+BwNqcnwP24mrmA++3O9e8KYdJX6o+uZvJjGb3CuWDvma/wqTwgsFx9qw06GXq7AZ1lox/TB3ohIQ4pN27sRJP86fhyj3njoP2bw6/eEjcx8z3Zah8JASDXU+Ezxilqzyp/Cgo8ZB7z0CYGwt+ptkcxqDXatVc7cEVRMziyFir+BEP/p4K+u1OoCs4LVpw2iY+ehgLF0vsDRS1lWX+UQ8mbXV7gyg6f5ZCu0=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 197475e3-65a9-4e9b-c6e8-08d3b5825bb2
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT191;
	2:Ps5JVzmVCDj2e2373KA5PoL/8CyMsKmqFcSGpRnPDLJax7kRvJc2Ly11KSKop1a4qTEnNmxKw7HcCBK6ymrlDaGnViKhx9vTRQZ4CytLfsGV+cYE0OP+CKKWAQv/S06VssBkvXv8f5IPIUY9MaWB3CtxESFVcknTstsmMH/k6bAHxImVP2U/1rYZhOD/l5s1;
	3:Y8LO5aBfgP8xo8AqY8HRln+hvIc0ygBbkC3U9rIJY3RmmV6Ba+Q2NF710kNH9/7MCzXfLDHt2C3MaCx4hcNx8MefbSlT2Vvc+UqSfF6kde1QsexktURQAvcZOdmZgSKkSUU08kqjoAFvpLN7jDv0N79WWvAMy8l8SvCDL0iaYCQ2adaPk6KYRqijjP5pxWmjz31XDakS/qIuwJQMJH97GzSYuBYPNj8N7/Br++0+JeM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT191;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT191;
	25:KuLcRx4Ephmf3+K836kWGgG1VxG0UkV7Qfg1rQeX5UHANjRsDDydcPu0y3GTqeSXbwwrk93SBeF5HqaQqi/w9dH+GcYjJA4qTtzf6qlHXpp2H06wKbiIirSiubpS1jYjRMCI2kE6S+4+xlSjy6w2TPPHLiPNXB4CtKJwcjIkJC2lYAHplPnfzWjTLL/Gg8PVP/thsmlMzE7pyJuY0Wgg85G3+0eMZpnq5c8aSa7iZffP4iHl1/2SPK813pfvsp+fFxEgEv90nMgU2pc+h7+PI1TZZg6gtkKEaDHpZkmwLFkebNXs/6k0p01seYUOOy4kAckPREUiRqQeir0qBY5rXkD275dtW2Ld4gkrBpB/mXCwdA8EYAJg4nIDl6Dl8m0f/Ed71EjJve0a4+g0Y7iTibrwtdfAibHpzwfRl2ADi5FPTTLpqLy1khvRgnRCAAHIhiF0pJs1/pR7R5+X9dzgD4/Hw+JYOu3dbyCDOFP+cQzX+zI2ocHHbaqhERGQ0BiabUdPsQzUgIe3USgnWJCy2aAD0WWTI/Q+hfoZixPiIlotcNW9EPgyIbXD/pq9p2Q39LHQUPo3IFpkVyabhXoJTEP9tkpJG3q29ssJNxaRwGY+0dKLHHluALM4VI2qkv3raiCoDeNz+u/0C8gCqOq6Er7CrwjLOfUt8fqM29CbE6k/4MeYQEK/PFwdu1uQohnfglwnLK8tflB8fCZ48QWGRJndvhhkUFf1taNXfACnzHn51PRRHeLV9nC3w1y4iGNGLlKsKiRfFdK33Vwrq7LqeA==
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT191;
	31:FwvWmxrLrSV3MqLf2qp/LRhZTKszyXlfLaGM5Gczv/S1TrxAhuLmkzpkmvAin0OTE9pb3KpO3zqC+zxQJzi5nLvNrDVxRlz8mc+bI91cCphPOxGWCNJvdKNkTSuIgbooviH/8uI/Kh1E0+JBYHs4/rWfTvXIC96IpjZ9nJuArwhsn4qc85NXdIDbQNQ6F/OYErpOd8F6ueTyyT5idzy6GA==;
	20:quSzUX1l5RCe7w1LUg9Rab34QMJT5loHDRBHm3Ed3uE1ZyBsXN0+OaO2xra6QLABdayI5pUPSkGCVEyCL4h+IfWk9uVF8qPg9rsyTWKx7BbsXh2ALP4e4TAjjL9TpqcEyww/onlI/n1ftxjrm4wp+tlRDF8cA5rKCTO+Gf2eGpyusnhnNrfhADaXqmayYOk1k2x8+6OOU61M8AiIsBeUW5ubRqeJci3XeitHguI2xAK9NDN5ocJss1v/BT3ynQUcvdMdrW4jEvuIFN5Onpa+OaFPq4SOrxISc7oqOFlzVgqJXvuAZQS+OvGGDnnBY/rv7/WdiXabIpCS1qjpngRubmCa5orIOMD2g8GCUEFT2cDjpEb7g21/cvQQziiGTy8lljhDVc/ZBMtSJVuL8erLoTrJYZljEEtybJH/fxPA17DalG5gbr/CJEpKRutNPkuQJUzCOUspt7T1QHxg9TzJIcMM8c95MN7R+Jk52pgaUNn/oh/lNVDghz3TNC7bKFy3
X-Microsoft-Antispam-PRVS: <347e53e749194c4da8d332aabdea0463@BL2NAM02HT191.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(13023025)(13018025)(13017025)(13024025)(13015025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT191; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT191; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT191;
	4:AAND0KAHPZm4B+0vdEDJaAYvjrIy1qejb+wHTvi1MxrTNGr0yZMoKugQAJRk3R+LuKocEYwW8fyr/Wwa8Fy7aLcsT7RncnFyATpTqTzKUkG+Eh6dff4B8qod9z3DK0itY5rFGC4TkEmEiTzOFOmuHwo1EUlbUJnT9TMvZ2eFVX/b1rqKhptGLhCIZ58wUAgJ7kekY9SjMKtvJPlctHY9b/Z8VJdAhNjZBTXekTOgCqXvZDNoV/WLVQ+L+BoBJ3pEzs3oa9h3hN6ABMMW5DaSHKNRAsdPmF8vdRb5CKCxYDD4Ub83rd1nd4B/Ch1aT3XYJGTF3nrVrjU2wlMk9kdM5oEWu9qhmomjQwoSCMh5D7eeMGJENSGhbXFZY1EjGC+KOL+rk+9yxdDJtHKLlJoLVORQrILDdFokZNr2mdnUXHw+MJU9URrCzBjG5yIt3R8hlhwP10ZiQ/9eh9o4/sytglRGBYXuqKjyp9iG2Eb26r/JiTtLVCcZtThUPkgeJ74LPYuai9S1lDVrglKU/m6mbLqTp3l7N/3W3CtD6cbxV3A=
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2NAM02HT191;
	23:6wJrHLURn65q0SmcA1e56Hz/VyqP4mcQq5pr9YX49?=
	=?us-ascii?Q?75bqr5AFb5g9ocMIGPW1ApFmEuxk0yiay08N+BnNoOOOIRaQrghYxnmLxPvT?=
	=?us-ascii?Q?LGOdM7izRvZJHhemQNFhAle16E7hUj2Mryj8K2BUpcqXKGUSJ+BNZ4Ae8L+v?=
	=?us-ascii?Q?yje0DOEbtqXr48vb/C5IbIOFiGhu+swmxnRt/bLGhEIO9QTm2jL3YrkBvKjC?=
	=?us-ascii?Q?ZShOQY2EpBFx8yLXroYq/nXRWQvOpjc+4ajK7q/ZHVMqp8+fBxQYlw0RMQeZ?=
	=?us-ascii?Q?mW4zmkgy6Yluhywk38Gn4FDPaOv/fLJZqQ51rEJlxVNzuo/ycfxXIasPvetJ?=
	=?us-ascii?Q?TDRA79IQ4F/mtJ0qD5/uhs+WwjTmJ1S5cSLS4e1GDlCH9HkRZKBxrd6ZiZaf?=
	=?us-ascii?Q?UCwi9/tCzToOYtgxMg8kmU7na3UzbMafva4ScXE+UeXguvJm3yPjJ8frBKnz?=
	=?us-ascii?Q?VTXNfGN6qydbA42yacQQfMj5uXsndUIqwwctsaeE5vvCew8ZlHWu9vbc6cr3?=
	=?us-ascii?Q?9bzOo+Nyr3cMhVPWCRlbeA/S4Nm0rLwhwevQi0nJXtIJ9C1Yiu8jbI+zjukj?=
	=?us-ascii?Q?bQd/pNZc8pwOGYVOHyGbWr2jHIq8yRg5ngAEjZ3Gk4G4p/4Nd3nIeMuJO5id?=
	=?us-ascii?Q?qYMGz3Gf5Vl2bYNF2XGAqLKM63rOx18TOssC9tuZ6LHhAAgL8q1e3axpl83u?=
	=?us-ascii?Q?R82blf6eUPDndt9vJ/Z07cCAGVn55N/kuDhmuZz7zSydh9dWrMrdOM+K3zn7?=
	=?us-ascii?Q?pQ+iDBSfRyF44EqESBVPZDJnB1zLR8cprsWZc97lXHoEwLgJC9ieJoBlDnsX?=
	=?us-ascii?Q?U9pnQjTWrAXGA6U+CYWQFaoGVP1ub9AGLSGmXbeQPX7g6bQAuT9VDuMUxZmx?=
	=?us-ascii?Q?T5BmA4yXH/h5Pyj9sr4czS1hLj9orxjJLsGQcdjcnAwkXxIBr16TRhHj37w7?=
	=?us-ascii?Q?Zhz/hkip3XpjyhrV5mOjqWXsucZraZESgEsuC3uYuFW2cjuer5I0rRXbwL1y?=
	=?us-ascii?Q?dYprduGg8Ieol8VH/YaNpRlWu9uLZCVHsj02nDDZ+aLySJnpj8UtUS3P7Kl4?=
	=?us-ascii?Q?b6HWX4QeoTQZk39hE8dC0arxpfBWwqMG1RoRxaPtwzWRTXnQOLlg8rdhG2Qe?=
	=?us-ascii?Q?lMUQBv6PjXXpI9lUbQNGCTZgGDvqekrhOueaXM+L9DRIbi2hefv6Hz9SC7j/?=
	=?us-ascii?Q?13zb8XqXAPiBaXMOJBT67rvKTRg6EoSuKYa?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT191;
	6:BIZsvEEgggHfFs2fcH6Wop25ZAvy/10uzfninvmAifWiNpzUL5Lr794NnzBknqdO+bPVK2LxyoTEhArO7cN80Qm1W5sCJmGTI+B0FQA9DJe1mxrqNPZjrea5A15F8lR/thTi7MaO80HssRGRVA4A4GFhIcb794e8Nyxp68pRgpCDkg9c3S7TEIgRGkBcZnR320j6hccfDdjVPrgEWn8quLPDyQBF4HciHeJYLlY5NFGetIr3QwgtnwMfDN8D6U9axI/U/rvTgSLLfGKlDujsThC3SDBXASsPIPQMq0+AxFsFWhHj/TxnDpGAAKgEbIcc4mBgwrsEhYBsos3GuMqYjA==;
	5:Nrvop5reeARvnLmjEadiFaA8sZjdDiIKzLRNRP3RdLxyWjalTKipeUDPY+lQKNhTysS/R1fJ6+wnGY4TgipnqJcfKtD3O6Lty/P/mWkfmVq0k4MLBkNc858YpL3sQK2atxGftzaIhCbkox1bqWGEgw==;
	24:pS597TXhfO4xY/We/O2zjR5jmWy3xGGzSuWQjus8QEA0dPlGHf1W3WA3zaGkgf2Jr7DoP7mN/xDCUc3Z0jnMgE6ljtL2wefYSc0d91uz9Nw=;
	7:EBcANQ69JGxMts9bWsvsHqkS7r7LzI9EE9wL1PR0HUYMdRvZGSL4e1a+H9U4GaMPZo/IP1JYXJoszKV+JfAuXUk7l571p1jSsfvEM8JxM/vP3D8z4s82z5Ul+inI2qUaktji5mxLqfA+yHPcCzDQ+yvGxKVQUUm2MiTLj7KAk75jI/aTMzsfsTH8nKccCzEGr0LqooNAxV7elmUgF1sIxJ6LzUazW9i5hTin4lONXX1byCNWRMsxf+8KQbdQPMua
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:27.4753 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT191
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.66
Subject: [Qemu-devel] [PATCH v3 4/6] cadence_gem: Add queue support
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: khnfk9/SKDzZ

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

There is a indentation error in this patch in the gem_transmit function.
I have written it like that to make it easier to see the changes. It is
fixed in the next patch.

V3:
 -Fix up number of queues logic
 - Fixup vmstate version
V2:
 - Use the new screening function
 - Update interrupt generation
 - Increase vmstate to 3.0

 hw/net/cadence_gem.c | 135 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 109 insertions(+), 26 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 0b15c9c..c46fff4 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -143,6 +143,30 @@
 #define GEM_DESCONF6      (0x00000294/4)
 #define GEM_DESCONF7      (0x00000298/4)
 
+#define GEM_INT_Q1_STATUS               (0x00000400 / 4)
+#define GEM_INT_Q1_MASK                 (0x00000640 / 4)
+
+#define GEM_TRANSMIT_Q1_PTR             (0x00000440 / 4)
+#define GEM_TRANSMIT_Q15_PTR            (GEM_TRANSMIT_Q1_PTR + 14)
+
+#define GEM_RECEIVE_Q1_PTR              (0x00000480 / 4)
+#define GEM_RECEIVE_Q15_PTR             (GEM_RECEIVE_Q1_PTR + 14)
+
+#define GEM_INT_Q1_ENABLE               (0x00000600 / 4)
+#define GEM_INT_Q7_ENABLE               (GEM_INT_Q1_ENABLE + 6)
+#define GEM_INT_Q8_ENABLE               (0x00000660 / 4)
+#define GEM_INT_Q15_ENABLE              (GEM_INT_Q8_ENABLE + 7)
+
+#define GEM_INT_Q1_DISABLE              (0x00000620 / 4)
+#define GEM_INT_Q7_DISABLE              (GEM_INT_Q1_DISABLE + 6)
+#define GEM_INT_Q8_DISABLE              (0x00000680 / 4)
+#define GEM_INT_Q15_DISABLE             (GEM_INT_Q8_DISABLE + 7)
+
+#define GEM_INT_Q1_MASK                 (0x00000640 / 4)
+#define GEM_INT_Q7_MASK                 (GEM_INT_Q1_MASK + 6)
+#define GEM_INT_Q8_MASK                 (0x000006A0 / 4)
+#define GEM_INT_Q15_MASK                (GEM_INT_Q8_MASK + 7)
+
 #define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
 
 #define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
@@ -317,9 +341,9 @@ static inline unsigned tx_desc_get_length(unsigned *desc)
     return desc[1] & DESC_1_LENGTH;
 }
 
-static inline void print_gem_tx_desc(unsigned *desc)
+static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
 {
-    DB_PRINT("TXDESC:\n");
+    DB_PRINT("TXDESC (queue %" PRId8 "):\n", queue);
     DB_PRINT("bufaddr: 0x%08x\n", *desc);
     DB_PRINT("used_hw: %d\n", tx_desc_get_used(desc));
     DB_PRINT("wrap:    %d\n", tx_desc_get_wrap(desc));
@@ -449,6 +473,7 @@ static void phy_update_link(CadenceGEMState *s)
 static int gem_can_receive(NetClientState *nc)
 {
     CadenceGEMState *s;
+    int i;
 
     s = qemu_get_nic_opaque(nc);
 
@@ -461,18 +486,20 @@ static int gem_can_receive(NetClientState *nc)
         return 0;
     }
 
-    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
-        if (s->can_rx_state != 2) {
-            s->can_rx_state = 2;
-            DB_PRINT("can't receive - busy buffer descriptor 0x%x\n",
-                     s->rx_desc_addr[0]);
+    for (i = 0; i < s->num_priority_queues; i++) {
+        if (rx_desc_get_ownership(s->rx_desc[i]) == 1) {
+            if (s->can_rx_state != 2) {
+                s->can_rx_state = 2;
+                DB_PRINT("can't receive - busy buffer descriptor (q%d) 0x%x\n",
+                         i, s->rx_desc_addr[i]);
+             }
+            return 0;
         }
-        return 0;
     }
 
     if (s->can_rx_state != 0) {
         s->can_rx_state = 0;
-        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr[0]);
+        DB_PRINT("can receive\n");
     }
     return 1;
 }
@@ -483,9 +510,20 @@ static int gem_can_receive(NetClientState *nc)
  */
 static void gem_update_int_status(CadenceGEMState *s)
 {
-    if (s->regs[GEM_ISR]) {
-        DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
+    int i;
+
+    if ((s->num_priority_queues == 1) && s->regs[GEM_ISR]) {
+        /* No priority queues, just trigger the interrupt */
+        DB_PRINT("asserting int.\n", i);
         qemu_set_irq(s->irq[0], 1);
+        return;
+    }
+
+    for (i = 0; i < s->num_priority_queues; ++i) {
+        if (s->regs[GEM_INT_Q1_STATUS + i]) {
+            DB_PRINT("asserting int. (q=%d)\n", i);
+            qemu_set_irq(s->irq[i], 1);
+        }
     }
 }
 
@@ -754,17 +792,17 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
     return 0;
 }
 
-static void gem_get_rx_desc(CadenceGEMState *s)
+static void gem_get_rx_desc(CadenceGEMState *s, int q)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
+    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
     /* read current descriptor */
     cpu_physical_memory_read(s->rx_desc_addr[0],
                              (uint8_t *)s->rx_desc[0], sizeof(s->rx_desc[0]));
 
     /* Descriptor owned by software ? */
-    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
         DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr[0]);
+                 (unsigned)s->rx_desc_addr[q]);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -926,7 +964,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             DB_PRINT("incrementing RX descriptor list\n");
             s->rx_desc_addr[q] += 8;
         }
-        gem_get_rx_desc(s);
+
+        gem_get_rx_desc(s, q);
     }
 
     /* Count it */
@@ -1014,6 +1053,7 @@ static void gem_transmit(CadenceGEMState *s)
     p = tx_packet;
     total_bytes = 0;
 
+    for (q = s->num_priority_queues - 1; q >= 0; q--) {
     /* read current descriptor */
     packet_desc_addr = s->tx_desc_addr[q];
 
@@ -1027,7 +1067,7 @@ static void gem_transmit(CadenceGEMState *s)
         if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
             return;
         }
-        print_gem_tx_desc(desc);
+        print_gem_tx_desc(desc, q);
 
         /* The real hardware would eat this (and possibly crash).
          * For QEMU let's lend a helping hand.
@@ -1078,6 +1118,12 @@ static void gem_transmit(CadenceGEMState *s)
             s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
             s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
 
+            /* Update queue interrupt status */
+            if (s->num_priority_queues > 1) {
+                s->regs[GEM_INT_Q1_STATUS + q] |=
+                        GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
+            }
+
             /* Handle interrupt consequences */
             gem_update_int_status(s);
 
@@ -1119,6 +1165,7 @@ static void gem_transmit(CadenceGEMState *s)
         s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
         gem_update_int_status(s);
     }
+    }
 }
 
 static void gem_phy_reset(CadenceGEMState *s)
@@ -1225,7 +1272,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
 {
     CadenceGEMState *s;
     uint32_t retval;
-
+    int i;
     s = (CadenceGEMState *)opaque;
 
     offset >>= 2;
@@ -1235,8 +1282,10 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
 
     switch (offset) {
     case GEM_ISR:
-        DB_PRINT("lowering irq on ISR read\n");
-        qemu_set_irq(s->irq[0], 0);
+        DB_PRINT("lowering irqs on ISR read\n");
+        for (i = 0; i < s->num_priority_queues; ++i) {
+            qemu_set_irq(s->irq[i], 0);
+        }
         break;
     case GEM_PHYMNTNC:
         if (retval & GEM_PHYMNTNC_OP_R) {
@@ -1261,6 +1310,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     retval &= ~(s->regs_wo[offset]);
 
     DB_PRINT("0x%08x\n", retval);
+    gem_update_int_status(s);
     return retval;
 }
 
@@ -1273,6 +1323,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
 {
     CadenceGEMState *s = (CadenceGEMState *)opaque;
     uint32_t readonly;
+    int i;
 
     DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsigned)val);
     offset >>= 2;
@@ -1292,14 +1343,18 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
     switch (offset) {
     case GEM_NWCTRL:
         if (val & GEM_NWCTRL_RXENA) {
-            gem_get_rx_desc(s);
+            for (i = 0; i < s->num_priority_queues; ++i) {
+                gem_get_rx_desc(s, i);
+            }
         }
         if (val & GEM_NWCTRL_TXSTART) {
             gem_transmit(s);
         }
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
-            s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
+            for (i = 0; i < s->num_priority_queues; i++) {
+                s->tx_desc_addr[i] = s->regs[GEM_TXQBASE];
+            }
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
             qemu_flush_queued_packets(qemu_get_queue(s->nic));
@@ -1312,9 +1367,15 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
     case GEM_RXQBASE:
         s->rx_desc_addr[0] = val;
         break;
+    case GEM_RECEIVE_Q1_PTR ... GEM_RECEIVE_Q15_PTR:
+        s->rx_desc_addr[offset - GEM_RECEIVE_Q1_PTR + 1] = val;
+        break;
     case GEM_TXQBASE:
         s->tx_desc_addr[0] = val;
         break;
+    case GEM_TRANSMIT_Q1_PTR ... GEM_TRANSMIT_Q15_PTR:
+        s->tx_desc_addr[offset - GEM_TRANSMIT_Q1_PTR + 1] = val;
+        break;
     case GEM_RXSTATUS:
         gem_update_int_status(s);
         break;
@@ -1322,10 +1383,26 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         s->regs[GEM_IMR] &= ~val;
         gem_update_int_status(s);
         break;
+    case GEM_INT_Q1_ENABLE ... GEM_INT_Q7_ENABLE:
+        s->regs[GEM_INT_Q1_MASK + offset - GEM_INT_Q1_ENABLE] &= ~val;
+        gem_update_int_status(s);
+        break;
+    case GEM_INT_Q8_ENABLE ... GEM_INT_Q15_ENABLE:
+        s->regs[GEM_INT_Q8_MASK + offset - GEM_INT_Q8_ENABLE] &= ~val;
+        gem_update_int_status(s);
+        break;
     case GEM_IDR:
         s->regs[GEM_IMR] |= val;
         gem_update_int_status(s);
         break;
+    case GEM_INT_Q1_DISABLE ... GEM_INT_Q7_DISABLE:
+        s->regs[GEM_INT_Q1_MASK + offset - GEM_INT_Q1_DISABLE] |= val;
+        gem_update_int_status(s);
+        break;
+    case GEM_INT_Q8_DISABLE ... GEM_INT_Q15_DISABLE:
+        s->regs[GEM_INT_Q8_MASK + offset - GEM_INT_Q8_DISABLE] |= val;
+        gem_update_int_status(s);
+        break;
     case GEM_SPADDR1LO:
     case GEM_SPADDR2LO:
     case GEM_SPADDR3LO:
@@ -1362,8 +1439,11 @@ static const MemoryRegionOps gem_ops = {
 
 static void gem_set_link(NetClientState *nc)
 {
+    CadenceGEMState *s = qemu_get_nic_opaque(nc);
+
     DB_PRINT("\n");
-    phy_update_link(qemu_get_nic_opaque(nc));
+    phy_update_link(s);
+    gem_update_int_status(s);
 }
 
 static NetClientInfo net_gem_info = {
@@ -1377,6 +1457,7 @@ static NetClientInfo net_gem_info = {
 static void gem_realize(DeviceState *dev, Error **errp)
 {
     CadenceGEMState *s = CADENCE_GEM(dev);
+    int i;
 
     if (s->num_priority_queues == 0 ||
         s->num_priority_queues > MAX_PRIORITY_QUEUES) {
@@ -1393,7 +1474,9 @@ static void gem_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
+    for (i = 0; i < s->num_priority_queues; ++i) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
+    }
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
@@ -1417,8 +1500,8 @@ static void gem_init(Object *obj)
 
 static const VMStateDescription vmstate_cadence_gem = {
     .name = "cadence_gem",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
-- 
2.7.4

