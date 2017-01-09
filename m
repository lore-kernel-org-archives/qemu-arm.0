Received: by 10.25.205.13 with SMTP id d13csp11530023lfg;
        Mon, 9 Jan 2017 06:50:06 -0800 (PST)
X-Received: by 10.200.43.5 with SMTP id 5mr82267968qtu.279.1483973406530;
        Mon, 09 Jan 2017 06:50:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g46si56525844qtg.137.2017.01.09.06.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 06:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQbGt-0006El-Kb
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 09:50:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQb9U-0000hH-3g
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 09:42:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQb9P-00066Z-UW
	for qemu-devel@nongnu.org; Mon, 09 Jan 2017 09:42:24 -0500
Received: from mail-bn3nam01on0059.outbound.protection.outlook.com
	([104.47.33.59]:1368
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQb9P-000668-E3; Mon, 09 Jan 2017 09:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vnIw3Xpml3AubQ2zY9x7KksdgVyG2Ah/4CVMHiG/JGE=;
	b=YxfYRCr/l8tPA7I4p3A3bzvOr8tMf+LVNQp4FvKURHisLfaXjQ/Mp5WdQet0KrXuJVKOxQMHXfgPo7H26D6Q7bu+fnmU0sBH4J1ezeXhFChSLP9uYkCONx/XQS/f5uvls1TktsjaNHt+UkhKvmA20vtv6X2jml+Bnv39623a7cg=
Received: from BY1PR0201CA0027.namprd02.prod.outlook.com (10.160.191.165) by
	SN1PR02MB1390.namprd02.prod.outlook.com (10.162.0.18) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Mon, 9 Jan 2017 11:10:42 +0000
Received: from CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BY1PR0201CA0027.outlook.office365.com
	(2a01:111:e400:4814::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.829.7 via
	Frontend Transport; Mon, 9 Jan 2017 11:10:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT009.mail.protection.outlook.com (10.152.75.12) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Mon, 9 Jan 2017 11:10:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQXqa-0006yK-Ix; Mon, 09 Jan 2017 03:10:40 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQXqa-0007R8-Ei; Mon, 09 Jan 2017 03:10:40 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQXqZ-0007R0-K6; Mon, 09 Jan 2017 03:10:39 -0800
Date: Mon, 9 Jan 2017 12:10:38 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Marcin Krzeminski <mar.krzeminski@gmail.com>
Message-ID: <20170109111038.GI14990@toto>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
	<20170108083854.5006-4-mar.krzeminski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20170108083854.5006-4-mar.krzeminski@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22812.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39840400002)(39450400003)(39860400002)(39850400002)(39410400002)(2980300002)(438002)(189002)(24454002)(199003)(63266004)(8676002)(106466001)(356003)(626004)(4326007)(50466002)(92566002)(9686003)(50986999)(97756001)(189998001)(54356999)(76176999)(9786002)(5660300001)(2906002)(33656002)(1076002)(8936002)(83506001)(39060400001)(57986006)(23726003)(54906002)(77096006)(38730400001)(81156014)(81166006)(4001350100001)(6916009)(2950100002)(33716001)(46406003)(110136003)(305945005)(47776003)(76506005)(229853002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1390; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT009;
	1:nX2cyKK4ne+anmKdmS8D2q2qI/gNEQNtzuJdjcI35krhVm82xPi5B6iwM14ZTNXeCsf31u9aYHcwNWzGSmuKXXRyutbfFHTrhlCa7wQPaQeBcFghIKH1+RYwrfqKgc11Kc+nKuLQT74n/bUAf/jG6zXDCz4ST49r0jgK//4YkNiZCKBq9iQdy3ytAU40R/Mpq8+hoECkfEOBb++kuOeZmKsWwXJ+R62/+YEQYm5DwsrH0nkOXl+ihyrNS3z5dgB1vqUhg9rLkFkEIZcp3oXVYfce2yJlAjSDKpzGEHKasxJxpmb+lWC7L7JGkPEmAgzpxPs8ve2vDF3cLFq5eho3jqj3NJwPkvcuvoV1tODFxy+c8iublC+4k+tHyetQBi06N18qgm6e9HR862iUu334kiA4dXvIvsmpe/sohIi31ohbCBCgdCrcFOoVqRzCIoCr1ZGECGkbhaEtEhmsotoqlPk5nVUwjNakX3nQtQYf/8VZ9D2KK7OyDR42iYiJPSnZazpEMTrrJTXsB8qIMPzqcAep+KRp8ilUZz9U/o256Og=
X-MS-Office365-Filtering-Correlation-Id: 0f26522e-450c-4f1d-b3a9-08d43880265e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:SN1PR02MB1390; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1390;
	3:LtnDWUHnjGy1UX8LnidBJ6CfVr7UKM6lIMtecDEFcPtDGSNn4/mX1h1KJ6GVoXkQmbyY2agN459BwlMJwTSalj2d9HS8hIu03X22i3cZWLJtTZ4zjLeJkXmjNv86aBLYmJyzrgyidBiyZX3bg1jEwbysEa2qKV3jYF69JqPE/nXJKPgS/CQKOaL5towxfIar5mKj3V9LhlHpXcXlKSPrgD6IE76mBSviVoFCdO4KmA/2a8tkKhXKn2zdo2TafLYSKlJy16pisXzORx5ibCN1rm1CYx1qB57XEGiBbi9KualeSn6AXsqutCFwRnb+tO1BeEV9J7jTPsmzqlZ8Ockw3Tru1p48ZcFh5+IxGPRuBL8MHlclh6gZ6NCER932HOadL4zLGx2x+kYJAM/ByNd6LA==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1390;
	25:5/Cnn128JDuEGNA2uGncxKgMCxLpj2NbIpQYvwuuuzAQmHXD0lSMwgevfyZJfjODghz+1Qsst75zrQ0LTucfno80rpMflku7A85rsUIk6HollnOY03Fc0fdtNjgMlWxdCm/HCTWFS0+IX2o730ORSdhcckjnF6zwD/wRPuzBdDfOUA0h3jsj43yjJI3xjdy+fCo5cFyMmN3XlPd3tqFFdK8bU9h4AAkLFcJKB4Gphl3DjrJ3AAmOTnEuN9EEIkXTCoy6nomKGHaGjR5MtYf28xosWQdfRYBq/f1OQFEzQbBx2dSvptKYDMOsck7TRBQPQUVNhGCc92P6MAjS0LuRsnwjkEadehcg/EM6SVTRKK3fwAx9GMInok/L19H6S4PBRhLbLxDvwbVjKQq6eHNqYtE2MRmefBDHKJcIsQYIw5k/nq0ESLEVIXFLM18orJkguZa9v+TBIrWDb1zSKaCqg8VnGxP6yG8Yts5dTQ7zIek447SMQ0yQI+56Fot011zCJXHgZv3c6QFIXOwqg6BAT1npH1XWaCcg4C1LvYOcuaLiy8CqWFYlXuI0xFMyyjUpB6ObAzDrZson6Lxa2NOD9nI2AyirDm/rnU/X1Bxfp8gPoZo2HdNQKhHgddqzszWcLvSXdoC55UKDfIeRhz3HXibOp1tct1GAbEH2ZjHFq9OsK5kHa9982b3J06DYyKnimLRVAs24QyR3sQ0q56vTazROlec/Ithqjv0MnEkuBazM+l1DOshij08qDaWgc3CY5Tq+KXyxFrA4YWzFPHvG1Fbl7sB6L5jXrjSv04TAxfYmcnbhK5KnYbICJbEl9LJKVhuhN/3xN4DMOsLQkUJV4w==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1390;
	31:wf5/lvXG8PNjr+/8BkDL2/hcwKlyfB8IU4xAhUSCyL0MLPu7gwS7FkNdVlO6r8xicx3qfZHumQcKMfjL+KkUwDDAvEgc7IM5HEdij85mP4SusMgAVbvkumrQ/I8ywgZuOZHwHENLoO63dYZEgf04R0Kh5M+uA0n3AL7uH00WA9F3pcd5SS/jZLyIUUYi6QeFliGxQuztm5kiUelb5XqqznLIMT54897bm0lSm7c8+7bDS7AC8WMDY0eJOVz0GXCeyO/81Zb1ZMxQ1pR9M7mIyhXBOZ1c2ZTD52U5G9sE1wMlApMvSJQF/rlVJ1gdOJ3b;
	20:Cn3XryHDNienfRMEashfle0lK9LDSrprneQ0nEC3iGoPecJhmkcFyBEtNtTQIDYMkt4LWRxpBnK/jMAlIO2RKSUnZsdNeIdu0/60o0nKtEQUK3xeU2Ko2FS+HiKXCaBbmf9P/5tK9rUhY9P10xu9p46tp6qbixhFiTs5T6AhQUk4rOuNWgQpjvtTJfXqn69zfUXU/Vpg/yBZVHj4pFq14RsoLisd/8TqrwzGATp0c1/EgIA6nxACGkriBCCvwm4zwX3LwclPhn7t0TNDJ+weVweAellMx3b7ntSyZFsiE+gnE7oCod6Y66qeeiG5/VRdolR2BQxQs7r7cTFwtzORDP4IG/G0ANsfdniuq1AsYghC/ormfAhs+7Qx1n7fE1v5dBWGYPCXFqSm6zgGF2AqnN7yPuXPMqrUYB7PRK+DGmj9tAUqfIhGbFU4bRKDHkL3xigzGwjMCIu7Qd+RGHhKYGLOTdN6r3Kg5QxeK/ZAA5jHt7fvJIkfZgQvQKG7eFDH
X-Microsoft-Antispam-PRVS: <SN1PR02MB139046C73C5B412476F1B513AB640@SN1PR02MB1390.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(13017025)(13015025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148);
	SRVR:SN1PR02MB1390; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1390; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1390;
	4:seknJH0PUexy+kSNx6Nm11vRkazUXO8LGvJnhJSdVkEaFTgF6bP81TpbfPnIFks9jD0NK6qm8v0qY6aIO3bw4HLWhpKOqslRZzyV7sddq+nstBE3DwTlnJPh/6xo2v0kTvMjKAj/TBd1ggeTUHUWDvaM1aajTII/VxBDkaQUFkMGRVo4rESVe8zePl3kUfrGyujNfeviNu9oxg2TBX+u1rGQGVbaKgZqbHiZ3eqkrzTS0WDd9RMsY3xvL7/k0ff6GIDFdZNVzXzb0Gy4uOK2sDBchOzoBhvPFG8tehIeNlq+T9jD4UMmHjF6KjfckepOLC9xeDjz6AmnzxsVq/oAjtZIwOqse8RJI1txHNUm8J7Rwr2jrlvzNHdtRRB/NGuiQonf2+aR2jr7DbazEUICKdGb4MLK9NhFt0KWSIkutL8ePshINLhHRDBtNN3OisbaFn9fJvd1x4RzvoAhBNO1ZQU7qtjtmG4Z7WNRVSRA+AtHsjbmB93jwXSvCYx99MyHO8eSlOjz3s/RBuSAZDr4hZb+tF4KVbcYiXpli0rALYtqmnFY2TgOc6JgiVLDw5wptlgD44EM/f3Bs2DxzCkmoJifJ55UssKDiML4fcZfF1ldpQqwJHykQ2H8qmzWsh9/d9rhR6qnvWlIJrypAEirM65VuVIUwyjBTZmfvwuScNxUNbiWG+JTeaD3y6nElJ7CaPZ9kDh2USFYnC9HTGuQ5PZTWmHmkuVMF1Lsgk2YgEY=
X-Forefront-PRVS: 0182DBBB05
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1390;
	23:dXIpap84UQEx6CJvcvN6qW4N6VvhqnC+fVfqcsCI0?=
	=?us-ascii?Q?v2FCtlI/uCV8+2Rm6xs/8Gig0Juf79kAwd4i9J/XzLi1so2KwoidDvOBKSdg?=
	=?us-ascii?Q?lDTeoIMEuOpBu3MFXnn2GRBJhP5VMHX3WMsH/tm92mflVYYRyGLTrDpNDbbR?=
	=?us-ascii?Q?Z39MAD7WL3eimT6VlINCxfzb0hC878Ix+ZDGhFKlRR8+St7oZuDQGc8n+bFH?=
	=?us-ascii?Q?X0S2zhyolk6j6U+yQy6ORFMZou0PjwjmeSQmymWwnb+mAYSlEfLBvU8q69oM?=
	=?us-ascii?Q?37aYdVAjSL1E5CHL+ymLY16UPDxcEF7jd2dJ4cNz1PJgGcT8WMMlHGwvSHHS?=
	=?us-ascii?Q?gl46QCbppCCnFLynxkazB22NDkZIXrBwFVKATxxnXlAJdeyOaAo6lIdvWh2B?=
	=?us-ascii?Q?FAGP7C1h6Aq9CZ9KkR2Haysv5V+ZyroPe3vlzRVjxq7FELUZpiCr2rEzPW8d?=
	=?us-ascii?Q?a98NDBVwPYs7mBxmfnLuwc+9dgky4po6tvjLDgnoJuNmzqXL0s3vUZhXa1po?=
	=?us-ascii?Q?tmLGfbERMIyhC5OgSD0LZk4ze1WeCKc4L2eoZYwNWMvasiUKLKjPwS/McREF?=
	=?us-ascii?Q?J1nKqgjUMUdCKfZjyEdzl0tiwY/uHUh+DW8LeBM3NnEQHaSBUzaOHNAhZKbh?=
	=?us-ascii?Q?lAz/8K9dogKqphlO0GF/iX3+dHWrGI2zxQArC8io97+hXOVNPl4myYSolALR?=
	=?us-ascii?Q?boYNVv2qSKuCaMIb6EY4Ov7dHgStW16VkPcdTu1RiW8Q45FDYFfspnYmArNZ?=
	=?us-ascii?Q?kBEUpakBGXIeF2D2C8rMU9pRYiNwX6pROTt0qYvoYa61/ypeJYYFnwmKxnzP?=
	=?us-ascii?Q?goQPIxS9gE3RNBipMNKMGjJ9i1a6LEjzy88iEWktPlMpDZPUNFCXDc3SL+yJ?=
	=?us-ascii?Q?pxWPPeJWT9s7EBV1lm4dcWgvJdOrQB3wJLeUNPBFbwl1IGKFjZaJ0wFWZRdk?=
	=?us-ascii?Q?Kw7SWfZCXmHDQShQ9wASUub1kSAnFDtZd+6m1xAbz6uJPzbH6BpCYzrlgcYY?=
	=?us-ascii?Q?ZHs0F1drFAp30KZqSVKTw43sZRimaO34le6tznwZtNO5W3vtY6NOunmIcMP5?=
	=?us-ascii?Q?VnZgRCRvxIOpeJaL3iONqYwmW94FrTiwhTQrpeqxM5Z98zcxUloVeu6QP27W?=
	=?us-ascii?Q?8C6hhgGRxqfyEpwl378rWA74cr1tEfGQiJwzVm+23Tq5PxCrSMO2Obx1mQmk?=
	=?us-ascii?Q?KC9jhXWyYhoeghfkHW7DUMg8t4zByGrK4qJkpas5oEl9lIBY6Q1NsrZo3aSc?=
	=?us-ascii?Q?PPeIM2qXWQJDri2vyFyeo4vUvYKwMBGvskhEpser6ijkSEGIDdtTczXin05T?=
	=?us-ascii?B?dz09?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1390;
	6:WjltEstj8L+aAlcdNDacMzEmJelnoLnVAsKEWQY5+yM+d3H5BVlmvgyX3qxRqFkEVjjcpdPeqrZE+pQoGjZwS2hUQ1dB51Z31U4fX3to9orLcy+OAjmBRU7XuvfOkg9/hhpUUSok8NnIw72JNyYP+jxdKvaAZ395OfMk3lMtKWWCbUvl2UWXe51xHCwulMwZqC6+MPkIkQaA8NnZm9Im01d8dDVEiABxS7F7QxDuFPNJfL1+hdQ9WMkAGHRjSNbgtpG3My+zl+RZzFHanFaxLvJqWA1N7Q0EXdqeiiQJ0OAN1a09ODbpJab4u3mXHBMLi3m6lIoFoIdMebXdNWV+RCnGh+7cGWda+//j2G7LtlhDJUXyn3NiF+E40bf6E9nER/r2pHlrXMjasYPCoqSl8tk2zwJZs/303S2XU2EL9FWLip9iMDovIejMJXNnhWKpLH62QgMuZ+hUiDr96y3WEA==;
	5:fW8QVGhoCdcLjjacgexA9gOTY9SHIJfnq3fBpcDwWBmrD5bA/AI/Yku9RctY1PShfOLuuPWk3litGTWd10pfyNdVrZjBegSFEJ78Pm+pYnZQxCQAYTa0puUQRiEB1qx4kJJ7fC1WarXVGcv+7Ev4dA==;
	24:4v1qAEkO6KWFzaIauMgbvklML0+GB9rMU6r+YQyr+a6vG4OQg5WkCkQad3AlgRnwDRv4+1/Xg0NfFQ2nlXdRUiqhbnvD3W1L8wukNN1wRf4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1390;
	7:NqGGsjQChRRbmMsm6lZpWkv5P4dxiw4rwOSPuXbWXmUrNJnOrkQiKfULcIyvc7TU/ExasZSm3RszrDjmd8fHwSB15HYVtd6Ud9BShZKigwntb3qQXij97JtDGxI0MLorSGR8k3LQ7Y0tPmn89+MVqP41ocZuF50UbnIirdg9zQlaMW5VyPGcs93K5bFpya3fWaBvpZULLfOz/rBf9v4DNb6sEnv9U8ZxQRR/ARHgM8k+EOzbGTCZlWkLTyqZFu0uS0M9C9uWdEmMOAvjP7Kj/I2awa7Gf7DKfAhGG8JQRZznDhqu36g6Bi0d69rAmPUYLWvPSfhFtHeSyW0aKMy7zrQGBIo9xEyXhG8n+7fYIbYMZCH9eTJwxSonIQ4b6S14oP0lrQfffOLnXQK3jeHUQtPc5gAgkNXLeH6hFc485Ro8qjwDQ1RAi1aZnCBCbavpoqZxPoRnvgrvKu/pyBugOQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2017 11:10:41.3198 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1390
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.59
Subject: Re: [Qemu-devel] [PATCH v3 3/3] block: m25p80: Improve 1GiB Micron
 flash definition
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o4EpeK2blBRk

On Sun, Jan 08, 2017 at 09:38:54AM +0100, Marcin Krzeminski wrote:
> n25q00 and mt25q01 devices share the same JEDEC ID. The difference
> between those two devices is number of dies and one bit in extended
> JEDEC bytes. This commit adds proper entry for both devices by
> introduction the number of dies and and new 25q00 entries.
> 
> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/block/m25p80.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index a9b025b..fb5cef3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -242,8 +242,10 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
>      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
>      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> -    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K) },
> -    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K) },
> +    { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
> +    { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
> +    { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
> +    { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
>  
>      /* Spansion -- single (large) sector size only, at least
>       * for the chips listed here (without boot sectors).
> -- 
> 2.9.3
> 
