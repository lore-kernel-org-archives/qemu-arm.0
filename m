Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp556563wru;
        Wed, 15 Aug 2018 04:05:58 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyO/mhfbF9xw0I1T7zqzIhh3GLN7Zyu6GoABYehlyA/mml/l9+b2Qv6vJT0wIhFYYX4rC8g
X-Received: by 2002:a37:26d2:: with SMTP id m79-v6mr23568752qkm.212.1534331158184;
        Wed, 15 Aug 2018 04:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534331158; cv=none;
        d=google.com; s=arc-20160816;
        b=hynklEzldQUC7dBppkOwH4qbh4JrzfN3KFJtcH8SB4a3XxDdK/88oHCt2KB/l1O5EE
         ogJeP+ztcMM7JBwk7FXFcTWiXIabGruxHsDgNNeuC1eEHAtTCZajtYTRbiEc1xZxeG3T
         FaWs3yXjDEWbW9kbEoQ2/6wQabIANkkjzfjCifjz6EsXZsGzxbbmOAJ7KUUM6NZC6QI8
         TyQBzs7CV6WrucA/nMLuh2j4ejog9ZxEAq3Sx8aq4ZUYQcb2OFtOka1OM6ciNMzyErk9
         SgGBAQmXW4GsNhMFxO5SPg/Zs+bqL0iI0fat3kPF+podAiWOcgk0gCR8TqqDPmAaGs0q
         eDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=WntEDB8apqYtOt+mfpTXB6252TvSclheaTy2/lANkb8=;
        b=Af53hQ1Gp0MTDvLfbP3jvTtNLek7wrkQYn7IYnE/oRqB9w79c1qHGAN2kRpehz1po0
         0O2uANK19kBZyfGwZoA/SM0e8VPnHnxJ+GStWc4QFJlIahhgf8sr4DP6V8JlgBttGjoO
         pKNyqks+3MqQTdukZ67S42Y9KvqaVj0TQhWyxLyTdt/gBPIxIPd7C+97KS7q3T8shuy2
         FaYCt3MF328X7KZ1TVUShP4vzJnCHGgaxs+yGZ6gn1tbW8Dqk1lsGanZaBWEA3qZBSxz
         WB13k0jTtLgBPzfliOWO67ShQfJT+wkjPvzyI/p+6djbpoYWbf8DAebEhjoW0JtfZn6c
         u3Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="E+cZq/go";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v12-v6si1223297qve.52.2018.08.15.04.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 04:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="E+cZq/go";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fptcj-00022T-Mb
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 07:05:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fptc8-0001g8-2z
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 07:05:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fptc6-0000Pr-1W
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 07:05:19 -0400
Received: from mail-by2nam05on0611.outbound.protection.outlook.com
	([2a01:111:f400:fe52::611]:37792
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fptby-0008Us-LB; Wed, 15 Aug 2018 07:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WntEDB8apqYtOt+mfpTXB6252TvSclheaTy2/lANkb8=;
	b=E+cZq/go6GKYmKADwt3Xf9uyYDcwzwV/RL2/Z3yd+z0AhH7mXX5fbcgwivMl3Zai1zCg/c/aZ7ADZ+Q8Lvw/3nwP+Rt7OGYYQlHLkhbgqQY4c37aN4DBh20WYe9/xgqU/KSSA11F3zDtcfkIbgtW9132CGQaPZdexTUnZXfMPY8=
Received: from SN4PR0201CA0055.namprd02.prod.outlook.com
	(2603:10b6:803:20::17) by BL0PR02MB4450.namprd02.prod.outlook.com
	(2603:10b6:208:45::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.23;
	Wed, 15 Aug 2018 11:04:51 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by SN4PR0201CA0055.outlook.office365.com
	(2603:10b6:803:20::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1059.19 via
	Frontend Transport; Wed, 15 Aug 2018 11:04:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Wed, 15 Aug 2018 11:04:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptbd-000056-T4; Wed, 15 Aug 2018 04:04:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptbY-0005I7-L0; Wed, 15 Aug 2018 04:04:44 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7FB4Z5A001490; Wed, 15 Aug 2018 04:04:36 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptbP-0005Gw-Ht; Wed, 15 Aug 2018 04:04:35 -0700
Date: Wed, 15 Aug 2018 13:04:34 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180815110434.z7skzr6riz3dmnan@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(356003)(305945005)(26005)(2906002)(50466002)(14444005)(1076002)(77096007)(8936002)(186003)(9786002)(76176011)(478600001)(126002)(11346002)(426003)(476003)(486006)(446003)(336012)(5660300001)(81156014)(81166006)(106002)(106466001)(9686003)(33716001)(4326008)(47776003)(36386004)(6246003)(16586007)(97756001)(229853002)(46406003)(23726003)(8676002)(107886003)(316002)(6916009)(63266004)(58126008)(54906003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4450; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT006;
	1:0nlVlmRIOD4CJmcDMyLTMjlrcOqDXh8zx+pf5yi6THp4LGE2UM64Y2cPSl3IQAlBGoMu+U62hk7pV66XI37Zf5nYboHhFjiC5JcdQNRZnLNB60mF/zxLAXOtlFaHX8st
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eddcf679-0048-412f-1c7e-08d6029eebfd
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4450; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	3:TPYnq3iO6O/kGqp+oks6h1TsHRorGgQ/OSEMafKwrhExIV4z4i/wWQ4ikQI2edHUWlLmac4gUrEfp1//uOc0Le5RWwR3ArPy7Yn/UYrNZaQ3I72jV5A5VOzEMuF3/p3OfeFc5nigfjUi6ujkJ2nDMBXrwPJnN4UEBAH/kk5Vjp9LsogFEUZzMDo6VJHYrSZpeev7DxoJrr4/I3BBIJUfK05LdWg6usiBysoV6gPB3JStWfWDVjayl9+LEvADff37NSfdMRokrHprzlBVO8CIJD0UYuOsiZVfHH3NYxSyXg9U61lJdzuVUHp8EfYoYxEBbMg1HNjOTNyXDTIUhDXy1Ixvf3hIHTuK5eYiVGvckeA=;
	25:PyqNPsSsI3LOTHH1p/518vJ8mu+Qn1RRW3KLCYyNX/u2AdCNRTN8h5reAdZigSwdDao6XgLPVnNaV/wY55DdZH+46f8VZROM+/rhVW9FodfqLreASBW38rz+RpbzUWmEQHm1r8DYIkEfT1oxe3WnIz0G1MT6uWaQxBQpdCF33SKjTvuroIZSzhliTBQ+YcToricBqCG5d8iZY+MbsOTqH5AF0jLgXir54bTwWo2Ofz8EKUAoZfkx8oK7qH7RXmjydr2+I60B27YisP/xwlY+6+a4+QcVncVYJdtjUH9UWfxpwwLaVO5aXjv5fWj1dGTRNCHDrTX1gvWuC0Q3tYGWmw==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4450:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	31:1UtVjrHHzAwgN2qnpr91xk9VKCvee06DxZ34i/+8qDZNkyOXilVzIyl70PwDmbsIbEAC6OsAbZ8ckqA/k8vlr8In28MwOl+Qz/GuBosQ7+lDxp5WEgyypghmouxcitm+xcq1qEc1npW9jlEyIb8rDfWyiM2F9PQnomVQicIifGxqNvNkhZNlU30FdAaUj9Oo8nFwSy7M6pazk6oyjkAQg0AuQ05ROd/oHXczC3CLlp8=;
	20:TQja4hXxKUemsHPOYfale1pndJDQg2XKkrt39q6YcFBl9o/MdcPJyja/cgYxOkV+y5HbrDLaTnHZK6CfoVVRx3iA5dELu6PlTBlsJ5gEt1PiyyZVBslGFZeWvrL+D83WSEgiaqftDjAQvuEL2c6PpZCQoHj53cSfWjZBFVgQ1cjzktnqvXqiL3xPbHaeYekEyRHPIZ+Ml7Gu9G1AQnQMyI/65OxlQuh4kblGecAsGGhLoY553Wbp6iubnz2mC9m1IFteYpKErYW+moyzNRDLx4sBm5g5ASdRd9oFUgak/gYPBmQtKHY40yzUNNAgo999rZ+cTMb+Jm68QZmA0+BBddRpTFe4xzO9eIQdeGxE4eDtbMTR2EOquYcNgQSInfE++t0fV3tIQH3ivEYHQSbyTXuxm9Z87+5N45xCL3o1tNk1t+TCh/NpZx8hB1DFyCIIrzjFhYh2npLsAlJlMvnL2x0yzGzvdCCJJrvUrZdcLb6RvC5U0a87D12eScLGONq6
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4450CCA060852317CD1FE431AB3F0@BL0PR02MB4450.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:BL0PR02MB4450; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4450; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	4:wiMH3CcZ2Pnp33n9k8vy32bsoSkw0BAGKLjpXTpvhufTBCdN9Pz+JvbPMHT9rkzoIwYaFHV7W/9b1cgHBpj+V5J+uqqKhywd1itRm5O4AJ00qB2bxpxXgmN2xQzENMCVOH3LYM/WRfFB3+sW8lqglQfrYYmclF+D0kqwWopuQHBuSjGl94QgOZgT0iN/AXFsU76YlJJtgovDYz+CjAxOSWbJZtfYitKzY+2+QlQI9yfk/tswrCXYGhUL1tIL0gEe5Bay1hPNXBj/zTN9n4ElqA==
X-Forefront-PRVS: 07658B8EA3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4450;
	23:lidzoJROfF5iNzQV0rmHD9Ipx0xQAYG4VAiSbP6Pv?=
	=?us-ascii?Q?SC8F5+MVEXJgNeobj7+HS3xMnO6OE2O7aAr8w+I5eJf4CqHGHRJmi4VkCfGc?=
	=?us-ascii?Q?W5STKJqhVvuBVVHZA0NCwt2q1UErNrDT3FmyFG4BC++YgMR/AhoT589HBqzY?=
	=?us-ascii?Q?/fgQmvkd92RzLEtmxuu/oLucZ6ZuQJIUZz9PDxRejDOELz23nR57WCgQQBXs?=
	=?us-ascii?Q?WS9UsrKV3FazCuWZDgSpYztRQ8twIV6KDobBFZKNeJyR9QaA72C0XqlaHwco?=
	=?us-ascii?Q?8hrFLyG1L7NtNTQQgzEZwFOVXCV9Yk/dF26I6AkaI2D1LeL1CeYsiqOYbjgd?=
	=?us-ascii?Q?3nhnddvT+oFPJbzIF9nfCuMM5sAvD4IBMLqVqkR/lofQdOsgASsqhdRKctUP?=
	=?us-ascii?Q?vmzkkKqOvBYwmnkY2n1TvVIZu7FpfYTO+l7JdIAdTA5Ls7o3Nj2+uTU5OeK8?=
	=?us-ascii?Q?pSY8MV9Ecka6uBS0ytSgASMht/bskxTZgdyD1ZwjbxK/ybxh/76PqxPhUCBK?=
	=?us-ascii?Q?KnrE215iBmPEWUgPP20bLOtsEaGyXmM9CX30lE7nemJKGLXKuHJItJeLE3SB?=
	=?us-ascii?Q?Je6QLOy2LhW9x6/7aoBpSfVWmusBIIEL1wrXXQv1IYaV07aM6fIXsnvODHOn?=
	=?us-ascii?Q?kNwm/cMr+w0bOqX6yb+deVlx+v7DHSVU424jGBkOBY3/UwCt6fd+N1H8gRJ3?=
	=?us-ascii?Q?+O5HxF32rCH66eNcnhKofIrwjVEpdSnVDCxNyEpY+YAA8HE1gsbICZhDoShi?=
	=?us-ascii?Q?502KSDoV+d+MlFPa6N/Z15bejynVUng2tm22W9lc0VuUyF/UZoQUaGlTtOY/?=
	=?us-ascii?Q?PBTMfvsGj+lmmHPDdfULbIpswwGHFgl5EnVDBKvKphIJVfcv4Ve8ASC4dYHJ?=
	=?us-ascii?Q?DbNodIjdVOCvadLoh4Et3QQKBuhmPArwpLHRAePKoH8CU5Za5RaWAKAWVGLr?=
	=?us-ascii?Q?XtPvkxHXQC1DvMnNbsuAVDRPFA+WMSOLMZ8uzb7VnytrfXDK+RLkiuf9x3uG?=
	=?us-ascii?Q?nhpTZtR4Qfu91z6frJGB5AP77JOIW0REWV7iTtiEahzL0HTkXW23+JuuRt+a?=
	=?us-ascii?Q?C8l0OcFW/CssagqhkYraeqUc7dvfHi9UpQpNJOt6T7HdQciUdYZ58I0M2dV1?=
	=?us-ascii?Q?COgNkWFP7mdEMfl+i0ccj6vULOHVwIdO8nFtmm56VVuJNIHRbI84KZfowdA+?=
	=?us-ascii?Q?EnBSDPu1NMxkZc=3D?=
X-Microsoft-Antispam-Message-Info: eKSHwXqEqCthu6hXmT9cWiJIlhJmzPsvpXzpEAWaTgaMnpcNj6ero5JWffUtXZylfZhNlWW/BGRNYxC4QTWJ6sYgOab7KMtjrlc3tearrjZfGdu78JPBi00VMtxQJ9AU6UjFBUmAMVNnTK3/xkOtEYpJySqpY5xav6vuMGe/xDCeJtyB23A8PrZ8/ySkioY19//FLnpkm1dSbQbfhvPaCaFX30EUH8Ey15KOjrlnLLVjy+8ts6GSXtl3Q7S5PZpOCWEtrLi6Cz2/sOviRW4S8FDaDuRNQE/2a/311L1sxGnC0apxJBE7yLwW5O9ZYoBomLR+gCFDPuUvIolaktP/8bkQHLp6gZZgXeVRNgMpxvw=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	6:lhOU4QcWgcNV5e9WlumN8dMhmg6RUYtpv2dwcIo4du+/OUNt0QLg1cNWfHq2jNr9rz2ZhOE/0n/isQzesspNYpSLPEwgdLRf9KK15ISD2k4mahKG7cMgZDx6toieacvBmAdjifCZlEBY9E/H2/yKVx57fmmEBBoRUu9aOoYYWEDphvJXWCBZByWK9modGIeM3tpS/u0/p6NsWdNBv3nNvNz6u/ycc5HzGQuUFSbH3fkvgVhEXw7ZIhgtDVew5X6V25hrPXqI6OhOtLNawymux9lFS3Xxh9WZRXWkNXdhjehszF1RNNiGeOOHr3VIQ9DsOubx24EXDmjiT9/Fa40jbUUkYpVoVSUqQYVel7bWexuv8PVG8fVl8NTOTwDQ3uJf3ubCEVDCd58qEtH3MBa2mya4UF61yramq6wEAfqHqdEOCbsVU5m3thJQoWXSVpIJGIIPCBZKViMZpYuKWm5chA==;
	5:L9MghRq1uBPk/QpIipOHmlmdrxZIoRLbBonvpB1Pn8e0BZPdUDEEIRXJUz/qEOszVrJSlps1+5Dc6SWhpV4cIgI+8NLM5UJcRbUkQnNXqjMRpHL0VG5kvOHXjj+bmnu4vWjvU8WXGAt3W9OnGijm6CYIIwSxSOJBSOgaqtGg85Q=;
	7:oOFJgjialKs8KwG/4edATk43z20q1Ca8urk4J3QZqlmx1l5kGCnQkVBRpBQkKBHIoRcmauFkeqo/xVmtovToz9NKLTiwbSuyTpYZuBTkiALOLJ3CIMXnnIzEKca+G/g2+5KKYJ0ymzcXstdYTbZRF0HzerE4juxciFVyziPhkXkrkj/Pt+ix77ddiiRHVlLy3tIMUNwoXMlOq0E4/UNPEZ9tci1VZxYNSNfBZg4izs2BGVhOAtX0kMNCdqu/8mAQ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2018 11:04:50.3075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eddcf679-0048-412f-1c7e-08d6029eebfd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4450
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe52::611
Subject: Re: [Qemu-arm] [PATCH 00/10] target/arm: Some pieces of support for
 32-bit Hyp mode
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FXVFOuV7+rlj

On Tue, Aug 14, 2018 at 01:42:44PM +0100, Peter Maydell wrote:
> Now we have virtualization support in the GICv2 emulation,
> I thought I'd have a look at how much we were still missing
> for being able to enable EL2 support for AArch32.
> This set of patches fixes some minor missing pieces:
>  * various small bugs in cp15 registers or places where
>    we were missing the 32-bit version of a 64-bit register
>  * a bugfix for MSR/MRS (banked), which were not allowing
>    Hyp mode to access ELR_Hyp
>  * implementation of the ERET instruction for A32/T32
>  * support for taking exceptions to Hyp mode (the largest
>    of these missing bits)
> 
> This isn't complete, but I thought I'd push these patches
> out for review. My test setup is that I have another
> couple of patches, one which fixes up hw/arm/boot.c to
> boot AArch32 kernels in Hyp mode if it exists, and one
> which sets ARM_FEATURE_EL2 on our A15 model. With those I
> can get an outer kernel to boot with KVM support and try
> to run an inner guest kernel. The inner kernel boots OK
> but gets random segfaults in its userspace -- I haven't
> tracked down why this is yet...

Cool! :-)

> 
> Some bits that are definitely missing:
>  * ATS1HR, ATS1HW address translation ops
>  * I need to check that the trap semantics for AArch32
>    regs line up with their AArch64 counterparts
> 
> I also noticed that we fail to implement really quite a lot
> of the HCR_EL2 trap semantics for either AArch64 or AArch32,
> to the extent that I'm surprised that nested guests work
> under AArch64 :-)

Yes, we've have an entry for a while in our TODO list to improve
HCR trapping but haven't gotten around to it. IIRC, at the time
when we where bringing the EL2 stuff up, quite little was actually
being used by KVM/Xen.

Cheers,
Edgar



> 
> This patchset is based on top of my target-arm.for-3.1
> branch.
> 
> thanks
> -- PMM
> 
> Peter Maydell (10):
>   target/arm: Correct typo in HAMAIR1 regdef name
>   target/arm: Add missing .cp = 15 to HMAIR1 and HAMAIR1 regdefs
>   target/arm: Implement RAZ/WI HACTLR2
>   target/arm: Implement AArch32 HVBAR
>   target/arm: Implement AArch32 HCR and HCR2
>   target/arm: Implement AArch32 Hyp FARs
>   target/arm: Implement ESR_EL2/HSR for AArch32 and no-EL2
>   target/arm: Permit accesses to ELR_Hyp from Hyp mode via MSR/MRS
>     (banked)
>   target/arm: Implement AArch32 ERET instruction
>   target/arm: Implement support for taking exceptions to Hyp mode
> 
>  target/arm/helper.c    | 226 ++++++++++++++++++++++++++++++++++-------
>  target/arm/op_helper.c |  22 ++--
>  target/arm/translate.c |  41 +++++++-
>  3 files changed, 236 insertions(+), 53 deletions(-)
> 
> -- 
> 2.18.0
> 
