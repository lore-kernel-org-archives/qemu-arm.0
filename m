Received: by 10.25.21.156 with SMTP id 28csp1862350lfv;
        Tue, 26 Jul 2016 11:28:54 -0700 (PDT)
X-Received: by 10.55.43.229 with SMTP id r98mr31509789qkr.62.1469557734032;
        Tue, 26 Jul 2016 11:28:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si1261771qtb.9.2016.07.26.11.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:28:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS765-0002ux-9F
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:28:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73y-0001Nz-AR
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 14:26:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73x-0006Sq-Eu
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 14:26:42 -0400
Received: from mail-bl2nam02on0045.outbound.protection.outlook.com
	([104.47.38.45]:39179
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73s-0006Op-2v; Tue, 26 Jul 2016 14:26:36 -0400
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
	(10.152.76.57) by BL2NAM02HT091.eop-nam02.prod.protection.outlook.com
	(10.152.76.171) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:32 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:32 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52090
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73n-0003qx-Qi; Tue, 26 Jul 2016 11:26:31 -0700
Received: from [127.0.0.1] (port=57378 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73n-0006OO-Nd; Tue, 26 Jul 2016 11:26:31 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJkVu016403; Tue, 26 Jul 2016 11:19:46 -0700
Received: from [172.19.74.182] (port=41284 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73m-0006OL-RB; Tue, 26 Jul 2016 11:26:30 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:26:00 -0700
Message-ID: <b7f14b20d89051feb1bedeb2aafb74db758a8d37.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--4.237-7.0-31-10
X-imss-scan-details: No--4.237-7.0-31-10
X-TMASE-MatchedRID: OpZG7Ha4m7C2jsN8aguKvGNW0DAjL5p+MyouZnRyPDjfUZT83lbkELg2
	PcpzvEciLPVFwhmBX1vibtj5CZ7LrrvaJG+XDhc2ngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDUAc6ie4OhFAUAwhyW9fj9pv6FRRFsFSnkaRwsb7+ExdglykIfybt8vIvvUaX8EhoJUhC
	IxQJNVwfYEG0wJP64LlzOfX5XBYM2ZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(356003)(71366001)(118296001)(8676002)(4326007)(2950100001)(5003600100003)(7696003)(2906002)(19580395003)(7846002)(19580405001)(64026002)(305945005)(85426001)(92566002)(33646002)(9786002)(50226002)(81166006)(81156014)(8936002)(586003)(47776003)(77096005)(5001770100001)(11100500001)(50986999)(229853001)(86362001)(5003940100001)(87936001)(105606002)(50466002)(76176999)(189998001)(48376002)(36756003)(106466001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT091; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT029;
	1:4+vRvjnaKmUrkVCFJiJsdHuf+WTLiUnwehurrtSzUBK0hGaky/t0smMXuwWd8yTWFeGtCG3AFz7wy+5s4ogg6pU+vVf2s2Urq59WvmQJyG9xHxhoJc4pdITvS5+nUKam4ZcxiLXSFvP+ricI1RXvIfb1B3cgplixHhLMZvZy57E4xFDDfxa4TvGpSxn0v4hNYUcCJ5Onbyp9LgvHXpiLiK0GtylOrj+W6BBFR0WODax94UEUbRbBw3WtLoTKNj7FuNt9cYmsryRCT87mLohN8Eg/1pd6N2H+4F8F8aukMFdGQn5+ZILYDP6xtRsMrvTJMIGBPTebm2nK6Egth40j73WwLrdyb3KS+oTnCfJHbdXP33nvpp91F0jaod0mJWtxkSdMKLaO8XT74HWfbYT7DykLG8LtpsiYPo4999M2UOcamd0GCUW51Dz3SRRJmP57Hk0Y54c0ZYM4rwaZH3mDMduDFFXV1QhzZzEw+oyeST8RVmzzL7rQFaDc75lxbOBhX4iE60oT68/GvbXwjeInxlL6YYdRCcQ58IAarRG/qZJ+KpeKwhVUMUzinumu287/s+E7gZir28417LMzm+yn3jnPXz1Ux0yna2mSddfARJc=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 140fc4f8-ce9b-43aa-068b-08d3b5825e7f
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT091;
	2:SHLYXCQCGBIxsRAAhBqFFWPEQ31SItIs+Zy6fki3Gt1927vo+mkU9aP7kIkvnCGC3gS9oCQYuvDc+gXKcH5uH+97XbPsxVBrv2W9sdjud2LKkWV93PS75/f2kPbcfjbwqfzOmoRum0s1lgWK2dCFVf6p6QxSF5NmC/ZvvNiO8EMXNGNBDDxJdZLhcuiPPXF/;
	3:OIjjLx8tPkKuTOh5ZqqyPvr0AiJLsLV91xOXkHRU07h1yvP+vF2GGsDqRzBaCm71+JZZOn9TTruY9/lz/ztg1TqgwGtQUhwPHzH//33rqxJRgnKTIhZ0T+jW0qrrN79cYsCMbLkxhnIdH5mhC9RNUx8ahGmYTWwh7Bi+OrnSlyhNjthdBXtKaQpSSlDmeCEnMdG5dcmpqpC2bJRg9X+K6XDwpii8IRFxOtP0X2oFSds=;
	25:jTMdtJ8qFZhJJQ6ztsI6sBU11uO1bNSzh3jEoZ46e4eIplItRyMxj+64cerpUWufQ+l3y2TcLHm7qVsomRAGRuZp3lIWwKWqZdpiHeSiQCKAfFzc0xqMoJSK5KFFkSQ5AaQyUvc5DmmyuEIXqUAD0816onJtV3aWV2ojzzscUAkOVH7WrQ2AiHcfTuTaDD6gnNlokHbXbUHYC1rFVv4goAkQ+OdXDlyUXoXx1w7MGPXlmXQTTOW4eQcqQR9xNKo8kQ3mCTmzdHLaLfulPLzaaKzfbBfBtubYVbT1xUEyumfnYCWo4DuFrc6c2WKa5W8l3kYuCqQBMet0uttZ43FbJhCbXW89iHjsh5VD4ogSG/tsd//A9eAZBD8Cm3eqdGtkLs4dby2oND2qdvJoDbGdcDM2piK2yCKXXNUTTNQ1BiQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT091;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT091;
	31:3NxPFh4s0iWlTDFOMVuGzIZSyAx1VyO4aj2sxsr9m5LCPNhFeIYb3D/svNzLeMX027Ok0MomZ6bBTT62bjgS+xLuDRoMMZ1HPSrNotHTBgWhaCqb1I2Fx98kkgqG6kXKJDeQU/vhydPZLg6Y9eMb7h9hw0Xs79hy7YT8Ub6uYOV6Ng6l9cso6v/H0QR8f10oYJ+0voS/OtJ4sYVmujelKw==;
	20:F4h+d394Igts9vfa1Mt+ZW7O2Nfb1zpaQe9bxFZGiPFHwxF775UH5LXYrkgdUxYS8rbzdgaq3U1YrhwwHevmBaUFavFhhwq9q3ui27Cy94AXaqoIIhiJ7bdoNbjWGLse9Tb7WDMO/J1eormZsE+US1UpIb1LSJAfLWIZ2999kpXsOCBZcDUzK4vdfNh7+n1Ln0wF4KxXZY4zdVIBeI08JkLSw6mqBANkKGquS5mbNM4j/FflWk6j9gzru6KMVCe24OxssFUhDTBrIfsscGZ+rFyXFfLzxcmc248SIqjOPsiJc43yPtUyqXmWrIJo8fa5j1h43v45hrQtGqpgz30fgHVkhF1E6s+zNMotfzK1yPlc8S5ZPrvMFpyD2n1v8L+JxExbhuMvnDcOGsOND6OP3XQdwBV4DE4L5te07Qwz6T/b+BlNJMJG924IvJBHfWtRHLY8u/C3LOPZF7iDgRK2/wCmghnDjgAArAhi0wUSPZtjJu4mGTgRNpas4dB5N/IK
X-Microsoft-Antispam-PRVS: <17b6e76552f34c2b93a9bbfc40f19d3e@BL2NAM02HT091.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13023025)(13017025)(13015025)(13024025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BL2NAM02HT091; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT091; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT091;
	4:l2ZYH2HQQmGYd8XQXG9eCsbH3qE9r84O8ySVNdyL2qyJaiBIig/ZFRwgx/zZUJTc/FdsCtNI7M6dl44E8z30xvV9Vzka7tSqwlpf+gHYwigBh3Kjh/gqnHSMXLZ1y5CYj0iFboPa+8ObN8kWkblUAtpMNSpzO3aN/r1bkm4EGUUkPVcT0knJu1NylILFSCw2gH6J26WGspN6FuncX7rTQaH3R4ZVOOru1VOKdp3xtXOjnschJTbPcWztkMRKJgovAM4qC/1Jrup/EPf9Y7NrkFDnoXtlTXYEfCJaYt/sHTpdirW/EM/k9Hgr9psumE5hrZDgl5FFALsV9s8wRLilf7Z9qYOdsyAGLNE3VQWrq1YHg6qxcBB0gv7LPotdBhrkUzh1rcoTZ4ug7fmtwth3CwFeDAbR/jRleuWQuA0ke9VRR+dK4P+Q8qgbvXJPlq8qTa5LtwmjirOGH6O+Ea4Xa04w5q+VE5iQ2rxUKQQ8J/l2maupalmKbctuB7wI6PkhfZyo6VU6raSn/SDxwfF/Dw==
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2NAM02HT091;
	23:WwEmh71ooMi0weut5YxeNuhwxYaU5jinAdQtdAbEB?=
	=?us-ascii?Q?o3T+/kj3UPQzRbfX0RrN33l0UvMDVZsnDEPDI+8kg5n6X6cmSre5wQnYMlvx?=
	=?us-ascii?Q?P8etbaCfaS/WlV+Z3DBPtmCeYxbxcsBWzvLDMbCFpBdVugQLnFnY/2ntPC8S?=
	=?us-ascii?Q?ZRBQ9HfouPAmB3Q6gVwNSF3qjk1pTFuCjFKafGDSmC0tB8m2MgQ8vHr6gkdU?=
	=?us-ascii?Q?2DiG9WydYfsDM+AUnRt9U947MZKGcQfnLb75hZG+RotZCCfWuXCTE5BQ3W5i?=
	=?us-ascii?Q?9plsDZYatDK1QXiDFKcxce08/Ai6MvyCn4Ia9bOjM5DyhmP6cxAxMILwkth8?=
	=?us-ascii?Q?wJ5NTCNFJBz6fDGJWKtx2fAoN9DXA+/TnAqehlGhjcB7YfavTwdwPcIf2OSa?=
	=?us-ascii?Q?vntqv78tXmMA5ewHDEJ4wgwMyYUnONPjuRTHbtjV0bDH/0IV1fuon49r0QP7?=
	=?us-ascii?Q?kW+DPJ207RVzJIpHVOqL6dieCVMxMIImqHpLcLYjqeZZV7rCnxnknIvaz2Dt?=
	=?us-ascii?Q?TlP5L0Z2N45qNjEcFkcH6uEOLs78hiICPr7L/9BTEnqUfny5V2pOr5/iF2tC?=
	=?us-ascii?Q?FkiPhresVcYCnIQJoGUp6g2jrJ2ekiYMLDpe+ix0WZy9H1Fi4dM9q087DXtJ?=
	=?us-ascii?Q?bGniS+z9Yhn6WyP8jdgCrELrTSSdnPOOh0OhPBqsBm3sdrJP1UcjF6VzMfgs?=
	=?us-ascii?Q?R2agDxEB31NduMA+/CbS6mEW9YMt5lnbIfG9DZU1y1nPvYYhmIK0BuqZ0Yqy?=
	=?us-ascii?Q?WpPVURkQSIeVuP9qEZiZTRjVybzM/DOopLlRMYbEaC+rIY4Z2Uqkz+C4NDG0?=
	=?us-ascii?Q?F+TegK5s+cHpuPw6Fdwjq+f/MomERyRk23TQcSZ5a2GhSTHKcTF0PtQKJ8zD?=
	=?us-ascii?Q?iQ60vDhzaswjuPz5jmMoH87Ahp5glgZjToGYLjUwkWthNCCOl24BGrkaRAo4?=
	=?us-ascii?Q?W+2/CY2wYdi0Ld9okJ/RIYLeT3UJi2qS35WFl1A6zdrwczNnJdaoRZC4/NUa?=
	=?us-ascii?Q?NXOonWVic+BhhCRRhah9xK/Vvm5fuWAEHpZy2IwqqvosZyDGq6ryskvlXINg?=
	=?us-ascii?Q?mRqTY1BSfIc4veLoGldEo7Qp31FAj6PMkF4kjsXit6H+30W/6RYf1yvNhy3B?=
	=?us-ascii?Q?cMXLmf6LO2ScVroc6yk8DF4TYZFmXIBZy0648MthgVDQhvdEOq9fpCt5LNMv?=
	=?us-ascii?Q?SyMFnWbe0eU2NcEuqW5ahE5/MSSmLwkjc3t?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT091;
	6:dbQWcvzs/P8brOEZvnaw+2R3kMNnEKZ7XKeHfFAxgVpmUhQe9QB3qaDwIkdTQkZZbU+MYTP37uqU7PpmCvGHwMlJkdGkG9XZfyhGiu4a6uxchq2xPqIrIXI7fo30cgKFACE1E44/xTVpG89mFgB4PihymjGJ7yEQwRx/NCmv+tNK/Dqo4YSaaPGBgW3ngm7vK4EDdUrtiTy/pSLvLZNyXJLQaJ+smHDNfbBVOM2gjnbOHORaRbuGRIW0Dvqc4DDlGhpu4zSOT/V+7UAOpN8lw3oFtKz1IACPx70ulcvbnV3T20fWNum9DbhuQfsGvKJOyVVHhVmbF03Av+Xc+ZpGfQ==;
	5:AleYXhzHTsnuF0xwm8u+pJQEWX6AVpKe32Ieb0U5zLGFiWrx8N0QmQTIaGw8VbwgPZkb1sO3iBjC1ivuubFgJvmeBpxq5f+DmorlhoULC1uYMuvMsgHTQU77wMw9gKA6BycVuNW7DRSR/QPQ7+/+eQ==;
	24:P6TyNjkmgNOLN0J/yRqPEliU28A4gLjrs7lPdh3i8fhyrGPBkdegefAXanWPrkxs5nSiqS/1bZJHrwPUDaAftGKW5xxfDtORa5SCz5DkaUU=;
	7:8HtHbflgtRu+dUMD0LZIlBoJg1VA4HMx7nGYjQqTTkygdPOvFzEmpYm0ecdcfjdRtegVHDpa0ToLRCbT7lW3/hARgKA5gJBCLkW8tE/WR+CK4G4aus7oAv3hgsQqSaO/TmbHXCmFo+tNDFSUK7zCffoCmOBQUTXBTfxu+r3t6pozGrz1N1sXeCpcHuAzYcrTIfBTcWGreKH54Ju23CCR9nroq/0XPHAgEjDuiVEAElcAi85C/hCL8X/esarK5Akn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:32.3255 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT091
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.45
Subject: [Qemu-devel] [PATCH v3 6/6] xlnx-zynqmp: Set the number of priority
 queues
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
X-TUID: /xo2lEKa4Tm1

Set the ZynqMP number of priority queues to 2.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

 hw/arm/xlnx-zynqmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 23c7199..0d86ba3 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -332,6 +332,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
             qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
         }
+        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
+                                  &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.7.4

