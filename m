Received: by 10.223.172.38 with SMTP id v35csp1197780wrc;
        Wed, 20 Sep 2017 15:08:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA0XU/XfG/ERadD9Al42ewIlA/ESSWixc0yuaOJ0K1XTJlaEKu1TCWRwoNwON+pQGoKVvV2
X-Received: by 10.223.193.140 with SMTP id x12mr95617wre.155.1505945289078;
        Wed, 20 Sep 2017 15:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945289; cv=none;
        d=google.com; s=arc-20160816;
        b=QL9mpFkL4g2jImMEpnYSaCfyQ/X9P6zluzlVNbr1B8UeXZniEs27LvX++onLi5MLbF
         rA9i9J8B7KzYgeNn+WtTRlGp/SkqXE6lfD8jhQMmULK1BDlm/1V2lhhMmkW+Hsz5eT21
         sydq2aC4lxZq1AsgjgPc6tBxMBfDMN8VMJBSmdPmOpCHtkdeBI6rwqDi6+D9J/3f/3yb
         Wq5qQLDHSgPl3Ce+j4cYFE/xohk94sxLjMrL5JxQa9xsoiHk0706CbVR6f1YgpaE9sYn
         bsGPXnhJureH+7h2cK8w1lGraumluajzOujYyglHHBHGj0Gy6N1Ubi2yLWfklTTfP8TA
         D0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=Ov0okFM1zctGJe8TrTeRo/7Vz9XRsUJZG2xhf9WQd78=;
        b=jNb9kL7I/QkkESfk0/UX7fMi/aNa9P3It8Yt+I01wkc11UnPE6BMJ2kFrU8QvEWRIJ
         1WQNTQ/MAd063TwtiCUu2p0yNFlKCGQPJT/tkp7B1I4hEsuMdkANREJGgYPsVbFEGj8y
         YYetkXN7K3U8n7nhHZK1sSdvR7AKE6XXBb8tEM3zWdOtRsUA/XYIIb7dfEHHROIu1yVU
         /AzJHn+KvJaXUUoqxV9wxFFnUT2Ois9twPlX0LLS0gzA5NSbQgghtSJnDC749pD4+L3N
         atEnrzg1v/LbXNO1suCCsIA4me+HeVfLqtZCdza9HqliYkn7Lqp2OlH5eOZXw1CVG5OJ
         IpwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Xf8dk27q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d30si2171803wrb.210.2017.09.20.15.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Xf8dk27q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dunA8-0002hV-0p
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:08:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7t-00016T-Mb
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 18:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7s-0000gv-Cn
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 18:05:49 -0400
Received: from mail-cys01nam02on0054.outbound.protection.outlook.com
	([104.47.37.54]:6368
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7m-0000La-Pm; Wed, 20 Sep 2017 18:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ov0okFM1zctGJe8TrTeRo/7Vz9XRsUJZG2xhf9WQd78=;
	b=Xf8dk27qW6GeXZQOQuUCJczITUX8o/pTLAob0QM+yD+xWYOjBn6rUK3nMi8mlwKZwtCmi7hnCvL48TlWDXM5lf2vK6yqkRdrlRDGHL3s3aC6rZheq24V/fh0sL+3KdRjbVLkZD92EDjeSAbMtlWKXiY48k0hNfbs1FyHbri/HAc=
Received: from CY4PR02CA0047.namprd02.prod.outlook.com (10.175.57.161) by
	CY1PR0201MB1932.namprd02.prod.outlook.com (10.163.56.30) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 20 Sep 2017 22:05:40 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by CY4PR02CA0047.outlook.office365.com
	(2603:10b6:903:117::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7i-0000ee-Cr; Wed, 20 Sep 2017 15:05:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7i-0002Pj-8n; Wed, 20 Sep 2017 15:05:38 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5Vot025835; Wed, 20 Sep 2017 15:05:31 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7b-0002N9-Kh; Wed, 20 Sep 2017 15:05:31 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:52 -0700
Message-ID: <e1b49cd103c58fba8d74afd1bcbd81441893beb5.1505929556.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1505929556.git.alistair.francis@xilinx.com>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23340.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(356003)(50226002)(5660300001)(106466001)(63266004)(118296001)(9786002)(230783001)(8936002)(189998001)(305945005)(2201001)(36756003)(478600001)(50466002)(77096006)(5003940100001)(39060400002)(316002)(47776003)(48376002)(2906002)(81166006)(110136005)(33646002)(6666003)(8676002)(2950100002)(81156014)(16586007)(54906003)(36386004)(4326008)(50986999)(76176999)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1932;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT018;
	1:k0lVsZVWS4uXO+h/mSnQQKc77xNxtt7mzNYVmxnk9clLcpNXJ5qiZMkt4pzoA1Y0TT+4IOVMh+p+Cju5z4nIt7QDPuINQeqIix1xfLswt67akvE92Dke7Z98z0baxG9E
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 717984fd-629b-447e-4dea-08d50073bad1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR0201MB1932; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	3:+ClZKBE0hsCcncx8OkRZap6XUZAo3s5R5NXBwBF084B3n6HIHpdfAWRRuVkQTpbGb5IWmf2eDQOgonjBBEI/6bqktFi39kow0Pkv3qHJU0O6+3Qp2lRqHmw+3davLEAhgC86Fa0OZOjbqJg1Quk/sI620G6S5P0QRFVVe0Pl4ScCCKZn7BQfWtaPhmjyU7iHUMobnQ9kuE2LVrhuQRi//F7DPrKo4oMPoEeANwOnPCN++8ntaeIIBai+1BjfKm3mFII413/NgmgwC7zHkNOHRLK5M6mi4mOK/vSEewEpOCsGkwW5ZK85x0bCPSRKAa5tPogbQRmYBrPrb7+Bd1a8Wback/1ZY/2/v7L1MyYoW24=;
	25:5/0SsfJY76Et57nO92RDt1gFL4GebXqve/zfCWdQoo0rAt7qi5VC9lVmUuwLdeRnSnPgxCzdP4FUrKTlFy1rJdMibjwVV4u5oXjNQ4VM8orZOcFY/bkTDf/ONa3LCFAZ/Qam6K6rEh42i83sKPpQaZLEKBN0rBNQhcw32mrqkLUZLqsPfQXeUiVHwhhg7JDrWS7IxM1YkTATZ9+/JZEWw5i+X3MdA9NCSYvbm13dW9NZqfcBOSI+T4B3ulzv4w4g3Fo1pYGmVT6zUT2IRKYJqRfXxk6IiDj44P2Whf/S/1Mk8H1pHWqu+FWEUttRLXhH0JmKXCx5SUVvDju5BT4+JA==
X-MS-TrafficTypeDiagnostic: CY1PR0201MB1932:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	31:EbkPqyLjQq5Fh7iOHXVFopEUF+2Ok7Ccu1HREH/uyn5KpfTs4mYRmYH7ToDsUZiyg0PWav0acgHBLhM7yH8T2sor/YhgCchTiCqMYrdY6EXTrmuuLBdg9fQL1/nibMbCMGee6VMv4ojvHs7mGIf3cMKSanIccV/mb/H22uUe45yK4nsEZIGFGn7LBBnUEQ+lU8GPpve/En7MO4zK5xwHTFpK2rpDZQcXQ3T/ZFD0rxs=;
	20:yvkSlSZy7M8J644lJz7yywme0S+ifUsoLCmqlsjQMdU+6v+PiThorWFgNeoZ519WVFyy4hwr/Y5pCdMov3zWTg6ZyHsJgVsjmlBnDH3Sd/Zo342d9AWk0ZHmrmsQr0rEkbbADW5ccE6522A14xo2YTz1k91YDQ3o8e7sNhvf7bPGoCbOmqBnMbAVZao4/fXxyaGIkw9R4rD4LpQkFekzo29BGwRqEerwGdzEx6uFwgP/0vBlXQxbU2YKvEW3HyD+Y/g0T9kd5N1NpwlJStEXbdqHjGfD//FkkFbQxr5fg0AZlce2ZYy4pEudCSnztfhBGyOhUHMcYLbqbVE9IxjJZNUZYQ9xKazPA0c7gH5He6E3xTA0z8/7rZzmzvsnQZvB7eedgdnr6J4uGn06h6LXJ+BcZSbFEiU9Jv/MRcuuLeIJPzma0i6I0w8nB3TsO6fHjJDVOuLcZ54zV3Amg1tpb7F66i3bAR3/tuSLy1b7O7XjB4Jb3zB9oZ2CUtxHjQsZ
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY1PR0201MB1932333D988E5C774AE9E249DC610@CY1PR0201MB1932.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123562025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0201MB1932; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0201MB1932; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	4:ctH8GB87feyUSJpvMR3hTDsWPl2UVv+mOM/HRDdtPVHYqMyq90fy/NOIL4BUVU7yufUdZk4FjFgsEHTirx5QDIGHWeJle+SN5cFeLIZGnsOIJvS9GTJxrH9RcUKeN5dXTo0QgIlRTT3DSoPnYfphtv9cTWNhf1A4ZnXifVeLAIxFp+yTHRxgQyUjdJuRQ9bx5Uwhf5DS0sqzFVsi3IYTBCVyKCKrP440W0Keq84U57arsaebU1TPS/7O6JVR53P7jWpTyGkWkz4WSGkbuk95x4bUV7dEcnbc2cq4frL0QbRK5A2xXJ8c2ZdSPWazhNHZGKMkCCpqdp5Aehg4goT7Fg==
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1932;
	23:SoQkPz/L/xxytszhvIgVpL27adFdbq+Is+/XG7e?=
	=?us-ascii?Q?B27qclYB6WG/M7huC/r2nnT1owXHJ1K1b+sxVk1gWwZK6VTwvQwEsett8x9Z?=
	=?us-ascii?Q?4J+kzA89/YynEOstVc9olarMSHzJnbb050I6qwdGmbCctYMMf3HU5CiDIGqJ?=
	=?us-ascii?Q?nzKY+MDdDZI1bQKvdCgKqOiOZVlebrlnXWC81FfDBGak2fyvdrHkky4xZZAm?=
	=?us-ascii?Q?zILLXFMAcl/g+w566fmpH+HULrPJEvmt0G2almGsf53umlhilRLdWk/7wp4L?=
	=?us-ascii?Q?Q5NoJr7SGu6G3qMcWLO0vhksocRMpzXEL6/wpZMB6/LRtvj6gf6fRxsRqrmA?=
	=?us-ascii?Q?04pdeAH6wZEcQeEV5Bz849XK5Y0I6VNsyT7/LKEGXOUPVmKtK0ECA6OSlX0P?=
	=?us-ascii?Q?KjRNUIuqZKmPorLymTxIdl1ZHG0bJRsPY6niWHmWYIqLd3SOHpw+5y9jzLTm?=
	=?us-ascii?Q?uQ96Wei62oXoYCdiYbypaqyBItVSJQ1PL926hlqzPtWszvJ08gdZ2sKayVc/?=
	=?us-ascii?Q?W0Kb19Sk96oLrudS1bIdokeOGRWki9j8GAjceMez6G6N5R1aneEdEwUX5MU8?=
	=?us-ascii?Q?+xesvP0rmsSVwvCt6as/xJFZ/E4rKSNKMIdNbhkspdla2C596S/QkObL5KXR?=
	=?us-ascii?Q?l5bi1wUilGWokmgNZRZ3hyXHd1R2L57BVwLx9ShWGfnF63Dm4NF5xAoHC3Wz?=
	=?us-ascii?Q?klH4699h0Q5ud5MZsAfc2hysrEOEWTt50/Q8u1KIYIwIINbwOZG/TR9+EiVu?=
	=?us-ascii?Q?ctlciGc58Kg4DJC3XE9ShvSkn4EmVYAsKp84lP/wiMF11bJeAcWVTzS5Koos?=
	=?us-ascii?Q?Kew2zsez6kGIZU06IkAm7HcwQ0EDHsQeO2UQLcAslAY5aVda5OJ0JxM5xdI+?=
	=?us-ascii?Q?eyKfAr3lB/aYMhPSPddPgHcPZ3bNUgFH0liSs8YzJg/rge2FARq5VwLhWvtL?=
	=?us-ascii?Q?8dpnCOeNbX8a91S8UaRY+DL58gJoe29pWmHhW7Axx3d48u4mAn+ShdEoNksO?=
	=?us-ascii?Q?T57vUtAPDupwnI6+otRBQqBVo0mNX7BoO2KPcQ0qrwhwKfvy6wQF0+F+3TBk?=
	=?us-ascii?Q?Fg4fJxgCCfZLEohJ4Tvh2yQkxsTNi?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1932;
	6:/++s16u0OYJ+KV+sMk8MLia5uaDJV0Dkfa0iGRfwTHl6nsLkm0RPIa44yk4FGtBHUwhoK8d5tY24aQN5z/RMkPirk41UGgaPcTFibbyOjmhfy264QTMvHtDMZXs6OdspJrbj+KY2+SHCVeuodn6umY2HpOd3OF51tKEPDq8kcsnqtAyolI8HX1rchcIFws1yFV3/btR18pRxdVheYXSvJiyUNT6Eprf8Hbk8oQrLgU5oClukIot4TL9lNbQ1DVaklX9H+HJyesEHYxDoMj0BRBdk4fXAIV5fmibSrHJstvBakMP96xj+lxEitvwQgASfYuJSMgWLKHN03DVdI76klQ==;
	5:fk6jsDnl75pwDFPlWdMYvGfBOO5ep+15LT/XywF+i+oNOfFiXxcQ9xSE4n9owSv0awoCPfnWxMkzeY7T3l8s3veSdgdURJosG4VM74TVDzMl8cF6eOAGn9v85pl9zda8D/ra1/2fhTDccGwl/fRTDg==;
	24:18OdjXKGOd+cDWLC8aaYrCTz6ygTWC7SqPLZEVSeucjPn5HuXdtkFkHihto6rjiT2rruZeyR/SfiObFfDUoP9/KFrj6zoex2CQNNWO7lj/M=;
	7:PC9zSwlG2avwXPYN4O96zE5Ytfnh8MJwgAB2uZ+aFgx8xqHEwEldZi3l2rR3+muUKcXixWi4JQkVJiZvHA5HuhJg/jI5mtbqKT8W8jysHamDd7YbAAyij1Bgs68lWDdVzp3p1glqYGrL4kVzOFDy6KzGAEALszC9mWDL84uvUuU1pts8WngYSiGGzSF5ICo19Ym/+AmVevT23zM/EyTgiRGL497CE2zBQY84txNYFPs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:39.5030 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1932
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.54
Subject: [Qemu-devel] [PATCH v3 7/8] xlnx-zynqmp-pmu: Connect the IPI device
 to the PMU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUTSCUrNdH9S

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index ca98d82e87..2016e34db6 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/intc/xlnx-pmu-iomod-intc.h"
 
 /* Define the PMU device */
@@ -38,18 +39,28 @@
 
 #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
 
+#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
+static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
+};
+static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    19, 20, 21, 22,
+};
+
 typedef struct XlnxZynqMPPMUState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     MicroBlazeCPU cpu;
