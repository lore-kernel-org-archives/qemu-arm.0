Received: by 10.25.21.156 with SMTP id 28csp957818lfv;
        Thu, 28 Jul 2016 12:01:13 -0700 (PDT)
X-Received: by 10.200.37.60 with SMTP id 57mr58668552qtm.82.1469732473325;
        Thu, 28 Jul 2016 12:01:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b34si8954756qtb.136.2016.07.28.12.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqYS-0002mG-P7
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:01:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYD-0002Ze-Qp
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqY8-0001qo-Sk
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:00:56 -0400
Received: from mail-sn1nam02on0081.outbound.protection.outlook.com
	([104.47.36.81]:49856
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY8-0001qa-KO; Thu, 28 Jul 2016 15:00:52 -0400
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
	(10.152.74.60) by CY1NAM02HT138.eop-nam02.prod.protection.outlook.com
	(10.152.75.231) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:00:50 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:00:49 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46870
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY5-0008J1-FE; Thu, 28 Jul 2016 12:00:49 -0700
Received: from [127.0.0.1] (port=52157 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY5-0007nO-Bq; Thu, 28 Jul 2016 12:00:49 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIs3XN008124; Thu, 28 Jul 2016 11:54:03 -0700
Received: from [172.19.74.182] (port=55022 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY4-0007nL-MH; Thu, 28 Jul 2016 12:00:48 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:19 -0700
Message-ID: <cover.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
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
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(50986999)(5003940100001)(85426001)(92566002)(229853001)(586003)(4326007)(2906002)(47776003)(50226002)(8936002)(87936001)(189998001)(48376002)(77096005)(9786002)(50466002)(86362001)(36756003)(33646002)(11100500001)(105606002)(71366001)(7696003)(64026002)(81166006)(81156014)(106466001)(5001770100001)(8676002)(356003)(305945005)(7846002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT138; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT049;
	1:ozI33XfkPDwUMfBphZWusLrOGGL98R43Wmx1fLLCudEl9jgesKvwnSYZfyWvsCliMmKlsfmH52GjGkkfE9XUyWSbawX7Hptps3a843eyF9rU9RgHhmFKD8/36VcjAIJtD1PiJvVVmXOX0F+84mBMT9i3bTdrWjoMJqJiITeuhDgBPbVWXF6oQz9Mi6lJ54wuznvm+Qkmlf+8F1LjMZgnkuhyw+dbLsSlrHog7aEeoIfzmxROzuhVGm+gX0azXorbzBgFDgYr/7TlSzCqerZ5MB48LKT8ZoCrffF8SjWNaME1H0/rCweMxpqUmI8stB++5vQTS+m8sbAk/7dxLBVmysOJZt25mYslvTVveUe5aJMJIVTFo89bLfoKwhWdMmlV2bdO2tSx2wn3+zoqMRX/pZ2nwAD2OwS0vm6hDLJcSR4YBo/pN1XSxT8x4gvx/77pHmmvvOQwLRfIXTaM/RGcmiC63Ip/bwe9Lj/89YqooRAPzdIlXLM4mjWwHISHh+s9m50LnQpyhfpgTh7Z+JNOJIYiPUcYO00o75iUIRhvPgR1NBpTj+HJ5QfjaMh/63lRwAhMiOv/arbf0ZuDTbvn91xN2jU1tgtfw0fUqG/fnnU=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8788624d-4bfa-4c4b-ab6e-08d3b7197dc2
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT138;
	2:a21CYy3haDxdR71zQGRECi6f/Mot25w0WZIjTncQkCN/0lEDWNFaysFV9yI/LV2j7Pd2CeHN3hJx1+owTZ9VKPzXuXFOWrwCYrpi13rChi4nf9XL2K3PMerl8nmWl3TsL5qA4JfEJpqBE6+u6vnz0yrsuSOXZ2jcPS/xCVfSJ2VvgobZSvvzPoDKR14JHzCH;
	3:RCFLB0NQOcraNbSjST9lpm6n32TixGbZ2r4YlfF1eZhsqEpBLVj2nxADaHofApyXeUGHx8hZAefHCt6rVinb40eYovPEI6PyS9Fc2QXqtAXGVCkUbAUFdDtrzZjp1afMd+nThf+9Kj0lLH9ORAH5znqvoZShJApAWkYEhN14AvI7qZOLr53yirZFmQ3uvuPoe69NO+DWR2DXSvdRqzgVrG7N/T5/BA1EONq5EDwNOXU=;
	25:U6GPPqWJVL4C98FVuev4xZofMHx3IbS0h4zeFfLr2tvtTnFt4fHC6unv/nwBIEZXSnhZh7fkNzLOa9Hs+L664fzwKnVC/XrN36eT900aCRpFzPSwIMU1HwxRDpcj/et683qE9I2nI73BhNbKVYac8qDNB3UnUR9hXxykBHM+Y8wHHmGB1oKaKi/NRRq7yQag3uQwlxw2wTpwBuSwK+FuT0U0qagikq2D/FQX/MfcCGg51RhlUZ4zD7MGlqbOhcpVLGqg4MptN5VI3t2MPMI41F+oFf7pQZD0YfB+2LnMreB1NwxlvtjlJPCk22jksda3MpR5b9cU3YRbkzBSt7KnT4EZZGqxlW5leizKoTk2uDPc2kS9ciaM85n4UV3Nn8oBIxS+hUAOPnC00R8ShB+X8rNP9OKs/1djXp8uYreEM3w=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT138;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT138;
	31:quQVlgb4vqZuz3nn5cunCx4gXcFVCkv078Tmfj1qOsodavl/VPK2BeYQBtMKGIe46GWGGl/mnfKBm2TcfR3i5ujJIWEM4BsS3t4/2oOsbn2WKZGeDSJ5SsirtRRsrR5sk6ZewfW05Twk5vLnzwBD4dN/aBG36leSyiVv0qCyrf2iTEv8nDX2LYcZzl053dMeu2BHFBCcIlMeDEVmvvg+yRa1oR4JU6ymvL5X6QgePB0=;
	20:+cnYE/AMFoK4Vzk1Xsw1nH8D7bxA2troIAj6hE5DGfzi6vp8GX8EjtnhKna2nisZRK2oY5HlFJGuv7ccksRnx9lDR/bBJgoRRST5nMYmvav7w1EwgqpGQe2+Y2SMXNgzztpQRrVouJ+m3JkTqipYJqNqE/BzuLkRS2wh3tbnyXPBauv4O/ivz1qoggVqBLjC8rNC2OB7hmcppqOJN4hMFUsBxIsXYV+gX8lr6ozDZuw07ppnsWzmOsx8L+TKwh0oklcA6wZ2z/DZkorxMSGnSZocIIkeauIPQymstMsiRI9PnxXmIuOkgIcrfeNQVoiyhu8ylHXBmRCdSU+XD1xE8icHDcgdE7Z5trN39P5fM+I8EHnyyr4edwRUpQ0+LhHEF/5Rjc305e2AWSF1sIcxIjcjV8uCsw/XOp+rr2gD2/orx3qTAY+9S16+Y7uS7efEGTOoOnAuNH/P9RL7jW+QJP8BJFslSzIe8QHc6sBLC7A4U36S3eT0Qy8tRJbMNylE
X-Microsoft-Antispam-PRVS: <863c843e7390409ca44d1add754e9586@CY1NAM02HT138.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13018025)(13015025)(8121501046)(13017025)(13024025)(13023025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT138; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT138; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT138;
	4:Shq/ctjCcrAcLXY1KhVxovGLaazU9VU8HgrNu742wYi+vXDgMk2Ngs9X+Sgn8dsPTY6+SEPgCmkU5xtS5O3KbsvQ0BN0Ff8ZBwtlglufxWKD31s3aBRAdKYWGdC0epusEG30Di6vLoHxsjt0vMB+LSGo+mnoXF5IiuZMW5r+Bu2KKyetGFZuzc73oVKbG8Qw24iecYeV1NjCrSY57sd7x6XJ4aZkpeCujvDqb4Pni/8N4JSXYxgmgDSKznRexAqtX+0YCLiSmc5zWUrW4lHu1wuxH+PXE1J+Ba+/pVcq3vDxEYJyTwtJ8Ry2aN3kSGRqB7WTtk+oYtfr+h+UIIHaOpni+l9/ejyi25lRxNW9PimMgcNwHvC2q1pZEGu970lZJyb/zfOOkcIFVrDa7toKlPgtPNwGoNxLKO9xIG+j3fZenDRqx8CzCws9VIZSbTLN/REodAPby5cof6izYHGxVm3ESBUXq9wIG8eejoTiurlyCcuZbOlamYzEo7nbyJfE3bybXItwFhaaPzOKxkKmVUEcxgy/z83+YKe8pZ7CDAU=
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT138;
	23:NxaSVPK+yW/KO9hdKn4v4/kY1TyNFj4q86F9PIV4b?=
	=?us-ascii?Q?agqzDmA/3UybKqyq2blH2DExYDOxNpiFJxXdDwrJXDlqH9bLrmkVDKpPna40?=
	=?us-ascii?Q?SMH4AIqtJdViYZ51mwckXvy71LMSaxz5ZtXPSKoQgAN3YleIbIa2z3OZSf/D?=
	=?us-ascii?Q?YpEv2VXuQoSN5ERtSjWb02l8wNLWSOAReV6sxqh3VX73AAE2Z931FcUv5U9S?=
	=?us-ascii?Q?nVKs3IsYtno2lACoCe1fg2IrMmBJksXCa9JEZL0G/Bddot6DCe3pz33INRyB?=
	=?us-ascii?Q?jE3OpJJjQlLLLadktPrXjh7EWG6p/rlqMVlz5PlN8vc08bvDFoustqECqiOJ?=
	=?us-ascii?Q?bAEw0WqtNSC9eDqR5s17tVRgpVUstFWKJcWcM1bkcUpWpe+OMmkytOiIqYzp?=
	=?us-ascii?Q?3r+L1qktKJmWHsmev1A7yG21htulJGEaidU/2xvqOuV+0EaFWY/3Juswx7TW?=
	=?us-ascii?Q?Y/Tg7E3C4NbiTk046c1NiZwB1PwSE5NrjnP6qA+qkzgnlNXnp/xTyNqP82Tp?=
	=?us-ascii?Q?7pBxJAto2J5+8lWg8eRc2FfTI40axul1btfS8FYm5hGA5Tvqf8WBkYjLRpn+?=
	=?us-ascii?Q?jWCxdbE4y7/0h2GAGiwnq/bzXpALGLa90QWJG+WZEsve5ymEaxclxC2YfeFl?=
	=?us-ascii?Q?rAXG2WwRulHF57GYx2XGAHsStDYT4kBD98j/N3yF5GYztrLopNTfKDdIKcgy?=
	=?us-ascii?Q?0oIu+b/yicsahFuz5jtPvHsvk3Gpcd0IWmGT/DQg/NVjUis88KPwCS6TuhtL?=
	=?us-ascii?Q?aKRg7cTz/Tk9VZuHdMi68ajYZI+haFb0U+51MQ7/LZ37mmIbVtXPfsWo38me?=
	=?us-ascii?Q?Kq+FsCQlaApScrvDLJMEazsxFzH9Zm/7e1owRZng/Y/9t4rfKVsJl+BO8AXP?=
	=?us-ascii?Q?fOL8uq+Ohvy7yz+8r0ibN5Y7xdmtq9e/xEhoIzAezfUiJpIFWDKIFdO7LzqG?=
	=?us-ascii?Q?j7rVPIroPf1LLf60DBUFEML1fORESrRWRYAf0PkViXwwtnum9J5nFLuKjsgj?=
	=?us-ascii?Q?WL6TX+js+MGjB7U5vcZ+HmABExYwvi/jaUJiuBEiWETmffWLkBO/1WpGF66h?=
	=?us-ascii?Q?5Cqo4Y=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT138;
	6:h9VbqpXzndBTXvnWEFa6ocq5nmM5DN3SHaJpx1smZJf1/r1hpPLVQTt7lDp/xyJfvmjNAVvG+iNr/SeJTlRyIxrkFscKmIzj6LxcLmMdp0XnzYyJkB3Gled6ieoiwMpowyaLFCINJFJWD76M2L4BmG4zJS4KlWkLvNoaf7NXtEuZ/JUyASGiPw7Lb3fRINUx8uGh6QQ5J41hZgcHKI3kfs7kY5x46CMhwTwisrP7gLxnlXYoM9i9awLVGGQys3UGyQA4c6lr0/Zw5LQs0PF0/MxoYA8Y8pEOJ3Hy4j1+D5O22UT054JIAPj1OmCHfESSaD6yC/J9QuvGtGx1rD7v7g==;
	5:Jux+EnTq7VB+pH0GxQD2+IaaFCETudRFLDgMn9jqNawD3L+0vinloHHpxjr2B77zO9UuUYCEvtL9rFovp2PV3fw7Y8+OFps5nUZQ6DeUx2qJZYscw3nRMWGiUok/Phph5v3OuBioxZBkNYEzrTUHtw==;
	24:hABsl640nM+6GGncln/bWTZgNiVjYOUSW/ox06807DLVTOvZ3flRlyDK+XOwYc9CqAtFGCp+LLuYhFRICOROf5bToI2PFsY39Zt51ikZZ6c=;
	7:VwPFI+caWDdRP42w/bN0uvM3omDbWrGhUsCKnji+DeAcTujLWEQS4sDUWEIhR3Cmggz9Ys2Eq6ySQkP0bnShDbXB9I6zbkgLNBL8uCApLUR60YlwjEEHgmHVvmFtPdpyMGEOhv5h7JaT5IRHPDhZKpoq1QUSP5RVr/Z+maHPMt/QItVIuVp3Br1ttfKWepwsMU+pAeOkNfIVLhW0tkEB7OVKi/KruAcQYAsQVFZiN0IGdBGy5neJBmTkSR/Zq9Cy
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:00:49.8222 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT138
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.81
Subject: [Qemu-arm] [PATCH for-2.8 v4 0/6] Add support for Cadence GEM
 priority queues
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
X-TUID: q1O2u5EzsGsn


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

