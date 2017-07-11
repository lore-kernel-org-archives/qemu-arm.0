Received: by 10.25.44.15 with SMTP id s15csp4638574lfs;
        Tue, 11 Jul 2017 03:39:08 -0700 (PDT)
X-Received: by 10.99.66.1 with SMTP id p1mr19396721pga.120.1499769547896;
        Tue, 11 Jul 2017 03:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499769547; cv=none;
        d=google.com; s=arc-20160816;
        b=r0h+ufxBQ535i0lbiyixBUQxXgTPVQ/W3j/AIJLVfzaDxWQcqICiM+KPejFBiy81g1
         dMdQx+HOJvR6Rg9J8IjkUR2Ki9+MlmLUXxEGz3VeYVtBASQUqUQKocW1rGkP5FghrmsY
         8vM8lhQJADeNXjSjjVeMvoWQnrBtwzplvTmiLb4jw4YdxefEcd098bDXqFuruSgMuBwC
         Gh3FaXhrAsNX2tJaYgsbklxZVqUDt5frCPS15Y0Ps7T/+EmFmDLb3dusjsxwhDaj9n2p
         EQZVnxrKSHAJg34/P8QvqRjSu3Z21RWAPd3eQBy+Abqhq9Vuu0ntC+WSszqnUnwQvwhM
         5qqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=spamdiagnosticmetadata:spamdiagnosticoutput:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:arc-authentication-results;
        bh=wqJGozSqxt45hjytThieYEv7mb73GI0ZOfR3UUl+KS8=;
        b=X0O5JCj0HAxwSMANH3ig511CxFu75MvYkocKnC5G1ggPEKho0YxwksUBpuRdy9OLmI
         ucfZ2/+UiKwtZhygxiO9pfVBX82+5UvIPOKxXHYLGzeX4F+12tRgJllp4JQ3kZI5CVPv
         fechy9aZaLk7kWWN7MnHALuCb4zOold5+XIEB84AoqIClWDjPUCqh8BKTrYzvSBvKex1
         6AupopzJGnO6BuR4RHhzGJAAzK7u9A05k1w+Vxqck9HPsWqvNPv622jqBUL1fdMZIOoI
         YqOe+Ph5+fkVWiGChqA7YE3jzFjIcC8hvI+FulqNFaKlWnMo8J7E5vS+2yqEoVvS+IcM
         cHgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.b=mvi6gZSe;
       spf=pass (google.com: domain of edgari@xilinx.com designates 104.47.40.69 as permitted sender) smtp.mailfrom=edgari@xilinx.com
Return-Path: <edgari@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (mail-co1nam03on0069.outbound.protection.outlook.com. [104.47.40.69])
        by mx.google.com with ESMTPS id x28si9884872pfk.120.2017.07.11.03.39.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 03:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgari@xilinx.com designates 104.47.40.69 as permitted sender) client-ip=104.47.40.69;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.b=mvi6gZSe;
       spf=pass (google.com: domain of edgari@xilinx.com designates 104.47.40.69 as permitted sender) smtp.mailfrom=edgari@xilinx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wqJGozSqxt45hjytThieYEv7mb73GI0ZOfR3UUl+KS8=;
 b=mvi6gZSerWBw0j99k8+f2+xR6odLXAMJW/dfRahDJ1scggF1r1Ya9My9bxW5HaG2FfGlcsuHueDjvPrNnpHca5Zau03kls6B7mXttAP+e7XJSw81S+G6jIv0CLFxHw0WvFFOkjhYkpGf740486sR3kj4x2gGKW56X12jU8zVTcM=
Received: from BY2PR02CA0015.namprd02.prod.outlook.com (10.242.32.15) by
 BY2PR0201MB1592.namprd02.prod.outlook.com (10.163.154.142) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13; Tue, 11
 Jul 2017 10:39:05 +0000
