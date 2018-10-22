Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2888594wrt;
        Mon, 22 Oct 2018 04:33:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cNbWsmP3evjvqtn6yM5Lgt7jpT8Xq73ho/H/weGO0ooWn+mDLdgyO/20Y5jWAxDKqFA4+G
X-Received: by 2002:a37:d61a:: with SMTP id t26-v6mr7339237qki.21.1540208030186;
        Mon, 22 Oct 2018 04:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540208030; cv=none;
        d=google.com; s=arc-20160816;
        b=LYcvmAzZAKdA81Mi2ec0zoH7PxzhnovFoAfJL8oG/1W/LT0AFnecALj7uCKDlApzz1
         OFOrK205yNet4OSQpxdZTnVqUXkhmuL2YtUljPsDhFQbwVohk7Y4oOfxwH74bZ71FI3z
         /nypxQA5T4u6h/cAIH21fH6ZfGhwJ+vfvLSBW3Y+m7FvVK5hVznoGZRuL8J7yJSySEs+
         b1e2ILAWv7tCJIvnc/ST8g0tF/eakkUtdXdP2+fMxYXt6ELq4mLpRT71QVo0Lxk84EIU
         uSdN6AbPog7mJlqXFOurIcYsvHbENsz9YFJUTjCecflmaQH3V4N3+1hdDMHxpZXJaBrf
         1cvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=zfInHXme4h21JRXGqhveRASrWifYjrb1WfiiZuKZSSU=;
        b=u87AsNgHyMPHRjhbZHS4RY0Al6fOQ3v8B1Awap0K476kWci6G4U0FWCLTeVZj/kran
         qyuIIYHdHuEgPQp74PFmkXgKSGku13+BuIGV2/uoRUh0Gytswqi5vwOFrCAoogXf26OX
         SoRI7+L/pdaD3AMB+Rh7QQ+NSXsaCze+kNkCN4AZctaUW2/RjyuZTKZxOCJIbXpy/EZN
         A/VRR57KndMiXlZmxmIM4A4gFeV3Etv3E2vo+zwn2EfupjQx9zBystXh5S2SixXOsUic
         EZbQ7Lq6YqKZJqXCNNcSZl3hv58F0kPn2ILoSyhmMZBIMxZpv8hvABontlFrLXNvw6NX
         IzAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=XmoI42IS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m47-v6si8609878qtb.280.2018.10.22.04.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 04:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=XmoI42IS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEYSz-00023X-RB
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 07:33:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gEYRR-0000hM-Ey
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 07:32:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gEYRO-0000nW-4J
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 07:32:13 -0400
Received: from mail-eopbgr680080.outbound.protection.outlook.com
	([40.107.68.80]:28384
	helo=NAM04-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gEYRN-0000lP-RU; Mon, 22 Oct 2018 07:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zfInHXme4h21JRXGqhveRASrWifYjrb1WfiiZuKZSSU=;
	b=XmoI42ISrSAox6oJbH7sCu+RbTf7NyjTdpPJtai6QZ34WhUdVDX9BEzCkteNztPQPuhAYfT22IVx7eCdymyghh5sJBLicHLXRGkc1pqvhO1jPqA212ivU1sFNc6Xic4VqwKMLBVjvmL04Hn/HiC052a4BKlvRDlbEZ03sg11htI=
Received: from DM6PR02CA0025.namprd02.prod.outlook.com (2603:10b6:5:1c::38) by
	BL0PR02MB4451.namprd02.prod.outlook.com (2603:10b6:208:45::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.26; Mon, 22 Oct 2018 11:32:05 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by DM6PR02CA0025.outlook.office365.com
	(2603:10b6:5:1c::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1250.22 via
	Frontend Transport; Mon, 22 Oct 2018 11:32:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1273.13
	via Frontend Transport; Mon, 22 Oct 2018 11:32:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37827
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gEYRI-0005Pg-F9; Mon, 22 Oct 2018 04:32:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gEYRD-0001nT-AT; Mon, 22 Oct 2018 04:31:59 -0700
Received: from [10.23.117.126] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gEYRA-0001n5-6y; Mon, 22 Oct 2018 04:31:56 -0700
Date: Mon, 22 Oct 2018 13:31:55 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181022113155.GH4229@toto>
References: <20181017213932.19973-1-edgar.iglesias@gmail.com>
	<20181017213932.19973-4-edgar.iglesias@gmail.com>
	<CAFEAcA9Dd3=52zReFVMgitYFeQsRA=guYsVMxy=0zHsLJ_+z_g@mail.gmail.com>
	<20181021192457.GG4229@toto>
	<CAFEAcA_URiHwcu1k-MYGpw704y_t4RuUFHGrpa4XA9GTKBb8aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_URiHwcu1k-MYGpw704y_t4RuUFHGrpa4XA9GTKBb8aA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(438002)(189003)(199004)(6246003)(305945005)(8676002)(97756001)(77096007)(486006)(7416002)(229853002)(33656002)(4326008)(81156014)(81166006)(106466001)(8936002)(336012)(47776003)(446003)(6916009)(106002)(9686003)(33716001)(426003)(11346002)(5660300001)(50466002)(9786002)(356004)(76176011)(14444005)(53546011)(107886003)(46406003)(63266004)(36386004)(186003)(2906002)(126002)(1076002)(16586007)(58126008)(54906003)(316002)(93886005)(478600001)(23726003)(476003)(26005)(39060400002)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4451; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT052;
	1:GFX1X6qIdGav7JbpwNkzdWQadymT6qLrog3VnmQQms5aCRN9eHUcB0T5hK7VkB7fTWOmr1kRD24zF8EI8mwTf4upmDD+O5OsuCRc1jlXIi6nEMReKAPylOnAluDaOlYh
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f26cffa-57d1-4a43-7093-08d63811fe62
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BL0PR02MB4451; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4451;
	3:UkH7CgCfJJI7WIBQhIiFlikEdYLdxQnrOQ8VQyEHXdhx/tGoLJBoxJhxtkVc0nxdWTwDZ07uQTlDQOkt/Hyc/s/qMiVU8Hsh9IiUlUgMZtyveNNlB9ZTQpIybQUyzHdEs5nZQVrtkIp7cgQCtZuWbYPSmC35aLQZsrDto2rKXpqxjyurHSe6Z4qMM1Yj24HCIJL83io3oM+PHgdBYVUpK1IJIX/pnQKkxyDDY6xtiMfcSKq+eTg+bqveBga7WH9xm/mHmsh/KZB/avXEs7M6p3EyIYEwr/d1QcC8Ph+w+Y/4LX073HZSPkBhGJnaVx6ep1GZmaYEGXux4pV559klagZOYN7O6IJ3z00LPWkbO9w=;
	25:qJEIreyS+VK3u57dRPn6KA7OT92CbpbrwNm8ZJ9BdJwx6B6L0yisFoPO72+Oqqn5+3njAe3CH6/keBJEFOSeASuj8BdnI0DT5URjeApqX3/IhYKWL82M+OQ1N9Wc9IwdALNANMKPh9zyiE69maoRAuiHsaqHe7KwqjvoiL7lgjNkW1v6s8uWqYGXvxcZAFUTBxSyNF8CiX8wORe8wtNpB6mLUkJ8W/0ti2qkKP/85qVUm9gLxEfJDibXZ3JCD3ZA6qGcnnVVqkIsNylF2mapXLEOEUp06JduoUhvZHOil8gxk05sH9cxjTmIdiMYAGvQqhu/NSn82pmxXfaPG0WxAQ==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4451:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4451;
	31:K2ib0EP/FO1sucQjalllzCWNQZg8xadP3acNIKh4RXvQJmkKFbxUOl4OqfslLScmKdb4kymRMbQy8R1ZkDXqYclgUEfcU/+n13oweiv3kXometvKycRpgCfBNKSs0RiBPRAK82DKSM9HmshqMETPNqIw8Wpyi9V6Ve55Q9v+Ke7Yl/BQ+ocEywkDHTGsMnEsYJFcgpHW/uV6h3XSRYUMAuTrhres2XozT5Irx631838=;
	20:rtSrVgh9Xx+8LBlShLleSTlKQjigOMFuLNlIHtCfCJPMOoSVaQklY4ZTfQBYAWunNNMZmynFG5t/H1n11SzSF+nzMLZ/JIg2leQO2Ur9BnxWXHvw0NUoY8+7TTXhr/v4e/uJI6H5wYgyzkYvAjOSLuLazLwESLQ3PxD3tua32tIiZp3xuG+4Dz43vA8oId6wYANzfYjv+k5DdMbetzwSzEDSd/3EWW4qcmqtHlPb7QFUPs26wN87PgzT1SyaY59wOrkmAbF5QpBcrp4W/VFeyK70nrHDJKx+PvfN0Hb3XP4EDD01xeLoZuWVtyng0crs3S8bHmYEIBD6XrDe4ODEcoGneUNgXkaiTNz95/1FXjEeVNt1HUHUk9hnE6PYUeOjVbhePL2yZLs7KMZkPaHLBhusr98har88FpxL8MlvbBTlaqariwTJKNoDBcBXB0X77MiX9RPrX8d76i+JhTkPx283F4a8nFga03pDptrzkt+cjd5aTIZORd/ucdriHZKa
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB445199D89776D1ED76CC4CACABF40@BL0PR02MB4451.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3002001)(3231355)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:BL0PR02MB4451; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4451; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4451;
	4:6Ngme6Igc0WORQbsPVyVbiuUMzf+217reKbvRokaehWOrWGkJUDopDzQ19WN8py/sjCc4SpYoF/NzijtE3pAXu0bQCtK5/R3eTA63Ji8jNG2AS2RekAn4nEIBwkihlJ6GST0t5rcFOl8b3F44JwhB4hWRIW+emD3OUiNSZmll+2beYLhui/qcwlHKKdjqoSrdJEV3hfgZ3FLeWgSqxCcAr26Vkm8s3QdlDIjoxmYIfmvcNfAlaVhziQwZrEodTMVMfMY1oVxXpBTL5cD5RjNd818A6KLlZ2YPRroQ7ZYSsgYhSKG/4lDCAhwysnNjvtGv8um6IEg5N9cnV5wiQPCJSu5KhGkJ/pYvoiXubGL/ik=
X-Forefront-PRVS: 08331F819E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4451;
	23:jLpmnoB/Bpfj7dKAjosjW1UM8cprc6CcTNdTUL0d6?=
	=?us-ascii?Q?xv7rcyIkj4y2hvbHNzoq3yZVCsrNURjHfPtKC61T3i1b+bS8554IhsJAUsgA?=
	=?us-ascii?Q?E9fWRkaIYlYoG/WeO/7A2gVPJJJ6Y68CS4O2fRZD+5T9oSyCBcAZanL7b4a/?=
	=?us-ascii?Q?6oaeGqzU0EX8V1SKur4piF7B8uzK/dLJogJkCVjvmiIbNK9Q3APv8jrUGh8q?=
	=?us-ascii?Q?EGqE5rZ7EK8fY38cg3SHhU4b+84UfUwsYpJ4daO7clyr8127H1J91e3oLLV8?=
	=?us-ascii?Q?L/Am1svwulZ5bo3Y022DhauuU6NMS353aavAq7GP8II/9GYb/lT96A6Jkd4V?=
	=?us-ascii?Q?bMnAaciOxSl/He74YSCaTCanI1JWT9ouLx1k3sCMj1y4XELNvNVkytK93uTh?=
	=?us-ascii?Q?rLk7bkY9wsfKUqFu79JaLED4QGB/WUuQjsQdNc/61CEbqF7mB/NbNxZTIUcj?=
	=?us-ascii?Q?MGhewczTEPysf1zsuA5A95v2d8oDky/Yu1bmkybmALSqM7EXGiHs6pD1rbv9?=
	=?us-ascii?Q?ba78A7aO5lJebbLtFi6FCmhvuKmVW3LdCPw6QR3tbGnpYGQEiIKNWxnWfh7Y?=
	=?us-ascii?Q?tWvcR6sfR787HDH8AnpOYYqO0Nes3lik+Z4Yk+11A0FILH01eIc1hkp6bzIj?=
	=?us-ascii?Q?Tys+kyQQ3BETm6LYjv+kiPcMujW1r4i1/xoUpO5re3Nbqrj3FhsWddZEeVTt?=
	=?us-ascii?Q?0hnz7GtNBBz0JpsSxJh+H5CoJVf/0kGyTbO/vKSw6U7yygXc/a6nHBiPwXO+?=
	=?us-ascii?Q?QcAdfX64E4C+SkrBcXXDvUVxcjkwnv64XjsHjFWtHbZP/s5DySsfknhjZaa/?=
	=?us-ascii?Q?Y2y0fmh09hkQZXlPRPy2LxsvyjUM968vHsiWDFcuxOlKJpd1wGi1YVDlmHrV?=
	=?us-ascii?Q?jwa/4CyBaE1LcFoPfsGJAB6b5PF4S/HqT+GHanlz3lYlw062qMHqFbQ7Bp8r?=
	=?us-ascii?Q?wef/kXYhTwxcLbyzjzn1P+ngcKK1vyhiURiHK/QSGn1nxHR/bDuFNg6IfkP0?=
	=?us-ascii?Q?WQ64EKIbdypdbPBh1hLV5wTmOmQ0uWP8koPoJYVpeUNGCi0OQrhC4NrCfbfU?=
	=?us-ascii?Q?hXSL2fY0OPAu9DGp/JE5ZjOvH3wYPZYVPjgUrOMRj7T9SXpV2MFFNvzL1+tx?=
	=?us-ascii?Q?qCBHx9/JaBV5Rl0UfIng2+IqIBlF3x7G5uzUp2CG/JRjNiqAVuatK7FeDQ2x?=
	=?us-ascii?Q?ycbq7OtFOXKSaszHn79iykMxzg7y3FBkpRpCb9SRzlCTVa+ZM4TsHnlese8Z?=
	=?us-ascii?Q?RYOPaFesL6MKqFH2mlvy4WYlkQLxKaklTB3rQFYQN6npTsU361KdZsnCIUdz?=
	=?us-ascii?Q?kcVJMZW/AwMlde7USpmaZWpb09FVP5tDh6UxZdd67cgU7z1qukr91omkN+tX?=
	=?us-ascii?Q?cxvkw=3D=3D?=
X-Microsoft-Antispam-Message-Info: KM0hZ/ayhfvN1cchvDLVBEOllwuhlle62xXj/uhE/6ETAy6gDZNYuRZyvaPg56FwelBB01gjAuf8yfbNPFnIvbvjbLYpRhouVLELNSBW710S80mJnQllrMrNIybPcvSWmBs/VYt4pyx4u9SL6gTogNaBzrn7mZ3UN4xgQ+qPNzWPKKwwEpLWzsxmyPKEiELVMprjLXUeS16XqSXh5TPiVKoylssw09ZesV0kfssFkzoPXlp9X9WHZ+HModZFpQOQZVoH/W3CU3lU5jv6R1+cv8QV9g+im++EmSn4RVYBiNhccedyjMOt99e4m0sjhrVkXKDMcUDwE0m08kMGuXEnk1ONB4ueJvBObnlA1t2/KTc=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4451;
	6:z1QSvH70xVGtqeFCjtY3vBIesvRWpaLsaV6wLLQhqucxrEOcs7DuZtw1Ie7Qar0Hs2lRQpd/ZEJNXu7+lcwXbpcOfsYY4jJh2jurhDOlRWhnC+3IYtUOhCbVkKfLsuTw1jaP/UGzqklMApoLX4m/JMax1kOu1VEG0ieJv/KGS3YacZlvkET7oqa+yI4UHc5YlLyI7ckkCtRKmZG1vwsPk0Gr4T9JcIzugr3YYvBlHVXmFWW+7zt7jEGJtcKm35tdAVC8WWN8rOQuuGygDRjsG5QgKF9EY/un9Xy41AnxLqMC72EKREMtDS21vBp8O/Ap6YqC9dlI/PiKkg0nPCA11nR8LzwEScydkYujQmoAYEvo5DCtwel3Aju7+B5swINDTWGWWaU72STioHWIjWCewoPATAIFm7ynbmZIMKIMDVTCqGeyVzXfXJr2xBqVP78uNWjo7UoLDpRDmFqIktbtdQ==;
	5:QEj8pM7RwWz06SbNuVRPMzazTfmL0DjABHvasXTT9ZzeBi4Xwc1uIYzvDIlBwFhZCTNTQmmMHCrAkW+TKYZg+0cWYaKH9UeXBSwGFMHVOpadDeXfO+XPTLWSue8k2MRvPbpJlvlqw1nYudOLq9s+v6lo45m1HK91ZmNjCbGkBOU=;
	7:zTzEtkrkxU7f6kCnl8z3pCAPsqxJqU5iF/XIYU5QF+78gQb47DLizJaAzP5vXUQeD9siIyebCngkjjEKQaJJIP6f1D+YHd6NNJ1Z7TBRUb0Pg4+MKW6/P4BBkXHoRN4yXDBSig9F9CsGRumTyR0cij1mnfMmL1d+Qkfhr2Spqn5VKXZpIz2hTv6hMk5sAXKtWdH0BAZE+KSvNOUaOxsFx2GpWUb5LZUcl9Fg1Cf7PLfJKB4RnyEKQz6wLgSyzBrC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2018 11:32:04.8592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f26cffa-57d1-4a43-7093-08d63811fe62
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4451
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.68.80
Subject: Re: [Qemu-devel] [PATCH v3 3/4] hw/arm: versal: Add a model of
 Xilinx Versal SoC
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4G76X8zan41

On Sun, Oct 21, 2018 at 10:25:28PM +0100, Peter Maydell wrote:
> On 21 October 2018 at 20:24, Edgar E. Iglesias
> <edgar.iglesias@xilinx.com> wrote:
> > On Fri, Oct 19, 2018 at 03:18:24PM +0100, Peter Maydell wrote:
> >> On 17 October 2018 at 22:39, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >> >
> >> > Add a model of Xilinx Versal SoC.
> >> >
> >> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >> > ---
> >> >  default-configs/aarch64-softmmu.mak |   1 +
> >> >  hw/arm/Makefile.objs                |   1 +
> >> >  hw/arm/xlnx-versal.c                | 324 ++++++++++++++++++++++++++++
> >> >  include/hw/arm/xlnx-versal.h        | 122 +++++++++++
> >> >  4 files changed, 448 insertions(+)
> >> >  create mode 100644 hw/arm/xlnx-versal.c
> >> >  create mode 100644 include/hw/arm/xlnx-versal.h
> >>
> >> > +    if (!kvm_irqchip_in_kernel()) {
> >> > +        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
> >> > +    }
> >>
> >> Do you really support KVM for this board/SoC ?
> >>
> >
> >
> > I haven't tried yet, so probably not, but KVM is something we'd like to support further down the road...
> > If you prefer, we can remove this kvm specific check for now though.
> 
> I think there's other things you need to do to support KVM
> (for instance, you need to disable EL2 and EL3 on all the CPUs,
> and you need to either handle a GICv2 or error out properly
> if the host system doesn't have a GICv3), so maybe it would
> be better to add support properly later. This isn't a subtle
> check we'll forget to add in later either -- if you set
> has-security-extensions on a KVM GICv3 then the device will
> fail its 'realize' method with a suitable error.

Thanks, yes, we can do that later. I'll remove this check for now.

> 
> ...which leads me to notice that here:
> 
> +    object_property_set_bool(OBJECT(&s->fpd.apu.gic), true, "realized", errp);
> 
> we capture the possible error from realize in errp, but we
> don't actually check whether it failed, so the rest of the
> function will plough ahead and try to wire up IRQs and
> MemoryRegions that won't have been created.

Thanks, I'll fix that in the next version!

Cheers,
Edgar
