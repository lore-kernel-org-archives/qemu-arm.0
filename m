Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp170704wrw;
        Fri, 16 Nov 2018 01:52:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5fkngSVoRiLlo2muqx9zA3Se+vOdJeZYVOLfKHWolp/u0fnzIwe1jwH901DE7jWoegeu4lw
X-Received: by 2002:aed:2921:: with SMTP id s30mr9361700qtd.346.1542361947917;
        Fri, 16 Nov 2018 01:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542361947; cv=none;
        d=google.com; s=arc-20160816;
        b=xLkoYkORwHMqY/7FAtY45dRnKBPQtSAwH7fNWn2QTjm4PUemCS1VuTgF3pyzXfSQ1a
         jxSlQGaHOjOZqgFjeKxlmcvm5hzODaspmJ0W0PEZbbPL/OC3UM8dKjadzMi9h6Y50UbH
         eaXSui596IIOUBNl74XYXNSv1D0hUVgU1l01/2EQu8+OtU0dWdxvI0Wm5dfFMwjRIVUx
         sz31QUqDOQetnfXK6x2qbSG4znTG+ZW+SiMlwYwpDFKzZ4aa5bo4vLPn0SYrMN6sanVZ
         OVSpu04VMyS5DUmw+XKkEncEK2b7CdRzxDS15N+iDQhauK6KqQdsUXch1A+EHtv++bvF
         LsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=2MGvc1pRAGFNq4WxSMLHfjyNT30qDkpLmb+fTd4OdGU=;
        b=kuZcwpPF23JYsAEQ5DMaoeFHKrgsK2U2F6ALmcKLvu3KMHnvz7Ic72+tuAKx4Sfn3j
         PTlQurhQpzzjd+WdeaOvtpPdLmnJT253zX+hoFHAZNACNC+HdNVHKZdLLmiWjUAvfZV2
         9VR47+OsITMdB7ejDlP+Xv6iJkityjZ1pI29e+BRG4l+9B7d0zqarZ68GVEbc2WfdDX7
         oD9v1SaHBIRnxFaNeSWNjIfEezzN/YwMX32DSVCG+STiFurXA37v7z/Iplzoy6PBEg1p
         MuitrTutQRwqO2GM/KZuFVm6LzJ25HwTD71h+N0fV08RE+G6bZxtxxnHiNArPYqUfjlU
         U01w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lzYoTmVz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si293446qtq.387.2018.11.16.01.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lzYoTmVz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNanb-0003s8-FK
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:52:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNanI-0003qE-9W
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:52:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNanF-0000TR-2c
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:52:08 -0500
Received: from mail-eopbgr760057.outbound.protection.outlook.com
	([40.107.76.57]:48992
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNanE-0000Sk-Ln; Fri, 16 Nov 2018 04:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UGN6AimAlLcXRirq7SsW+waEJTf6MJJgGYemOrWW3fc=;
	b=lzYoTmVzSOTDVGO7L0wkXxbH1Gz2+VQwtvts3zC8irTnuwjDtUU01QUweomjxxgO43Ej6xPZ0EwxBfxR9X2ulwFxq3I4ao2rxNWGqC7d+1rs4bPeEz1lkRbKGz9KX41U7VAjS8V/P2h1CRwfLfuGGFU+ObblTyZhV8rccA2krPY=
Received: from BYAPR02CA0044.namprd02.prod.outlook.com (2603:10b6:a03:54::21)
	by BL0PR02MB4322.namprd02.prod.outlook.com (2603:10b6:208:40::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.27;
	Fri, 16 Nov 2018 09:52:01 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by BYAPR02CA0044.outlook.office365.com
	(2603:10b6:a03:54::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 09:52:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 09:51:59 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51503
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNan9-0002lq-6E; Fri, 16 Nov 2018 01:51:59 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNan4-0001Lo-2v; Fri, 16 Nov 2018 01:51:54 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAG9pkGM028286; Fri, 16 Nov 2018 01:51:46 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNamw-0001Kf-2f; Fri, 16 Nov 2018 01:51:46 -0800
Date: Fri, 16 Nov 2018 10:51:45 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116095145.GN7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-5-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-5-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(438002)(199004)(189003)(33656002)(229853002)(9686003)(356004)(36386004)(6246003)(6916009)(63266004)(446003)(11346002)(50466002)(33716001)(486006)(426003)(478600001)(476003)(126002)(76176011)(336012)(47776003)(4326008)(106466001)(77096007)(186003)(1076002)(23756003)(2906002)(26005)(8936002)(9786002)(2870700001)(106002)(305945005)(5024004)(316002)(81166006)(8676002)(5660300001)(81156014)(58126008)(54906003)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4322; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT056;
	1:wrR9jEAfJvCmWgjzw081cH/Dj/7diS+9RWkIhxiHAAQF/oKC5PJzRMgOAiAqw2LtiWR4X9hFgMF9K7+Vi0ESnds/105d7GhKWX4/5699XKzl0vA2zYGP5AilKIeEXI9F
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9210c9e4-abe6-4cfe-dcf3-08d64ba9274f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BL0PR02MB4322; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	3:j3j+d1rGotwh4l0k8lwIhRrRzsslhoavIZ1UBhhoa6yk3DwiDetzhkfTeh9lBGf7br+qzJhAiX0WkQQAl9F2tNUh1+jpktC9iAYiuMG7cEC0v1UQsFCNF+GIiMhj0Hkf33lyxzSnnGp3e+Tfv7PPmdi5FoNHaTcOopKfbPSnAycz1wM1UDb4M/UvQiysyzfeRYvDXqvovyVKo73Q5VN382PbXmao2IgEBZcPDB6hd4i0L+c5DhOSWsfyjaIiz+rAxZzn6Glr5i6/6g/B/hwRATDmw0x6LaORoGWlrS+Dj55Hj3y9MhXi3vPRB6kWFq58RMVzxSVZbphxUUcGEGZiJ7yrihGbPqYfkTGOA8krSx4=;
	25:jgOT5owX0TuC/4a9IerA2WJJBvZXdr+hPsf1bVDaIIiza7u85grmyi+2+kzw6MQ1qrWq5wRDIYqXzNMEF/tAI+3r7lPkSk+oPdRqAiF1+iAY8FALbrQa0IiMqJPqOq149mLm661UebNu/XMCO5nhSkY5joUEcHAc7c/mXu2Zsh+CHezM1abhl608n9nZ/QVrQ3BpnKMribncR6AKyjellA/QKP38oC1IjAFapXRbRumdOTdWKNX/bz+kinFh1DfELpQ+Izam/kbRCY7w9+5RFbDx1Kw6Mv4dXmpADP4S5BF7WakpF78reW8FGNLOTzJVJxYmgXApz4fQhmvOmrTZug==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4322:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	31:07ydsjDsZr4Q2M1srGQHYVQ7u8w1+HzfrAF7x+Vvdd3NdQannG0nr7p2FuGxSNYDTu47ApO/WveIPLwwbNZDvX5PqO87Y2wqlxk8ZXpIyvXjDuB7uaNECcgQIP3SJGMg6nEsR974vkmYEN09tCOCEij8D71NmBiOCoFVZbaUxsebcHO2eVr4GHmCRmwbR86QUaa6UB4bjeh0/8whTRstjIUzwGXEDrfrb78fQABKTwI=;
	20:I3OtyUYF3ckZsu6uezMjZUY+nx6YVJUwPVWj8KG4XeuDacolVtnGB7Hf3rhceXsQbOtobMNe0050DUEeH9+hMpyKTrbsEHlnCr0890INkhI/vBb0DIY7itg+LiFAlzplZsmizzgwzKcmEzjtGVARgONQdymEwTaxJ8KI+7+Ep83AXFzc9394792t2Tc0r8vYLtuBtRItrMuyROuKdhvXUxq2oNQ9FXOmSeh8aMInZNEvK+JbI0u6DfIKNhl8NZBL+bwrE1ywrUJzG+Mt/ygaTUrELNu7D14Uc4KOZMSFJk6HUgUzjA7l1aDqjDgJoLKycrJIycof52eha9V+5oYT92gF0AjbVwEuDzzrPjZG4EKoSx1+LT4j1PMJrP22sXAW/D37nCSvhNnlexH7ipjxTW9AWqe5hYfTuUDZcU+HsgMgvskM8G70ISjodnsiLp4B6X/UzWtFct4KumAWAbsonESrf514vR8/6zLi/FSygFwurVuvA5DZEII31mrC8MgC
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4322BBCA738892C81D8625C9ABDD0@BL0PR02MB4322.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231415)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:BL0PR02MB4322; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4322; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	4:ssi2cD9cGWretual3/uLecMnd9VGM78//YIgTqa2Bpv3lDTe3FqXz7SGRyNJQhKYEGxBPAB+PrL+iY/S8gxvrYjoUglMB2QAsRj4ULmvm5Ak8je8I/exrCiDIr58D8pj/2VjfvKt2K+ED4N8zw0TOewvmH8y7Cdzo9eVDSHJnf8JXNkPLym2MKIoDCDd8LXsoKb+0tdmOs7d6nfCVlbV8QAR7SndbdyZxZF+IkzxVIaNzHbogV/ARyAdnox/3ogzZoA2ZWcM1B9rX4MT6X614HN3UhDJi0p7uwANnxQBIb8UPmKAT4rk96LxxGE+gw3E
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4322;
	23:8iAYvkqGAofVTAMD86bWXZ+SV7HqB/Ev3mAlLaZOJ?=
	=?us-ascii?Q?3HAK62u/B1/xE/c3Ej2sslXb9fv2qmovHvIMGE1qHmU1qE4j8mb7fiTVynX1?=
	=?us-ascii?Q?jvvDxY9ls9xU0W75U37szIwUVP1kGRop5DepxqNKPUVsjfSZTOWd1YPxkgLI?=
	=?us-ascii?Q?Epfj/qBQE7JptyJdBECYSReWM/gOJ4E0QRW6NRZooL0LmBpU0961NEq9QVGZ?=
	=?us-ascii?Q?FJLsTWddeoS/cKWn98OfxytFqhp7ejCX1zbqgavvIMgTVzJ0GHkfaLlfY0q1?=
	=?us-ascii?Q?3fRNrwE7ffUslirjIeqjzuKBb00l4ufxULPFpmRZdtr/ujQwXX+3gCPHeyB2?=
	=?us-ascii?Q?iTDbjymKkX3s4Bwtf182NsV58dDHDzM9xLnWcyhvHyHLKJrzYYwyY+Ba4hxH?=
	=?us-ascii?Q?fkzObIoS5jdeiZvPzoz00dBx4+N7HSzKTNryj2+Dt8/gm5fnD6VF2c/K6C2p?=
	=?us-ascii?Q?w1VLTCThXFNkqTWinlRp8pZVI8Eg8AryKtRK1xArpBJpfAhw/TMraPqEq8bS?=
	=?us-ascii?Q?EmDtY3tvjm6oYAEHjNkIcEvwsNaytj2zERUZmTnzS7PKieecJWChU8h/YYsU?=
	=?us-ascii?Q?z6ZP6oaoCCNFiEqV1MzfkBb0LYT/wsq3jfZa269xXT218YPSkPcgNRGx65oy?=
	=?us-ascii?Q?G2KJqVQEmZvKyi+qadW1eoAxk9fik0q8Ro1yJ9R/VL7qkINLbxZ+KjUBlwX1?=
	=?us-ascii?Q?nU638V/5GHOiPHGZEGv9D5aFlHsIOuFLZdMt22m4MqHSXTLaz3ClX8Hm+C7C?=
	=?us-ascii?Q?UrFv8nQc+Jjuz5Y9idWafOE22eRWQUnpvMjjsM/Q3JF52YWAa8mEXUVkZmzQ?=
	=?us-ascii?Q?j/XzbqkEJcWFJ1yKALMNh/DQ5N3eq0vNMjaTHv60prpoAYaTHnu4wnGO7qIC?=
	=?us-ascii?Q?2f/U5yILs6bVBS8NIX27utSchm7fui6jxA9lo6dofvNL3pmLyDLyIB7kevah?=
	=?us-ascii?Q?tgELJbcYyszMpTgWq30LqrUamxz1Dnneu9vTQGjtq7iIkLSFe/bEKo1aS/jt?=
	=?us-ascii?Q?p3VcoN5xe1RIailC64Dh4TpRI0Em6oK0jJXe72V5JYJNYheQu3YS+nfgD4/S?=
	=?us-ascii?Q?o1dxlt+XrCqUBMURhalhjaoTBbp2FCVYOoQkf04LjadKR9OORAaUriKo2Oj/?=
	=?us-ascii?Q?YKc7Q/VXPwy7fbE49FLL03XlQCF9DHbF0xKGRWoNIJd79pRfuXpJGtWagvkW?=
	=?us-ascii?Q?FHnJ92bTegiK98VkPm2TPSWuu35BvwBhCu6?=
X-Microsoft-Antispam-Message-Info: JcY2ezIIkt+6P0R/iItv5p6KCXJHm5w9nOa9dLlGPbMdQRgcw4B7iGx95x1vFHw2aCT3MWof3PBpEFy74j8Gj3frprzqt+GhVjQYCtji3Xlvt/99ZnXZJqounuRPEh2SBB7xADtkY2YxYtojVU/K36BuaNAOYGmHGf0E2PkyfXW9Eq/Q7mtNS7C9010TCJENHd/evh0oespcxT7X8WXH8tvZz83Pg194IOvb3bofbkCLQPe1nPkEi0gJKwnKWgMjSLJltAEUmOqSkNqdyrvQQAImR4Gfe4eohGsI6OHOuASc6a2pM4WgJ9XWNplOw60zRmhrejZxpjmYK5hKse/WvpssgmQ0uASjabVzvQ8CMDU=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	6:UZgs0Fpvkd8V9ViPgU+FjHBr5DZwmeg+bfVFGFucyCesiWB/xrg4VxMeTw/i+vqqDP0HulXhBvkHYpgbT4bqkJ9cApjThIB8BcM8BjbC1D4q+arHv0tAk3uk3YrCxFqRM5MKdipW6emZpuG8EpaCT3lJnijtDdq8wiRlILnOrd/pTE57//c8gcpDQsOJvqgpnmfCM7t1R4jOIKy4YdcXqqhV/qgg6K45gyE+FL4SWxM7xyEPhfnafgOvEw6HjuXZPewkrmWRdKDGkTiJ4ey+cFpcAK8n88KdOvpfTrn1r1L9KHi3812BGTpNy0kh3lEukf/DPyMCXtdms89ul5if/2rfubKsv5hmJXEtZsM9YEbTQQ9jiPLrvVztaZufszF3NpaLAZbIlvWQBGsGWJ5Op7lheXugNb2nX5XePgw/kM/Smi22i32tLR9pCyHSn3OTQFyHAx1x+DT/XyyZ/bJuJA==;
	5:NnfspEGvTmqejKvvJDNTF3a8sVBtMc5J3ZH4ist8JzevlcrqjLrfQswIZiEV/9DlKPu8Q6LH+lQg3SOGjqkyb3bD0PCl6miHyfc84i6iK7iarqh7bkx+3yGp6twKj9Qk5WTfh9z2ZEmFMnRtw2N+N5QHhJiq+oOQwOmYD1ccFxo=;
	7:U1WcleW7UuAHZHfCQloZBjVbVKWNNjo1bjzx6oFRvTaO/m8FQ1w3ab1BVrLcoNtI3wl6FfBGAU4AH281k2DJ3eG1xg0HQpSSAobpVfX/AMtFDwg2wWfdkAgf54EivOZzee0e5x+hMBT4HttbWE1dvw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 09:51:59.6073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9210c9e4-abe6-4cfe-dcf3-08d64ba9274f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4322
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.76.57
Subject: Re: [Qemu-arm] [PATCH v6 04/16] gdbstub: add multiprocess support
 to 'H' and 'T' packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uDt8drSeFjf2

On Thu, Nov 15, 2018 at 10:41:55AM +0100, Luc Michel wrote:
> Add a couple of helper functions to cope with GDB threads and processes.
>=20
> The gdb_get_process() function looks for a process given a pid.
>=20
> The gdb_get_cpu() function returns the CPU corresponding to the (pid,
> tid) pair given as parameters.
>=20
> The read_thread_id() function parses the thread-id sent by the peer.
> This function supports the multiprocess extension thread-id syntax.  The
> return value specifies if the parsing failed, or if a special case was
> encountered (all processes or all threads).
>=20
> Use them in 'H' and 'T' packets handling to support the multiprocess
> extension.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


Hi Luc,



> ---
>  gdbstub.c | 152 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 134 insertions(+), 18 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 4fbc05dfe3..fa2b7077b2 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -680,10 +680,73 @@ out:
>  #else
>      return s->processes[0].pid;
>  #endif
>  }
> =20
> +static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
> +{
> +    int i;
> +
> +    if (!pid) {
> +        /* 0 means any process, we take the first one */
> +        return &s->processes[0];
> +    }
> +
> +    for (i =3D 0; i < s->process_num; i++) {
> +        if (s->processes[i].pid =3D=3D pid) {
> +            return &s->processes[i];
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static GDBProcess *gdb_get_cpu_process(const GDBState *s, CPUState *cpu)
> +{
> +    return gdb_get_process(s, gdb_get_cpu_pid(s, cpu));
> +}
> +
> +static CPUState *find_cpu(uint32_t thread_id)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        if (cpu_gdb_index(cpu) =3D=3D thread_id) {
> +            return cpu;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t t=
id)
> +{
> +    GDBProcess *process;
> +    CPUState *cpu =3D find_cpu(tid);
> +
> +    if (!tid) {
> +        /* 0 means any thread, we take the first one */
> +        tid =3D 1;
> +    }
> +
> +    if (cpu =3D=3D NULL) {
> +        return NULL;
> +    }

Not sure about this. If tid is zero, you fix up the wildcard by setting tid=
 to one.
Shouldn't you also retry find_cpu(tid) in that case?

Otherwise, tid doesn't seem to be used after the wildcard fixup.

Other than that, I think this looks good:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> +
> +    process =3D gdb_get_cpu_process(s, cpu);
> +
> +    if (process->pid !=3D pid) {
> +        return NULL;
> +    }
> +
> +    if (!process->attached) {
> +        return NULL;
> +    }
> +
> +    return cpu;
> +}
> +
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     CPUClass *cc)
>  {
>      size_t len;
>      int i;
> @@ -936,23 +999,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulon=
g pc)
> =20
>      cpu_synchronize_state(cpu);
>      cpu_set_pc(cpu, pc);
>  }
> =20
> -static CPUState *find_cpu(uint32_t thread_id)
> -{
> -    CPUState *cpu;
> -
> -    CPU_FOREACH(cpu) {
> -        if (cpu_gdb_index(cpu) =3D=3D thread_id) {
> -            return cpu;
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
>  static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
>                             char *buf, size_t buf_size)
>  {
>      if (s->multiprocess) {
>          snprintf(buf, buf_size, "p%02x.%02x",
> @@ -962,10 +1012,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, =
CPUState *cpu,
>      }
> =20
>      return buf;
>  }
> =20
> +typedef enum GDBThreadIdKind {
> +    GDB_ONE_THREAD =3D 0,
> +    GDB_ALL_THREADS,     /* One process, all threads */
> +    GDB_ALL_PROCESSES,
> +    GDB_READ_THREAD_ERR
> +} GDBThreadIdKind;
> +
> +static GDBThreadIdKind read_thread_id(const char *buf, const char **end_=
buf,
> +                                      uint32_t *pid, uint32_t *tid)
> +{
> +    unsigned long p, t;
> +    int ret;
> +
> +    if (*buf =3D=3D 'p') {
> +        buf++;
> +        ret =3D qemu_strtoul(buf, &buf, 16, &p);
> +
> +        if (ret) {
> +            return GDB_READ_THREAD_ERR;
> +        }
> +
> +        /* Skip '.' */
> +        buf++;
> +    } else {
> +        p =3D 1;
> +    }
> +
> +    ret =3D qemu_strtoul(buf, &buf, 16, &t);
> +
> +    if (ret) {
> +        return GDB_READ_THREAD_ERR;
> +    }
> +
> +    *end_buf =3D buf;
> +
> +    if (p =3D=3D -1) {
> +        return GDB_ALL_PROCESSES;
> +    }
> +
> +    if (pid) {
> +        *pid =3D p;
> +    }
> +
> +    if (t =3D=3D -1) {
> +        return GDB_ALL_THREADS;
> +    }
> +
> +    if (tid) {
> +        *tid =3D t;
> +    }
> +
> +    return GDB_ONE_THREAD;
> +}
> +
>  static int is_query_packet(const char *p, const char *query, char separa=
tor)
>  {
>      unsigned int query_len =3D strlen(query);
> =20
>      return strncmp(p, query, query_len) =3D=3D 0 &&
> @@ -1070,16 +1174,18 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>  {
>      CPUState *cpu;
>      CPUClass *cc;
>      const char *p;
>      uint32_t thread;
> +    uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>      char thread_id[16];
>      uint8_t *registers;
>      target_ulong addr, len;
> +    GDBThreadIdKind thread_kind;
> =20
>      trace_gdbstub_io_command(line_buf);
> =20
>      p =3D line_buf;
>      ch =3D *p++;
> @@ -1283,16 +1389,22 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>          else
>              put_packet(s, "E22");
>          break;
>      case 'H':
>          type =3D *p++;
> -        thread =3D strtoull(p, (char **)&p, 16);
> -        if (thread =3D=3D -1 || thread =3D=3D 0) {
> +
> +        thread_kind =3D read_thread_id(p, &p, &pid, &tid);
> +        if (thread_kind =3D=3D GDB_READ_THREAD_ERR) {
> +            put_packet(s, "E22");
> +            break;
> +        }
> +
> +        if (thread_kind !=3D GDB_ONE_THREAD) {
>              put_packet(s, "OK");
>              break;
>          }
> -        cpu =3D find_cpu(thread);
> +        cpu =3D gdb_get_cpu(s, pid, tid);
>          if (cpu =3D=3D NULL) {
>              put_packet(s, "E22");
>              break;
>          }
>          switch (type) {
> @@ -1308,12 +1420,16 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>               put_packet(s, "E22");
>               break;
>          }
>          break;
>      case 'T':
> -        thread =3D strtoull(p, (char **)&p, 16);
> -        cpu =3D find_cpu(thread);
> +        thread_kind =3D read_thread_id(p, &p, &pid, &tid);
> +        if (thread_kind =3D=3D GDB_READ_THREAD_ERR) {
> +            put_packet(s, "E22");
> +            break;
> +        }
> +        cpu =3D gdb_get_cpu(s, pid, tid);
> =20
>          if (cpu !=3D NULL) {
>              put_packet(s, "OK");
>          } else {
>              put_packet(s, "E22");
> --=20
> 2.19.1
>=20
