Received: by 10.223.150.237 with SMTP id u100csp1827772wrb;
        Wed, 8 Nov 2017 15:01:20 -0800 (PST)
X-Google-Smtp-Source: AGs4zMapMTVmac0CE5EWiSxw2F4UZvL1uRtI5iDoJbIj2jMlFj775IboRE/R5zQ+dQRm+mxYqbc3
X-Received: by 10.37.42.131 with SMTP id q125mr944753ybq.473.1510182080301;
        Wed, 08 Nov 2017 15:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510182080; cv=none;
        d=google.com; s=arc-20160816;
        b=DAu1Owa++bvOMOnuNysxDhL382I1GjbvbnhkSVPYSiD4wpSQjLm1mTuXyanxG2zO/V
         1fGDgulpm5b6dhsRhjtQgpO51g5Jn9Jl42yhw4R+fv81XSBztwNj0cvimP6STqTqsuLj
         x+PFGeyA8OdM9qu6Q/vn1c+85pdZA6H6/A0yALU3nKTAc/cWslmMOWtlDz+0Na0Y2d0s
         WOnmifjkmIXhPCw9GYgy+qCOPPzGDxVDB0D+4rwZd8S2xC1HQ2OsMrL40bHqb7d1q4AU
         ap0TCSo2QfwzOyaHq+IjFvwQ+35lN5rZk4+Z3d6ENkcXxWYWzhvRjmtBQBsw7+nnohH5
         Gdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=blVKKb0EslbdLCYLDuLmR6k5+3XkmK/SZLc8LEMAkso=;
        b=T8csgAdcmqtDLHGe/OTJUQrQ66W0wz/8xRXxutbSil7WpXW+k+DbgD66Ki5y5h37G0
         cO98UkCXim1y4IYOyb/RD7Ug59997pRxl+mFn0woLP1TB6AWUthw4r6m9SbZndzcwREr
         kbQ1CfH0KQjzq3DGygH80/gQIUsBPE2z5j4BenP7/lrGGu31BKuPsHUGrm3N7ENaq2hc
         wulGzPjaX8GIX5Dsbpi6j5YrMhZNMM3J0Hqv7v0nUyH4nzkR8de4SNsWWUWPZz2+6k1+
         +OhmtGrtkZoU32prtmH+FGqlx9eCaoHd+TrRuxX6tsVqYHxgiam3pPJzc32JXHE7nr2b
         W+Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=xiUiXQdW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n63si1281983ybc.366.2017.11.08.15.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 15:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=xiUiXQdW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCZLT-0007eZ-Je
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 18:01:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eCZLB-0007aH-BM
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 18:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eCZL8-00032W-2y
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 18:01:01 -0500
Received: from mail-by2nam03on0088.outbound.protection.outlook.com
	([104.47.42.88]:1987
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eCZL7-00031k-JZ; Wed, 08 Nov 2017 18:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DWX+8uzs60In0pDgNFxckd5/ULNdINuTHq6bVgozZzo=;
	b=xiUiXQdWG+RNj1mtJn+XKCwaKQOSUOzgi5eH9D+I0XZkmhXW8WNGDqge6rO5+Q7bKgRoEAxvRpdye2PnhptvQHk7sd8id6WEXLKbHCi1LGH2MywhC765CF4P+l9t3vj36ZYg2zWyjRACx39de9WG0d4aTgsjW+A8YyuemX+z9ig=
Received: from MWHPR02CA0008.namprd02.prod.outlook.com (10.168.209.146) by
	CY4PR02MB3382.namprd02.prod.outlook.com (10.165.89.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Wed, 8 Nov 2017 23:00:54 +0000
Received: from SN1NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by MWHPR02CA0008.outlook.office365.com
	(2603:10b6:300:4b::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.197.13 via
	Frontend Transport; Wed, 8 Nov 2017 23:00:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT032.mail.protection.outlook.com (10.152.72.126) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Wed, 8 Nov 2017 23:00:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60242
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eCZL3-0003wq-3B; Wed, 08 Nov 2017 15:00:53 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eCZL2-0002Id-Fh; Wed, 08 Nov 2017 15:00:52 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vA8N0diC008403; Wed, 8 Nov 2017 15:00:39 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eCZKp-0002Dr-3d; Wed, 08 Nov 2017 15:00:39 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 8 Nov 2017 14:56:40 -0800
Message-ID: <cab5422e5b2a5c40334fdf0330966df46806e8f2.1510181732.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510181732.git.alistair.francis@xilinx.com>
References: <cover.1510181732.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23450.000
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(50986999)(50466002)(63266004)(2351001)(54906003)(76176999)(5820100001)(5890100001)(118296001)(47776003)(316002)(33646002)(106002)(36386004)(575784001)(23676003)(189998001)(5660300001)(6916009)(2906002)(9786002)(39060400002)(8676002)(2950100002)(4326008)(6666003)(2870700001)(305945005)(106466001)(356003)(81166006)(77096006)(36756003)(50226002)(8936002)(81156014)(478600001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3382; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT032;
	1:4MGdrUZDFIWWI9zHqGJ4YWf7hkLIWueumUlnTFs8FSX5PURbuL4n6DjGne81TK/BMWvDI5Ti7BCy6FJ79C8kJqPt7wUx0ZRBGECadqMON7nxyo9IBjkc6Y6DcOzOBLG+
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6abff64-51cb-4e27-1d12-08d526fc9069
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603249);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	3:RGXrLToLNQzjBhSyQoEF52ckrET5a/8mktxqxvUq7+9xDq/8DEASJGcTXQQ1WUj9Smyk5y1RqTCnOGjGmCAz8Pd49Xl4iOfmwaqG+baLeyiWsvTfdAvUB/3wcSIe76gjH562AZCQRkZAAo50WPqSY5kE2CKAXvSkAMMATEzVCJpafVLsbB8BHc6UCsflWKnJGF7ghrHtgCJwJugth4uoquXmHXyXm6Z8fUSNUTUYVVIRB9vFqUTTEo4uavFFBVBA4/SslYqPHgf2Ve1ey5eQlSMDENLuL3IZwu76uyQOTIwi4sxeDOY0UV4eoEPBLd8z7P7Nvv5imRjo492knfh+9h7aorbVNVl42861wFW3glw=;
	25:iEs83edRmOMzgiKkl5+OR8HYzOyuMW7QzTlHaby4/yO3tRkF+RwjfFrYvuceSdP6W68Z3uTfLVroBSCgU0cdDdgItiuLWmZxKIeK1jpOhOpgKRDkzsUikZnCZElacdvOQxyG8hWvLJrFsiDPxmqNn/Gix4EwJ/x093vxPvAi6SqmHWbwKrnaeTZUYgBAiWM2XWZuPbZSqD6Gha4ALc2r5ZcC/vN5nvanCNo1WHrt+Q5ibVplAf/ArnYOwkpY/ge1K4fB1d0x5Gq4MX4bZW5wz/MhI7AjTQ6cpCWqElXhnntFe3j26+KICK7jAXAQyeHvPNekEuq+vSTA8rorLhsBIw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3382:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	31:ll60Zlb8JrNk5dOHhWSzLz6BGYilxMPMhxErUbKqqJgoGVQuw0/f6inG3UFdBdQPa78Z3j7fIgJ6A3iEl7qAUH1lLn0msoabG/vcXT7B87EgxOp+eUGoqBEDI9am2k1e5KkfCsI3LBowBYkexzWITiCcJGZbnGMmzScE8InATHjHnaQIdLm2C/z9LOW+gqStDXj5U8jSnKfn+kpN2QINb/0nxq3zV6fKayLlFUUnnjE=;
	20:1yGi5NmjsDc58AcNt+vrIKdY3pgXKoTFwPnROV7uGs6bYPjoQE2yAjvOgRfgssM2jiDN/koTTJF6WI7sGPtBNOSBmUjEEwZRHzFhiF0Tq2+PzAoJoYheYnuDMqCSC6Osn5+WcLnpfsBO1kQpH4ANXW3qi9B2Q6t2NT33Cgq6ZZbtjh8ra/8H7JKzeYeGl6ycRU0cLQNyrQC6r2QG7RHV9QwLOCg36WGmXWHDIWl3y13WxUQculMbIofRR4rkrfmo2lcrciXHPk3BNqamVvY8VNBVxm1sHuTT/ND24FdawD1IPh3Qw/HcCU1Xbf7ZTjzMW/gsVNc1kv1+EF4ANMwalKmwPJmoerUu/VvH7TjGiDXi4nDERIj2aHmVA347U4usZhe+J/Y9c86mC69YkNfSLuackq2HeFvXaJ4P1VbsA2PZTdMfwFo++K0yabZlBwv7xpV8Dq9zFECCE8nUrVDraudgnw3DU+sxKminQ1CbMotIMLInkFnSWT0HUMtT8pRa
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Microsoft-Antispam-PRVS: <CY4PR02MB33829FE7C265286042665CF9DC560@CY4PR02MB3382.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231021)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93004095)(6055026)(6041248)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3382; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	4:mfO7se2jHM7MEsHP73nFMUDtN+e/bzodbD/2hsSndFrzj/8jsivZ4zG4ku0WnFmaaog3fUcEmSe8zqod0ycX7GGbGpEW5AwjkfZo3vOdjNh22QwpHA8dZ8A5uca4X0R/XtQPjwbbP9NlrwYw7B0yu+LUDyKHmIFiVU1DqpqcxJEPpR0/WSDZuQt/gq//OR8AVx58W5SavNKm/yrI6Hvppdvk/ateq4DuPX/HEzr6N/BH9bwuy2PQXevxg7nri50hWXOZ9LqxiFXcF6errplm9nxjooQYZk9IUkVKRCq+arsbh1ufB6JujMYCLw0nHr2QOQUOYmCZoOXb5Ee2xPVrcQ==
X-Forefront-PRVS: 0485417665
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3382;
	23:Nfh2rNVpwN2MnRyKXC0+Eu5M6INO7jP/dXi9sa4XL?=
	=?us-ascii?Q?8O/RVFL4hHRgP1JidpR5wgoPsU9FiL8KSwx7sRBlcNiNcoktzOlINjWBUCmI?=
	=?us-ascii?Q?aQ8DUc1qaJ1SVrKhNBW3frNeIaNeVay1fbIPOGfgrLCy4SUw4T9/AfDcGpEq?=
	=?us-ascii?Q?sTlPVc5/M0XOQimdRX1Bhq1chX6ZoYuQhOllUPub01tZxQT7pwfXn3AcL8hm?=
	=?us-ascii?Q?OBqTXMSVNszKZWmcXuN7P6sk3iB3raRYH92wXMP7QxaEs8fbelumIuUjhAYc?=
	=?us-ascii?Q?xkXsveqFpOEKoxOfxETR7+M1ct/j2oBA5RmpMLHqtLGIojy8IjxRtdGFwyTo?=
	=?us-ascii?Q?cPziXqif1aFO8PSrjCct2wmvIghcM6o7CxRMV9L4gySXZkW1Es/vpDAVjCtt?=
	=?us-ascii?Q?Xb81ciPxzYDOxbETeQe8K1yT/oclQbc1RQexyx1tgmKQVT97pl/orQn8L5BQ?=
	=?us-ascii?Q?TiQWynTmXGtpEqmdF+YJrFfdCufF954wtlCbisoLydcXkCPNA4lEKe3LezDj?=
	=?us-ascii?Q?bX8Zr2rMufjJQh2ENyDrnGrsGDNJkZqK6HnsLRtsqd1HYojWH5k0Q6ja+huQ?=
	=?us-ascii?Q?GPRj2gHh9iDHCX2NZj+0vCKgzFqmQGzGAxVe1C5/eGPokCCP1e+8oq3LfJ8X?=
	=?us-ascii?Q?2oSCNAu4IXbRYFGZ39Kzw91SCKXoIlNJngbYxE+9kaVA6O/tpzRmUWxnPFxf?=
	=?us-ascii?Q?HgFvv4BHs/R8ImHOIjDLE2vN9Dw8xny/gWi/hmzHRFZO6S0Ynv0pFkyYodMS?=
	=?us-ascii?Q?vrLpqLbZxFow+a6hr3XUJtKXFRIb2Qqmn8i9eQkkqne8Ma5V4xb69Bonay+C?=
	=?us-ascii?Q?XiSBSsaOrgGYVqVcarmxBSyJA1atAhGLkChXDrFN9Wn6BqUtL1GsiHT0KjQ3?=
	=?us-ascii?Q?Pyp5W6Iw1V5XP+aA4Enx91YeIu2iP0rYU/ADfipHBjuyqDAQ+Ve4sUt7pBsR?=
	=?us-ascii?Q?+r9mj3eFJ6z7jeiNlljkfW3d+5VqQV1S/nuOs4CiEh0NXVvplPDq5IsQ7eOO?=
	=?us-ascii?Q?5zoLk0ceB2KH52ettQkCi926ktbHLexXUirRNCYpO9bCEqVncgL2FdNz2imv?=
	=?us-ascii?Q?F4CPA6aFTbxCYZNoFSOw1pmSMj9PP06+ohdl9ANOE5k3DzRAhV9Jv7t6Wddp?=
	=?us-ascii?Q?foC3qhkWTKGf+CsrZq19X6sXHYWVIVS?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	6:+jjjDzt/L2yxt9oXC5cdIpJuQ+/Vim6TthWSXIGhBN+FIhSQXwlDJGtWhAY/AdU1f8ffESILfC0hzWuYLFXlYDW8WGc4uzN6fE8A5a15a7tMs93AxRp9wLMR0oyxFWnjBZKAjWaurwLKQtI1VASLA7IXTikXMwSfefqr96+FOYl4GYcHDNwgaD1sWwE+qU5vZtVMDZnaCc/MSSgSqaufDOOvx222p3JJmuvfLBeec5wP8+Cj21KVf5xegsuPpmIeODnwI5EyrzQZc5meElUzFyoRXdoLfRZVjpBmeNVb4dbYpLPbJBKSLv+OKvfELBX0z0la8zwox94HxVJ/3ac87Y41qOahIzAGtoMSIYidm4c=;
	5:OBbu9dOHIrOMUVrCE4IDevq58VHXjiRTk7YOTpuELG1qzRgZDhwSrE5qAslj5Nyf3RAX8QoSUH8j86qG3941ru2pH8C1wZl2k+B77rd5vXsTO2XoiKkjdIaZ3vfC+A+J2RyEBTOyYnJ895HTRZFtK9JMKdKKSmc2iXn20hf4T34=;
	24:7ZgCc+sngNNWYBfX+biNuqLJfshgrU/3xHUnHwjZabcBdM2J6EbZ5FN7mwOGu7b101k/pIdcX86nbXQ601o9zGXdamttlbQQ4nLLn/ZW54Q=;
	7:zmxJloQzsUHdcH6dG0o7meyZY0Rq/qz3af6CDFDCGdrCW4Dj7eCUYqcoN1zHxuvBxnZXkKLilDvE5ZawH9mDvmIt5sNnqLetYK2ZL20prwUzCKVw5kLavV+ikw+xTHbT5cd+EkzSRhLrnZv6/KtT6Q+5B7hBrCmJrVkjT9dxUXTVXUVMwSUo3m++oRCnw9neZ1kcn8WSp2IBMhWpUQUoG5ISlP3+5gkyYDyfsgffFfL5XizxgAdBfEDsjcSHUBSs
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2017 23:00:53.5777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6abff64-51cb-4e27-1d12-08d526fc9069
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3382
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.88
Subject: [Qemu-arm] [PATCH v4 05/45] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, armbru@redhat.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cThUI+BLXAxN

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_re=
port("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V3:
 - Remoave 'qemu: ' prefix
V2:
 - Split hw patch into individual directories

 hw/arm/armv7m.c      |  2 +-
 hw/arm/boot.c        | 37 ++++++++++++++++++-------------------
 hw/arm/gumstix.c     | 13 +++++++------
 hw/arm/mainstone.c   |  7 ++++---
 hw/arm/musicpal.c    |  2 +-
 hw/arm/omap1.c       |  5 +++--
 hw/arm/omap2.c       | 23 ++++++++++++-----------
 hw/arm/omap_sx1.c    |  6 +++---
 hw/arm/palm.c        | 10 +++++-----
 hw/arm/pxa2xx.c      |  7 ++++---
 hw/arm/stellaris.c   |  3 ++-
 hw/arm/tosa.c        | 17 +++++++++--------
 hw/arm/versatilepb.c |  2 +-
 hw/arm/vexpress.c    |  8 ++++----
 hw/arm/z2.c          |  6 +++---
 15 files changed, 77 insertions(+), 71 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index bb2dfc942b..56770a7048 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -278,7 +278,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel=
_filename, int mem_size)
 #endif
=20
     if (!kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Guest image must be specified (using -kernel)\n")=
;
+        error_report("Guest image must be specified (using -kernel)");
         exit(1);
     }
=20
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..6e6b8c0c6a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include <libfdt.h>
 #include "hw/hw.h"
@@ -418,13 +419,13 @@ static int load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
         char *filename;
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, binfo->dtb_filena=
me);
         if (!filename) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", binfo->dtb_file=
