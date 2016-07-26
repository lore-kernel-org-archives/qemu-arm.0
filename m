Received: by 10.25.21.156 with SMTP id 28csp1429708lfv;
        Mon, 25 Jul 2016 17:13:32 -0700 (PDT)
X-Received: by 10.55.99.23 with SMTP id x23mr23959231qkb.93.1469492012017;
        Mon, 25 Jul 2016 17:13:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l88si19420847qki.120.2016.07.25.17.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 17:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRpzy-0005gW-Ec
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 20:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzp-0005al-64
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzk-0005kZ-ML
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:16 -0400
Received: from mail-bl2nam02on0067.outbound.protection.outlook.com
	([104.47.38.67]:42240
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzk-0005kT-GN; Mon, 25 Jul 2016 20:13:12 -0400
Received: from CY1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(10.152.74.60) by CY1NAM02HT193.eop-nam02.prod.protection.outlook.com
	(10.152.75.120) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 00:13:10 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT047.mail.protection.outlook.com (10.152.74.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 00:13:09 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:32960
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzh-0002Ct-Dh; Mon, 25 Jul 2016 17:13:09 -0700
Received: from [127.0.0.1] (port=38247 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzh-0000nP-BP; Mon, 25 Jul 2016 17:13:09 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6Q06OWd028703; Mon, 25 Jul 2016 17:06:24 -0700
Received: from [172.19.74.182] (port=59996 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzg-0000nK-Id; Mon, 25 Jul 2016 17:13:08 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 25 Jul 2016 17:12:39 -0700
Message-ID: <0402d187c9f749701f6fe728faf3e28c6b86a74b.1469491920.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22472.005
X-TM-AS-Result: No--8.222-7.0-31-10
X-imss-scan-details: No--8.222-7.0-31-10
X-TMASE-MatchedRID: aucoW/BY6QD3Zb7NlHCdGMnUT+eskUQP7h2RrsKOiu1cKZwALwMGszbm
	BAt/D4qBkZ3T6ylBNAUJtSxQJDk9QAm0n0hBEkVLAoNa2r+Edw2k+iIHu+gscTnZfxjBVQRblwW
	f7/4SyDu1CSF0i9kAZymeQNcmArCl6fubsV+A+k9H+PTjR9EWkt4N8Q+ldC7USnWuwqfQPkbe9i
	ux8ViNa4cIrST8bc6RCigFqF1eQVDhfwdYxI1fupLB2j2kEEbAf6/Md8Lb2l8cZFsYO/SuCAVA4
	U9fLCsO2xLw3ExLGlTrixWWWJYrHx8TzIzimOwPC24oEZ6SpSkj80Za3RRg8POSBeu7Z2pkbWlp
	plieeGbxQLYauOdjI+nFyJeZS6zCEaaWrbC1PlU=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(2950100001)(105606002)(586003)(106466001)(305945005)(86362001)(9786002)(5001770100001)(5003600100003)(7696003)(356003)(7846002)(77096005)(33646002)(19580395003)(19580405001)(36756003)(64026002)(47776003)(5003940100001)(50986999)(229853001)(76176999)(4326007)(8676002)(81156014)(189998001)(85426001)(87936001)(2906002)(48376002)(50226002)(92566002)(11100500001)(81166006)(8936002)(118296001)(71366001)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT193; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT047;
	1:euaB7Ts/tsp2RpEfE8yvyAg/7kIFG16QfKq2NCQC2vAf8ZGXHjfXz1mUscPBxEdq5y103eVu8Th9pZPXUnDwF4Y0AuUbufjNznPSE0FbCnh4klljnvAKI9C9kqPATsv+dVE9gIvpCjhCQBjgkiIBaHFNFV2i4hNUwEaGuxiAbp1HxQII7nXw0KfOiLfINoz73oTHM+nqSc6qFLxl2372VtIpANlIQ/i7q58t4cTBELKTPFhbJ2ou7fSe3Fjp6wr+bVEjrWNWrIAzSJBST5eWOiWv4oGk9e5DGFciITP0LNtiV6gnmb9tD9pdOweA7qiahkQ0pdtJ5aUBBTyZK/XIkublvPY5JE0BeIZQHGnsEotrs+FKTEg+wwuz5+Vm3zJsxfZdkNMDOEcIypfCnFw22d7lakF+bgFdOspmgG0+OzrU+oGJb5UfeeJbgZBK4tLMDT3iFf476100HG4sVAyEGhIqxoVKG0V3tKMh9JAON323dRcoOS6h2P0mvwhiey6fXpV7OwMM69kffnfzNuD63VU7s679bKxFucMc75m1aUexmWd/W5gTBjHNyRIPMsZZ1PYTbW3JfsSZrG3/NzuATsyDPFOZRhAWyaH0TuwS8zc=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 433dd7c3-95b0-46a8-7020-08d3b4e9a081
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT193;
	2:D4uG/S/9p5w+3+M5nUdnQgCIBzyqlSlsUMjCdhWlzrt3HV6YPw2vbrlfkX0RLXvouILWFfxHR28ySnT7fjXoGPqPoLZ9NQ548WO9vGDjfBazjFrnVrX7cpuIzkzjg0mmMeQdckZoPCv6O5xygdcb0ZOiP9Nt9aQ32grLSHRgRtr77BO/C6wrV8cdDfjOpx4b;
	3:OeMAmZ921RiaAMCWMtVnqnPkUfXZL2ARPqkzIvKjtJRF0zLDfxr6IT8ITIFuRB6aDT/ywvp8hbC7v2uE20e739v1staFz9Z/5svJ0aFmrsBLrfKRecmlEBgVeN1qdyel0EtjthNPEvfdmWTs2bDteCPmJmpAqBovGK2OoWlfH4JVfl9AdTOWAuLBr8x1t2Kf3IVkhJw/TFHQudI8RmCMp+e1fKwTYTlyjGht7eHJIas=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT193;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT193;
	25:UafLqocLH7hOByr6GMPs+OjB+3l1BNOnn/rkbymOZQ0d1KEt0IEPq8YE/FYxsw9UJzY8phYzYJamX44eB+uhJgIFMk5EqQngW3G1Nw5Vytt1fEOAVmGPmRsB+SGZd05d7NM2eEV4uMAbW76rX4nMd1PHNZmMMuKfniUMktqscsm29efU3jlwUyCeEEl8VfzkjB7Ld2FiErPRK0YK/q6kQ1aNGY6lcb6syswkGApNE4um2MPUdTVf5cID/CG3gP4Pl9QN2S0Nv6rJeoL5lIcCi+mdAgZ9Du01hE+q14Kdtka/o1KMuhWsyd2wU6xFG/iatZ7bXfPFek+hbkiBoQnqdkXMUf4DEvol6SpO+XjULaauCoCMSBqqZlfDx1H4ixtvw0Trv3ryftAKdpA74XFkNFrd/TbVRWdxJZ8VVzRglG2GqLp2OCf2NyMNa6hPLHN4EeOWepXbvKl4k7iNIyczivsnvN7DNYNU6lZqaqPiI3VkDBmKDSDEmMIW06+vT3TOGETDHxPu7GF/qHC0AGC1g2tJ25DruotpKtt7jaHpmIrz4btV5vQMu0HJSWDfz7/JBQqRbndRz3AmUNhxdS4CMHb10whoHkYhKQ+zGhTs50SPh7gskgcxqbGY1lW2oAb68Y4gNlZseP0eZvdazAAGOJ8QqAlif8Exx5Au5xfBKHMGm9VLmGaneMdcYdOzprL4u8Y4dU/in82gAEfEqZFHrsmlZ4p1rgDKWA/S/7FmGOr06T9JEH5D6R+E/6m52ufdsSNNfMTA0z3Fy1g993sKL06dDOcaCQHEUZAXm+RpFyk=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT193;
	31:W0t8euNMUzhgvaU1LrMy+XcR7oEiUoRmdH8R8fDkSB9QlujvY3P8M2zrgv0U/8HNyGagQ+c4HaUsaarAO4ura3ZQC/xUzoRDrT3EzTw1L78tZ4wNhdvoUfNBqtFGqIC8eyGd47SmdVT1Jhxk1vILftf5JPbgB8rNj+iRDc/xlo5SqDiZI6OD2jr84KtC84irFCbujF+fwEvpU5GBEVaDNw==;
	20:UwebBiVRBgBcVSRik1ih5NMbSHObZSWFEKjAzeyalU/vDDGOTstt+2S5h+iMbpWQZ+35L0VITchyApUaEPMXKmpJTbWZkwaR4H1nsyN5hbIoWpM1FOfVVIxE1rYoCndW9agP4Wi/UsNhWKxcMVpO2jzq6jK4XlC7Xe6BAFXQmJLnylt8Vf5JxJVnfBFb8Ra3HzF16rlRd2Ka7TPxsBFXP5mpO9gmuXMYAJ35loeN2FXTSx7owVHHX9+dM3eEe08HAWQ9jKLls2PPWFX5ArHflf07zMTZHxwLSbld5j5hqtR16mCSVd0PnYFAZduHCovgNTGJmtUGFT3rludGmcrRj+/e5P2Ls00Hm1rJUUf2tsB2zQMl/AdV4TlC8BNQkapuSoSHSVQaYb8MPfyzH8n2EYIzbxeFHKQHErYz5yLvjpcqJDLu4tHOyvRFiiUcmJuRVnJqxD3wfiqshL10/xpKSUtFHzJW+VxQIEZ9XJG9HoGeEh+kOmCmQnxqtxGM9VKa
X-Microsoft-Antispam-PRVS: <80d06220ed1b4a12b71d1a121c1de0bd@CY1NAM02HT193.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(13018025)(13023025)(13024025)(13017025)(13015025)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT193; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT193; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT193;
	4:kqGBhYed3LBoabN60z1HJbQqJmIWHMjUauZCPS62tjnRO+Dvk185mxDRBsvefuPTp+ttmHZUbAYNUNPHhXKTvAJ1ESEMoH72TyWj0ZMd3Hh72otRFcCQVUI57nt5oxdMDLtIDUBYuD2b4BkU5zM4eTnsqgv3EPXOtM0OTWXaYgslHslbxnjMQwk6hMV5fv/mqcZ/gzGrW1XpCMGnm+QK5tP4peHIZ/ZYaPoI1tYS54YiQmzefF9gtMKfdA9DDHhqQ4/G0yT50XsJUZP0tEo0bhuoTTNuMwdRnqbcdnJ/jsLVxPLbWVu86FkA+2pKhizFG0HCL9zOZwedJelzN6WFSvUYnhBCUbe+l8qf9+a+7HindgwedorRtdNvi5RTU/RNmEBrPrQG4t5Gajv0zuq60lCQu3qnJvwV0mCUHyn+73DAzwQ2rA90/wa9xJXQiYt6u6+wOjvLhxYcLFvUtSMpKGl2dv7Cxa4z07rm1Qs+JZEDoydzVJbRmSv3siv2699khXSTEfFCAwA+3Fhdt4cO8A==
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT193;
	23:5FLBRKaqO0ikse9kORQuXLAN3YG5BJdYzdv0dYj0I?=
	=?us-ascii?Q?iezIvG7vbYc+5rS5cGkhYcidviqy2TD3Iyp/wg5TIcqUeKZnQ69h784K0+km?=
	=?us-ascii?Q?1opLitv0Noeitm70Igfu2a70s/JHpAPUE4YsZqfOhLA+rGWA5gjuCRvn8j38?=
	=?us-ascii?Q?xTpHt1qnJAzRHWaUwHkkE1WG8CFWnrc19uCZXnoB5vK6N+azc95t2DPo2aZG?=
	=?us-ascii?Q?1UtDnK4pRU3naw4t3QwgTal0RNT/lMRVJ8iiAEExOaRsySwmXWDPt7I1jpd1?=
	=?us-ascii?Q?VUFCtticeSqL0wmhP1QSaS5GLC9eDLlmWvBhFZ4C4YozChykPDx4j6f214pi?=
	=?us-ascii?Q?5CDisZDJe74u2ujCUL2JD5dZGmIVhLed/Kvr91tacy4fSGaJOily8bEabWgi?=
	=?us-ascii?Q?KlicWzEDSz/x8ThOejhp5yI3nNgFeOb8HgmSpLP5BThYxjrV237K8PxLPknE?=
	=?us-ascii?Q?d9Pz1eYgOzDZTFZhVCVSPV129pc1zX8Hrte06nXFrEUp4LmrLLV0TmwTEdlZ?=
	=?us-ascii?Q?bE2/Abx9E31boQ0bXyWWRQV18XZa36AyjCA6RyC64xQfs64rAr5jGbEG1hCy?=
	=?us-ascii?Q?1x2uvO4rX8GR70b5AS1CYjk78d6kYuZAlzuw2ybQzqww5L2ZDsG1VFs4qkCY?=
	=?us-ascii?Q?N0mrF5gKXUXXdW03PJXiuH7HnXffnQd8rS7aVdkbYm1V3n8N5ZVjRN4vAevF?=
	=?us-ascii?Q?+yHwmwaxBGmZZkf4BFIJeTJB3UOfWMqAlMTxx3n0FngKdIrZYLfJ5T7EEhVp?=
	=?us-ascii?Q?Mk+Hl1WGm+p50QWpr0iAvXLAz9i901ki9PM/uLIH8G6laomezV38Wr3VQzPy?=
	=?us-ascii?Q?x459YUwaFIGNoAyBGZvXAku3JudaQ7CPompmJ/3UooOSrzaFUvISKREdT1ah?=
	=?us-ascii?Q?D3MeRXBU18QNkd9LpwGTrgSNBj+qaBw/OrIskE1ucZLMXhW2w5pNq7/eMuLa?=
	=?us-ascii?Q?Nb3QmORs+NKuecN48O3iYnVjWsx/9ciYQrf1KuU4QXIozOwFGsHHtpsr7s6Z?=
	=?us-ascii?Q?cE7tWIikUXGaCUScO9Txtf5zeFfVropl6/EQwRGqZPyUpJipjITCB7z2N7zL?=
	=?us-ascii?Q?4dbxbOI1+9IVTjpe+1BJTVDH5cUbgyrqXCKu2JQ3mn/zNPwDOgsGLTDThdEp?=
	=?us-ascii?Q?Hizpoa/FB+vkkYKvFcExqhvErn46bqfAHXjZORI/qzws8xWiXzFV+8Qy3fiT?=
	=?us-ascii?Q?esjRZdSNTSJaCevMqLT+lNpTBa7f8ku/2dE?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT193;
	6:8Og/nnGlAgUhMCYbpoBojbgowcOla8G6Y/gGMQbWTJdETKF0SOMOt/TRcU5WFxJ0ez8NMzfufWx26pzQ/84ShLAdic4koKNj4nsjCA/YmZgwJwK9a6MsMqNO4Or+w01zrSGS6E7nomAmi/oeOQaQE1tbTC7EGXbPY/rY4xsjnXVl1GLG2AgD+EeszOLPZck/r1s0e1JlHhDNHWYkQ9WddXLWM3KGkNuekpKy+ppUp9TcaKFWDqq8tH0QKAl2k7xKoCCKjj8I3gw+O6AnmQzh2sjYFLC6iw4UoKhgBlrRGf81axAnzqXptoZzPRnsihM5Tw+XmfEj6rQD8zsIxCxLXQ==;
	5:KP3i3e/On52+ae0VErhn4gnXQvEtpe9gLJ6mTrN/KhqINU3bi+h+vGRpmgDsHSUiFvCVGRgms/I+b0Dtnsw+uhd5ZCRg6Vq2uXw6ENlnFhel0gwm1VgjovN4NKO9D/UizCGdHbiqwnKQJlobW5TWyg==;
	24:yuwHPVS+3xyK29W8ytbXD3mvYIA5IESwvzHnUhR7E0SBQWMJu5Ro7iF+0563wxkxKj2gG1I7MJsiYWdVgc7YTeKOQ3kEpQpXBgKQ0UVzsvM=;
	7:9VFEQa48FjGYa2rpikbnWfsvlK+NOyCRF5pg/nAxipJaSFhaod9Z1ScAyc8pK/ErPbVJgXjvVNLwXwSIEleAshPwCOePX/y0yqngdW/ig4YMIoMzgXxR2z8spqoTYJqWHFYWUL/mJ48a5ZHwvPq4ACNnhbyly5QlMkk2OZYZ/+mnA+njJeX+K71WrNumHrQWe87yQL61xREjuHVhX+k3pQNWVpsfT69sDhDTXmMBeGHMGZd7Yo9iDG+PxWzl6bxk
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 00:13:09.8526 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT193
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.67
Subject: [Qemu-arm] [PATCH v2 3/6] cadence_gem: Add support for screening
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
X-TUID: syancbfV+KNy

The Cadence GEM hardware allows incoming data to be 'screened' based on some
register values. Add support for these screens.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V2:
 - Initial commit

 hw/net/cadence_gem.c         | 151 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/net/cadence_gem.h |   2 +
 2 files changed, 153 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index deae122..d38bc1e 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -26,6 +26,7 @@
 #include <zlib.h> /* For crc32 */
 
 #include "hw/net/cadence_gem.h"
+#include "qemu/log.h"
 #include "net/checksum.h"
 
 #ifdef CADENCE_GEM_ERR_DEBUG
@@ -141,6 +142,37 @@
 #define GEM_DESCONF6      (0x00000294/4)
 #define GEM_DESCONF7      (0x00000298/4)
 
+#define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
+
+#define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
+#define GEM_ST1R_DSTC_ENABLE            (1 << 28)
+#define GEM_ST1R_UDP_PORT_MATCH_SHIFT   (12)
+#define GEM_ST1R_UDP_PORT_MATCH_WIDTH   (27 - GEM_ST1R_UDP_PORT_MATCH_SHIFT + 1)
+#define GEM_ST1R_DSTC_MATCH_SHIFT       (4)
+#define GEM_ST1R_DSTC_MATCH_WIDTH       (11 - GEM_ST1R_DSTC_MATCH_SHIFT + 1)
+#define GEM_ST1R_QUEUE_SHIFT            (0)
+#define GEM_ST1R_QUEUE_WIDTH            (3 - GEM_ST1R_QUEUE_SHIFT + 1)
+
+#define GEM_SCREENING_TYPE2_REGISTER_0  (0x00000540 / 4)
+
+#define GEM_ST2R_COMPARE_A_ENABLE       (1 << 18)
+#define GEM_ST2R_COMPARE_A_SHIFT        (13)
+#define GEM_ST2R_COMPARE_WIDTH          (17 - GEM_ST2R_COMPARE_A_SHIFT + 1)
+#define GEM_ST2R_ETHERTYPE_ENABLE       (1 << 12)
+#define GEM_ST2R_ETHERTYPE_INDEX_SHIFT  (9)
+#define GEM_ST2R_ETHERTYPE_INDEX_WIDTH  (11 - GEM_ST2R_ETHERTYPE_INDEX_SHIFT \
+                                            + 1)
+#define GEM_ST2R_QUEUE_SHIFT            (0)
+#define GEM_ST2R_QUEUE_WIDTH            (3 - GEM_ST2R_QUEUE_SHIFT + 1)
+
+#define GEM_SCREENING_TYPE2_ETHERTYPE_REG_0     (0x000006e0 / 4)
+#define GEM_TYPE2_COMPARE_0_WORD_0              (0x00000700 / 4)
+
+#define GEM_T2CW1_COMPARE_OFFSET_SHIFT  (7)
+#define GEM_T2CW1_COMPARE_OFFSET_WIDTH  (8 - GEM_T2CW1_COMPARE_OFFSET_SHIFT + 1)
+#define GEM_T2CW1_OFFSET_VALUE_SHIFT    (0)
+#define GEM_T2CW1_OFFSET_VALUE_WIDTH    (6 - GEM_T2CW1_OFFSET_VALUE_SHIFT + 1)
+
 /*****************************************/
 #define GEM_NWCTRL_TXSTART     0x00000200 /* Transmit Enable */
 #define GEM_NWCTRL_TXENA       0x00000008 /* Transmit Enable */
@@ -601,6 +633,121 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
     return GEM_RX_REJECT;
 }
 
+/* Figure out which queue the recieved data should be sent to */
+static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)
+{
+    uint32_t reg;
+    bool matched, mismatched;
+    int i, j;
+
+    for (i = 0; i < s->num_type1_screeners; i++) {
+        reg = s->regs[GEM_SCREENING_TYPE1_REGISTER_0 + i];
+        matched = false;
+        mismatched = false;
+
+        /* Screening is based on UDP Port */
+        if (reg & GEM_ST1R_UDP_PORT_MATCH_ENABLE) {
+            uint16_t udp_port = rxbuf_ptr[14 + 22] << 8 | rxbuf_ptr[14 + 23];
+            if (udp_port == extract32(reg, GEM_ST1R_UDP_PORT_MATCH_SHIFT,
+                                           GEM_ST1R_UDP_PORT_MATCH_WIDTH)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        /* Screening is based on DS/TC */
+        if (reg & GEM_ST1R_DSTC_ENABLE) {
+            uint16_t dscp = rxbuf_ptr[14 + 1];
+            if (dscp == extract32(reg, GEM_ST1R_DSTC_MATCH_SHIFT,
+                                       GEM_ST1R_DSTC_MATCH_WIDTH)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        if (matched && !mismatched) {
+            return extract32(reg, GEM_ST1R_QUEUE_SHIFT, GEM_ST1R_QUEUE_WIDTH);
+        }
+    }
+
+    for (i = 0; i < s->num_type2_screeners; i++) {
+        reg = s->regs[GEM_SCREENING_TYPE2_REGISTER_0 + i];
+        matched = false;
+        mismatched = false;
+
+        if (reg & GEM_ST2R_ETHERTYPE_ENABLE) {
+            uint16_t type = rxbuf_ptr[12] << 8 | rxbuf_ptr[13];
+            int et_idx = extract32(reg, GEM_ST2R_ETHERTYPE_INDEX_SHIFT,
+                                        GEM_ST2R_ETHERTYPE_INDEX_WIDTH);
+
+            if (et_idx > s->num_type2_screeners) {
+                qemu_log_mask(LOG_GUEST_ERROR, "Out of range ethertype "
+                              "register index: %d\n", et_idx);
+            }
+            if (type == s->regs[GEM_SCREENING_TYPE2_ETHERTYPE_REG_0 +
+                                et_idx]) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        /* Compare A, B, C */
+        for (j = 0; j < 3; j++) {
+            uint32_t cr0, cr1, mask;
+            uint16_t rx_cmp;
+            int offset;
+            int cr_idx = extract32(reg, GEM_ST2R_COMPARE_A_SHIFT + j * 6,
+                                        GEM_ST2R_COMPARE_WIDTH);
+
+            if (!(reg & (GEM_ST2R_COMPARE_A_ENABLE << (j * 6)))) {
+                continue;
+            }
+            if (cr_idx > s->num_type2_screeners) {
+                qemu_log_mask(LOG_GUEST_ERROR, "Out of range compare "
+                              "register index: %d\n", cr_idx);
+            }
+
+            cr0 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2];
+            cr1 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2 + 1];
+            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
+                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
+
+            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
+                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {
+            case (3): /* Skip UDP header */
+                qemu_log_mask(LOG_UNIMP, "TCP compare offsets"
+                              "unimplemented - assuming UDP\n");
+                offset += 8;
+                /* Fallthrough */
+            case (2): /* skip the IP header */
+                offset += 20;
+                /* Fallthrough */
+            case (1): /* Count from after the ethertype */
+                offset += 14;
+            }
+
+            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
+            mask = extract32(cr0, 0, 16);
+
+            if ((rx_cmp & mask) == (extract32(cr0, 16, 16) & mask)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        if (matched && !mismatched) {
+            return extract32(reg, GEM_ST2R_QUEUE_SHIFT, GEM_ST2R_QUEUE_WIDTH);
+        }
+    }
+
+    /* We made it here, assume it's queue 0 */
+    return 0;
+}
+
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
     DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
@@ -1263,6 +1410,10 @@ static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
     DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
                       num_priority_queues, 1),
+    DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
+                      num_type1_screeners, 4),
+    DEFINE_PROP_UINT8("num-type2-screeners", CadenceGEMState,
+                      num_type2_screeners, 4),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 77e0582..f2f78c0 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -46,6 +46,8 @@ typedef struct CadenceGEMState {
 
     /* Static properties */
     uint8_t num_priority_queues;
+    uint8_t num_type1_screeners;
+    uint8_t num_type2_screeners;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
-- 
2.7.4

