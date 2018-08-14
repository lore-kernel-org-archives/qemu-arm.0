Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4166822wru;
        Tue, 14 Aug 2018 07:51:10 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxsX8vo0voHAzzKPsM2uazcC+ODTxEkHTkDU5baVPs9GWY0cTuomZsEnMXc44b1E/uEvINh
X-Received: by 2002:a37:8c46:: with SMTP id o67-v6mr20325448qkd.162.1534258270659;
        Tue, 14 Aug 2018 07:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534258270; cv=none;
        d=google.com; s=arc-20160816;
        b=0X0fJYgTZ+B5B42IPIzKpPj6Ebo63ANLjW7rtTtQdzS41xrcwE/pggEEVu2KhKjw0C
         u0ozqoezEuBcZtZumZ2Al9woNmSozpu08m0r5jaStmWzcgPgC/v1Xvfj7zI+bqRQSUKo
         KCbuj/tEhPuYdIubAzR8Sq0k/Qvu7/yzGwlrpzJDahHNRrdrpT82XGHiYcbkJT5DSV/B
         NYOlm2VyIXMBRRajC9AJLN2gBG4qplLXlirtnNdz+BE+mPV62qW9MfeRslbkvArD68ni
         OaEHZiLZs4bI3aBWw4xBRn0LZmo1fDT9wxBT+fP+nvJU7ixnE/3mSftlBUyhbDIQlrXr
         j4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=iY87agz0QCJtEMS1X9C3AjJItQE71muEcFDlYHvpjg0=;
        b=PXKN+cTEvyuHsudgmj+i0tXTA536ETl1dMldDWb+7rKFcSksRTb4YdVmVZ9FVZe+ES
         LcEKlZCf5Rm6oLtPIgOgz20boBmk/unUmaPQ0m0YmH6mkzWn6J1puo//4gklhRGqdI50
         gByyOBQ9vQWnqGZS0TaOcJelFvsmzaJLOTdSnkIzWExgfZXqA4yk5RMR90HCJRzb7w7o
         NAWB06lqj1w2dYZVe1MnqLG7xVO5rpjl7JVHVwwuo26Wjjs/ge3PfwVKBg/qP1er3Rp5
         O+NbhNASETivvbNwOHP+ymp6xLZmSLZBEK5EZrB57b5skg0gopKNc+omR/73JXACmETv
         49VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=HBVUjsKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si4980981qvo.110.2018.08.14.07.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=HBVUjsKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaf7-00051G-Sd
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:51:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpabM-0000qP-2V
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpabL-0005Ko-4V
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:47:16 -0400
Received: from mail-sn1nam01on0070.outbound.protection.outlook.com
	([104.47.32.70]:23068
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpabG-0005ER-EE; Tue, 14 Aug 2018 10:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iY87agz0QCJtEMS1X9C3AjJItQE71muEcFDlYHvpjg0=;
	b=HBVUjsKMvAGC6sx3L0463c7o2QSn0W3FOFFoWY8nKk8Qcy1zDjgrbiTsADEdMB/IQmwNnKq1NfBDM5+0aGb+3U1jq3LOSqSttgYQumyzhWc77m6XKhsya/EBysgF6IAMZHnucqEn8k7ceRjC1kvn9vBEIKIryyPQL13Drzurnxw=
Received: from BYAPR02CA0054.namprd02.prod.outlook.com (2603:10b6:a03:54::31)
	by DM5PR0201MB3511.namprd02.prod.outlook.com (2603:10b6:4:77::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.25;
	Tue, 14 Aug 2018 14:47:08 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by BYAPR02CA0054.outlook.office365.com
	(2603:10b6:a03:54::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.21 via
	Frontend Transport; Tue, 14 Aug 2018 14:47:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 14:47:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpabC-0003AG-6B; Tue, 14 Aug 2018 07:47:06 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpab6-00025a-Vj; Tue, 14 Aug 2018 07:47:01 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EEkvaA014895; Tue, 14 Aug 2018 07:46:57 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpab3-00024w-3W; Tue, 14 Aug 2018 07:46:57 -0700
Date: Tue, 14 Aug 2018 16:46:56 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814144656.ww3gmgmdknqsfp5x@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-5-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(438002)(189003)(199004)(16586007)(33716001)(36386004)(76176011)(46406003)(107886003)(81166006)(8676002)(8936002)(6246003)(50466002)(229853002)(81156014)(2906002)(316002)(97756001)(106002)(26005)(77096007)(106466001)(186003)(14444005)(63266004)(356003)(6916009)(11346002)(446003)(486006)(126002)(9786002)(47776003)(476003)(305945005)(4326008)(426003)(336012)(23726003)(54906003)(5660300001)(9686003)(1076002)(58126008)(478600001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3511;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:7Kfh1Dfw2YY5wOKHvNwP8Ts4D8jQZWQ7Hladze5pFhY+yDmxvi8rFdoRgX6rD31qQBWlGyxalxiIwWTK7gLjViEe1bxfVpfJAQvEBseATVmJOwk0hyWWLAyif7sY5x//
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3962a733-8ce3-4f1e-c135-08d601f4cea6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	3:2fG3HwTknVqrz+CcKJuh7DY+hj5nC+UwFqcDbEnjgJ4cph/RfjmSw7f59SuJxmGc06YqtFd1iEyNv19AWJX6BjZOjxxXKh4XzFpMxGbSlWxCbCqEjau9u/8PDM3a7pvodd8ka3vJyCQrIuBMrsviEb6zGxZ08QFX8xfvrdBZ9qdi8CgaXxgA2XQ/HYDdtFX2VrkiDblyO7EHh44GEMxXA19j6LlXhh9tGTjWZsSXhf1rDaGHjcTpLKqULWQG2f9fL6hiaaeaSIreW+9v0B4MaDQYxkiSjua33oEAXtdjw+59boKKcT0M7F7xXstek3u4ocaB8cgG6l8CMU2RteWfYYq+r2PVaGc+QIs5BNwPfLQ=;
	25:h5bKpPREIU9uJ4B5vOws2pzz6wR0AGvsF3N68g43HgxTzvPzsD6B4EtDQCPl5NFo6L3PGj9iVAF92p5hDxHvCFgA0jMYcBHfUfRcO3ngCa/+CEGb9MsWRqqE5FdsSdd1hwvxLzggnBdLkJlMHlZ9SjXydjiQCQSR+wl5K55FWnDOyIBOJURM6knSFTBYATqj2t1fjELVFslM33D2azClmDd+ver1vdfqR2bTMQja4qs6vEiH1xdjwCbGqtSXoplmm7Snxo9/qCNxYMjPz+ERTgGrQJsp9f418mEuMsSdNLZUP5ajUKEGqQdZ7SdRfOIkn9lu5soMw4TcCy5JsYdRxA==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3511:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	31:ydsH8uk23AgBy+Q416gpf5XNpJ9zyDABBE0R4n1O8ftTSdRzPsAgcwTNS2VnRqubklDXWpHD1zT/79abAEt7KQtZKtSo9lHD+dm0C9rh0JNpPxZxtZhTKoe+7ZdAdPE04smxtkeYDSFfM92IlDiyhIzP6she0r8UR5OHnaUow9Hjn3Vl2kLME1DHrXvmkF9O5VLIRnNmuzur5ES52mnGhTzB2WK1zAyYuD1divvIPXI=;
	20:rciaKQq1Oa84FTs+WIQIPRwWjhCTt8H41kkjG/Es374hH0OECoj6+rYLrHmwG4cUwPS0QTmoctyLEHyYscWg6oORVMKVjRTbzq14jdouDXFw1oNSXgRc5SmwmjnYep6ZkGDiDkiJqCzUckVbxyxIVmf9bVqOwSPwLREwocRr7htFCzttieiMNoaq5pB+X+tJK8HQPJqDqZDG6QmJdqry0Ohdu9EEel6N4v1HRljuv03jIk3gLNVsYR12jFbWRMloZaSiIzYv+yj0jRA4onZNUvjBIISSJU0Rjvj/j+Uip1uR0omFbNkNHBiXHExDilMphoy8rn/CxdLzYgjZq9EJeyRfrCkou6dUshm6NWeNEZPc5xna8GENhCQYFHmYi1vzzIAsQRU0ndjElk9ryb9zbMJPkxcLWCqA78XyyGBQmlhwJPA62KSid+cUwoSbjkcRQC+kLotGnYGcWn7AUhEAzHLmqbj3sC/xv7S9rD0NsVKuGq/vnFjHOF3LkZwd1hx1
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3511D6C840BF5BC9DEB5EB48AB380@DM5PR0201MB3511.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0201MB3511; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	4:5RGV+PUywhUHwqvxRhI9JGzrLooo0EzNtdlPfL2wE0Crz0iYx6JP+y6RZPAg8deUhfVenx1NTWj3/y37yx9S82qCNamgxpds+YTqyBOCVxI3vdkJsekBKAWzGoL6AP/1d0OOQu6wqafWUGEYiEFMLYkRloPG953E4aPm678+SdU5TOHlA5a1JUy7Ueb0MITBxSK7DMpHAjJO0lYJcZ8p8XvwL9F/o74XZ2ot01oK/3O/Ez2+paSo4MNxLJT2xXP5hQWQPpfTyMIOFKqbQkHJ27bKKrpWeQSSUlaRWPIqK0XD51tnkJq5Hpw5IwrejsjQ
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3511;
	23:AP1ira5KAePDJZGYe1yAzfMv7ZQawxoZvZTZfDK?=
	=?us-ascii?Q?7PFBpyTwZcegd5qL4+EyS69GHkTux1QFUuAaicsXBBcXlALRdzOX61P3wIDW?=
	=?us-ascii?Q?QvCUfJt9YS6MhRwPGO+qSglVZqOzBofLsFGXpA70Vf8s+bqLW2aCzplpeLvr?=
	=?us-ascii?Q?I8f+57b1cs3ZFQ541Q4xmzx5RBBHMJLHbbJx4WjDyJ5g03t6wLu+iKNRH3TZ?=
	=?us-ascii?Q?fzPLM7kjZ4571sQzC0FwNvL1py2jPX0K4BHrolccLLZYzBKbKOH3tcCcf5Kd?=
	=?us-ascii?Q?7aFFxa/9Z5vI+sKmSX/j1MeemenTbm2S37SOnvTcmte/XwJrwaR5j53hvdS1?=
	=?us-ascii?Q?vNpL155M3nxEzIA0JU2+fapMc/DL+bcVvqXStUFPF405Ui79p0HI0XT0EfWP?=
	=?us-ascii?Q?ImUJQeD31pALcUnqO4sCD8hkB0MYSv+r7FLCcY9xPc6iobocuY4HKgi0FIGZ?=
	=?us-ascii?Q?tdIR1XNsBgrV6+k4YKU6QqkT0A4WKE62jp/DdZgni6rXNzubnDNqsWskhtyW?=
	=?us-ascii?Q?X1qwRIGs1JT8oRGJkD/cbIO+y/08WsFtqoSNAI/mG+OyIyw3TGW/fu7SdA0T?=
	=?us-ascii?Q?o28zSMcuRiRenZd7VLIJ3Hn/9t9euacd06UxxUv8XVmmXTxt7ppewzwi5hZY?=
	=?us-ascii?Q?ZD1xxmOuTHrCWUm8jiMT1BziaKPiMRmjWW45Odx0cymszxd5FtZwxuruyJpp?=
	=?us-ascii?Q?SGRc2mCmlNPrvD5K5YoSa/ssGzda+UUZXGlihT2yIT8nqRXAUPcT01cE1muc?=
	=?us-ascii?Q?oi8UWEdT+rB16eKKncC16MyvJEtXmVgq8FzOKV83NTAJw+DT9kZcAJV5H0Yg?=
	=?us-ascii?Q?QyiAran2v082u4YBDK19AwXPug/bM8SvyPCfRgB6PEsO4+X/oV4pBlDMkW5l?=
	=?us-ascii?Q?XwLoyyYnRB5Kk3pT9v3OBz+PBvbuBpco/tsOyLDk8AvnWJfFqy7vwQoxE3vu?=
	=?us-ascii?Q?k9EKeLRZERpRaBbIlgLkicoxhrOkj/YeyGQww6XUySmhm2RkKJ2jVtyqkw7n?=
	=?us-ascii?Q?14DWh2HEeV9BKtXNEWbjfv8KZ2dVx8pxWsrdY8tKu+gr2qnbP0qb5qL3+Ua+?=
	=?us-ascii?Q?GDX+v8MWSkrSzUaSzuYpzNy1DCy0zl5ZPyZ2qsA02eYretweBTpNu/JaoWfh?=
	=?us-ascii?Q?HQj+Uw5yxWnTLC0aTjJsVO47eU8BEm9skSjpbvCo+XQpCM9e4syR5306tIHQ?=
	=?us-ascii?Q?J37nLXc05zfzDsqo=3D?=
X-Microsoft-Antispam-Message-Info: 0j5cQtwTQmVRZ9WeTAe09OMJZXED1Yp12TrKHWSUjIqdTPJuvI1S4+i6/BXeu3V7vv5/GN8pF/ZOZAQWBxtPmfL91oCY4adPg2mKTeupiXUAu9D/kOpARSW/WNl84UJz64h5bOcQLfYqxqd77IhA9KAVj6vjPqKwMJZyhoJlZt6PSYdd2QlwE1ETWuoYSV9ZVaUTxlmqII42VyC4XJP1Va0WjQT9jGU1CBCPdu4D1XkF0VfLOr8MWvz0g0mFdj4B8Y4W2eL7gPH8j8LRtcZnKfOPYCSgxXVtHCbScu+TJi5Jn6s+5ydV1SlFl2r7z7wyoiZ8y10qLaiFlwL0FJ5zLQJqXBi5CG/UaVHjFqwt7+M=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	6:u0Rfk8k7sYw6v8H52ma5qagroYmA1lPs2vbZmOgRl/GZQF1r8iI14XvKt0vHvy3aeIaqmStj8iklEH+Yjv1K8BkcbKfau4eedJs6VCDUSM8ptJtlutRMGzRlsqVYj/A6q+oA/5VNrrUJnPremADveW0abSTIo8WYOkb+2NxeLfl3fo+9bWUFyQFZOX/6grlDRezFM/io2RESRgRMTBO70M0W+qfvFpBl34Xizv7OXpI5bMX4r+/B5M+jBTBM2gLR7PfZ41e5LIUzUBRCv7nadAvgXSlouDFFolK/MAh9JlajuPTT0TxrOpstD8kpKZXVgFiDmzsXcnzgB+Be0o4er2Q6zsDYhwWCEr+CLr0J7OAlfLsCwHCZZ4AhwWpEjlnC+Wm8P7jPyEzf/Tpa3lOAwHVxh4c2XpwtHRg4nTYYwIzrSAPe6bGlnMvlJA51OPhw0DM+SP3O0VldCQHciZRf6Q==;
	5:F8sNS3d0Fkwh6Q3Aqi/NMmkhLzNJaNm+HBPJ3eSxx1wxyO1iB9cUwnQQtxC/jgjJlOIjr8aXaNzcL5pkyeAeKwFJAvOtZfYkZ+as91wEO/5YL3wWrht3L0rrq9DUAkY0Xu2wEVXy0CnolOcJtQ6yFMGiDIZF44WX8rII+BqtwdI=;
	7:Q0nYTJ672SKVOjwaxh7753ilrRgtdmeLdcR+l3q3Gq7UufQvhTetlai+mb/MZf/zvuyAGvh5WoAv7iqJs+MGP1cPRmENfEj5EyANdY6ysngq4WpJeaU1idRvPb5zD/um2lIuRHbrZXzG+afwC5ZGItIzD3dPBxQHn1heU94NsG1a/1R24g5I4W+yoVKRlKx4LTS4zOPj4SocVFDRYSLSesoENSqcvMAzv4VZNvJhwCGm/efpLcg01FgoNPTP8unT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 14:47:06.6905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3962a733-8ce3-4f1e-c135-08d601f4cea6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3511
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.70
Subject: Re: [Qemu-arm] [PATCH 04/10] target/arm: Implement AArch32 HVBAR
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
X-TUID: ROZli6fC6RBc

On Tue, Aug 14, 2018 at 01:42:48PM +0100, Peter Maydell wrote:
> Implement the AArch32 HVBAR register; we can do this just by
> making the existing VBAR_EL2 regdefs be STATE_BOTH.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 14fd78f587a..b6412fe9d1f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3750,7 +3750,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>  
>  /* Used to describe the behaviour of EL2 regs when EL2 does not exist.  */
>  static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
> -    { .name = "VBAR_EL2", .state = ARM_CP_STATE_AA64,
> +    { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
>        .access = PL2_RW,
>        .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
> @@ -3899,7 +3899,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
>        .access = PL2_RW,
>        .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_HYP]) },
> -    { .name = "VBAR_EL2", .state = ARM_CP_STATE_AA64,
> +    { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
>        .access = PL2_RW, .writefn = vbar_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.vbar_el[2]),
> -- 
> 2.18.0
> 
