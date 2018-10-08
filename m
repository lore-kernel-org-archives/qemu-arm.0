Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3934346wrt;
        Mon, 8 Oct 2018 14:35:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV608TXPZD+bdfnfCh5+LsZ3EI8b5RxRNZ4ked2FP4zFjxpLU9EiMiIRzw2iua6AMCckfLpaP
X-Received: by 2002:aed:3246:: with SMTP id y64-v6mr21384420qtd.269.1539034507802;
        Mon, 08 Oct 2018 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539034507; cv=none;
        d=google.com; s=arc-20160816;
        b=bK4Qn3V1GUyDVjV3wVshccAfHoSBzvStRp/fm5BzV+pHKL69H/g3edqodbb0iASmBW
         aMyENmjvWHJfsdHt2RP/8FhU6F4X/WYAoRfaBph5KZFk1bo/CJzdzFr4kg+V0AInv82x
         VYRQUhrNwCfFZn3FBZ8qfPxEfPs3BtntI2kRTfR9qPBUJoo7lDW0lAKzbA4p0Jyh4wEC
         +gXDCyl/GO3X9sqTh3ghCpawWdRwfFDWTUN2hZSPTxD2RK7zVlj3YUzcvYsOHSx0t8Kg
         5bFGWmYe3CJ28yd2t9baD5vxyWj12neQrNL1wIKFeh0vzz6KgOcMQCXAbTfsAs1OHbtZ
         vmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=B5J/4uZdR0RiehvfsWn5VOTOsuZJOReimin02P5irn0=;
        b=Fh6mXLG9yDRBuZHPZZMzPwwiBsFfphzQqJz+RiRMQj1urjpRHv4Fp1GiK1z5Zs5nao
         X8l1k7i4qM6QShraCrMMiF+dxxbbnYFSqXhcH5rCoTmKIQWWZfMLzC9HFyMqFmUspYNW
         eP5yaxeO+21CZG3jtgDYqsS9w1o0mGhjvAnnf6W3IeHWxDvzOieaMKyJt5SeNBUDVUsA
         9glktsDgRdOBZdWoAmAe91kPp76JJo+jBh7dCCYf1+hfYJJ3Kc5RMzWOzakimx1a+vrB
         i6Rkle7VWOAsu5tYbOhHt/F9ylvW2mx7q6ajAydJMYjm55uDjNFWb/xTy2s2Thl4+dMq
         rm1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=vYoSmqWy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d73-v6si8821728qkc.73.2018.10.08.14.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 14:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=vYoSmqWy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9dBD-0001nX-AS
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 17:35:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9dAm-0001bL-2d
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 17:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9dAk-0006NG-R9
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 17:34:40 -0400
Received: from mail-eopbgr730085.outbound.protection.outlook.com
	([40.107.73.85]:45312
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9dAf-0006IE-NU; Mon, 08 Oct 2018 17:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=B5J/4uZdR0RiehvfsWn5VOTOsuZJOReimin02P5irn0=;
	b=vYoSmqWy4C+rVyK+9k7Of4wfx1iU3FLf8Q9tVNLSKibH7UDSXTFI0D086reEC7hldQisBNHes8scv5PunzmK9b/tGaxRMeVEQFYDYSqD5KPwsKEaGusRpmpXwvx0jt25t2hReQ+ReGL1ZtfiunoPDHqbNT5S2YiNQHq/gh9CbMg=
Received: from BL0PR02CA0037.namprd02.prod.outlook.com (2603:10b6:207:3d::14)
	by CO1PR02MB093.namprd02.prod.outlook.com (2a01:111:e400:101a::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1207.21;
	Mon, 8 Oct 2018 21:34:28 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BL0PR02CA0037.outlook.office365.com
	(2603:10b6:207:3d::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1143.15 via
	Frontend Transport; Mon, 8 Oct 2018 21:34:27 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Mon, 8 Oct 2018 21:34:24 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39263
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9dAV-0006gH-HW; Mon, 08 Oct 2018 14:34:23 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9dAQ-0001YG-DP; Mon, 08 Oct 2018 14:34:18 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9dAG-0001XY-LR; Mon, 08 Oct 2018 14:34:08 -0700
Date: Mon, 8 Oct 2018 23:34:07 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181008213407.GF4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(438002)(199004)(189003)(4326008)(6246003)(107886003)(76176011)(14444005)(2906002)(316002)(47776003)(81156014)(81166006)(33656002)(39060400002)(106002)(336012)(50466002)(33716001)(8936002)(575784001)(356003)(53546011)(305945005)(54906003)(36386004)(16586007)(58126008)(229853002)(478600001)(23726003)(97756001)(46406003)(8676002)(126002)(486006)(476003)(6916009)(9686003)(77096007)(63266004)(26005)(446003)(426003)(11346002)(9786002)(5660300001)(1076002)(186003)(106466001)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB093; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT016;
	1:Dbe+gOtowtXQNsf3FKA9GrIkrgCKvY/YDM3a1jLR0bncf6ybYOCNaZGKTRHvsyQ0Ij0pzgDe62VIRrmcgapcsDl9UnKGRSa1r7K8aTV0eJP7fuLXdSbl+YHFx6xe3Yiv
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6537307-3654-47e2-7f6e-08d62d65d319
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CO1PR02MB093; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB093;
	3:a7NfLts10NkFf/kt1UEfXjfEXR/VK/0CO2xbDFI+drU99vjXbyFyg+6ZKJXzV80PbdVKWSMkvTSY1u4l3VJwOkunehJIceHDuX23Cbp0ptxmEq+HccrxWP8z/sqy6AeGepVQb/gTz1e7t/KstgkT3VaMYGYuxgGRTfZ7khZ5VoOJ58oV5zpS+Ua58fmA9YsabQ322SQvGKAxbwlEQjItO9LjBYai8aL+yuj61SEhoxhfX/RYqLR4FR/l6Et0lzBpvUbfLSrWZcYCuIjoRwxUW/SD978RUbbyiw/PqRMraOc+U5CwvSSEZXB5j2zQIWV7AqxgrXDr5jE2EYodZM2O9NaiGG1lkVuCyIRzNzBHV9w=;
	25:7a1PEtQJcCcTYGvONhjLafhAK0giNOzWIVcyEsTpO5lysF8ecoTXQpOPI1qMDv/GfdNmBIWF8yMLNA1D8OhPLX/L5GKlmGDBE2Wggl/6PfzbQMw1ifDW2e5FFNYXPHGQ8L2KjV7Wa/t/jcoqz+xN+frWSMYAJSy+NJ7boxOK2lCncW9YTLgr/mn2AsfklVG8er+jbcHP3+WroCK+97jvZR+glPkxsfJ5/na1S2sDosVSCmjs9wTKSFlmQDfdaLha5e3qJgeWUDXbyaS63W9wY2dNO22PozbvFvTk97ykATe5d5T7rvscmAvacPhglP1v2wEyOTDB01wHV9POKG/r8Q==
X-MS-TrafficTypeDiagnostic: CO1PR02MB093:
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB093;
	31:lN5a8FVeED2X0Ru7qzsagKRiKYBMInU3jS1Pzkw7jrX4qo7lBFHUqoTepkmXrwXYI6NSuDMyTOKlp+f7jbW3qGiZXIkPTgHG3XG81Mt6mfEp/ymIqtMGuV/imQfoBIno07Qc/urAQK8dbKigsVYzS1h3EG8nKJm7kWxYEWrATpk+KH25motQGcTyc13vVCWvwxhfA3TZ9zbqmlzLmoNIj9uPCz5JryQk+N/VBi+nrfg=;
	20:qXflRNJN2Y3OVOajQ2Cnqb22z0W5phvcSXeFlaX5pzORI7EMT4ui2B1Q04zmWDvMtz0gOyxVLaFvgFlUAbSAMQSowoFHm3uZg9/y27Yd3KV7zCEVnqMZSQ/swv4KcHHxEDxdOBIkh6w24CwreU0f9iiDnXHdCHWpElN9JvSMIKWmGDtvhowpcwxs3HklWcfvRd9WA0gNHvMQJ472FVQwFbTxN30P/4Uenlv8zmmP3YgkP0UG7YHR3rY1Fv0+s4ybjlqmLapw2gd2NODMXFiWT2sJSqezSF07RBQmo8Yyez+GG1WtdXDyFk/2/5zioPhwPZS9R/3XKOCj2hXSdyCHaLZhnSi9vZZLM3K8NMpBqwHevAibcc0YcWJ41QuRFvlBDe8GK4oIj7uxYyW2HmV/yosAfOqum2is6ahkZuzIjyq89XhXK6NOHDAuU+ubnxg08PcoF8E9J9gBcfRj7vcUBbkj6rtLQ1pHR6Gqt2+j1Din7C08WbU4CM47oPuqRTL6
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CO1PR02MB09320E27F78510220B36FFDABE60@CO1PR02MB093.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051);
	SRVR:CO1PR02MB093; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB093; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB093;
	4:IwhziC57rCKLxi2/MQ5FEQ2oiNOfodCaJtT7GHbbxh6+D/9DI3qJqq/HMb3L8oqk/5CfecstOCsfx4HmRalHql0hBqO5W0anJUeLSgxeoTd9b3vLOwEX+evfobv4OuBmeYMRDsbQKMP6Jm0p3REU4oDkBVFsk+ptyeU+2BZt4qTT3zZmqudUbbRexqvKNgGkz9aoljoKUDxseaRFLx8v3ywUKTueBND6DkIViMe6PR5HNmYktDX8PdMu3kzMHI90AqwYag449cVQc/9fQEQo1kMTKSWZTG8bXrbswAgYmP+rDAteTRg3nIgX9OkiYGBSfGAQl57yd5/eeP9LguvfvOmWHPeqDt8B1r2D/oP6nPU=
X-Forefront-PRVS: 081904387B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB093;
	23:2g2p7fY0fQu6hL8Xog0XidM+Q3wKxbLqwSxTUZT9rv?=
	=?us-ascii?Q?4Sid7K1ae90WmI2jNsKg/A8wEtQyyIo23P1ZqMbmfeOIYb3oGFZzSjvm7sBC?=
	=?us-ascii?Q?yXUEcdOo6AJ7Ls00vc1xdEF6N9vD1/q5wqyUGT0N/foL8bZtqTdu6Tfl/9Na?=
	=?us-ascii?Q?w87sM49eVmqUJJXyV0isIEZOWJXR4gR/n8PNJGZ5d0OCb5wt7JGwaa/J2Bi8?=
	=?us-ascii?Q?tUlDBQlMnPkeBjcpQ/NZcJw0RAtVMztRwiqEx/xuOgrRg3koP+kDqN7snYVA?=
	=?us-ascii?Q?tHTWEPERX0DJROer3lLzK7akLJ8BWojvVVCu45rLTDmivmrhpbjpyiy1/WyV?=
	=?us-ascii?Q?Gmo73Qhkzq31QhyGAi1qkm7Wgg0L1mDSwSfutCaP/BDyfGY2TTJoINc6s5PR?=
	=?us-ascii?Q?YeeiI6hgEk7Ay9NU7g2/gFK7R4ioDQiui8BcMsfrHwT/yzdGiChSjzqB07gp?=
	=?us-ascii?Q?ci143HupPr9WJCR+Mu3Y59nXmOlFGxpb3V907QuLvJJtS8ZEOcX6HTYbhfme?=
	=?us-ascii?Q?T/cfsw01lSS76akrF3iMq2Ij7JIX4nhKFH+VLkQNU25SBcCm4iWEyJJFT9zl?=
	=?us-ascii?Q?Okva5CypXQuKpOwF3yVhKDdnIq84gvc4Dq9v7zXB7jxrlxR621gvH48D4/va?=
	=?us-ascii?Q?VzDnQ0GvlIKNuLfXh4VC99pFXRh8M615LdN43et2SnXuUhBWPMo+np42YzHz?=
	=?us-ascii?Q?0oXg/YXm3+BjkjPZ17Ljsespb4NQR8WW6PmDgToovjBqWRm4DVtFI7O/kbyx?=
	=?us-ascii?Q?h6g+0DvT47KIiTD5oqApIF8GGk7ESDKyHDF3EoQhGmisGc+IcC6VBfpVcYjT?=
	=?us-ascii?Q?WsVeTp+ExjQXl2BwtX3MccpSsTwrqqNtSmpPFPNL92pFQOLaGDxb+YrlL2/W?=
	=?us-ascii?Q?aNYyFVyVIflsfv0fFUSzgfKpoESOGK6cGNGxLBmZKneXjKPHlv9qysVt/IXl?=
	=?us-ascii?Q?NM4lYnGsPdzB5ZZaFZnygA9+SyIRoyMWQq1CeC5dAkj6mnhOzzGMIt5NfcgG?=
	=?us-ascii?Q?CZ8ZzNzi3uXIWvuUflVnUuAEQfH28mEX3vQ7hZZKTFqIGnO+yOgDAfy8lOmT?=
	=?us-ascii?Q?awZK6voZdxHNsgRbntVPc/UFsrdyFNnRIrMq6KTNpHABtDLHcbVcT1qNXRGF?=
	=?us-ascii?Q?sRf8b70g/XkK0emPoKz42hA9SQjMWWryFplHNM5Fztx96j+uZfov6yLg6q/c?=
	=?us-ascii?Q?nE3S1rxWerLduWnVYpmsKE4MAOtOOBgJ9dapFKED7m1vekjQGntU0Uw1mXis?=
	=?us-ascii?Q?ulmFJ0mio0UiC23hnQ7YC+kdy5JtDcl0SmPSkVlYHVkKds7LK+zqjQkMJEQs?=
	=?us-ascii?Q?nujyivR2U/XC3/rg4AjVRzIOm+lE0l18sMRiUYjIoE?=
X-Microsoft-Antispam-Message-Info: 4g4GbM2GtoOgBH1w5IfpUPNi1FljOJAfRWU2IdB3FPWSKidt5WdHRzv9vp0tYFVKOPVY7zcpB7XbE5oce6+0awwBUJQuBg3Ik1usQ9MihOkMH2xUX1mRjPYSzT8hLfihgwiC/CCHebUMC128RF5g7qBG/danUOnoEStHbP/hzcvXi1d4ph9PmMB81zyhHdPtmPJu5XEE2E1Z5hz4Mo/ZoeJCXR67VOE9HvpwRyjKhJMKDfQTD5/KXRv4OWYYZomqyeus9oQPB0uDM4FiBARBbfyz8BxREIciSAAQcUbpYZG9zluubu6jQs21HVE3tCbkSoCQgmeMY1xZgroiGB9GoDPk2AXplt8cDBfEuRb8h3U=
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB093;
	6:ENQKnt7dEX7VE8p0bWodWzk97YRD+aTjh4x0t1h/K8MAVbghf74dKjN9GVUZ1sJ1JKqmcJ1SDi95Du6OmB5OSgKQMzpXZgPVBjrD/sKpxoEHNnPygGvdt7Ha/nOLzG2tYOYEmkCwrt0GIkNZbLlc/8yP1f0kfBhiuA3N+176SfcZackjbqOY1rfO+0zoY0uQlWJ9FY1IbUyfTBOZHMt+AvQdwE3/XKXr/PSwH6VRzNnf2q9KxjSYnmhaYQp+jC/seuzBa41cVCFX3ERHd30Xc+fBPmMoFbBFubG43CfcTtA+HCKS1RKe8SW//xhr6jVja10VIwdJn2jZp6J1uC0wCz/mjKBspmYrC3b95n/+gFF3jQ23e4ElXaak6j7Hz7UwV3wEGa5f6qzVKc0itYU1++gtvhcGfG5T5nvf9itWgPlQFtEzKHMmYnogaGfkeQLxeKXt4y7849cLLAd+RTnIhg==;
	5:ZnDRaoEp52ZrV677sneuU6xH7QyOcOntGv6ja3wWUvzMcCcvBCvgfR6MqdR9ZRhOWxL+CzU5kEFeZLxe5+iIDk7UjXltcWHyMGliFwZcKK5z8bHQyHPxOjnDZR4rKk5Wl9G5RJzXcLSHBy1RQr17j3nelxgI5Y97cV4QczWOp6s=;
	7:MMpdjRG+UHd/icwDQZkqM31TUhpc+Ofe/+m+Ucd3EhnLKdDOT6Ulbuoj/W7h8Nj3P4WCJbtzG/iAiXp2qcM/WfRBxoHxqD7d+0uH00pMlYdtE+7O2nq/BIybEmrjEbm2Vyi+07ecJR52lFj0nvK0w6Jw7+Ba5I5O7hY/2jyY4qA51sY+Nm7pBsxMsHmkPzOTOVj7jK5dpHvo/SbQkBaxQjch4FcV5xiPdWSwhTdVOV5e4rtBm/8wxALAEsBsig1m
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2018 21:34:24.2675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6537307-3654-47e2-7f6e-08d62d65d319
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB093
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.85
Subject: Re: [Qemu-arm] [PATCH v1 10/12] target/arm: Add the Cortex-A72
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
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tG6esviakeYY

On Mon, Oct 08, 2018 at 02:10:29PM +0100, Peter Maydell wrote:
> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add the ARM Cortex-A72.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target/arm/cpu64.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 800bff7..02e500b 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -218,6 +218,64 @@ static void aarch64_a53_initfn(Object *obj)
> >      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
> >  }
> >
> > +static void aarch64_a72_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible = "arm,cortex-a72";
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> > +    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> > +    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> > +    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> > +    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> > +    set_feature(&cpu->env, ARM_FEATURE_CRC);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> 
> No ARM_FEATURE_PMU ?

Will add in v2.


> 
> > +    cpu->midr = 0x410fd083;
> > +    cpu->revidr = 0x00000000;
> > +    cpu->reset_fpsid = 0x41034080;
> > +    cpu->mvfr0 = 0x10110222;
> > +    cpu->mvfr1 = 0x12111111;
> > +    cpu->mvfr2 = 0x00000043;
> > +    cpu->ctr = 0x8444c004;
> > +    cpu->reset_sctlr = 0x00c50838;
> 
> Do you happen to have the hardware to hand to check what the
> top 4 bits of the reset value of SCTLR_ELx are? I think they
> should be 0x3 -- the Arm ARM says that [29:28] are RES1 (as
> does the A72 TRM, though its top level summary table lists
> 0x00c50838 as the reset value for some of the SCTLR_ELx.)
> 
> QEMU may have the wrong value for A53/A57 here too, I suspect.

I don't have access to the A72s at the moment but looking at logs
it seems to be 0x00c50838 for both the A53 and A72.
Looking at "Table 4-118 SCTLR bit assignments" in the A72 TRM,
bits [30:28] seem to have been allocated. Bit 30 depends on
configuration inputs to the core and [29:28] seem to be hard-coded
to zero.

On ZynqMP and Versal, bit 30 (CFGTE) seems to be  runtime configurable
prior to releasing the A53s/A72s from reset. I haven't tried it though.

I ran a test on the ZynqMP a53s and got the folloing right after reset,
for EL1, EL2 and EL3:
sctlr c52838 30c50838 c52838

The 0x2000 mask is due to V-hivecs being set.
SCLTR_EL2 seems to get the RES1 bits set to 1...

Perhaps we should just leave it as is for now?


> 
> > +    cpu->id_pfr0 = 0x00000131;
> > +    cpu->id_pfr1 = 0x00011011;
> > +    cpu->id_dfr0 = 0x03010066;
> > +    cpu->id_afr0 = 0x00000000;
> > +    cpu->id_mmfr0 = 0x10201105;
> > +    cpu->id_mmfr1 = 0x40000000;
> > +    cpu->id_mmfr2 = 0x01260000;
> > +    cpu->id_mmfr3 = 0x02102211;
> > +    cpu->id_isar0 = 0x02101110;
> > +    cpu->id_isar1 = 0x13112111;
> > +    cpu->id_isar2 = 0x21232042;
> > +    cpu->id_isar3 = 0x01112131;
> > +    cpu->id_isar4 = 0x00011142;
> > +    cpu->id_isar5 = 0x00011121;
> > +    cpu->id_aa64pfr0 = 0x00002222;
> > +    cpu->id_aa64dfr0 = 0x10305106;
> > +    cpu->pmceid0 = 0x00000000;
> > +    cpu->pmceid1 = 0x00000000;
> > +    cpu->id_aa64isar0 = 0x00011120;
> > +    cpu->id_aa64mmfr0 = 0x00001124;
> > +    cpu->dbgdidr = 0x3516d000;
> > +    cpu->clidr = 0x0a200023;
> > +    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
> > +    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
> > +    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
> > +    cpu->dcz_blocksize = 4; /* 64 bytes */
> > +    cpu->gic_num_lrs = 4;
> > +    cpu->gic_vpribits = 5;
> > +    cpu->gic_vprebits = 5;
> > +    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
> 
> The impdef registers do seem to be basically the same as
> the A53/A57. The function name is now a bit inaccurate,
> though, but I don't have a good idea for a better name.
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