name);
+            error_report("Couldn't open dtb file %s", binfo->dtb_filename)=
;
             goto fail;
         }
=20
         fdt =3D load_device_tree(filename, &size);
         if (!fdt) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", filename);
+            error_report("Couldn't open dtb file %s", filename);
             g_free(filename);
             goto fail;
         }
@@ -432,7 +433,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
     } else {
         fdt =3D binfo->get_dtb(binfo, &size);
         if (!fdt) {
-            fprintf(stderr, "Board was unable to create a dtb blob\n");
+            error_report("Board was unable to create a dtb blob");
             goto fail;
         }
     }
@@ -451,7 +452,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
     scells =3D qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
                                    NULL, &error_fatal);
     if (acells =3D=3D 0 || scells =3D=3D 0) {
-        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0=
)\n");
+        error_report("dtb file invalid (#address-cells or #size-cells 0)")=
;
         goto fail;
     }
=20
@@ -459,8 +460,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide
          */
-        fprintf(stderr, "qemu: dtb file not compatible with "
-                "RAM size > 4GB\n");
+        error_report("dtb file not compatible with RAM size > 4GB");
         goto fail;
     }
=20
@@ -480,7 +480,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
                                               acells, mem_base,
                                               scells, mem_len);
             if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", noden=
ame,
+                error_report("couldn't set %s/reg for node %d", nodename,
                         i);
                 goto fail;
             }
