Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp189067wrw;
        Fri, 16 Nov 2018 02:11:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5cd+zI5zGFl4jDJYGwkGtO+oKx9idcocKlFLH2Q17YXzPXZV5hrB+DQzPksCMmfPikppmGT
X-Received: by 2002:ac8:169b:: with SMTP id r27mr9250383qtj.23.1542363087804;
        Fri, 16 Nov 2018 02:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363087; cv=none;
        d=google.com; s=arc-20160816;
        b=GSAwtkGPalT1vRcqf55iZZP4e6vMR/oWHFzW1FzscnIUjV0aGSiLHY0GRQgge6vQDV
         M7eg9nzCgs7P0Az2xybG2MQogvdKzqMcm99YbjqCJaIQ3Dik5dbccQbx4IEaNjVqkuYA
         tPNO8eY1eOBvrlDmhhX72hIIvrDJuT1jQpvn1Jg/GdKCkAkiX3taFql5it66c7QawQZK
         iO1mDVbljootov+2pWqmsEu6QQd6q6j8gU2bTciICpWYjt2jIXQmJJwxjKnjDGSyviz1
         XC0b7dmfXTMmZN2kRUz1IECaqLIv3hbXPGCM/o1n5GJHFv80sBTlgkWEOhCtzTSGAYuM
         Q+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=idq1bHNR+6+a3XwQvhTn+2TQ6fOVOdccqKYqzCtMXew=;
        b=jOhMsdQG1OYyWqKckJp2jRlH+ScYXeEX13Bdz5+XQmfLyJN1fl/J2AeUAGZ6xcSnaZ
         zo5N8Q7jOzm+gqCga9GIGO+1YCMhkG0omrj9/OI00hpbmDUfPIkjDF6Xrm/3g3e30Co6
         FRT90FlQFlndmUpujAC1pUYk1IYa38dHPzKI43DC03cQW5/Ade5iTZL41q7u2viC6Hfi
         SAkC4nUeHKxSJZyv8S84PtcnZpSc+LH/8rQrgYFhqrKy+ggUU8vbcIDPg1+uxRClIv0z
         uvY1jOfDWtPT7HWDGPATpGwOOKE+iI0sqbrLKof37G5vW+HIr828h+oFkwnLz8hO6Kzh
         RaVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=uV2wZnsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si45566qvm.35.2018.11.16.02.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=uV2wZnsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb5z-0006ZQ-AP
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:11:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb5l-0006WH-Ef
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:11:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb5g-0003wR-Iv
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:11:13 -0500
Received: from mail-eopbgr690062.outbound.protection.outlook.com
	([40.107.69.62]:31357
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb5f-0003qn-SD; Fri, 16 Nov 2018 05:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=idq1bHNR+6+a3XwQvhTn+2TQ6fOVOdccqKYqzCtMXew=;
	b=uV2wZnsSu1AlIj82b1/Mbt1sb9Gqq17lCA9MZbcWiBpb/W3m7ULdlj51Rqm416bsmyw7mvUSWXeV7iKcZAr0UL3OB8ymBruN32jGteXB/FJv5ZYyC+/UQNROAYUadh1A4YRD2XwIGDaJomR/stsx/n9MNPwC+DNqUWYpmdnuFaE=
Received: from BN6PR02CA0105.namprd02.prod.outlook.com (2603:10b6:405:60::46)
	by DM6PR02MB4460.namprd02.prod.outlook.com (2603:10b6:5:29::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.25;
	Fri, 16 Nov 2018 10:11:03 +0000
Received: from SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BN6PR02CA0105.outlook.office365.com
	(2603:10b6:405:60::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 10:11:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT010.mail.protection.outlook.com (10.152.72.86) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:11:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50028
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb5Z-0002wf-IG; Fri, 16 Nov 2018 02:11:01 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb5U-0006q4-Es; Fri, 16 Nov 2018 02:10:56 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGAAkWN022953; Fri, 16 Nov 2018 02:10:46 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb5J-0006p9-Lr; Fri, 16 Nov 2018 02:10:46 -0800
Date: Fri, 16 Nov 2018 11:10:44 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101044.GU7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-12-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181115094207.22846-12-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(396003)(136003)(346002)(39850400004)(2980300002)(438002)(199004)(189003)(81166006)(5660300001)(8676002)(47776003)(81156014)(8936002)(76176011)(356004)(486006)(9786002)(476003)(126002)(46406003)(446003)(11346002)(9686003)(478600001)(97756001)(426003)(6246003)(106002)(336012)(33716001)(229853002)(36386004)(23726003)(16586007)(58126008)(316002)(1076002)(2906002)(305945005)(6916009)(186003)(63266004)(26005)(50466002)(54906003)(33656002)(4326008)(575784001)(77096007)(106466001)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4460; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT010;
	1:klfTQiLAi+ArKgoXB+9SrKT2apFs0WuOGU9pKnSKmyEamWNaN8Fp+yctNM25q0FF2nHcayHTvPwJ2PuGiouIfJSIVzsZ3WnIo7+QlkP68pGJ9LAd9sJKiCSyalrmCQ6c
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42cfa47c-c623-4596-cc97-08d64babd023
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:DM6PR02MB4460; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	3:7xnKMt4yF/ZbWfSxG6DCDCiFb+rwb8EXD2Segv0RQr0EjfMSGwoagCRmujWlEh9+AJtP0tlLA7pPQ3F22wcIEwYsCLmORqEjtvDB0+SL7Qor605psmCj2YX8NMVN3xdzEzEkkNyTte0J++Ve8jYhUtAk/brrtkYAwlsXTJErHd7TRji75FQoCx0PVIxDe2DHz7hhwgVnBRo+OODZpDwpv2M4KkdmBwk9M2Rhuj5g0m3M22ZuhCLIv2TMqOR0pTh31Q2CLUB7GN0wgYgRKRo8+Zjrt+/faaBNZ+Sqe3B1iVEKbQvccSkFmIBihNSzcRidyKLOzE/z5lpnjI0e5M9/R3jn86M44E7+DMRcGqlgU3o=;
	25:NNaCM3TIUMcQeqrnr++hncVi5gp4+F6v2mQ42BasTKeLciTn3Y4LgUjwS57XWgI6rSF3NyBCu3QjUXOviO7db+6wil9ZULKdQZ0HhTKQw0pjUalpYcrMiljcwjH/gbx7awkrN2xx5W0rFTJLWkHCS5WBX4CmQBACmTRNMEeDUqEMzqKjJlUh8IJO6Y/FeVzmPiO2jOfyf+cLp+uAL8YC/JQ6mI9bHyj/DeHt/DwNURtCdcyhvfizrFU7+Q+WcugUJBLy0aAukN1vbI2dW0VJunWgxpVlFXeIhG8c2wkw5xfofZyK22f5s+ac15ngYorJAYwK07s88asqlJNJ2pwrtQ==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4460:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	31:sCd8f25QSlpcClBGIrlzwLfmWsloyvB1SkSFPUxpxOL2vTPg/Mw2HLm7LuOXnf/896Vs3vfUdVK4EDMdGROTT9p/VtETGqFELKmm4J7pfyfk/FzwAZ24XsHDjPXtMrHGmcLEzfK2jkseWJ9yf7zMPSsGit03tZ9FuOyKLlSEQUEoFJoivAmgSaWVKCHnUF+lsVVJpDMLMFyTzjbBev8X34xHoQB7U4T+RqFaDgvbpas=;
	20:rODxrcz5DV3AgLzq638Z964CMtD1yWvBMsoK1NlhH+lO+txWJ9S8wuGj8C3w0k3QBT6hRVPQzl8IcES/9roD8APsedUHvUgamSUomQmE/Xu2MFEl5Jvbd0Zzi1LN3efxN24t4c0boqUUH1BD5TRpA8lzNvYcgm9iL5zd3p+aTKaQ/QMnrsjFGsk/Rcw85zfW/OzJLFLNjRQ2BJFH7cEXfjlywhabbiP8ow8ayjMisV2lP7wuHta6ZT7GN8hlNzFnIlNIVlykCxBt1FvRcKdBWy9F3uBVPeUXBftFprvlkKryNJqYco4yyZSfMzY/NxQRmrjrk9pEsxRtAZBmgIM+kmTv8nR64d+MtdITep2bPUJIQGFUbyGq2gVm+YHOHPWoTtEU5l4InTzsbWJvnZ7gDfLEw6TYgnHHhnmBybqLzTmssx66fM5mr7MOGV8ZPf0ika6DXm1EYdYriOGBI8Oq8oMem+QqvpUmixBt5HTISE0ehEk5ReaT86xtxEX7WTwR
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4460C3E7EF076B0DB13DE6E3ABDD0@DM6PR02MB4460.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR02MB4460; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4460; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	4:SAA8rzo7/hoqbv5wsJm72RQ4SHG0j9EQwQaiKAUfDg/sVR2xdgCOBz+KDBvbtD2NTHuto+gR+BQEwBeR8chR21a11COt7txViEuXX+AvYV3YSGOu7lc9f9dxD2JB5P5wv5jQowFrZaJOBT0mwJ31EI9xpW/NuWxr9aDW+Nw1LFFJVGvhjYFwroVi1KUoYkzVsjZuAEVlvgTMShbZowBcmmM6hREDPAwsQprG9l0gLXT9vQaRH5ZduibnDP833yliuEYdPENyfIxxGSEyexYn+ARz6OEJ2dJMepzN9kGuPe2z/aA6WJ4lLeGrD9gU75Oo
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4460;
	23:jmMuyW5NGIYi9hiSIYWz8fxcZyQyN7+GpIF8M5el8?=
	=?us-ascii?Q?JB7iDE5Yqbg6piZAIrHTbE+5RsJA5UV2r4NowClXbL5/icFOxMGT5pGanids?=
	=?us-ascii?Q?e3gBw9PVl5C332D3NE0X1Ap0TvVL0tvpdFyIQxIKJ8hZ4Z3xWQk6t1Uja02+?=
	=?us-ascii?Q?WdTgl2JnvQzZ5mvg4FavAoiWopJN0jlIy4ZA6RiRuqoViUNtKE4ifJhPI9rL?=
	=?us-ascii?Q?4sWB43ru5mTqQpAH9tHAarCg/nn9od9cNFBFqK5dtM9iXL3NwE9VU0z2juCv?=
	=?us-ascii?Q?/6XcBC4Bi9Wb84a79QHXby0X4sxLo2AgFLqOemQXxAJQ5Dmer2FF1Bsrb8qk?=
	=?us-ascii?Q?rCwZvu/u9R7a9W/1Vc4ZlZNuCtlrylVr1o7twX08ermmdILZn9SoOLW/7cc+?=
	=?us-ascii?Q?wEBezYzYWWB8rstC3BfYd6c4FkxjmlJcXXBDOU7Y7j+RoljufYLK7P2+twsH?=
	=?us-ascii?Q?9/Tr+yWsCWfzm6AvED0dYqyAht5uPqMWVcwIDy5C6Dvj0OdAdSxoGXXQNkh7?=
	=?us-ascii?Q?06YiYjXuik2/VYsZIjTxArGOvZD1+rB2KOhwaX8aecKN+ezw+8WZxg/llnDD?=
	=?us-ascii?Q?SX2EyygSX7d0HzGkBXUYhwoRJN0vqvfuZKod9SnRND1emSxC0fMhhJqgIKxo?=
	=?us-ascii?Q?folOHDR0tJVrcTNf42yYG3CATJfreB4R0r2dlqv0YbH6tWQtqYspTzXnt/f4?=
	=?us-ascii?Q?ooQ0J5UPkqw1rUgp0LGoFPjIHz/f2go8WkjyBzK5ijz+PWEeu1DZd7vWbfDV?=
	=?us-ascii?Q?AlNOcYQclvqngsmBgwWNitOK9DtaSAI2CkK7cC21HlUC+L7OU9d+qY7Pmd/q?=
	=?us-ascii?Q?en3sB4zu+xxMR0T40vbwonCQtN+UzNB9oHWDS5BL9bSWDAXiHIYCAqitgkap?=
	=?us-ascii?Q?GvJBpuKB/ZeCanerhNn7GPfcSVpf2gXDw8hGAZH6yjU0DUmU0iVTN+O3uubG?=
	=?us-ascii?Q?EeRhYMn6Kes5RSpi7klXoPePy/Yr0ga9/xe9u+8W6a+lQnTc10Yud71gKd0X?=
	=?us-ascii?Q?lXOkoAP8mEJJsDK1lF4x54vZf/lZK2pWj1BmQw3k1+Q2NN7taKpkJwJrvJjz?=
	=?us-ascii?Q?zQf2abUWuICWfvP9f4ZtaVtdIaXq3oVq2Pt9m6LVqzQOXP/L+w/y/2j8+paR?=
	=?us-ascii?Q?oI4v8LMxDk8zZLcJHouYuCiDuwEBviRNArqeRSOwate8jISpINM2iC/SY1Nf?=
	=?us-ascii?Q?QxHaMiHWOkzZNJsZ989gUzqUTuZaNa5It/VSruYVDixE5yMUsJBU1hzlifcw?=
	=?us-ascii?Q?s4zyzhdEzGfD9zNlN4=3D?=
X-Microsoft-Antispam-Message-Info: Rugs5+LQXgyprIXhkJjPGXeuTf/mg4wBuT9GvUItHar7UhtO1jC14mMUAqEd04q+Eld9AfSxJLsR3C4yjif9PJeg9ue71gL+XHgbtVh4qOcTIwHgAEBOoVdSiz07bauqRVbtrHpvWQenKvNL1iLsdfO6n46UiAVNr3I22yxUl5XmatKOAwHvLf9bQC+RWI72sf6Ya9BKRF5UAQkTT5Fwsl1XTtonCQOcOlaHtyQKJeIdOiZVXQW4/YQJeLtMRipZTZgqnkiNP9X8X/tv28dbPwRT1N1qWSWcwWl2szhJbYmFCGfBxMjyVuKquPSkORTRdKX8j3s6dcv0pUYBLkDE7c+1bLzrnwVXCRiMJ+cekPU=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4460;
	6:UYV36Oe2pMJ0+JElD0jlypYZ8iY58yu3fuGlWqLTxGr8pqhEKKbP/UcWZuUNny6o57opKqbuXpJnvBz4KmNeuE8UxyGCRFTgbRNWUfwvupdtfFhptoRz+RA1mPdUC2tZun0ZxC2UMj0geFkoT83FqQzOyPk0KKisoPTZvVWqvQADOgid5JHUVCS/U6w6+oKIEHIPdL7mvcqxTfHJwa6BhgTsXKp1RcIJ9li5WGCTpUVuRcR1cGGtlxjYWZEd6VEIoR5smOajH2q42ofBnTKsMRtT0aoB3HdQ9+tocaH+vj9JF5wP/3jUgJ+MObzpzP3qU9ui/GPuGP7NU+cUFxfWRPbuqyMP7ftri3iPNsJ0kcovwqCwpTx3NO3mIsnuarYhUBTtQEvgBdy4pFt8j/BQdRBSHWAc9nvnlBKFImREN+jvRxFFFv9uyUD8VwSYqSmPwICBrA6NpShDo7j8FrxO5Q==;
	5:boEn5fao6jvIc3skwEARJlBzfOUkRn1in9MbsYAXjghbKayJ2g+bszr6qB/K2CaHdCh7G2rZO0cgYXrwxD7AjhskBJQLauaeYYBBW5RwabC0aVPstOWzBGzWKoRObSSCU2F5JuUVYDYDHC+TEU3XiIq9Lno4OHqIL1xbys/oib0=;
	7:tkW0Q7nMTemOOdTf0CtMgM5vmXvkRN7RjJH1tJICCzWn2I+qK8w0RD2eNyixCC5JjOW7jbhlXevNJSdz4xRVqfEyj9TBz6zHCD2FnJhrTN5XfiHWHxcSXIR2xuPw7h1X3Gtvg4CKZ5DUBWRX+/pbiw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:11:01.9407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cfa47c-c623-4596-cc97-08d64babd023
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4460
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.69.62
Subject: Re: [Qemu-arm] [PATCH v6 11/16] gdbstub: add support for extended
 mode packet
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
X-TUID: 4SkZ2Ixxtbic

On Thu, Nov 15, 2018 at 10:42:02AM +0100, Luc Michel wrote:
> Add support for the '!' extended mode packet. This is required for the
> multiprocess extension.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  gdbstub.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index eec1cf0d09..ada53ac559 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1294,10 +1294,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>      trace_gdbstub_io_command(line_buf);
>  
>      p = line_buf;
>      ch = *p++;
>      switch(ch) {
> +    case '!':
> +        put_packet(s, "OK");
> +        break;
>      case '?':
>          /* TODO: Make this return the correct value for user-mode.  */
>          snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
>                   gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>          put_packet(s, buf);
> -- 
> 2.19.1
> 
