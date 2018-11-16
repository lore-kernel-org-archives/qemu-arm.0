Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp190699wrw;
        Fri, 16 Nov 2018 02:13:13 -0800 (PST)
X-Google-Smtp-Source: AJdET5eso12vk9X5w/vy8MmciaCaMvu2KggbiDsnD5hwVmp+3RE6/ZWjUHUGIFxVg1Sz2MEhZVq8
X-Received: by 2002:ac8:53c6:: with SMTP id c6mr9717584qtq.278.1542363193702;
        Fri, 16 Nov 2018 02:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542363193; cv=none;
        d=google.com; s=arc-20160816;
        b=n3mrZREVJPgf5l/a9b75VYPfvzTdImJKhNc1zA6XSNZ4HEMzwyGoRxtXqrQ4JUBclz
         KGbVyx9T2yPNXG6xjh+Rd7I2vizp5PiX00WkXZThJRAVSVVA3ruTA/xUMVNp1Nl1DaYw
         Ahdr6uUziKJeI7P/iIxY35LeDkWfQXXT4Bb7OzT+uCohCgMIsomp1FljDpEq4UDoFJC1
         yvPHgWj//c5AyEI1saqEP+eJe9HlVrTLUtxuqSgOw0wa6vtkTYAIW3ujoUp1H8ao+1wQ
         gQaumIiOLLUEe7C7GEXaxDb55/6HOuZWir2EdMXOtrUYB4rGJ7vxYyjtUxULYF9Q5DmH
         MnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=E6ciUrBsDjkzsD04bwspm48qYYW19RpeYRFvHbZ/Tqk=;
        b=sSZyzhVRlF9pGcdtaoL9j5xP3EC73oh8brow1yHmzwx7EAZL5AxR4iMVDwTnY4aRwW
         G+d403NeJ/mtie1mdAKKrIfVXefcOMQBHogV4DizG63wZW1UW4QsWKFePAWJRhTgmxRl
         G4AygI2vkHxU+BJgWWP/nlZKOIh+M/QN6xaASgn7yEY920UPvDO4Ue7km1lIQG2ZoGHi
         8Vv+7xtPQUp+pAytHXp8HlJPkYFX3zKLEpuc5r+wRN4WEoV/kCuFPA3dwbGfYVPvsgmR
         uGVajRf2Tsan5xrDbXi19JUEYIe2AMrPjzZo6WMROyckMjrBv7rY2g/7A3uxh8uMm2BT
         nh4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Lix7JhAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si7442352qve.126.2018.11.16.02.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Lix7JhAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb7h-0008AF-6M
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:13:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb5I-0006BH-FB
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:10:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb5E-0003OY-BY
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:10:44 -0500
Received: from mail-eopbgr730088.outbound.protection.outlook.com
	([40.107.73.88]:2657
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb5E-0003FH-2M; Fri, 16 Nov 2018 05:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2csdBl59g+qj7lby4G3QBVrAXbINBY0VCUdzV1UMJks=;
	b=Lix7JhAlGityHRGm/DSBd2HOHjTAU391JLYiQ+wdVTdtURKVruBe6eYyZlChcg/8uXLYGt4nmdlz8fnfPdXxjUEBVHCwLe3dZ+qrFY9Ab8p8IBMWpBMl3yK2CnUcUAvD/SejCyA/0T5b8DoT7JvWcTEi8aleHw/IkLY13ocjNL4=
Received: from CY4PR02CA0028.namprd02.prod.outlook.com (2603:10b6:903:117::14)
	by BYAPR02MB4328.namprd02.prod.outlook.com (2603:10b6:a03:56::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.26;
	Fri, 16 Nov 2018 10:10:22 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by CY4PR02CA0028.outlook.office365.com
	(2603:10b6:903:117::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.20 via
	Frontend Transport; Fri, 16 Nov 2018 10:10:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:10:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb4v-0000Ap-8O; Fri, 16 Nov 2018 02:10:21 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb4q-0006f9-4R; Fri, 16 Nov 2018 02:10:16 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGAA9MK022394; Fri, 16 Nov 2018 02:10:09 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb4j-0006Vo-4O; Fri, 16 Nov 2018 02:10:09 -0800
Date: Fri, 16 Nov 2018 11:10:08 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116101008.GT7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-11-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-11-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(438002)(199004)(189003)(2870700001)(106002)(6916009)(2906002)(305945005)(58126008)(33656002)(54906003)(76176011)(23756003)(478600001)(5660300001)(14444005)(1076002)(9786002)(575784001)(33716001)(8676002)(81166006)(81156014)(316002)(8936002)(356004)(426003)(486006)(63266004)(446003)(11346002)(77096007)(336012)(26005)(229853002)(5024004)(36386004)(106466001)(50466002)(126002)(476003)(186003)(4326008)(47776003)(9686003)(6246003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4328; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT006;
	1:KW2nGki8DPd0V6I6LzyPJu3GkMMk2a163SnMuIAfvHPP9pYw0zOAqldUO6CtXG+O3Pigz/vm9iD7UKOcy+LUtgcwIrIkK/4V/a6JTQ7uMimvCtuIfGZVPyDYLaAu4hoX
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddb89836-30e1-409d-5a24-08d64babb83b
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BYAPR02MB4328; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	3:0Pqsy7NtRb2TU179Kc00/8jEVvNg96PFING4z93YrDWdH/6d6qtf8K5PdTuewHPEkwHD8AU4UZMJmQjSkA2tQXPjef+JVc0lB1DJX4tSFbYTv6dyjkKNBlzzvdtQ2vbEO4136qrgJW3EUEmcp1Fygn3QMel1xKN9xSVXsKYJwOGAybCveS02MDIPt3OFvelg7T/Ak6/4NSs/FdPJFO+s5f1D8B6RfOFBPlY38szv3tjehj/A4sazcXLZpzZpar25u+sRoa/xGSOCvJX1kQrHvFY6TwzDSzwgZsxGlWSi82Eg63oti7hPs1Ouzxo9vDGBo10mtcfATrUFQ8nUl68rLGPwXJXgBmrWqN4Dhp9o6qA=;
	25:E/zpwFhB8A+CnHpQY1IyKfE7upKzyiC62dmbzL2wvzlLQjLFqVgQWXFxks91xrGUqVWY1kSh2kAyRyDBIpRXAKhjKDd4g24wkNEmuwHgp3Q5DeXfIsckprITWgyWh+8AtO328//3+QGfe7sQ79QZYp9vfEhX3F2tC4zZuabDDmmDyXsw5x4o+wj+CHc9pTzVcpWvgWbOzi3UXCfw7LDUl8IsP+dKQSNlQP+QGermuJsWLAXEIbkTXL7lQk/mB6C3cBLBUct21FlPbrIV5xhLzJkeg50nI0cfQXKoOoQb/rE4v1O8vXel2xb2YexyeSHkqJmydDarhhPd9y8jPEvxxg==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4328:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	31:WHdUv/sy970JPY70uOSql/Yvn64dFXMXMIVBjGNDtuKyfKLp2It7FwgwjHdSnVD16slE9o5RaSn3yHPffiiRne5h6v9gKQrb9ilFWvrqmunRzeLOEPg7MLyVsdpD/nnaQ5I7cEn/7x9vzWNTasX6O3a6Jgdxfzk3kWMAije+u2qJHRXgRJZrba7R3SgNFx7B/mlFt0Bp49P6WFKuumhHKwQWj4b7D8rnuIuw4Ad3x/E=;
	20:QK2WXOogb16PWcXdSI7AB2fphN7QgKUM6jO0PJ1ixSUUo7UhPRfvU7VDaXaFypwWKN9Qwpte9eLPSKz9YZ8rL6bQrMSq4kFw8wJpWdUwG66HbJCnJ3fwB6JOdW9gbhAt/Ufk6Eqhijh/919rXTtAM47IlC24qVl57ee4y4tQyM+wixB/mlLVladlq0oNOgsorEMIBiOM8cSIw6JJkbWU7Z+pCe6Td37obtLlQHX73sxq5XLm7PUvOSLeRoJy5XQ42fjxwa8h9+gB/KrTF6y1anxwQqUQMpQFjYFYrBnNNtiU3c/N0wu6Tw9kZ28ooG1Z5CUG8W8FsPRoUttSaos1ndVqMNLlQWoYdPAj8cr9Knv1WQmqYqdA2qVxsw1cJAyrvNjBm4tkoJswIVRRB3TJNQIQckoYzgx/GqeUGpwdZB4Uoe1UuP1hKFkEQxRRfV7U2DFb/2kwd8Snj9LWa7NZCx2TJsyRlkjusHOYEN8xo7LEZ86MfalZnEPuw6r4P+T+
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB43280DE4A6C3C83531DE33E4ABDD0@BYAPR02MB4328.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3002001)(3231415)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4328; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4328; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	4:P36ULeT8N2ZJHqQbWmGvt4/ISPW43sLfX5xbCzLOz44ZGCsGocKWjh/tTniEi6e4vNbbkSG4C+AXdT7P4nn94taTPRT6KnN02xUA2kktBdCLxCnW3A/8P4953jjHepZPK+GxuPIpAgnM9AXusI6WmMoN21JwYh5tl3SEP1Dq03eXUkIlyo5o2oM4fry/GiMnL1dU6SnaKKA6Cjn4g3HUxEZppoTEi7jQHw7FCCS2QG/wD4V0BZgriEI94rwV8v5lGAc5JrZfT/7gKfIpvX8w94wufNysmdAtSK+PbKQbbshJPEzn5lw1eVFxKgfhw1j6
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4328;
	23:F0mcUijoZZupJy8qxmIPvssGQIvGHbSeZQfLWTza4?=
	=?us-ascii?Q?P+EFckph0gyIiU7sqfmPTHmXBE7YbNkM0md9OUxpn7K8sqXO6nAlNwipNihw?=
	=?us-ascii?Q?3eMXAC4i1HelZ7sc4hekF9Lcz0mVQxtVjiODLr5jYaFuhZ2D2rx4YVO6P2ZV?=
	=?us-ascii?Q?PwtrBYVTtwdSrDgGbeRSmlK8bgRT3KTKZwcDH6bVKORz2CDNQnNrpM4iVqXn?=
	=?us-ascii?Q?RFuF/tNx9Q8k3vuQeEcYx/JxQlzLKOnE+8PiKZfJzSyEcQBN7ZOWhwv2lHac?=
	=?us-ascii?Q?TJTvTkL63137JT6NRaWaUdr3q+j0s4zImQf1UmRuRdTYiX23QzAwpBdJ5u/H?=
	=?us-ascii?Q?yuQvJVEEnR09UhuKEmiX3D4shZ3VoY6p80lwBiMNX0IikyTRlmPttMBSbsmo?=
	=?us-ascii?Q?ew4nGws6SVoFIiSRyd4xJTsYur9ZnpnBc5ppY6zUofl5gXqymYk3qY21j3wM?=
	=?us-ascii?Q?Bf7SK2V7T81jqbp8do0xMgZrWdz8P9MI8NW6/GtnwWCHg9E08zmPqt3YPEop?=
	=?us-ascii?Q?Ds5gv3qJnfVVfZaYmo0vQaYnCmJnTUuBj423je/GQH3Tkye3KpeQ3KLd4Yck?=
	=?us-ascii?Q?XHoE15mitgzlrxoefrj7BPHhGffIXpw3byEam8TAMHhbMugSmHOjVUAeqZPX?=
	=?us-ascii?Q?ZbYMjjKhGy18DssRtBCv3Bu2N/XVemlsMtCPNY7XWsNak1no7DoPXxP+EVjG?=
	=?us-ascii?Q?oGbl0Qwc+P6LMDxeoRAHUG3NqsjqSE/QGHqeww5RUK5sH7Z0vpik92OWK3id?=
	=?us-ascii?Q?fXlUJ590HlSyJu4yLiAhxzlXBXF5IUntuhDw/3DAORRf0igwuTddV8LlNHq9?=
	=?us-ascii?Q?mFiS8nj3Pk/Tmyg2zcz6hWSdImlX3+SMf4TVe3qu/j7rksbpYXeOGUPAVEiS?=
	=?us-ascii?Q?nBm/M1TOJRHd3e0LHpyGvYgjttEehVSJ7WHr6hohUFsMa0OY0+TNLG3cSA+f?=
	=?us-ascii?Q?qQ2/0ooN0+sacnNhCKN8ABr/kVH55gVSuoJk3fSn1upw1o4QZ+PuqeoLW2g5?=
	=?us-ascii?Q?iKODnETUbtGpjreCUsqR50WdS3K8fRxpa4LVF47zXR+LGJqB+WK/boLtytMM?=
	=?us-ascii?Q?3bl/U0UY74S/Pdv+tweMrPBZ1wItYwFbxRG9WJMC8fQtQXcg6r6nqMuG7P7+?=
	=?us-ascii?Q?V22GHClkkh49uVG77iyr9SbY+i4jfKHLA7mwyk1mrIdO/AtwM3ki2RYjBChT?=
	=?us-ascii?Q?xbf2Qv/v56BqnOJef0d9ZHbWIHdlOn85DMTYX79uuRxOM2T1zctNm9SZA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: SJOTCnPx+yGcU/CN9KWIVWhUjPX7Zgr1afBS+ekSuZtiR2UD+Rm2RRWLvYIb1xHGOoSMYh3NjsM++Tr4igK+pmaVw22yCALFpQt1zqtOfDbcGetNX9QpJ98qOzMizB6tAY28O/LS1iTI6WgDBz01lme5IfUSi7EGkWubSxLGWKhas+Qg3OsGwNSyS76IDGuoW02E72vrsKykzHqnGIsUVDLWswmvB39uVHP6i93oG/d0rjHs8fivSuGS93c6jmkKnzLr60UYQLAshpbwwSwrysrjN3HXM8SH7IdXYNZHsPlsZ4sBiHVbBIOQOea7VEJMFJz9RU82sxDsMc8A7D8Nnak0t7ld/YmXsLT7NcnNyDs=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	6:fYcuZxZMrL0zr+tvQsj0C4uObY8oGhnqPC1h91TsytKM2D4uFztN2tUAskOxEUwc4AQ3I1MfcTQs2SYH+Rh5ban8xbCkceReEz7HY2Dadg5+Y2D01XimCa0bYxBjyqUWvr9MYs/uTccVjKSnKZu2YbDTwYWnHlQXq/YdDGM8ULEqmBgAtYdY5rRCqjKDTl9bXetHrwK6l9l8JUO7XXY4HM1VGiKR3fIP0zS1NGV77fe1We/ZStKPvMgrLI6krW1Rgmu2x7X+mpOGSr7aPNv/B2fSUSGUn7iwBwj7vJcTrPVNhRZrjeBxYiQ6XmaK9wLlxmYDTQZgpIkykOEoqgWdx0bL9ck6wdS9OaUGWRqPbq9ggIlcSKXgGa1MyoQ0CaAnKUaqFbwRm/EVsBdZhCJQTHUGMeKYt0H+15/PdfIAbbz1D2VLHWelCjOJknYpdRKGyLOO/TwY7aYbyjhR0BB4WA==;
	5:nU+9plz8h43nOVVpY63PG53UOsjB12xcpiKcPL+0xdCBU+oqzHgyfI3RlMRNggHx2V186q/e6uhO+2pu8O4JBxYepXKE4vL1M8LzwplTRJd8iaY2jofKESloGMGE/ZfLOljzayxBjbgao71KoTZVA6SqlUsQNitgJyyBGCJkS9w=;
	7:2T1ux0OxNV1+iHLIYaIB66g18c73Jq6aInwhfh9faokSTtXuBIhT19kZxxuCyHdZqIRjaRTAeq5OUSBaAySEJrWyz/hgRKfbAbI4VwLz9UXTLfuCKaR9Tj+/eWJjUsUNY0NKK/lhlfVMMINMUvu4bQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:10:21.6735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb89836-30e1-409d-5a24-08d64babb83b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4328
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.88
Subject: Re: [Qemu-arm] [PATCH v6 10/16] gdbstub: add multiprocess support
 to 'D' packets
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
X-TUID: ivlW7RF9bCxS

On Thu, Nov 15, 2018 at 10:42:01AM +0100, Luc Michel wrote:
> 'D' packets are used by GDB to detach from a process. In multiprocess
> mode, the PID to detach from is sent in the request.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 53 insertions(+), 7 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 5df9929f92..eec1cf0d09 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1039,24 +1039,39 @@ static int gdb_breakpoint_remove(target_ulong add=
r, target_ulong len, int type)
>      default:
>          return -ENOSYS;
>      }
>  }
> =20
> +static inline void gdb_cpu_breakpoint_remove_all(CPUState *cpu)
> +{
> +    cpu_breakpoint_remove_all(cpu, BP_GDB);
> +#ifndef CONFIG_USER_ONLY
> +    cpu_watchpoint_remove_all(cpu, BP_GDB);
> +#endif
> +}
> +
> +static void gdb_process_breakpoint_remove_all(const GDBState *s, GDBProc=
ess *p)
> +{
> +    CPUState *cpu =3D get_first_cpu_in_process(s, p);
> +
> +    while (cpu) {
> +        gdb_cpu_breakpoint_remove_all(cpu);
> +        cpu =3D gdb_next_cpu_in_process(s, cpu);
> +    }
> +}
> +
>  static void gdb_breakpoint_remove_all(void)
>  {
>      CPUState *cpu;
> =20
>      if (kvm_enabled()) {
>          kvm_remove_all_breakpoints(gdbserver_state->c_cpu);
>          return;
>      }
> =20
>      CPU_FOREACH(cpu) {
> -        cpu_breakpoint_remove_all(cpu, BP_GDB);
> -#ifndef CONFIG_USER_ONLY
> -        cpu_watchpoint_remove_all(cpu, BP_GDB);
> -#endif
> +        gdb_cpu_breakpoint_remove_all(cpu);
>      }
>  }
> =20
>  static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
>  {
> @@ -1331,13 +1346,44 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>          /* Kill the target */
>          error_report("QEMU: Terminated via GDBstub");
>          exit(0);
>      case 'D':
>          /* Detach packet */
> -        gdb_breakpoint_remove_all();
> -        gdb_syscall_mode =3D GDB_SYS_DISABLED;
> -        gdb_continue(s);
> +        pid =3D 1;
> +
> +        if (s->multiprocess) {
> +            unsigned long lpid;
> +            if (*p !=3D ';') {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            if (qemu_strtoul(p + 1, &p, 16, &lpid)) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            pid =3D lpid;
> +        }
> +
> +        process =3D gdb_get_process(s, pid);
> +        gdb_process_breakpoint_remove_all(s, process);
> +        process->attached =3D false;
> +
> +        if (pid =3D=3D gdb_get_cpu_pid(s, s->c_cpu)) {
> +            s->c_cpu =3D gdb_first_cpu(s);
> +        }
> +
> +        if (pid =3D=3D gdb_get_cpu_pid(s, s->g_cpu)) {
> +            s->g_cpu =3D gdb_first_cpu(s);
> +        }
> +
> +        if (s->c_cpu =3D=3D NULL) {
> +            /* No more process attached */
> +            gdb_syscall_mode =3D GDB_SYS_DISABLED;
> +            gdb_continue(s);
> +        }
>          put_packet(s, "OK");
>          break;
>      case 's':
>          if (*p !=3D '\0') {
>              addr =3D strtoull(p, (char **)&p, 16);
> --=20
> 2.19.1
>=20
