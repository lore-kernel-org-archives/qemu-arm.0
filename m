Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp195293wrw;
        Fri, 16 Nov 2018 02:17:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5ciZLO8lUOMcxk+1deRrdQEHlPdRbOdqMmvnDhIjWEDbShO33sjxXPET6IedOQZZ062JV6A
X-Received: by 2002:a0c:da86:: with SMTP id z6mr9738659qvj.84.1542363475795;
        Fri, 16 Nov 2018 02:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363475; cv=none;
        d=google.com; s=arc-20160816;
        b=JcjziFs0Q1PZNyLZ61cJZYEfehUOVqKw4pjgHPtg3TB7CRTdXu+XQHvXcoEogAfxlH
         Q14t0geMJXCEDIFE0u2D2K3plvr90SrSvT/VSG/B62FDtgMdnFh0TTYmGEIA1rXVQ+Jh
         tDy1wo7A7w05WNSApNEEx6Jqcp8t7VCMIiRaDfGBzh43HdaxwQs+rQLDAH6NEeerz3vK
         4JKB7SYt7xVSG0QUk4jA+UPTTA5n4mC23ejxZ7SfQZLAukQxVHY+VkqeJp9WTzxMR1cx
         2mtTmkJlmjr9zvZcfPBCRmrZvG9YP3SY/1IRnWBwo3iUkPp6FIY0vnskj4vsdRBBlWE0
         /mcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=Eg8YSO3uil3a5YtEuFqaoxOF1aSvrShlX0tiBeXIVVM=;
        b=x8BPmBY9IhOmYBAZ6u/vUDabRHE58a0pbWTWlj/ww1AdaZEF9oL7xvOseSVhuK5qH8
         IHZWQX2NxCEQmW1ugFJQ8QEYMfRx13LqWE1a8vguxU3aI8pV9ARvMRRr+mId+givyRz5
         CFfGK25cTXghqglGPQmjQZQwg6a+ZPXafFSNTCW1oLLmaV0MwvArTyB3QqGvpmK6c/VL
         AOhkHv6nG5/YbW8+KNre4AF0gGq/QNgc857wGiPcngQTQwWIXK+rLWe7ubU8we/7UCwI
         0Jj9G17ilkY3Fy00qtGIIhqX/AHWytgnKbSid0Ql9oPsTQWvQihcBTi40NS7HD0vUzv/
         MNHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=MLjGWMhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10si1815797qkm.38.2018.11.16.02.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=MLjGWMhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNbCF-0002sZ-5d
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:17:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb8S-0000Le-VG
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:14:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb8O-0005Qu-VU
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:14:00 -0500
Received: from mail-eopbgr790071.outbound.protection.outlook.com
	([40.107.79.71]:63474
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb8O-0005QD-Kx; Fri, 16 Nov 2018 05:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Eg8YSO3uil3a5YtEuFqaoxOF1aSvrShlX0tiBeXIVVM=;
	b=MLjGWMhqvhgG/4JZ1kVwuUKn9OAuegFla/L6oARm1tdbW6HfwlgTR+k/Vd686yOQgwk++QXrXaSkbkDHcyJvSm6rgMlQV7TLiJvYAYh1nvH5IemRGoawfgf6glLSc+wU1BjZGVzXBx9VQ63cVixWH+wwsby3ekyGOb2x1ZuwEkc=
Received: from MWHPR02CA0032.namprd02.prod.outlook.com (2603:10b6:301:60::21)
	by SN6PR02MB4464.namprd02.prod.outlook.com (2603:10b6:805:a8::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.30;
	Fri, 16 Nov 2018 10:13:53 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by MWHPR02CA0032.outlook.office365.com
	(2603:10b6:301:60::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.20 via
	Frontend Transport; Fri, 16 Nov 2018 10:13:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:13:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53419
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb8K-0002xk-AS; Fri, 16 Nov 2018 02:13:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb8F-0007UY-6n; Fri, 16 Nov 2018 02:13:47 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGADdDb024936; Fri, 16 Nov 2018 02:13:39 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb87-0007TR-83; Fri, 16 Nov 2018 02:13:39 -0800
Date: Fri, 16 Nov 2018 11:13:38 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101338.GW7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-14-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181115094207.22846-14-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(438002)(199004)(189003)(46406003)(356004)(33716001)(305945005)(50466002)(97756001)(8936002)(8676002)(106466001)(2906002)(58126008)(81156014)(1076002)(63266004)(229853002)(126002)(11346002)(336012)(5660300001)(16586007)(316002)(426003)(54906003)(186003)(446003)(476003)(6916009)(486006)(77096007)(81166006)(36386004)(9786002)(23726003)(6246003)(9686003)(47776003)(33656002)(4326008)(26005)(478600001)(106002)(14444005)(5024004)(76176011)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4464; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT052;
	1:vaMzIkmKEuRIajfTvCoWuRwJqUgrSsVQ7XW1YVEMjvWdgKRms2Y9uSB/VF9Lm5R3bkG6RDHN4MniVDNg0jXHFQt2pKkeewKl8VTSk/vIYHjE9U7LFEigNrnbYh0MQEBx
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c4e37ad-5992-42ed-9077-08d64bac35f5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(4534185)(4627221)(201703031133081)(201702281549075)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4464; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	3:rA3FKYmhC1W+o+mkVFxuGP9UZRaeX0xm4xIGdKcyydutXfDtOdX2dTF0XVGIKy0dS6QIsCWI0+oMCSZToUCgM5NhPtqistnerYGZjZ8C3X/UUAV7kShcGzcaPGpIqXMqO1KdTi3xhWYcI4F5PHxHbEYzjVYRHDCBy555AFYGWgBGgnVJvxgyFD/1hja2/SDdmyJyTXalsqap4qoO2ktRHjXembRYDWBllrx8o9lS0vBZczEM7PU2xTlhWXitS4zx12ndlnl+KHhhKGGIjVwCNvb96nXpvFlyQQ5K2AFHUi0pd5RwFBRM5PdrGD+kjizDYV9jTHyrFNLt6RhfilKhW/6VartQ5uAXj0WV/Ov+PSY=;
	25:5dipVLCdgDQITbm94OXIPkglUxyWaLRLUBxZ9ic9rpXDQ0PBe2M8twHdY38zIEpbUAHPybhRBoEhKppOEWL2kmX0+ZRy9NLX2nQ8gfX/olw4+yKenqiEg01JEgnU/InEql1lJGTX8FZv6pNeTYM9Ao991jhJOoUsLM9QZ13MhIYhqXX098Uc12TNHsLom0k2QNxgCin/3WNjc/xIqduPvkMeNatm5h3/janHs5yCACO7egymfW75854nKuv/ivUT/TPE+6AucyWXcM0odRptgR6tMyNhWy3sXmqogirKERyJGIHlm+YPzpaQLyN4BOWssIzMNKyo/zWcnWV+Cp/SkA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4464:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	31:AUoZzs2aURjjm2g6IKSNvj2msF+1c3W9Ws8poyZm+sNxHl81OyJeF61+cg00zdDIjNpCau73aS86LubvFN7UKIIlfBa2n1HDjCX++v6GQ4pKAbl9ezYHE07snanYt/+n8pL1+ZqecoIiOVo5GmAJ09cYdTYz2IVtrXwDdQfSykGy7tKfgG6EnWiez7+ZeFwQh0Di6+ri+4ZHmFLAgxGVc45DYPs9DfB05N5EaH5VDls=;
	20:q+Lm1ELBvx7QEopxyQU2kmFCz1EWorTMDd39m8kmQvPxe/mojQZeXRMhJihwpRQdxbIuSz/B6mICWFwJfXSxv40CXLUTmspfDBXibH4vB8Coovipxlyx9nmicyhYxFeGNGFHP6UjyuRYOXM1UjEr6VnGg9euOCzGZkVrUtXorVkClT4kBx+CUiBkBU7NMjgjVVwVeSrh7uVm5M7uGjHF7Z4TiSWqOxRWY3vZSq84GpdJ4lWlvXfUKKzywS2mcOGHsNU8hRa63POPc/cZWg4dpQF9FJ9nc1OH3ByM7nyJ7I9Ug8m9Pzre6RWhY17CeYfXohmHUdcSj/oXZFC1nKmIUxP61/rWjMv//RMLYEs/vTQX6IoX7CUoCSFmBJE3J7UgM2tZtS544immGz3hnIFanyeowN6lax+k+3pPDTJn2+NH1KUKZK6Y525GB5sg1QmkkYs3skF1Fklg9bqcA5Ka9MIilTTT8bqVMYXhmWCTRGGnSxrTLGWVxJYKkvREb6l+
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB446486C5DB4AFA5E2203960CABDD0@SN6PR02MB4464.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231415)(944501410)(52105112)(93006095)(93004095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4464; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4464; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	4:VZ+GZ8puvuzC49ErfGYjsZMDkSD1TPBmb/x5Qa5VOu5k+KRgMOKpNHg/Zc39cLSBrROXgscQruWy9D5vxhHesMs/O0B0nIMbQkjdJdVudGzl77LGw8dExZ10eZUml4dUzWhoLf3AFUlXK7dD4bH/jQyRLL3MO4JkmyHKLfK6729NXmvMl3/KgqlZuTRhXX8uaMsfiJP6cYZvCEMwwT+7g7nRSgyLV2cyYFFga1T0l6qBELoq1DA8lZC79Vw2WFyR/NXEO5CnR8Jw7Svidp61zg2UFcVvVB0CoW5KuAcA5sRk5DNKQ9luuRGwwYQIYz2j
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4464;
	23:DhCgHVSVllJy4EmBMUJGsJFBgm18De45CsJEmDLWT?=
	=?us-ascii?Q?SjLKkomupJehBjqks2wcoV0HgAvQ7e9FtaTSs9BErHEYFTeDF8vs+r3dHfMd?=
	=?us-ascii?Q?yAKWHs9Q9E83sCIql3v8nCf4gzc9ldE8tTzwPwR9imvHiRDenco/xBsvou80?=
	=?us-ascii?Q?KE+Zt5TmES8hDyfW/5romsUfZwA6x4mzEvvLk06JPF5VHnasa4Yu8nHXgGfz?=
	=?us-ascii?Q?VFrxRYQzSd3RXEFX4OLV9n8nVAnm13dyYXjmYNr4imUEqjO2U2fR3kjLe2fX?=
	=?us-ascii?Q?PpYCor29aZPlZgoaNp4M/M+l/dJsOQ2P/oSwE7O3F6qsHfqm+qsS/XpVTt4Y?=
	=?us-ascii?Q?bQnMZvSYtUQa7lWadPKa/zFAE6ReVSlS+D4/XLxSdHG12/pNbJsJGjVSHppo?=
	=?us-ascii?Q?fOeSZzGQ9AeqgmiCp7lwcDRs8hc2SiUw23SdIEJlQqP+odJtidHL6LSv2f8O?=
	=?us-ascii?Q?Iul7lOhgYg5tHOYMcWihTuwCZcUkzr+mT8xZimSgYRlxiBF884/1RZ9pjywt?=
	=?us-ascii?Q?uTQKWG/0JptfUVvLiywAg79bl4d2a0WZyOw0GkiZ4gspykEySnOCauLv56F3?=
	=?us-ascii?Q?oXthxaCdo7Lv3efJytgbrZexdKg5To2HgzOQfnHrNjlwICaC6OIcSa6z/F+N?=
	=?us-ascii?Q?Qx1gXklrlMt2vdvSv22QrJt3PFsT1z4JEJkDwV1/JZt6E/bwSfKHNrUfYqbK?=
	=?us-ascii?Q?J7w55VIBOdW876MyF2Zl9W5k2mpWIJXE6/nDFDYXDCFJEvcukmX58xWsYKKq?=
	=?us-ascii?Q?3B7ftH5wpdW24pv/5wKHqdTnqQJTlXiXlXwzrHKukqUUFIjB0T4U83FTUirX?=
	=?us-ascii?Q?UUD2Lqu1nOkvXGq3qCKecKPMS61AClAHhA16rDHnip4Qjbns91Kx7TzuPNun?=
	=?us-ascii?Q?nHhKRIN/r3Hh8pmm4ipYXZ3uInVqbHBZaCvzl7Vosodfv+qtoroJNzBU8T/C?=
	=?us-ascii?Q?eg5QT+D7qw98THgM6rnnmGb1RKpYroommwybFoDrwDBQWuYKR4pU6Kx/Zdfy?=
	=?us-ascii?Q?kiK0DZMkk6YD4q1q10oz1EKHvfeAqJn7jO0VhADODjWBORcyD+scecnxIXSV?=
	=?us-ascii?Q?Sr8h6WioGghu3ZxByr81UrzFb6eKSZ6X107kzqlZP0uHPSsddN77zNMAeokC?=
	=?us-ascii?Q?gQQx+TilHeh12PW3zDY8R34L7oOJPjvsMNHdgmht/2fnCVV0D7fOqmXR8fc4?=
	=?us-ascii?Q?eGSCweXED7kaW/zBYbTJScFniWsidvE/6w1CFzGvP9+7a/pi4uOA7eV5clQN?=
	=?us-ascii?Q?pdErTBAK9zg4Fl9Rwa/QHoc4f0aYBrT0hhx09q9?=
X-Microsoft-Antispam-Message-Info: 8Xdr7jqyFGWKw3g1CVNWvqH2OyR5dwR1WEc579tfES5Hkd1lWOM0FlCTnMkkC8IJZBuGG1V3+doZ5KAD4Z7Kjd3J0gvMO83sV4mcx7lALmiwUrc0A67e2Irre3U8/p7ge8VFdlc55BmjP8hSfKyl8O9Gj+w+4dQyZkJpNoEtdzG1kjlHn25K2b9PpUiVOXqFJ/C0XHt+yLP3jshVNIdPtzwGbRMqAzLQbZqVuQ8tM91h6PYInl3ZUvZeWOjUIIXtSVuygLDovjQWcnV3h73FcMoZfyTGMmh6/lm53n2q8TY0Jtm2LjfiXm+7nSUX/Z4B7ezuKiy0v90GLh/VeTk1o+JoeJGdrp4fwR464nUrswo=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	6:XoAQ3HMM2mWb07PLJ9rBjy0Bi8nn4NEY8aJvOCzW5DyZ2fkXnDduo+1LfEc4UkhpN7j+UR/EshMyn4RjkHaLVbatR8tnT/pclTZ7fseu84gn8NoeX+6lA1EjooX7+Al4RC+IWO/xBEJOmbHq699skYOsUq77jWMdI9n7Qg/R9ZIT69qKJaCzE0d3HyikGi32Hy6+LKw0lrpBobnYQCpZEWvIZMSXduULAlG75+HV4UPu25o53YXsPFVpF2Yri/KD/XfGX76K1F/KrLO1kFGxLphxtfXW7npOAhIP4/k4MMoNgQnmrdNSXeFQ351nef16FUaUyaavy19M53o+QCoBFtBJBpOvuoLGCcDGe5IrpXedW8Vbf9jQVZ6WQWobraHioNoyfKnGRxpxFNv2V5uVlauu4rPcSfRN1IEnpx5JyercIos5uWjCgtPCHagoZPQoSOODytMOBIddR+JezxxQ5w==;
	5:w/rB/aeWb4FJ+0530rK9abM7VDZ3shGry3Ll6rzZaTHkn79zyjM1TrJDGtma7aqmrKaIoTfq7s+lFFyTAdRa3mHrEq27cRDFKhtQgs9ztaGVkUzgmbaxQMYE+TCahZpl8rG9CZsZNjUEAYpuOnqfTUK11GaxHiTELtuDhgUwi28=;
	7:aw2JQ6UE02wdVyqBBO2kIWD7Ipe5WAvqYvzT0lPyXtkj7IHSVZAb+1F4M6XcRZXjVHrYkqcbLMmnT6A38ruF+P+K0/iyhlM3gC84amvd9IB2gnCWep1Ogdu4xb0ROBI9aXIN6RAWQ2hpfgbeUBW+0A==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:13:52.7653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4e37ad-5992-42ed-9077-08d64bac35f5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4464
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.79.71
Subject: Re: [Qemu-arm] [PATCH v6 13/16] gdbstub: processes initialization
 on new peer connection
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
X-TUID: TVE8o0mLn0d2

On Thu, Nov 15, 2018 at 10:42:04AM +0100, Luc Michel wrote:
> When a new connection is established, we set the first process to be
> attached, and the others detached. The first CPU of the first process
> is selected as the current CPU.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 0427d1c4f0..59eed3b878 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2245,13 +2245,14 @@ static bool gdb_accept(void)
>          close(fd);
>          return false;
>      }
>  
>      s = g_malloc0(sizeof(GDBState));
> -    s->c_cpu = first_cpu;
> -    s->g_cpu = first_cpu;
>      create_unique_process(s);
> +    s->processes[0].attached = true;
> +    s->c_cpu = gdb_first_cpu(s);
> +    s->g_cpu = s->c_cpu;
>      s->fd = fd;
>      gdb_has_xml = false;
>  
>      gdbserver_state = s;
>      return true;
> @@ -2333,12 +2334,23 @@ static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
>      }
>  }
>  
>  static void gdb_chr_event(void *opaque, int event)
>  {
> +    int i;
> +    GDBState *s = (GDBState *) opaque;
> +
>      switch (event) {
>      case CHR_EVENT_OPENED:
> +        /* Start with first process attached, others detached */
> +        for (i = 0; i < s->process_num; i++) {
> +            s->processes[i].attached = !i;
> +        }
> +
> +        s->c_cpu = gdb_first_cpu(s);
> +        s->g_cpu = s->c_cpu;
> +
>          vm_stop(RUN_STATE_PAUSED);
>          gdb_has_xml = false;
>          break;
>      default:
>          break;
> @@ -2524,19 +2536,17 @@ int gdbserver_start(const char *device)
>          mon_chr = s->mon_chr;
>          cleanup_processes(s);
>          memset(s, 0, sizeof(GDBState));
>          s->mon_chr = mon_chr;
>      }
> -    s->c_cpu = first_cpu;
> -    s->g_cpu = first_cpu;
>  
>      create_processes(s);
>  
>      if (chr) {
>          qemu_chr_fe_init(&s->chr, chr, &error_abort);
>          qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
> -                                 gdb_chr_event, NULL, NULL, NULL, true);
> +                                 gdb_chr_event, NULL, s, NULL, true);
>      }
>      s->state = chr ? RS_IDLE : RS_INACTIVE;
>      s->mon_chr = mon_chr;
>      s->current_syscall_cb = NULL;
>  
> -- 
> 2.19.1
> 