Received: from BL2NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::207) by BY2PR02CA0015.outlook.office365.com
 (2a01:111:e400:2c2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13 via
 Frontend Transport; Tue, 11 Jul 2017 10:39:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT006.mail.protection.outlook.com (10.152.76.239) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1220.9
 via Frontend Transport; Tue, 11 Jul 2017 10:39:04 +0000
Return-Path: edgar.iglesias@xilinx.com
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37341 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUsZL-0005H8-QY; Tue, 11 Jul 2017 03:39:03 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUsZL-0002Xa-Md; Tue, 11 Jul 2017 03:39:03 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id v6BAd3wA016945;
	Tue, 11 Jul 2017 03:39:03 -0700
Received: from [172.19.118.242] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUsZK-0002Ux-0z; Tue, 11 Jul 2017 03:39:02 -0700
Date: Tue, 11 Jul 2017 12:38:59 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers
	<qemu-devel@nongnu.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
Message-ID: <20170711103859.GC25504@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
 <20170711100334.GA25504@toto>
 <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23188.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report:
	CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(6009001)(39860400002)(39450400003)(39400400002)(39840400002)(39850400002)(39410400002)(2980300002)(438002)(24454002)(189002)(199003)(9170700003)(83506001)(54906002)(106466001)(57986006)(33656002)(63266004)(9686003)(46406003)(626005)(4001350100001)(110136004)(5660300001)(38730400002)(4326008)(2906002)(76506005)(33716001)(47776003)(53546010)(93886004)(39060400002)(189998001)(8676002)(2950100002)(1076002)(23726003)(81166006)(478600001)(8936002)(6666003)(356003)(305945005)(76176999)(229853002)(6246003)(50986999)(50466002)(9786002)(6916009)(77096006)(97756001)(54356999)(18370500001)(107986001);DIR:OUT;SFP:1101;SCL:1;SRVR:BY2PR0201MB1592;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;MLV:ovrnspm;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;MX:1;A:1;LANG:en;
X-Microsoft-Exchange-Diagnostics: 1;BL2NAM02FT006;1:QewTYDuqvkmM/TxUKYrXL4penOCKFIMWouCiuTX+xLupXBULwrt3Fd+QOIulohWI9qDynOSNIh9lIuuvUl/IzKcXFqVNr/R2F5WC4A8ithijhv/KacgabuCEGY4PthclJOL2LJKe8yR5TZy8F/Linlr0V0EhXPbO2mM8FzjfVH4YI01LxA2pJWVfkt5AZuJWL+ccK6FASA12s1BLzuwfnnSRg7HPcPYTzvyVvbhUYRhUv2ls8Gamhctou9iZ1yS0HTdmUS8a++p24MNXW0vhR1aOkI3ulxUbtuPniEHM2evB5ncvB6d2w5B45Jd4v1KCP7diM28sAcb3l3jbfsHgQ4viSjpIRhMkFm8nfrfq9jFBDKbiHp5/R74079jTADvruTlil6pAeq0IY5WkLmVzo1T3D5u9DkIrUChu5TGdusnDAGj7a5ORIX4HKyV0HhStd5Eqcb8dJT/xZQYrPlkwhiSGsy3MJzcmqSmjoXsuhZxWpeT0fGTR3mP+3TXW9b29Gv42hHnTZVSe4uCP0calRNq8M/euELQyAjEmJNZ9qBBtFf2gEjUNbDEUUHKvGTzWS060wCpcmH/O/DPDg1HkMHTHaYTVPW2zg929BVSdk7SP8f6WSC/WO9izfWFbmQyhYEHtvEo7orim2m7Hdayb3P9XLUEQViPRTSRSQt9xaebnJkqyEV6m/n3YDomGOrKRsld+wJcZeevo6ZlR1X9C3VQgtVg5uUG0ShLCsbeL3MJf2Kc0zYJAEKkTOwU0tvRR915v0/qQuHyZWiQPUf5VhMiQnFhiuv1vC+GHJ0oaq4PtHD2/QvrEUxsmMbmWwRNlvdBm73aJ72m7EzEmQcAo5mkGw5rRBSMrIAbuxwHUHga1S/Evq+CsUZQAHYKVT3U1+LGl1vY2VlSuvYveNmRXbA==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41a4f1b5-357e-4df5-8ed0-08d4c8490d7d
X-Microsoft-Antispam:
	UriScan:;BCL:0;PCL:0;RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);SRVR:BY2PR0201MB1592;
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BY2PR0201MB1592;3:NnPvXDzAHSEKl3GU5f8Y66371oN/nu0Deiigvv+P?=
 =?us-ascii?Q?Dv9wKWaipN7+nBVGT7o/LEACBG6Fg9eIIRnoDvqxvTodqZ7jk4J3O5JzCCal?=
 =?us-ascii?Q?TfPm5cluQ+BmtCr9KBjCR2fZ0HlmnldxW9nDbsogKnXIdG6U/oxwNgmUpbVy?=
 =?us-ascii?Q?ujRT+S0Hfd4QhKoXuuRIZu3/LMpcx8VzASICc92bHzpBCA9m8dFnu58QlchC?=
 =?us-ascii?Q?o8PktnEGIQGw5FUUyWC5DBkrczsBE1/ng1xUjWunihlIV3JqByEiDwgw12Bp?=
 =?us-ascii?Q?dTOss0Z5rrJR+GZG63UlVi/hLFFr8OvOb07z04n0UrfAltz9ZgReKI/hQxer?=
 =?us-ascii?Q?8DOUK3IFfglYSsnUlKX3bd/iIoqg5AI69E/FTBnuUpSXtyplAC/8ljmpelwh?=
 =?us-ascii?Q?6n4iCCXr1i92p0Ua7a1TZ5yvThyf8vOE6t0AQxOP8q60fUYGSABWX9KO7nU6?=
 =?us-ascii?Q?hhm1rzas9TStH11NcbEf7FJbfX41U61s8HeoKdy9cZJ8ASVijyCoA3kmpRrF?=
 =?us-ascii?Q?ACNdk6X4v5URNfrUiQSiWhA0+Pe6PRDxrEaQfXpqgMDKNyEsdq70o57n8F+m?=
 =?us-ascii?Q?z35Z1G5gVbrPdvxjA+N1JOIjQbd/koKp358UfVD1am3gjjNP6G/9WHxkepar?=
 =?us-ascii?Q?MmoxXvcqk9V1CzuvTcqWnys5unGmFDvfijhl/kmBtY3NWTMkAsmjGc3l1VD3?=
 =?us-ascii?Q?mgp87P3GoHmrWi6iBwfYcoIC0sX9mAoVUm8SmAdcpjnEGXqk4nPLYWK/VRrv?=
 =?us-ascii?Q?JtV7q5I44SMMcMtvYi65ziGdXDjsQlu+qIHvb6AG8aLo+LLvUHWDC+uMW26F?=
 =?us-ascii?Q?46AP1wNYZXciGrJwS691Ug5+ux4bgiAdFiu2VAC1jw8/DG0thgCPYFWjtoGK?=
 =?us-ascii?Q?KAlm476BpzTtu4sayDCdEAhsEZyGUF400DCEfA596EAgPw/gfV57dblFvq71?=
 =?us-ascii?Q?rrO20i5L7Y9H8Wm6HMnipWfQCWm/azYLqyPkVNZl+g=3D=3D?=
