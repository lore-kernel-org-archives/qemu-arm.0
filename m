Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3851202wrt;
        Mon, 8 Oct 2018 12:54:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61nxqqi8hR9u4RtO+k92RoJcOltOmPEd5G/AdWdZYhtxIQ2Wxx4dof5r0ow4hdUu9Msdqnd
X-Received: by 2002:ac8:4519:: with SMTP id q25-v6mr19572795qtn.1.1539028489433;
        Mon, 08 Oct 2018 12:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539028489; cv=none;
        d=google.com; s=arc-20160816;
        b=dlCWt1d2T4B6lxj6RKZ9G2o6MQ+R7w5PxshHkRBseHhAZ/9Zbf28xk8065hZQPHwuV
         El8BzCb35yh+TlCXL+g8yYRrF/ptpmPr3PtHjKgyzwhYGgmcqOrBubrSi4lYpYl/25GE
         lmRVpnjL4c8nP8nn40l9jj6r8MVfrS2d5xkvAFmV78VQkK8RJprRa6xRt8ODClxe1We7
         qey5KdLJgwKzjdI0xdJyuOx9ORymPlAL0S5w0CKYmg1d6jBlT2HZmkqXqDdhFsGkPCbD
         XbtfipbtWzst/GK8NAQuxIYBgtKFR0DWGT2hn1YjwKN9+wDkrC18IvTb6yupdJ13y7eC
         EZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=pDrylU6wKdUQVHGtc8aRTFRX9OJCfVzL9CI9Wvw/zLM=;
        b=EcpWxVKllDjrqDG8CYs1bTUJJRTUqeBq3vjNjZf5zzO0z3+58WRqSROxa2H/vm3KA5
         FRdAYa9yoSQsmw8hFNj1dkoKEK1aMNUJfJKv5YilyDBFoUpEtokot7fiVVl7eX8gFjCL
         L/eYYuyoG9CLhwvEJyu2XTH/OHsSOSheAv8ci3SZqE1T6S3I9C+tS5mAvaQ3qlEWXWWT
         Mcv4EWMZP9ljPe21JnRzh/6D7fGB5Rgx/mBOPbRxxsIwW7dvEZZX0OdTU1Aajm3NKynn
         ckdB629F/CXohg4s/srgNr4lAZRMl1PCehHYA91G/JrKoepRTEINQNLmwtKmOu2SILPx
         PJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="lkSiW/k+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78-v6si2671576qke.136.2018.10.08.12.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 12:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="lkSiW/k+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9bc8-0001FB-W5
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 15:54:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9bbu-0001DW-L4
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 15:54:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9bbr-00018S-9c
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 15:54:34 -0400
Received: from mail-by2nam03on0047.outbound.protection.outlook.com
	([104.47.42.47]:56114
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9bbp-00015N-Ko; Mon, 08 Oct 2018 15:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pDrylU6wKdUQVHGtc8aRTFRX9OJCfVzL9CI9Wvw/zLM=;
	b=lkSiW/k+fkBJvIi0/81vqt7Kbf3ecgqMWiwOGoid0+9unhO2XzepkyQHH2Kzb5mQxL3qzwKJP8/1UdsbM1TFxDAaE81TspLTIh8DFJ7fbGDenYGMJAd7TrSd/oc5TC6sdHkLaVjTjT40jhJw0ub1Ac4xhVQCdKM8/E9jOMr5te8=
Received: from CY4PR02CA0032.namprd02.prod.outlook.com (2603:10b6:903:117::18)
	by CO1PR02MB096.namprd02.prod.outlook.com (2a01:111:e400:101a::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1185.25;
	Mon, 8 Oct 2018 19:54:21 +0000
Received: from BL2NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by CY4PR02CA0032.outlook.office365.com
	(2603:10b6:903:117::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1207.18 via
	Frontend Transport; Mon, 8 Oct 2018 19:54:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT023.mail.protection.outlook.com (10.152.77.72) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Mon, 8 Oct 2018 19:54:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bbc-0006hv-Gm; Mon, 08 Oct 2018 12:54:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bbX-00035M-Dg; Mon, 08 Oct 2018 12:54:11 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w98Js3WV012704; Mon, 8 Oct 2018 12:54:03 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bbP-00033c-86; Mon, 08 Oct 2018 12:54:03 -0700
Date: Mon, 8 Oct 2018 21:54:02 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181008195402.GA4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA-tC0wHgkh+CA2s+G015kvdd47h-R+VCbjCRRZVTsUghA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-tC0wHgkh+CA2s+G015kvdd47h-R+VCbjCRRZVTsUghA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(438002)(199004)(189003)(39060400002)(107886003)(6246003)(478600001)(76176011)(77096007)(26005)(106002)(4326008)(336012)(356003)(186003)(316002)(47776003)(58126008)(16586007)(54906003)(8676002)(53546011)(50466002)(6916009)(46406003)(5660300001)(8936002)(81156014)(81166006)(305945005)(33656002)(229853002)(97756001)(23726003)(9686003)(426003)(1076002)(33716001)(486006)(476003)(126002)(11346002)(446003)(2906002)(36386004)(63266004)(106466001)(9786002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB096; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT023;
	1:pwBqj6dm2cCEGNmn9Bw0DrJpAtox0H98olkw/Kyt2AI3xJNqFyFOYE6lk+gMEJCqWWB2906FV6B5wL9MLvRylpUnlUmurPY7YsegMMbhYSYcjSDXJL97j4WhQvuzezMs
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63a7db0e-afb3-4ea6-d232-08d62d57d6bc
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CO1PR02MB096; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	3:q9wP6n0JpxzeF1Q2zUXvSM0AiN4rsY+aRfueXSf4UAmrOilqV91b1mfsLRan9AtGhL5fKrG7MTzwv83mYP0Bv4YLhPiy3i1kveEQbYL3Zlae60VkYgqpHrzzKglRYrc2/eQhyy+5WohigscbTsld8YGhsLHa+WC/LFfz8BLR1txjoQoBnCD4pWJAOoxSyUGL0W3R7dAq92DDgsRO6lz70WwJz8r5m48qmP0dNi9u9nqJHlL07qlq6Zdk8ypB5jc7Jp2Ymbq9Kch4PzMm/iZAa880eJov3gu+bWKKHthuEwi+yYoamiROs2srgnd+xl/Yh06+jEwSR9W5vXspHCj5dm8sN/kUPxAz6XwqAxkw0UM=;
	25:T6XSNV4e7l8zwzp9d2sKB608pmaJpoEUeLEEk6ubyUEHWi9aMxOuhAuiGCd6WhRJX8SUwsCdOpiesgs3qNCOhIQ0QPaVxAOR9D7KfOMOlNsmybk3i9JOxAsnEZkuUn1bN+lq/BOVRZj4hjS7hAK4gdhoTZ3T4LFLtPoSfRwOSG2+aW1u7eocZ20qN5dLK/3EP1VHT5FfL3f4SrvxsRhxc0TR5OEFVaR0k3vZI61g61R9SxbIJd5bjDUFakY2ByAX8m4HEx9TQmB6puP1DRuIHCMeBlRFqW1xY9p2ozFhJeK1rxGbeLYvOBEBPN238iS1zfuQQvKEwrwKZtLqHWFSmQ==
X-MS-TrafficTypeDiagnostic: CO1PR02MB096:
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	31:x0cCTtAIsuJigPQTbtqi7g9M0PN2trDfxiGXq/VZ152GP7prvb/VGOSj/zhEQaGx60BJBM4kXbu+xBrjWmAloBpbjuz+mZ29NNZQELCfoRxkJZwXba/Y+VrAuul0N9qZ+gn6EUD33dq74sM+FJUhVJFogvBuFyDRFIRkxkQ3xoX2lyTVTq3eoh1SPXIjnA3cog0RCMiWBV/DEGTYtBCL/sem7eE02urozTuYdxEONRg=;
	20:KUc/r/7Fun6ey/DNM2xWVrdDt6ZCBahU7+JS21jqIVaqgUJGCSVqn2+Jj9m9n7scvrZqQWc4qj/Fx02oOrE3ZVdxuBvmc31uwjLbeVNpuax5p/MjjCQUHamhsSKyC1oLr0Kmm/o7hgmEHFdury7ma/3hN/M1VCtIQgadl596wuTmj/e6sUqLmQh3w5R2SmVWTzuEH6Wt0MSItZAlmU5rhcuCvsVaEHlbNpEZRKrsfK40uOkvLGOQ8Z5zCJMQgMvk+0fAdjLQJpNWMR/wWkwSxFIvcrLCVFJOtGeE3Ku7Q2xzUx/FrUR1OjhiQdqCV3WRXWUdZ6gY6ehEj9fnDl40487e6PvYk1ii8NgrsYCEBgTaB69yAAvKqu0yGvfwFMopu/X+V71Jd6xxPedTZ76VgKxq//ok5CRs7cIs8x6vfkSmWXNFgPm2t2f4KAFan4uW+D/OXJVq1rniOYTN35WRhFSDeQx/PNd1KY1xdmJFLZRh5SOx5o8AtLSW0MRNpZPI
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CO1PR02MB0966A7B278EF91DB310AB85ABE60@CO1PR02MB096.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051);
	SRVR:CO1PR02MB096; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB096; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	4:tttlhnfwWvklqwEXR3DruDdRo7NnFY/aHEWdZD1E3xxcjPdXQKfjIdxV+hZ/ZccVKfmg/gD5MloU7scrP67XLRiCctgziFOHfaNt4Br41928jbNmgNtigwGttyF8vdM+s59hHNau6xgPqzH7zcKQ95O/kFlBuT9uR4QJom8qJXlLNXy0/Io6Z28MW6nyqqcIwHUKFkKVs7h06BcwLnCHQNVaoM+dLPlwZ59eON81/h1mv7jR99PdW+BOiLMHdkVTtwk1uA3gQMV2IdFstyXTY4J9Yg7x25kKEghkso6xn1RzuT8sg7fv0tAQVLrDg4U+LevW2BorJ6lpAMNfZY1AFKKf+9Tg9xEZhhwnDSx7ciE=
X-Forefront-PRVS: 081904387B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB096;
	23:13lfUNpjqOn9+NmGCounpyrp6G2wt9bHGb6c6whALV?=
	=?us-ascii?Q?Ut0mIKgVdXWJs1SfUSqSmf6++/YtcOoU8I6rxWsHbIijH1vZKJn0UolpA3dX?=
	=?us-ascii?Q?B1IuS+Ng+a4+jvn4cw1AIqqWfQN39Qs9eJW7ZrUZyhvb4nTFyMiJl6frFhr7?=
	=?us-ascii?Q?xExk6lUw9RGI+ROMAQl7wjQ2nLdtsi/VJsjdNJdwMbg9ktI7m7oR5od2+lpT?=
	=?us-ascii?Q?5LOtXGsj6CXvZgC6PDB9WoTiT2FqhsodCP0xu7ZCEHaRinzhBnhyVX2VdHoq?=
	=?us-ascii?Q?01vPHCQ9r831/+W1c0OThNvdKSiBZH5YuzxrrZeYM/eUHNLNCG40trWUphlz?=
	=?us-ascii?Q?yg+HtYOO+wznVfAquoNyeurF8h17JYSuebe7lDz6Q3QAWxRRgEslMCob2keI?=
	=?us-ascii?Q?aRBp2qwjmBsQhrrfBlQjwXi93itrjoiI+pBHCx6Yk76eNCK53xPw+rG9U3Yt?=
	=?us-ascii?Q?x1aOQCG4lAsfcFIDC90DnPlKoFvQwsz2Ogj0yq6RMkeuloa9QF1uB3XZ+ku2?=
	=?us-ascii?Q?hcuuLgkbwOfUHHuDOh6Pw94gAx2O6Y9/2MqyD7W3ThzZGHVEUtH7M7sryA8Z?=
	=?us-ascii?Q?fkk6rxoC808Wq5n6ITgFxu/I8WEdfCDZKvzu37TQCNXxd93CZ41I27kp0iGS?=
	=?us-ascii?Q?FbRCLyC5quJdDd4vbvLGJUg92UQzrc5cfpfhc5ZghN6MhwPNhfu9dz+Ndstx?=
	=?us-ascii?Q?/nxkcNtzg4B8bz2u0lmiAmuXfF7YFd3XZJwUwuCLILKoyW/tTwpubq6zRGs6?=
	=?us-ascii?Q?GugdnobkxGhvb079ryVxX7ThVgUdrDU3k3yyKZBSHGIC3crBzddAJP5JgjhY?=
	=?us-ascii?Q?0lZBBSoXDeZftYHwHeei+zOuHJrbigOZwN5FKeze8DRMfT0qTwCtwljm++r6?=
	=?us-ascii?Q?n0+X4kPgrqhHi/inIKOhnFDmpBTdwrMI4VrWNHhPbDrIn+tJ7M8bjKpf8mHp?=
	=?us-ascii?Q?EaDtZUdlbYIbCIBrCdmoGyjrhZ6aJZpDKkSXCK0BszbAWFzKQB/72kUM21WA?=
	=?us-ascii?Q?4bx2gJkouP7s7/R1AYhWCdzf8gkI4YabRrYZ0q1n5ISH6UATzcckL7YWqzIB?=
	=?us-ascii?Q?2DfWnd7XRYFBw0oNkt4VtKxYM3DEmZJwMOTwcZDrHdZKgswJpGwvb7QpOL9Z?=
	=?us-ascii?Q?gxCQ0Gf8gMAOJxLRj0qyVGz4Sq9Oxt32UgMt/9g1qO2A/hQX0v9qoWX3TKW5?=
	=?us-ascii?Q?+AMlbR7kXn9QFhsxHghwSbRPJ99mMDcrh8nofvixzfXdMp179U4bAlWHqN9r?=
	=?us-ascii?Q?J8FgHsa1RCh7AxHgJdYiwXyoDjDWGxQUsQG3ZA?=
X-Microsoft-Antispam-Message-Info: kcc7oiUxmMRXgO1a6nsMp841hnU1jPVRHdYpdyxo61vu+X1tdMvgvHJyUNkem+NRKv+zaISf9WSiaGPN2WKLRsjE+LEn9EsoncO6fWA29JJDUJANRcB4CKY7WDTP0rsvES8DWPTTAmdGsZUb/GTLosmWE0806yNIDQOUmcGbWZ1EI6/4XRM+sywyUi0iZ7I9+srYMqyg3iRul8GAVtZUl8ffEV71Sl2skq7O9kmx38/oZ4XjaCZNZDYaVwYAlLteoF6JmChuJe5S25256NvPWJfpYEfTYbJVq/38TfIzvtMGb8bDsq7aW4NkNzvJxhAce+ZwmIywgijM5rHb5uki7bnP6NtLR8Br762gCKEMU7I=
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	6:ykzLKN/NIVlr4+85IwkwNUEXMpnOGDNI7lirbIF13Gjop4wN1fb6ytPcJ/X+akmAw10iNRp5gdsPCe2JtNmQzxPDQZX3gKsz1YlzhmqMbBym4ZtbQ8kkCiyRXY9/eLi4Bm11EQ6wbIbI+fMw7THilAAU8Gw1VSSFd0AqyRYBa2CAbr1ZnVqsG/psBwUBpsISJQMLJQl0RXNaW/UXLay57HU8WvLLtluzqFxGbtlx4K8OMQjvufW0SJbKk5ggk4XzQPE5hPDafkAtqgXDMwjbuIcFdh2lok+6tGrM13d/w4c8eJvDQxGiATxzdd/VT5xv6mH7RTkvJHn4jngpix2RXkw2ACzycoPlu7rd5UGfUWNn6Ua4R3kjBql8ul0Zc4yw5CVmdEN3o0k2CgiSOb8OGz6ymzvBq5+8qmA+dI/zETPvL1XsWTlmabA7rntAKmVrYa5UwWOFWTZ4ZOGdbY8gTg==;
	5:Srr0XLNv1/RF8cCMHzTR0RJQD/6YfQh6itNs2QXwLrIjB9BHy+4OKtQxDDm1CbNLI0NQaf1bwWB7w/YYO5UMqajNTDWYJ0fFRgJbjB6OJRyADf0UEX6TqRIccEQjrvN2dHGX7SjCIWwLfDcxe56QIFHRGk8UoAKdmLKOW+9NEYM=;
	7:o/uLEp4c9Pfw9Ec8pB3ey99+ZOaPIymLZ1BPBTHO3kcEjUh7q65/wfLr4R2Vrgyhf/bLh7WnvlTeK17AMs/t59Xd8MyHjhTWil979gq7HaWTxnR4E6bmZWPsoDewz95BcsrbVlA8MC1rwrirW7R/TH/EsPZhIhtfCE3j+kb7Z3rIFmEnOx3I0W4GVUthMtgoFOV4SOncl8ycWzAbtNgNEC1QlqkTpt4BTNp9BhtVaYiuWkd3SG5x3Xj/fSuGLl9V
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2018 19:54:17.3818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a7db0e-afb3-4ea6-d232-08d62d57d6bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB096
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.47
Subject: Re: [Qemu-arm] [PATCH v1 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 94bYtx7c4Wpr

On Mon, Oct 08, 2018 at 01:24:51PM +0100, Peter Maydell wrote:
> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add support for selecting the Memory Region that the GEM
> > will do DMA to.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> 
> 
> > @@ -1500,6 +1506,13 @@ static void gem_realize(DeviceState *dev, Error **errp)
> >      CadenceGEMState *s = CADENCE_GEM(dev);
> >      int i;
> >
> > +    if (s->dma_mr) {
> > +        s->dma_as = g_malloc0(sizeof(AddressSpace));
> > +        address_space_init(s->dma_as, s->dma_mr, NULL);
> 
> Why not just have the CadenceGEMState embed the AddressSpace
> 
>     AddressSpace dma_as;
> 
> rather than doing a separate memory allocation here?

No reason not to, I copied this from a pattern in our code and didn't reflect too much about the allocation.
I'll change it for next version.

Cheers,
Edgar


> 
> > +    } else {
> > +        s->dma_as = &address_space_memory;
> > +    }
> 
> thanks
> -- PMM
