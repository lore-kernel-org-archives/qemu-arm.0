Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2137361wrd;
        Tue, 21 Aug 2018 09:59:34 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxBNq3MqhIgSKl7SYseixtPzvYLjtLtEDyH9BfeSvl5UfUhDyc5mCx8uoEJgDmBy5aGr1UD
X-Received: by 2002:ac8:6647:: with SMTP id j7-v6mr49090628qtp.231.1534870774110;
        Tue, 21 Aug 2018 09:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534870774; cv=none;
        d=google.com; s=arc-20160816;
        b=ziMRdX/ttCaHpl5ycXG3I3msxq483rbTNzmMuHw/KXierljQ5j1ni0E5TBwnQU0BER
         mcGA9UDROAnLmAK+ygE7g+RlqO7qBqcKzPddsLZykE2vrsaxty11P6fP3lxAns2ukY2Q
         REMiVwJPlUhMvz3N4MtG7exkOnmq+8JXCkCf1rXmGa7IrhGhXNaY2dSVt/NXivMCNnrV
         vM0CWINMKYZwaXNZQ/HV4r4hB1l4EDNsdMsYDb4KWeXL8uf7GeY0O3lupnrxedHTijzQ
         BJLtzurFCN75xtw+JxkhZcUt51LgyO1e7nO1wqASVyoNoBE59NMcrTEPpNKW57uCiiDQ
         Qu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=tb3qcitCrSKAKghHB7VRALvsLL+DP8IOkVMBsXPi4YY=;
        b=VLJYDTyOhZBoB7GfQWwcRAQuDE4nXMtD+ShsG1QUi64hlQbiwvyjQrVP0jcFqwWB7p
         DsgfgCk+3CqAeM4KfR+aJeIOLsKoNfR/8FCOF/GxefXKxmeHbM745d0+loVc6ohY/oen
         1cWj7V+ykWjbWxZwgOYb3inx9/jGm5/6w2y+VBGah7Qgxjqxz/m7AF/fzUGcfh9piALg
         t2CShAdMOmTyJ99m2U8jEIN0pn3UX3hPqS8pqVdGCVsXgg+ww3bjGMQDXS0OqN2+os2W
         iTh8mY6a7PMO8G5D2rCpLoenzqv5U6jq+cs8OV4xBry5SYg32QErRGi0pGLaK4hY9fbv
         SsAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=smoEQ8Fl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l45-v6si1141574qvg.30.2018.08.21.09.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 09:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=smoEQ8Fl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsA0D-00064a-Hj
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 12:59:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fs9yJ-0004zx-6e
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 12:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fs9yB-0005jH-60
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 12:57:32 -0400
Received: from mail-dm3nam03on0043.outbound.protection.outlook.com
	([104.47.41.43]:64128
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fs9y8-0005d5-Px; Tue, 21 Aug 2018 12:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tb3qcitCrSKAKghHB7VRALvsLL+DP8IOkVMBsXPi4YY=;
	b=smoEQ8FlOFAxL2Iki5z0Ka4hmFgH8lGZdQ8Oq8+IZNSubK1jOXNVVeHcWXrHaWe9/K5/EkRHZsqMjq/2IvOAVXLURBMlPFOhrryA8pm3wzjUzDuqa3UwiMQhAijOrz4ghXS1quEb7v6+BUT0GR5/UJKSGJi9bz7U3kC/CI28e6k=
Received: from MWHPR02CA0033.namprd02.prod.outlook.com (2603:10b6:301:60::22)
	by BY2PR02MB091.namprd02.prod.outlook.com (2a01:111:e400:2c1c::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1080.13;
	Tue, 21 Aug 2018 16:57:21 +0000
Received: from BL2NAM02FT015.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by MWHPR02CA0033.outlook.office365.com
	(2603:10b6:301:60::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1080.14 via
	Frontend Transport; Tue, 21 Aug 2018 16:57:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT015.mail.protection.outlook.com (10.152.77.167) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1080.9
	via Frontend Transport; Tue, 21 Aug 2018 16:57:20 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59986
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fs9y3-0007BI-Ua; Tue, 21 Aug 2018 09:57:19 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fs9xy-0000J2-Qo; Tue, 21 Aug 2018 09:57:14 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7LGvDRU015820; Tue, 21 Aug 2018 09:57:14 -0700
Received: from [10.23.119.44] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fs9xx-0000Is-Jw; Tue, 21 Aug 2018 09:57:13 -0700
Date: Tue, 21 Aug 2018 18:57:12 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180821165712.22orutfo4ucemca3@toto>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(438002)(189003)(199004)(58126008)(9786002)(54906003)(76176011)(114624004)(106002)(2906002)(8936002)(316002)(16586007)(50466002)(1076002)(478600001)(5660300001)(106466001)(23726003)(6246003)(229853002)(6916009)(9686003)(46406003)(336012)(4326008)(33716001)(63266004)(81166006)(81156014)(8676002)(26005)(97756001)(6346003)(305945005)(486006)(426003)(356003)(476003)(126002)(77096007)(11346002)(446003)(47776003)(186003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB091; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT015;
	1:QyN9oa9801j51YZL2b3mRnUX89cOIoGlZ58EqYxCap+wLrVWKv2w8ku3BG66LuI01BqHTb5XI6aWqeqtKO6o35x+KTRokMAFBCZJXI+9UpDAsULDj/iDAoMS8gaRTTEA
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f31f66-e6d9-455d-17a0-08d6078728da
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR02MB091; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	3:Vv/Ix+WG6pw2PFF8osjen8wNFHbTjWYIQXEuzFOl1a0Pkp+B/4c6GyJK965ZvVGnixVUwZLEOSiGMHGhInxzYfDWxsKYMfqu+XVJN2KKy/9w4z7OyrFTXSG4NHIrjjdRgk0ZefXUr9Y9POZkCF+P3aXaVkN97Dco5cJmIGexR6NbkLC9Wso0l+ONyNraMrESXHlUgFwd/T587B0WuIc8fM8F/cHzhV0iSeyhrL4piDcdZ3a4aLPdXKZpvXcprerulB84cSLhLnpPoDtK7taYqLbwe6Dk3fnQzQJZyv07cBuoLs6uRPMBMXxPDkkVVIHD17bUucqBJbhVmfL7rVm4IJiv2vz0ZWR9vn/Rn7cZFlU=;
	25:QlneRCDFhreBkO+4DPQY7DXgg2d1BUSG7sDJDyJCQcVtqYkkGlcg/VVeDF/mVN14Xk5wNbgrAfSbn9NSrGfl2jgUjEDeuifM3V00y1gn86+UImE6F0rEpaY92gWlqTyJbwN/VDHB7kdo2v96YAOklMR+TjAbSzp8UVB07Brx9O8IXUPJ+5qrOpCpZgVx6ZpksldotN/E4Qm6mPeULvDyp6AcfyqieJ+dRB+TMH3LRn3Bu5dDlbDH/SIeK0V9RDpj4AEGdPQohCawEalaoVJwXIUCNAa5MmVshwNEPJpudElJpIV0XCGxwUE6Qw36RSHpWtogF0zTFwBmDX+tz5K8IA==
X-MS-TrafficTypeDiagnostic: BY2PR02MB091:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	31:hJ72QY7zl1TwcSXV9S6vn3l9/L6Rn1XDEQHOh1YkHwt7UjzI0Iaz0VwbWCzC9V0YBOWfmm4L46WE8bYLYq7Zc87wacAnkPallkWY8Oid0MbMGwYRkbizfD6tsBlrDNScVQmd4KvjOZ/Jq5mCVa8RVcsNkwmf+lJB6IpoIo/UYKoe/z7kYEMde9HUDg6Eqn0r9V990aYJvHGo5BLp0ZhsRSMy8yBm+qnAnkxo6wPk4P8=;
	20:aP+pGm01oRLznUn9QHXcYWDiks144CSjquu755CyvNLF+7Vsh2KI/SGs/nKA5DXHR904Gmr12u+adSCCXULwbWOOEC7MiHyoPuHrB0fj1HMhSTNJjyNCp334X4UlEQY0Lb6ZoN/3KJHTffdx066TYDgRHx5EF37td8aKXSM4vo+0TypEsnhSMoOuEHa3qjQA4ytkYitzYQanvapu7xg+TJvZq6m5OYtLYD02TPBJjCQdlRcgsgRGvrYoF+vuDsFGTQE/7f2UbxJREEs91IuI+UAwclcTTA2lJoAuucyBdRa5qIbGQrROkl/UNZ17yoR+RPkMGdHoebUqEEvuSGStlg1P91toWIln243+K+uYfT5U6zCuso0bRwOss4q/2Ym9KXUsXqCPCSv6c0YKPeMgQx45gHxpMiUZEydMz7Sedk1nOCZb/jUPo1POtl5Oxr0ltRJA+4g633k+LxUceSCKHw3bSmH7Qroq/kNCAi41NvSfOTkVC+KJiUeYlCX8074z
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB091B0009829C817AF866991AB310@BY2PR02MB091.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699016);
	SRVR:BY2PR02MB091; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB091; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	4:AbGvy1IlewuKLBkRar9hStN+DkzU3/YFG96ve13RINF0IijRiPTHNagi8lHUIXTr8VeaKjVtQUjZ5QDhixCq+od10lHa/nGIRpRk9QE0H3r/tKvpa0XfhcFxftgCCT5m3NFr8grgIFb+6uO+dAE34pt8H0aTNRLamAf8ivKkS6bmtIpsp/vxPW7ZU2xYTbt7US8jCaJMESSw6xCQ+FBx9mJVlZ256KNIgCHwg9ViQng4hFQcpVGGo6VuKItBh6S/rSzG+QCW6DxhTN+sxPkcN5HZSUZmTL7E+gqtU76UXJHO4oa3O83LXLNSimL40WSu
X-Forefront-PRVS: 0771670921
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB091;
	23:KgJBX/YJ6E5xsRPttZp4Tm3jWY7fsTdlUDnqj9QdKW?=
	=?us-ascii?Q?OY8KyfDzptTg1M1qFTj1ehw0qv9UX0DDj38Y2v1a3/Yj2+6sWMFl9I+VAlwS?=
	=?us-ascii?Q?QIVis3M7PhFgzTXdteQizo8yH3ABhIsun+WvUsKcKMP/UhzvdhknHURwmnR4?=
	=?us-ascii?Q?TFJsM5rxFh2uFnkorJtK630wtoj36MsfKHB3xyAb3VUQK2WcdEipooGCAUz2?=
	=?us-ascii?Q?o1isJEEH8pR8nKEO2JKVt6CnE8p3Ddvn2svuz0ExW3lBviMG55O+p9reTAMu?=
	=?us-ascii?Q?4GFArzsqpkTNU9lZNG6vaY6rFOStMLv/RJ1kt1FricnGyVs5Fp3fPcthPZtE?=
	=?us-ascii?Q?G84UEZjYc81LQ2mfvWBMfeweCC7ltYYGsjn+/odL088BJDAJUqzf+ggnppK/?=
	=?us-ascii?Q?jOol7T8KNLRXjJd+WB2a7uOzmT/d9cNMeWsr5bG/ZmJ+/U9iqHE79kyeVfZx?=
	=?us-ascii?Q?toPQtONytALCrvHScMXIruEgxhc97xqnxF2x2+H+2BdbejPDDElRgqY5ihVl?=
	=?us-ascii?Q?x5XR5ZVHzy0rShmY+F7APdCYnHrXowoTgXXVuleCNd9n3U2dqZwki2Sd4pqG?=
	=?us-ascii?Q?UFzsgYyJhS7DTlTwU+iGFflo5+cMeWjbcvkYZsw5sB50HCw5KFK3sbzVOyB1?=
	=?us-ascii?Q?jk277J1rEICJhE4ywByZ4IVW6XoLAVGKZv/h7lgoAT9Wi8UA6Vtcw2zId2tK?=
	=?us-ascii?Q?87CnSU3FeKQfG78Ta06CmHZZ7w+XqgDTMpay99/sEVkmRbyFm7KMX7mnrdDl?=
	=?us-ascii?Q?WzhCDYrlPmqVxyNWfDKTVFsH5TbVq/ttuFyxNG3QJybS36pNq5yN4WQaaPv9?=
	=?us-ascii?Q?HXfPBLjb7OsIf9EVammJ8kqr/02ND5AyuHVyfLVfl2k9cj1MfGqqSG8YAU/U?=
	=?us-ascii?Q?2aE09ghuJnbPZja7u2xTdPTrRzvJI8NcRBLno6BJidUDfTfSXonPjcx5mmtE?=
	=?us-ascii?Q?np/PkrCaWkFmSyyzmD9ayYCsD/m9K6vwnGzZkCvpMpkTxt+vXTqF+S3ob4Rf?=
	=?us-ascii?Q?HqZIwdGkIlyXTVJdg1n5ncscfg+VXGd+qELB4pdqV/nWVeMglVjAdi3LxQih?=
	=?us-ascii?Q?p486wWEVRlcwweCC6tD3pN0T4AJNOH8YKhsPKzuGyFaYal3EPg2h0Z8F/j3z?=
	=?us-ascii?Q?bQwdHXpcg2r1tIJzAa1O2Ou/1r4xflFMtjNSuYylsHQeeY/Df+iyW+IGOWoJ?=
	=?us-ascii?Q?JOl9CRTmSmR3A=3D?=
X-Microsoft-Antispam-Message-Info: bXQ4XZyWfm5ZT3HenjMx5ZkwuXD8uxAyRtghxV5w4alhRVCyQxHxVleFYvzvVVT7HMd2SVgNLnGKQLjkeybLZjsLgT/pqIz9QK2+zLihM8mVrU6B2LZPnBAmFRufq715MaYPb2rlbHwWWhZp/E3h7V+cRDfSrxnr7CpVWQrEuZVskVlNmMPMcCOui3Oo28C0deBQ7QYpGY2UgXuCqXCbSk+hq2h9y4nWqLzXOpujD/bxtBfhFaHbqlrp8X4Gbgai8+3hygaBbBP9J4CrVIXz7M2+pEVkEBza2EaVkWXBgONecqMXzQKKLgJqKSHmP95DrCgULtmHXGsDf9VMovGhGr/MdrKAmC/igzpH3KDTDGs=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	6:guTj6DzV5QsZCsCtY7vD81zy1eUDvAKfHoOyZqJlOelGc5NnRKEgG6Qod+v0agncw3/Ak8nXgXT3CGFWblMJBBqL8D3HYsHtdWfmEpfeFNKU26Pw9C8iK7jJ9HoJrGxrOMCCvM1WUSVijPXVa3Z/O0dFxb35dzLgDJU85TgupWCOPLv9ii9u0x9WGqNpkDTlf0z2yR3GlFzDqZtOgC87bpUtlSaZziOA0n6iBB25aWUGQZsiVf6fzGjhbE2IKe1S0GwLOmdTctdljmhcsnX/H/VkA3mKnEow1wY2eb5nUs1OOblJkKSaOSj2OuvKOLZL13TCY69jLQS0b5d1CRdNrUiUsWcfubsvZ5P5I0LNWfeoxzlqsLZCC4dMyrAYH15VBRbC3QFkwj4rE3nctbPP+lG2fFNPM4nio2MAxBfsEAQOZQnqbhewHUsRepXa19ohZm4qAKDcBv15yO6/+MCKKg==;
	5:wu+nGxbX3CphkLsW+lqOTO2q0ZOFpQYQQ3HbdFFHKhdty3jWLKP7YVQjuXEXGXLKWyz0/ALhkZjfBPfJvK+hNp/iljT0nZuIkMfDXpt5swhyOnbgtcid/55V4kx6FIDI43bbotZzGnt+0yYiUdsJAXLHtxrVjuqvDk+D16S2zzE=;
	7:is/Qyg2DJcXuiBDJs5manFVuhH6lbeK2AqsRhJ0U9BuxvA/SbP/Ph3lK94onK9FY/Y4D6uF6XMBioBhnD73zP9zGOuLVb44UFUFI0oXKgpxbjF0iGWP6Y++e+doQnN9+xEACyTYyjWzSdTwpZAf1Hbm7etAlS62a02A58760MUBZ2rEUc1CIEsxBJPB8BWySUfMWZUzbhVRXY9y3lfK7e86k3MCGdqTcjawZsw8MOXe1dp2GEfXSZKICulZsNJLj
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2018 16:57:20.5145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f31f66-e6d9-455d-17a0-08d6078728da
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB091
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.43
Subject: Re: [Qemu-devel] [PATCH v2 0/6] target/arm: Some pieces of support
 for 32-bit Hyp mode
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nXFrHMP3nqpX

On Mon, Aug 20, 2018 at 04:30:14PM +0100, Peter Maydell wrote:
> Now we have virtualization support in the GICv2 emulation,
> I thought I'd have a look at how much we were still missing
> for being able to enable EL2 support for AArch32.
> This set of patches fixes some minor missing pieces:
>  * AArch32 HACTLR2
>  * AArch32 HCR, HCR2
>  * support for taking exceptions to Hyp mode
>  * boot AArch32 kernels in Hyp mode where available
> and I threw in a trivial bugfix:
>  * Clear CPSR.IL and CPSR.J on 32-bit exception entry
> since it would otherwise have a conflict with the refactoring
> of exception entry.
> 
> Changes v1->v2:
>  * some patches are now upstream
>  * v8-only registers no longer created for v7 CPUs
>  * split the "factor out exception-entry code" into
>    its own patch
>  * new patch: clear CPSR.IL and CPSR.J
>  * new patch: boot kernels in Hyp mode if possible
> 
> (I still have the same "guest EL0 segv" issue as for v1
> if I actually enable the EL2 feature on Cortex-A15.)


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> thanks
> -- PMM
> 
> Peter Maydell (6):
>   target/arm: Implement RAZ/WI HACTLR2
>   target/arm: Implement AArch32 HCR and HCR2
>   target/arm: Factor out code for taking an AArch32 exception
>   target/arm: Implement support for taking exceptions to Hyp mode
>   target/arm: Clear CPSR.IL and CPSR.J on 32-bit exception entry
>   hw/arm/boot: AArch32 kernels should be started in Hyp mode if
>     available
> 
>  hw/arm/boot.c       |  11 +++
>  target/arm/helper.c | 212 ++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 196 insertions(+), 27 deletions(-)
> 
> -- 
> 2.18.0
> 