X-MS-TrafficTypeDiagnostic: BY2PR0201MB1592:
X-Microsoft-Exchange-Diagnostics:
	1;BY2PR0201MB1592;25:LNKfC0qDKnwzrilV2iaFwkjZniOzQ7R7rt3RMwxT3aHqxguv4Ep0xpL5NmG7yjnBlWpzasNjiSPLhHcvb9dKbmY5LFacEOJZ7W4g5D0pzBUmedhIZNt/llXvL0pqNuhhYura7JUlMyu1gq9XU8o8YMxm4QeU4u8VqHMimQguiz1z2cYd986hWm//h/iDg7DT2cy5R0VfoiLMK4tMLXXRULYJ2FOz+lNH9pmgjLcmaiOZ3J5j0rj4OpkCrry7ULgAqB6/YlCJqR4DW4NfPLxbxRmqz2SlPCryYZKyzlyYb8WC2bULCvK92KtZNhdm8f1IOvGBG5CiSNye1tw0AKf7NaYX0MZo8idf1tXRpe4abS2qACUXK6A0cAW4LLWqXwqamaoMluR4B5UJfhk/6jkvig5hc8RcCGeNLGoo5VWsD4ro2i+0yHtH4KzS7zOWdj1NfCjj7p7OFB7fX03SKQ3R0xpgS+DL5505W6L1V4zMgjILP3f5kSBMgLM+aWlRuMSBZ+F4sj/NMYa0/ylhKI4qrK/H7jVum7zvHjrN8aNQTyyT+v0XsRzZvFpJWprVJmB9dMFJtx8OiqzutR5u82UEpd3Fya3WmWSHKKfWW3SqXqkkKlhDPzU66WImu2oBvqKQHGP+p0nTw2Fivf8NF7nI+lo6U4Quv94RhIymZTfhR3DuyngZmrUAr8JTI+wvy0FkUNHfzcPTYTvJYI0ICi26kFBl6H+2Ts21oX5rLzvHwnhu9Ts+e76NXMQVl2nk/wPFJ+pM9R0L+VTkJAayBCY9eH/6L4Soq8z4OewNTRA0vOtwYXVS1b2ETKgwJ7zebdZMwPSwRQZl5SZpC3cDMlfPvegpHhgMpwkXOx6otb1peDvCsvfgVWyljrNdMv+C75HHpEQj+Qf3Y172a0+SG2mlDsXemotO+BShHlOyYv0jW9I=
