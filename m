Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp705990wrt;
        Wed, 17 Oct 2018 06:31:00 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63i4y5nuAvyQ9WJHRN+0XjQBliXiRsWYGw9P8tx1M9AgJlALLpCIUjBmIFbhSywZuZDzWSK
X-Received: by 2002:a37:a795:: with SMTP id q143-v6mr25261924qke.92.1539783059965;
        Wed, 17 Oct 2018 06:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539783059; cv=none;
        d=google.com; s=arc-20160816;
        b=0R2CWcft0RgFsJ8wV7LUFIUEYibNBTl0O2RP/JRwkpm2q8jq+BGxStlOSvAut/mvfu
         yv+KL2p2hnbGF7N4R5ME00s/Yiabk8+4q4w28GGLJHbHz10MHU/izz1OKsrT0ZCsWGY6
         U3HIVNqHIGBZSKLoxqeak7M/g/bkVlSxIHZYv2PKr/Mw+fyXwmHL+16mkXqPw6jD2g7z
         f50yJF94+wULOQn90JAoTLJf9VxhMsDD8OQiISLzSX9kQoly5+TEO7cze5/oR7n03ZE/
         BX4gphWN7KEPJe0Ygw/OpV2ycV5dKfJs85Au5cr/dObKWTIzSRM8Q8Bz94C+vcmyjZpl
         agXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=fhGGmkrphylx+bynsg/d0tUAcVpFm942RNXhrlfRX14=;
        b=tM90NmvLhTI82GBvWc4vvafLzBJcsQfZWe4IgGKqFp7HkjMA5OmkU8RKKVepfe0HK2
         LhQf9zFqltG6qZg96QiTQS2wiJccMtWz81z9HwvGFARLvcWjd3aQ0CrKEIi6ZoP4LiKx
         FqlB/py+NmjuYhFxQuzaX1y9D0zEwRnE1DG7EZjeeosoUpMoMebMpRzuSAoSTSVaKAVY
         D5ZS7/z+cPUuUtJEXnWqF2q3WQLFMqEBqSYGoKnuT1pctiGJ7wXFvaNp1sNRA+hqJ4fE
         Y51Y87TjEn3h/NyoelnObiYIBFG7um9BSEe+QltUOlUykW4n63AzaDlcHMrsj1qYi19p
         Zaog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=g1ifNfZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si11969306qvg.29.2018.10.17.06.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 06:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=g1ifNfZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gClud-0001QR-5v
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 09:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gCluU-0001Po-Og
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 09:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gCluR-0004Ks-T1
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 09:30:50 -0400
Received: from mail-eopbgr710082.outbound.protection.outlook.com
	([40.107.71.82]:11760
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gCluR-0004Gs-Ih; Wed, 17 Oct 2018 09:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fhGGmkrphylx+bynsg/d0tUAcVpFm942RNXhrlfRX14=;
	b=g1ifNfZ0aC5yuKECp5v+u8GebycR6yav4+biuSGOfXDXtWNdkGpaLFbl7TNfmP5ENT9wASc20Smt7t/YiViPsUNA/vQyYZ7XCTnP/wdPG1LDMvPS7vhSLDYEGtXudP7t8dBWjk7uPAJRTvTDEWYnuwrtQSsx/Y7k15T4deaUOOM=
Received: from MWHPR0201CA0085.namprd02.prod.outlook.com
	(2603:10b6:301:75::26) by SN6PR02MB4335.namprd02.prod.outlook.com
	(2603:10b6:805:a4::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1228.31;
	Wed, 17 Oct 2018 13:30:44 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by MWHPR0201CA0085.outlook.office365.com
	(2603:10b6:301:75::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1228.23 via
	Frontend Transport; Wed, 17 Oct 2018 13:30:43 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1250.11
	via Frontend Transport; Wed, 17 Oct 2018 13:30:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48258
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gCluI-0003E4-Ac; Wed, 17 Oct 2018 06:30:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gCluD-0001vZ-69; Wed, 17 Oct 2018 06:30:33 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w9HDURRj003197; Wed, 17 Oct 2018 06:30:27 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gClu6-0001rW-OY; Wed, 17 Oct 2018 06:30:27 -0700
Date: Wed, 17 Oct 2018 15:30:25 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181017133025.GC4229@toto>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
	<20181011021931.4249-3-edgar.iglesias@gmail.com>
	<CAFEAcA_c8YiyTtb1pE_ToSF_r6DGjCbjbDHF+6OQeCccbwpc=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_c8YiyTtb1pE_ToSF_r6DGjCbjbDHF+6OQeCccbwpc=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(51234002)(229853002)(76176011)(106002)(4326008)(9686003)(63266004)(5660300001)(305945005)(33656002)(7416002)(54906003)(9786002)(39060400002)(97756001)(16586007)(8936002)(316002)(58126008)(53546011)(107886003)(356004)(77096007)(81156014)(8676002)(36386004)(81166006)(106466001)(6346003)(478600001)(186003)(26005)(6246003)(46406003)(126002)(476003)(446003)(50466002)(426003)(486006)(2906002)(6916009)(11346002)(23726003)(1076002)(33716001)(336012)(47776003)(14444005)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4335; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT008;
	1:RHqfDd4H8buW2rAAq8JsxmkuUN+ctv0rm3TvlNo9mzEt0UV6GstkbY67U4rQqlrdPgTWparCA/F1Vl7qgQ+93Ni/OVQ1utfr3ipWjCtjdllIXL3MZpfs1BbYf+Tm15RY
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de1a4e95-b91f-419c-389f-08d63434bcc5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4335; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4335;
	3:lBElQBxqgtMziah6W2tqWX/HkU9W8Jccn4yy79vVAJn1zaxg19RatDXnqG2yBZ26bAmin7wHFblETB+8TcOCe93PUxHmPGrfJXBeWTKLBS1MDhzwyxicr3clWLrPEfBZVdeSBj6YNYz/2BXz+Zl4Jk1DSAWCwJ+g1uRZWVE3YIC8bzZZ1e3h3WHGPRIeIWsjwi6WoiEdR/My5HE40Kfx4AJoWJpKcTjNtsANJGQGuN7l73lpYZ2mj6OgwGb7WsJc+vHlGmV2aIuY0PKpHVPrbyKhw58LLfw+pQi4JmBiDxlzj5LJe6q/9vYSKn4i38IZKI0boj2kd+DzU/IQSqwcKeTAojAJk+4qJ3Rc9tO2/7I=;
	25:Z0lgS0IweWno7pCvXVzCQw5stAUCo44aIM0kiuBRiKHxdnaEiiEfb1ZLaSFvQQkScxFbKfglEDUcpW6HNhWOHo9ip+9V956/8dp8DQv3cwzIHktmCRS3A+Fb+/lyjZM+2ZxsGVuqZoe9K8pxJWJrdj/Q+Ry+e+wrlmHY7tPoirnNYIYWcP+yARL3ysYt2N+IMzJe8XTGte+5O2su38R/qF8BJNAsRXPzhcbGwwQ0LXXGWpQRNQs7pvwrEvZPKjXcXNXzButIQNqXWfF+cjiutfKEkiyOMfYk8Wu+qLRH5DmcSVIKWa1FsiTbRmV851Si0nr32Jdbum1jtdQwY5aXCA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4335:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4335;
	31:A8I4YxpHx2nnKdjoz9RlJ/+kD8tDizS7uGyz/BCuzEtXUappuBVmLpdB4eRxGpOz76UKHY/GZpsR/UIX9eEtSVocLxuY/04hGmS2kLkoq8KTNP0hxkz/LlOz2vbO7xhYDo49Ax8GNLNvk1G4FbwVTPMdR04CpgsIysGjvbRbjiwcLOOsDPxi1S4LZzOAbJ5WUQZhZP6bUDtxMbzOGF2X6BF27ezEU0ENocadaJbyHoo=;
	20:Nf3zAa02T7PWqxZhoAkMXbPo3xcHkqZ0XXgFcFTIyOLJnz2cp54JgZ9WklW9CqKDGZupaPq9ZypBxg3V6wiyliE7NXnavAqgaduJQdH3hDVNDIcfwOBok/AnYsPCxD1RMoHjmCwczLJWdyUl7YpKDLtIJ3ekl5/oRJDvd5VBCpR0FZseRwZK4vlWgsiedxWvY2lU1PWqqsALbh7QOEnpu0oWG0c+XoYZEUHd1mDBdAL0uj3DUyY4LSq4FTSxgFcYx3X7oMPA1SPlCfM65RSATGbK312ED6qWoeWiOpOOCtNgYEqLUD/x5pjNOoXfap33YeEMrHAR6HQx/zhqom1i/oLzvx17RZBdMhG10Atq7wOTpnLnxlyu8XLvbGeyIKHHyb2/c2WLqQg4JrSG2WFpIWIg4UmqGhKsfoTNt2pEQT6wFdvtQt2M7fDbNskSw3H1AQ973viQM8Dio7XGD/gZcD5/rVr7KbI13Lqf+en8h65wlm2wbSW+JSinlOob9NPI
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB433537803DABE9287E343C47ABFF0@SN6PR02MB4335.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93004095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4335; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4335; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4335;
	4:mDABTxAdXiJBnt6VxT37M6Z9yxBpRRNFRsVImT/hJsjYglcA9RQXEjJ7AliE3K3BLchUxQOay6+SX7LURE8gFryiNUwWegkY1c0WwSCCn6fHfkn3MocYwoSL6wPdsdMe/8M8RCpGYXcBpOp2RSFgWa218GL2caNcBW/4yGn4xn9kccm6s2xDUgmqY1MqvFWfo1yeAXomMpIkheQX+VIYulY86YE/VTiQkHdp4nDJkHu7JWnKKzT27LxNYpCPhmH+vWylsVKCKOEKQFZ7FGkrEQuLk2AsWXhaKUsRHtcDa882SiZL9iXmjHROd9a6Czs8ypR49lB0FPg+orFpVC4lvqZltswKwdrJqV2cpZxcMfY=
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4335;
	23:c5F8vCMO0+yABYUtuplP1ebj9yGlF1AapYRrsUc87?=
	=?us-ascii?Q?6zNK3YAotGMuMkoJSDma7rECZ2LJ4L7TIszgAdr2ricNZqSJuAIGHABb9qOa?=
	=?us-ascii?Q?bmoDWNVVTpt3j/PG0/xOXPVYNe3WHn6pZB9X/pedmPRUaTjoxbbxOlIPKRbC?=
	=?us-ascii?Q?pbAeNQHbpMITSwJz7bovo+oobeBgKbtN0Src8VrfVUzs/f3qNGmTsC2KUGiC?=
	=?us-ascii?Q?klYgAOPzjKmZKCxxGbnSn5Pc+VXwyNerp+Igx9o9TE6SPD/qIhzllPH2EhPH?=
	=?us-ascii?Q?8QZDndQaEQYoTPmx8OkQtcYh9wEaJx7R40IyxWCMP+OsqYXAEOYF/NpJzxa2?=
	=?us-ascii?Q?+NYWbd27fOEn7/0vt28DjdGlB1o6fUQLGxZli++ApgFPhEFsQ7kDSmxmqtE1?=
	=?us-ascii?Q?hwGgIyqbl6KI1w5gRSf8nHsqFzMqAl4OjwkO4hR4kbnG75DzF5L+wozbfSSB?=
	=?us-ascii?Q?UGXAMa8X9PlRNSuyAmntbg2UOdOu5f19nhP5Zt/kBVXcFIb3ulpDPBKQJGG/?=
	=?us-ascii?Q?haqZEr9/5k+83DD6emBWvIN7AAT6X0arbj3nwLtgW2aw7D7q8oiHFlnrXYnE?=
	=?us-ascii?Q?EzmfCJNz7nRiADKW/7qbXWkKgpkJNC73VGD0GqJU5v843sQKEt3s2bFqkkyt?=
	=?us-ascii?Q?f0qkxr/f/OTafC5Em18GPpeUK/2Ab4wc3Q8bBVqwTAmycwn8AcH6zUatT2/e?=
	=?us-ascii?Q?KUiFxADT3VcJhI2vvtcYETM8k7HY9NHGcnImi+910uKY6FP/51PCwwzLWeM1?=
	=?us-ascii?Q?S8L0reZgP5PE1hbpuBpQ1pm0ogTD4woew+R485w2oTlHTVSibmYK4ohte2iQ?=
	=?us-ascii?Q?BgC+bD+j5WwKN260iMXxeasCLzkQTfHsChJFrviK2V5abYFaxXkNxueGoACJ?=
	=?us-ascii?Q?O9KPT1kfJ4WMiq/FOuBW92oDzaX+pDdQsYZ3G6z+70QAdl3byURgULMQ7jXF?=
	=?us-ascii?Q?rR5cdy4Vt97G75cgr45cMYRLFNYdKUdQ8rc3JQKwY9grAZbyOZnLFid3sjNC?=
	=?us-ascii?Q?q79ogajWp7f4epRaqzwzjfbu0srotcKjApmOiFicTBdM9JoDHwz2DHflr5gB?=
	=?us-ascii?Q?KNbMpPyD9T4HunF7usrcbwbGir7CPGZ7/XDA7qtr1TJjhOiFSacuikGX13Y1?=
	=?us-ascii?Q?V7w/Qnm4ssEXpeBEWwSHLhAi5Jm7KtGlILnD13RQBGZ/h7uE2zgt4VK7WwU0?=
	=?us-ascii?Q?EJDsnhXhZI1MU4ZJpG62BtXjKqjRVROgzzmiDFbC2fS2ZHbaLJSQxheg5w1g?=
	=?us-ascii?Q?lLPLZODfC/z5UhWUtRKk/lmnMBAwG9vfLo2QQTmVrfBphbH485XC5n6QkiZY?=
	=?us-ascii?Q?T4vO8oTV83O+ebA4s7Vly42tIFAp+pCPtfeAtK0dnXiZ59p70d/28AJ3Izjf?=
	=?us-ascii?Q?FPgw8sOLGY8DfJe8SLrQifSlYQ=3D?=
X-Microsoft-Antispam-Message-Info: 1gHWI+MgcNi7NIm5/GPbIVI2xCr//p+lIITyZA64ft97nhkt/yym54eq5q1G/Czz7yWoOSAevye7B1c7raL3Y/SR9cvEWzXcs0PT+dYhZqiPKbBiEZ4b/JYhlvVkgQSpuBKmG2xVEYBtoF8Nn5Sn19QZy3na010BfPR+8AZOqk66TEZIU7XFU+hPT3OPjX9OkhOb10SkiUy7Mgew46Dns/vbLDSPITdICfWuqKXmLxDUOBktKx+y/wrposP63glsUSaGd/jE9nPIFcGurXt/2sxLmvnxurtdTOo3XGfQPdLU7zkNYfXX4efx+wSyWugN93xU+jgaLAIepYst7C7QvMhQikqxWb1MbDGlH5YIeIQ=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4335;
	6:M/CZVbxosnVmEp7RBSC2rdEdnrCqU56AY8bbk3KwVl0hB2iOEQIYRemCH61PIDbyyEasfjSEoAsCxOvfsNOP1ZdiJRyUSag6AV3HeyAoP2NSnFcTveqGvCh1ZpaSwUEMSS32ECR3KjWZ+Mm3Z7peSYFAqQnNJ0JL1OJdKbFfL+WUKBycho1TPjKeawgKhYUNsvvU0wK3Ryq8f+26I12neh+Y808au0m5JqFFqgNtodbDW2jHVLOkwh2YXzFzXiVZgY/Qkwwl4z5oTXrt2abzYNfanxcYdaii+WgzC3001yA+xeSbcgph8RniIXuN+ZzRj9rCE0dqalAh1WMmqfvwqRWnLtCCLJSsqnRHkjuNhdu8jKQKGgp8OOXSQPBCR5dJhuUhLxTp2eCCOlH2avj5iBeed1N9c1f/h55108ON5WndCOT1siwBGxKC4rIFicSzlB7nyI2ttsIzp0lihfYXfA==;
	5:AskNHOfxJjVqCTMmi5iy0+vrpYnZBbf5iqsKQM6E376v7Nt7D/mpcy3FRBEOSixQs5gJr2QKewuyPEnujQwfpTjf3eQJF59YrU46EdMbt+/4FJJJlPt4MZPtG7+021Ig68f4ghvXikAlzxINQzvkkOG5HAfZDr1sWbS24t5Pa58=;
	7:EE0JlbwiwaxWi1CGEeOjmVrl2kSsDBcnRLijC6s5NcxfZVL+skhOuHDXKR0FaQ2g6vUcCaIvRNoTutU3F8Po7vQCwVpWynOyTIZqNCmjp5TI9Pgh7t1A2VlaK3muNND0Uuz3qUw5vF9XN/k4Q4YOw3ucLynCNyk2HW44cWCxJ111LTN8r9Z0ra/aN20eKo7RkS6V+zeJ/vg24kAS32a7fLAxvGxLMmj+xKSSvns1b5WSN6aqz9asghKro1cErGUa
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2018 13:30:39.2300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1a4e95-b91f-419c-389f-08d63434bcc5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4335
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.82
Subject: Re: [Qemu-arm] [PATCH v2 02/12] net: cadence_gem: Announce
 availability of priority queues
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
X-TUID: TBCNLmxbMMGl

On Tue, Oct 16, 2018 at 05:15:36PM +0100, Peter Maydell wrote:
> On 11 October 2018 at 03:19, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Announce the availability of the various priority queues.
> > This fixes an issue where guest kernels would miss to
> > configure secondary queues due to inproper feature bits.
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  hw/net/cadence_gem.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index e560b7a142..901c173970 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -1213,6 +1213,7 @@ static void gem_reset(DeviceState *d)
> >      int i;
> >      CadenceGEMState *s = CADENCE_GEM(d);
> >      const uint8_t *a;
> > +    uint32_t queues_mask;
> >
> >      DB_PRINT("\n");
> >
> > @@ -1229,7 +1230,10 @@ static void gem_reset(DeviceState *d)
> >      s->regs[GEM_DESCONF] = 0x02500111;
> >      s->regs[GEM_DESCONF2] = 0x2ab13fff;
> >      s->regs[GEM_DESCONF5] = 0x002f2045;
> > -    s->regs[GEM_DESCONF6] = 0x00000200;
> > +    s->regs[GEM_DESCONF6] = 0x0;
> > +
> > +    queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
> > +    s->regs[GEM_DESCONF6] |= queues_mask;
> 
> This causes the clang runtime sanitizer to complain:
>   /aarch64/qom/xilinx-zynq-a9:
> /home/petmay01/linaro/qemu-for-merges/hw/net/cadence_gem.c:1306:19:
> runtime error: shift exponent 64 is too large for 64-bit type
> 'unsigned long long'

Argh, my bad.


> 
> because s->num_priority_queues is 1, and so you've
> asked for a zero-width mask, which MAKE_64BIT_MASK
> doesn't permit. What was the intention of the code here?


The intention was a mask with zero bits set when only 1 queue is available.

DESCONF6 has a bit set per queue that is available,
except for queue 0, for which bit 0 is always 0.

For example configuration with 1 queue:
..000000

2 queues:
..000010

3 queues:
..000110

4 queues:
..001110

etc.

I'll post a v3 with this fixed.


> I don't think any value of num_priority_queues can
> produce the old 0x200 value for this ID register.

Right, the 0x200 value was bogus.

> 
> I'm going to drop this patch and "net: cadence_gem:
> Announce 64bit addressing support" (which depends
> on this one) from my pullreq.


Best regards,
Edgar
