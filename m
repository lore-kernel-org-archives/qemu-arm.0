Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp182689wrw;
        Fri, 16 Nov 2018 02:05:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5fCYKd1ZHlrYjWG6BjLUNd1wXAvcGkWyP6zblHYFY8pcTLWVYub9UNEz63G2jmcuOyZVDov
X-Received: by 2002:aed:3c0c:: with SMTP id t12mr9734266qte.226.1542362710953;
        Fri, 16 Nov 2018 02:05:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542362710; cv=none;
        d=google.com; s=arc-20160816;
        b=jGANeXHYvsrVcXrqxh5vfcJ21nlEYi5+JEYFcrkpMSQlUoUGHPe8ylMbGRBZz91uoY
         htCbndRTGKbujDrRQoCLGSSdcg70SuP+uVdUCo6Vg72F5WXjuSbO7F7KpgmsbkpgXeN6
         gzSXUGu+rdJhOUX+H4VUJCqRdykvhyjwJVK5GLjXM2v10C7AMhR6hVKLfJP2LN5WIYjv
         nB9z29YCNfYpW42/HMBisKIoiZRpeinOOOHVaex3TGE8SCrhgoL7TbDxAKMTsE/QoFgU
         5Z773YsB5TeliTnJi6ndjEwkew39kmzoYjtHX1rVhkhrz742UfqcCxw9iBEaBdG0SEex
         ZY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=JF52hh9VuTA1ItHkKPFaKPE5YKRTLjWb/diyzJQDYtY=;
        b=xyqZ2gy00WRgV7KK31t8zqISPo5Jk0LvA4tuDOewOPWpDAWz4ehhyKEtMTYfeXTGa+
         o9F5igKJ+Uwsu/RSPbGRqCUnFpMBJrWgascRGF/BfwOdeqpa/9IuGOCJN5qR7Ynvqc8E
         Ytldx/w9Fo9W6DR0ww5hi24w+vq3/y/w4oSJeo6fyCMoo3vdd3FdIMDWPqOVS3T6Gg8p
         82Hq5aCdw8At2Zmu10JurOvYy3n7bKdYHcLueYREY27agYorASfAJ7LW4lsiu9vY+eJD
         jtAvJo2dkXXcrSoR1TNv9+wq06Q79QF605s7Zy/1gkXeWsy/k+4bq9H1WrTeIfXd9NfJ
         674A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=1MLQ0o0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c41si5509992qtk.178.2018.11.16.02.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:05:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=1MLQ0o0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNazu-0002by-FW
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:05:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNazl-0002ab-Lk
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNazg-0000RU-Fg
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:05:01 -0500
Received: from mail-eopbgr680061.outbound.protection.outlook.com
	([40.107.68.61]:13653
	helo=NAM04-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNazg-0008US-6w; Fri, 16 Nov 2018 05:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LpdcKrYNoq5TA8cojIqOM3tUeyNJzpHMT0UBoAgFRrw=;
	b=1MLQ0o0NyEI+qt0/EXYz8Td7z3y+P0xd1CsPU5ChXZv71iOHrFvcce8EHWnofIxvqexraLl9ddNo6DJYSes6KPKZgOmxxduujHUSiEAzHjiQkt6Y0e2WO0pTGqStFRh11UjYS7an64mhuqBGIM7kUx8MZWymnwfWboiidOem8VM=
Received: from BN6PR02CA0093.namprd02.prod.outlook.com (2603:10b6:405:60::34)
	by MWHPR0201MB3514.namprd02.prod.outlook.com (2603:10b6:301:77::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.26;
	Fri, 16 Nov 2018 10:04:28 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by BN6PR02CA0093.outlook.office365.com
	(2603:10b6:405:60::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 10:04:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:04:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40219
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNazA-0002s0-Of; Fri, 16 Nov 2018 02:04:24 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNaz5-0004nA-L4; Fri, 16 Nov 2018 02:04:19 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGA496i020346; Fri, 16 Nov 2018 02:04:09 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNayu-0004lK-Mg; Fri, 16 Nov 2018 02:04:09 -0800
Date: Fri, 16 Nov 2018 11:04:07 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116100407.GQ7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-8-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-8-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(396003)(346002)(376002)(39850400004)(2980300002)(438002)(189003)(199004)(54094003)(77096007)(106466001)(186003)(26005)(478600001)(23756003)(8676002)(6916009)(58126008)(63266004)(316002)(106002)(76176011)(9686003)(81166006)(9786002)(50466002)(81156014)(54906003)(356004)(486006)(4326008)(2906002)(2870700001)(47776003)(8936002)(36386004)(1076002)(33716001)(5660300001)(11346002)(446003)(336012)(126002)(426003)(33656002)(229853002)(6246003)(476003)(305945005)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3514;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT021;
	1:3S/rFgowJCRdjXasdYC4RyPV3ogddSN5ObDu2Epf9BPJ9F87sikhQWMmfwvJsT8Plnyn9cl1bM/pfT5cgFLgxEcN/xByy8t3luxfMzGLjufruhhGBxJtIGaCEVwo7ayh
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35531cd2-f4a4-45b6-bf2a-08d64baae533
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3514; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3514;
	3:BtKcQSJhdEP1hPNOPXlAGWZEX8hbCNHZp4fe6Ocs9iWv950xoyq5U5lCYNJ6SakNJI8uHU89qd+T+APT3PFswnchmcpOWc2iuPHrkAuDww22FzyRrsXHkbqTH3jULlyzbJWF9m5s1UZPpPQz4Q34VkKC7QjRcQpFcEKu4XQ7AsJza2I9mIA/rYvO4M4DnYAotTxXrOt279KEevExC6zD3g0hsH1Z1j/fgfxKu+7le7zYgFSxcUGTawzKhFnn3MUmJLH2iUBbM+cN/KXRztPtZcv3jXeB5FlL3hq9L1Co4oVS07W0bZhaGtH/3LIOznazqvYi/GcNMFIARG35lRboWYp9SWA2OOOfcd6nKEPiWlQ=;
	25:FuZzVpg/dukmS+pis+4UPDzYnzf3GhQc7HZIR64+PrDNN43Rmao7hcHMPkZvIwECuz6MuVLAJifR04t2MalyMMT4L7UA51Vrz8EfKTPpdCBDg12PEDUzaiwDSIcFbyMYVhQ4tStX865uiWfdPJx4bi7FeGVYJH4XnX+Qi1fS2Zi5zO/fQdUwiMNmrgQP1EN5rFVk2qcg/uksRMzTLCwEstFqWxfy4kvVWSbKnzWkHzgDNFKNA68nGFXRqfgRtchOUYP6jBDzFwHGfWjovQyObkiElUTv9gEx4CzPBDJSh0JoCKjxp+SiaqYqKxZI3L5ZTi1XGf15x4G+j2Z6eeLuJw==
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3514:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3514;
	31:5zOehDT7iwUW2xMaaWv8DLOoxTt810+HYJJ5+IRIiMGsj5mr6PPGVxmbW5ag5XsYf0mOWBkrd8eQcjRIPLbIYmlmP6TCNDPjuIfAcBkAB68z+PU3Y0Oyf6VzwQGaxctmAqG/VAOtx/3XLTUloTkBorsenEj/oAEzjHJqbUgkoJRispd7RRkGZ/5yOQI7v58ccTRGvUB2hh54Do+DsnoG3KLnolekU9ILDZ5t02QFOFU=;
	20:V8g6O2XwT5ae1ctEqVmCp0JoaQkksiNXxmrBhyu+hJdrhoa+4DUtrFey/dVCF45RjcrUb7XyjBhoW8KL7NDJRjaijFtjR35Ozm2V9qHjQvfIR431ZJFjGVwwAxB/PMa70UqfFdO1zHSkKGg3SsEJiA4cUQALL8md+FlOB6/d/1Ld/gODPDUxdhFXyI1YRMyLeav7+cW4uWDHU/0Ax3SE8oMmCYKANDS9mHt+6My9SzQFVgF+mSrH6AfGoFtDxXqfZfY5PDvREou3sI1K9A0dNj1a1/f8WIZoynoV/hP8EEeZ9d0R2l/7AXrs/K24jq/QYUbP1HRokIMROx8RBSTvi8rOigghJiHEeETVnCDYJ7pVvRCT4Gj6g4Xc+CH7Cmy+szMcS0SR5iDl7lqUPPDvd4JlyjFfb01eHQ6MOCI6d3OH+Oq4TJwSye6LvdoFe8ZBv5gj/qOXA6ObtWjRBLqGE7Nig6PvciDQc6ZNH1iSbAb9WCUhJTCFyw0Byfori2t1
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3514031830F47D0CC9226604ABDD0@MWHPR0201MB3514.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(3231415)(944501410)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR0201MB3514; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0201MB3514; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3514;
	4:JQlQckYp4HU1vKcyubs8qqQqOxO9Qv6fgscemLbz2TBMi1IoZ1EoU94NJ++GC1hbADq6FZMp9/UvSv2tVLQukTZbTW2rCk6RqwasRNl6JS8+KWHq7+vG7ewJZR1mvZzIgXEntqLMMI3+J+wdlI/uRVnjr2fb9QJunL84+3TbnL/bR0D9Y8yYGzLEu2Eu2ZIXHfAYNqH/K18gdMRWyHMwT1QWlhEs3oFvYd8oX0RmwprL9bYSq4wtKqGIXqjX64JXNvn/UxcDwzEd13AyC9jUtg==
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0201MB3514;
	23:kYAmFApcOJHiJRHeejaqsci3hxFKkolmC3voeca?=
	=?us-ascii?Q?JL7WbDbCGhPwZW6FYhdo38ul1m/1QkUB0QgXTOKBz5AaaKYy0Vos3LxHQd6G?=
	=?us-ascii?Q?o037aMs0SBpEzEM144V/C37mvKIBw1Ci63OBYXKPBHnAM+vjDk7iC1yv3jGE?=
	=?us-ascii?Q?FbNBNsfWtKvzSrE4MRFPoopS0bGywW4HK5F6howvJ94tOvO5YZo06Xj0TBeG?=
	=?us-ascii?Q?i88PbfS6c0zxvlbY44qjp2zknu2xmgnKt5Fjm4hYVhoDLcyGKWJrN+E4TXug?=
	=?us-ascii?Q?8RGFAyTVXM4nN0eCVlD21OeuHimU8q7g4YGNfcZlYJx7WLCxJ4hBBgfgri6f?=
	=?us-ascii?Q?pYGZ/cki0btB6LuqitlNDZNR66N9AqhOVkrk15IzDpwzzff+CVzJ0PpJvqPp?=
	=?us-ascii?Q?Zjakaa2WbP11b7bf1vfTxYSpiWGKb5XthikwkYnM+UGu7ZOGxuHb+sOqJ26g?=
	=?us-ascii?Q?LJROLzEinS8iTqKDTbPqMNHqGZT8UEbsJb6x2MHBqHEn16aU7jvYB7KhTbkf?=
	=?us-ascii?Q?fnY/qsERveHQvRkzBWSDwvRIZBZ3O5bnf9jfO/7niwN+qIAcHoJPnEkTYFES?=
	=?us-ascii?Q?cQ9U1JbIUJf1zywSQ0LTX8/rUXXiGvIHOsPmbMLo0r6zXQ5x+W7A5pJ0NgBd?=
	=?us-ascii?Q?dvcz03vzXPw8/O5q1rdLJCPr/mYv5H4n70Us569Z4USsDIi261Bh9GM4SlgD?=
	=?us-ascii?Q?cFVRjp5VSxJp93LqTbCqGAMo7SAww4AO274OkEzWvPzUQB+dkWrMrAJVKIBn?=
	=?us-ascii?Q?xwTg59VsZKk9X+ZG94Bg3jQDAl2oMuiztztoaH/PiGz+VbyYINZ6p/ObVVWZ?=
	=?us-ascii?Q?A6mbaiGCm3NAS/iUOxNkMKt6pW5xD76i35Zz8aCuZDWVI9a48almcngvTbMX?=
	=?us-ascii?Q?TZDwpCmQogt0VZcNbNKZ+DFU7bf41B98wgdsZrMx6x0HjwvLGgucDpeC6b8y?=
	=?us-ascii?Q?6tys2b9m/B2HvuWu4vULpugGuKcmdK+rTXua0RRSDSw1oZFmw1uY17+p2fUK?=
	=?us-ascii?Q?WEJQAHAOfvmGwTTBAWwErw2Czak2hJur0ctOafbXO9VgUtxUtCAZx5kJfhok?=
	=?us-ascii?Q?8mYXQ0jJS5Mt/B48uq0kzxHsJ/pOoz9b40R5fEtOezYScpCb3cGAz3k8eS2p?=
	=?us-ascii?Q?9+yn8ciy9s/VbCNm6jcq8CK6Gs8mkWUdRUmWUxnlihaTT3UyapHHHy+VhMXd?=
	=?us-ascii?Q?Itu3X4TMrqUxMj1Uxw2B+hN6UEF3pux0L8x0d?=
X-Microsoft-Antispam-Message-Info: hOcjZap1XgLio9AXpIffROy0vLl1sDTKTmxnofXPBe1hUaB0xaBjnVafWrlmpeZUNLfxyMtVom3MBQT37/v72NdUjdNbvCUBeeLZB9i3zV6zHYWte0pigfAZFA7o4ikaAhGlGjAC2oAcfdvoUJv3q9k5Nrjmgu8ZcuQFQdZ6RdamHy4LKNp1PGk//iw8FFZhyWNSw9gCz9LNInu6ric06cxeLI4s6gP6mG5UqKvVygrlnt3wCS9pWBhdnCjaC3MW8aTm4mrN5T6QIRVC5Fmv3CiY/tTTttFlJRmS1AkbiWrbPnSFry7SdaukAsLkpUFGsEu0ZguG10hda8L8B0DitSVefwlvyCAHEYmzsGJ6jhY=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3514;
	6:UUEl/JgkIHLKykKB0SxWG3dj4V6vRMZeveT3DO9Mzk5bDxN9HwX819364mIGGDw6f7OyZzolxtQjxzi78DfCJu55Kp6wj93TgBIRl6aMkxNdzf+r1PNrnz5xcBQX85jz+Ba0GG5f01pd0ZIVCwRoIUYfb2f/E5S0nPz9y6EZeCjXCzx2eAbtjuFUcWxULx5LO+EO0SGYYZfjpQYYhBORCcUShfopnYFWq4vrJ+dD/20t1blFomJN+L4NkKBO0rSw0bqoN6XV6c39eMC9SOML5hmGSOTr5I0/S5yWnStL4a4qBDMoRNajojpV4tiBj2ryjReFJT9HGhpW2XO4i5EeV6PrO5NTS0zqOBuEvGRuONkvCGLvT11ddPlfl9wJcw25OLwxcx2CYG6GuyeV22BZEhIuHAXLofEq5R+aG9q5oOZv3MnOMSk4Mn/VvV7neb3YJwseN1M9jjTql0MjHggfzg==;
	5:j9NqXd/jHway7Zdb6rsQ22IYMO4qeYt3xMlZuXAKMMdCvK9pHCnWwmlMHt5SEO1iSlsub7P1a+9xSOw6iQ3lYY6MIhLHC0oCJQDZVw5rhV/0p7RNyFJ9MTtIPNYjfC7+Iz1q4tDsWXsgqcSPoeqCTHZEXIw+8zjI/ZbICkwSnQY=;
	7:6Y5eeuWE7Cg25QBsw1lIK1nfqp4Y9g4Or/qM7dLHqE60Ed7uzq+jNVVoSb4x/WSUZ8RkK4HvGRopArHHwQSiMSVtUpX2lV8QW6/dsUsf+UfnDKRh7/ellwf8XBFLXEhHSOohWIforsM0lKyKr2i7iQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:04:27.5932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35531cd2-f4a4-45b6-bf2a-08d64baae533
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3514
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.68.61
Subject: Re: [Qemu-arm] [PATCH v6 07/16] gdbstub: add multiprocess support
 to (f|s)ThreadInfo and ThreadExtraInfo
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
X-TUID: qAvK9+T4km/V

On Thu, Nov 15, 2018 at 10:41:58AM +0100, Luc Michel wrote:
> Change the thread info related packets handling to support multiprocess
> extension.
>=20
> Add the CPUs class name in the extra info to help differentiate
> them in multiprocess mode.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  gdbstub.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index d19b0137e8..292dee8914 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1260,11 +1260,10 @@ out:
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
>      CPUClass *cc;
>      const char *p;
> -    uint32_t thread;
>      uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>      char thread_id[16];
> @@ -1556,30 +1555,46 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>              snprintf(buf, sizeof(buf), "QC%s",
>                       gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
>              put_packet(s, buf);
>              break;
>          } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
> -            s->query_cpu =3D first_cpu;
> +            s->query_cpu =3D gdb_first_cpu(s);
>              goto report_cpuinfo;
>          } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
>          report_cpuinfo:
>              if (s->query_cpu) {
> -                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->query=
_cpu));
> +                snprintf(buf, sizeof(buf), "m%s",
> +                         gdb_fmt_thread_id(s, s->query_cpu,
> +                                       thread_id, sizeof(thread_id)));
>                  put_packet(s, buf);
> -                s->query_cpu =3D CPU_NEXT(s->query_cpu);
> +                s->query_cpu =3D gdb_next_cpu(s, s->query_cpu);
>              } else
>                  put_packet(s, "l");
>              break;
>          } else if (strncmp(p,"ThreadExtraInfo,", 16) =3D=3D 0) {
> -            thread =3D strtoull(p+16, (char **)&p, 16);
> -            cpu =3D find_cpu(thread);
> +            if (read_thread_id(p + 16, &p, &pid, &tid) =3D=3D GDB_READ_T=
HREAD_ERR) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +            cpu =3D gdb_get_cpu(s, pid, tid);
>              if (cpu !=3D NULL) {
>                  cpu_synchronize_state(cpu);
> -                /* memtohex() doubles the required space */
> -                len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> -                               "CPU#%d [%s]", cpu->cpu_index,
> -                               cpu->halted ? "halted " : "running");
> +
> +                if (s->multiprocess && (s->process_num > 1)) {
> +                    /* Print the CPU model in multiprocess mode */
> +                    ObjectClass *oc =3D object_get_class(OBJECT(cpu));
> +                    const char *cpu_model =3D object_class_get_name(oc);
> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "CPU#%d %s [%s]", cpu->cpu_index,
> +                                   cpu_model,
> +                                   cpu->halted ? "halted " : "running");



I wonder if we could also print a friendly name here deducted from QOM?
In some of our use-cases we have an array of MicroBlazes that all live
in different HW subsystems and are named differently (e.g CSU, PMU, PMC,
PSM etc).

Instead of just seeing a list of MicroBlaze cores it may be more useful
to see the actual core name of some sort, e.g:

Instead of:
CPU#0 MicroBlaze [running]
CPU#1 MicroBlaze [running]
CPU#2 MicroBlaze [running]
CPU#3 MicroBlaze [running]

Perhaps something like:
CPU#0 MicroBlaze PMU [running]
CPU#1 MicroBlaze PMC-PPU0 [running]
CPU#2 MicroBlaze PMC-PPU1 [running]
CPU#3 MicroBlaze PSM [running]

Any thoughts on that?

Thanks,
Edgar

> +                } else {
> +                    /* memtohex() doubles the required space */
> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "CPU#%d [%s]", cpu->cpu_index,
> +                                   cpu->halted ? "halted " : "running");
> +                }
>                  trace_gdbstub_op_extra_info((char *)mem_buf);
>                  memtohex(buf, mem_buf, len);
>                  put_packet(s, buf);
>              }
>              break;
> --=20
> 2.19.1
>=20
