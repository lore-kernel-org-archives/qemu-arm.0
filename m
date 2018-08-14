Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4158349wru;
        Tue, 14 Aug 2018 07:43:09 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwXZ+E8sj7cxw6iRVOngSfKot42k4KmdiJYAskWGMojQYjIC4OwTCJntQlcvPl5C/L//Nyf
X-Received: by 2002:ac8:1bdd:: with SMTP id m29-v6mr22302337qtk.261.1534257789120;
        Tue, 14 Aug 2018 07:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257789; cv=none;
        d=google.com; s=arc-20160816;
        b=nYnVR4ZlloV4DU07y0T911cxn5TQTfk6MSzNeqOef1GHzw+piu6kAS2NMveJJaQJ31
         GRCIWQo60u5xjP2AMFf82pcgXDP+WLST6mDdtTo1NkQAOaYh8n+50x2/XdUCRw139Edv
         TXtWkdy3bX8CgWL/CW+VcITyN4aCtnJXYWTA8Ss17vrK/I8Z6aVQe3sktyEHFJgVcr6x
         d/dYdQWk0B0gIsxDmAtPvdSpZYjgG3LGem1ZVYwUes8tJWfWxBwqQamDNWng23QIh03s
         deR2ypVtvojC6kHzFhfx2Jawx/ng0LjqYz3+Sj9l4GkUzbnNTcPIfEhDIC9HXTVdNv6d
         PDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=0mUcwRiMfbgixSFQQOBbTPbl0nGQhl5Dm2pmFBctarQ=;
        b=lOmbOy3SuW8/uvKT4SH6A8+Nyo4J9kIA/ISaO+h4Er7Tv+ibiaYhyyW5AXQ3S4nZE8
         2Oh8dTW6toMRKRLQd8GCqn8ypN9DOkm3HitF7sh5DpApUIoueXDz6KPeFWifOLdk2Npt
         JvbP4/N3z0ZkB9pbBrBMyVDJhKuHlS3zdOHK6tjgaugTPcftrbsnl2N53p/AWPMoqcD+
         GjLlwQzrOV1Y+/LVxv2ujIqy6HaDyIiDjK1QnpLOJxrX6CXCeu2VcGFwHRfBiQFEmYbp
         E2tdZM14NzNY5uzcnVwuEPMy4iJJ035/qmiYKPN6v0+4RxVBjnRhrD4fzt31FJLKAUu1
         VSOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="jP+9C/mO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8-v6si2801801qtw.283.2018.08.14.07.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="jP+9C/mO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaXM-0005Sl-MY
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaWJ-00058N-3Y
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 10:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaWF-00038t-T5
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 10:42:03 -0400
Received: from mail-eopbgr730075.outbound.protection.outlook.com
	([40.107.73.75]:3040
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpaWF-00038S-GA; Tue, 14 Aug 2018 10:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0mUcwRiMfbgixSFQQOBbTPbl0nGQhl5Dm2pmFBctarQ=;
	b=jP+9C/mO6F4MN2DTGlNAvw2EQgwXg8B1svCFmga/pAVuQHD2pQZHTriqJRPkQYtZJWclYhiGa8YZG7VTrelkpfGdVQpq9rHtGhhMB6gN1oM+D21mnEf1ogfDFHjIgwiOrmu+VNd43oze4D3IHxJ5ckE/WB9n5jCA0V7wi65h0Oo=
Received: from CY4PR02CA0009.namprd02.prod.outlook.com (2603:10b6:903:18::19)
	by BYAPR02MB4326.namprd02.prod.outlook.com (2603:10b6:a03:56::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.25;
	Tue, 14 Aug 2018 14:41:56 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by CY4PR02CA0009.outlook.office365.com
	(2603:10b6:903:18::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.19 via
	Frontend Transport; Tue, 14 Aug 2018 14:41:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 14:41:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60720
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaWB-0004qR-2x; Tue, 14 Aug 2018 07:41:55 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaW5-0001Df-Sp; Tue, 14 Aug 2018 07:41:49 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EEfjRj012544; Tue, 14 Aug 2018 07:41:46 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaW1-0001DP-Ev; Tue, 14 Aug 2018 07:41:45 -0700
Date: Tue, 14 Aug 2018 16:41:44 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814144144.slntd4f22eza5rru@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-3-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39850400004)(396003)(136003)(376002)(346002)(2980300002)(438002)(189003)(199004)(58126008)(16586007)(4326008)(54906003)(106002)(316002)(63266004)(77096007)(186003)(8936002)(26005)(6246003)(11346002)(426003)(9786002)(76176011)(14444005)(47776003)(446003)(126002)(476003)(486006)(107886003)(336012)(81156014)(575784001)(6916009)(36386004)(356003)(46406003)(5660300001)(9686003)(8676002)(81166006)(106466001)(305945005)(229853002)(2906002)(1076002)(23726003)(50466002)(33716001)(478600001)(97756001)(142923001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4326; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT055;
	1:F+An8gtfXhAf6BuGgdBU4jQpgJTNqV0PXMmPPWdk/Dz73A2Pf55q5Og+bhRrUYHs+qcL0mbJLvxbgzwHjBWfHrENHtU564nJyXNv5nJsP5NHc6H3p3OUzsH5azWRHPG3
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21041c7b-4d61-4f0f-bce8-08d601f41542
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4326; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4326;
	3:S08leFMxJT6K9b36/eN4JRZd78M6MigUjw9jnbGw2LLIBJaDNaniKAeljkEUqIjHCVX4MJ3LzHLQXFokeNBAe0YqFpuLs1H0qURjjOZIjOo7vj9yeDIafU6/J8Vy9PPQ4Vs48OnhAkyIzG4EV8YQxdBIaf5dOBf2vuHT0wN1bi2scICCe+prxYnqyXDufrBDZ3BpqWt9aNehAvvPOYXNqghPSBFetXwCLWh0W4kptjx38SivGHHGekVBUTk2dWQiYEugQMfRpZbOZyaxlFmr0djWeTnnVnshG56AavPBXsYaQqrPpEgPPsiqAoMooZpKmHtutXIq1eH6BMIR2P1z2TmJpk2kgkXRY9v4FtR2nVc=;
	25:zfLJCLtfrrIyxom8XtOCemLDLCIL3l/4SkJPaBBKS8yz5fNgvROuP10UIErNHc/fzlJFqctFd+mqODWeAwwDLVXm3o4cRScgZFr+TuirDM6giEMKAQD6IKLkRPu3/jE/59b0IYfsWVPgy+CU1xHo3CcWwpYCCLkLTbaUQ/UgR4aKRV10Y9q8tAv5rXhk8aadiIxnSV3wgvWGn70WIl7mKZvWuXPG0S1Cn8YY3Pyc6IDyrKYLVx7xN/MjII03KvrpP24peskpoS8NTGZ24n9IAzM/GVdSOxdwYmdsZ4Ffufr6Sa3Ci8cFYGQxI6J7DTjOtC1j7s/stx582fycJZpKgw==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4326:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4326;
	31:qovLDt5wgkfytzklEqX/YS42iEB+CSTTMlC2CPB7IDRSXGw4/NjEJeT8w+2A1uLci1zHlNwUqF9Jqdt56M+M4W90Cq9u+T78ewhwuwcvVIRwLYS/TgLLKGrQ7cLg8umWEtuO/WFY54T1mU6ssqkT12YWIA+UDwiTgTkGlhFO00hqe0mXjoUjDKlvKf3+ZIrgeYSzUlngy9+eNwsVPMWArksdcsubXeZ9sssMezUia+c=;
	20:6R5WDOf5Ue9hAm4tBTMgzawTMZAAJupalVYs2NyyhdvvDZYh3UlJzORCvGbmLtEC/d1AoTptSGLT0Rp27iQe6J10kT8BUAfXJeVUp62e3zVubckh5f+3YzhJcJT+gqfVX4dO+DbByL7PYst3rbu7Z60ON+9PjeW7qQxDABvaUWhCMDM1JnDycoWo1F2oFW3qkI+39FEidYY9/cz6j2uNKyQ6tmZd9ApjYKiX2gt8jytI5GxD3uNFX6Bs+Z+xZkE/j7AqBR4qgyd+moifJxze79w9HpKhaZHPu90rmvWhYpxMdmRuL7UVnKCi+F+SR/qb3Etrov7mVw8SUM8xJQrPo+PfHm6JvmQRVO7Y4obJtxlAWRO2mfs6eBqAM2EQOdh/h/Sh5fRWzNErIe6aM1cmzSWu5BnYaYqx1n0ltv83vANdbN4V1HFPboGRLNYF3k6CKUS3tBLr84GPrWq92AUpdVcJ1A7h4TkN2PEGeKzE8ZuxvELIfRNL61erW5/CH8e1
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB432684DFE4683BAAAF566440AB380@BYAPR02MB4326.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4326; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4326; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4326;
	4:/TpSZfECHMAT2cW0urxOaw7sIqi471vkC2XWDP3io9wv7l6lRCE7Ae3FOOOTF0WDwFH/936Ab8DZiOAVhyNm61LQI3J2+eAx6JZ9q6x40hpF3u9fu7sRArUcHiEjVpiJNm7Bxhkwt7kxwjXDjE6OJr5iLQ7ZdTNcJzCe+vkP8fujU0srbmgNcXFDCU8NxEc6twvOlZzWJYDKxFcuhYTIRcdaZolHT6dF0beEBP++ACV23b94JZc8H3HRre/fLv2pz3WRCGZU0e9/ePU/rULh5UT1WkSF2qVdqRVglhlIRZGRBdECMuKApGYjg6RP7Wjr
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4326;
	23:Kc2A1OIGpAtnV//0PVbvDjgL6aRh2ZdgMDR97KQMG?=
	=?us-ascii?Q?8UVktLCzbkmjLw7wryvAdyLufEvVNW7sV+GaWBEMRgEP8riMrwaFICn5Z4FW?=
	=?us-ascii?Q?yTsCwA+Odo91bUAX289896jZ//B5Y0uxvgBt/DWzZPRsLJW1j8Wsn8qprv6W?=
	=?us-ascii?Q?WK/2RHHM6FWIPAG7IOf5UDBiBqiw11lC1aAwORL97CzihftJ4Zux+xZUnMQ2?=
	=?us-ascii?Q?Yy4eNH9usvVaJNhJnMsBWoHIlZPHQbBaHu+IKqpZDO4xq2iA6KLE8jowVsKd?=
	=?us-ascii?Q?2rCgYfPe9MoqVfVl+pVHHuLbrl/g4CdPTNfESCPl+u2T68DMzYVd8A64kOtB?=
	=?us-ascii?Q?mrPO7T5FhceuxEO5Q8Lkxc7Mfm0LzGeVbQ29dEpoeE286Wult50rbLOqTBJD?=
	=?us-ascii?Q?V8WpCnO6bHtTD18fugKUzkj4C/W9aydmYzrp0WDDGXE5h2yh2mYbCc2ckUtK?=
	=?us-ascii?Q?/0tS0p+Ip1eu65rW6tRMFhkGsvOgFplZp/GFRXKAYaZNYtLBHBaoQ4xbGJqn?=
	=?us-ascii?Q?jZE+uYrMhycOxoJcRiWTPOyGjxgKu/vECPRzP1GaA6gENv5InUW2MJopo6K7?=
	=?us-ascii?Q?3oV9p9+mFMH1pJTK/vDh4WMPcOzmAylrZ9lc3xI862XG/hxT/Sy5B8HrbY6X?=
	=?us-ascii?Q?zWAjQ5pjtikkut8rb4L2rLq74JXKuXADKqQs51nISH6bqbMobIrpFp1c6+/S?=
	=?us-ascii?Q?YW+XGWcphZ+FOOhC3NPw9ZBc8jLFtQNH+SUEVemVX4VxKNGxenAatRO1Wo8y?=
	=?us-ascii?Q?2yIuAZblP7rMk94AwmF3C103XZdDhbg0LAjerR17pqhqCwESRm5xg3ISLZi2?=
	=?us-ascii?Q?ANSMH0cie99B25UBnrzePbMkFnUDj66O5YtEfJxS6S1s40VYpjtdEgiKaZKE?=
	=?us-ascii?Q?DY/4adgYCXEfpIT4gjQWMtZAR7wOSz/0wGos3tsvLR3LzZpS1XBDkp0sxUwz?=
	=?us-ascii?Q?evw9WZpnMOZhppd+oIdFQhezn+fxVgVSSSlbiGB0tKRAOjmoNN62kka7p5ZR?=
	=?us-ascii?Q?EHcZ52eZF+HciD4MRuQ9J8h810rXRTbZqQfRnCz7Esd+sKPgBgw41NaPhKl2?=
	=?us-ascii?Q?erKp8ye0h62eQIGJtDLdFsy5fnBE3vHLS9U7ZrhjIiHzBYAKm/RDVAnXqQKR?=
	=?us-ascii?Q?NSGkqI5bRduksF/CfOOK+o4eN0JCUqNprnZe40cKiE8uOdQR2g9PIO4iAZGI?=
	=?us-ascii?Q?ZMY1w6NkuPF90CfV+F0hcYtENWAejK57hcGUDZCDq5DdR3+Yo543L9L6qFVs?=
	=?us-ascii?Q?FtnxLTNSscKY1LxOm0GxmDXwwGFJ3S7hfXh8omY?=
X-Microsoft-Antispam-Message-Info: hB/nJf9ec7Oi4tu8X3PqF0t6iPSLGwoohJj2l2+VUjB5Frs5o811M/Nrzgh00wGuIMeu2XYUbKIIZ8RKoi4InYkzPEV/oUELwrG6/8eHx+oN5T5Q8HoJ4a5BBuDt1BR74/uSG5E4R524TFYxrPUNgmSJHGotbTNMQs0y9ohrI7lcvJgdHwvAandhs17S6q3DtuOSpoYkFsuUgiP9uTTdMnsBpwekA1jMPbuw1HURHjGAkRc15Zf0RWIMvJy3Zqrq02GB3OigzvdT8H28geyIWy8TGnmBjxCOy+XaXqrmG7sUsnDZUSOh38CBJUkBZsgmos0+/NxkIN4AVw9yA1sfU5zgOi9yG6waMgRg+TzR3ZA=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4326;
	6:Q4LbBmf2MNaQgjPFVVjGy9OPsMZx7H3APWY35LqCfEw3JP64Hg7bFkxWPEn9xRmNzE7O0h44LHshdhRep4Ra5ZPXBw85Qer2n9PqCOApw+ZFKGDRkbe42nNxwIGVLTC5XmwW20Wi30EjJgr5lqGGk6HNem9Rkr3h5tAaKZXf4sMNCoOehl9KFtGPHAdoZiwy5YP1CTui+lgiun2Q5EvzeHehcSSpRqTIadkXqr/9VD/i/isbB0HANxjzO0IN04lbhz5gVsXJ6egBLOtQy0WowHiN/V+IJS+9N1omZNsZEh/X6vB0dh2T9NaUqWNsj/c96B95k4oxnwd9+YnKzUy9TgC3fa+4tBxNM1MhI0FvWUnfhuUGNEqp+211OwyxYUmW5IpacGOIQb0tUtPpc8OknorBm7id0TG5SHmVXvclxEkSVrZsGyEkhb7mbZ9T56KdNnXGaY6nhyJp01FQWgFn7Q==;
	5:ydcMlvq77+zFZK+A/T1NP9fRDpEe1vwZtPdlg+WE17DjLeCmS0HbfYNnF1ByVS4S3jaRIDcKjMxcqvSfnSUdFrfMSiqpFhNwY8ogAoaBbdvdr4G3vUJRd9nrN48YuRg5khT87J2DfubIZFjyqMKP//zP6B2dOeFRqZz8Xn4CINg=;
	7:XtE51vbPJi0fXOBkArkO5fZAZzQ0Nuqp/nu2Qa+EBAHX/zujiGn/4F+Dy/iezWT7hbXcuQXZGUYvVIt3BXjJwLiqTd6ncC6XTo1FvIrKFNG0ijlTcI2buqHCJbyCQ8TvrNhTw/TRI6vQN7RqUE3niMHMmgv9PhOeGl5DpA5kqQUo9Hatgg8fE0Nrcb53Uhb3RINkxUDjNutTm4GtYB/6nfUPIM+ACehfVxMOyQlqrACTHjo/xB2JSZK+6y1JsuyV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 14:41:55.7347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21041c7b-4d61-4f0f-bce8-08d601f41542
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4326
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.75
Subject: Re: [Qemu-devel] [PATCH 02/10] target/arm: Add missing .cp = 15 to
 HMAIR1 and HAMAIR1 regdefs
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ggvlh3r6FLpV

On Tue, Aug 14, 2018 at 01:42:46PM +0100, Peter Maydell wrote:
> ARMCPRegInfo structs will not default to .cp = 15 if they
                            ^^^
               I think you've got a typo here


Otherwise:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> are ARM_CP_STATE_BOTH, but not if they are ARM_CP_STATE_AA32
> (because a coprocessor number of 0 is valid for AArch32).
> We forgot to explicitly set .cp = 15 for the HMAIR1 and
> HAMAIR1 regdefs, which meant they would UNDEF when the guest
> tried to access them under cp15.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> A quick grep suggests these are the only ones we got wrong.
> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2c5e02c0b1a..466c8ae492e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3767,14 +3767,14 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
>      { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
> -      .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
> +      .cp = 15, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "AMAIR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 0,
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
>      { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
> -      .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
> +      .cp = 15, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
>      { .name = "AFSR0_EL2", .state = ARM_CP_STATE_BOTH,
> @@ -3917,7 +3917,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[2]),
>        .resetvalue = 0 },
>      { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
> -      .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
> +      .cp = 15, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
>        .access = PL2_RW, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetofhigh32(CPUARMState, cp15.mair_el[2]) },
>      { .name = "AMAIR_EL2", .state = ARM_CP_STATE_BOTH,
> @@ -3926,7 +3926,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .resetvalue = 0 },
>      /* HAMAIR1 is mapped to AMAIR_EL2[63:32] */
>      { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
> -      .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
> +      .cp = 15, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
>      { .name = "AFSR0_EL2", .state = ARM_CP_STATE_BOTH,
> -- 
> 2.18.0
> 
