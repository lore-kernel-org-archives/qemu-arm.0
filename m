Received: by 10.223.172.38 with SMTP id v35csp416543wrc;
        Thu, 7 Sep 2017 09:06:43 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb49RcP1tiRp2fk/Fd16uXzRqpj2vfh0el7gj875NCHWoO5dBRGWjvoZfGzX5YNL5SGC4voW
X-Received: by 10.176.21.129 with SMTP id i1mr1976243uae.142.1504800403201;
        Thu, 07 Sep 2017 09:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504800403; cv=none;
        d=google.com; s=arc-20160816;
        b=kEYzyKa/bHGNjhLsuRgVmIDRiJdMmM8UMn3ELHU3/BMSwjtzPeHzT94gIp2qmb6Ca7
         AdeGCrcTMjAl9E+HiyBp2IqNFRAYmrE+Nc5gtqPTTQCUmQjMjmG521XRzs+uFuwAtx4S
         eXxXKqEP+pb3KBYcK/86fb7YzzAymfagbInc4CM2+Fx+YeRhOYpnqEx7tv0x/0HBfULC
         cn9yT+re0cs86mZCzRTHS6F7NZKxhIJTLqtREWNXql/1/1hfJq4kVK57TdTqOIkXQkfe
         +k9xL16o+7+EWcoMuRkdY/wzSaQyUnOmC/2MoudxABuuECeYO15H5sGMeSsr9Un5fq8E
         h73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=n8NelC3thRcu1yuOVnppxDwLKqXKGykAN/mNLA0joFE=;
        b=zYjLTuT0DLMMXKoIZfU47PTOxbdQodl0L5tnH3BbBjZ7esvPssOt1b5xqIW2lLKm6v
         Fl0rPit+mnhe4h7apCN5CmO5eDKVxSTAKXgIVtyxCdOZolxAIoYXdvWZ88HK19r9QQsE
         /lqa/ZfyYEAgkOmNuBPlfOv5oVdM48ttIUEGAcANF6xkfR1J5Hei31anw9UtqJy2/4HV
         ZeNJ3hMyqmOH5MSwO+mJke5ohopffAV60an34arRfPEacGT9zA0hSce4/wKgBI7HpdjG
         RulyoYB/HHLeJFfoATBHAfVY313L9Xmb0ogTU8ZDcr2QW9BI9dc4ZVnxJ3kGvMoXuLe6
         aHjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=zqrckyTB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f64si14789vke.156.2017.09.07.09.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=zqrckyTB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzKC-0008FG-OR
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:06:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dpzEs-00048f-V2
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 12:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dpzEo-0003gI-6o
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 12:01:11 -0400
Received: from mail-by2nam01on0071.outbound.protection.outlook.com
	([104.47.34.71]:55360
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dpzEn-0003fW-TQ; Thu, 07 Sep 2017 12:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=n8NelC3thRcu1yuOVnppxDwLKqXKGykAN/mNLA0joFE=;
	b=zqrckyTB2gYXUzJZFpqvG5yMsdHYyorlGyf71Fhdvk+zRV2CNF43q8fkB5WARZFUJLvG2uhLqYTi07fDlITr+USniCRfUZ2xYhDEekAw+1d2W2S/V67zt6AIvHCc7e/cOEqh1dlEr9zIoftTFJKUop/51t3AodEIifKYjHQkb+I=
Received: from BY2PR02CA0114.namprd02.prod.outlook.com (10.163.44.168) by
	CY1PR0201MB1932.namprd02.prod.outlook.com (10.163.56.30) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.35.12; Thu, 7 Sep 2017 16:01:03 +0000
Received: from SN1NAM02FT051.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BY2PR02CA0114.outlook.office365.com
	(2a01:111:e400:5261::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.35.12 via
	Frontend Transport; Thu, 7 Sep 2017 16:01:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT051.mail.protection.outlook.com (10.152.73.103) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.13.11
	via Frontend Transport; Thu, 7 Sep 2017 16:00:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEb-0007OY-J9; Thu, 07 Sep 2017 09:00:54 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEb-0002n9-GC; Thu, 07 Sep 2017 09:00:53 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzER-0002gv-0S; Thu, 07 Sep 2017 09:00:43 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 08:57:07 -0700
Message-ID: <f983776b936050963c229f981bd83c1d04c4896c.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23310.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(106466001)(8676002)(626005)(8936002)(81156014)(39060400002)(33646002)(5660300001)(77096006)(54906002)(81166006)(189998001)(5003940100001)(47776003)(2201001)(36756003)(478600001)(118296001)(2906002)(356003)(63266004)(4326008)(50466002)(2950100002)(48376002)(50226002)(36386004)(6666003)(9786002)(305945005)(76176999)(50986999)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1932;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT051;
	1:lJ+WaYIYLv4f0aXcsIJdBagsg4L2XiyWcyffMDHW/8qZyj02smKObLzRqlNGV6ZNpSX7IovaI95XlMl/XpuYnsVV4RP8TIKGi+cWS4b/vQlFmVnAEzxQ6e4Gp3LmV20L
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62c954ce-f1e5-49bb-19e0-08d4f609a309
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR0201MB1932; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	3:C8UyO4FkPb3GxjA7OYHtT14wz+lItxaii7XUjGu77GrLfhguFUIDOTFVeHMH6UzXo0MTjLFzpUAeK+j3n8Dbjccm8XMJWXnvQQJupnCzPPnbdzZpjoFXb2OdAiluACqyMgjQl1eQzWhF8aXqLy0jfLpq4u9x6XSiIR8zcLFoxUKbr58vzrTYla5XQv2EfqUtGpJdF/tk8Bid3cvoNesG10gnjOG3tEeDJhFOLl4nRLii9tL/UbZKyyLaxC2QfYSAcZ4XEbp8hRg1bHSWwIknSv1Ul/zSI6Mlrrz1afWXTQIG/eO03SxZDI5nYfJpuzh1odWpldB6fltZzCq5nOCpqQATOQA1KcHAzbIFCuYNQDE=;
	25:AreUYpOtX0XXhHQQ02yXwYXeaze/HoZefgoE0FTUmOB0rEYONeQ34uf60/htxQHHzkorSBZy8Uyx7ABsNIIhqgHdTyE5WQIHxsBZtS9p/0gsiNAFi43N9jI5n/yxJ9ExjNu2o0v1BFd6v2qaPjcXjT3V4M9hmTvjT/BRGy+X7Ry0SDjEDzeAI58WKQ43gH1huxGXiNXe9KUVwJrZQDt2XTVvvuQAEYl8uaffiQuVWXWduuoussLOw1Io8wAGHEGijek1j9K671TmpfKxqkQVQMsBWndIT2VKYDnKFx+sH+53ZzolJJoKulf5TrsAV7utswNUbBHFqJxQ/3uHVYoasQ==
X-MS-TrafficTypeDiagnostic: CY1PR0201MB1932:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	31:8fRnw8U1M9u6qFdQ+EVNGaLDSIbq3M37I2S4kBgF6zz4vEPYL+J54L9oMDzOJp9rIOlM0LD/qLkr4ETwWXn9SMJGHRbyZY6sSIRkEgBhk05pcuxBzRDJG9nK//y0B5X2jpY3CkkRAXgKeB8Ja+g33xLRVhjCiU0aCQdCmN7H8iWJSPu2RBnXcC8SlFvLeQAe3iyyPQjWEteQ+GFZAa5QSnw8XZMbsVzmNmtMp5JpZCg=;
	20:rQ4LKdtUh4AVAIFquCBT5DO5MPZW90ArxOBWIuAc8ltlytycXLrQfwczZEDCLk1P3JNvEvqdGWlOCiiHwO1tEilwgpftHYMXCXlLnb2JFbpw4t7bfsWp+fFqktAT5KP0+TiwklkGgqJbsZIZsOuMpXk70RzeYUDh62J88h2YU/Fb3e4H1FarFH0jxldSQmu9ug1qN6T6er3seyyH0FRqR2xrGEnzGJEkAmQ1b+vPMJ4kN1A1sp0C1IjJyHs1mbSD8GepDDsOgbPwwDEA8NTafuBaiQQ5ZYExXybxjOXW0n8j+T3noK2Rk8uEEpoJD0Eu3bMTQlW8U3Nk7wIGHEGfvD/hltowhFZQ74MzcelLUeYach8rtNsTLrI9xW8s8AjPDBVQoVQqTm8RhA3dh2XNcksfz/JelX0nLnkfAVXZYSNYMglHTPq+ldauJiG+ZtMVYrl8fm8T4U4kNEn9S1UmFo7fOMcLvLOOuNznPIcqBBQAY2PpbNcE/oaha7Vvn1aX
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR0201MB1932AAF94BEC1ACE46D2F3BCDC940@CY1PR0201MB1932.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0201MB1932; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0201MB1932; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	4:69MYDR/V6Y0cZn2O8kT9pyxCve255CSIrqjfXq4HGexbV9gWhxfwEtJyMSL3e0eMypXBaYeo+ljc29DBjfJaMeizARVAm2IEpZepN4HJbSPjx+zRa0YYiDlSicYusHLJ7muoQZgTFVh900Inw5qgDCqUmBiMos1i4+Gpas2SxwGjzVqt9iDXtTpp+cUbOmkxz3ZKaJ1+j/ihHxcXQwN3dakWJ8Db2O0kl0Ghaw3fgx1RWEyJmAhp5zZ+YTPCBpfx6to1okZ6s3flk/j9DonnXGiI435g3gqeKLGivKqak1k=
X-Forefront-PRVS: 04238CD941
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1932;
	23:ErtCfCRvD55QVSBbbVe4/RDhS4N8f9ajk76vgGS?=
	=?us-ascii?Q?1Qy1DPICcbQAvQIMp2H58z8uVAbUwQVfbUSKF0mCH4n4rxrKOHKaFY7z6WY5?=
	=?us-ascii?Q?tp/L5sTufNuWFdSwTCVX1pj485lWO9gkSSGtvqQNseSNKRvBr3pSpZfGrJpB?=
	=?us-ascii?Q?JNaKsRPJJNCp4k3Swkh//IlwZgz70qNssJGwS2vH/1eCbVt9D8ikAlHNnhUn?=
	=?us-ascii?Q?FKj9llZrYQOYe/huZBkV41JYM0pkwQJYTP+E0Bx/h23A78SBeoQFuoK4t+6e?=
	=?us-ascii?Q?akQmaZMc49eE7lnUTe82layOvvEKI+3nVsuf65lcmHNLn47cC7UeO2M75fig?=
	=?us-ascii?Q?91vx5gDmILZmxQ3WFyfhjJj2NyjUpUmRqOtwT3UOY1TZYdQ7YbC334i0LHPb?=
	=?us-ascii?Q?9318AYZ8WG7B4k7p2kY97kjC36OHkgdb6hhV3kQP2CDs+WvVzcI/p9R4an9Z?=
	=?us-ascii?Q?dB9CBsov5qL+/6YFEv+7nOepQcxKJMAeSuNfARDuc0NEbs7aSpySuy6IF6nl?=
	=?us-ascii?Q?rBQwcW/JnSmUDyxbwKWBe12Ei6CKBsI/yQT7gnvE3tP4B3Km5N1TOmtZxDcX?=
	=?us-ascii?Q?WXpdCTuvGwqP4QhD7XXK0B0DR5L7wcI06m8milzLUCcdMKYoObaS3hWDxDAN?=
	=?us-ascii?Q?Kl6GUq8mJanzjrLfZmQC6fJ7iHGzoQEh3jFqxaxBl0DC5aNcROcMp0s4irrm?=
	=?us-ascii?Q?io8HpTx3SOTYtYFneqiUGgYQ4F9WH1mwofL2GEcLUzXw62UonbL/LvIsXZ1S?=
	=?us-ascii?Q?eOVe0haO7zFh7TvQM34T3pM6RZk3Mq8VI7yQqJfxwhaupSET+uFh57HmB9Kg?=
	=?us-ascii?Q?e/ZC0aEGJUH/6KDxU+EKTZGdPdSpwn4I04/UYWxAGO8gE6QfCHlq33Ep4VRH?=
	=?us-ascii?Q?q6n4YhVZSQlNcbpGvA944JkHAynePVWKdx4RurSTDtaEhFuYqPKOxkBNpgIr?=
	=?us-ascii?Q?tiqsP2PCCOWdCzm62H0svWT3z55UNioKkLWrt0YST7Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	6:uBjgQ+GO2OcQHaHp1Kon1J1i/XM3oIJ9m8AdFEbtPsmqMADLJ+QYYRrcNzfjFjWWepd+st/+F1vCkQu+hbVz2bPMIbnViHsqs96GhaK11/q192e0pspadaAueU72EFcAumGmpD6by40dinghB/yJYBMjFnkXBNjTfK2a9Umf87ooCH1WNgAOrNdhd6o9k8mcCqf5Kl6ahVjSTT51COod8eJAhQ63uE0ZcYXcWK/Up5POabIGYdYW/AeZ2UD/tg2dvWqiine5oYHBPQT2HOb0HvQyqXyfPxXjkW75bARi02/oSjATKy+jUDVfZuF8TspsRHqVqm0sXOzgSNYo0tU1xg==;
	5:I7k4PxivZ6GDn5pOvQhSVwy2ol/UJb5XfEVJNTtlUKpm3aWWQtfuQU7cSMCJ2iP8CUVSUGcCqqLyNhzcoaRpxmfcsOqYzCnhP3Ti/V7/g8OWh46/fzy+1VWJ8WKa6ALgaRVO6luS2Xv+TyfVGyiINw==;
	24:CeZX+Y6EOKPj8UBjF/myGeXpKsszDui+3zcw+uVByb7mAYkFtb02s8xJporMR4bigKURT8ZPQnSkAuoBOt1J/LIgCxz9t470TCj9hCsLVwc=;
	7:ILSS2YyPrMFrASvNYM5kFpUNKwQT3f3BfDDmrIoCFflCPgsWYt+Q3fSJ8PK9LrcovA0dDeiFomZxnqoyCLmyykKGg1VnXPWt81lYuzsCWQVkwxyCwZxl7Z7YapAMiulNyJzcihVhXRjt/wkKnSMqVewLihgdLh7j38CyHjh/nmEcXKHExJtPCTyC7p5ZUSTx2t9HsnZn6OW7GAZ6H+ynF6XS7LrCb36Cs4yg5laqqXQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2017 16:00:58.0409 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1932
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.71
Subject: [Qemu-devel] [PATCH Resend v2 5/5] xlnx-zcu102: Mark the EP108
 machine as deprecated
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Qy3DBUQryQD
Message-ID: <20170907155707.4lT-xicdTDCMKPZTkPKoiLaWCLc_i0h2b6R2U9TOeJQ@z>

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

