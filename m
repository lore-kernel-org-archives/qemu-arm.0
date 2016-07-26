Received: by 10.25.21.156 with SMTP id 28csp1430206lfv;
        Mon, 25 Jul 2016 17:15:36 -0700 (PDT)
X-Received: by 10.200.49.129 with SMTP id h1mr33876870qte.103.1469492136125;
        Mon, 25 Jul 2016 17:15:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si19378140qkl.334.2016.07.25.17.15.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 17:15:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRq20-00072m-T7
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 20:15:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzt-0005fN-Cb
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 20:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzp-0005nu-P7
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 20:13:21 -0400
Received: from mail-sn1nam02on0044.outbound.protection.outlook.com
	([104.47.36.44]:50210
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzi-0005kD-Cj; Mon, 25 Jul 2016 20:13:10 -0400
Received: from CY1NAM02FT054.eop-nam02.prod.protection.outlook.com
	(10.152.74.58) by CY1NAM02HT190.eop-nam02.prod.protection.outlook.com
	(10.152.74.189) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 00:13:08 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT054.mail.protection.outlook.com (10.152.74.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 00:13:07 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:32951
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpze-0002Cq-Te; Mon, 25 Jul 2016 17:13:06 -0700
Received: from [127.0.0.1] (port=38238 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpze-0000nF-RY; Mon, 25 Jul 2016 17:13:06 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6Q06MaZ028699; Mon, 25 Jul 2016 17:06:22 -0700
Received: from [172.19.74.182] (port=59994 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpze-0000nB-4O; Mon, 25 Jul 2016 17:13:06 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 25 Jul 2016 17:12:37 -0700
Message-ID: <5778bd2c8a0fe59682bf830c2c17ff7207b296d7.1469491920.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22472.005
X-TM-AS-Result: No--7.805-7.0-31-10
X-imss-scan-details: No--7.805-7.0-31-10
X-TMASE-MatchedRID: Aw79K/Y1oNTgk9PeQ8a1PH6DQ2TEDqZsIR1rLBJm/M4cVJCT3tVgas+c
	wCLpvDnEC96AWDFf8+sVnVHBM7z8OIvCAkDuom8UO9+ygK4Bw/56ABsdgB/A3e5ztd+5NgQ2+Vi
	hXqn9xLEgbHvCyIjnQXB7QCsoMxiaXRbTXzU+N9sMH4SsGvRsA2Y+3HUzYyaqEN6EdoFtQOuEv3
	E1dWu3VDnwIif3qJwt6Z7RvZaSNqOnvKBG3nzfs8uk6uE8mx6PU+A7YkpDJ1hFNyTs3OcE/4jrv
	Rxd5202DOeejnSfXX5nUV2eiwc+kiZywmJvYiNpJQI+kfsRJdpXTgbf+v7wCTk+lvlzfsWngo4e
	B1LnWgi+QYwo9bPwmvcPFUiWx2cTfuxq9oVC0QqeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8jHUU+
	U0ACZwI9kptcg/qt9udY/o6Xy7G+xSOsa1VAtQhBw8xh6uN+8nqg/VrSZEiM=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(586003)(105606002)(229853001)(8676002)(8936002)(36756003)(81166006)(81156014)(230783001)(106466001)(5003940100001)(9786002)(48376002)(85426001)(50226002)(118296001)(47776003)(11100500001)(50466002)(305945005)(5001770100001)(71366001)(64026002)(76176999)(86362001)(77096005)(33646002)(2906002)(7846002)(5003600100003)(356003)(2950100001)(189998001)(87936001)(50986999)(92566002)(19580405001)(7696003)(19580395003)(4326007)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT190; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT054;
	1:F+0w/F6YIPWWP5pQQmB7KvNVbJ+EfYycJEsGzUYOtcHNlpCB6QGStIw7dxAl2isbIB6UUXZaY20tyqBw/VMC8cWsBaTM+Yg3To+I6jcXej0ZNJ4KzLH7NZGhWmKi5kScfaiLnqLfOGXbJ4ttvZaM1eyoC9MLqb7BQoBqe0XeoSlNDpLgelxSl8rK1s2pnV3u8OMgzEDqtPClDm4lt9ubO85ZD/8aPsEI/YlcYU6KjBk4rilE1GSV0jX67Slyp81CTeg0YyLmgUg96Vyy85iDXLfwdRW9QyDh24TEFpPxKWadzSjAubA+ROWdAYxM8fXQtMq2Ek9bcd3ai8LlhOISuqBu23MjXU+9nC4kY3ZdLPyR9D1bBI4QeFAv/GQcHvQO37j8Nx2C+RG6xy23crsZjblTv+V8pj2TvJTC2J1MGXXe6mh8yVbx0XveL1Qfb5NV/Q4MZKSRoMJyHf6wngtKcje1uuhiQ1u8ACJm//BYZbS0CH1ScBkN2c0DYlHFBcjbrvbCqCmzd+er4HZa08DAxRpxRYbTLZnZKS+I1dRD1lya3i1oKTM9ZmPJM5H8ZwzziX2uFE23jWms7/fdN3xHENdkbddAii/CqtHPg6NHMyI=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5878aa6f-a685-4694-103a-08d3b4e99f05
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT190;
	2:OZHQZEIPeoBO+RYdu097Tybv+YlniPaRoO4K+wma7nxM810CntNxzf/ilwd8PZvI7+HcVRNMVv4l7vcjmLp5pldcvINW/DMKolH9mLmGkim41Gu/UbSRi4V92kNr6SYtBhbuVfh6NNFVeWncGYCb2WHpne7dAXfEIXvQTD2PwHHJDyZid7nX2NgYtv+ALVl3;
	3:JC6DxTM39SlSY60aSi9FZVnlFPHRl1nJ5OB5Sli4NcXhPYK2Ui61/RffNl52apGp2l174P3AwghkN2M4BkfwnWAEXhCvDVOFDZtueu84gRvuOJOYprtyAdQpkoUnZ6R3FU1FdOmelQyc+CHZGruShmiq0aV7imZS8eHhGHZRZkM+6AsGaqGQxQ4ngMilFsPbGtTLt+LeIowug3rVh4RjsAuWAn7bR2vazjgOolBRU4I=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT190;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT190;
	25:83CaZz8ou0QVCrEbSvvGsNO/xEA7iceo09tC9kMG/V38FSRlMQHeluo8q0++L58+ab8mFZmjtYXTJJOwTOUddjafNW63O3H1tQ/ae8Oto4gAHIpbDnGlbI0r55q3OvkF+hsf9eYYY1ff7fO0ECDB/jswHAlL1ZSRjh9u7hfrm1n9QKinCe0VnKJ0ugZ7ZZhKKXnpCUl938brSdJkYg+wRq57mpMXg4psmJFgYTikaxxNF15vPM9EAvOB50B3AXbr8qDEqUZpiful8UBwxsmmq0C/deM7PemH0zytTZZf48xgSybB5u0VL2DnRdE1WoWiOl/nS/lr3E4kRf1fop9dYzDOrbs+LZBgmI+ON2iro6FklcfuFd4OLcU3Pfz5uchnpGDLy+oJy6P8mAt39boPMaSAIeqW5JNS+f5S6LKKh8dKYU0rwboqSlfwiyCDLc7wIQ9GpspxpHUqxRPDjV93y8dQzfJt6cuwveMkH2iEO+NpOuEecrCXtvV1GJXE0CcJEUwrhKH3VQH1jWd8gwEAIa3BBA99YLoy2FtZjXC9JI7Rofl9t88kvvF4xpqGoXDpw9Uy9chTBStIZIG5m1WxX5XFJlnGU2ST7ZG5Dxh5nQ4L6y0uha13ZQLZOREcnbZiP6xq40VhHuE57mTCVJ9roYenK5IW4BZNWtroWlLKBj1uvOkW4H3zi4RIaEdl7wcybWWoSlrOAdAIwspeSZNgSTB6z+95R2vnaMb+mTub0tke8+Z63yzmDK7At1HRXrVE4TbgRhFn8iRjsLgeZ8SZBQ==
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT190;
	31:VsykJgIP11bVQ8hCB5UmH9E/e4n9111m3SK11kyjj5JYX0fCsvrxC7JQ0mt54akt1glqogmnYfjOQHr38Vv2VBjeKGF1+Y5rDHSf/V/QO7/RgWIRnsWiDaqss0V9l9kAI6FzNtml/0Ezh/EBmM6YKG1FyA26CiQDrcuAmiwuODk105pCbRclGEICpegnBOg3l77AK+MMrN/B5qZ466cAXg==;
	20:OfkMaQo0Se5tvJuUhH0ymZDtrhAKQEJd9XKR4GYEcHNObciBUl2ELHbREIWQaUISmy9MdygQNFrJniKZu1+mHD5CGhbtmYdf98/9gcgKLgbyJ5Cfdn+ZUOFkRNBm4TXoUaszcLLFBM1Gt6456Trpmrk/JIfLp9jlig5Akmd+cISO5d8DABqYq39OjITSTCQeSmS8kZKPwyQbL3W+dca0jAgKNgpzHie0MHY14rq6B3An+6S+eBPqCeHK+mm67MGoK90rynjBptirhu4iOmnT0fVPebV9APko/chsTmpCwTgLGwOfQ9550I4CW/cCYLf/IglSCVYBMhKL0oISKyf/JtVsRcjEBY7WsVJ8D9h17X6gWk/9JA1vAW0rClH+jV+gJNOj0NAunsnjzsEYH7y8lSSGjIbE/KVetCm/0EoymRH7ceJZ69tJwXYlBf9naprXEaSEXeZdTUBrEAArS/ZFqYPxIoPLtEnV7+DJNe6OH1/Wz4rHxOi5MPf3KlMHXaRn
X-Microsoft-Antispam-PRVS: <707de10cb1d04d07b73e531d57ca4af1@CY1NAM02HT190.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13017025)(5005006)(13015025)(13024025)(13023025)(8121501046)(13018025)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT190; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT190; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT190;
	4:2lVdiYWxxu9hUTbZKOmXVn8T43IcGXZzLS/1P8wxhEQpJxBD4+R3eKpoQ+1pSugtYcj0irTrV9O2Tlr3j8OcF9Ywad1utIVozdcdvlC4i558Grx9olPW4NZicyc+sA7zFzgNC6tYU4Kxr+6zqAPWlvEKW2+MtabtNRMZi9qCjuDNsAZmpF2vQglwejjgqkzH7S7MnqkwzDIBMs2UnLwR4veL5+Wv0zDyM3ko1aP6FjqgRQ75EGMvMMFAmfjJ2Qt+VKx+13myk9hKROOdi8owre7yCDzWJy3ELLwhyC3TmRIikxHhbl+SJg6sC9TKQQBn74nncIOlETZA+Fdd6udg3734KfXfNUPRVrVuYQj/AIZbX3vQkdTC6Kt6/Rw9eRb/NNxwY1WeEgMEklW5AFpSgq9qtWaW+y/yN0W+Ev8Sl895QPG8H7AZkrLk9Gwqn0l9vX31StvEFOcG/LkJCBYjRcP6urZUZT0ILipZgt73PxOWQti1rlQMXw7jT2vLnbOL0I1Tf9gQVQlwsV/YKMXkBMBoIZYYR/1et84b8higif4=
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT190;
	23:zf0/76YrwXgKn5GHbYH0dqgJ0sLrdN8qf1lsDNGad?=
	=?us-ascii?Q?EyL+iAhiaVXG6VZcO6oHspMwCu2UXiAeYMApVgVWP9wE03ICXbbduniQErpm?=
	=?us-ascii?Q?sdPouiEJys9z1rrnZU1Ju7Bi+0+jGUOS5fEUqM9O+h91sNtTRK2cY1G3DHKJ?=
	=?us-ascii?Q?ohy33/Y0jte1oNuxOZq9VprZetWpvAmHbcv1IoLMh7SbjwgOLJ2rdN6QMweS?=
	=?us-ascii?Q?u/q/CQyzL85EQCWOxGCTxgKrlhjvL0USkWxt8Q3W7ccxj+7HwBdtJZp0XyKa?=
	=?us-ascii?Q?XpYSUSjtMaeXRDcGHEi2ZObnbzBtDlBIanrYsplbc/366yDtMnnT88ewKer9?=
	=?us-ascii?Q?SmHzrYV0EFbrpm/K6me+ax95XhFOK5YUW7Qk7Ni+ngsTOBFNUPArhj9jvs8Z?=
	=?us-ascii?Q?lLLE4hxl2loNpukxD+QENF5gb1/oC4a//i8azAo6ppUq6h3sXnkzuw5f7/Og?=
	=?us-ascii?Q?iWwBamk0L/XGogIdGI0MIq8al8uBi//orPTJ6oAztcKJOu/XXUyJ+NSk7sQs?=
	=?us-ascii?Q?sH5Gpcggz7F26glypJiDSGrXwdcKy0P2wuqp9ObJjS6PKwozxc6lECwObhle?=
	=?us-ascii?Q?3206HeaZEWoI5uhHcQiD7bXvBk0Q1MHQextWL+j3a6W2hT4fNPGQyhan6jlk?=
	=?us-ascii?Q?5WB3zN+vm+QVZHEbzFEQ1XPTQwGudLrV8AnjDxgGYq/zFXjsbq1fz2+HFqKn?=
	=?us-ascii?Q?BcE+yZCtXZe4DyXpFTu0XzgCWLXNpPDjVhinJRXwcAfIdqGaxyH08HJlhZAJ?=
	=?us-ascii?Q?vxCSJFP/deIG4BNzbP2zSoEESwmKgUPxwYNMJNjkWvxivDWNWgLJiIatc04x?=
	=?us-ascii?Q?/r/ubJubIUC+7Eue9gFD5Sao2RCNLr5aezAYEpdI+oXjuLPOsbsnrARVpxMh?=
	=?us-ascii?Q?XP4cGbpZzXqbJjM6lrjDTFcHzM+HEMb38Vmh3Gg4TE1HyNTLBJJAlEKE680r?=
	=?us-ascii?Q?7fB64zt3QyzP5zlxfnZNuRVAIC4znmQvIgDL3kG5CXsndJ7D1ogkxdO3mB69?=
	=?us-ascii?Q?FycB6KlfQhIsZdytVy46R9c8vQlDeiXLNBouZ5sfnHbP9s7GvDLpq8UrFk5Q?=
	=?us-ascii?Q?md/P7zt8eOYvu6+Y8TOo324e30C2oyla2Btmg0nP3ByAWMIrGV44YBBBLgxG?=
	=?us-ascii?Q?gZsShrq6tpDm7SxzHYeM8QQu4o7wcdiNJ9MlYj7XKH7+u0n7H6ilWsH8OTiv?=
	=?us-ascii?Q?Zq2iLGV4lTjnVHwcT5YUTiRxv/kgrY6YkIgTJ1vqNiMqebREDF87npqWw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT190;
	6:KP3trxtbG2t9A6BccZJUzVTCjEtycqu4FXA8xtGSAgWgC2Gj3wF1iTV+5vsC4d0WM370hxqEc1nD0FMsjsdmpFm6zU3MQl80Q5ZLwWBz7IVMxUMOPi4tNvPkOWNkp4fP8gpsx9AGjDcrXe1NEaQU/beQETySr0XEnDwSPW0P5/Jly29hQX4a+FV7srO59epTfrpQOa8LlMBV2omRkhT8zFNP/G6HqvHuicjpcBtDXSCgKdPbSnHZ5idsrg76A1vcYHRZ3hZtUKy+vl4lebE0KF74ctvqJmn6onKmi6hYU6ddm4CEf6vI5jWPL63Wr394jghjw1JmLoreW8fxAqeSlQ==;
	5:q5oE+VsUYOjJNQFmayGSiPXJI+bLy/GSVadX1KMrWJ5N4Igj+7uMnJRFGoamTIP8MxI9tQQMBo45ttkXGGznhYYRem8/nEereRrBiCA+6E+yX1G95kGYdsTMqTqFba1acMnfox8uHaZT4veJu/8tSA==;
	24:c0Qmih5MFUdrDLGfW/xvdfm82UMSpixjlBgEHAOXQODEqwJ2/Q1OgvdfyW2s41AGYLhAXlcYFk5m+xYK5FWy5v5ob0VLXsQo8en/k3b75rI=;
	7:38PLnTyQ6V4+sNeQx8X9s2Pszw3sqJr9L6VTsz4gEmuQCBufydT6pppgko82HBcOUEaGO3Fi+KuOtE/8hELgoKXz7L3ZRS9IdIftfKbv8cLmujemGzs4FIDuD/JbvuwyhZ5k/FWWuPsfWsciqLcUVfYAg6NDp99TUNJKqzxABHWtA4pYce4+6HRSC9F5VFwSPLokNcAAzDDQFWfmqxyJ0f2fZzW1lxzIE7PC0Ll1NADPfcaHxsw2KyLdpj0xq5FG
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 00:13:07.4066 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT190
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.44
Subject: [Qemu-devel] [PATCH v2 2/6] cadence_gem: Add the
 num-priority-queues property
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RX+CCpdfYICx

The Cadence GEM hardware supports N number priority queues, this patch is a
step towards that by adding the property to set the queues. At the moment
behaviour doesn't change as we only use queue 0.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V2:
 - Fixup commit message
 - Add the property in this patch
 - Increase vmstate version

 hw/net/cadence_gem.c         | 82 ++++++++++++++++++++++++--------------------
 include/hw/net/cadence_gem.h | 13 ++++---
 2 files changed, 53 insertions(+), 42 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7adc2a8..deae122 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -428,18 +428,18 @@ static int gem_can_receive(NetClientState *nc)
         return 0;
     }
 
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         if (s->can_rx_state != 2) {
             s->can_rx_state = 2;
             DB_PRINT("can't receive - busy buffer descriptor 0x%x\n",
-                     s->rx_desc_addr);
+                     s->rx_desc_addr[0]);
         }
         return 0;
     }
 
     if (s->can_rx_state != 0) {
         s->can_rx_state = 0;
-        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr);
+        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr[0]);
     }
     return 1;
 }
