Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4149335wru;
        Tue, 14 Aug 2018 07:34:20 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxgfUkEXvJn1BXD6fpdGSiYVt/L+OePvGnja8ucWi0dyVE5gwRyXY67zmHJzzklOV87ZRlt
X-Received: by 2002:a37:ef0c:: with SMTP id j12-v6mr21113289qkk.241.1534257260374;
        Tue, 14 Aug 2018 07:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257260; cv=none;
        d=google.com; s=arc-20160816;
        b=X0Lm87/S+4ZYdxyW8YFGORD8x6V3Ek5xtN4D7X39omMFLKbvHVEXm0qKj1T/4dJSt6
         LwHQmUBpCcmX32rit1PWb/5BYSRupZL7Km5sA21TlCHVfAwVQBBFQSU0vJNO/8sKXwVA
         sNHAhIiveFPyGYl7BNqN/eEjTjTUT9pr0+uPTmB+y65xqKeM+JHNbz6z7uxr9fgxrkce
         zsTxC5Urw8GhWlfmrTebi4ZlubYTzM8NDVYq1kRIew2J3oh015dx8TDh6TgboBPyBUda
         cXkAtccfTb6iUIeflnKah6fUBI8fisep2/LtEf3gUOkgBui7C/DZyfybZPSREVNP5ws8
         5K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=o0gGfZMB4XD+V56dy7CbsD9Ag+7suCpMfcr3FPUGl0Y=;
        b=wp1j+L8ZknUyO1uaEAQ5PWEVZRwbl20w76q+gOBFdCCdNgY8/F4KfiANckWwUD4Jln
         AKUlUWmB5f5pVfA3D1qNXqz8IN9yxXLF8JIBkFXaefR3XuuQiTSkv248Azkt+WHfnIje
         xiMqtQIKGX9I33VWUKsYecCXEOC/lYx1Njuqq1YRJCn0JKf3u6eedMLwYbiD+PFnE//r
         SJ7MKfO9IN0jIqsxsDc8gX0NUW6LK5xlGkkZ2H1XlVrEK+yJpVKkmXxRB6L5McWgO1FW
         /FRgPDMcw6Y74v4jbX55YCNxzUfhuYrHycimhOa5RCq7U0u0ZKBO/IhVSGIcPleGexLu
         94vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="x1rM/vOe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j55-v6si9293649qtf.239.2018.08.14.07.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b="x1rM/vOe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaOp-0000ym-Tg
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:34:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaOd-0000x9-ME
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaOc-0000b8-PI
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:34:07 -0400
Received: from mail-cys01nam02on0087.outbound.protection.outlook.com
	([104.47.37.87]:51582
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpaOW-0000ZA-U8; Tue, 14 Aug 2018 10:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o0gGfZMB4XD+V56dy7CbsD9Ag+7suCpMfcr3FPUGl0Y=;
	b=x1rM/vOeidT+cIjpcKy6YUKo7c4kKHP3UsSAG8uvi5dcxKUaD63PAmLvtr1/VYQM4oCda8Dua8NnN+kFwbrHrF4Qc/YVxVRmqUfzJ1fwcNZljZt6IQMUDgbMW/fH1wes9bezenIxXWVye4asQx42JYQ38Z4//sqtwXkMhLKNQIw=
Received: from BL0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:207:3d::35)
	by BYAPR02MB4453.namprd02.prod.outlook.com (2603:10b6:a03:57::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.25;
	Tue, 14 Aug 2018 14:33:56 +0000
Received: from CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by BL0PR02CA0058.outlook.office365.com
	(2603:10b6:207:3d::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.22 via
	Frontend Transport; Tue, 14 Aug 2018 14:33:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT030.mail.protection.outlook.com (10.152.75.163) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 14:33:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaOP-00031S-R7; Tue, 14 Aug 2018 07:33:53 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaOK-0007Zj-HO; Tue, 14 Aug 2018 07:33:48 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EEXe2G002497; Tue, 14 Aug 2018 07:33:40 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaOB-0007Yc-OG; Tue, 14 Aug 2018 07:33:40 -0700
Date: Tue, 14 Aug 2018 16:33:38 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814143338.lhxqnrebktuvvrkp@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-2-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(438002)(189003)(199004)(54906003)(46406003)(356003)(5660300001)(6246003)(106002)(97756001)(478600001)(33716001)(316002)(23726003)(16586007)(76176011)(107886003)(3716004)(50466002)(106466001)(1076002)(305945005)(6916009)(186003)(58126008)(575784001)(63266004)(4326008)(486006)(8936002)(36386004)(446003)(336012)(77096007)(229853002)(26005)(8676002)(426003)(9686003)(476003)(11346002)(9786002)(2906002)(81156014)(81166006)(47776003)(14444005)(126002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4453; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT030;
	1:PGQTgu3KDUHN6W2ww3hnasdq0WnKarpBlbtts8kUUb0ncsVJiH9mQOXi8gKJboYFKIoIevXkQEA/9OUHwx2k9DFKr02daLP+DzGxkJmn0l+JNYvzL4hazt/98/oKKyEq
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0984c072-e744-43f0-a55e-08d601f2f658
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	3:ZBPYkVprd8gFVQCP6uvPgXlGusu6Hwivop75QSofJItepx6gu+N8SLjLmzPEAhfTQA31g+UJuGniEh9Q6WNx7RUs+mY64sLlw31cy2DHxvwbiGC9c91peH55h8LM874bzig5LFV2XPVNX7hFNBiyz8N6F8g+SwUltkWYT+DS4g6ab1WGh15faYyP1bJoDGeWKBXUNfhGDz+uHjUA+KxTFCtYTcwqzHLiY6J8XCB1uP5+zmobR1Bg3aaDVujKDk4HCdlu4CdiJl3Uljl5j4C9mU88G48wpM865kDA3oiw+fBGtSvxIbVXZ+B+B00MR7t7UEjm850DzVEfYmkn+J4C0TAxalQ7+4m0m7TqIjykLj8=;
	25:URVK/6Y/7l0PS7LnYYl3EDfD043bGF3DeyrdvKoZBhG6AqvHkblU0zy+cH85Rx+C7BuB4TwGcoUpzeRJJNO44W+QRa24O+JC7QuxuRRO3P65Ih+0nDm9gsuoltjDplz3MIjNUUT/78gFH94AR2G/A9VfDFZ8LoVaFJbPYT89iYKodM7zCmIuPY5k1Hq+lRpn4AE6LWvKhlG1syJm2Sriah9383WN5Ldpd/9DuCzG0QjVch5/wjVN5uB3+yxtq3/mEcnWUcU1+wKJnBs38fhaXTP7WXJsaRWDLngbTw7ghb6A8Ntr1fIBhzhvNEyUZH6ySMEw1FN9nT0Qqqanz7+4EQ==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4453:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	31:3Cs3n2Q4eTaoaOvDUq1F9iasl6p4Vg1fORNW68PKUqm/XxHqncRHNOfGqPTnAj2863pS8enZ8AT5dXKXbntaIQTJ2EMMzW37pI7h4+h5gHL4yy+mR46Psdoam+jbVDnZxSueq71wWqX6t+HicnrQmR3xubtFRIzAT7EN/sp+DL1W7uYoguh857zSVZJxogdasUIHO0lfNA7iP/acxfdqGCBcI2m8QCO2SnYEn0vZ398=;
	20:4kiTiHv2yi5QYClnRLFOwVYs1wM/hzXS1B0wnYCqHHxkP98VJHXHJqlrS9bxmzUv141hmHpPFM+Lwu8IWww2B0wbLhqsd1PVFwuA647y3dQWL0JMGhRv05FJdF3IJVg3qpj1vGVGJ06B69dppymLa3LQrH/zxNrC/HejbmIVeaOnjCeSkqeHrbWtyLodZIlJl0aLBeN95XkeBZ3ZYMp9q9BP1VNEpbWT2S7lfFZVG9FRCj5XNzZ2AkPLhZMaGXC4t/lVCP4gPjsG9EljsIpEHQhCbsGah/seCDvsw2d8v4OJEcF1wmTQ6HAoRi9XNcF15X1ejblwjy4y82k8z5+NA3nogf3G2AiaNM/WGoVIHC6Whhw8hlRMDAC0gljIhKOn6InKte+OPBoIrevyPhpg+3nzzbXYDdnoH1CHHNEfe1DOwX6JZrmeg2oNI4RkpZv3NJRP0URbP6KebhOlfZCpBrwcDwWjZRXUytwdloxo6lw0b+3wgAZcK7gdWcYUTZUw
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB445345A008B9F3B0F4BB6713AB380@BYAPR02MB4453.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4453; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	4:acq3jEZ1AxdWx3RYJCEu3ingDhfOr7YlHO+gPKLq0wON+P8LkSgLYtHPm3kwORuZs5DQSuT1kJYLxz0bfD/tmDQRzVL4GfRaRK6LTDl2gI4eXOqR8pCB1IoxBbHjzRRFJdv9aMroalouFNejOZ1f3wPvsd2+CEQ62sYiGpGu8p7F+9fhEHuRPhJynVfl0QfTGqYuZSeI5axNeCODZntP/ZIcC3WagN8F5dVYSP5I6pSgN8v157GeDbG4iV6vRo12muPpw0pFcgzZgXB++t/8Z+1pJ5JzfjDEEN+hbl0qt1heLkKbNNrtUBSG6hESswUL
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4453;
	23:xhX2xSuV17owhPQ1uJQ+h/nbZXBlyr//U7x6MQfAU?=
	=?us-ascii?Q?zpR3y/6xxj5pbHXgNTk6SjLjgNn7Syy2BkV94oo7HKZVvomysVDAd0NqAUaN?=
	=?us-ascii?Q?7rw956noRZbtlbTu4iqW7LuhyCEtx7Oox47lShhw1NOKZYhT3jNtLpdTrS0n?=
	=?us-ascii?Q?MeBkRsazvS8Ais15jAjXV8hULag7rIGPD9VcvOUl/E79wbRl6KCw9XfsgBhW?=
	=?us-ascii?Q?W2QStzNNvlBIB1SpGcvaTvU0cmGoV8hbz7Extuudi5UdO+H3q8s1ipfDdXCG?=
	=?us-ascii?Q?YTKS5PEmWh8wzu0Gea4yy9ZIefl3UDSVJoEe7KQrqJuEpCd+oAqk/6lfVlGl?=
	=?us-ascii?Q?5tmEbQolPAd4z4o/5HdBEeZeUQnVp5TjdINNpDqW9PfgTZdVDjyBFDK0PacZ?=
	=?us-ascii?Q?d2TqmaNQdp9QG+wdt5YWH2v0OhkReC7Xziz1vmB2rJ3L0UxTLYQtIu84HBcX?=
	=?us-ascii?Q?38XaTdNR1mbIbZZyjYPJt2n/bZw2IHA7xslKkYTLMX79WOyLbEzAVlqgOgDi?=
	=?us-ascii?Q?Dy+sJoO35uWHLTyO5nSpQKZ90QDSifQe1+rvlkBRGs6/ncDBF0VHZdokCcl0?=
	=?us-ascii?Q?82w2RpVgnk18n5T11oal/4KtitbAfaJhzytoCEYoPobeX/GURkr6+ZEs51js?=
	=?us-ascii?Q?ohBz8TNy6nWqFEZRQtIcJw69446g/1WRKJ6NSI18qpZw3Hj77WIBhIn644gJ?=
	=?us-ascii?Q?Z4JutCPhEcYROVGK/H9l4LHbWNZK1OL+xLBAujjdleYe88t7MAUq0ycYRybE?=
	=?us-ascii?Q?HwsHqKJNcIxJVhowOsOzLfHWH/d00JhDl5UYpf6qluM24Q5tXUzfP8Y5wLvk?=
	=?us-ascii?Q?OuKGtdg7jhZmJz4OCd/dF7FLoWidI3w3fFv2S7agSXZLI85bvXX7icRu1EMZ?=
	=?us-ascii?Q?DWIusf0Vn3eBRU+Jrb501RZNr1qMLYS+aBZDTnkWmzenNZFeF+Ic3tUqSE8t?=
	=?us-ascii?Q?UslV1bhraEJTveSMRhFogOPXOeP9uK8undTyfZBjVlPUWEhpyVDLjGOXqdBV?=
	=?us-ascii?Q?9lvt3x+9WCbKBrZVLKJ8Z6CWdn2zgfuDawVo8O1eCV9RjKv/+XFW0+E2tyX9?=
	=?us-ascii?Q?snGf+wCDnSqBRD0yMt9DkbGxlUOKib4Dp8XgMTD5a5+kkQzrPONqK1bWDEA3?=
	=?us-ascii?Q?AxUdCg0IeQfsGAjsyqGtczztUoRdY1Q0otkZth8psWzm3NCHLAvuSs6uY+ia?=
	=?us-ascii?Q?XI5QD1Q0GIC5p5K5ZoF1lPVq6tm8WTmoqV0bcgRyyVB3BrdYbjl18sjKg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: ASxWb1DnLuKfKw1wo8DBQ85Ujwp9gB0oQ4kf295q10fPyO9a4N5fySiR/YgfEbBReL7hFewFB5DoVkBUooo5oetKeZtaQs1/LoEf9EX7CXbhEcEAyQ3ui0kq0b9WalQxQE6+ckMdDvXD9hF8amXcioD9sVaQEhB82CWlZ/2XoaZgDAMkabJksJBcem1xC4zRBxhhwNqBjV9AWkZZR3d8iJD9fU/S5HxRlRrUrhYfOxU9vsy0Yv6Oll8Fgi6vqSibOztuElc0qdHs1O9vG83OsqNUXi7YhrZB3sAYRCjfW8/6qetc9+fBk5kjFS3gnezEOvaJ6mWAyRPNBikRsfO2moufLaAzABUMuN5PFaJMVpA=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	6:l+qqrbD4BcCZ2KSWbXNxqxR3F4P4TIRwtYZcy3eVA3EWG3AQKefN800LXp4q2cOv0QpwswZjRvL2I0fersG1AtGMeFGQYR+uESxy2pEKpary+j031mCKQ9Fa+M2IeEoLF4ekg29PLs3sSMqCdZAdQJxbty9uJrHgHowKKCm5zSQ6GpZn8+UzX4x6VrAYdVsljCYiYbYwqL8cxnV7cSx2RjkPuJL81d3jAPeZiZvHvEI5qsQ01SwMnLCYnKtzlewCJ/lWQwnutdWZ/ManuJ9BHdbx/l2kPQL8wGBT7rl0p8DXSM2yZuAuHctuOnyQ7W7+FdAegUhR8NKJcP6WL+Xg8xnBNckPU21TnMstR1+BLEgK4cLPkwh1+XbOqUEiNpAvPR6J53jJ4U1rBtsWONmswJPrLdJqEQqKTkViDfZw5DmMWklDZ9dQigIBOnkyNAVB493jF2iiRLe2vVWsC8UhHQ==;
	5:MudrFFjyMMI3fHveJk5vKavNDTO0rqcltm+OqXIgdl02oj27PxypCye4XsQMCyv0wmOjaiXp9lZRv+7RPlxfMYxQtRw/6zwbxdIHLdpOvDi48nz+VVxfJg3JIw54fgW9UGwdu7DWQZEfxbHrjDKUvqrmru6rtuqKJsiBxu3S/lc=;
	7:TFSKMACdu4tCbqc1ItUn+kQSO/sMeJ6p/adpcg5EPAgNc/zn4zwpQ3BI8lc2UlcM9bluifFq3metKooJxWfRnPdkYoffygMJC7A2Fe7j4jbmT7nZvMti16gEBA+plV1bBtGDOlLjdrliIv0KWe20AAJ80jnnt8IoMVYE960A4/MF7x3qNn/O5pVimz8bSG0Qj3X/nRDpxodu/GvSUaipV1IkLJfNOzA7R/c9IVTKLq8ZSaWGX2m3dnREbzBJvOBD
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 14:33:54.2940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0984c072-e744-43f0-a55e-08d601f2f658
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4453
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.87
Subject: Re: [Qemu-arm] [PATCH 01/10] target/arm: Correct typo in HAMAIR1
 regdef name
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
X-TUID: qeXCkiBi1p8J

On Tue, Aug 14, 2018 at 01:42:45PM +0100, Peter Maydell wrote:
> We implement the HAMAIR1 register as RAZ/WI; we had a typo in the
> regdef, though, and were incorrectly naming it HMAIR1 (which is
> a different register which we also implement as RAZ/WI).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8b07bf214ec..2c5e02c0b1a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3773,7 +3773,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 0,
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
> -    { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
> +    { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
>        .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
> @@ -3925,7 +3925,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
>      /* HAMAIR1 is mapped to AMAIR_EL2[63:32] */
> -    { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
> +    { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
>        .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
>        .access = PL2_RW, .type = ARM_CP_CONST,
>        .resetvalue = 0 },
> -- 
> 2.18.0
> 
