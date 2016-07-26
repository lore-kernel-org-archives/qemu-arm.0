Received: by 10.25.21.156 with SMTP id 28csp1861433lfv;
        Tue, 26 Jul 2016 11:26:34 -0700 (PDT)
X-Received: by 10.13.214.214 with SMTP id y205mr20799537ywd.209.1469557594788;
        Tue, 26 Jul 2016 11:26:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si1252069qkw.39.2016.07.26.11.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS73q-0001D1-3J
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:26:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73k-0001C6-1q
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73f-0006KJ-OG
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:27 -0400
Received: from mail-cys01nam02on0083.outbound.protection.outlook.com
	([104.47.37.83]:43264
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73f-0006K5-Dl; Tue, 26 Jul 2016 14:26:23 -0400
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(10.152.72.52) by SN1NAM02HT183.eop-nam02.prod.protection.outlook.com
	(10.152.73.90) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:18 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:18 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52051
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73Z-0003qf-Ik; Tue, 26 Jul 2016 11:26:17 -0700
Received: from [127.0.0.1] (port=57338 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73Z-0006NW-F8; Tue, 26 Jul 2016 11:26:17 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJWu6016344; Tue, 26 Jul 2016 11:19:32 -0700
Received: from [172.19.74.182] (port=41250 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73Y-0006NT-Ni; Tue, 26 Jul 2016 11:26:16 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:25:46 -0700
Message-ID: <cover.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--11.633-7.0-31-10
X-imss-scan-details: No--11.633-7.0-31-10
X-TMASE-MatchedRID: U6M5Ts+Bg1mXFGyE5q3nYBWCVBr+Ay98P5UPxV4E5mlYYjdv4zyROxEa
	gYlxo94PxBVPBDt9NWB8sUuIOYP8u//ekXjAat/IiBA/0bBQLmvomPrNi98UBGnf+v+Bv9Dldhe
	NPERaTAAefueWQFuoLnO4Ts+/z8j3OsXhsCoCbSZIcJTn2Hkqse4dka7CjortXCmcAC8DBrOijf
	UZJUXzF5l/6VOHogGh9Ti9+WcTAsqPs2LHyC7VZZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYklm9pkRCMOiplB8fy/AGgK14BACAujv4eaStxhxre+cR+3BndfXUhXQ==
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(50466002)(87936001)(47776003)(189998001)(50986999)(105606002)(7846002)(71366001)(2906002)(9786002)(356003)(7696003)(5003600100003)(106466001)(305945005)(8676002)(77096005)(81166006)(50226002)(33646002)(5001770100001)(11100500001)(229853001)(5003940100001)(92566002)(81156014)(4326007)(85426001)(586003)(48376002)(8936002)(36756003)(86362001)(64026002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT183; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT021;
	1:nq3QG7/ShsMkt0H9OTrviGJ9cNR+KjrK6g1QblM0bVvWDb+0oENr+Ac1iAI8qT3XOMdk50wIqAMEz4X24YiHKGEWlqDVuPZaaJ45lkYgF52khbZOWkggrphiTuHOPvPUvzMotF9JWczUVj9vvLCciIcpnjBR2dEI2nnIEmrNVxVIUKxVA6/fhiPrBf3np9wHHAvsOs3EJ8+DeaSMU+Kc01X9iPzN0nSuu1KF+cLj2D8igXbicfToaoHneb3fR5UJEu9X43d3lcpkfBvB8xY5s9cGtNKr3fbsmVRNzZYgGZr8nPD1gMNQKn/ZG521WYpajSnbLq62yHVnbDAS9o4gS9j0N7UgsmXRMYDxWXBkVUMgPmvmQtNLjfZ4UJo3sxxK9fSIoN+UiJBPiejt5BcVQmmm3/ldqHIvyiozFWiRtG1297X4+YfxdFDte6dw/RM/kagGetRBSEVqRuHBuNBbZdMnk6ZKAf7IQCPs+T/b1wYuVCuBVPoA3KYfRvvTyuJDR4LK3aehmjuu+AolTRKQ+lCRUuXjKtOyYfUkeFsiNbo5+DZ74pUMHFk17SbSTuziaENCKJVFmoTMz3TajbWJN3GCe1HR1FUz6r1fyr507Cc=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f4141f7-72a6-4a61-ad7a-08d3b582561a
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT183;
	2:Kbxmb8tBkx0zRbllZ3xP2sfq5E/mz4ZOEEUTN/lAisSpZTe4BFgaHA5U1TkcQ20T3bpBqJTkunv2t1VUFpnPJYsnAfg0FAdCgysHDToWdFP46ZZKeFiT5aN6w+9BrAHHLShLsIBAFUPZwEo5gg+FUjt8miyk52xfe52eOmIfG0++rFJsCEX8za1MJ8zClnfW;
	3:Z0jJiDpSZW8djZA1O+kkYqZ8Sj0nEIVP3pPKo5mLFL6f/QzADpxrDfssXEHSkMubVAti4psLCIiftaIZWW/8QM7zPT9LMDF+yqkiLnlzjaYVWRtZTeMgTYpdcmj2NS9zUNlxrCb34nXLRoGJoCIpPb7f9WSma8D/RbTjTqkVUVCSn38kzoN1V22wD48FUAycehKAlKpHyd+O2+8DERf3y+mZhn2SRbScioMd9VdPnAk=;
	25:khnCdjcDKzSJLXFqH36aaCKoCCx60CmlHkfv2bIs5IJf8aupRE4CSqAVc6KPr7EVPWQK4T/snmVkmP3Objl2rUuF+dIbNRdakIpD0JZaaUz0zuZlKxJxK/qPl29JuUa4DMSggxPcFahNhFRfYqnpNd7yJPMKiIQcYLskpfwIVwQ5+2qw5oHj3ZXTcYqJAGOMPK62JWjoO0ncXOA+OeofeLso83jSVIw2JrbUsEvv+QYuumUOGMgpNhqdWOcN9CJ9FDp4NdCIpFMz+6djuTg0sbawXLBMAeJuKX51qy2EdgfycH4oFmRBhxTMswiM8hGhmMm8mZgNxXEFOBB7UAVN4eqfUkzAMTjyX+yFsG3rU8YW7add8SYK/GDbWuXJsYeg7vQ1qBSZ/TXrE8uB9XBjxdVh7W9PonetorjUQiGPt78=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT183;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT183;
	31:XzAiqxjDd4cqMF7rU1/6HhHvfecObFGJfOQ7sFLaianINHMmOSmIXWlRwVreBBXto/yNDxgHJGUmrMU4PoLwF1PQfDAXK18bWFAIUf4D9ktyuXopKuSLhh2p/qmv/uNuIOYI+ZSoMb18wBRu/vbcigA2u9IJA0s03XDyBr1CI9VRjVTFgr8ZrBYUWN796zlb6zAcql/nCX5nqRSkP0FXqw==;
	20:1mTjLm0C/HIyaioMSWCnT+OXR+VuOalJ5L7jv8S9sfJJppIW6Xav3xq/mO585xqfWzJQnfaNYsFXOBbNUiENTQhRWaZfubwmuCPoAgio0vP83U3eFgyU60BvuQuM2hoZs93ReyQ/W33t9ht6MuNTApccZU16L4Xe2FzhLLvse5WERWTxVV9vRxnHq82iV7h9etqBPrn871GoyqX12Yp/PEIo9ZgXgKdL8dsP/p/NMArKjjQ8AXCIjxL2/oupXhq07fn4h4YgAQ7qjl7acnq9V7xoSsqeddQuESzZ4/bMVmMc3sf/wzLTEgskS6qvncdv61r9NyAd3ngitN6e2yhGZOgOb6XJXL3A9RL6rMYezxcXQjQnSZIjG2f8kqxJAvbB+W6v82/EWEpmYDmGteFqxJEyX+sOk6zqevbSsNzRFnJza/iu2DBfwC6EEKJURw1BM8399Wpxmrxho0QqjA6IC0eL3rK/vLUSj7NvEkE4F3SrIve8b6gPqA3gmlYcv14T
X-Microsoft-Antispam-PRVS: <be7e264108d84f8e8201c09cacfa3b18@SN1NAM02HT183.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13017025)(5005006)(13015025)(13024025)(13023025)(8121501046)(13018025)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT183; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT183; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT183;
	4:b1T82Xk2fpfcu/9ghJBbO1aqV+udPPwtnsplRwTkPuxmjxLbegePbMrkzF+SUuHsVq90D/NzLwIc/D5IFHLLjt/UJtlepFPaRmtj+0cx/prRe2GwcWiyslnsZd4oiFN/fy4DBRs7249+WtO6ndGqAgu/HrerLi4LOOhoaE5vhmeeksie8eo6FZ+Oo/XyUgGFVY6mTRUxQZvHfRulLUZfA5LErvAxWmoxt8aBUlp1+fxxEnBT7t0EKmIKyavG4pfRtaFHY/lsYw+He76fdCxFRqOGWGkUY646ASTA5c1rEZfE/pEsqf/oog9UEC3J96YKeHp31PF4Izbc4c9zgYnRuyu2ulu9DZN2fQbpuHgHJ6jtRFDDLD3X48pmbc8Tt7n4rKG0VYEfES3iD79V0nMd5bskkcE7IumRthfN1WGsYvs8Q7srcLd3QmsnEqRPCwK4iANh8U6ErA4BVGaRMtib5MYLXSceSX1iVEmMdeSUASD4AfyQ/t4iDM8KEt7oBn6JMoUxuyodbzWpOmeHio7mqwA3XTjgk0N2rXwg9ZzDuL8=
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT183;
	23:XUVSuR7muZTKfq4Su+5PVw/+E0Flv4F1G/eEn95+u?=
	=?us-ascii?Q?nE599zfup0duiX6WbcVEvniUVae11Sy5zcLtzxcMecB1hkRxOJaRUr9iwN0T?=
	=?us-ascii?Q?29LP5zaWEserAvue9XQmvnH3VMU/sSzlVWWnMqXvZnfHYKe+2Fc2lFlqKYHs?=
	=?us-ascii?Q?qPniXp3WJDCcSWq40CXYmXpMwCbW2OAmFv+w1M5iVE2vru95O5KtAn6I/RCM?=
	=?us-ascii?Q?cFDQJQitgBTHg0lvQv86ZnedIJq0QlvZpctHakGjKPlVJY1ZshF2QulIdXgb?=
	=?us-ascii?Q?g7NdG6ZmY0JlmUEk/an1wfJJiC4Vyk64N3BUXjqKrAj+sUCYfNDAqkrpSS/f?=
	=?us-ascii?Q?ABMuHdDG1TSuF8RrOwv4JptAN1t/h8j7M33hkMOcVG85PC2F+SiTvgcCn0CV?=
	=?us-ascii?Q?2wW36bSGsP7v3Ku+vrDcO+6CZbpXdJlvB2QP2YmZiY3cbY48cZXYR199U9xB?=
	=?us-ascii?Q?YUyK/uGcRaciZ+WKsD03/TTPYaKXhQtUWQMkPRee6nEvVWkt2vVowntadXaF?=
	=?us-ascii?Q?YXZnP3iLwjHufll1F51N9EppxC8zlcOLypl2P5WpImC+S2XlButm0ige2Rl+?=
	=?us-ascii?Q?I3PwMmfZ3Qfm+3gjp7S2BQGx3bH6xKmT5pjcQyNinDE6q4wLM3QF8TgrY31v?=
	=?us-ascii?Q?Gv8buXrjOja4U2V9jVh2z1wrHswR9iCHD7o3S6LbQyCFL8i4QFpdUmTBMWp/?=
	=?us-ascii?Q?YVLl7qJYoivme3xIF0E9AtWz3hi/SJspbN/ia/LlOjZHnFRLNSfBNLtkERpL?=
	=?us-ascii?Q?sHf3xxIMyMsTEH15vHfMC9KLhDJ6M8rryvIDboWxFu5ALlVnRdTZPwgUdZwR?=
	=?us-ascii?Q?XDgJDDMC8tuGXJzj2XPVCGZk9ReKXkxusCl//aT3ezX8PznMjbEbm0FRCL50?=
	=?us-ascii?Q?itiV3IPSKIb//WWTuYEpxgkTXL1fsiBT0iWLtMDgn70opkGPt0viBWmdjjFt?=
	=?us-ascii?Q?PATnwwcixxS2xePDoG8aPj02Aww6me+RLWgTiJ4NPnLqmZOjSU7xzybtUgtb?=
	=?us-ascii?Q?rKTXyIaeoDjNkJOTPhcaOw05DPYsN4eWHTemGsPI+rb4NgWEbbLtn4SdNeD9?=
	=?us-ascii?Q?csUhSOZNfmpy3ja5y228Un6HjgblUj+W768Dd0Cqoe/Nqr8WA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT183;
	6:XmWJWMtsGu8tBCn0dySIdQaSwUlcDv+u0bXOdlNKW8F/fLh8O3Aclj6SyNCaMBydRSnRT8q9WpR1RLcBMcdqN65e1jejZ5bmInT+oV8mLx9EzUto/eWn01WQeBf/+FGrF2QHD4Ih2A82KDyhbyaKhH9YVoAXck1YSSFDLz5bnyj/KgH15hVjZ1TWUMcvgloN2Wn99/rz1tDNXdkTaUPZU6l1JsPfeJrmhYFjLPOP81YWGAfv+bEfZj+89dTdWtArWdPeenpJBQGNrG2f3bfBsVnstq85cMJzmC3xL4Nenj1FdA+I9iW2QM5+TzLEZSCYWQkyAryG6wg5t7/Dl6pvCw==;
	5:9+yxJwCwhY+EEnrCCvcubjfWIRxVqF1X9iOiOYrKqoKqJlcz9aMdwZGTJPmBhaHMpBP0PzGgDugqXzkM92T3e+dbr6trOLiUhp3puPkZGKG9WMhb98C3X+LtGjXpHWsYsvr9lES6NPlrg8wyfu3dbg==;
	24:OWMcnIOGZ91TMTzWYfj8J9HsBZgn5FIMr1QTiUUJYu12tUpXwVHEw6so6PHBHv+89Zf7lg8nWSh9DfIzJbnOiK4aLzxdujwRViYMpdzsVmo=;
	7:iFCK5gTsHhKl/pHJylJIQendd6HoUlErptbFVSvJiAntZ1T57Gxvdti/rS9lgtWNM9YNNUzB1pFeJaI8YHJEbKz+Fi4YNBJ4ZsEUyLD2GU/wrN1WetJ4R78ymMeTnza+joy4ZBZrNbFSzGS33zvpZUDfcQam2XwwW0CNlxxaXMODMmFUq5t/NXc4tCbH8ZLVbFXHhyD3FKVDy5847bUwAYtaNbJas6jplUbzA1ftvJyNr/MCTIbALWXogb2e3KVk
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:18.2149 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT183
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.83
Subject: [Qemu-arm] [PATCH v3 0/6] Add support for Cadence GEM priority
 queues
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LW294H6Oegbf


This patch series adds initial priority queue support to the Cadence GEM
device. This is based on original work by Peter C, that has been ported
to the latest version of QEMU.

There is more GEM work that I'd like to upstream after this, but I
figured this a good place to start. I have done limited testing on the
Xilinx machine, including running some of our GEM regressions, although
they don't cover everything. I can't really think of too many other test
cases that I can run at the moment.

V3:
 - Fix warning inside patch series
 - Check for sane values of screens and queues
V2:
 - Add screening support
 - Fixup some broken logic
 - Expand the commit messages


Alistair Francis (6):
  cadence_gem: QOMify Cadence GEM
  cadence_gem: Add the num-priority-queues property
  cadence_gem: Add support for screening
  cadence_gem: Add queue support
  cadence_gem: Correct indentation
  xlnx-zynqmp: Set the number of priority queues

 hw/arm/xlnx-zynqmp.c         |   2 +
 hw/net/cadence_gem.c         | 571 ++++++++++++++++++++++++++++++++-----------
 include/hw/net/cadence_gem.h |  19 +-
 3 files changed, 440 insertions(+), 152 deletions(-)

-- 
2.7.4