@@ -452,7 +452,7 @@ static void gem_update_int_status(CadenceGEMState *s)
 {
     if (s->regs[GEM_ISR]) {
         DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
-        qemu_set_irq(s->irq, 1);
+        qemu_set_irq(s->irq[0], 1);
     }
 }
 
@@ -603,15 +603,15 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
 
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr);
+    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
     /* read current descriptor */
-    cpu_physical_memory_read(s->rx_desc_addr,
-                             (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+    cpu_physical_memory_read(s->rx_desc_addr[0],
+                             (uint8_t *)s->rx_desc[0], sizeof(s->rx_desc[0]));
 
     /* Descriptor owned by software ? */
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr);
+                 (unsigned)s->rx_desc_addr[0]);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -718,54 +718,56 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc));
+                rx_desc_get_buffer(s->rx_desc[0]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc) + rxbuf_offset,
+        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[0]) +
+                                                                 rxbuf_offset,
                                   rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
         /* Update the descriptor.  */
         if (first_desc) {
-            rx_desc_set_sof(s->rx_desc);
+            rx_desc_set_sof(s->rx_desc[0]);
             first_desc = false;
         }
         if (bytes_to_copy == 0) {
-            rx_desc_set_eof(s->rx_desc);
-            rx_desc_set_length(s->rx_desc, size);
+            rx_desc_set_eof(s->rx_desc[0]);
+            rx_desc_set_length(s->rx_desc[0], size);
         }