X-Microsoft-Exchange-Diagnostics:
	1;BY2PR0201MB1592;31:GpG2SM7wSM1LL5G5xHwqx3x7i6LsvY/00AmUfyUswA7aLFNNu9fWGzRlHfpcmVraOtE36w1PTNIgdLCF86Io1MjjXs+5CfdTeIE/o6ndhXRPB79OvANqj9g8OfmlTNzcKK3K3WuM/nNaxdOsdvo6ls6xAo0YZqKyvcWndiedoQPmmG/m24iNoTZiENjvwVB+wU0iKQNRIV3SzT59saLpI27OZmFWme3dwN3tSJJBmEJUqTlT8q1gBXBwbKwy0FKggjSdPpyPq0PXgbxn1NODL5p2j/e3JIFK8GOMLO0lS6CHhb+PXSa4AmtJcAzOZELN+eFfYS3E10Br6Nn752E2GtrX9kNhgX8aqoMsyWyfVtWaSw/rOVcrV5q4TtWEeTxItzegljN6SHwk3zIC3LisvPfERLZ91m8FnmS0AbJpUPA3oB0MFYFiApfJmCIEgHihZYmIu3D0XFhzfJn/JWbgpo1HCmOOPrkWl4XI6myHwsx6pIU/MsahPb4nE0jZRn2mKEJplmXpxrjpwdXM+El5AY4iboJP09iSlLzLAtVDzmp887YuQ5o8QAdV60DNMXLwUF5bT3MdA81++xz19knEZYAlUFNnVPMr0S+3/fCtb7+hR0BthoKWmAgj6fBllHvJgjP1NyuBWObDAeWIBCWn8XLTI5+UodOacQ9LvXy1VZFvWHs7piQ9KkFzHfmAAmIckG9Hlm84pj1gF2/4X6X00w==
X-Microsoft-Exchange-Diagnostics:
	1;BY2PR0201MB1592;20:333mCh0zJa9NrdAG7BQmranBXJlZdYA8S86EL/42ZDRhGa4BgbUymOlIDHNtFsEqqoV+RJeyHKIlRjiTA5PTJzmNGBf5w/LE4KMpApgiP31k7x/VpFSjARvqsiS1F7D9uDLVLeNz6nv/bsh4453yDwIuTaUccJ3j1HM6Gzo58jpc4ulEvsl1ChDDgzgBJO2wHAHNOLkuhd2qanXmGJtsi9wkYkf+6kTrKL20MUD+hf25aEqRSljon/0zBMnSeQGrXf/97FQR0VTTg4PoDNBmEWLvOMV+v0IGetgfn7Oz+QftYQW/el4vNX5DznGYrzMn5UHOYmm+nQ/GHIiYXxaa8I8lP1/ikS0mKAKHXTm/4EzDvabGwRkSUdfp9ZLifI3CNPuBr/9G122hhxLn7YPFujs0/XJL9q2k5nbLCO/W5MnM5PXrTXJr7ty34UkDAtwPcYGBxoEhkcjo8jJfzQnpoGfliUzpy+bumJPGoOvGbph/7ypFinW/pMYDWrh/LRRU
