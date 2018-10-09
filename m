Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4788771wrt;
        Tue, 9 Oct 2018 07:56:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62KdfycgEZ5YGCNBX4u10+3ZOw425t0CS7D2CnxOVysCK1orsnDbH36NZolWj1LVd2+bMEz
X-Received: by 2002:a0c:8785:: with SMTP id 5-v6mr6066502qvj.202.1539097010225;
        Tue, 09 Oct 2018 07:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539097010; cv=none;
        d=google.com; s=arc-20160816;
        b=wUl0r9YYV2QMFM8c/lGTGkiUyLQIfowaox0U5gkdSdSUYeaxDRXFGIOHGfNiDYFmrc
         KJxpNlT36MTg6l8y0ZFCgU5LZr7LTg3zV7tSErsVg9I7j132yfY+2mMkgRYgZpP7zn3d
         8+VHbgIbd62VR4lPRhPBRrtgSqFf2ZE93n8ds1hKcQF8najBpNyrLrw/s7ipCyfPhcAW
         uSQuE1WnLHhGcGEhpX3mJbCaaXB4Oe7D4gf+nSEfUS3LCFKC6TGNzDbz1jnPM2MfZy9/
         ivZgAwv9a+hnSRNo7zOAxD5OX+vDxztc3t/AKdD/k2gERod6nmPwl72Yyq2i3rmB2MaQ
         sxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=6zmv5syFbSyl2Ox4VW9ySbiAQ/eAXI4FSZup8tmasgo=;
        b=ktuuQe3WhbEhgjaH14ohS9fqwgcIVlijCpCQOw3WuyQXfdMclo9I+PMbHTgmKDYWje
         21bHfDWhThNhdV+N6rHmbHTbdRp5mDUwx+Z5N5LaZE2piTiCGgs8naPWq0UhbSkZq2aH
         o4SNIfEO8sCYzLCy5t/1dQUYLNBhDBkNJHvailknhxPwuSZu4wmRjtZEsbqYnNO+S0GU
         so7S0IcjX0OxOYQ4WR8/ZGsMWzxwnLmTLy9TZFTtS+2XtFjYAhDY7s4A3L4w2LE/c9tC
         VUGmd4LVri9eKaXq0r8jEmcVJlqSWQMMRamb+YXcQkMNHTRHk1ATORVXI2mhihBCZrlj
         ysKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lgnGwWho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si12732905qvc.79.2018.10.09.07.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Oct 2018 07:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lgnGwWho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9tRJ-0005To-O6
	for alex.bennee@linaro.org; Tue, 09 Oct 2018 10:56:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9tR9-0005TC-Um
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 10:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9tR3-0002iG-V2
	for qemu-arm@nongnu.org; Tue, 09 Oct 2018 10:56:39 -0400
