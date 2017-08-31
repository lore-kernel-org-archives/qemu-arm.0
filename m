Received: by 10.223.188.70 with SMTP id a6csp258152wrh;
        Thu, 31 Aug 2017 16:38:36 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7QKLJtK0A37fE19Kdt2HixZc746lHqvSK0eZFZX+4gRwmBkgUJ1W/dTPmFhjbUgcuo7dnS
X-Received: by 10.55.159.146 with SMTP id i140mr182347qke.7.1504222716016;
        Thu, 31 Aug 2017 16:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504222716; cv=none;
        d=google.com; s=arc-20160816;
        b=HhYNEp5g7onCp9vrnyirqFTdzERpirgNybFeBF9fXiDXjNFJ6v8tNkAGW7wruw1RoK
         24/T9hXk9d4lsqUTSlpgqywwxOq4RrQ6tPcszi+Dxq/7pjLNYQxPT1Zvy6s6FD1iQSWW
         /EIg2ZnniNhjOn2e2wcxPBwKptI68aFD3SyCNARUPbROfUDVzYeS3blwwY3ALceDwzsG
         PElKoGXaaU2jB94q37GAdNyN9RzAAFA4fecP8J+5AORTfgf5gbFCDcjinkQd7HLhZYUi
         x55D+VygXtWa2SkJ0wWcNq3OCt+lytiKt4FZoN3VDnG6zv1RwDZ1WloAPtk3QUamuQnQ
         kkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=n8NelC3thRcu1yuOVnppxDwLKqXKGykAN/mNLA0joFE=;
        b=ocUG8KCMFSt6XJH2yXHUkK3M9q2RxtWlt8c/U0r+zmOl9ZlaPR9a3+Zik0fxRt3jia
         L5U/PRFoo82ekxkvUooPRlR2Yag9UXN50e9KQar9f8UhCyDjUVn+AaSHrWuJgfgI2CzW
         uFQQy64XGjbBL/FcP/VyrxdVKUW2Kvp38bV3wruYYv/DulmJsHAuFeRkWYuMs1lOWn2i
         tSMq7a2FywKZ/VG2TG3n1jNbtEkSgM+UX49phHlsVKpsDhuOSsV4+G0sN+1pEAnWtfYs
         uUSkOiJutBD6ttVHPEw/nSWKW79btM+6OdJDinZlGYPu3ijXPJI79A6VWDFGuUGHt79w
         vwZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=xD+DEMIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v127si8813739qki.505.2017.08.31.16.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=xD+DEMIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnZ2f-0003Vs-N6
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2T-0003Qt-R7
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2P-0003kG-Ku
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:21 -0400
Received: from mail-bl2nam02on0043.outbound.protection.outlook.com
	([104.47.38.43]:58304
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnZ2P-0003jg-Eu; Thu, 31 Aug 2017 19:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=n8NelC3thRcu1yuOVnppxDwLKqXKGykAN/mNLA0joFE=;
	b=xD+DEMIkg52TEBo4ENSl/zy3Z80SfS3UwgrLSarhsSbyqmCaIX4WYZ115GQ9yeXpsF0DGmi8YnGJTYaT4h8I/1tx0eJZpY/dXHJ1qKbO0SdN3pNrvK9cX4hsw3ejYhW/gDVeU/GZ6WaUZFbKdCrWpTM1XEkF4jWrt8lIEWveMsI=
Received: from SN4PR0201CA0065.namprd02.prod.outlook.com (10.171.31.155) by
	CY1PR02MB1136.namprd02.prod.outlook.com (10.163.15.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Thu, 31 Aug 2017 23:38:15 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by SN4PR0201CA0065.outlook.office365.com
	(2603:10b6:803:20::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Thu, 31 Aug 2017 23:38:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 31 Aug 2017 23:38:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47986
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2L-0000CY-9l; Thu, 31 Aug 2017 16:38:13 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2L-0006uY-6Y; Thu, 31 Aug 2017 16:38:13 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7VNc2UG028347; Thu, 31 Aug 2017 16:38:02 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2A-0006sQ-8k; Thu, 31 Aug 2017 16:38:02 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2017 16:34:28 -0700
Message-ID: <f983776b936050963c229f981bd83c1d04c4896c.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23292.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(36386004)(2906002)(106466001)(33646002)(305945005)(50226002)(63266004)(8936002)(39060400002)(118296001)(5660300001)(81156014)(81166006)(478600001)(356003)(8676002)(48376002)(4326008)(6666003)(9786002)(2950100002)(47776003)(626005)(36756003)(5003940100001)(50466002)(77096006)(54906002)(76176999)(2201001)(50986999)(189998001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1136; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT009;
	1:bb5ttgKzE22Gcm9BiV3cD8pbqAiFCAi1GVVMWe+byA+zP1BdbNZ10SPbzUi5k+RQ8IG8UbN/i/pOfDLjZIy4oybiXfMRt+izDRGs6W7NcaRlwM/FUOqhxrpiKhfRaOvR
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fe83387-de9a-4d0e-81a8-08d4f0c9597d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR02MB1136; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1136;
	3:d9BjP74i3xFFuQQdNJ/cISmeAKbZOFxgV2yUPxKYI2dhL0lDEpTaWT3SpZUxUHEJ4W3DAloFj4/xPTlN1jfb4oH9fN4ocyZUBIxu69T6jU3aXm7YqzmY5jsc4uXg2F7FnNb2CEDaqutBynKEiBMBYRqh99ap4CZQOKjzshSV0JQZ/mr++2bJQK5TiVh0B9oHXH+4j2fD1jEMcHMFa056URDb/oXN+Vq7PrxZrVysJy62ewPMWhhPpwui1TDVSE7+x/9JCHpfp274oa96xau91bOoaYpHhn/r5hoMa53grqMsE4QI3/rHUApUOGnXgHkKnmZJ8C63KaBxotEJ0h1yta59oCCBjarZuDofTnvShMw=;
	25:PELEPV9HXWfxpnqqY+3Y9E/u38skPMgwiyHg+qsZlLgoZ5C7USqZNa9OIQWs2A7fBRaYPdtQ9+ASJF+ogSJ+doMOWHSnn10ODH3kkZ0rVUo+lbsozh3X29N2GuOLvRs3EdRwY3YiAkYO2UwGczAEj3P1zs0G6siCD/PwH8jRLJayHmm3BPD+ClMFgt54vWLWAzzdG1vHIiDtBgBtx4XxgWt5X6wLUTmvylX5WV/be5AfcWNskCLwBHyHKZfHc3iqadnnuNL3mgaWqTN4c+1pmZmXHgApQGwD62zFeGhyKRJhTGy1i2OxXw8Ljyd/LZDGiKe/Xj7yaCqf2NYZtdB91A==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1136:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1136;
	31:rbHz9jKrUmmHk2Fn6qcuQ8ayWWUBwCPeWdFhbcX3E+6BXXuAHi3l8f5+4sEippYyIlMXkdjLNJ7Sw6jnPj78zA8RGGhLlS3V6L16FLwks7Gq/LjYZW5kOgKou9ZjLgyYyAtGyP7fUrYfAc6R7skUQ91ANGvcQf+2kFxPh+mukBjXkWxFYNSHP/mavw8XC38OoYPobHxJ+27hSogtT+4Q3rBbRsRWbmn7wk5h2A8WVT0=;
	20:kyGv32Re0W71OO+04y3JtpIvA1leZoZjZEV+l67C1zSc06FZeHHAGsVm4dcYvEAVrq8w72lUOwuMpRnwmkitybiIfqwUle0C3qwLe33XOuLVbVRi1xcgrj//nSuuG2gWqnWrmDxQgyoYMtshA//JIMZCDS63Y3lsU3U3CtGXPyMtuPikaka3pn7JTIWzDiqVz74FrnKME1kmYK934/TfTSXUZtiOuDrm68fE1RVZMMZ+nhUqdZDOs6lva/+rXMMtMZVPMUVGLH5u+wJAMcKLIuhIm5ATRZ2wvn19zStycQUY8SQR5wdx8+j1kv79nXn8oudlKF+eFKLnAUHlhT/pw+hvkXrOxTZMLt5iRCH9jNVKfd7n00aAFe0ud5pm68wppLt+c3qP9EW3sv0FP+r+b0r9oJHfHeml4KEVZM+qoFH1gzFaYyvLbouJbtINNjxow4FZ2wYRhSTQT6YJeyyJcOCGf1/3TUKb6SCAG5Z8tLZ8GIN0ytYk9AJLmNLSEpvm
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR02MB1136A81293F67E7467F885CFDC9D0@CY1PR02MB1136.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1136; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1136; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1136;
	4:rp7hOAtiKWSssWEK3b9LebMTHZTXhimJnaPAdZaMhmLNtiJRy1/fGYizgSJErviZHxY64DfQO8hEIbp+Ba4PJHF1SrFgOOlgXsDC1JI89RLG6qgrqte1q+y2l98LJzh8zwrZOVVoDJ7n0/bdiOtphmYM/kvC2sSIUe1ULEX9Xcd2KN0TucNAJPYTWmyQAt/qci2pOOB26J9xbAPf0s6KdSfePykPXC1z7sQEQo35TIuhVZj/yoT/OjtRBCKWgFfoIG5xyP/u5hvAGOg4TB8q7dPG7nzuoc+3wecxlZa9Y9A=
X-Forefront-PRVS: 04163EF38A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1136;
	23:fcoIOsbGGkCVLwMoyVc7DbV9+3OHdVjcaocV+tmAz?=
	=?us-ascii?Q?kOTPoGjG4rENAMHvCa+Tu5rGagexAx7Om9ymTpxxfHMAbThwp9JcR0BEBu9Y?=
	=?us-ascii?Q?06soAzSORUyhHO+kFblrVR3jhKBpZNTn98z9hDEg+OeSdDIZmVlACqzKL2F+?=
	=?us-ascii?Q?HAFc6esCgUr0lBmg9BmsdUCwY+LO0cvZ+TF3evzAF3d6ms/TmbrXIA1HVmZe?=
	=?us-ascii?Q?AxRKwCD915yXGmlNETOU+UtHLcrIsfjNdyqg5zcQOISk1dIvurAh86/l90mx?=
	=?us-ascii?Q?JLLVGNlvj7KZcBb3v8tw1vWbtSb1XRr4p29KKCndoKchBq5R6sWFZBkCiqGS?=
	=?us-ascii?Q?ZnK+p7SBfYKlq3HPVRZN6TuYUdRm0I32hunQXbyUHr/pSH+9ObJP0ohyFAnz?=
	=?us-ascii?Q?Y3rYxVC1CdY1pJo7+uEa5huGIFe6BJqZBYBk04o0FKWl++IPNFVGrbzTP33M?=
	=?us-ascii?Q?I8zb1/LiHEGQa5B+EA5lyLcJ+44j3igzU49/X44gnpsfKLN34o/5wR1mXwY3?=
	=?us-ascii?Q?MxkZFpAV076KCRaO7GS4wvfk02eX4VA59sJKhJxtjPpQ7W2lBU16Q1WzEux2?=
	=?us-ascii?Q?NoIRWdYVh8mUTqsZh8sKM/i/nWXmuWgschEJGUu7SD+xHn08UCQrltn/wByb?=
	=?us-ascii?Q?9HdsCWsjqtxHYU1f8Xch2uBeUvp1YdQpYYIV4O3P80lEnVUBLm5GzsInopaN?=
	=?us-ascii?Q?Vo8YsTJCfppYYFmLllb9zHaeFlpuCetfRRPEbO+soAu8NL+zHXh8MqdLvc5J?=
	=?us-ascii?Q?we9lYHLQjDLep5efkQopiQMxqqok7wKCpBg+hTPl7TJKydt/ewNjqhAsth5t?=
	=?us-ascii?Q?daTRvEuvyBJgkkCKdmjmzak3VAeg3z7I94cKMmH+IKx6FNTrPyP7u4G08BYy?=
	=?us-ascii?Q?XrcwI34BMxBaw+fi4GQS+s4B+PNysT4MCXNLTieBuOKjxlwwrMBZ3iborglP?=
	=?us-ascii?Q?pVpE8E+p31sTRDzDrQUqSv84KkzrRCuINeowqzkjp5Kkte4JcWXADF/YgsqL?=
	=?us-ascii?Q?8Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1136;
	6:MmheTlUoLSHRFWg4fARws4Cd8gZNZgGVaekQE5/ooiOmzredV1RqyqxSuMB3oaZt6THlR2S6BTv+VV5a3LzaRJyfkk24vcFoy834vWjK9Xc20c7HqEqxzJouH2fgrDmPWoRp7yZDdrcLWQKTH33Oes+NemfLgysA9yR3w6OBlNoKlF3hv7eKaDSp6TmwGsaJNyKvutwLIew5n47JrnIeSkcEclJGP5K7W5uh/tBW6N3aM7Hzr3EIUSUvwB1a/8Qb+laVAmYVDx9dZgELY+dQrXYjL0gZyeyt5BcVS1qYlFybKWT64RcSwMR5W12CTS2PmVY2N/xvR3EsrynPh89uwg==;
	5:qjfS77sJgvMXsUSrM2pmyAROzzG/au0YraertWUteP+wiX2C4GGacyHtzgus329XyBMwejqTw7N4LMQXzabxwuhmz/oGiH5Myqiv9rYxDs/5eDL3PWLHVf7KpydTBBStNDZ9bEdtx1XTsz3I2LUx3w==;
	24:nfL8slvoDeDmnYZnhDg+En3LsW1KiTiHBzxv0CpbL1bFpJz1h7aV76eo97Yh6S2vVT57dODbwaLkd4M//vi3Luvie+g4WHMnsxg0dzNgbSU=;
	7:DpjDyOAXKLMDh3KeksJlwJOMej0h8/0cUiXpx5rcNHQm2kH1VMmQUB8pIggJnrzcb3qVNkEN9p/IxQC8evOC0kco2BP608D2REYIlWfD5txP3lcHzaWgD+iMivzrvmJsEO8ohab3hLf8gYELuqVHtSY9Z9GtLSCSLoqS9GpVvjGtAJ+e1YpnMob4r0ZMVDAiQ5xWyusRtR7waqGlZQWOH6HxuRsIw3q4cRhNhoxlpPA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2017 23:38:14.4228 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1136
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.43
Subject: [Qemu-arm] [PATCH v2 5/5] xlnx-zcu102: Mark the EP108 machine as
 deprecated
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G9EYrCpAn1Te

The EP108 is the same as the ZCU102, mark it as deprecated as we don't
need two machines.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zcu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 40c1f5bbf6..d3694f67db 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -180,7 +180,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Xilinx ZynqMP EP108 board";
+    mc->desc = "Xilinx ZynqMP EP108 board (Deprecated, please use xlnx-zcu102)";
     mc->init = xlnx_ep108_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
-- 
2.11.0

