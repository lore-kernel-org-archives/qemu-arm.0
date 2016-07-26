Received: by 10.25.21.156 with SMTP id 28csp1429735lfv;
        Mon, 25 Jul 2016 17:13:40 -0700 (PDT)
X-Received: by 10.200.50.82 with SMTP id y18mr32169687qta.29.1469492020276;
        Mon, 25 Jul 2016 17:13:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c196si19404825qkb.157.2016.07.25.17.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 17:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRq06-0005pi-Ar
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 20:13:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzs-0005er-Ea
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzn-0005nZ-U3
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:20 -0400
Received: from mail-sn1nam02on0052.outbound.protection.outlook.com
	([104.47.36.52]:45099
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzn-0005m1-HL; Mon, 25 Jul 2016 20:13:15 -0400
Received: from CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
	(10.152.74.57) by CY1NAM02HT179.eop-nam02.prod.protection.outlook.com
	(10.152.75.134) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 00:13:13 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT064.mail.protection.outlook.com (10.152.74.64) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 00:13:12 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:32970
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzj-0002Cw-QJ; Mon, 25 Jul 2016 17:13:11 -0700
Received: from [127.0.0.1] (port=38257 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzj-0000na-O4; Mon, 25 Jul 2016 17:13:11 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6Q06RLt028707; Mon, 25 Jul 2016 17:06:27 -0700
Received: from [172.19.74.182] (port=60000 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzi-0000nX-V6; Mon, 25 Jul 2016 17:13:10 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 25 Jul 2016 17:12:42 -0700
Message-ID: <b270adaf1f9d2b0a4b618c8f7267ca7402c7a48c.1469491920.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22472.005
X-TM-AS-Result: No--8.463-7.0-31-10
X-imss-scan-details: No--8.463-7.0-31-10
X-TMASE-MatchedRID: s43J+FgHK2RnPo6E5MV+9FVN8laWo90MlIvcAfYJnEr4JyR+b5tvoJxz
	8+1dXyV4IWrZayjSwUB6OL2Xy0aa41+/XNUi16Qs9UVHiwLx0/I3blcgNAu3dt9RlPzeVuQQ7fK
	xaM2xqkAB55Y7AcMHvViMFQ6fat2qOnfMHqHi4mme7UdJp0QINUqAhuLHn5fEvkUopJh60sE0oI
	W/6XAMMgNSJB7Wqohs9IOZFsHIw8B9NgiFro7s/N35+5/2RxqmrpmMk+s/+w+/wPtA9baOj4EpJ
	RcbelqdxMIfhQQLLkGdSChZ/Eew7eoFUSRtaG+csyw+ZJnFumQSNRDlFTpYkkkrZ4mFjTbDg4Rg
	3UnBoXMgd1QgQODFNydNcrAGVDMe47BIg3A1jqhCnGIuUMP0VTcah+QZUHeOW4tWRQ083DS1489
	U49frAk+KIXfK+DFA/BnZajOwp9cM8jMXjBF+sBRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7sya0f
	je3XuEi1YV9XIqYiHoBHFCo5SLx+zS5lhhTucvH8FerAT0dJY=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(64026002)(92566002)(50986999)(85426001)(76176999)(4326007)(19580395003)(50466002)(586003)(19580405001)(8936002)(33646002)(50226002)(48376002)(11100500001)(47776003)(2906002)(71366001)(36756003)(87936001)(77096005)(5001770100001)(106466001)(105606002)(356003)(7696003)(305945005)(5003600100003)(7846002)(9786002)(81156014)(2950100001)(81166006)(86362001)(5003940100001)(8676002)(118296001)(229853001)(189998001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT179; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT064;
	1:S/1FVjFoMyjrZKIL1yckudJKuKNypNslPxqUXGQzI9AFtwZpL6wjiOCjHY1EU9rlrMI8KaJO/IZzhUQZ1IeuCfMRgcxeDNI7YuRYThb3+fXCDifNjrthG21OzYe50Ukb7DZLlGRCZ/k65ZnCX4GGWoSWt6o+GKD9iVRt8b4BGmC64OJSuoMGdMHVyYjIcl4mXszMpN5xR0gor0sf94T5w3GyiB0/ODBUbwmt9cYsVekGtmH0R/td0VshXOVP1PfrzzL0GanwE6pnYlo0cqL2hMW1Uy9XIqGZT9Uc4v7H7Tg4bR1R/ZBBR13YMg3tZzWyETpAlLg35mwkjiLU9F+8s7F72NBKAp7NVfrCIigD9zVihWOtYfIycY/ByQqWgr5exdwIsfb0beFceFiQpHkeSaNn2GV+76nfaoOhFT2k5KPxuxMZHXzdxmsUgoVzMc2EsVLYvVkm883/RVkifm9Ml5gcCD/984WQE4BPV4Y2HTiY3iOG1Hh/VzoG0g6yDSl63xPpjfzbxitGTzHkvRImBhUbB7phrqN3a1wSZl8uxVI7311bv3YrTOQgk8RDS0h79qB6jS0eJIR7+mLOMoxuHuRv0xP9A22zA3y9UFzOQhw=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b4bb373e-de67-4c9b-e826-08d3b4e9a221
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT179;
	2:+afscXCEixSQ2M6YSBqI2Qx8FTaS04ZnN2iiPOGTnBBc0GSUGwKEUV2DY3VpfHhzfX7hOgbHa2tAqJ1hf3vbcrRlBhXxXdhqT7Kxb5lSKqUkEu57zw8jt0LHh0M/F+86EXQECmZvSCCZo0dxDG+bVIgO08RQYWsB/VbRnO9w2FQK9nA5opKDEBJ1PjpAIqZi;
	3:bDK7U4IhXP4zZAgNMuVp1pvtA65s00pldu6jtaP6Xfx5fKL5aXdhHVKe8eJt2nwRBXX/uu74bOqOSfHIQ5FGczZ/lK7U/u3v+YSIYhIDLCd6mhRdy48OFTIK5jn0DApg4U6rub00ZjfsphU41/ORcczbMH69m8CZYoxALGVE7iQVUIQQsT0XREw81u4ixPv5C0uHJZ2/no+w7Idhv2b6yjaQWr/NHF9N6IWG8nMI1qo=;
	25:iB48um2iqIsPkk0Di1BjS7Wbz/NcTpW90OxcvnPsbhNyxExlKxq6sZtJSFFcZqlA6ncReYeddO8Au/8iecLuTVCsN2+ambPeicpH4lncR7rlNespKLDQkYRvg6GEuWM3ZPHTGonzd9dNUkcNiM1EfjWrP4tZF7K1/3y3QmTO3hrZkvhIhq+BrdhZGgeVX2nM8LXZfvA+52SaBUjJOJm88Stex51IxRNRHlCoiDWGuTfpcQjWSk+DDiCLB6zLmOJ32sMA9XpPsK/upFUBpqYCJDZk7ArU18QsbcVTMPc+RyoGdvk8VfSrYaEb2H5i04QH6Yh4G+LgjGGcxIXct2BRQqIet77f7ckGf+VuI5xApsiV8cIjOcxVQ7P/eogECMJBMi0UWoYa+p6jsvfcqcja6XGXAh6uBnrP6iUkHa9ZqXE=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT179;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT179;
	31:kvr43785Yc/kckV1OGSdCj982IukMBb2VE4wm/QcoxM8rvDScEOjRj7UTD+hFarCc7sMXxL7hAiJQHDj5cEXNdgltT2JeG0qS37MWNy5SoyKN6yA7CtnNZ+U7Oj4mQkBxykmFaWi8gFe6vhrSdzTFkFICfsDmba+SEgvr2x4mXGgY18r7oeAsBF5EP/QzqWS7yEwGyCE0+USWNyPCzlTDQ==;
	20:L1/tYhHVUdWSYPXr/r1grEm5hkXCRgWZ59leCWvogDwBmXOw7Uh/GMwGdlXOziWDAda36m790TwOKwlKifOi3zGhePdCqeO6XE0A85dx7QZwYREuQ4/rmsGjJ74K9K4GS30Z9rwxb9HNP47xePhdHhovYhiIC6cYMv/yes2Og50FrNCF7LmZLD9ogPH6DCP9GGXr4mTyX5T05/cGfm68B3Xu1FONY1OaGBv63SjXKrLvNhMqXiPBmWVDK8d/GOqmv/SRKW4APzlGmI+/8tqdjYHdqOlTTuJpE+UW40ZsWwqBjYyO+0v7AYpEhP1YH1eGlo0kNX+Khb2gOLDMBW3uEtp8MQz4oX4G4XUeoeXCNQw8T4nvaqH8fzXk0Of91eR9uN0Dvjsl5hRznF1Zv8HLdjcG5C/zzurnJEhv5qw/vmA4rJ/EoCYaSmlLXCzeu2xYquD1XdmhfPIpuM265bxrej3K26+Y3aFWItKIRM9m8tlMA/nuWSWciSI/uMTcJbbR
X-Microsoft-Antispam-PRVS: <36cef96ab1384948bdef59498ff9b235@CY1NAM02HT179.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(13018025)(13023025)(13024025)(13017025)(13015025)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT179; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT179; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT179;
	4:sgVwx86rZHuTlhSj75WNOxpslZiWLNVU8rXim3iycbIuqNfHxT87wP4NkpAPq910xnvawyEblcP3ojzMuENleY93Rd73V6eMDPAJpEOIdomjq0zO8qWrua5/NInRs/4IotSld/w9BOidbFLAduLCY7bFAqli5ff+StBLEiFdg0Eiszqq/zvGsUFg2ieYl+HD+Q1Rj84GL5tRjmiE5myqYccBDR/DCV9w7HU65G+9sGMDu1lO1XHj0pO4R7WfIm7+lG7zocH4h2aoUGcdsbpC1lf9WxVhbJueCZNps+9FddfyV7c8P7iD3lf8ThL2rtRz1fmmVOsmeeF9l5I32numov+O2pkX4wrbkge1WkHXlFQdTyqxalOOBvXa3NoodtDCLT7WFM8cElqVH+jkooJiv2+38+VuYmzPt7qvam5IzNvvSQZ5QcA/YIjj/eN9iJv6ocgSxKz5mZDl1LcLlTvFwg8+BxOZQoUwTD4m43RhxJvQAdnk2dzV6QNQkdoZLEXDJkuJ0ZzNEp89W7gh6C1kOQ==
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT179;
	23:qjYdfJnAVcRSJvI7qTRa8Gf2FRe6Ff6imwweb9D3n?=
	=?us-ascii?Q?YDnBHG664SbsabKeF/c5CxvjTrJe93vH4BFa8vDqqb2VnRRCoy5bHvb4TnIY?=
	=?us-ascii?Q?t8PZnZli3fGvQ+tcHkMrigtezWlwMtjQXCE9nYkF4wKxKijhfQlCAhHkUKJe?=
	=?us-ascii?Q?DBobiNPIleNh3yj4wnMimWrRZElOEHt3oKB7hFiluP06aJgTYEfDK9r9GYCc?=
	=?us-ascii?Q?WU5FIBZyC/GiH2jz1JXhYAWMFqvkvueEbGOSMnV6o/1s/y2TK2zmvWCd0yoW?=
	=?us-ascii?Q?EA3zKdCN0qDFqA1JpzEoABoj38wzFm9H3BpdFZe8lk3yJ+BVawAZxvT5TBTG?=
	=?us-ascii?Q?LmraXruWsvQ9PiQ5Xp8oyp/j7E4r6Zl+QHBRNWHCGzrLl5RfsYwNwNCicb9+?=
	=?us-ascii?Q?aUaMBTZxcXiUpAqhPMxQmjXDfK+fuZXvwg3O76XvU9DY36GNMkEA0+63KuMd?=
	=?us-ascii?Q?oSmiO0zcp2e1u0iG/wCnHKzphWAIbBqOb4xQtMVFH2P/EO6MinXEJ81+pNgr?=
	=?us-ascii?Q?VJHs3rpYxR5HTlM3H8oft0lkYr+7zrtMd1EToRFq+aJFIj3vVrVA+5KftUeO?=
	=?us-ascii?Q?aLR9QdzS9gtPySR13HPNVTz898dMJbmISOcWw6C0h8uO1+U9PZKJzPAVAxl+?=
	=?us-ascii?Q?Y6tIVypsCbG05XpGQl/RmsbXu57CsClpIhYXTNUf1d5xpfacc+zFj9Ou9efI?=
	=?us-ascii?Q?90gJBKCDO4je73HUJG6yfM9RVNTRQr+6hCbN91oCRfPaNb0S9EnLNKfe/P/+?=
	=?us-ascii?Q?MUWdoEU5/yb3Gco424z771rrOSHMHxBIjh6uAc2+7VWJv3pmhfNxMl9i9Egi?=
	=?us-ascii?Q?FyvCp+bDJOXdKRw2QPeR8wMD1ryftqZ51OXsqb5ViR10QOvS+DxrfGag9pMW?=
	=?us-ascii?Q?tSSsp9CCNckDvYMmfs181B+aHmOnCZxxvuRInndSYXmeRkutcQ8FXAcn0HCC?=
	=?us-ascii?Q?s+wC3XcCmfC8auFp+ZplvcQQTELd9fg8Qm3U4k0Ghes9UQHWaW0dvqMVGJ9N?=
	=?us-ascii?Q?X706N2jbXy0F5yxI8MhBoVp8P/uw1N0sM5ZNRZVuVaLBaP6pUvT4O1CV9/Q/?=
	=?us-ascii?Q?3NsncZT3d8iDB6awb7rMET3fXBUhWDFnUC/vn4SSlw16qQ5RUEWU73Ba2lVH?=
	=?us-ascii?Q?kVtX26LuSAOv3VJo9bGN60AatdVulNzT9LaW3hgowlnerBk24vkKN+83Rm1m?=
	=?us-ascii?Q?5/H/Uw2DciVLUhLZ3IimuEqj1LJzVVZJfVU?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT179;
	6:o4dPgGUzgWTRDYFEwgwcaoaJq5iFCMNEi6z5p+MH0j9KR4a+YH/2qik2JZhKbXL6e//8BWhvewKFXMG5Fx9EsiWe1VghTNqDyAjhNwlL0pfhT8phL02X9rC193bIuuEXbICWF86zHe6fFoqEpaohYwRh4SaUBoFm4PYqf8Qgz8t5knq48Yfmbv6EPNqwjlmUQTxXhpJN8Ecz5es79PhQWRSFwuEdfncyz50TeGeD5eFdD5LHmhCTuKQ6EbGMsZtWZIOdVEfEZhdQXKic9JFyDFAttfEFiofY6ugGGFJAEXTy58xRjO3R19Htn0O4Ni79FaaWgcIiGg4LxhgrS2DhPg==;
	5:FQrkwFnNY5hODe4469FmRTmGnftPMtzZaJaYyY5+ZVaD3PFiS+w8IX3v7e4oLLYPLSANuvzPakzm8WLtzYyET65dT9DzLzPl56JCOXp/MCyvguk4TNjGbfE4D0UExHZrZujDlv3FJPoWyc5glGVA1Q==;
	24:RILdamGE/JRjiR524XnItws5R0q/jDl7Eeqb5njZFFuQAGZnmUSCkuiFXkCh0P3UB0Y3OyFw0zZFUb3HsLgHG4KtYGyVo61mfwebEhJi4pg=;
	7:o+2szVvLfyKSUQYrIKGYF/duXyatO6lidy/9lQumNQdukxALkEPy8FfVcCyepg1Fn6Dc+zpaS0opzvxZAzt5VmmBnyLUrl+yj5L7cDe1Y3pUagW+gkJ+QBHj49UN4y/1f6714mgiu6lXtu+wrZ3AKoxXZu09Fc+1iR1XViSvG7hcuTWhBTy8IG6RHGGT2KTwy/P+bjQxFIWtB0RotYRyMlFLFmeR2HQfPFK8bpAoTD3q5P4tM3R2hCf4UvNQDB0Z
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 00:13:12.5820 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT179
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.52
Subject: [Qemu-arm] [PATCH v2 4/6] cadence_gem: Add queue support
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
X-TUID: Elz3y0c2pjby

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

There is a indentation error in this patch in the gem_transmit function.
I have written it like that to make it easier to see the changes. It is
fixed in the next patch.

V2:
 - Use the new screening function
 - Update interrupt generation
 - Increase vmstate to 3.0

 hw/net/cadence_gem.c         | 180 ++++++++++++++++++++++++++++++++-----------
 include/hw/net/cadence_gem.h |   2 +-
 2 files changed, 135 insertions(+), 47 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d38bc1e..28c2ddb 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -142,6 +142,30 @@
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
@@ -316,9 +340,9 @@ static inline unsigned tx_desc_get_length(unsigned *desc)
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
@@ -448,6 +472,7 @@ static void phy_update_link(CadenceGEMState *s)
 static int gem_can_receive(NetClientState *nc)
 {
     CadenceGEMState *s;
+    int i;
 
     s = qemu_get_nic_opaque(nc);
 
@@ -460,18 +485,20 @@ static int gem_can_receive(NetClientState *nc)
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
@@ -482,9 +509,20 @@ static int gem_can_receive(NetClientState *nc)
  */
 static void gem_update_int_status(CadenceGEMState *s)
 {
-    if (s->regs[GEM_ISR]) {
-        DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
+    int i;
+
+    if (!s->num_priority_queues && s->regs[GEM_ISR]) {
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
 
@@ -748,17 +786,17 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)
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
@@ -779,6 +817,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     uint8_t   *rxbuf_ptr;
     bool first_desc = true;
     int maf;
+    int q = 0;
 
     s = qemu_get_nic_opaque(nc);
 
@@ -857,6 +896,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 
     DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
 
+    /* Find which queue we are targetting */
+    q = get_queue_from_screen(s, rxbuf_ptr);
+
     while (bytes_to_copy) {
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
@@ -865,10 +907,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[0]));
+                rx_desc_get_buffer(s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[0]) +
+        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[q]) +
                                                                  rxbuf_offset,
                                   rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
@@ -876,47 +918,48 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 
         /* Update the descriptor.  */
         if (first_desc) {
-            rx_desc_set_sof(s->rx_desc[0]);
+            rx_desc_set_sof(s->rx_desc[q]);
             first_desc = false;
         }
         if (bytes_to_copy == 0) {
-            rx_desc_set_eof(s->rx_desc[0]);
-            rx_desc_set_length(s->rx_desc[0], size);
+            rx_desc_set_eof(s->rx_desc[q]);
+            rx_desc_set_length(s->rx_desc[q], size);
         }
-        rx_desc_set_ownership(s->rx_desc[0]);
+        rx_desc_set_ownership(s->rx_desc[q]);
 
         switch (maf) {
         case GEM_RX_PROMISCUOUS_ACCEPT:
             break;
         case GEM_RX_BROADCAST_ACCEPT:
-            rx_desc_set_broadcast(s->rx_desc[0]);
+            rx_desc_set_broadcast(s->rx_desc[q]);
             break;
         case GEM_RX_UNICAST_HASH_ACCEPT:
-            rx_desc_set_unicast_hash(s->rx_desc[0]);
+            rx_desc_set_unicast_hash(s->rx_desc[q]);
             break;
         case GEM_RX_MULTICAST_HASH_ACCEPT:
-            rx_desc_set_multicast_hash(s->rx_desc[0]);
+            rx_desc_set_multicast_hash(s->rx_desc[q]);
             break;
         case GEM_RX_REJECT:
             abort();
         default: /* SAR */
-            rx_desc_set_sar(s->rx_desc[0], maf);
+            rx_desc_set_sar(s->rx_desc[q], maf);
         }
 
         /* Descriptor write-back.  */
-        cpu_physical_memory_write(s->rx_desc_addr[0],
-                                  (uint8_t *)s->rx_desc[0],
-                                  sizeof(s->rx_desc[0]));
+        cpu_physical_memory_write(s->rx_desc_addr[q],
+                                  (uint8_t *)s->rx_desc[q],
+                                  sizeof(s->rx_desc[q]));
 
         /* Next descriptor */
-        if (rx_desc_get_wrap(s->rx_desc[0])) {
+        if (rx_desc_get_wrap(s->rx_desc[q])) {
             DB_PRINT("wrapping RX descriptor list\n");
             s->rx_desc_addr[0] = s->regs[GEM_RXQBASE];
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
             s->rx_desc_addr[0] += 8;
         }
-        gem_get_rx_desc(s);
+
+        gem_get_rx_desc(s, q);
     }
 
     /* Count it */
@@ -988,6 +1031,7 @@ static void gem_transmit(CadenceGEMState *s)
     uint8_t     tx_packet[2048];
     uint8_t     *p;
     unsigned    total_bytes;
+    int8_t q;
 
     /* Do nothing if transmit is not enabled. */
     if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
@@ -1003,8 +1047,9 @@ static void gem_transmit(CadenceGEMState *s)
     p = tx_packet;
     total_bytes = 0;
 
+    for (q = s->num_priority_queues - 1; q >= 0; q--) {
     /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr[0];
+    packet_desc_addr = s->tx_desc_addr[q];
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
@@ -1016,7 +1061,7 @@ static void gem_transmit(CadenceGEMState *s)
         if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
             return;
         }
-        print_gem_tx_desc(desc);
+        print_gem_tx_desc(desc, q);
 
         /* The real hardware would eat this (and possibly crash).
          * For QEMU let's lend a helping hand.
@@ -1051,22 +1096,28 @@ static void gem_transmit(CadenceGEMState *s)
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr[0], (uint8_t *)desc_first,
+            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
                                      sizeof(desc_first));
             tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr[0], (uint8_t *)desc_first,
+            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
                                       sizeof(desc_first));
             /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
             } else {
-                s->tx_desc_addr[0] = packet_desc_addr + 8;
+                s->tx_desc_addr[q] = packet_desc_addr + 8;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[0]);
+            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
 
             s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
             s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
 
+            /* Update queue interrupt status */
+            if (s->num_priority_queues) {
+                s->regs[GEM_INT_Q1_STATUS + q] |=
+                        GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
+            }
+
             /* Handle interrupt consequences */
             gem_update_int_status(s);
 
@@ -1108,6 +1159,7 @@ static void gem_transmit(CadenceGEMState *s)
         s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
         gem_update_int_status(s);
     }
+    }
 }
 
 static void gem_phy_reset(CadenceGEMState *s)
@@ -1214,7 +1266,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
 {
     CadenceGEMState *s;
     uint32_t retval;
-
+    int i;
     s = (CadenceGEMState *)opaque;
 
     offset >>= 2;
@@ -1224,8 +1276,10 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
 
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
@@ -1250,6 +1304,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     retval &= ~(s->regs_wo[offset]);
 
     DB_PRINT("0x%08x\n", retval);
+    gem_update_int_status(s);
     return retval;
 }
 
@@ -1262,6 +1317,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
 {
     CadenceGEMState *s = (CadenceGEMState *)opaque;
     uint32_t readonly;
+    int i;
 
     DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsigned)val);
     offset >>= 2;
@@ -1281,14 +1337,18 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
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
@@ -1301,9 +1361,15 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
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
@@ -1311,10 +1377,26 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
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
@@ -1351,8 +1433,11 @@ static const MemoryRegionOps gem_ops = {
 
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
@@ -1366,8 +1451,11 @@ static NetClientInfo net_gem_info = {
 static void gem_realize(DeviceState *dev, Error **errp)
 {
     CadenceGEMState *s = CADENCE_GEM(dev);
+    int i;
 
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
+    for (i = 0; i < s->num_priority_queues; ++i) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
+    }
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
@@ -1391,8 +1479,8 @@ static void gem_init(Object *obj)
 
 static const VMStateDescription vmstate_cadence_gem = {
     .name = "cadence_gem",
-    .version_id = 2,
-    .minimum_version_id = 3,
+    .version_id = 3,
+    .minimum_version_id = 0,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index f2f78c0..47a1661 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -30,7 +30,7 @@
 #include "net/net.h"
 #include "hw/sysbus.h"
 
-#define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
+#define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
 
 #define MAX_PRIORITY_QUEUES             8
 
-- 
2.7.4