Received: from mail-by2nam03on0040.outbound.protection.outlook.com
	([104.47.42.40]:26704
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9tR3-0002gn-71; Tue, 09 Oct 2018 10:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6zmv5syFbSyl2Ox4VW9ySbiAQ/eAXI4FSZup8tmasgo=;
	b=lgnGwWholfEl5V0NYcbu5pCo1r0ZzHhxkPUOy3fg1NNy6A1UU5/rutv5oOCxup6ozsxk5R4+pW09SO+k0ydx4ma6kGsiuniXolv2UW1pumgMT8xrBs+NqL2npXdN42GvYXf1jiZqx0SJY6n4yNa6FkWECIzbkr7/bScZPfxJQsI=
Received: from BN6PR02CA0028.namprd02.prod.outlook.com (2603:10b6:404:5f::14)
	by BY2PR02MB091.namprd02.prod.outlook.com (2a01:111:e400:2c1c::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1228.21;
	Tue, 9 Oct 2018 14:56:28 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by BN6PR02CA0028.outlook.office365.com
	(2603:10b6:404:5f::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1228.21 via
	Frontend Transport; Tue, 9 Oct 2018 14:56:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Tue, 9 Oct 2018 14:56:26 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54564
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9tQw-0005ND-HB; Tue, 09 Oct 2018 07:56:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9tQr-0007Iy-CR; Tue, 09 Oct 2018 07:56:21 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w99EuHRd022210; Tue, 9 Oct 2018 07:56:18 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9tQn-0007I6-K0; Tue, 09 Oct 2018 07:56:17 -0700
Date: Tue, 9 Oct 2018 16:56:16 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-ID: <20181009145616.GV4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
	<20181008213407.GF4229@toto>
	<CAFEAcA__7wJ-4mNe3rKe4T+gDUbdBH+rB-DHE+fddmjVzG2=Eg@mail.gmail.com>
	<20181009131736.GT4229@toto>
	<CABoDooObRovXo+Bw9tJWHy61vhTkysJx1D7016qhYgs1=O7ztA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CABoDooObRovXo+Bw9tJWHy61vhTkysJx1D7016qhYgs1=O7ztA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(438002)(189003)(199004)(11346002)(4326008)(476003)(229853002)(16586007)(305945005)(54906003)(316002)(58126008)(186003)(36386004)(7416002)(81166006)(39060400002)(486006)(81156014)(446003)(93886005)(6916009)(126002)(26005)(6346003)(106002)(356003)(966005)(77096007)(53546011)(426003)(50466002)(46406003)(33656002)(6306002)(9786002)(2906002)(8936002)(47776003)(336012)(9686003)(6246003)(97756001)(1076002)(478600001)(106466001)(76176011)(23726003)(63266004)(8676002)(33716001)(5660300001)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB091; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT021;
	1:q6z41cv4Sn4V8KHPbg4aaedET1pak6eCnzNzitmi7o2HA8gj92LzacxsjmuxMEaqdOiiKZJEx8O3jw7Dl2bvuT2wl29J90+vtPrrzZ1j1SjnZ0+N+NSQlsxKb5B5+rnC
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e8fb69-60b8-41c8-325b-08d62df763bf
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR02MB091; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	3:jgQoFlBUAWVjJRe28m9igv+LhAN8arxfVD1xd+VqZkTYvNFoK3D2nhlhSBPd8/Y+Vf7VCUSbHoNwO6eJRfFHKDV+WcB5Fc+avkxVBDlL/HfhQa/Zqx1yZxSIcuBlXghokSocJp2KYpgJC2EdlS1RoYqyNUQ8Zxp/pzwSTeKKPuBDpv8yTs1JrxBeKe4AtpKBcj1q7+NplqNL/mhrRK9xM/Q+xRphK1bEWD+SdR+LZ0dqNZMRTui77F0n7cGHYGbwATpXXTOscrl1kxI38HEAfXTJh797PSyfr0waIYdAmQsGbmMPyiq3AFD+psmj6aOWzCgcehpkI0OkMAjhstvDMW5yXglE6+zwtrWVcP60hik=;
	25:w4DcGKht2b77qDA9fI0vzu4lXubkIwLK3rSO6XO8jsC3nvk8uH4ICuUzWLjEFs0bLwm/j5s9AaahBPu9r+tjW/f6coCV7NirhYKdEte/utFanhmkvDk874p8W2Griya1kBcx+PhrXTDVkoXcA5ZDNILoTP6Eos/3zM0rS1kLK3jEW1dvcK3qxPJNJNYNENi6KRAvyEb2aJ8lEh0rRFg+QJnekSZ9yEfBR/PWSZNbPMjPl2gwOJcQRTnbO3dfNwpOuK3jh2wTCrpELwZmFij5RPQ6zhwklz5XYomQ+eiPp2vLJmhuPhOKgqXESQSIpvADXV5zYmxJX0GIl5zN9tF7Vw==
X-MS-TrafficTypeDiagnostic: BY2PR02MB091:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	31:KACjS3pCCVxqspfo55GsrcVsvq34Dor1NcyqTriO8pnsC99wVGl7Y1nC9YBifFrpB94b7BML6POFlpDS6aUFG8VhRdd2rjX2aNOywjeLolI7TkDycBDysPbW4by9w5VOtuWKCh92akh3HlRk5yQomU3SbAE/4ebP61n1/SVXnKCxmw20lwhwep6nk/vjveNLyyqx3yV1xkjRp9ytP7f9U63QcLvCimjfSEtIZ7MtjmQ=;
	20:tfdj1RL+WPSQtStagqS8exZPDNFDWMHa/sDJyJ4juybTOXArKTgceqIPTOOfGudUMUqrOZMU3FSdGUzoYYeWknpOLO7TlYGzqxQyp1RoYSW4YmZdQaIrJRgFhXUBtxiUylVs4OJotRwmXRuhGKfdhJ91Ex1xbvwWPZGLCyLRTZzRr1w7tjR9Af20zUldHQh5ktYbkt1BhTZw2QGSw8wARzq5eLrywtGReDQHYSy9h6zdzfDlaHAr4dhUvVLjnu+pmIgji/VojWpOCDgODiCLjzZ7tM/tkTDGD2jEc9JEuc2VOBYSTrfVQtebW9z+PRDNrqvBdROY021lAvoroVOCQkol9DWU8cPa4kapAET/KI0udPVQalgLBbDSFRoQlQLBQaBC7q0mxRwRA5Dfjh9EEgUxJNgTf+cXI3G37Ld7mn6FOYRqTwmJW6INRj0fGlq1/dMKDBj228CLWZJSZZCGoOCmxyGynFLr03a6FhjYtFIQhJ09W09aKptIMFMmaYzh
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB0916F9CBA07ED5541BD2DBAABE70@BY2PR02MB091.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(180628864354917);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991055);
	SRVR:BY2PR02MB091; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB091; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	4:D8AB3D78ozcqWLKikhoVJDAPiSnVZlHW6i19Rok6dE2NXbzZK4qmlfqL4UE5yxlSjQDRgo8SRwFF0fEj0xIn7X4sSxGYQjOnGWOqjUfz9AVbgAO9+DQ3hKcgK0DNpiPljMRnOvFBKomKwPEEI9JpDcAVkJi40JF8DCpbBGNLHWKdmYfsa97IRCrdYZLrhx1nesC5vZxN6icVEMQGdq2qxfo200qaEh2SmXCFIpFP5OFY2vxQBqet8YTZh/4t5ITQtq6pKvdmAYrPjdf4Do8qNZ7p0Duzket3sFjvxvOZEbES1n0y2T+plpcQPaBVt1oEzKbeXyjasClnPECMNrahW3y8ZQoF6aSRTOa/sE1mU/E=
X-Forefront-PRVS: 08200063E9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB091;
	23:QMntwLA83gxKXB/t33QekNizfN6eyzvnSf2YN0AiS0?=
	=?us-ascii?Q?uI6FNBqfxEaFlrWbxBt3TN1op+VFVEHt3j35fUs/tRndspq0BmmVP6Yydafj?=
	=?us-ascii?Q?woheqhY4pC4gfpb4dF62mPJKW7zEt/rPJZF/csHqp6qeI7qfk2VQKHInJQGk?=
	=?us-ascii?Q?XYV8huBYSvoE1+E3Gb0KGCVtKpMoYDtn/sOmfhAfIheIKVwOj/86OsJ3S0p2?=
	=?us-ascii?Q?oJrB6yahnRVG7tDekCATYfBUjlccZ+FvHbw60aidi0chTirdpj7KFcSbviwM?=
	=?us-ascii?Q?LaXvxy7S3n03Z3nFEc4lvH59wYCXayUoD1Gv90AeYwhrnSDW3VRQjr8e2Ed4?=
	=?us-ascii?Q?YtLccCMiQWN9wCKxcrQkR4bFSwcpYWG8jrlW9YuHg4xYVpgAt4O2qt0Uefsf?=
	=?us-ascii?Q?yIvanRMN22P3jdWprBG7kyY1dBPqkTAL+w21EUhF6F9u6ynWVvXEUhF6N2nY?=
	=?us-ascii?Q?B+np3NUfu7p4fL3LBThQ6ms7U+b4aeuj69qd46CxY2aTBjA6+H8+L9HS0OvX?=
	=?us-ascii?Q?1nIPwtFFchGCtyUtyohqhkRPpbrKKmRetQNW9wn4nj+g+zi+5ADc5DZQO396?=
	=?us-ascii?Q?iiAOZZgpVt6BGJ/HizXTEN1h8hp2sJ2/PzOv7sJGNK4JfFORhnLnweE4ImTv?=
	=?us-ascii?Q?VxOBa0l1UPby/OBN0oJSrsw8sAM1TEYDIE1n02smtuFkd40QGmFOe3yDl6w6?=
	=?us-ascii?Q?VfMBlQKwWiMLVri+ocE1nRLSuQE/mlthVFKYeOUPXziJ3bugI9Rs2RpMgexm?=
	=?us-ascii?Q?moVJbu6JLl0o85eLTceMZ5+Oc35e/ykT+/p8daBSBZl89ga98bIyamZJvnBF?=
	=?us-ascii?Q?4evq7zlhIyCTy+YCHTuoVfPCLm35FrcRnd/BCqrOiSaWEZJYwQzuMe+Dg+aE?=
	=?us-ascii?Q?mmf+5wIm4P7N/OTU8tSiti3Tp1n28ttyzOMYx3d/yTJ2/IM/qrYpR3FU7tp3?=
	=?us-ascii?Q?4v+KUzqKhjBU7wyUHhdfs2cw1SSLHupOiPTRh/NmxAV7iTy/R/Q9Gue4ASSJ?=
	=?us-ascii?Q?g2FFPHYFk802Z9tBkMIUxbZj8bBdkOIpu3rvvHHIGMFu+IwH9iJRIGVpzQAG?=
	=?us-ascii?Q?0MavaUz2D6w8gWk6zlWgeXmZQDp/Nmxm9ZyNPO3wfI1ELuicPjWx7HRN8LDj?=
	=?us-ascii?Q?eiO7sbkMZwdXVNJQCficCPcSh/mmFFXyXejmTK7Hi6DYG2ew2s9NwlO8QM+T?=
	=?us-ascii?Q?rZK8Gz/qW8AzVj2D4PbysgylxsP3DoNfAkAyksKkMOMtlM+KT1ikSi7seu8f?=
	=?us-ascii?Q?Q1PlcL2AuDLsxKzPfx1ElijmK9PH+Bb91Phh0ujy7uPT+Ca91Omy3n7Grxe6?=
	=?us-ascii?Q?nhjEFBToIDEMm8ucJLj4tmTJaq47t0BgcBq6W518C7ddWPUgPDQd/Js+SiFk?=
	=?us-ascii?Q?1GrWnyKzul/Q6s7xxgfwGTgEc=3D?=
X-Microsoft-Antispam-Message-Info: 3+QLVFplDVHkq1a+Qn1V8fgdWjWENNAMIaRt5RK57lsbv2KhFT6APzj+CwOc2ByMnzvwsQrbJ+onddEiaLRwjaBGGDB/YthsFn/qsV//8nFUnkX0iewC4j3iQA24uWC/is3Eoze0qEUpBtFG8ASPJmoKMqtDkrZoxD9e7y/UpWFX1piZKr1m8iXgdA0mm4gsyvj1BFuDlg5YGxCc0gLM41KqgVm0yh/h/D4bFKLYZQ06eG7KDM2iaV4EwEJ9bQM/GKJ1Kp5i4YQtfzsmbyl0IsrSQ1gjYCqteIEifOknvGKgW/ODMAryDOiN9XOAQrgvbz2UUcOBGBUFRG2OM4GT7zx/NViH9c9TdVbMn9NQGnE=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	6:HV//Msyhudxy8DmmAIqpLL7BGHiVYElbUMDH2TViGjcW5ly362iWUUnsM35ASfRu3UMmYIZiLBDACsLyoC73kxeHykrfzEennkrVmsricOQi180KNJPt/24gvTlgoKqdZzVl+NIySEw3HhFCBDVPLRJpfIvsMi7K4iBre/0MqO5EK0rjqt1/QlTEKJC83nO/FSIuTHFGfdRLrYtOSzRjO0L2A3B9ZaGU/zyCivGOkQOU6/n7YjMoj2/b6mBY1scZPsIhji/g2ED9NUiho1C0dbxr0p2IEJnoYS1wzEbbKB5s3PZmL36OWV6skf4TYZJ4sByYvngE9DDmCUF2yk5fQvuqOg/Lq3FGYPC8LFOkRyggr1SXH1a/WpfeRQ9JHhzFW6Ui7fyYep7owUnHHESvaA5MPvMGmZ6T382cQbaRvYsLgPwHmv1Tt5LYDQuiPlKmkuX7FCITs8Pc38I0ZHkgLg==;
	5:/WZryjeT6hffy0Z9Y6tGSiRdCmH36/SBPfKvR+hEEDlTliz/JCYWWohH1njvmyqaQBJ/IwNTB2W2fEqjIGdyquvTvGdK0nOT9LaIHfszKyuY64Qn3sNcT2CGweJh9/52tGNiy1WuiRM7/FIU8wmn4qIH42MdP41l+F1yGDw5grc=;
	7:IwmH+7i5Or08uR+kRFLLC92RqBD7siFE+63Hqf4P9S3T5izJez8DZcoQqGhxMYQL0xkmw0E4HSajH0a99oNkj3jPvOUxQ/plIcEGL0+SoqxUfnJ04gsXWW3GUCS0Aba5Kyvdtm5uscWsNCMxBnMyfrKiaHGHrdKtaR5xO2B6ObudC2B/Hc1BNMlFyzj+MiedIIy7WzO1B0GBfUwteBrWj6Td2Pdn5oqEkWCzbNlZla2WnyZUqObdHAqUFbZ+fsUE
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2018 14:56:26.9088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e8fb69-60b8-41c8-325b-08d62df763bf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB091
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.40
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 10/12] target/arm: Add the
 Cortex-A72
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	sstabellini@kernel.org, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	frederic.konrad@adacore.com, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Btoct8jp+8+W

On Tue, Oct 09, 2018 at 03:40:13PM +0200, Laurent Desnogues wrote:
> Hello,
> 
> On Tue, Oct 9, 2018 at 3:19 PM Edgar E. Iglesias
> <edgar.iglesias@xilinx.com> wrote:
> >
> > Another A72 related thing I wanted to check with you. A month or two ago I was
> > looking at an issue with Linux running very slowly on our models.
> > Something that popped up was that Linux was running a couple of spectre related
> > "workarounds" and "hardening" sequences on the QEMU A72s.
> >
> > There are a couple of bits in the ID_AARCH64_PFR0 register that
> > Linux checks before enabling the sequences but I never found any
> > documentation of them in the specs. Bits 56 and 60.
> >
> > In Linux these are refered to as:
> > ID_AA64PFR0_CSV2_SHIFT
> > ID_AA64PFR0_CSV3_SHIFT
> >
> > This is what we have in our tree:
> >
> >     cpu->gic_vprebits = 5;
> >     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
> >
> >     /* Xilinx FIXUPs.  */
> >     /* These indicate the BP hardening and KPTI aren't needed.  */
> >     cpu->id_aa64pfr0 |= (uint64_t)1 << 56; /* BP.  */
> >     cpu->id_aa64pfr0 |= (uint64_t)1 << 60; /* KPTI.  */
> > }
> >
> > Do you know what these are?
> > Should we be setting these in QEMU?
> 
> These fields are publicly documented in the system register specification:
> 
> https://developer.arm.com/products/architecture/cpu-architecture/a-profile/exploration-tools
> 
> These are ARMv8.5 fields, I don't think these should be set by default
> for Cortex-A72. Of course nothing prevents you from defining a
> specific CPU with these fields set to boot faster :-)  Or perhaps add
> a property to override the default value of these registers?

Thanks, I had no idea these documents existed!

Cheers,
Edgar