@@ -505,7 +505,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+            error_report("couldn't set /memory/reg");
             goto fail;
         }
     }
@@ -519,7 +519,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         rc =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                      binfo->kernel_cmdline);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/bootargs\n");
+            error_report("couldn't set /chosen/bootargs");
             goto fail;
         }
     }
@@ -528,14 +528,14 @@ static int load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
         rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                    binfo->initrd_start);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+            error_report("couldn't set /chosen/linux,initrd-start");
             goto fail;
         }
=20
         rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                    binfo->initrd_start + binfo->initrd_siz=
e);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+            error_report("couldn't set /chosen/linux,initrd-end");
             goto fail;
         }
     }
@@ -690,7 +690,7 @@ static void load_image_to_fw_cfg(FWCfgState *fw_cfg, ui=
nt16_t size_key,
         gsize length;
=20
         if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            fprintf(stderr, "failed to load \"%s\"\n", image_name);
+            error_report("failed to load \"%s\"", image_name);
             exit(1);
         }
         size =3D length;
@@ -956,8 +956,7 @@ static void arm_load_kernel_notify(Notifier *notifier, =
void *data)
         is_linux =3D 1;
     }
     if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                info->kernel_filename);
+        error_report("could not load kernel '%s'", info->kernel_filename);
         exit(1);
     }
     info->entry =3D entry;