X-Microsoft-Antispam-PRVS:
	<BY2PR0201MB1592235B18C11646030AF746ABAE0@BY2PR0201MB1592.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test:
	UriScan:(236129657087228)(48057245064654)(192813158149592)(148574349560750)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test:
	BCL:0;PCL:0;RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13016025)(2017060910075)(8121501046)(5005006)(13018025)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(20161123562025)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);SRVR:BY2PR0201MB1592;BCL:0;PCL:0;RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);SRVR:BY2PR0201MB1592;
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BY2PR0201MB1592;4:5e+aS698bJg2JwiBlyErfFEUG8ApS9u9ph1pjqSZ?=
 =?us-ascii?Q?W6K1WrwepqiZap7S4wqgi0l5NilEGlzv2LXmLBSkmFINFayuxi4rDxfVl/+m?=
 =?us-ascii?Q?jmulBAJDnv4DckK7enxPvxtKPng781vfm/LlEq8GepyXXlBsmPUkBevx2fLp?=
 =?us-ascii?Q?h1C3DT4Lbzvm+eOptH1rrmTNKR7A2qGcxD4LFYAP/ZaCFqpbAT7eoaeZriH1?=
 =?us-ascii?Q?TdJ8Lm0Rtx9BnheysHFuupzc4NmGEpKqNVqh42usru1wii057HpZ5nLpo1ze?=
 =?us-ascii?Q?U7Tyc0wWNn5TlfXpSenJbZKsxmM+Z6fA0yvjlBByItGf/dBFO6qQhEA2vifl?=
 =?us-ascii?Q?hDmpDJ1r66nagAIMOBW+mDRMHinc2AwlxyxcxYc9TyhML0lFedpNpG1DkAUB?=
 =?us-ascii?Q?qC8/1FCoyX+ZpdmDANQyss+DM2qt4wz5njNvz9Zr7bVMLwXEbAiXE+RWFO6E?=
 =?us-ascii?Q?cOzeFzBfYThnfleEbN4PC7NRer6voaVMb+e2Bn9rVKSui8E+naqxh9wB30Fv?=
 =?us-ascii?Q?5lTB71Vo2JgxdceNuF4eNe3EUP1NYwxC6JWNI+HE9opCpep1Dwxgoqs9Jeh+?=
 =?us-ascii?Q?NLjT3ZSXJh++2SMBvYiO/2aRVIg/hoUsX962dfkHrouJ7RUZcaSzNXHudF6p?=
 =?us-ascii?Q?2gt1F5zYp+UgTWJdl89leQ2+u0qyuWMHvHByVKxo+FUrpTqlQTlr2RJrMMgl?=
 =?us-ascii?Q?mGl9ROKAEgAeolZrA4kHJlojTXMqJyGoUuijoxNAIg56+1l48T1gdjVMztOz?=
 =?us-ascii?Q?hh9D10Ho4GMJ3JfPdDRrGBUHc1essbbsZVthl+7OhjMB18+2F9JqUDnvwBkd?=
 =?us-ascii?Q?Q+4VBGnCrVdY1Mt0SpP75h87BvKBJ/qbHisZC28f0FRepfzoBvjyZW0YUCj2?=
 =?us-ascii?Q?HOXhkP7T8Ika4FrA+m+I7DUYBEaFix0amokdK+4xUcjmVSTdvIGF98EzlMqk?=
 =?us-ascii?Q?VibnIkzbvM9mdHsyIGnZpR1gYD5kh4WRWCXJTTPjQgK6waYFO+MrBTQy3nH+?=
 =?us-ascii?Q?ZRQtb4ArD8CqWDQYsry+2dTtDmC1HqDwOTNHb3XKzzn6lA7zU235aJmYQcnC?=
 =?us-ascii?Q?pIFtvsnAu/Ms+8zCulFnxZLu+rfbBl1D24e/A/FR6+JZyfiFMunAWdIpMKtu?=
 =?us-ascii?Q?/ylMS7TRWVECOMyu8blOj8vQYQPY4xW5HLwLDPuQs+OEujG3GkbeI54cgNvN?=
 =?us-ascii?Q?Q70Q5hF2VISVvgClUCLTtIaouVc129WbjUL2LSJbGer5Wztc0fPfnfO++Ipb?=
 =?us-ascii?Q?rkJ6m0WmVIVjAL36tGUZapt2wH/K7nUKwKBefk6s+Cq+j8jymLFjzrxUujYH?=
 =?us-ascii?Q?VTtlgQITvDZCd/CkkpCC9YlIgbD/SOALnK1ZFncPv4pvl6eYPAcI77IFyvHF?=
 =?us-ascii?Q?o0Kym2vnSVgUQWXMmc1F6Ak3oJFHuScvnY9FSgpwMoicuPW30Th/1iNHA9IN?=
 =?us-ascii?Q?wl4L45Rjsg=3D=3D?=
