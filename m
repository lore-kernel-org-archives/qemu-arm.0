Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4161577wru;
        Tue, 14 Aug 2018 07:46:11 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyu0XEV0i942zuFIqt8MTvfWgNW+2/eryZL9FS//h/Aj+i1wTHb+j14cvKJaiIVH7bRHsgO
X-Received: by 2002:ac8:2e2f:: with SMTP id r44-v6mr21107331qta.357.1534257971661;
        Tue, 14 Aug 2018 07:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257971; cv=none;
        d=google.com; s=arc-20160816;
        b=uUGMS8aMmNTV6rSKItEtkqFhjXwCLdOWO6xwNz9Knf/jXCB4BOCU7U5lot/uvnWCox
         sAURO9HuIAh53eq0gtNYzec/9ghsbkVuk4IhNaWozQr61gwDwzCCc3GEEWxLXl/yg92e
         gf7+UrdI/g3rqYFI0fGQJbFNP2VTFFxRaTZmjLmfv0lnqZAfPSY2M8qeXNs4iGV2qYhj
         dRIbp4EDMEhJU26HCVLDGo7i2H5f5jEcljdEa1ghaNDOoSrVuCJBHf+CA0x7b3Ft5W11
         9XNKBIRasmKvOUIwpGmQw6SNmUtfdnBM0CJpUR1Lh96K3lft9pH4WtyEe4yLV6kGKgAH
         erCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=+8wxDCDP2tP8vgWiBYiQxfvnKURENQ9KTwENt1GFZMI=;
        b=Wza1DTULvts5Mw8KNt9Y/Y/8XqG7F5OoEG14oVqmgnAscb+CN7pZMiqOgQz9dcH0xp
         vzJqKJnkPpJK2qffhbI1wKfAk/xROMbA3GFawq+SAkKkNn4gz3rpacZKnFG9Th1aL/gL
         mMCBaXiJ0+kOAPjreyruXUhlwLaPXMEy9W+NxUeY5Wlwj0vojDGfT2Utn8XaH4IrVhon
         FIlxOgJmFK8x/ZaYfaNFI3Oewr0ykzd5T3GGCuIxIF6UCIn0SHcQ42tEle/RBMKCuvUL
         6sJAydmiFhnh3OsF94rTb5d8fM4sIoG7IqOMRrSRv3kNHb4vVz1F71Yxh8C5yAj51JRE
         Qi5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=2ZS0EZz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 28-v6si870101qtq.264.2018.08.14.07.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=2ZS0EZz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaaJ-0008OM-2w
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaZQ-0006zo-A7
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpaZP-0004NS-9F
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:45:16 -0400
Received: from mail-co1nam03on062d.outbound.protection.outlook.com
	([2a01:111:f400:fe48::62d]:11022
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpaZJ-0004JF-CB; Tue, 14 Aug 2018 10:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+8wxDCDP2tP8vgWiBYiQxfvnKURENQ9KTwENt1GFZMI=;
	b=2ZS0EZz0HRROb2IuJ1FpdtfcDPBVCFfesRUgOixAoUh5hrxDQHfJjTZuECPjLm7HyxgE9dndanXXB41KaTwC1HSnQNUOp9a8bz+LmB0R6cQJdb3SEIB56ZNossO5ohtc1oX3vvukAbJY70UhWY5ltxvS/KbJ2Q/nIRx+GmAYNHU=
Received: from SN4PR0201CA0017.namprd02.prod.outlook.com
	(2603:10b6:803:2b::27) by CY4PR0201MB3508.namprd02.prod.outlook.com
	(2603:10b6:910:95::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.23;
	Tue, 14 Aug 2018 14:45:07 +0000
Received: from BL2NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by SN4PR0201CA0017.outlook.office365.com
	(2603:10b6:803:2b::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.19 via
	Frontend Transport; Tue, 14 Aug 2018 14:45:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT058.mail.protection.outlook.com (10.152.76.176) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 14:45:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:34409
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaZF-0004s3-K4; Tue, 14 Aug 2018 07:45:05 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaZA-0001et-De; Tue, 14 Aug 2018 07:45:00 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EEisjZ013737; Tue, 14 Aug 2018 07:44:55 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpaZ4-0001ee-IL; Tue, 14 Aug 2018 07:44:54 -0700
Date: Tue, 14 Aug 2018 16:44:53 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814144453.fjbzfpxexhg7v5vj@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-4-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(346002)(376002)(39850400004)(136003)(396003)(2980300002)(438002)(199004)(189003)(6246003)(107886003)(4326008)(8676002)(81166006)(81156014)(33716001)(5660300001)(9786002)(36386004)(97756001)(478600001)(2906002)(356003)(14444005)(46406003)(6916009)(54906003)(50466002)(305945005)(106002)(336012)(186003)(26005)(106466001)(77096007)(229853002)(76176011)(126002)(1076002)(23726003)(426003)(486006)(476003)(11346002)(316002)(446003)(9686003)(47776003)(16586007)(63266004)(58126008)(8936002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0201MB3508;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT058;
	1:4XW0eCq0xd9dNgd/EApwqGhg+STl2I0teqO+fsx2UYYTcLbrCSxQrp0dPQW6pCdipGvcGZteT+AIoYgk5u4FBV/Swn+z6MKXeQDST+PrJ+LeAIWUjHKMLpfFWYX+qZd/
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09b5e37e-9e6f-4db8-32b9-08d601f486e2
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR0201MB3508; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	3:Ia7+mn2IWWXBkWfpHu0z0f0etCEUnsWju6/uZvDJhP06xvzA8erqH1nsSczUvQ4lSBr6SC2sPNHzM7ldGS1IvtvklNtg/dh4c7+HvtF9IiEy1tVYgGusHI7pio7Pu45m4s7b9V35I4gfi3Mof9aTgwwRsm9czxXab0VG4UlPVY4IsMCaz9jWP1XnuJWsdCp++KX6cSj2vwaN3vBX+aSd2wTCPnI12deMKNft887XJDkliL+HdC4wT7F2hgQbs/uZ2hCGOGZG6y/IqmzOnTnjSow9XK+l7ZBiiMz5W+uAswp+sbE/+5VfFWYZrGWp8cnELUeVGbsi/rXy7+TFsLnZ7Tgx1FSO8bjuOs0OQcIfsfY=;
	25:8bgL0aEAHewSb9/c+K4fYSXqKZasL4wceaql2BSy/vq1xAH1IyOm21LJiZX+jx2rBYiXK+Qc9MSPKZTJuSWpLPu0V+0SkVKqj8O3JLwXmoAJDW9fL1hiR0OSLj5kz1u/6HbBJpUicmelkOFP7NPdYnlQmKdTZbMnWfkUYDu7k6QwuYRP1T7XDwzVXvi+nDRfri8j3PZAniz1mbBRCUBMNdmWhZkHgaIoztlTKRFtLIW7ngL9oY73sD24RiZAB5PTXQuXbgpLLAAwrsieJlLPdr+sx8oJM0+n6eQEOXv/QPPodxwgD4NFvvmy7Rq1EuMhTdSWnjajUEPpNDBz+1dczw==
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3508:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	31:dq4qJf1hbb7+zrHv+Npviwo4K3h7QTFtTTR6wmUFt+/i4pyNBmKE/JQOUeix+MRchR6FhqLA8YAZnIU0JbJ5q3IyAp3LGkKZUEvxwvaAo6BlAQn0FH8eIdtjafSrtLIOAbnAZ7c5ZNBlatAfugrurCincbwfUl3FTX4l2clrvItNpBI7doqqojRs8sNJtyvIQGR0nuEkO4w8IucsIj67l+oxDXrGYMCtvUqIRpZQNw8=;
	20:blAIGxZm3HdtoFYM2GD1sEQOHtAT971NjZaSXokA1bLt4dISowgkg9CkclzgVXsTh1qGtcNViq0SJNT5rNaQ8X34VTSW1e8G5MEP+vpOlGThRM2TNjwfvuNEFJFfeGKcPXpIintogmAgHHferJ+bDcBTCuiJiMHDzS3203x3KWgdaeKULqtZzlCRR0i9OTydKd73snX7QweC1b4elXQ5Fs6h5jo1YboCTiHJuccC2SOVjth1C+/F40bfrokjiE3OZRRob4U/G9gkN4FMdIZm5SNbGgEv9M5yuW+F+kgjl2CU+UP6Sj1xfI9zVSwkul/KLUnHY+S2nXlyCdH18Jbq65gglo03gX4wQwhRijg4bzG/BchkV/Lu8Bkx7bhG/G2MpVE/rQRz/KcqsM9jfAz5EseuKr2xc2w1nZxQUCPwU/fw77sEh3nxq7K1pvd1+/GS/OR9B3jUx9SODoxfMgUXNlbBdZ/hqsXFhl1BSsoFF3uV+J1hK+GDxz56DDQq633s
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR0201MB35086CE0F47044D37AECB2BBAB380@CY4PR0201MB3508.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR0201MB3508; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0201MB3508; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	4:Fyl+DB/9dfjNCeqsAbmFDg0GhOYm00gf//VhoJn2gXq6E6hzKaxpwEWsw1s6IEApGkGNvxTO6INi0FDOkbN2/6b+PiPCRHic5nsBs/F7endMiz3EJgXAVD1d+QIxhUQUVMUZcLmKTs7hcfU7+6Bjs1LG/jeeMDFoBrGUxYOwwQjasJ03E7jFepNuk3c83Z5XcbEj26A0V7QSY8dUgBNHnV18dEcvqVJVaVR6RIZcgyvcI2UMTo284kessmMPCqr5pnBUBtfzcgbk8Dq9QJGlUdVknS6NNJuJ1jQ6Uhcmc+9rmqVyNJadZ243mcOc622C
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0201MB3508;
	23:YMKXovxJSrHZvUlXInzNjpi31lcUvUonxq74p9y?=
	=?us-ascii?Q?CAMK/sSM2rmL1CdsBzy3fY14bMnoUebOvNGcOfB2SBi+oUFX+JnTwD0trxIz?=
	=?us-ascii?Q?MOBp9od5g1qDJwQuSM/WxI9+Aa3zLjWzUzjt+wHIcNGflNF9FOx0RlIOsx9l?=
	=?us-ascii?Q?6i46poZfQozbS2bIvrlwYiyJe/P5GMSkeBhRPfnjHMFulEkW2WJlZPdNhplr?=
	=?us-ascii?Q?k324ml48V+GWocHhYpH5rX567rbzUuXGsEh8AP/oCNuNkOCvnhh3mBLEB0hn?=
	=?us-ascii?Q?Rguk1Kg4iFghDp68J22YOaDuoNb5B+5KvalGTRJHbB5zA0BberLVwugj9W0p?=
	=?us-ascii?Q?gPHn+MMM84OHfK7RfA2R4Dirw/g1i9HsLoqX/ALc4bTfrkCK5Qb0WKfDwx+N?=
	=?us-ascii?Q?reXnu2CapkDueaBE84nO7uDj0a0OAVOUphG+M0P5W4vz5ZEWh3O1qxw18/zS?=
	=?us-ascii?Q?6iybWRBUzOtdyP5S97z05xYxeuSjqAVIBZUFE+oquTvS7CEcL07AjmV/q6OV?=
	=?us-ascii?Q?1IfcnN74y4eVnO3nMHbwFqxZEm0X2Qdpq/QfWptZi58i5OluShr7TT9yusu6?=
	=?us-ascii?Q?bkYmdafUvutJgqauT+tWOP+N9LLE0i1M89vH/asHGzm2A2euhtLjf4WAZ2o1?=
	=?us-ascii?Q?qXzvruhyOeGQ3o9zzu40vULM9zmbSGf14JLiwHlftnoV7V8UhZMGVvg/wPll?=
	=?us-ascii?Q?rkB8iwm1k3HRcKxE0qoFWGWOww2Al8RFL7lPJs00SnhmzE5B5ssHZNYJNCuV?=
	=?us-ascii?Q?bYKQHcOMpKB4FL3F4jVxuCqD2SEBcmKNFhXydzSs8bJe0vJ1oQQlBN1di7ti?=
	=?us-ascii?Q?am6Of9ffvnR9xLnzQoFuriQN1EZOZraPmE5/jogTTZo9d5JZAhyt9TJbQGhR?=
	=?us-ascii?Q?7Zi0ionFCZHw1jF2yyuqj1AFjx4DMeZ0l+xnmQgHI7QUepm33K7n3b15+KtR?=
	=?us-ascii?Q?M64BoDe06lsajYReTaNtn3lOfXkUSi2JjzUP2JIIRTisFC7Rv4SNfJoTI5m7?=
	=?us-ascii?Q?sCxUbdp9y3nRYSp5SBWohGpzPJjKjeBKp20XH7K2sfXSMCMw1UxelnAYSSX1?=
	=?us-ascii?Q?L9IMCobuSsW0aPrQ9bofLot4wbr1PZXlv6NbezCv/jHyefGcZ8sohiZKyR44?=
	=?us-ascii?Q?k8Xs5Of1VxEUbnvh+O4i62bDOJmjFBSPhDsEZSfQJkANyajBsz5QWf9xlGO1?=
	=?us-ascii?Q?vai0Vgbfech9UQpPvf3KvTWChyvuOcXQqCW+s?=
X-Microsoft-Antispam-Message-Info: TZ0G88JunMkkRvE49d39zRP+V+hw52KQs9sbuSg4dnsCMDslHQWFPIhG71ELtGLO4To93XwqoEKMY9Vg9iK9sq+f6weEr7yqtesr/ePy+OYMxBrX7FNNar3fCtGI4uW34XHWCNLDBJzAt7dTMoDpEBmqEQP+QvsS1HPVX/Tzkw7C5CNafZkkZaJVbcvVGHKDqJrdcrRemjpSsWHTmUy9AOkZxdNuBRDGkJEF4RcoCKp8GRWXA4JE55PMuPXwTzl7Nly4jsPwoWVJnGkD9ZyE//bQdeQTcNNbpSq03eLUeJn7wEmU/ihbhp4EoBs78tHJ6+2Pa2cy90CtlOv+UHGZhHkq3blxFmijjvgrdRY9sCE=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	6:kkCOh2mrUr+bv+x9S0SVPrE3nOdn1kE2CbAYeL7+uK7eL1203CC7Xlus3bMUFK4Lun1gI2DvNtZGcewYdLGj1Hzn7K5TZNxWhi04js7+NeICf7kcfahezc6wVAFUfqzSKzw2iWybAoCN8eGPHeFyjSnD75qyNwqrPGxPraYdgbVgXg4Lmt54hhLAcv4PMxDlspJCniE3/MV5neZUer6U/TJoBYM3jAkroO8NnPmA8yoRo+lW+MhRH7T2hsR2kDYHt6skuu1McD/sCS5pcV1iw52lmQOB9Lu4BYRJmBCV/pVUpAfLOULJFGYhrPS2yYasA9x+3SqiXnS4gfRHrfLSr2Iexy34+NkKM/BKx0i8RbOr+85zdMJBUtjUg0ivoLcIqUAHgryxSQXGpq6CVzSLvTFa4lKTE+I5mISkBAtJFin+3Dfr/hC3AzBqr55Lr+OYy+pUheTxFhVFNQEEAsIbjw==;
	5:64GRYqYGJsl0s979mjY5WuqTNbEifwOf3LXEir7/rBF7jzSh54eBTooNynGbrp/oyfuvSuYyjC2ET5qBYj7Yncxs7uzhtxAtxBbj8t4qE/3wZDXLMR/9hoeAD/ftfjuGCyN/edrp30JoKEqmNTYX8DwD1CnzlIMVHodmm68PM3U=;
	7:i03kVH+ZCW3XOaQzbf0ocjE7mEGw07QkKsqBsAIBTyHZKWE3KhKpbYeXb5wiwxhCG6uldwQGhPpbLP+Rk/b3o7M2ZtXNZbTUD+5CfROJts2zJpGvHmuI5478FYEe2Cy1E16NwqykeqHJ0vxwQMErbvn3nl2o4UhAlTOSHz0JUcgHp5L5raTEvlE5bnvoS7BbmSzqddYT0SFAkTsr6FLGE3HbD1jrDlFGKsxoFrAEzfQFaqh1daToYAZkKeeL08sN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 14:45:06.4247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b5e37e-9e6f-4db8-32b9-08d601f486e2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3508
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe48::62d
Subject: Re: [Qemu-arm] [PATCH 03/10] target/arm: Implement RAZ/WI HACTLR2
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
X-TUID: dwF97tfuIks2

On Tue, Aug 14, 2018 at 01:42:47PM +0100, Peter Maydell wrote:
> The AArch32 HACTLR2 register maps to bits [63:32] of ACTLR_EL2.
> We implement ACTLR_EL2 as RAZ/WI, so make HACTLR2 also RAZ/WI.
> (We put the regdef next to ACTLR_EL2 as a reminder in case we
> ever make ACTLR_EL2 something other than RAZ/WI).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 466c8ae492e..14fd78f587a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5436,6 +5436,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 1,
>                .access = PL2_RW, .type = ARM_CP_CONST,
>                .resetvalue = 0 },
> +            /* HACTLR2 maps to ACTLR_EL2[63:32] */
> +            { .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
> +              .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
> +              .access = PL2_RW, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ACTLR_EL3", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 1,
>                .access = PL3_RW, .type = ARM_CP_CONST,
> -- 
> 2.18.0
> 
