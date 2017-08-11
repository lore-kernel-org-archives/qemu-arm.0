Received: by 10.25.221.202 with SMTP id w71csp1227096lfi;
        Fri, 11 Aug 2017 11:23:08 -0700 (PDT)
X-Received: by 10.55.145.6 with SMTP id t6mr22513684qkd.101.1502475788401;
        Fri, 11 Aug 2017 11:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502475788; cv=none;
        d=google.com; s=arc-20160816;
        b=OtwRnRwjLFEdCFtAIHYSb5HCkfTCTAYfpglFc7/7urNC8qCdiVi+stiIIcMamBbzBm
         K58ZfFtpdS/ypT6l3PrD5dDgzAgLIiQyF/9p7nyZD3ISUstBTIVmdtZv8X1Y1M6WVP+y
         UGB4/N4tybqD+kmKY9nBhBfhe7azQTs6KpATIaTE813PVW/0e0B5CIBPcTZx6YKFiuQR
         vynnwQqM45jvbHsmzU/USa6+8wFqSYuQmpsoJtzN7DX08sCyyjBk3OtaMqMwE4kQ5QAI
         t7QFLRjYSlvfKbvcKlOX4GyUJOHOHwGofoe1KQgF4dGY5ioanpzNa/ZeZ287sCk08IQ/
         SU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=ovB9TA0nLW1ng2eIUVOYyp3ULaSgl4GBiIe4T230fgA=;
        b=ekbo74mSRXOuYv3o9eqYQJ4qaLPZv20w+00mYZAH4HWBba+WZ/X+eAB3Ka74uhdU3+
         cJ+t00DFNUuj0jGRpeeQJr4N99MvhyYAHBpcE3X4lM+Pt9M8uqotHgGzNoDyB/Z13E/t
         wPjlRnKGnENQSVgkbETN1wudmQHs3u65WfyJirTA+2lZ2pqcqa2YVfYlxkkvLpOqYVfJ
         EbveCrzA2d83GY22WRhHXQyrYqOLqKpTrS6Zpb9kPA1KkubG/biCZy2NLmUzy4Ht+UPc
         cWrD7ifmQsiGBKp8/sHn2zbi57ag9TfPnSzHZa5ZgVM05J03psLAsm7knSSyq0anr1YB
         t08g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=floJKfDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si1313121qta.391.2017.08.11.11.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 11:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=floJKfDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgEaP-0000C3-Pt
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 14:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaJ-0000Aq-T1
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaG-0007R7-Mj
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:22:59 -0400
Received: from mail-cys01nam02on0053.outbound.protection.outlook.com
	([104.47.37.53]:12640
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgEaG-0007Qj-Ce; Fri, 11 Aug 2017 14:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ovB9TA0nLW1ng2eIUVOYyp3ULaSgl4GBiIe4T230fgA=;
	b=floJKfDIUMuCUr/Md+u026CukPhutUpA1VISw0iMVRMERvTBag5F31AeAeRQWhH9KTaepZ8ezLSj2Hn/7o8zsXdGz4SBYK2EKOIIhSUavQnZ/UXJM/EhKjUJHWzo7jYGmLldKAcUs9BG8u1KwxQqB6G581P91H0IdeFdgyZWoYk=
Received: from BN6PR02CA0041.namprd02.prod.outlook.com (10.173.146.155) by
	BN6PR02MB2465.namprd02.prod.outlook.com (10.173.141.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.16; Fri, 11 Aug 2017 18:22:54 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BN6PR02CA0041.outlook.office365.com
	(2603:10b6:404:5f::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 18:22:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 18:22:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEaC-0003WT-Dr; Fri, 11 Aug 2017 11:22:52 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEaC-0006VW-B3; Fri, 11 Aug 2017 11:22:52 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BIMgoa013545; Fri, 11 Aug 2017 11:22:43 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEa2-0006Rc-Re; Fri, 11 Aug 2017 11:22:42 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 11:19:19 -0700
Message-ID: <20b283f7eaf100783b291de3830dd226ec286b6a.1502474835.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502474835.git.alistair.francis@xilinx.com>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(8676002)(2950100002)(2906002)(33646002)(4326008)(36756003)(54906002)(77096006)(81166006)(81156014)(356003)(5003940100001)(8936002)(50226002)(36386004)(5660300001)(9786002)(189998001)(478600001)(15650500001)(76176999)(50986999)(6666003)(118296001)(106466001)(63266004)(305945005)(626005)(39060400002)(47776003)(48376002)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2465; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT003;
	1:XSJlpIHe5pDRvlrpaXkJ8f565gokAp1iSbkJsDqiJBIavYCHLhxLUrQpK+IJ8FxgXFty6m+lGndHir1njOU7QlAqS9Oq8K0ptGdKzfu70oxRYETC5TBbNXJLu9iFINTF+yy7c7PeSW5PMVMBKLW0CH39hN2iKmc8ENzXyrO5cxUeLdfguB2Ooj4nfJl6Yk/iAwKKTHM0RsMbmCtOxgEls2fFnxha+6SktNM8P00Dg6VQRDOJd52I2QBzUGQ+vr7MHF9S7OSGQJxJWjvYHBlQyIXEUT/0BJ+HsoAT8iH7vfi0sw3iFrsq2QpFwcq8oer5QrQo0nYbHz9NG7KbmyotS0NM+5IPNb22uE+BUFRIgZC+B1A0YQ49HW+4t8rXIXp6uPuYDKdszwm5OGk72zR7ENONwKGff7z33dWt/GLM0o79L9cQKoKoeWxNRFccW88/NMy0c0ueP4+3ELg4+3ln9I+NMlJPcOa5+z/+XHf16odLB1+DwQdgDj73YFddO/5b9c+78ZnG4G+aEaUWq+5FdHX/DVYT3n1M0VvRQnbPbMWedGqRHuVsCY11caIoEIHOUcPHu+TX/R3BpEUb1zHXi+H7KaJPDlTJ0JEs24UY5D76xmxyh9XcGLWkQM7FmW+UwGY0UAPhhM5Qnu3WFVIWdKdgBDMuih1IF64PGMKSjFKrMvfcJg4tdXk3CxQbqwQWwV1mRsKQ2ZGShNQJcvPM+EfJM01B423wPsyU5XK65VKApzX1Ig4NzHTK9PjDRjbUxpfPrGJKOR+e84BQSZqicBP3kNY8OwXBvg/uhMcN+msEXQ/5OjXnv5nBXRVIkXeW/n6vAAELRM1jkY1Dw0/D4w==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9607ff11-97d2-474d-bdb9-08d4e0e5fb3f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR02MB2465; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2465;
	3:g2iQLX1h+r+2/j4MyXKubXFvC0pTwNcZiBjbBg0VPRLMZ1YepH132MPO2OJXNNGw5JRQXD13qmxmXPnRhc2OR9dLzUCHUjSd3aDTawVRPoggZ9SgzYCNxFFN4fQP3+LEimyHZ1AGEl7Z54c1BF6gR4XGKSU7whbO1rWwVC7gRoFKURKJznVB5wz+MagVgLgKhT4GI/HL1lu1wgGhLgPNWiLok/Fw15rqI7dWzp2twXGxyTHdEYzaULHLbWNFWS9pB0mN+s4yYEe31kbYbnt3WWqC1VovoqCykNOwjqk/588lWVZ5Jgi2HxDKQvmFUqlQGQBx+AZNCQNvQCLY+xRoupt+CaR/WLTGQqtu7JWap8M=;
	25:0xYXpCwIJRpwNm+My9vbJo1BqNW7eoekaDsSoRoGa2HdHDxKr5/4PagYHfrFTcr4Sjj37nvofcI4/ADiybxNQ7ncDi/dQAgWAylwJsqLSGFatRSXzkrg8ENI5ZQwL3A6G0Rhi8Trhuld1Kjftw+EyI9PB+HHO7Kj7Wyq97sY/5qg47TXtkd7c6XfohM9Q4VcSRvpWjFzUn8RvK1Q7djjqNgg7TS+pIKVJe1B4atsjmc0/aLYyyJ0hOMtUqK7xiI+t3QdO5Kw4Q9hGvlM5VmXw2AetceDBkqwt0NesetCjyLHLCZ0rhRQrQDX0vxXEURfrtU96p9OpGcYn6PDq0Y5/g==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2465:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2465;
	31:jRVP0dAVrm8xCmHzCeM4sXPQxutoE0bw8lpKHOFd7MKgQ+y/Q5h1RbUUP8GOd4ad3cUTMhyP1KmSPdGqmsezMYA+HeXG47c/jVO20reN5U3MC1EF7wJQQBcbqtI3NE+fAYPp6k2/+qA7mXATHnO3tpM0gmP730BPdgRXHJls9Q71OnKBy2w/WmTvBxxSx0ylXvH5BqFw3H2zYmk8YneA6n6J6aid0QQ/+4/7xShYl5U=;
	20:7ITQPloP2ZAJ1tZVdmVQjYQVyIYyQrEMIPHGnc1AM1jOWYNBbvfrh+G2eHmi63jL8JPW0/8lirmwXyfXM158cwjHMm8qxhP6UfL3eVGs506cXcLEl0FK1r+rTw9cAncrm9XJItFn6XdPJuCsUc4BVucvFXCd0iojRT3LR7p6etQ7oDvb/nl30pWVFpDpAmEzXVoGflnPZdIQzoKu+Vvno2C9TkFxb7hvYdXd8o0Xh3bSu3zEg+ad8qytPSY8hm9yLw79lci2yRqR+/PDGr3AIKS4VFdIMsP8dWF3T55p18wC4DSaDyVzumFVjdH2fZDrDs2Fj+aJLJ8Wi1gvrDWeRWyGEaSgHnyf1VWFDamxRTOVwmURvhJuBFcyPg0vgNXGMx17wusPqMW3rZECcvYt/r6g7xbCKBngOZEo/ZZ1sD25H/EqlR4vDeNz/Yy8TWCMp0jYdr5IIcNVCsCwwMYlaFo6Gi1Y9aIxaowdP/y7od0JzQbhAnYt46v46M4lTeDx
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BN6PR02MB2465573FCB516BA788DF8E60DC890@BN6PR02MB2465.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123560025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB2465; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB2465; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2465;
	4:kJwsXM0xu59Ky4klNskVX443uBfThQjcYFWLvuCGLGWRptHAqOVXb7mRDBNDcU57aXTOgo0ys9zr+/odaEV16cVQ7VN1d4MpSPCGDiiVS0bmk9IFYsDnflVpRYRwR63IxLVCYMRyAd9LCRkeL2VFrgzkB6NNj3D4hA2RlqPSctqJV2R2FHf0DxuHc9lkkLkz9cO0YPm7VvWS5bIokEsimRFGMVq1q8YtVRLKrCZZY+/eo3u70Htub3K3a7eLKnJrvksd8qTPxBUPJJdVmS/ExAyR6WdRKcTMZ3Kt4zLrowk=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2465;
	23:HpPJXtAoJhDdDWPWtHd45aqpl6WsYG0Nov7oO9dST?=
	=?us-ascii?Q?i+Hh5SEZCykxbs7Nwsct6srDifgYqfKGzINPE/NM3phkyMBTdk8HFVenR16i?=
	=?us-ascii?Q?ef8me278ZsVXXs4vFdCqIQqASirViwEYak5fUPFjKcPAXdVlHQ446d8N8suP?=
	=?us-ascii?Q?dBeZ6r++Yke907JERaDjbWhL0etmbXHzL34/lEyKkV3qsIvKcQvXBvt8YkFY?=
	=?us-ascii?Q?1+6x7inCPzTsOkJcmvkAXqGHMyhvrHqbCj1BOIBL2xtgDEZ+WVMCxLfUnI4I?=
	=?us-ascii?Q?RxVGDIp0PdCF1cwolbuCjrSCu+oFCSdhTHXtAsnNGdvQJw+rI5N4UUf6ym4R?=
	=?us-ascii?Q?lr++1BsD9FGtbiRsiRou5jLHYQb3jE+/umiAH8w9do0IUhAgzNUn+0X700pS?=
	=?us-ascii?Q?lsM5Hl/zJNX+TPMNWOyLFGziBmWUR70yBwuhnjWudDk3rcrbNAbyXYdZMgaJ?=
	=?us-ascii?Q?TlUpah/W1vM93i96vXVVFlcziR6ZcZlSyBdGvRkCE9IyrNzWAg5fF2O8H/4Y?=
	=?us-ascii?Q?999hxy/jD2+iQx1mpvAdTtvJBcKCj6J7uOf1aOPJTaiK2ActixLj5qPJK8jr?=
	=?us-ascii?Q?2WtEcugq81CrZlRfSYeHYfCUk6egxsryOg9M+kq8ez0gvkSyzrPVWJ51Nao7?=
	=?us-ascii?Q?yH9JI3gGHEYx0YiaN3H05Ylw2cdopUefjrDng+IgyOKaWDVLSH5oRBNI63Aa?=
	=?us-ascii?Q?ycvF89ZQxa5smH83/tjZTw+w7LhX7C5dtYBWBXatkMm32zGmF2eH+QGQHjyq?=
	=?us-ascii?Q?+y6+s1pZ9Mw5gENE3CUFar3TJ9VqgU47O/r6wZLGMdjDsZC4vT2hX5zrJUke?=
	=?us-ascii?Q?mMjTmsovqclVvDtL/OxewVQXHOjJPfp+6fjN/jEiRRQdKtpeIjK1IC3dAg3J?=
	=?us-ascii?Q?sFH2zirGy15JCCYuj9ZLcRqSGOB35RSsgkZ3P+L1Og7RQncw6apqg9za2Prv?=
	=?us-ascii?Q?phiQD3zAXApqr4oUzBeZuQuB/ITJ77tnjcmMeztFQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2465;
	6:3x3ZqWvGfDtx2MCiZwd3RNCDN4Xi4KAfaxcpkdqERgDz5bBQHwjiSGaamj1DN28u9+hrJ27muoKlCy/yhShM041WN6/IdMmem4/a2kDdt+XgL3hgRtRzl9UgeI9Sh9KooD6wllD03wZvxx74ZlVqbUe21S3LhIK5zmv9g6mB3mlGaB/nBdFXnsYrnGjVkdxdFKZQtlN8UItDlAbPKOajI4ljgOG/s2ln/PXzYAWqULVR7d8zuRXFCBm/e+6xcqA2RHebwr13m2mNEGfHZX6jJmBDBrXlaigYkE2nJ2QkJ5DmBPTPRJn+Iiop3E8rYshwDrRVRAJflt9zEWOSNvNThA==;
	5:/hmmM4PW/mRT1WVrIddK+bTtO6s+PqNDnAfoUIL5IiuISL4WhQMEAJk4cVmcVFVRe71qTqMbyJQn/OBBuAYb4WPWNgBmHlXVfd3HP6V0zXeQagUU4ls8ikhjKYzfR827Wid1pWtJx7aVlG+IZk8tgg==;
	24:bLnuQGiGjsqaPMSYXHgyYP+mgBx5kg+inlm+xgS6zAt6X7DKWuLheCspOfMlNksGKmoJAH1QctfuwFWLOKVT+Y4WTRW+Y+IqRcAP8z4zyM8=;
	7:DwziNVYcUVAbu3FRvm7BqKIOoCzrd4fhNZzSfc0lWYiGYzt5rlnEh1zLig1MyuRolx/xqs2TVxDLXNkul7fmhVbW59tBjVKeY1V5nAdCX5WsCDw73YuZ3isqq7y6ocE4HocHH3d8QR3HxE8LQglCZZ1L1lt0hgKCsBBfqxog2QQ6vLi54Lli3PBBDSNCDVkh8jTaRn8GJapTthdJr3Tw96WzkbrkqK6rEirHHD4zINY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 18:22:52.9723 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2465
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.53
Subject: [Qemu-arm] [RFC v1 1/3] target/arm: Update the memops for exclusive
 load
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EtNVR6a4hHNW

Acording to the ARM ARM exclusive loads require the same allignment as
exclusive stores. Let's update the memops used for the load to match
that of the store. This adds the alignment requirement to the memops.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 58ed4c6d05..245175e2f1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1854,7 +1854,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp memop = s->be_data + size;
+    TCGMemOp memop = size | MO_ALIGN | s->be_data;
 
     g_assert(size <= 3);
     tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
-- 
2.11.0