@@ -976,8 +975,8 @@ static void arm_load_kernel_notify(Notifier *notifier, =
void *data)
                                                   info->initrd_start);
             }
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initrd '%s'\n",
-                        info->initrd_filename);
+                error_report("could not load initrd '%s'",
+                             info->initrd_filename);
                 exit(1);
             }
         } else {
@@ -1021,9 +1020,9 @@ static void arm_load_kernel_notify(Notifier *notifier=
, void *data)
         } else {
             fixupcontext[FIXUP_ARGPTR] =3D info->loader_start + KERNEL_ARG=
S_ADDR;
             if (info->ram_size >=3D (1ULL << 32)) {
-                fprintf(stderr, "qemu: RAM size must be less than 4GB to b=
oot"
-                        " Linux kernel using ATAGS (try passing a device t=
ree"
-                        " using -dtb)\n");
+                error_report("RAM size must be less than 4GB to boot"
+                             " Linux kernel using ATAGS (try passing a dev=
ice tree"
+                             " using -dtb)");
                 exit(1);
             }
         }
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index bba9e9f57a..8f11b03066 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, connex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
@@ -99,8 +100,8 @@ static void verdex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -113,7 +114,7 @@ static void verdex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, verdex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index d07972a966..189febf8b7 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -143,8 +144,8 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
             if (qtest_enabled()) {
                 break;
             }