X-Forefront-PRVS: 0365C0E14B
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BY2PR0201MB1592;23:/klWwsULovbv66OvboTKGlz9jW4ZQ1ghldThb1k?=
 =?us-ascii?Q?r/YBPcynf/tYfhnj1h8Pnib/eYN5DKtG/Fj3iWkCy/paVEHwW60YgXl+DW2W?=
 =?us-ascii?Q?m4Uw6dlaoPHxz/wG/zrXtH3uyg3e7OZCbNpEHpXQ5zBM+0451jRxEdF5FyXb?=
 =?us-ascii?Q?k97Z4Sg5Fh6TySWmfOpzeR4IbGAEiNNsuRyZphresEiGRgJzOFL9vfd21GAl?=
 =?us-ascii?Q?i5HDH7jxvBe97osAo2jBF0SYfo6/4gqBPNI+XHwOqECV6gGcP7aWKoqy3DCi?=
 =?us-ascii?Q?+TfAnafraYpq5BGiZxpgf2NYDmrEw8m4Xb3MxQI5/ohz7uA/MFxzyc9p13mT?=
 =?us-ascii?Q?1aFG8XVMsMq8Fl/ODhaWFB2Sf7VDMFNtwx9YA3o5Osb+GdNon1Iefs+garft?=
 =?us-ascii?Q?u8Jc4mVJwfE8SP/BezpKIItlzmexRYe43qUhThctOBnr5/AH33av364OnmPi?=
 =?us-ascii?Q?EvxQO3xw3bocQpIftN9u2Vi65tqF9HI+MsjILOe6f1SjrlyJ6b+dOfr0ia6n?=
 =?us-ascii?Q?hxxZ1apWBMphxUPKsthZchE1K+iRz5vG+IwfxgdmPTlfd3oRuVkFYeRNOnAC?=
 =?us-ascii?Q?TOnSSpmRVsSagZtkNqhKzXa0QOXafPLtURLzqEsRN1TVVbjHfX0+iIC0UHdu?=
 =?us-ascii?Q?B143d04bFLxrp4Qf4wzpWejsmkEssxFMTb3/TWp8MuOGZF1nbz+zpiiORXL5?=
 =?us-ascii?Q?q0OJ+yL/poDPKxaHAD4htnPgM9R5pbEzvAbhUofulMXsxB4ChSjVXW/uHR5x?=
 =?us-ascii?Q?9EY2xnEq/4McTnJCbGKZMy3N4NzJh70BDO9FemYDuBZRZ9NV21QrqqaWVgTC?=
 =?us-ascii?Q?z3daq46nhupJNUL1U78yEg38Sh0CS7Fo0zW5MxXiiddfbcy+Dtxc66A/eNE0?=
 =?us-ascii?Q?Ijty27eWOK5FrDfcbT7l46OlI8450iv7nOfctyBJgq+joR+aeF1uv4SCD3Fp?=
 =?us-ascii?Q?c5TtoL/KW5+bFpBC6XzxwDfwszf3nCNRI8c5SFhlNhw9knI4agQU6/Ynzn+3?=
 =?us-ascii?Q?LxopfW+3VOqwLuW+7ArvCU8YIxnXBLAi/0ymsQwqQLI/o7xQhFs4XPh0XXXY?=
 =?us-ascii?Q?wQxhW9f8I4L93tV6OI1T/419s9xrT2kr0oxJ/Kb80cjOjrLcLLyelJYTVeaZ?=
 =?us-ascii?Q?+wSNX+Xrr1ljwl6ggaxXXzigpSn+o2MP6ktAw6z6seFXvY3KRkES0pEDbh0l?=
 =?us-ascii?Q?b1+W1s53JdQPE9lbHIEl8dsDXMRaTgwPcIrgp287T6k5YKnSFjjqHVH/Jh+R?=
 =?us-ascii?Q?VTdNu1rKdA+5YhSX3wXvqA2KOLbYh9jE4F+/SOLOoBPjXGz2miZaH+zqOqMb?=
 =?us-ascii?Q?vLB9p5GKBymEClwERFCRNdvoke67FrQrpzTEmutk6xBKZKW76QyzitMOJG4u?=
 =?us-ascii?Q?7UQtpiqDY4PleKCKX3SXYzN2TPwE=3D?=
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BY2PR0201MB1592;6:3RoHZELpKhQyKlHZh370jz0nvrV2PNMUUo7aZzYO?=
 =?us-ascii?Q?+AEuVSAgoL0F4M9Q2ImgMMvUGpNRAMKcK4qVRUrB/HZ5LgajrV3mjUVNucIK?=
 =?us-ascii?Q?Debbm+lhlUBJSXakofu3xQjcPfpynUO8OdAFGreCVNibJBBLS0hnccl920WI?=
 =?us-ascii?Q?o1J/SRsmLNEoYNYxP+9+JKCYsjepdDypbWz9UQuhr1YD21gAOZNjMaqUs5a+?=
 =?us-ascii?Q?wwWf0ScN57JUVtDBLJq3A37toVHHmf9kLvcHztcyJZ29z7qsHwOFdfRSEgav?=
 =?us-ascii?Q?uzGBjKOM0VSD8FR15wqCoGytsXA2JH0qfHTu0SgryDbdCHNKcmVeDln0vJM7?=
 =?us-ascii?Q?XwUTznw8VvJ5o5srsCisOPsCuoZgigNO9mxglominFhdjweleJZ1Tu85+C9t?=
 =?us-ascii?Q?k5laHfcHsEZIyx9JqTzOal1/aBOjhgIcW9Eyjf/YNI2bAQjsaePg65QLVAH/?=
 =?us-ascii?Q?uMeue05Zww3N2FQuHJ2lUCL5UU0n3uFF2f1hSvPGYReq8THKL4Bkuqz2ohv/?=
 =?us-ascii?Q?q3KFs9eySDkPZ39hGs9M2NL9LSC5vFx1kUxKESXogrzF9KRvU4mQ4R25NDTA?=
 =?us-ascii?Q?BBgMdhAeDGYLDsB87cEucpvW3BmiPFpgiuFLRME78C8P0wlZMMLYFMK/5qni?=
 =?us-ascii?Q?pYjV99hIhzofqUm+NgMrFza+epRKavd1bU2oiHpLiY6lP0yUtocZQfUSdsaj?=
 =?us-ascii?Q?aHXLacDMEVzAB+CwE0DHfy+b6A5sPlfH6kFzr8VJjAzq0+1hL+vuCBaS1BhP?=
 =?us-ascii?Q?DTPTa8yoqPes0eI5xq/QhpYEnZT2IhG02Tk3B/tCjyIJKRzrPeternZaamo3?=
 =?us-ascii?Q?WeNrP6kkPNHA0VOwcnAHN9XSFeV3co36pJgbgsqJWxytHoBZ6CSE2G1K6E3/?=
 =?us-ascii?Q?HF5Gr6xYWKhfNRIScnkSBWky5VLmu0byVgwlJL1IsScKNBQx9UAE2GbZyX8U?=
 =?us-ascii?Q?dcOnqawn9ObAnIlkamHzqOeOxHwWeewlgmLS5rPN2kau1TQMSLANKQYA0SJl?=
 =?us-ascii?Q?d3OsQW09MvJQ5aLSuUJjRED1?=