-        rx_desc_set_ownership(s->rx_desc);
+        rx_desc_set_ownership(s->rx_desc[0]);
 
         switch (maf) {
         case GEM_RX_PROMISCUOUS_ACCEPT:
             break;
         case GEM_RX_BROADCAST_ACCEPT:
-            rx_desc_set_broadcast(s->rx_desc);
+            rx_desc_set_broadcast(s->rx_desc[0]);
             break;
         case GEM_RX_UNICAST_HASH_ACCEPT:
-            rx_desc_set_unicast_hash(s->rx_desc);
+            rx_desc_set_unicast_hash(s->rx_desc[0]);
             break;
         case GEM_RX_MULTICAST_HASH_ACCEPT:
-            rx_desc_set_multicast_hash(s->rx_desc);
+            rx_desc_set_multicast_hash(s->rx_desc[0]);
             break;
         case GEM_RX_REJECT:
             abort();
         default: /* SAR */
-            rx_desc_set_sar(s->rx_desc, maf);
+            rx_desc_set_sar(s->rx_desc[0], maf);
         }
 
         /* Descriptor write-back.  */
-        cpu_physical_memory_write(s->rx_desc_addr,
-                                  (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+        cpu_physical_memory_write(s->rx_desc_addr[0],
+                                  (uint8_t *)s->rx_desc[0],
+                                  sizeof(s->rx_desc[0]));
 
         /* Next descriptor */
-        if (rx_desc_get_wrap(s->rx_desc)) {
+        if (rx_desc_get_wrap(s->rx_desc[0])) {
             DB_PRINT("wrapping RX descriptor list\n");
-            s->rx_desc_addr = s->regs[GEM_RXQBASE];
+            s->rx_desc_addr[0] = s->regs[GEM_RXQBASE];
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
-            s->rx_desc_addr += 8;
+            s->rx_desc_addr[0] += 8;
         }
         gem_get_rx_desc(s);
     }
@@ -855,7 +857,7 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr;
+    packet_desc_addr = s->tx_desc_addr[0];
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
@@ -902,18 +904,18 @@ static void gem_transmit(CadenceGEMState *s)
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_read(s->tx_desc_addr[0], (uint8_t *)desc_first,
                                      sizeof(desc_first));
             tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_write(s->tx_desc_addr[0], (uint8_t *)desc_first,
                                       sizeof(desc_first));
             /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
             } else {
-                s->tx_desc_addr = packet_desc_addr + 8;
+                s->tx_desc_addr[0] = packet_desc_addr + 8;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr);
+            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[0]);
 
             s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
             s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