-            fprintf(stderr, "Two flash images must be given with the "
-                    "'pflash' parameter\n");
+            error_report("Two flash images must be given with the "
+                         "'pflash' parameter");
             exit(1);
         }
=20
@@ -154,7 +155,7 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, MAINSTONE_FLASH / sector_le=
n,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("Error registering flash memory.");
             exit(1);
         }
     }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b648770882..06127a873d 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1626,7 +1626,7 @@ static void musicpal_init(MachineState *machine)
         flash_size =3D blk_getlength(blk);
         if (flash_size !=3D 8*1024*1024 && flash_size !=3D 16*1024*1024 &&
             flash_size !=3D 32*1024*1024) {
-            fprintf(stderr, "Invalid flash image size\n");
+            error_report("Invalid flash image size");
             exit(1);
         }
=20
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 92e58f09c8..b3a23a83d1 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2313,7 +2314,7 @@ void omap_uwire_attach(struct omap_uwire_s *s,
                 uWireSlave *slave, int chipselect)
 {
     if (chipselect < 0 || chipselect > 3) {
-        fprintf(stderr, "%s: Bad chipselect %i\n", __func__, chipselect);
+        error_report("%s: Bad chipselect %i", __func__, chipselect);
         exit(-1);
     }
=20
@@ -3987,7 +3988,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *system_memory,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap_mmc_init(0xfffb7800, system_memory,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index b53878b8b9..3a1d995d6a 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s =
*s)
     /* TODO: update clocks */
=20
     if (mode[0] =3D=3D 1 || mode[0] =3D=3D 2 || mode[1] =3D=3D 1 || mode[1=
] =3D=3D 2)
-        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
-                        __func__);
+        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
+                     __func__);
 }