X-Microsoft-Exchange-Diagnostics:
	1;BY2PR0201MB1592;5:EP8EscUJUU6yA6hiHl2i0W7js/IaEcB8BrJXBxvp4hB5e610oZ+nqC1J/BDImhmFTjOr3SpirTrWPCOM0heBPhotYw2M/kInRmyon/cF5J3+4RXFq1FWbvMpZEGYd8vn0Ona4R1M5N0LPmeEbmqr/71zEq5ygMbZXMVZJ3S0QM6EgVaxhak2Qayq4VxlokvysZ//cylpGmMTF4nggYSur6voX1JUTG9Ey9jvkciFgPVgBCN6ytNzfLqRUFU/VvKeMxBU5IQPGzQK2YyEBgnDMnMEk1J88GOFgBJH4KdsUsfjFKzm3wHkAG6KjPEzgCfWA7bFRxWWb6S/xKsMh7/FIYu6A91Qc1TXOurpQf9/ygALyuG8yKdXPi5iS++hjUsYxeMBpPU7Ex4keR2Ok9ZjHnwheIYyqy7QRE396WE3jq0Lf2kYUgr/mK8ihzmDmZoVTjkDIbWmgIx2DbtWp9bVxN1UdLubUAZSPwpl+2OVaP0eUnXPISDEcSiPhhxdX+4l;24:/P77H79DbU3VfZyiUAKoioHsKBnwxLjW6Wb4ecKh6fvb2N1ahm18/FsZXlYIZ/2zancgsrZeKfsynomNcE56NZB2RPKeDM/jhlzWN2234Iw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics:
	1;BY2PR0201MB1592;7:klV7RR/Tng5fVdXUXPRqczkrwgq5dfDqiIazxh1NjdAoySAd36KzDQffBsPtP7eN3vVOg1ap9m9jrdyHDMtZ0vhsFVu1eysE8pRLvizFlUhbaH2h28PSNvm6bbm5TL9Pm1wRPbzcGQ9MmLWHHX31LIx75l3HcR6mPm6CAdKAWLL2lH00rjN1caB+Xr+iSWjXZIDSEXH05OoFx7zJGQG/UW9OGD99aNlHRS83hCoW+RxbpLz6i2eksxMijaDxTk9q0ybIa1dDQ8ebQu/uyd1Bnv2hLnlElW//ZV0YntBufh7me9QruBA8xNbj6ZCoVSF2LtFuP6ul8nxElnKUMpQp91xR8sV7bY9Npt+fSSXitDO5DOek/ogrKtOj9qnVOGwYrK26OuGg42bG3U+3BCmJTKo6ypGsTnEG+X3jQf6VoMDYK7YBi7AwWjCXkebtpx5PxutIEQrn97PfnfM1k/ztN/sFkbXSt68rcGZffah2vpF+8zHHt2yGsd1KMUFDHpxuj3zOWK6EdtiNIyxFy2EjOmwDp9kn30BQ62/9lwh9rGxmkhTR0+bNaNyZIjCA/yQ93nBsJZ+O630uyt3o+JyGQO+/8Z4P85OWHk7pekg31hml5cmcJNH7xLqdTruJ3pUvnZ2EY1rbBx6UNn1GCxx8FQzUtLTJDlY0/CMYFmIe4mQZdaRhRyO2vpgQDfwZzBpOMMnPj3x9ll0PmxSytqKwPV6L56SaOOigK81/n46uC8OAz45sCuOkxB/B44rW2eKcDsOb5G+/oW1fzrtApG2Ad9d60bkY8z8gxSdtNwOtURo=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2017 10:39:04.6676
 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1592
