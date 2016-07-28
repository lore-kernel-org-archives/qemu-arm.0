Received: by 10.25.21.156 with SMTP id 28csp958082lfv;
        Thu, 28 Jul 2016 12:01:46 -0700 (PDT)
X-Received: by 10.37.116.71 with SMTP id p68mr30972536ybc.0.1469732506578;
        Thu, 28 Jul 2016 12:01:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r62si7584400qkc.141.2016.07.28.12.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqYz-0003RQ-TP
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:01:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYN-0002iV-2S
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYI-0001u0-Uk
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:07 -0400
Received: from mail-cys01nam02on0051.outbound.protection.outlook.com
	([104.47.37.51]:10546
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYI-0001tj-Hg; Thu, 28 Jul 2016 15:01:02 -0400
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(10.152.72.52) by SN1NAM02HT154.eop-nam02.prod.protection.outlook.com
	(10.152.73.73) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:00:59 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:00:59 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46897
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYF-0008JD-12; Thu, 28 Jul 2016 12:00:59 -0700
Received: from [127.0.0.1] (port=52185 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYE-0007oD-VB; Thu, 28 Jul 2016 12:00:58 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIsDjh008158; Thu, 28 Jul 2016 11:54:13 -0700
Received: from [172.19.74.182] (port=55030 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYE-0007oA-BY; Thu, 28 Jul 2016 12:00:58 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:28 -0700
Message-ID: <28921252217b1d14f16889bafa88675f5b7a66cb.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
X-TM-AS-Result: No--7.511-7.0-31-10
X-imss-scan-details: No--7.511-7.0-31-10
X-TMASE-MatchedRID: /TRgAnK1/S14tuR36M4o5EhEDfw/93BupCG8StBZsasGW3hFnC9N1Uq2
	1bZqUTHSmP6k06Ks01wPjfLkrvJIsC9FtW7XfHueYes8EQ/E6i0CbFMFNlE50HGgvdi8ktl0MXw
	w+T4dG2ei+5bTokBGb108lXuja0wlD7+f/jfUYxLJ1E/nrJFEDzVPM/rRSR0dCqIJhrrDy2/Hcp
	N+x6w4QMGhFe3o6ONM4YDO5a1ajthftcgeqYe5M5N65fjGjYMQh+w9Wz/xXDpFNyTs3OcE/4OEY
	N1JwaFzm/O0tSREGpbB1nAjBnnO2eF/B1jEjV+63fn7n/ZHGqY7r2Gtb9iBYYKwF4K/wIz9ymk1
	r1I+qaKzyaCpHqbvv7TJWQ0kcoEtRFuZfuhIqrWzLD5kmcW6ZH0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07RQEL0GGu6SDBsgFm2b/49Ls3qVpktguRcYPyfKHOVD5jQCPfJd2xFw=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(8676002)(356003)(81156014)(305945005)(106466001)(118296001)(92566002)(8936002)(81166006)(7846002)(36756003)(50226002)(9786002)(7696003)(105606002)(47776003)(50986999)(87936001)(76176999)(50466002)(86362001)(77096005)(19580405001)(2950100001)(5003940100001)(586003)(5001770100001)(19580395003)(229853001)(85426001)(33646002)(48376002)(64026002)(2906002)(71366001)(11100500001)(4326007)(189998001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT154; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT028;
	1:qtyGtTVw1lPBM4mbHH00TI4ZYka8cexBNyKTsLqLB3FxCMPgZ2VPpf4C5Bm0uUDIdiu0KpybpCYgCrAPAgjlaEScfTAXlyLvJqrfuAHLln3UuLTsDh3nJfauVQUtQeLgXPYaX/yPVsLkQKeaC9W2l374ArdYipiRlg/VtYANDakHCFJNThFeg5z6bMXYcEKOKOVBWnr9IBavwJaAI5Bp7zbXfehnieyZ5k0fKQQ7QpRLgPlpoPKUXEeD+ZMWr5NvS1AU/wDJER6r/u9nk0wdYWMQUBeWCiqZRzkT+akQwAyfUUUT70khdgU6wYbIFXGwqXBPKpUhD4roFEnQ0xYfLvcqwzydZ/s63+6K4MdUvqgM8OOHCq0/dFcm74Rs5L55/E9mOsd9vqUVqcygTut3/o4spsv6SLq3UsNsGs2MMcupxVjCLfM/vbTk1fr4rbMlwiEsUSZ5AtzxpxzkflGmy6E41JvkyIXfuHmwgsZKvUVcejcxKxaQa9OrsXafmH6NE9X+LYnNOHfcNF3yaGwmWpfo4j3lrYltdGQ/MHIHwAC0sXKH0rbKF8jlTp/zKnzz5Y9mCKUTPNGGyFTcMBaG6WjanCPhKVlxv4+r0T6Muy0=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ee64920-cd54-4757-9eb6-08d3b719838b
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT154;
	2:kzk37pl1EMRrJ6F8eoR1kHu0BWjj49cGi7CX4rvNJt1omwj9BEg/DeSjwiZYgf+sfhy12W0FdDOkI816OmYA+YNO6ej3FvEYo2ktoSgHe+2BHoktoiI6+t0uJK77pbnmEcRjO46sIzq3/n5386ZAhW6hPpwqpEtESEmVeT17IEvIT/nyxKVRYZzVKF2nLxLo;
	3:kyAUQcjQCvUt8JGwf+uLvjRBEUan/u0T0IVYgSRVh2mGCDgCMOxZEkG5EJ67Y8JZOKFYZqf3q0OrTQwfLtyNW4MHA9VT7PNQH2k/VSId3YpP0O5oL5YpuuAAz9HN9fuUj8T1d4deiwyJmIOl8LBE39LyDD25IUxINCE+Pw78Sm5/qm3xs2mtmSQObLIwzK/YYxPMjQRJuEKN+IlHIrpeQMdGiPbw4aruM2GMqCOr8Yc=;
	25:HvATBSL+54qS8azqzWKk8LKwDQ5vbI9PvkXU265VMAA9F7PmG9JtRH4xRmGYLHIVKkpO+CtlsXROmRd6J2EHN722bSc3kl5JG3ZvjL0MJJCKMBQWQOhbXebf8QBVpFddPwg2zN8lYvo9mN2l2oUdmPEKeBNB8e9+Sa9MY4Wu2EOuaN9idebK0EggcO/ZQqcUq6Edw5BYI6uzH7ojUDxWBJC/cCP4G4jZHeeRBEgfOqmDwbc25h1N5wyy6hrBuI1RcISwPEEKj7Rp6Cw2EtULUuIFgeUb9bNovg9dIrHKFcHAbLmaYH19rsRv4NkUtIOn76sCYRTeQkFpicyUjvXk9pLyckznVMZZsbgyE8d0uKxa90wb5QidINZMoT7q/zcQZoP5vckIFAviJSKOoDuWew==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT154;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT154;
	31:FCOcQDDnAGaK/I552nsPOONPu33M/sCDyPRu0vu0vXv4Hhc1/TCdG4BYrl74CwWKaRg5Z82BPR3W6o19P9ejbTIU73X2E0zLO10zi0p4ZvAoI4HD0D6lT8LgEAiQleTGfL4XGKFkPi1YP+7X63cBfqhKVSifuBIe6EF3z4gDt5wyh9D8QToERjoG09pQk1c9w5VFFGL3wL4+GXyHahuvH1BQtZc7bKTRZ/Sa/TrWzPk=;
	20:BBvPwLRdJuch/hUE/xGsTTnQ+rmCQXod4lxBXehJvjHiclPzpOWDc/pM9Hl9uAWibCeu9bSAeHn5lzTS0O6bveytr3wCHDQ39ZrA6PWrgzLgdtPcl7yDCzafmmJIsNd0b+zllFNzBcsGLjwTSldkzESv+C/9K3fPzc3bsb03j5kkAZLGhSpzPka7azwDKiqFPHJOUeIfWJqgdjcVEn3yO5o0wXbx9UQ2yKuK2358qN4b69Ns+dkLt42WXnJuuNw2+qDWJCNpld8OQwFqkkX0DeJ2mCYoQCQIgnTXSkV7bHsyNlwMagte+1xLajswTMnGN7O4TblN0ORdtH9676+HxOKR+MopjGPP+U2sVk78w3hEdeZH74sUaqdbYFqoC4ruc95rmYeHhh3UE7DprSTz9GDfX8YB4kiNatOkbja7Jbk9Nl47gX5nEdGWv645hyxsQk3QCiP468qFHJm54Y77cHgnBRDVQHHoPL0I/jDn/043ywLA9Tus3K/slLZ4n2GE
X-Microsoft-Antispam-PRVS: <59f7201e8a9b46d88457a098c5fa65f7@SN1NAM02HT154.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13023025)(13015025)(13024025)(13017025)(5005006)(8121501046)(13018025)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT154; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT154; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT154;
	4:Xjf+zJ+F42qXcA26++mfEGXBodjl95e0JVfxygzErtdpc06dIxdCnkBHgbidxg0uirqRak+cIIffF+0BcfwSI05Ovb496cx410Mz8IVD7un/+qv+1vbMcSpWeILuK9ghZuF/0UrSMmmQGtdleziwb8HZXoDYgprf9KzPKDbXzXVRdgI45QHnaXNtoJCZaJJ+f5r4LWyUUdJgB1O55apepK3EVmRheg524rl8CMk9ts8dE2PQ221XYFwEu0QVv9HuG453z6Bvpuhnh/wSqh8heSnn1blWu5KYndJ/UkNNjdA5G5uFa2KhErba6eSIzzHXgYlKgoU6rk5bFrP3UlxiHWicO2YFlvDazV5WUXmVsPILZ2expbayLiSjOlCj91+7InYw14sjTsB8ShXEY/j/s60odw6bQdEb116BJSmI1FJ1b63n5/RKH3QN+pA75zgLT8rQmc844K7rn+gq5h4aE+yuiKLku7MBVhjPofRfb6udjwbE5MDNPettziek6YlxcAYkRadU6MI8I0B3ynf1SuSRvMdWFoZPlqqPBKW7xMM=
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT154;
	23:T5O1cpBug0WfCVJmjfiNcMwPUTeNzMQDcmfIiDypj?=
	=?us-ascii?Q?uNSaDg3wv1yL9XVxZFBlmVqnXRKnjEPDKSew4Ai0WCmhJj2vPEmszKcz/CMw?=
	=?us-ascii?Q?YxRaUahbh5AF7rSBw4ZGTexBsm8lPEM1WbU/nG0bS4q87wYErBchxqxADX9m?=
	=?us-ascii?Q?Nc1Qc3Og/+/BUVduORUikaD92FNN1shv9b9ra6lRsJZMxS4UL8wIKaDR7RoN?=
	=?us-ascii?Q?khTbwofihSAtRkPvhioi0wtRfERmTje50J6e+RwgIBi4F3teEe9eJgB0BQzw?=
	=?us-ascii?Q?5C0/TMPVvRB2IlYOnawLYlTW4AGCL7UM35pOerOjf2ZR3uAgN6TOq83t14t9?=
	=?us-ascii?Q?8cCcfrWpXtfpdPlUSRCS51VEBmChBEMZrkLqfbDxawOsT1ygtBo2kPa7Dug0?=
	=?us-ascii?Q?/IbQQc1bOeTBkMXZn/wjPmCeEH6H/WcM4rN/vCE9yKOtmg/QYfdOD9X8f36p?=
	=?us-ascii?Q?Qzy3L4F79UINobvbvDhs4NuCLJjJ3ZlpKSpIhENjcToAq5zgBG3Pwi4WuITO?=
	=?us-ascii?Q?LhtFDzYF5pT17xunoRKlXg0O0jb8XX6XQv0RTDbWiBqcW8zyXU6Cqr+D8kJI?=
	=?us-ascii?Q?dCJL7BtPrrVL9HM2o1LGtk/2ePQFvWYMHvziwyWQI/ylX1lNzKovD+L5td5G?=
	=?us-ascii?Q?xqS+MsL2QPDqX5hZ47UNQp40ZM18AC3s7fstmc7DV1ILJgfU7z9fVUM+3Lsb?=
	=?us-ascii?Q?lplrqNBIa9syUNMNZztX0KFmhGInOWiWcK7xfjvW5I1gHT8Zn+tpYtFnRh3X?=
	=?us-ascii?Q?ag6xfrz2QQRO7wcGYjD3nzkPl617NBHfE6rmO/VMBx821JG2rqtLGyueqT4G?=
	=?us-ascii?Q?c9MEQHKIFj6BjlKMflj0QHZiaolt2+aBo6vShffuqAew6ewUWWVWFb1pUMGd?=
	=?us-ascii?Q?GiSM5Xc8ktHl+YACFPcEoPScuRZUYNeZGoZESTYIdefqEWKm1wrjHGv5FvJF?=
	=?us-ascii?Q?IBmQ7aR6jlhwseNmgHjwGP+lesqaR6CgSurnhudAhUHHfv+FX4afsbgLDgR5?=
	=?us-ascii?Q?7eZAS+AhK0rVHzmrZjItXs5khdZgRDAVbdLwPDj+g/mOuYvOr27A8e4R5fMD?=
	=?us-ascii?Q?/OtPLzn3uwso5fgJI+ubDbJHyhHru3VHp5XgEO+8LaWgkFg5gAQlytwJRPfJ?=
	=?us-ascii?Q?l0hDgPONC75/cbeKF5ie1mZ9tbHb8lSfBnSNXgY2gluQa1w69FRxrdsI1Xs9?=
	=?us-ascii?Q?j9j2eVUJChknSE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT154;
	6:PuUi/QKyFu4yY0KuYPwzLdUioyg4p57x60wvf3xRM9AXJM7bDHVjLSvYF43uZ8Q/XzyKujtno/msSMvDZOR2DJHTkQWNd/PX+nKb4Qzkm1pDvTYqzsG+kwal0FNJUHBRugereXAJTHegyDAb2in3fgb/CJ2MFRA/JhTsXLpaGuwI38IVRMyuqD/lu+RWnffBf4WSa6JWJUi5Gac4iV8yUvKfHnVXtWzUECD4IyPaftJMAt5q0pHBYVwqcNazkfWHPplMyQjTJb49iFzkmkCESMM6Ws9Pxr4WPEKKucLKu9P/v6E2IbU3c+vdE695X0OdIwO9spY9pYx+Nadg2eVUXA==;
	5:mF8BtUNiNprkOYz7RybOlKM8YaKET106+vr3svtSWWga+x1MH4AzsltOrl89+BDrlvLxIVRCnJwoRxpMFOVqb/Kzm6OlyfSeQZDcECwNanEMwadMY2xq6A8rePCbPOZ07Klv9BhbNnMo8kVYWAvK+w==;
	24:VsObwKyqGFQZWv6qvPM6O07tOKEhgUX87KaJPTnVCI8ed83Y4WrcTPgUsNr0S0EQ2WpWiBsYkgUFLmnKSaIhnAQHz5lQbfO7/PgDBgc8aGU=;
	7:ZEqtBuKWAVeCe7rNer7W8bBbuAk3bVNhNlJMt3va3pb/nS1ixSj6sfhitCUehkd+dP8xjmCqA3w8cYmU5mYb4nTZG/D7Ig05YQMu96R7L1n9TcB9Ub0k3tWZc/6B64RwvfPxWeWrBM2Dyx9csqZGpOB6iX7uYmp7pPTk+e0TDeNWjECCFgYxFZwTtx3oU0BMBMINf5y0r2gGr8mpAal82ASCMQzXVm/p6zsMOKwK7qqqL0j7k0X0XdaJNfCuFxlN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:00:59.5590 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT154
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.51
Subject: [Qemu-arm] [PATCH for-2.8 v4 4/6] cadence_gem: Add queue support
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HsQBnffDhZGd

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

 hw/net/cadence_gem.c | 131 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 107 insertions(+), 24 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 49a63a7..c46fff4 100644
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
 
-- 
2.7.4