=20
 static void omap_prcm_dpll_update(struct omap_prcm_s *s)
@@ -1331,7 +1332,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s =
*s)
     s->dpll_lock =3D 0;
     switch (mode) {
     case 0:
-        fprintf(stderr, "%s: bad EN_DPLL\n", __func__);
+        error_report("%s: bad EN_DPLL", __func__);
         break;
     case 1:	/* Low-power bypass mode (Default) */
     case 2:	/* Fast-relock bypass mode */
@@ -1358,7 +1359,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s =
*s)
         omap_clk_reparent(core, dpll_x2);
         break;
     case 3:
-        fprintf(stderr, "%s: bad CORE_CLK_SRC\n", __func__);
+        error_report("%s: bad CORE_CLK_SRC", __func__);
         break;
     }
 }
@@ -1627,8 +1628,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
=20
     case 0x500:	/* CM_CLKEN_PLL */
         if (value & 0xffffff30)
-            fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKEN_PLL for "
+                         "future compatibility", __func__);
         if ((s->clken[9] ^ value) & 0xcc) {
             s->clken[9] &=3D ~0xcc;
             s->clken[9] |=3D value & 0xcc;
@@ -1646,8 +1647,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
         break;
     case 0x540:	/* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL1_PLL for "
+                         "future compatibility", __func__);
         if ((s->clksel[5] ^ value) & 0x003fff00) {
             s->clksel[5] =3D value & 0x03bfff28;
             omap_prcm_dpll_update(s);
@@ -1658,8 +1659,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
         break;
     case 0x544:	/* CM_CLKSEL2_PLL */
         if (value & ~3)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
+                         "future compatibility", __func__);
         if (s->clksel[6] !=3D (value & 3)) {
             s->clksel[6] =3D value & 3;
             omap_prcm_dpll_update(s);
@@ -2486,7 +2487,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sysmem,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap2_mmc_init(omap_l4tao(s->l4, 9),
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 9a14270795..e510465137 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -158,7 +158,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -182,7 +182,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash1_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -194,7 +194,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
     }
=20
     if (!machine->kernel_filename && !fl_idx && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or Flash image must be specified\n");
+        error_report("Kernel or Flash image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709d..7f3637041a 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -233,8 +233,8 @@ static void palmte_init(MachineState *machine)
     if (nb_option_roms) {
         rom_size =3D get_image_size(option_rom[0].name);
         if (rom_size > flash_size) {
-            fprintf(stderr, "%s: ROM image too big (%x > %x)\n",
-                            __func__, rom_size, flash_size);
+            error_report("%s: ROM image too big (%x > %x)",
+                         __func__, rom_size, flash_size);
             rom_size =3D 0;
         }
         if (rom_size > 0) {
@@ -243,13 +243,13 @@ static void palmte_init(MachineState *machine)
             rom_loaded =3D 1;
         }
         if (rom_size < 0) {
-            fprintf(stderr, "%s: error loading '%s'\n",
-                            __func__, option_rom[0].name);
+            error_report("%s: error loading '%s'",
+                         __func__, option_rom[0].name);
         }
     }
=20
     if (!rom_loaded && !kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or ROM image must be specified\n");
+        fprintf(stderr, "Kernel or ROM image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index db860c238e..0386a0d8bf 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2062,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     s =3D g_new0(PXA2xxState, 1);
=20
     if (strncmp(cpu_type, "pxa27", 5)) {
-        fprintf(stderr, "Machine requires a PXA27x processor.\n");
+        error_report("Machine requires a PXA27x processor.");
         exit(1);
     }
=20
@@ -2095,7 +2096,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
@@ -2220,7 +2221,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space,=
 unsigned int sdram_size)
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index de7c0fc4a6..f6f295b363 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
@@ -559,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        error_report("Peripheral reset not implemented");
         break;
     case 0x054: /* IMC */
         s->int_mask =3D value & 0x7f;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index a55b1a369c..a069c95f1c 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -12,6 +12,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -70,19 +71,19 @@ static void tosa_out_switch(void *opaque, int line, int=
 level)
 {
     switch (line) {
         case 0:
-            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
+            error_report("blue LED %s.", level ? "on" : "off");
             break;
         case 1:
-            fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
+            error_report("green LED %s.", level ? "on" : "off");
             break;
         case 2:
-            fprintf(stderr, "amber LED %s.\n", level ? "on" : "off");
+            error_report("amber LED %s.", level ? "on" : "off");
             break;
         case 3:
-            fprintf(stderr, "wlan LED %s.\n", level ? "on" : "off");
+            fprintf(stderr, "wlan LED %s.", level ? "on" : "off");
             break;
         default:
-            fprintf(stderr, "Uhandled out event: %d =3D %d\n", line, level=
);
+            fprintf(stderr, "Uhandled out event: %d =3D %d", line, level);
             break;
     }
 }
@@ -133,7 +134,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
=20
 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
 {
-    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
+    error_report("TG: %d %02x", value >> 5, value & 0x1f);
     return 0;
 }
=20
@@ -159,13 +160,13 @@ static int tosa_dac_send(I2CSlave *i2c, uint8_t data)
     s->buf[s->len] =3D data;
     if (s->len ++ > 2) {
 #ifdef VERBOSE
-        fprintf(stderr, "%s: message too long (%i bytes)\n", __func__, s->=
len);
+        error_report("%s: message too long (%i bytes)", __func__, s->len);
 #endif
         return 1;
     }
=20
     if (s->len =3D=3D 2) {
-        fprintf(stderr, "dac: channel %d value 0x%02x\n",
+        error_report("dac: channel %d value 0x%02x",
                 s->buf[0], s->buf[1]);
     }
=20
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 418792cd02..56f9d60bed 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -364,7 +364,7 @@ static void versatile_init(MachineState *machine, int b=
oard_id)
                           VERSATILE_FLASH_SECT_SIZE,
                           VERSATILE_FLASH_SIZE / VERSATILE_FLASH_SECT_SIZE=
,
                           4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
     }
=20
     versatile_binfo.ram_size =3D machine->ram_size;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index efb5a29475..508629dfe9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -266,7 +266,7 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
=20
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
-        fprintf(stderr, "vexpress-a9: cannot model more than 1GB RAM\n");
+        error_report("vexpress-a9: cannot model more than 1GB RAM");
         exit(1);
     }
=20
@@ -355,7 +355,7 @@ static void a15_daughterboard_init(const VexpressMachin=
eState *vms,
          */
         uint64_t rsz =3D ram_size;
         if (rsz > (30ULL * 1024 * 1024 * 1024)) {
-            fprintf(stderr, "vexpress-a15: cannot model more than 30GB RAM=
\n");
+            error_report("vexpress-a15: cannot model more than 30GB RAM");
             exit(1);
         }
     }
@@ -640,7 +640,7 @@ static void vexpress_common_init(MachineState *machine)
     pflash0 =3D ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flas=
h0",
                                        dinfo);
     if (!pflash0) {
-        fprintf(stderr, "vexpress: error registering flash 0.\n");
+        error_report("vexpress: error registering flash 0.");
         exit(1);
     }
=20
@@ -655,7 +655,7 @@ static void vexpress_common_init(MachineState *machine)
     dinfo =3D drive_get_next(IF_PFLASH);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
-        fprintf(stderr, "vexpress: error registering flash 1.\n");
+        error_report("vexpress: error registering flash 1.");
         exit(1);
     }
=20
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 60561c7b7c..ee59142667 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -319,8 +319,8 @@ static void z2_init(MachineState *machine)
 #endif
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "Flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("Flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -329,7 +329,7 @@ static void z2_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, Z2_FLASH_SIZE / sector_len,
                                4, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
--=20
2.14.1