X-TUID: CdoVoD3Qnbxu

On Tue, Jul 11, 2017 at 11:14:04AM +0100, Peter Maydell wrote:
> On 11 July 2017 at 11:03, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> > On Mon, Jul 10, 2017 at 04:11:29PM +0100, Peter Maydell wrote:
> >> So this kind of worries me, because what it's coded as is "determine
> >> whether architecturally we should be returning a 64-bit or 32-bit
> >> PAR format", but what the code below it uses the format64 flag for is
> >> "manipulate whatever PAR we got handed back by get_phys_addr()".
> >> So we have two separate bits of code that are both choosing
> >> 32 vs 64 bit PAR (the code in this patch, and the logic inside
> >> get_phys_addr()), and they have to come to the same conclusion
> >> or we'll silently mangle the PAR. It seems like it would be
> >> better to either have get_phys_addr() explicitly tell us what kind
> >> of format it is returning to us, or to have the caller tell it
> >> what kind of PAR it needs.
> >
> > Yes, I see your point and that's exactly what's happenning before the patch.
> > Some of these new checks are generic in the sense that they check for LPAE/64bitness
> > but others are I guess ATS specific for lack of a better term.
> > It feels a bit weird to put the ATS specific PAR format logic into get_phys_addr.
> >
> > The basic idea here is that we never downgrade to the 32bit format, we only uprgade.
> > The following line was meant to get the initial format I think you are requesting:
> > format64 = regime_using_lpae_format(env, mmu_idx);
> >
> > After that, we apply possible ATS specfic upgrades to 64bit PAR format if needed.
> >
> > For clarity, perhaps we could make get_phys_addr return this same initial format, and then
> > we can follow up with the ATS specific upgrades. E.g:
> >
> >     ret = get_phys_addr(env, value, access_type, mmu_idx,
> >                         &phys_addr, &attrs, &prot, &page_size, &fsr, &fi,
> >                         &format64);
> >
> >     /* Apply possible ATS/PAR 64bit upgrades if format64 is false.  */
> >     if (is_a64(env)) {
> >         format64 = true;
> >     } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
> >         if (arm_feature(env, ARM_FEATURE_EL2)) {
> >             if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> >                 format64 |= env->cp15.hcr_el2 & HCR_VM;
> >             } else {
> >                 format64 |= arm_current_el(env) == 2;
> >             }
> >         }
> >     }
> 
> This still has the same problem, doesn't it? If get_phys_addr()
> has given you back a short-descriptor format PAR then you cannot
> simply "upgrade" it to a long-descriptor format PAR -- the
> fault status codes are all different. I think the "short desc
> vs long desc" condition used to be simple but the various
> upgrades to get_phys_addr() to handle EL2 have made it much
> more complicated, and so we'll be much better off just handing
> get_phys_addr() a flag to say how we want the status reported,
> if it's really dependent on ATS vs not-ATS.
>

Another way could also be to have get_phys_addr() fill in generic
fields in the FaultInfo struct and then have a faultinfo_to_fsr
mapping function to populate FSR/PAR. Do you see any issues with that?

Perhaps that's better, not sure.

Best regards,
Edgar 
