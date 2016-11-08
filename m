Received: by 10.25.150.194 with SMTP id y185csp1334355lfd;
        Mon, 7 Nov 2016 17:02:37 -0800 (PST)
X-Received: by 10.157.22.193 with SMTP id s1mr4535510ots.130.1478566957888;
        Mon, 07 Nov 2016 17:02:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u136si16895699oie.38.2016.11.07.17.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Nov 2016 17:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c3uo9-0007so-50
	for alex.bennee@linaro.org; Mon, 07 Nov 2016 20:02:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c3umO-0006tB-E1
	for qemu-devel@nongnu.org; Mon, 07 Nov 2016 20:00:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c3umN-0004o5-IJ
	for qemu-devel@nongnu.org; Mon, 07 Nov 2016 20:00:48 -0500
Received: from mail-bl2nam02on0053.outbound.protection.outlook.com
	([104.47.38.53]:37785
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1c3umI-0004lJ-QL; Mon, 07 Nov 2016 20:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PDjjyRN454Qx7VVR3q1wG69y4sDCvLZmQFtNL5C+sOc=;
	b=ZWo8yeRaX0lM2LwdEg0j2clesYUqc/cVm5fzbEP3v04sOD5o721eBdEA/Q5GtCQRw5Vtl0Cbrjpsk/m5krkEOmT67H4tHVPaZIOQZqrXkirBsnnwwjnEFdcKodEDwFLQTjNN2kJBsYUNslUfmwWAN+y+psTxINWzyD8SSdEOReg=
Received: from BLUPR0201CA0027.namprd02.prod.outlook.com (10.163.116.37) by
	CY4PR02MB2869.namprd02.prod.outlook.com (10.175.60.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Tue, 8 Nov 2016 01:00:39 +0000
Received: from BL2NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by BLUPR0201CA0027.outlook.office365.com
	(2a01:111:e400:52e7::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.707.6 via
	Frontend Transport; Tue, 8 Nov 2016 01:00:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT028.mail.protection.outlook.com (10.152.77.165) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.707.3
	via Frontend Transport; Tue, 8 Nov 2016 01:00:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1563; Count:17
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53864
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3umD-0004B3-RF; Mon, 07 Nov 2016 17:00:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3umD-00014I-Mk; Mon, 07 Nov 2016 17:00:37 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA810RUP016712; Mon, 7 Nov 2016 17:00:27 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3um3-000114-LP; Mon, 07 Nov 2016 17:00:27 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Mon, 7 Nov 2016 16:58:59 -0800
Message-ID: <bba606ac6af5fd59aa8f721a41b6963291f9fca7.1478566669.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478566669.git.alistair.francis@xilinx.com>
References: <cover.1478566669.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22684.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(76176999)(356003)(50466002)(8936002)(50226002)(6666003)(47776003)(77096005)(9786002)(106466001)(229853001)(5660300001)(2906002)(5003940100001)(2201001)(305945005)(81156014)(575784001)(81166006)(5001770100001)(189998001)(7846002)(8676002)(626004)(2950100002)(50986999)(87936001)(4326007)(36756003)(33646002)(586003)(48376002)(63266004)(36386004)(118296001)(92566002)(41533002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2869; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT028;
	1:03WzTn9AE/iMjosXNxfzuTYw11bPDRdDp438c5lkX39335DRvXYP5WZh0RmIuNlJmzc6rBx1N8lasSBUSuBBVTGBGk+GpVzAssCPlqRR8oNqDXMlHumVQ1Ac+XzciEhHoyf2AgXX0P4G3LFL58mZe7kzWRsrKJuI8FVkSrUrb7PczR2m0Wil6CHdBSsbks4qg2n8sdF6VsLRy7I3VF7ULn3jaGy/4fR7R3JmrHlY4o7bxwJbS3D0MTWWJMYW79XxM008s0eu6c7RIxbj9IXrY0BhT5SdBMngs1qi5b273NR8VT4VU/k99I38xHnt6FfG8BmMZ2CiYDKc+PxRU0CFet/Xy7nVbcGWW9xPGpbCsWEKT20LRG5QvWc+jJvdGLS8Q9X1vuHrqBfJ1XDe1bYDHbyTMqzSUdkSoq8V6nX00x2SxCvUz0Bo2Gy6oHojIroN+leCslcX2YIZivGDTRg7wgjYai4yat2O/K7CDnSlTRdkMA+D31t54gbJmh4yMUHrJ0ycI2gj5vo/8YT4ZtQMPXoc70PGM5Rey2YS5/en19sQFnsSGdPZ8ZDCkZx3G0krp1pgLWJlSsiWNJH5hvilYW8RBCG5bY0JBjXYhZLTPag=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91ab8dd7-f4b5-42a2-dccf-08d40772a7a8
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2869;
	2:ScaSHMKo+FXVR+8wj0bKYuxunaDo+8ciTKHVkL37hOaGDBMTbA4FtQCoe/4woYF8kVlLpXP3K8KiX0+VbHUgNDZHaVlhiKmisGFdC5STGCNKxgU5EcaxtL6yoofLZ8X8f2gBwQijGqaAJZekcCftN+ZXHFOoMrCXEdfzOzsxniOgh9F5yDzhV+NglyebFSbgh8ZU7oWoUTs2FEi6i5NnyA==;
	3:oVIWXD+hn4Y+PWcxUd3IEu0fWmASNWCt6HOeiDE1z22f19TDrEtXJdvgoqoDM4C1mhesD2gFtYwXzh785M9sVrafLy6GP9G/94uKXqIk94a5mnoxlR4H3VSD9zV3ycz9lHgEINpW2CqWNIQ9bCLvR2y54RBIA9jin+Bf70oM3vD4iIq3P2Coz5+c+ZedvKh8WcnSr8djOKGARCXzuh62Ci0JwlWMO+DJuBdElfxCTnpm1l9dVXdWgnPgMIKbMhvRj3h55vV4tHWV6beNTNB8C3SMZtmI6U2CZGz/LJkp4TQ=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY4PR02MB2869; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2869;
	25:njHDjz3I07o1ZTYB2MPKHhV5eYnQmbJY99MGIsgwACbNFqiAWyWD7Jqagqe4+e5UEQeLjsqXD8BGjaUb6IUJTaL58QAceXb5a/XD7Xp8dqiYBonDbJgZ+MNBe5tuPZIohSplxhE4wn6K02gAe39d6ZZBy9ujcOQwu97N+O2kwTMTGtynCHqoFGcFYS62fwvYrB+4Von6tCC7TQYQunZs7flwcARURkJtVSbIHLH1UMS7cJvuwOncl80mhjJ95b42YYPPu1uD5zjtER43IMQnmCaKiAo8xZ5n2Dld2kylrTg7FMZnEhYl/OoDkZ2SIm8gD26WUkdqFqxabzdhBqY3VcLojumU4z9Z1k5KUZdIKFcqyF0bgV60EFv+ny7NBx56FSJ3hKiFh7uj3NTTriZrbkiESNFPjFEx0dHqJ3SOanc=;
	31:LYb0GzrNcm/1lwrGMoaJSkzEFun32Hr1HuVe/La25dOdH7VlytuDicE3lr6Odfkhj1ZG4HGyiEdAUjp5LpJ1SdiBjmWrD75573tSq24OfqVbLpUn5Go4kM3b22xEZYD4Ih+FY+foIH2brN+didd4QUigXmRjWKB/JnaCA+ECIboMWy2/TxwqaOJl7nUDvyjZwxQ+moo0EPpYbZLnYxu5EomRrHY5iYFzDWPlraj7/l8L1CTRD7pUd8DoMbg2XHMl
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2869;
	20:BQv4qJp09lJhhIXeABiIhFnSdRfKK2WZmDy6ywLMOmmbKcms7sodWEfR4ba11hNUI1wPiBgoWp8EnoVLlnCjtLUmc5uKiibmSOiDlDDY6TLKf6KKrFpHqh9/HrVLjGO6Xjzr/XFEhIP/d6BKDcpN19G3K6HNC1jxzpKDn7rXPaJgk5GMPC1w54LYwwglBDGBUtifo2Hr6wsbg9qEU8jFeCK2DAcq97JBk5BQbDTpXpjwK0nCpCOhmqf5o2WRrNsbIC3tOBJ75mC3A8/b3IsiSzl68kmrlS4fyWEoyL6fc/EqihN3bbsR58XO+VJSA8f169lm1qW90fBOlhpJcTC6mYehjGZ2pPD2DZl78A6ptyl61LfKmRiXBzQsjnVQtzeD6nN45rfD4q3srhWEJ0vLEovAatBqQkLxJJ6dTHFI97QEp2VugSnLFRpE1c+wbzEu3fu3CxeevgDfspvpmAxBvcx8ZsxetqeAPk0u1JP+OBQIObwDUJrjmno3K/CeWTHB
X-Microsoft-Antispam-PRVS: <CY4PR02MB28695D6CFDCF186910783777DCA60@CY4PR02MB2869.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13024025)(5005006)(13018025)(13015025)(13023025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:CY4PR02MB2869; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2869; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2869;
	4:lbbAKqIOzVTiDw8bASFLTKbgNxooIT73ixqr1Pf2N5wGRxygohoy9wxhYMBjVqfbs0pF3P4ZuE/Wns4bWvaey9TWQ3jbImRVA1uQjpRKNenNKOUNvvROyKMZEUh7Xl4oAMfTOO3LRmal2eFqIZ3sclBV901Yvkn1nEZyumiSSIelwPYQoCyA6LOcXthJ9aCDBlUFqttbekMapIwCvByoIy2EDgLMgyIOX5OnRuP6Se9l7XMZDGJddjvl3hF1xxDwnZVT9Xy/8Xi8ULelGZ9HBb7bmCl+kQQ6zbko8Hzcm4pRmgPxzz8CS/wtLRtG2UXbX4DFIRvT2ltRQYKiFZ/43rW6udpveF5sZq91SNKE/3K0SixNxXpEbP2yfyIxLnU1JRT/9iyLIWDsMuD2apVcDZJHbcBCeR/9UKbWDGjyQvmDAD6oDeEvNXCdTHxDyZ6HXdyEocN9EtB4VxZVGuATKPk2b+H3Ux+vG3RlVnZsPJVVbf1Frf9kVYSwXCsOg97f8QQwVtkE3W86dwNe/wF1xvbmPRh5h4lemEMCVJWidog7OYXf4spaqXhe0GC15k95MjLpskQnvM0TzBuEinxrDA==
X-Forefront-PRVS: 01208B1E18
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2869;
	23:rEsBP3+yzzWfZ+OthiwDIHEydRKvdBcR5vXnHFL9E?=
	=?us-ascii?Q?8xaN3PQ+hyiL9r0W2pnfqYCoJGxwlt6XBN3NBlnCIQt2OZ4+ickLsJ+aJ/O4?=
	=?us-ascii?Q?KXecrDFIeTfpl2agRuGUi3u4vMPWdSN+yY1kH6csZ6zKeTPLYFxVS4ovaLz8?=
	=?us-ascii?Q?iGXPIpog07IMzwYPg8ch8VNEjip1bTBxlZEPNPdyzamYi2UkNQY/wEuHqL4F?=
	=?us-ascii?Q?QZj4EnRKJ6WiVJ30NbgBG7RStdjkcxhXTBi8CM0I4Xa7Mi9Srxgabu293zbW?=
	=?us-ascii?Q?LMJF5brGjyrouSKqST4xsa+fntVto96e/1pli06AQnXcw/ST3XvhvdXyf//2?=
	=?us-ascii?Q?PaSabu/GM+QQOoxtCEKbAguPWkZOBbZ98gQbvaYlxD6kLhiZSvN5L9yzLKJL?=
	=?us-ascii?Q?0xpzRsNV73zOSPFAuR9LbBPMl3U0OxqJhAvNuIuARWOaUQZiGof5CtRGXET7?=
	=?us-ascii?Q?0/go4VaplXr3ThAVQaK5p7K5IH5mCPT879u70snv9dyx2m7T7hO6qRzQjaOa?=
	=?us-ascii?Q?OzKlaZGpJKah23RqGz08UeShdNfiAHhuhOCPmL/+LG5pfh1Vs1hPpCkzPM1O?=
	=?us-ascii?Q?Jo7RdeBe2n+6FcZlfxUlRG+6EGpUye2Swwae3yR1++1Zw5sPjG0iNy72OOXM?=
	=?us-ascii?Q?WSgOHJQwwubrwKgFPShgQa6w626wOk4klRLBddOEe/9teE6S+VAQqOH4caRp?=
	=?us-ascii?Q?N00esd2zPgll7WrT0rdGoAOjtbdL7oZ3nAL27sAKLHz9b8um3TdTZ730pjZQ?=
	=?us-ascii?Q?oc3fFViooN3Mki772XQyDf/voj6GOCn95Q5UPdYbRUjwmfbiGnCOf5LkTumV?=
	=?us-ascii?Q?eWoPgaDOWLFr5CEIq4erMnzct2kdBqx6Ch266pNVAPmc/qvJ9kTByIuD7p5y?=
	=?us-ascii?Q?8dq/50pjpNaJrhgq/6PPLmKnbnQCs+9U4g85aTSVydXUF/YYNcR1/d8EhXGb?=
	=?us-ascii?Q?DqtO6bD7lJzlOGctOy3yrdiuyhNnfnGEiEnbNmFb/olefZx3ika8SYlqwOCk?=
	=?us-ascii?Q?78/NKxdjOfgDdBbAZxxxu7rQveFYZMx1VjNcxgKh087DjFz1ovfVlXQQrtyE?=
	=?us-ascii?Q?nurwaXJxNSW+LoRbRBLKJauUCRZVrlPw90yXw2zCaQgfyZ/uA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2869;
	6:N/G8q0meJLLKLKzsRKFQyn6cxqaHySAp4VySQH+W9bR5jB6FevsyjAsTJiXiD2LOr9bh6ftSzearJwIFbYStGIyHWEATIPYiTdoSrybxE8tT+4npTSv4FbqqysFxXYatm99tgB/lC/ljAakVcZ3M8tFPw5uBteCBiG4tagHq7NGAeJbd/LtXHKjSnsHM07Rop3+dQIX4JaRdrKM/Hl5pSeHnCZYtFWm5kMWl837nSwh7IbovF99r6w+2g4B1UEH1hZf7hnn1atkTO3xl5ooogSxpuRwcvQQVQjrURfq1afY36oUs2ZiOfuowDB8LoIPw05dOWOO/NJIPS1gcXq30YlT+fM2J61yYSYK/jofhu1s=;
	5:a36noVy0rK4GEaOHmNVQ/mjc3MxapNSBqKmmwcfHoc3LC0rmvPDcUTN/+Uy5gFjK+V9rtmO5hI/1Sp/jP55mKw1/T4bkcLqPHb92kbiR1WzxVwJbBP1jy656cRxdfT41lPpP47Eyg68qL7WCfNnG3A==;
	24:Ohnu1ifuFXZ2tlx/DM2Yp/XolhHTHjJwV+2IuNA9bOkJOVXWFexpBhlp1tqagzFps22LrIjzTHyKgWKSeDmceTPVMmQ4gY35u6X76gN9O3o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2869;
	7:snss9nxjSTOs9FzjvD35Jx/D7SbOwo2lb/fW+Iqcrt5oQjMem5NXILBD07JVmzdTPVTb4fihB/tUFcIowP3xFRcInwB5jRarQoIAPazg1psBFnG0QXCDKoQE7riy5AKnhpgjIg9PgJsd8DD+66Il2bR8L8PoQYfPrbuP0+eJpxEycBO4CEbJ+On9sByn+Urdcni4S8r4fuKowGU1DJdBvtERU0N4eOV3KhgA3luQEmoS8JgnZhHIa8rG71uuiQNv0KEOpozYnV7tTyGI++CbTXqnt7IEFaXK587YB4Tf5+7TAynVgkpdWc8Vo1qY9G4XnQ4Qq0TibeQSqvgYe8nhu1L3CigyYbfugc1Vjhznvsc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2016 01:00:38.4735 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2869
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.53
Subject: [Qemu-devel] [PATCH v2 2/2] xlnx-zynqmp: Connect the ARM Generic
 Timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RxNXYBedDRzE

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zynqmp.c         | 13 +++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 0d86ba3..43c68c5 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -38,6 +38,8 @@
 #define SATA_ADDR           0xFD0C0000
 #define SATA_NUM_PORTS      2
 
+#define ARM_GEN_TIMER_ADDR  0xFF260000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -172,6 +174,10 @@ static void xlnx_zynqmp_init(Object *obj)
         qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
 
+    object_initialize(&s->arm_gen_timer, sizeof(s->arm_gen_timer),
+                      TYPE_ARM_GEN_TIMER);
+    qdev_set_parent_bus(DEVICE(&s->arm_gen_timer), sysbus_get_default());
+
     object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
     qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
 
@@ -405,6 +411,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         g_free(bus_name);
     }
 
+    object_property_set_bool(OBJECT(&s->arm_gen_timer), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->arm_gen_timer), 0, ARM_GEN_TIMER_ADDR);
+
     object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c2931bf..8deabb4 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -26,6 +26,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
+#include "hw/timer/arm_generic_timer.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/display/xlnx_dp.h"
 
@@ -83,6 +84,7 @@ typedef struct XlnxZynqMPState {
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
+    ARMGenTimer arm_gen_timer;
     XlnxDPState dp;
     XlnxDPDMAState dpdma;
 
-- 
2.7.4

