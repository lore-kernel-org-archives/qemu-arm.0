Received: by 10.25.221.202 with SMTP id w71csp1827515lfi;
        Sat, 12 Aug 2017 00:24:44 -0700 (PDT)
X-Received: by 10.55.217.12 with SMTP id u12mr14916272qki.33.1502522684510;
        Sat, 12 Aug 2017 00:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502522684; cv=none;
        d=google.com; s=arc-20160816;
        b=YPuTmLGxEWV/xgWLrHucIrvA7aVoSdTswHG06JZXVaSM7eQ8fyIKAGlcm8ZoH7NX2j
         gtxhWVvgVgqUu0V+99DQXmW49mZU8WBQalYlIfN7rpWvNRbxWG1X4GQg8BtIUem6WK7S
         h1WOU2nKvawnaGxdi1ckKZXOZ+/3ZoKgTt3jO8LsaZN7EtGeH7wN0o5hZ5YwWFVCVPCa
         Jux75Sg8P8cO6WRv+a3e4kJsAk35x2NDBd1l+BSD1q14JS/ExsxTNiGFELE3KJV3R2l6
         Ho6gTBb0YvLMoaMXIy6zYs2IY9hVRZLwNSipevR35f6wjG5h2ONal2Cdpdx9BsT9CChk
         jaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=2TrGWbMqQ+0b4dbgPC1CjZiGiw/nnpZ/41qAWQjHiz0=;
        b=Pc4M4FsG1ekRA64xz12C3EftzRLhg96ZiQpEZ5C+LEcRtTvIqhtKX8++OS9i6rhm9l
         2k5RomanAuMwEa+O+63k4PC0PZnVeqR36jxlE3XIyXi/c5S1RL0Q8T/Jmc+9XXpp4E0m
         UMoSyD6x2QgYSjAzQfzIavso7SsubiWs5xfIki8KhDV8h7PX72Hj7hfYMSNXWpiBgo+z
         /EdjMgl+rz4WOrHO0ftdsXk6z85tGUPSVub0e1QN6RVdawR8KF8sS7QZ8GPhK0lnKm1e
         LoakMRbANlBncOLWbnYd8NULK+ZApiDCbUxVrCrXUOy2p5YzfTEsRM7C2AuHURr6CX3f
         rcQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mgp8iEuc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g186si2332123qkd.25.2017.08.12.00.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 00:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mgp8iEuc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgQmn-0004oU-Dh
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 03:24:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <portias@xilinx.com>) id 1dgJOs-0001af-Id
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 19:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <portias@xilinx.com>) id 1dgJOp-00041U-EP
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 19:31:30 -0400
Received: from mail-by2nam01on0070.outbound.protection.outlook.com
	([104.47.34.70]:37728
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <portias@xilinx.com>)
	id 1dgJOo-00040e-Sr; Fri, 11 Aug 2017 19:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2TrGWbMqQ+0b4dbgPC1CjZiGiw/nnpZ/41qAWQjHiz0=;
	b=mgp8iEucuSSEjgI7SjQDMwnEHyKl8FJgWmjpu3RRKEtq/82hhAQxM6OlekVa7WNGcXqIIizGcfdHM31lU6KWjalY83FGPptx7tb71ysE5j9s5c39e8Dj6rcSmrILC3K3jlB8PZp839IalXD6P9Irtn29m5UBJtdH0xyTmXZpuMI=
