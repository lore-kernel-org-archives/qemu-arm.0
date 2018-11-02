Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1989926wro;
        Fri, 2 Nov 2018 04:34:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dAue7sA+JuCcjx1EtuGUamNg1Zlz0AqCABlSDDibskIJEKy1fUPn7V1XAaZL/UajyTUCSs
X-Received: by 2002:ac8:668c:: with SMTP id d12mr10011485qtp.242.1541158494197;
        Fri, 02 Nov 2018 04:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541158494; cv=none;
        d=google.com; s=arc-20160816;
        b=ekIx7S7Eg1qtMoR5kx1hki7t1EANdnsy6SqPoKBfh4dtBKCDIx1UeKUwKmktfZUL82
         2TDsBt3oSvSiVqhSIo6pMC+FVOahlvymE1JkTuZ2m6r2jCiaaF7CWOkwe0CZbmM8fwXX
         PNMKqcd2Trbbx95NroTpjp8Uo6LOfdMoPChlOdIEMX1kv+01crevUqgQWeJWeFUWgqM2
         RXtToCVFVZBcSfVT4f70B2m0VXGLYrya38R3dPnaXOZlvkgJazN8M5k7AWhP86D8JjPp
         aFNjaZR+TpepO4DN2oFlAm7+NvkC9btR03NgrBZaS4lvIscCUhy193hCR4nbece0fNLf
         aBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=xCHpFnUW2ZCiAopxz8BwS83V/ALdANO59RP9o06Rt10=;
        b=UQUgkrh5v/E1nbly3PL4DrBoLPA/XxdxxO/A2kmLfPVfTBIIMI1Vynn9YQ2RHsbjgS
         8HkylpL7cQk3Se88Hy2jDtkNL0CB4uCIwJ9ksiuReZgOwbCTrh1gMDUI5L3ncZBj+E5V
         H//SVXIR9EiOwgy4mzXv+APK2mbd8wnip8ahuG5zclKllyoBw9Lp1U36ec2yK7kU5syV
         5WXtVvGX5KLx1VYmdzWxOA1i4Z9YXPfb6TKydfZjueab853SDWxN+C/lyY4K4egKhvv6
         zo2oNxJSUSYP217aRfN9zo2va/bpz5AW+nHKUykhPyRWFcASRvqVs2Qc3kSSZjEzDLcM
         ktWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="Un9Ojv/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5-v6si603969qtd.97.2018.11.02.04.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 04:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="Un9Ojv/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIXj3-0007Pr-8Y
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 07:34:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIXim-0007Pk-S8
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 07:34:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gIXiY-0002yV-TJ
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 07:34:28 -0400
Received: from mail-eopbgr710059.outbound.protection.outlook.com
	([40.107.71.59]:14395
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gIXiT-0002wI-4c; Fri, 02 Nov 2018 07:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xCHpFnUW2ZCiAopxz8BwS83V/ALdANO59RP9o06Rt10=;
	b=Un9Ojv/DnlgOZzBHXmLAndDUWghoFCsW+quirB5rkBWXUN1ea/bxs/uze9O0PGvSacKS3cgLmd6P0ekMbzKu6HVVxL7XV17+eQsgPx54NVOqeUaFN+x3x2tfhJenWs73/1Q9K9qpDC2nVvKt8rtf3EXTg6/JpFjKpNVj51IafV4=
Received: from MWHPR0201CA0006.namprd02.prod.outlook.com
	(2603:10b6:301:74::19) by SN4PR0201MB3518.namprd02.prod.outlook.com
	(2603:10b6:803:44::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1273.27;
	Fri, 2 Nov 2018 11:34:10 +0000
Received: from CY1NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by MWHPR0201CA0006.outlook.office365.com
	(2603:10b6:301:74::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.20 via
	Frontend Transport; Fri, 2 Nov 2018 11:34:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT029.mail.protection.outlook.com (10.152.75.143) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1294.14
	via Frontend Transport; Fri, 2 Nov 2018 11:34:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIXiK-00049p-RA; Fri, 02 Nov 2018 04:34:08 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIXiF-0004km-N1; Fri, 02 Nov 2018 04:34:03 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wA2BY0q8027169; Fri, 2 Nov 2018 04:34:01 -0700
Received: from [10.71.119.87] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gIXiB-0004jL-Oe; Fri, 02 Nov 2018 04:34:00 -0700
Date: Fri, 2 Nov 2018 12:33:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181102113356.GB866@toto>
References: <20181022173559.17111-1-edgar.iglesias@gmail.com>
	<20181022173559.17111-5-edgar.iglesias@gmail.com>
	<CAFEAcA_BGhqMiQGgF3TSXBXHacQf31emVTZv2tcr0Qo77bKcvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_BGhqMiQGgF3TSXBXHacQf31emVTZv2tcr0Qo77bKcvA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(438002)(55674003)(199004)(189003)(4326008)(54906003)(46406003)(186003)(1076002)(23726003)(336012)(426003)(97756001)(6666004)(39060400002)(305945005)(77096007)(53546011)(6246003)(106466001)(16586007)(8936002)(107886003)(478600001)(63266004)(33716001)(8676002)(26005)(316002)(5024004)(9686003)(81156014)(81166006)(36386004)(58126008)(33656002)(356004)(9786002)(7416002)(106002)(476003)(76176011)(6916009)(2906002)(486006)(446003)(126002)(47776003)(5660300001)(229853002)(50466002)(11346002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0201MB3518;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT029;
	1:9gRb/jgR07VRimsdgAm2gMN4em/6zklwFatjYyrBflgELAw/fyOSq/vvqTdPHfHK4wjyf4P9ZtNbdSlsYI7OEDgoL7H8vzdo8yiq8WH77NP/23ruJIJoeA17wxH36A36
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05d53233-f0cd-46dc-8d93-08d640b71b30
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN4PR0201MB3518; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	3:naacADQ2LGR+lQs0SHX3E+IvQ6kmDZVXR2FJOpgspkjqF8WpVnqOmS54E4LDlOKC65eOtCxWgnoeZkemhAZTiomfOcr6iwmBSUIjNFJmHZm/IT6eMPr+gA8iWrt4k42k9etlUWht2z4qWkV4e47ONp6NTQiZrFr9R26OoCBVwVggZOipttSuStrtGuBcaDTO+VJuytls4kTOWwkX/Q6IqC4049ru1irdeBn8UoelCwi/mi+/leqOeo2SLjCSFfn4+S++26RzaEJvaxIepCS+FiHapQbN6ZUs5DWtGispFb8E9aPhaJuXLRnruWV1BP+DuOxSHgi9FNbdXRqII9y+YOn9q72xq43w5KNYgdSl/2I=;
	25:9qo22Zxl1tVJ5dMfIAcMc7qbK9wbImTudAneDFgS7mwPGyC5jneqVqJKxHALSBGZJr3OU9uLL3Y81YPMeVi6y328x/ohgrwHmZRsnmUEx3+/1IWRD+AQVMI6lSdlVSoU2HMtHvfbW53Id5Hf1G81ntpsv7jKuk2WOJwZAvF/1uWYtP8m+orZN+j94iO7UdUcJVMiB+c4DubqOlX1jJ7GSxQ6F5ixrlryedrTCCrofBzW6+p411efMof2rW3Lx4it5FMo1J7j80+ltE4FJ1MorjVQpkpQyvcgS/tBaqnWW82Kagov+p9WJnoDjU6GEVQ0NyBdH27X/PCSw/3VxoYv5g==
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3518:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	31:LHoKCRloNItXtf/06Aww9UsSNHw77aCN0cDDItL36uEi5vx7wnp8AKOjzEWWSrUyALA1h3lrtqh/8LMAEW6+58JtX3ZOl7Qny26eNt25FmvshwtyyiGXdHiXZEWcParBEqfT+bCqdtY3uf/zri/Eu8BaCYJi+j7K4YCaB2cLyNbAZC14vpxznHjOxU9NtqlkZGqZ7sHkqUiQPRxGFry4aX5PPIOSnexlFDYu04Avbqo=;
	20:Wl0zSVCqPokY5J8WOaoXwRXUd9C5X2TH6GvZN3EPbpc+0nYGXDwsFxJHRmJYsmnW4N/226bfjPp+37NnVGsAdsJypjAw0fKCraZMmDl871FRPTDBFLArVk9PfpaSXjq5SEx8Kr+mrXUoFC8qkFrQEsL+U4GCrdusAam4L0NplKy+GgyHzTqpDrcgd+w1xGDQnMMsQ/9eBbXpQE5tT38N9uYYkHIiEn3ihtqAI6yKlCTI2m9HHJmYK8IvEJHzwkff8HE+RShHL3eDk1kRHug+LExLPIZ3Y8M+pd8dh8WRbopqXr+cBFVk8z+YKgeQZp+ZFh2hQw0v+VH1o9UZMvn5VQzRPFYHEv/NM87DBGKsbPzqgtTvFTvGcpXa2tJvu8bCrV/oNPWm4Q3qFf7+lH4w5tIDvA+2u1fHyZrL041o+Co4uIPWVegv+ZL/x1l7/6JvKwUJgMGQoTxC0WK2mZI8sWngT17KQhKOHZQJLiPJ8loNMt6CJVgyGMJVpWVxrU3B
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3518BF39C88BFD1169DB717EABCF0@SN4PR0201MB3518.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:SN4PR0201MB3518; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0201MB3518; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	4:iVYvRHfROsAk/+1707hc9sFIsJTg4Ui9ecpr3E9TivnV00Z6TrDoLfRVP5g06p7ZyWjqZNm/H+3wuJrKFu05JwrAVErSGJmCGS2Wh9VZkqs9P1Yb9kEkx533PRtmgj68JJ3LUoDuZ+/PUNIs/XGc4gAt/6z8abgrulsz1PMqOr/WQ0/leVmFcPVG5WybkQ+VRrYXHt0bFvWRoqPAqhv7ijI+S6FsU5E3wnW47OqjitmS2h/wwyOzL8a4rgK6BEDYSLWM22QBAjIf6Lbb/fGJfDeVtuoNKMhI3cF1Az8nDcKeOtnB3+t1quMrP/XetXhvUT5jlR2N/YWHHdV3ecJheg8No8hGBLJHDdV7ApJaywo=
X-Forefront-PRVS: 08444C7C87
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0201MB3518;
	23:X+SSomJkStF2Xe5Mmd2vhwbsfSAX88uCNnO+gD0?=
	=?us-ascii?Q?oI+9nQnrl7WXPdwaSW1MQCL6ZmXmVXfM74EGI5ZkYD60fchQnX5qKtu1tiso?=
	=?us-ascii?Q?SapxnFkWbdUZT95EIy7sP36IIdr8aBPvEn+ZBKaRc+Qqqghe64mH7tKOcqoX?=
	=?us-ascii?Q?Skoel9wN526GcW6Tc/airbI8e/0GDKqNMhjehMnwDSI0Hg9+87x+1v5Qk+pY?=
	=?us-ascii?Q?feaaVAc/XUs8jX+RI3yKt1n3azzzZyA7eDPguFMq/07Nbjuq9qxaGfW/pSR3?=
	=?us-ascii?Q?mhO2O2ctkzOfU/SoxLFTjK2Cx+CaUCdb5IlKBN0bflklx/3jrGZcW+KNVsB1?=
	=?us-ascii?Q?yUb0f+O3MF9RBaRc6gJgX7LyD0sM25AdDEinB0IcNc6r8Cukg6Q4FHmEFkEV?=
	=?us-ascii?Q?XifgQNUOwXrdQvBNAXsL64KUxt/R37chNZ5SkdvCY2nr+x20IqLcuCZlGgPC?=
	=?us-ascii?Q?paEp/aQ3IL5YJH4XPIX/Pn2+Rn2o0C9D7jhAePhIRB4tWN++ofN9RF14w/OF?=
	=?us-ascii?Q?Dw5+AR43pnfi8UoSvGc0/GSVtvhPb1GJKYlPPrCbxLJi253my6K2739S+4eQ?=
	=?us-ascii?Q?eHwrGV6hLPYiT012rfYckUtxvc3Wv/4fT1RU7nUf7NdmwxSXEkPZuTCv+XYX?=
	=?us-ascii?Q?z+dIVHkAexxoHpqS/shehINE2tw4b7GGRRpA/Z8g6IsgfvwKNagvV3BjI9IA?=
	=?us-ascii?Q?EdF4QZSDH9XFAPFisEGYLTlSAYgof7xJ8IvmqO39Wl+l2mXhVtoNTHds81Ct?=
	=?us-ascii?Q?5xnqyOqURhcgHU3N+cIpP3TrHqsKpLg05Vo0iDg7M2tPj3Qwe2UBCjDmAb2w?=
	=?us-ascii?Q?324fA/psugZt3zRZyGKJ14GJpGNb5qc8pVIsWmajnO8CIkdzsbYKbcw0FywH?=
	=?us-ascii?Q?E+D4e1M8A6etPIKxQ90lRDGxj6hhkWns7Hs4qSLxBwdaVPsqKGDEU/y2PS6x?=
	=?us-ascii?Q?MUbtKjmsxSJXGSaVwVtdKPDo7ivhpdh1K5Jaf7kpIceI6/Iq1jpmG4Apl+UI?=
	=?us-ascii?Q?pW99sXEWhcDgeoaPT9gLIy65we0Km6OH78rxDT6xEqbSIo0klBpZAKo7SZGK?=
	=?us-ascii?Q?rSstzLkCAsdHsQod5RuOkS6j6feYsDQXNPUUXYmxCRtHn3tz/aqZupzLv0ci?=
	=?us-ascii?Q?E44L2DUfzFK2Z4LvQJOimNaeipDSKOzFdjWZGsjiMrr4vDSV46ZKG+NJxFzn?=
	=?us-ascii?Q?CjZuobBWBhzRmZEl2ZmshUuzucFFy2jnS+6bGsUv1Uhu5R2lWUe6x1qbZf0N?=
	=?us-ascii?Q?5I1UPXjXzomYI0NQz7lh3eo2Yv3B0dWytXu7kLAg3IxEOPETHO7LV/VZwkm4?=
	=?us-ascii?Q?mmVT4J9q3S8PWTVufM5AiLJeEEO1uc6Ym94vaQ5yHb0BU?=
X-Microsoft-Antispam-Message-Info: tC5LO9brnlENM+PIgvDhl6Wb8HhU0duspiAvTi4eLVceT3QMDgUuka4JxYVvHScfyQ52bleZGZQmW/J5Bq9/jrcDZRNKEcjxdtyjT+0JcmzuLaoE0Be1+ZWOVR2k2jJu9S3J9PTJLqlaBOXpKKXF59qVsR0ycsev++Pq0LzvZfflE3rzfQcmpEEipPJC3N9t7WUWEfRIvhKUkk7w4c53eaFiXszOHjuJhcu4ANXXqmbr60do0PvILGTHPUMttuv/CJeNX9qDM85HzL/tRlQG382K1vhK9EHA4RKIeWzdry5QhQe5Oc7BEY6L6AEXLxJ4BllShlk7BQIPhvmdREg05uasBSMDGhSMmHamHWz8/oA=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0201MB3518;
	6:HnMqcs3Cs41gpjs4d+B5i2nXa9b+RIbMb4aKCS/N6oGSpQ34RsYl8y0UqpzyVxZyKdncYbzlR4UexM8218IVU2D0Zi1OPcAcHgq9YYoBRCPxeEnAjx0c9stLiyyTzXaD4pipYC/Dmz4rJsuhQaYQTQToPQhjbNi9di3R9mMoPXKpf+7/EC4Nr9pDGxWK9u1fJEiWJYW60/9pRwdYFtS8y5e1B4nHYfjfk+cNRtMNUrcUCrWg3xErZzvdp2bJK9KOfSr7CNO90V7FR/iCvGqwGqPvRA3j8RQ6sAem17OHNX00ppmeNfaWDpEg6vAWIDxunmDg/lLq4iNQDVVt5frkMw+21jpDS7hMvXcfRz2QR/zY3z5++DamQM0v/xtj+l610DxiveReQxJQhR4KHxzydkedt7Wqg5uK/yemJdrDsGAvCbjU1Sefx9tqgdt3BikYV5ppbE1K7rV6F3HCn1NbzQ==;
	5:f7Yexw8m8olKhYWjMDqnpmN6KGieDERL65TPH8PeAORuW4ifdDdmnhF6pnNGsdf2v0A/dD3GqgH0vBsTmQNPo2XQExNouF6iDy7mUzxhM5Qa/+uDFQs88/WpZ3BQNigT7QJ60PZQi52TxbDE/ZbvVa1WG7FwuTXsQ2NSDi/RSf0=;
	7:bqBGX0yYahttwz688ky1/Rsw3i9ZEmADs8sNSPTAXLRGiFqFNNsK1hOnrRSK595ZKsHc0qB4nPzIFWq5rL02IvGX6L9GrBDZFvIi0zJAdxZJkAxRcUcN+jgClRE9fHakCJOjU6rbpgzPUZWLVBp8hw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2018 11:34:09.2450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d53233-f0cd-46dc-8d93-08d640b71b30
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3518
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.59
Subject: Re: [Qemu-arm] [PATCH v4 4/4] hw/arm: versal: Add a virtual Xilinx
 Versal board
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
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oq4QUA1DPuor

On Tue, Oct 30, 2018 at 01:31:44PM +0000, Peter Maydell wrote:
> On 22 October 2018 at 18:35, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a virtual Xilinx Versal board.
> >
> > This board is based on the Xilinx Versal SoC. The exact
> > details of what peripherals are attached to this board
> > will remain in control of QEMU. QEMU will generate an
> > FDT on the fly for Linux and other software to auto-discover
> > peripherals.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> > +static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
> > +                                     uint32_t phandle)
> > +{
> > +    char *name = g_strdup_printf("%s/fixed-link", gemname);
> > +
> > +    qemu_fdt_add_subnode(s->fdt, name);
> > +    qemu_fdt_setprop_cell(s->fdt, name, "phandle", phandle);
> > +    qemu_fdt_setprop_cells(s->fdt, name, "full-duplex");
> 
> Hi. This fails to compile in a non-debug build:
> 
> In file included from /home/peter.maydell/qemu/hw/arm/xlnx-versal-virt.c:16:0:
> /home/peter.maydell/qemu/hw/arm/xlnx-versal-virt.c: In function
> 'fdt_add_fixed_link_nodes':
> /home/peter.maydell/qemu/include/sysemu/device_tree.h:110:23: error:
> comparison of unsigned expression < 0 is always false
> [-Werror=type-limits]
>          for (i = 0; i < ARRAY_SIZE(qdt_tmp); i++) {                           \
>                        ^
> /home/peter.maydell/qemu/hw/arm/xlnx-versal-virt.c:191:5: note: in
> expansion of macro 'qemu_fdt_setprop_cells'
>      qemu_fdt_setprop_cells(s->fdt, name, "full-duplex");
>      ^
> 
> because qemu_fdt_setprop_cells() requires you to provide
> at least one cell value for the property being set.
> What was the intention here ?

Hi Peter,

The intent was to set a boolean property without a value.
I'll fix this with the following and send a new version:
    qemu_fdt_setprop(s->fdt, name, "full-duplex", NULL, 0);

Cheers,
Edgar


> 
> 
> > +    qemu_fdt_setprop_cell(s->fdt, name, "speed", 1000);
> > +    g_free(name);
> > +}
> 
> In the meantime, I'm dropping the versal patches from
> target-arm.next.
> 
> thanks
> -- PMM