+    XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
     XlnxPMUIOIntc intc;
 }  XlnxZynqMPPMUState;
 
 static void xlnx_zynqmp_pmu_init(Object *obj)
 {
     XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(obj);
+    int i;
 
     object_initialize(&s->cpu, sizeof(s->cpu),
                       TYPE_MICROBLAZE_CPU);
@@ -58,12 +69,19 @@ static void xlnx_zynqmp_pmu_init(Object *obj)
 
     object_initialize(&s->intc, sizeof(s->intc), TYPE_XLNX_PMU_IO_INTC);
     qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
+
+   for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_initialize(&s->ipi[i], sizeof(s->ipi[i]), TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(&s->ipi[i]), sysbus_get_default());
+    }
 }
 
 static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
 {
     XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(dev);
     Error *err = NULL;
+    qemu_irq irq[32];
+    int i;
 
     object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
                              "base-vectors", &error_abort);
@@ -89,12 +107,9 @@ static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
-                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size", &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge", &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive", &error_abort);
     object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -103,6 +118,19 @@ static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
+    for (i = 0; i < 32; i++) {
+        irq[i] = qdev_get_gpio_in(DEVICE(&s->intc), i);
+    }
+
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi[i]), 0, irq[ipi_irq[i]]);
+    }
 }
 
 static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
-- 
2.11.0