Received: from MWHPR02CA0052.namprd02.prod.outlook.com (10.164.133.41) by
	DM5PR02MB2249.namprd02.prod.outlook.com (10.168.174.9) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.16; Fri, 11 Aug 2017 23:31:22 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by MWHPR02CA0052.outlook.office365.com
	(2603:10b6:301:60::41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 23:31:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 23:31:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55179
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dgJOj-0007Gr-19; Fri, 11 Aug 2017 16:31:21 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dgJOi-0003by-Ty; Fri, 11 Aug 2017 16:31:20 -0700
Received: from [172.19.131.25] (helo=XSJ-PVEXCAS01.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <portias@xilinx.com>)
	id 1dgJOi-0003bv-JF; Fri, 11 Aug 2017 16:31:20 -0700
Received: from XSJ-PSEXMBX02.xlnx.xilinx.com ([fe80::d917:d91c:e68d:24e0]) by
	XSJ-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0319.002;
	Fri, 11 Aug 2017 16:31:20 -0700
From: Portia Stephens <portia.stephens@xilinx.com>
To: Alistair Francis <alistai@xilinx.com>, Alistair Francis
	<alistai@xilinx.com>
Thread-Topic: [PATCH v1 0/3] Fixup exclusive store logic
Thread-Index: AQHTEvjQI2bG8M8KfkycftSIzN3srqJ/zJAg
Date: Fri, 11 Aug 2017 23:31:19 +0000
Message-ID: <C778EAF8E3D3BA4D9D24FA5453D7B7590105FAEA7A@XSJ-PSEXMBX02.xlnx.xilinx.com>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<CAKmqyKPe8_205KZ5x++cdZ0BR950tQiaQvPstRzcKrwArgpMOw@mail.gmail.com>
	<CAKmqyKOHX-==ZX5B0K_2dZ+D09XfGU6yfoo5mckkgms_6hevJw@mail.gmail.com>
In-Reply-To: <CAKmqyKOHX-==ZX5B0K_2dZ+D09XfGU6yfoo5mckkgms_6hevJw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.167.45]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(377454003)(13464003)(24454002)(199003)(189002)(47776003)(5250100002)(5660300001)(4326008)(55016002)(55846006)(626005)(7736002)(356003)(189998001)(2950100002)(6636002)(23676002)(5890100001)(229853002)(305945005)(81156014)(81166006)(33656002)(50986999)(8676002)(50466002)(76176999)(54356999)(478600001)(8936002)(2900100001)(2920100001)(2906002)(6116002)(102836003)(3846002)(54906002)(6246003)(39060400002)(53546010)(106466001)(63266004)(7696004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2249; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT038;
	1:OAxcCZHnHSchLn5UG+wmWB1SV2TowodKUuh9fhP0x3dR59aTGqruTvNaySqFtBwBrpnakQ+Hi1eOUiVn/YlX/PnIYWPpUJR8ChQW66DDgsJEZqJvtlUDpzgdBH7pfOXCq2knELg+m2y66KWXvc/0p/MEuYd6r45iARl0kXuyYdZqX8wWKFLqrBK/rf8aqBY+/cuXXoYjlGSa53d/I1A+VIXj1bS1f9iddMjbUkpcd98GOV0iFONIzIH9EMX82HQEoK+TRPVxyX94OIG2a7g0I+2eUhc9vJ7H9msGVMNz1NfK4xczVvmADbqdbu9QSU34jjEPVr8QgSLh9WNNiwfmERzlM4a1w8yIjJNFhoFIoLmbQ+YZ1/8vN+/5tqUMYw2MjenssnssH4BTNHeIvvBgRIJOornXqJuzN9MPHKD/5waWxkGY1mIY61XW2MKsTzBKHJKsJngDtu5vat1Rc4Na2yjtM9JO1xUP24Z9PlgZ5eczE2OXcB3CXYB+R5NXBB5Q/4ux1A6GntklIcU76EHto1EwpyGADrvnP2uzULFYYB+p7ora0Btub1ufeo+AiNg3x/W3daCTmhKeIexPi+Hyl1fIyvq0cDPVcB01x+zTMs+zYW86gPNaN4uYN80vmk8MdPgZqKQBXpErlsiU6bvOoh3lYIEk6zjsM6Fj291tD+pAScjTbvaE2jIFzbh9m/8dnUjdKqtgpSf97pQKYgBAJzCEoKz2IQOftDyW76Jhc9T9pOiUVLj1/qkFRrFK2veF9qxofuJqAn6T9I5A13tCybK6InHuC4WzzwKYD8LDExPaxI93dN+o4V2Iqi/L73wcaQ2L5FW/RWLYzCwyu1Alxw==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8568166a-b156-498f-782f-08d4e1111366
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR02MB2249; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2249;
	3:5IU0YZ00V/mE3cAzjHjRAQBIodLsSKDEY3x0+p34l5/myigR85QpQB28NT/7cQ2SjfdmQYAIQ5XE9Xi9W3yAK8W5X77FFP9ZglA+020y2LBzoLbU3mQ6H/1VmyetBD4+hAYbSkscx8MA3L/JyzrhNUv908+XhhJP3sEWw82OutRIQcwQ/3t1f7ysjPQbAHma350GijKejbiKPPxDejRnPiR0I+ipgDGvdg9hoabQ9A7BNdNcqAXZb+zOCXtIefz2SNR26SUOYeudpZVf5i0fzELjCeXu0RnaJa0wqpXxnyTlk+Q1KCaBau8Of25TWRTvcZKFPhwuOqW1znKDPeltbnLRP8h4liZ+/VFX5uwQ9D4=;
	25:0h2eatGDV/C4z4OtfytQYDMWtQIngjBq3Y5HhE2LEqZtP8iLzlMMQnL5f3uuTtgfK+qvyicNt06CniAWsLnB3BymKBh2kyI47DcGm0rdvQgueni1fLQZAuIrTh7+Pj+wJ6zmd6j25t7PcoJE1bhdxrEnFb0yJ1SqrMUyeEgeG6qjKWwvBGzAQM/VvJch6j+iUrIUgQyB8asFxSeK1L4BLkA672nFZTKYWWKkvb3oxr5dTMWZV/Ynqn0j6lAmJWYTjhNTrhLeY/bFHfv5DWwCKI/5kuqWJREtr5wgnMrNlcVrxxUBKFSSBSaipAXVkjHpq/br+fdcWN80x5etCvwrvw==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2249:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2249;
	31:UA5nKJtzh69IFbdCjFK0EHlP7qw0n+255jf9wTBNkFctur652BkjMbgDqz0M0M93WNBhkY9AsvbOsey4npEZQ7b5gH22XB6ZUHW6xTBOoEvRinfjOZbKate77zv51mxst1gDv71l8ZJjbmlEppo+1bV9UL53s3fa+AEGmpwk0gl4iorAeUD7xnVLggyPXcBRAH6jqb9Ha9cBUJV+wzPN/SFnjjyp3i6n+bipxKc3dH4=;
	20:a84TAqQiYeOytMy5OOWCnh8Q68JhUard0n2W2UfP63ndJElOpjNM8CMRasS85WOQTm1lfeDastbRsw32C2IdRifMDJIPoVB6Q29QPTj3EII3Y6P6QPzFMlnaZCOcLOHPvchlZElAKf0H6JnhnmOc+aiL7lSFxfw/HLbPhnz19XApP/CSWXIX61YlHgB2Y1DM4UIIwMLY14rFDpkV4KJSFoge73gdIp4N4Lnirx3+DPGYQx8leZ5214KNMitEtUqkJJHdl9EP2gZXXMLD0UgrwAqVEgvRLpYtf57ZPGFgnoKR0HlnxQ5FzOzf6LxDjkD8dBCrE8QxAXrSNm1qhHJ4xfgAGhLpgHXT7/1PLFgxItlm7l2DtD5PAxXitQxZY3un6DdSKXmbmRm/Tmq1U9f6+WaRVhIzXXP+WAd0+gUzWhaLPVzjcGRcf1iKAlSdOYjsuCTQVezkhyCnKZ4ayRox8zKKr/QjLjm9x5XMQLrM8Mx+kDI2hJqrbpfLxKGxQEwo
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM5PR02MB2249797D9F6054EDE76814C6D5890@DM5PR02MB2249.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13018025)(13016025)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123564025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB2249; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB2249; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2249;
	4:RTFxv2oFWP/aoXNzunhzqsT+y3LboU9LT/beprqynYaiMEByJO7/lu5NgGDTbu0hirLBk9A0hBYIAAn91taw4YN+2lLJNPuA5+9ciotAy7nouisrkNW7lnkHtIUata4jUZ9Pc9ceu8993UFbdYEJAGEdpomipod8RmboZYrhsMBnC4KfGDXgEBDdOdkNajC7CnEqtcaXCiVTcy92znWnZ9e4laPKBnIRf7SYHEQpovs8EwqiVhl4kxiyA5YbUts4yFX2iLIGrFEYNVNCD8YPtgF0s3YnklTkRjUcvE7izXA=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAyTUIyMjQ5OzIzOlc2WHRxOWd6WW1CZEJhT3NsYWorZ0YxTTRq?=
	=?utf-8?B?ZkhaSHowVG9xVGdCZzRiTDd2R2hlUFdIbnRFdjZndGgrTGJCRis2RFAwZFlB?=
	=?utf-8?B?VzZQTGh6VnhUaW1qbG0ySUVIRDRMaVRzOG5HalpPbjJJN2tqSE55SEErbGh5?=
	=?utf-8?B?eVJRMCtHOERyZ29wQ3hVYjNKTzdYYi9UOGUyQkQ3NDRlZHVicnNDZ3QxemJ0?=
	=?utf-8?B?enR5TU10VEMrWktmdm5SZFVVKzVWZWVCSk5DeSs0ZjRxMDE0bmt5cFVWRUYr?=
	=?utf-8?B?N1pHOWI5NGl0RWNreWw0REFUcUdGcVRHcVpPNDhtUDhhUXJld2xmR2tKcUNv?=
	=?utf-8?B?VGVDeCtxeTZVV3d6QmNyU1U0SHhaU1hrdUZ4MUVPS0ppRTRzWDl3MHlzVmJJ?=
	=?utf-8?B?R0lTNTNNRzN1SFpmMFVLT0RXS3BISXRKSmRURlVzL2taS05reDNTbzN6VVQ1?=
	=?utf-8?B?alZpY0piaFZjalIxL3R0OFBKZkw2cHFDaUE3M3ZvNWxyUW5hNmZIYzlJSEw4?=
	=?utf-8?B?SFJ6cUdkQWRiWjRIYUFLZnl0SXlBcG9FOGwrR3NkbkFubVZnUjEvcHYrUUpR?=
	=?utf-8?B?SkRLYnByck1TbHRCbDZ0eHk3SGpiUlVXcU94UmsxOHhYdHphVW1vYS8vbzBQ?=
	=?utf-8?B?NCs3YkQ2ZDY0VVZHMXUrVnhqZFE3QWYzc2ZGckpodXdRcjdrSURFUEFIdFIy?=
	=?utf-8?B?anZmeDROVGVVTDlySUN0cjdyT0xPMDZPek5OdDB0ZWNaVVFKTHZRV2pXMHpX?=
	=?utf-8?B?akFTUlNZNlluVzQ3Z0YrQy9OMklCNzgzbWgwais5TUlYSis3b2xFQitqU1B3?=
	=?utf-8?B?NHRVcmluUGxSK1RCWUkrMXdrK0p4T2J6RXZ1Z1ByeVgzY1FCQmJxT2d4NDk3?=
	=?utf-8?B?NWtnMUdiMXpJeWYvdjhUWU02YlQrQWdWSzJNeUcyektaWjhMWStIWDRFS1R3?=
	=?utf-8?B?clhzd2YwdTFrWnVqM054dDdtOExWZUJxQVNiWDdRL3Z3VENwRTVvNUdpMkx2?=
	=?utf-8?B?SDlEZkhvUVM2b1VWZ1RPMnlHMnNMaDRuY3RJZk5teU52ZDQ1VDM0QW1uTVBw?=
	=?utf-8?B?TlpOTEhEWFoxSFVQbEJpTW1sVms3bHNkL3N0Q0RXWXpscTNvSFpBckhjVU1l?=
	=?utf-8?B?SzJOMUJYVWhDS2F3MlVBaTk5Wnl2SWZJYS9SSktWQi9NY2szMU5VK213dE9V?=
	=?utf-8?B?d0Y1am11QkdCcWpKa0Fmc2hOYUJPRTl1NGg4MzNiYjlHWTNyWTJJY2E2cnRj?=
	=?utf-8?B?cEx3MkxXcVhVM290VW9sYVZIMWlScTlPbmtiai9BbGF3Z3RGTzBZdmtQSWRB?=
	=?utf-8?B?dW9DcE1NWldyd0VQanJaQkx5clNDZmZCaU9TSHhqTGk3VU1WMGdhMlhwZ0d1?=
	=?utf-8?B?VUFWMkk4L2pVOUtYMGFYMGJoNytLOVUwTFVkTU1nV1FIMlZidGh1dCs2Tzhm?=
	=?utf-8?B?NUUxQm1aNzVwam85NG1MQWRoOUY5SGdxcnI0aTAzNnpMNTBlaGNLZDVrNU4x?=
	=?utf-8?B?TTJuaEQvZHdKS2hCMG9pK0FYaXJjUys4WmlLRE10ZEdWNzk1blFFK25ENVp4?=
	=?utf-8?B?Wm4yRFYrdFNoM0EzYno0N0VrSzRLdWQ5ekY5L1hObitPNG1OaTFqSWZzZTZu?=
	=?utf-8?Q?GEnYgX1bKXXD9cHYKrvn?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2249;
	6:h2QykUkEJn5HJoXur1jjjVGQH9hOQU0i7wi+D/BKi8bFBR+Wz8vXtlb8yzq3Fdcsx299m4nZRIRa7kTWwOH/qTzvRhpU2Qn9sNsKjsKxVZyr8e8YuvunDAj35Y85prwTyd7x+Rd2B8Mx+3z1yJmSY7/BgoHn56c0GGllAuoAfI6Y7dQbIqpT14DKNfxdlhu3LOIBcW+VYCyw0iVhwCNcs9UGIpb2N0ayNuWGPq7aa56sssIbkGfRcSF+kvTiFD71A7Nj4EuGEnToTP5f0h/MAZN4IAShvGqHdyRrjCpryr0/XE/qdCOTsBKfccU7evlQIetxZLEjG6/2IgVoZ+NziA==;
	5:n6T2k/Fhnn/MBnawpBeM1a59D6iULi1J7I6BZP4fq6064J8OqMaaX8QiloO26VPQL3xjXGRYoGDnH2mWKDSpAFlQM9Wea526Wx/VrYAoTtq05mW3GtczeRdbFYlWcmJ/ltuvetUihP+ylye8U2O5Ag==;
	24:jtDDJDEpQ4ISG88VtFH0fhfVy1gWEA8md7/fMcZiTFQVgibNTdakfwMg7QH9XeMf2UsXEq9OJ8QsRQkEe4qyB1j1StTjN3RxIa8nvBFls6M=;
	7:htaZ4RfQDJV95iIHCIFedXuS+q9ZCru4cazkUqnWxUTHIHAs0rVKX3GnhwQnjBzVMeKQ3tNlmK7stbEiMaLVuUcPsTdUIjMNL+tV4g5FCmPsEtREVTJbUzCsBQWXlGTEaGFJwHw3c5koItP+xQTY/3NIXtZVr62ArwpQG/fNKsGfsZx7MrxHem/1W+22KXsXML0QIN2W+fq0jqmD/EPKMSTM3SVy8qjCf7/QPZWd280=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 23:31:21.9446 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2249
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.70
X-Mailman-Approved-At: Sat, 12 Aug 2017 03:23:21 -0400
Subject: Re: [Qemu-devel] [PATCH v1 0/3] Fixup exclusive store logic
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Edgar
	Iglesias <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EH5UoC2TMshf

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbGlzdGFpcjIzQGdtYWlsLmNv
bSBbbWFpbHRvOmFsaXN0YWlyMjNAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YNCj4gQWxpc3RhaXIg
RnJhbmNpcw0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxMSwgMjAxNyA0OjIzIFBNDQo+IFRvOiBB
bGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpQHhpbGlueC5jb20+OyBQb3J0aWEgU3RlcGhlbnMNCj4g
PHBvcnRpYXNAeGlsaW54LmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZyBEZXZlbG9w
ZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+Ow0KPiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+OyBFZGdhciBJZ2xlc2lhcw0KPiA8ZWRnYXJpQHhpbGlueC5jb20+OyBF
ZGdhciBJZ2xlc2lhcyA8ZWRnYXIuaWdsZXNpYXNAZ21haWwuY29tPjsgcWVtdS1hcm0NCj4gPHFl
bXUtYXJtQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMC8zXSBGaXh1cCBl
eGNsdXNpdmUgc3RvcmUgbG9naWMNCj4NCj4gT24gRnJpLCBBdWcgMTEsIDIwMTcgYXQgNDoyMSBQ
TSwgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIyM0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+IE9u
IEZyaSwgQXVnIDExLCAyMDE3IGF0IDM6MTcgUE0sIEFsaXN0YWlyIEZyYW5jaXMNCj4gPiA8YWxp
c3RhaXIuZnJhbmNpc0B4aWxpbnguY29tPiB3cm90ZToNCj4gPj4gSSBmb3VuZCBzb21lIGlzc3Vl
cyB3aXRoIHRoZSB3YXkgZXhjbHVzaXZlIHN0b3JlIHdhcyB3b3JraW5nLiBUaGlzIHBhdGNoDQo+
ID4+IHNlcmllcyBzZWVtcyB0byBmaXggdGhlIHRlc3QgY2FzZXMgdGhhdCB3ZXJlIGZhaWxpbmcg
Zm9yIG1lLg0KPiA+Pg0KPiA+PiBUaGUgZmlyc3QgcGF0Y2ggaXMganVzdCBhIHNpbXBsZSBhZGp1
c3RtZW50Lg0KPiA+Pg0KPiA+PiBUaGUgdGhpcmQgcGF0Y2ggZml4ZXMgdGhlIG1haW4gYnVnIEkg
d2FzIHNlZWluZy4NCj4gPj4NCj4gPj4gVGhlIHNlY29uZCBwYXRjaCBpcyBsZWZ0IG92ZXIgZnJv
bSB0aGUgUkZDIHRoYXQgc2VlbXMgbGlrZSBpdCBpcyBzdGlsbCBhDQo+ID4+IGdvb2QgaWRlYS4N
Cj4NCj4gKyBQb3J0aWEgZnJvbSBmdXp6eSB0ZXN0aW5nIHRlYW0uDQo+DQo+ID4NCj4gPiBBZnRl
ciB3b3JraW5nIHdpdGggdGhlIGludGVybmFsIGZ1enp5IHRlc3RpbmcgdGVhbSBJIGhhdmUgYSB0
ZXN0IGNhc2UNCj4gPiB3aGVyZSBleGNsdXNpdmUgb3BlcmF0aW9ucyBhcmUgZmFpbGluZyBvbiBt
YXN0ZXIgYnV0IHdvcmtpbmcgb24gdG9wIG9mDQo+ID4gdGhpcyBwYXRjaCBzZXJpZXMuDQo+ID4N
Cg0KVGhpcyBwYXRjaCBzZXJpZXMgZml4ZXMgdGhlIGZhaWx1cmVzIHByZXZpb3VzbHkgc2VlbiB3
aXRoIGV4Y2x1c2l2ZSBzdG9yZXMNCmJ5IG91ciBpbnRlcm5hbCB0ZXN0cyBvbiBBQXJjaDY0Lg0K
DQpUZXN0ZWQtYnk6IFBvcnRpYSBTdGVwaGVucyA8cG9ydGlhLnN0ZXBoZW5zQHhpbGlueC5jb20+
DQoNCj4gPiBUaGFua3MsDQo+ID4gQWxpc3RhaXINCj4gPg0KPiA+Pg0KPiA+PiBDaGFuZ2VzIGZy
b20gUkZDOg0KPiA+PiAgLSBSZXdyaXRlIHRoZSB0aGlyZCBwYXRjaCB0byBjb3JyZWN0bHkgZml4
IHRoZSBpc3N1ZS4NCj4gPj4NCj4gPj4gQWxpc3RhaXIgRnJhbmNpcyAoMyk6DQo+ID4+ICAgdGFy
Z2V0L2FybTogVXBkYXRlIHRoZSBtZW1vcHMgZm9yIGV4Y2x1c2l2ZSBsb2FkDQo+ID4+ICAgdGNn
L3RjZy1vcDogRXhwb3NlIHRoZSB0Y2dfZ2VuX2V4dF9pKiBmdW5jdGlvbnMNCj4gPj4gICB0YXJn
ZXQvYXJtOiBDb3JyZWN0IGV4Y2x1c2l2ZSBzdG9yZSBjbXB4Y2hnIG1lbW9wIG1hc2sNCj4gPj4N
Cj4gPj4gIHRhcmdldC9hcm0vdHJhbnNsYXRlLWE2NC5jIHwgNCArKy0tDQo+ID4+ICB0Y2cvdGNn
LW9wLmMgICAgICAgICAgICAgICB8IDQgKystLQ0KPiA+PiAgdGNnL3RjZy1vcC5oICAgICAgICAg
ICAgICAgfCAyICsrDQo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gLS0NCj4gPj4gMi4xMS4wDQo+ID4+DQoNCg0KVGhpcyBl
bWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRlbmRlZCBmb3IgdGhlIHNvbGUgdXNlIG9m
IHRoZSBuYW1lZCByZWNpcGllbnQocykgYW5kIGNvbnRhaW4ocykgY29uZmlkZW50aWFsIGluZm9y
bWF0aW9uIHRoYXQgbWF5IGJlIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkIG9yIGNvcHlyaWdodGVk
IHVuZGVyIGFwcGxpY2FibGUgbGF3LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBkbyBub3QgcmVhZCwgY29weSwgb3IgZm9yd2FyZCB0aGlzIGVtYWlsIG1lc3NhZ2Ugb3Ig
YW55IGF0dGFjaG1lbnRzLiBEZWxldGUgdGhpcyBlbWFpbCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNo
bWVudHMgaW1tZWRpYXRlbHkuDQoNCg==
