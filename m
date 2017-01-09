Received: by 10.25.205.13 with SMTP id d13csp11544077lfg;
        Mon, 9 Jan 2017 07:20:56 -0800 (PST)
X-Received: by 10.55.101.82 with SMTP id z79mr84970921qkb.68.1483975256878;
        Mon, 09 Jan 2017 07:20:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17si10908862qta.94.2017.01.09.07.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 07:20:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQbkk-0004b9-1D
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 10:20:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQbjj-0004Zb-R9
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 10:19:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQbje-0001oq-RA
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 10:19:51 -0500
Received: from mail-dm3nam03on0055.outbound.protection.outlook.com
	([104.47.41.55]:42784
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQbje-0001oR-Eb; Mon, 09 Jan 2017 10:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Tn8ZUOhe/tV1F7mPIxc7bZozI/rWVcSf9ktobI3iuy4=;
	b=3ljslx+n/6bjs2sCAiWo5FXwEctYyeAguOr/fLXM1/Bp5wTy2KvP+rScsTnz/Nkw/Jo6hz3UfCDL3TyfZClLmsZVwXbF/u6l5T1RrHWj5Fn3Y/sorGFTR4vtHElqM7SbqBrqy3d41JplaQRKHm5bZ9th3vtDAYGeRmdmFsKeEJw=
Received: from BN6PR02CA0063.namprd02.prod.outlook.com (10.175.94.153) by
	BY2PR0201MB0760.namprd02.prod.outlook.com (10.160.125.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Mon, 9 Jan 2017 15:05:41 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BN6PR02CA0063.outlook.office365.com
	(2603:10b6:404:f9::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.829.7 via
	Frontend Transport; Mon, 9 Jan 2017 15:05:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Mon, 9 Jan 2017 15:05:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50030
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQbVz-0004qK-J9; Mon, 09 Jan 2017 07:05:39 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQbVz-0007vc-EU; Mon, 09 Jan 2017 07:05:39 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQbVy-0007vO-R4; Mon, 09 Jan 2017 07:05:39 -0800
Date: Mon, 9 Jan 2017 16:05:38 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Marcin =?utf-8?Q?Krzemi=C5=84ski?= <mar.krzeminski@gmail.com>
Message-ID: <20170109150538.GK14990@toto>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
	<20170108083854.5006-3-mar.krzeminski@gmail.com>
	<20170109111004.GH14990@toto>
	<CABc_YGBqDSO+fysXjnUBdeLBJsNC2pO6sNpf3L_juPfjfCXUeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABc_YGBqDSO+fysXjnUBdeLBJsNC2pO6sNpf3L_juPfjfCXUeQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22812.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39850400002)(39450400003)(39840400002)(39860400002)(39410400002)(2980300002)(438002)(199003)(189002)(24454002)(377424004)(76176999)(81156014)(63266004)(57986006)(76506005)(106466001)(8676002)(54356999)(47776003)(50986999)(23676002)(33656002)(229853002)(54906002)(77096006)(39060400001)(38730400001)(81166006)(110136003)(356003)(83506001)(92566002)(626004)(5660300001)(8936002)(305945005)(50466002)(9786002)(4001350100001)(9686003)(189998001)(93886004)(33716001)(1076002)(2906002)(2870700001)(6916009)(2950100002)(4326007)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB0760;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT004;
	1:TtB6e35dFI5SI6lLVhGPHPMsApvkU6EmQF7Ye/7OAptqJouiyLPGSCoOiwQUxdPUg3CXG94bUJnK0cORZn4Y/I8nWk94QXjMTw1mKu1ElU9lt2KTAJV1fm0tMm0thPNliLQ9pjGrP3avgcn/PBEEiGiXo3XF2pzH7QIMgR6SIFklm8tt+ZaKelyAX86OaMv3J74h2BoLQx2pm2IYOvbcCmSUfqga82lzZJiMTc4kCIvZuGnFHH9zBl8KN7N99dupe2DJUZEMdYF3rnfJsepomekxiSTylQsB1nig84n4ZIWUsECkMCWPXxfysm0LRcSJtMG9ALZIbaxHvsfcGbGXnRdcCYu7g12fVt3BXK2WEVwH2yUxD8Rtxr5KppZAhqnY6w6mBh2k1k3Rileas5FvcRDvBfY7uyHtAeoRZNU0WMyWWRhuuEqvZZr4WPB9vM2sXtK0Jrtnw4HV26rK/58NiSdE+XTQaK8NV6mtQsbL8coPbldUGOq2Btl+SO3KLYs1q+NO+4d69Jm1Zy68JIq9kge6YHyAx7kBmRhFZgdFO7Q=
X-MS-Office365-Filtering-Correlation-Id: a565c5b1-9540-4d55-9343-08d438a0f9f9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BY2PR0201MB0760; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	3:TKh4R4LKXN2YVNq4i2AGLWkV7uSWfJ5h2ahZt4IwYjBd4cq8Rl/RkeUIIqzL8KIgHr/NadvoWXerHlkBlfymQ5VyarofDAsVZFT9CVMAc1eepYXngc+WzpE4CJHFkBGtba739XYjaiGT83wINLJ6Au+PrfvNSN72pnuCUNDuW2KF9XpqEGs7zm8HLxVfkxVEyPgI6IC/TIyLJvgiOJCHONK9wQZOaY79bk2YxRrLcwNg4/gpag+sN8cHJ3AqeLtEuGxKroHV09EkynXdhaadWN/C1Cosh6lnyceZK4tIzaZ5IWpkDAIXcO2s6Ng5NOGbL4Le375hYtXu+1dath9426QbGM7s7Yfadt3gt92aduo9OAjPUfZMBusd1zuYXGy3Z9TRESJqXTjCRLwAgNz32g==;
	25:WIdpIU+yvXNbAmF61QOZQyDvDbejVEA9Jfd5GfcUERlq/gtQSSS72N/VbMZnQygULUZOLcyzbGcsOaSQX5nlbDodyK4RBIhAcisvDok9JefdK9mBnNUqpwNONCSD+yVRZ3ez4dhoKnwn1ZdEzGbytx0U6qt4sC2fuHiyi8cVCWkFOfaAwYv9anI+HyyrO2kogoe5vK5MDQHA6uVeIuHov8nCFAF4t1Hrb0qaDGM9SG8MbO23+rQzdtFANRKi2QaDlB+l5Eke5bBSTUWtr/6nLqSr8pIHs1XxP5INSBI9vlwuxfo3uQixj9EpxNG/JpYKMbHrNb4NQTUgVC2TM84BJtMEEx1twwWKPQxRhimrxGx0/D72y3yTen1UCmCDlSKYXJvkgaRfMBuY1E3xnhnK+xLl1++A/YaxRiXUAkz0UTMOa0UVJB7OvDdP9wPhGs71SZF2J/WzYulN78JdKpPdRA==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	31:9tVRCj5txjVpzadaqL3LnleVW4tT/WIa7v7dn4IziJ9fR+64i30UXe5AT2Qvx7hGEz9i/IAMT036Uvl8fH3NSN4teyKh+ud4RVrFKc2OGyaKhSZnwn+EWkjQ59clFoUr7Nu3mzNRtxKvRFbB6UijD8GpoLlVawC94lfjBu3JhHlD7+FL61MNOGJQ72xSSgt5/8lBt1o5NbRxlQmIm20pm48e6IXA7By3PuB0prYAw6eYih/tHmR/wkk55a80x/Q0M1s/7dgG9FoixPVVRhmzozdJUK22jf3AN0hNcBuEoig=;
	20:hIka67iDHcSvS3Usub489jBpyBfOVq8Dt8lCc1teMcyXMBOy+Amiz8ugqyJB3BpKcodhejdGuD7/knEKhlw54SK6DC6wjgwPQNEEgTAod7bUcYYXVWl7exFTMr6NVCjCXWUYg/eLTu3MtbKu+qqa4MtYZhaaXCugScT2lbO2ZQ3pKDQ78/dMfdqJh0wsWO4LfyVcN4MFTW/3fm9Zc3NykdROiY3EwzUnfd4s0PZymJ+34lidZm7NzhhLiwd+OrDzGbkiVVBGtjrH5ZM6jz8eCQWremhMWnG+NWWeZlnzxxy990rj1R4LmItbrZ3BlOyNBHrIQziNotOXybS9+yvydY/GJSoiNMaLYxsQQ2pTqVAYEXjcOTUcXdPqIFIdFYp6t+qCHlhQMrQJD9PmFIhxr2o8AEGfAy/EJSKBGTjE8/ARZF4wwei/qvV1lVfBjM1zF3TYFx48FE/GT3XgcpvLPHaf3mf3gPLQ8W90lHp8WRca8bqT9bfXfP/onTdED0DK
X-Microsoft-Antispam-PRVS: <BY2PR0201MB07606B99A452278C95BA3A0FAB640@BY2PR0201MB0760.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123558021)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:BY2PR0201MB0760; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0201MB0760; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	4:8sx4UAjPwwMVGvraKegkbmrDn34cqErZFBS+5ZdB4L4xeM0RO1FLWlc7zcJGdVbDOAm8sEcTi1yXDsRVMGVrqD6r8EJcV6gajn307xyIOS8pd7WML2tuC8HCZ7dsPCd+Gy8+KZ94aRXDTB2vC8Itl6nhSUVzBQOnacaZgQrp3ynQX3EoHuM7f9atOtMBQFke+qNl0HtQYwQHxOuzhAW8g/1dOwE9QOzuoAfFBfTV/K2VBunPhhIr//SInP6fI+pwksBZVVq7cd9BgPiAIdbZGGxudtAHwM7xSUqCVb00UgTCiBhqxwYfkp7NBKgBSUkfcIji9xdBoF9kCyFhaX7lrP6zDAJ1W0afvifWeyoPf/9pz4kQkj3hdXPffjYEVF5TVF4lEj2ODFAsrsY7CkUfnZUnoquLMXjt7r/sR+6xLuR0ZhM35BQisWoSvNYBiZnNnlOAPm12QVhYARSs6B0cy4RuKr1u8LtJqaUT3gKJ+2BnaUYDwAIT12BTWhvLFEYFmsCHa9IJLwks6ZmRxTR8ckywXUsLcMBDcfB8G9v4ExdC1O2xhM+Pp79X03C/Cvr26QYldIusjSxlp4j+EScppjw2uTj0N+YhYK9x4ZDQ3Zh/FSMikh9v9qokO/tSRQmIFujCgkjYucEd2i9EkwoRSLVyhoQVlzWWb6qjLGxWYqqRz4pexPwnCDjhjxd93nA/CyyfoxycnVz/Kd0fGdczNbMFk6U76Xo/GNbnUUV/j1Wm49FNyJkSrPjDFu/M/rt5/FKB529GP5SKCXy0fXqOx77tWQQuBl49/o7L5TQUZGI=
X-Forefront-PRVS: 0182DBBB05
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyMDFNQjA3NjA7MjM6VUtVZlVVOG1Dczl1eGl5ZGw4ZXQxelFm?=
	=?utf-8?B?eUJsQld0bDNHSW5TS1RsTjI4L1hlb2NYMnB4UndPSEswdjhmazhwU3lwZmVB?=
	=?utf-8?B?RmNZT3VGZFhxb25TclFqanQwS0RoVGhBTGVST0pDTWVVVWtHZTR4aXZkWm9h?=
	=?utf-8?B?R2pLeWN5K3dDZVh4UjVGZkVwWnJYd0VTU2VFTEoweDdpT3hCNzBsM2NwMDgr?=
	=?utf-8?B?ZkwvVGhNaFBrL3BhekJJY2psaUpaa0YrblpTWjJiZDJjcjludHJ4UlI5NzdC?=
	=?utf-8?B?RFVYSEc2SXJXaERXT2JTSnlDRFBEK0htSHdCU3AwTXp0dVJWNVVlcW5xMkMr?=
	=?utf-8?B?TlV3UTRHVlNaZEVyRTI5K2g2NkxYaGdFT1htT29jaHlpcEs4K0hvSjdubUVn?=
	=?utf-8?B?dVlGUDlVdkFkeDFGZU1McDRwaTRNWmVRUStSQVRyUUR0a0o0eHVHMEw3QjRL?=
	=?utf-8?B?Z1ArclF6SVF4MDg5L2pTRkJOWjgvbGlHTVlzTk5lVC82cmhHM056WGhybXlp?=
	=?utf-8?B?anFLZUlrRUx5UGJFT2hZS0dGYU1XMkRmSmcya2lkTG1ESFROZ243a1dVKytF?=
	=?utf-8?B?MlRDelhOalUwWHhreDBkbG1SbFZVRUJHdUNWYnluYXRSWWI4ZEU3d25NMlNS?=
	=?utf-8?B?VWhOMVdEVmFHL3VOWGVZRDY2cEI4WFh0dTA5WFJray9vd3NPOEcxNmcwWFlo?=
	=?utf-8?B?aFlJcERRUkVpdkJGN20zY1RjSG1qai80VGhqNGxXS2dKbXlHL3VJR01ZUy9v?=
	=?utf-8?B?d25wclNjY05xa1h1bXk3ZGRZWEpyL3FaUmw3MEViM1RsTS9XY2YwNE1Kcytt?=
	=?utf-8?B?eU9RdDA5Q0Y4MHp6aFZzS3RYUCtCSzZDT1dKUnNKUm1saG8wckE3L2YzWWJO?=
	=?utf-8?B?QW1uWWo0ZWlvK3hSZFh3MTgzUExSMFB2d2dSZk41b1pqWHRVT2ZVOEFtdUZ1?=
	=?utf-8?B?MjMwS0RiZWpydDBaWG5aNDdYdVZsZFVXS1FTbS9wRHRZcGVoTzY4S1hsZXox?=
	=?utf-8?B?OHgvK1o2eVdZRGt2YnA1TlRwVmxQbE5KbW8vMXZjM3R5TnRLcnI4dlFWL1hQ?=
	=?utf-8?B?VmVEb2ZLN1R2cmFGSE9mUXVYeDhyaUowakhqT2U0Z0I5cURXemJ4b2dRNlpM?=
	=?utf-8?B?dnJmbU02ZFhQcmtTbjRBS1ZNS0wycDJ6aDUwdm42TnkxWU9WUE1XeXRCUVVl?=
	=?utf-8?B?Z2g2MkRERkNQWks1MGYxMHFHaWFGVjN1dlpKT3l5OUsyZkRKRlNSUG5EalV0?=
	=?utf-8?B?OXkxZHg2MWhJSGpPZStCNWIwOVdQRjhGUTk2ZmZqc0lqUWwvSitueTlYTlhj?=
	=?utf-8?B?bXdxSzBsZFhCT0phUXgrZmdpSGpUZHNjcEx1c3IxSnhCK2VTRVZwUlhOZGlI?=
	=?utf-8?B?eVVPWHB5Q3VBcDRsSFJEQUVvZWlidmQ3RFRtMms4bzJJYmVIQXQwNnpGdHFi?=
	=?utf-8?B?VzJ5UEY1cTRnN2JIYVRWVER5ODB0aEFYZTZ5ZnRPcENiUGVxcTV2Q3NhRmRM?=
	=?utf-8?B?UUhRL0l0NlpiNEhXeUMzMEdkRktxTlVNL2N0emNySklMWFJHcnNpSU9rZnd3?=
	=?utf-8?B?L0VzZEE1bm9EbWplcGZwN1prM25BUVRtdlYxV1dGQ1dqVTlCdXRXM1ZvMkpq?=
	=?utf-8?B?TWZraFhzZTcwMHRXTmNGSVA5eDkrMjNzR2xNY2NDWnR3Rng0VFRDZ09Kenp0?=
	=?utf-8?B?WGR4UWZTMjdFcDFxWmFTc1ZOYTZyTGRaSWZ0NVE0b3puMWIrcVl3S0pUSkNR?=
	=?utf-8?B?QTNDemp5Q28wU1dKMWVnREROUlpweW1yeHAzVEc5ZDhsOXRnQ3FaSWVjbFdW?=
	=?utf-8?B?eFphdEJZOWRNK0cxYlpWcCtzYjRZcGs1L3hZZkNGdTZ5RWszQT09?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	6:8VA3rHVVmvXfhbX3D57GqNnvaPCeup9xUvjZlNTboGlQ6tWPIN5TEj58bPZcwe56tVnphBNklmwSR+McNIXirqmbZYF/m0P1gBw669vL4xP5tRFQpFvwcx3BtFMRAhWCE8ZueXkN59QFh6aMcf/Gh4A37iFTCkyI4b4CASQZqVV+NKTrQSbsnFxWufH/C4gyXga27PWwIGGlfBqlyaGgZofKLDHEZps7MSdjCyDdy3mNPgk3JsvHEGgZt5CyTEy3ZpNRD8lGHuKU0+iLS4iPBa2tyGTnguAO/Zxs8KNHPtS/7QdEg6XmrMm3ml1qMvWT9bIed1CXDZHBhHuZ9GFqUxpEDO17qItrMK7z/kIwVFvi/cfukbqsSpkOHt4k/yZ4kpZhAw0vt8FioOQNcmt7cP7+DVPh7ZQWHSwRKWC6gDVKLer7jDu9Lnzk8U4OEgWZaTBMgBre16fTMEydM+BYPQ==;
	5:L8wK6YwuH1q+mJ5De5mvOPvuAU367TLY4J6agYu5L4TRudO0yAzzSU7fO1BDlNY6HaKbSjq7R5lI9peh9dgEbjt0yqH1aOArR5UD/q9+wnCo5qL7Qup9qk+vYP+spc57Et1JXtqShFxBGt63DDA6iOuOwK1REUkNbb+MRFNCjTM=;
	24:gnkVCBGTmwOD7WKG8voiBYPhpBwIbppN5DVWAcqGfurSSrbsD8HZECEpp+Wua2AhMnSkYErCUis6//yfXdPGfu9Y7lgkXfXBl8/DuhDVw5s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	7:LyV0kciGn5p6AJ/JGQt/EOuHedkSni6Zf34v8QIdaGz64U81Lb+hXvXtqfvNkefUscCKUo1h0DVhYQZUq8kTiqhmSSSRderM1IxYrRbg0IXeXXdk8eCijGUqd2jqfnB/EKST5Q7XeCB3b1OLAHe5/xYXqGMyHlDVLBzeBV6trHKK4gsu92ZqD2+aXuH3RmGD3ZSORrQyJL3tb2Lv5AKAzTYhu011Hsz7qPs0MPyUw6SFyFx3iS2+t1/4trCr/pGsHUZu9AcmXhO7L+6icQocqwo546Ncn0q8FHeNzqGg5rQBZNEIrWIFeUB3Af9QUG3XDCM5kQ7QgTCQrCnyx2avEgp8wjOhmW88Mk+sQAfyrN0APbtxQ5KGncVqQPhjcFtOJXzGsECREU211mYJItA++CZ7cUtqEmDBN81e0apaBpAqv8eArxxRtKelscGWJAPBKj1Gkj9e1buqFGCiBwexFg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2017 15:05:40.1669 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB0760
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.55
Subject: Re: [Qemu-devel] [PATCH v3 2/3] block: m25p80: Introduce die erase
 command
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EHJGoXSANjXD

On Mon, Jan 09, 2017 at 12:44:43PM +0100, Marcin Krzemi=C5=84ski wrote:
> 2017-01-09 12:10 GMT+01:00 Edgar E. Iglesias <edgar.iglesias@xilinx.com>:
> > On Sun, Jan 08, 2017 at 09:38:53AM +0100, Marcin Krzeminski wrote:
> >> Modern big flash nor devices consist from more than one die.
> >> Some of them do not support chip erase and instead have die
> >> erase command that can erase one die only. This commit adds
> >> possibility to define number of dies in the chip and adds
> >> support for die erase command. Nor flash model is not strict
> >> thus option to disable chip eras was not added.
> >                                  ^^
> >                               erase
> >
> > The commit message could be improved but codewise this looks
> > good to me:
>=20
> Beside fixing the typo, some more information/changes should I add?

It's not very important but:

I'm not a native english speaker but here are a few suggestions:
I would suggest spelling out NOR flashes to avoid confusion with
the word nor.

I also think it should say

"... devices consist of more than one die."
"This commit adds support for defining the number of dies..."

Perhaps Peter can suggest something better.

Cheers,
Edgar


>=20
> Thanks,
> Marcin
> >
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >
> >
> >>
> >> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
> >> ---
> >>  hw/block/m25p80.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 40 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> >> index 6dff81b..a9b025b 100644
> >> --- a/hw/block/m25p80.c
> >> +++ b/hw/block/m25p80.c
> >> @@ -73,6 +73,12 @@ typedef struct FlashPartInfo {
> >>      uint32_t n_sectors;
> >>      uint32_t page_size;
> >>      uint16_t flags;
> >> +    /*
> >> +     * Big sized spi nor are often stacked devices, thus sometime
> >> +     * replace chip erase with die erase.
> >> +     * This field inform how many die is in the chip.
> >> +     */
> >> +    uint8_t die_cnt;
> >>  } FlashPartInfo;
> >>
> >>  /* adapted from linux */
> >> @@ -90,7 +96,8 @@ typedef struct FlashPartInfo {
> >>      .sector_size =3D (_sector_size),\
> >>      .n_sectors =3D (_n_sectors),\
> >>      .page_size =3D 256,\
> >> -    .flags =3D (_flags),
> >> +    .flags =3D (_flags),\
> >> +    .die_cnt =3D 0
> >>
> >>  #define INFO6(_part_name, _jedec_id, _ext_id, _sector_size, _n_sector=
s, _flags)\
> >>      .part_name =3D _part_name,\
> >> @@ -107,6 +114,24 @@ typedef struct FlashPartInfo {
> >>      .n_sectors =3D (_n_sectors),\
> >>      .page_size =3D 256,\
> >>      .flags =3D (_flags),\
> >> +    .die_cnt =3D 0
> >> +
> >> +#define INFO_STACKED(_part_name, _jedec_id, _ext_id, _sector_size, _n=
_sectors,\
> >> +                    _flags, _die_cnt)\
> >> +    .part_name =3D _part_name,\
> >> +    .id =3D {\
> >> +        ((_jedec_id) >> 16) & 0xff,\
> >> +        ((_jedec_id) >> 8) & 0xff,\
> >> +        (_jedec_id) & 0xff,\
> >> +        ((_ext_id) >> 8) & 0xff,\
> >> +        (_ext_id) & 0xff,\
> >> +          },\
> >> +    .id_len =3D (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),\
> >> +    .sector_size =3D (_sector_size),\
> >> +    .n_sectors =3D (_n_sectors),\
> >> +    .page_size =3D 256,\
> >> +    .flags =3D (_flags),\
> >> +    .die_cnt =3D _die_cnt
> >>
> >>  #define JEDEC_NUMONYX 0x20
> >>  #define JEDEC_WINBOND 0xEF
> >> @@ -359,6 +384,8 @@ typedef enum {
> >>
> >>      REVCR =3D 0x65,
> >>      WEVCR =3D 0x61,
> >> +
> >> +    DIE_ERASE =3D 0xC4,
> >>  } FlashCMD;
> >>
> >>  typedef enum {
> >> @@ -514,6 +541,16 @@ static void flash_erase(Flash *s, int offset, Fla=
shCMD cmd)
> >>      case BULK_ERASE:
> >>          len =3D s->size;
> >>          break;
> >> +    case DIE_ERASE:
> >> +        if (s->pi->die_cnt) {
> >> +            len =3D s->size / s->pi->die_cnt;
> >> +            offset =3D offset & (~(len - 1));
> >> +        } else {
> >> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not =
supported"
> >> +                          " by device\n");
> >> +            return;
> >> +        }
> >> +        break;
> >>      default:
> >>          abort();
> >>      }
> >> @@ -635,6 +672,7 @@ static void complete_collecting_data(Flash *s)
> >>      case ERASE4_32K:
> >>      case ERASE_SECTOR:
> >>      case ERASE4_SECTOR:
> >> +    case DIE_ERASE:
> >>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
> >>          break;
> >>      case WRSR:
> >> @@ -881,6 +919,7 @@ static void decode_new_cmd(Flash *s, uint32_t valu=
e)
> >>      case PP:
> >>      case PP4:
> >>      case PP4_4:
> >> +    case DIE_ERASE:
> >>          s->needed_bytes =3D get_addr_length(s);
> >>          s->pos =3D 0;
> >>          s->len =3D 0;
> >> --
> >> 2.9.3
> >>