@@ -1076,7 +1078,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     switch (offset) {
     case GEM_ISR:
         DB_PRINT("lowering irq on ISR read\n");
-        qemu_set_irq(s->irq, 0);
+        qemu_set_irq(s->irq[0], 0);
         break;
     case GEM_PHYMNTNC:
         if (retval & GEM_PHYMNTNC_OP_R) {
@@ -1139,7 +1141,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         }
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
-            s->tx_desc_addr = s->regs[GEM_TXQBASE];
+            s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
             qemu_flush_queued_packets(qemu_get_queue(s->nic));
@@ -1150,10 +1152,10 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         gem_update_int_status(s);
         break;
     case GEM_RXQBASE:
-        s->rx_desc_addr = val;
+        s->rx_desc_addr[0] = val;
         break;
     case GEM_TXQBASE:
-        s->tx_desc_addr = val;
+        s->tx_desc_addr[0] = val;
         break;
     case GEM_RXSTATUS:
         gem_update_int_status(s);
@@ -1218,7 +1220,7 @@ static void gem_realize(DeviceState *dev, Error **errp)
 {
     CadenceGEMState *s = CADENCE_GEM(dev);
 
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
@@ -1243,13 +1245,15 @@ static void gem_init(Object *obj)
 static const VMStateDescription vmstate_cadence_gem = {
     .name = "cadence_gem",
     .version_id = 2,
-    .minimum_version_id = 2,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
         VMSTATE_UINT8(phy_loop, CadenceGEMState),
-        VMSTATE_UINT32(rx_desc_addr, CadenceGEMState),
-        VMSTATE_UINT32(tx_desc_addr, CadenceGEMState),
+        VMSTATE_UINT32_ARRAY(rx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
+        VMSTATE_UINT32_ARRAY(tx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
         VMSTATE_BOOL_ARRAY(sar_active, CadenceGEMState, 4),
         VMSTATE_END_OF_LIST(),
     }
@@ -1257,6 +1261,8 @@ static const VMStateDescription vmstate_cadence_gem = {
 
 static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
+    DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
+                      num_priority_queues, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index f2e08e3..77e0582 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -32,6 +32,8 @@
 
 #define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
 
+#define MAX_PRIORITY_QUEUES             8
+
 typedef struct CadenceGEMState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -40,7 +42,10 @@ typedef struct CadenceGEMState {
     MemoryRegion iomem;
     NICState *nic;
     NICConf conf;
-    qemu_irq irq;
+    qemu_irq irq[MAX_PRIORITY_QUEUES];
+
+    /* Static properties */
+    uint8_t num_priority_queues;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
@@ -59,12 +64,12 @@ typedef struct CadenceGEMState {
     uint8_t phy_loop; /* Are we in phy loopback? */
 
     /* The current DMA descriptor pointers */
-    uint32_t rx_desc_addr;
-    uint32_t tx_desc_addr;
+    uint32_t rx_desc_addr[MAX_PRIORITY_QUEUES];
+    uint32_t tx_desc_addr[MAX_PRIORITY_QUEUES];
 
     uint8_t can_rx_state; /* Debug only */
 
-    unsigned rx_desc[2];
+    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.7.4

