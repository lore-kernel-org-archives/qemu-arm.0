Received: by 10.25.21.156 with SMTP id 28csp1429674lfv;
        Mon, 25 Jul 2016 17:13:22 -0700 (PDT)
X-Received: by 10.200.37.252 with SMTP id f57mr34758614qtf.68.1469492002263;
        Mon, 25 Jul 2016 17:13:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d12si19427321qkg.156.2016.07.25.17.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 17:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRpzn-0005UE-Rp
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 20:13:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzk-0005U9-4j
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzf-0005iB-4L
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:11 -0400
Received: from mail-sn1nam02on0058.outbound.protection.outlook.com
	([104.47.36.58]:64843
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpze-0005hu-Iq; Mon, 25 Jul 2016 20:13:07 -0400
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(10.152.74.55) by CY1NAM02HT025.eop-nam02.prod.protection.outlook.com
	(10.152.75.99) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 00:13:03 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 00:13:02 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:32935
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpza-0002Ck-6E; Mon, 25 Jul 2016 17:13:02 -0700
Received: from [127.0.0.1] (port=38222 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpza-0000mx-2q; Mon, 25 Jul 2016 17:13:02 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6Q06H8Y028674; Mon, 25 Jul 2016 17:06:17 -0700
Received: from [172.19.74.182] (port=59990 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzZ-0000mu-Bo; Mon, 25 Jul 2016 17:13:01 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 25 Jul 2016 17:12:32 -0700
Message-ID: <cover.1469491920.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22472.005
X-TM-AS-Result: No--10.610-7.0-31-10
X-imss-scan-details: No--10.610-7.0-31-10
X-TMASE-MatchedRID: 1EkN8wfBE2mXFGyE5q3nYBWCVBr+Ay98P5UPxV4E5mlYYjdv4zyROxEa
	gYlxo94PxBVPBDt9NWB8sUuIOYP8u//ekXjAat/IiBA/0bBQLmvomPrNi98UBGnf+v+Bv9Dldhe
	NPERaTAAefueWQFuoLkllAccZWZVHBfDcY52tqsKQOktEo73GFKX1XMd/SqvuaOFghr5WzNpenZ
	nPYZE7R+LzNWBegCW2wgn7iDBesS0gBwKKRHe+r1m+6WbyNrQDDCls00vW7ZiLqVbNjriJljvPH
	L4gefmH5yfcxT1r674=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(106466001)(305945005)(356003)(2906002)(87936001)(71366001)(9786002)(50466002)(5001770100001)(229853001)(64026002)(11100500001)(48376002)(50986999)(5003600100003)(7696003)(7846002)(81166006)(92566002)(8936002)(81156014)(33646002)(8676002)(47776003)(77096005)(4326007)(5003940100001)(85426001)(50226002)(36756003)(105606002)(586003)(86362001)(189998001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT025; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT035;
	1:791SHKaR8Me2yNUI1NOwtZY+/c10gjfkQUTcFSeVFoKXK7pC1GgEyCakLmPVkV9e+EAu2oPHA3351aBdr8WojsmQ027w/kHOdPPkNVHPgxSH+mwfkFBmA8z/4VmA8oC2jIEVb5dkk2iuzwkZawYs3seSFeWZYgbL5JsbEDH2v8TX+5QhCVF7ikKIybaXSSt1OibHxo30zqdLOrWMJS1g4S/rkNyIkfdmqPXziYWoyW7eOToHAEDtISHthrZsTHGwEPxrEnXHNx79Iwwn2bAqWLY5hkwxHgH91S1/7gzTKWnBqM4KNXYjCTTgbtkzf3zdj2CG/d87lz91Gjyf2yhnHzyPdkODbw90RH7N+amDb7MAXqUncPlsS+ZUGKSIeM+8d8zNticGrzTqWMZyZBZnbU1JzW8CGhZM1m5MNKkUpUIK0gVqeGaiMw9hL9Wce/Mjz/IxxkjQSEEYfdSYhN8u+tq0g1OZ72YVxOdw533GHF5EXFSn4atOZB8ARH/Bqx4ymz+cmh6esJH42+BjLgip13EoniY985u3u3e2o8sthNoFeVcFLxhdmORamJitNiUBAHdHtXAdKrDUalsDX/AqFgobsUG0E/p5CCBvCBTsPe0=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bbf71eea-0242-4c76-5e90-08d3b4e99c48
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT025;
	2:eEATOaGCR6L3858+RcxMqgslG2ZUyfdnvdoetSosmOJJgGx/YH+4fSahnUE9qW3sohfVPRv8tj0+e11Ifc9GwSC9g2v7FA9WB2hpNXBucYswW5DWY+Wg6Kmf+5JcOeLKRF6THY4Z087dh5hm/X7gZBZIUosIGlDk0RcASIN50qqh10qY/PRHA1iMTWkHmnCw;
	3:tjmnGfu2ab1JUo7G2u/WkJClu0+F29qSY62pSIKzWgK2jv+wUehSopHDdh8ZXmLxAjpB28RUycrLivRExcZT448F8MhniOiWB02647YXy8tAwwjnCtCz0trJ5XF/rJfyovHFCnerRD7NCYJ3No6JhK2JGjy58YuH47cgIGHA3ON9bU2eC9FmfVXlYBygzj378kxpKRxcetdufquYblOaYYl5BI/1dZbkBOPFRoQotu8=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT025;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT025;
	25:a/UxNa5AfZg7m3oqbFpNE5glC43kaOSFku4NXd8ApvMszX58A9ir+879UcoYR/vUX+LOpA4g/1iqSQ4kQpMeRce0ZJ6HNkvt24+hZgGL8qSlNdyvgon+Xa9ZAhRmXMTjpa2oRJwM9c4KKHLmbfZ7m8Ne2h0G3N4hEy7m7DdA8TYCs3MQa3VVSiCTX6siWtsWuXCUyGmv5OU87P4NdwpRy8kq+/2yHiYMP1nZHfg/igQPLyWG/cxiXrNFCSRQNEFEPTnOE8ZCLYm4WoFqbwharnubMyhGKkOYKbn52lWd6Yr58zfDkVjSMxHE0AfohldOKwaikRDvvnmmdcE1/3JIN4a5fQt3vaCBqF+Wpzj8408M3XZ8H7Wu+4Fn/jDoiXdaqfaZ5QU8a+Ngc8hJax+GbLRQjFIJARRhc694XZQLyB8ih82cGhCxjmVpizYRlkCKzfoQltAvGnSka7JtRJ5Ry8PfomDwz3bdxnG3MkheJ9mh5nxdmr9bT28J7+Qu3xmNNJ1VSKN03BsTOm/70ow+BrvxquiVrja5vJ25VuaagrP/KKi5DNp6PxZGEOKzwXx20NSaiNN7ZJ3YIGTLYbG04EyMd87OCfneLVZmzAMSiNeA9pVfj7oFVFKs+aBM+VVEgWRbMDdKz3bs35xh+PYtZmsJ5MWkogS7Jz+RuiZghwube/ziAkejGEkREuvaF99cbC4RAwNOi9PjbPn/2e4YEjPXnSMoM3dtOeW1OAIf+cIHcKgtcaelm/1Sg9twiCUvVV2Lpvxmn1XRX+0TiiPKHibnhP/0+IGetmyIMX85P7Q=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT025;
	31:MjKN3asRtA+wrDRi2O1OtDFx3kaGZAupSdOyTsktdmzCqsZfRJsFp2z1azyJu+pP9VsexutiKacBaaOVy1H2WjlNBOgClJSZDovklAZ+K/vFzSu3NAnkftCyakU4IUZ+nSrLUJqammlQu5NSLcW1OAEOqo/Z9N8hNMgcWl8wKKhAsylZspNyCWa89IVE76hDsM6zzJlhmDOFUgG+N3LyYw==;
	20:HokJitYNUFe7ER/rf2PSpef4vWsfeNfkW4oa0Bg2iqN86lXncImSj1b1H0yUwO3mhlOMC+uzm8Jo89IW5lmfiPI5X1nDToFpz16ri2/PYUjqla9n/vm018WGLas0SPuNazOzLBem5CMkLwtvNYsZUG22tFiDHzcKBg+ia2RMXEQqctxuHEHR0ShmckiWJoKCYpBwaFIBgzIHJdkLKzWHpbOo2dkr8MZ4XAL3WHt47omYZihQ2LhOm0+PjTOiID23c2RApv5r0Hv9vAziYH5+ZtkxdtG09BFGABSTS5EEv9IHkJ9+Ra4Kg5OCAlP0vXPwTW3LDGQvPfhXsJ6pg0N66xsUBj8TH8so2naylCTkxFsMeFysYsPIOfdPLF9YOTIbGY1Md2L7GaV6CcGJaMKBQgY4q2V9ZhUJPDsX2tuRjfvYKSYWbfSkwb9l4AAIkToUSJPLogEaveMT8oGtGT3FhRPGYNYxtqE6McUnG+k0k+4nYv9bKsqol56qDXS2Pruy
X-Microsoft-Antispam-PRVS: <6104e823a89c48ffaf3bcdc65fb731f2@CY1NAM02HT025.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(5005006)(13017025)(13018025)(13023025)(13015025)(13024025)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT025; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT025; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT025;
	4:1aPacx4wHGIEgk4rqhF+Ex2UiiUQW6u6BX/jaLzeNpkASqCCdiVYTg+YUGZNHfy8Qm84OthsjcAemsDI6YfO2G7gEgVTlXX/ToY9y6Yv8PJEdsMOvrIEsWJaPRk9wmGlMX83XyTGKIKZbfv8gHCFQpVvgLbP2zmzNKqxKBxCigmKZpLBbXytqSOlqnkyLb0Qt/N+LlAj8/ex2rhxxZUHeqlP5YxEInvWLMDYuUHrXzlhhOtDHD/Le/K3fRnoY/3GJb7Wr+Xc7V0qpZEOEjy0PHxmZdDbeRmXZ1eG9xVM75rLR8/gej0UEL8mEGOv8el5cJpXfmMObGPPQHsT2dsTrFNf/Uz9jKxv1yHap4fev4ehUdhCFYBV3tneDQeWPKrwxKmIWXrPsYI8W3mFeYRYbXDhDei0xOu3dUEjcwm0XOrh1CbAUMWRpMe4UI6AMmfSeHM9V6tK0uNJ0WjxC4KENpjj7UF+anh6Nu+u8Xi/P8Qp07EFFQ0yq8wQZx4dmA3w
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT025;
	23:VtEyR9JyF/J9pUYlOuPvg6Y7ThyrQ5pYgtD4FtKo0?=
	=?us-ascii?Q?8BWnQ4hnC2BVqqGPQrS5lE0U5ZVQ9AZ0Ml07ayH1QhHJfhXCTAw8osbLLKnq?=
	=?us-ascii?Q?mL3XqH58qvZVgJJfk0LuuUnVwjY5jbOt+Mf9VLIVW8chQnQrS4ZnYVvmo8dR?=
	=?us-ascii?Q?3m8eRX5ll43ncfJDVIzOgBDcZAg73KHtFTdfiFYoSEiL549zDN9/CRCqQKgC?=
	=?us-ascii?Q?aJtT96cEKetcj9faF1c7T84eCnS7TuCwq8NH1YXEWu2xoHStgILrwx4RhYE6?=
	=?us-ascii?Q?qwSKNyPyo7we/jgMRxT443D7q0EQrQvPQen/xyRHPj54q+FY0DUSxAbsJmvK?=
	=?us-ascii?Q?vAKzqYmv9X5XLhxs3svZ35tFpjIzm2n0cLV1h27iWQ5IqMvV//ekKNIVIjWV?=
	=?us-ascii?Q?h+KvxxeG5zKo9nCobWAJ6nVdhXLWXE5zr8eUBveCLERQrQX7OfBojMK0G4qZ?=
	=?us-ascii?Q?vh3aaGbeX2VKHnyHodS1ekF29dhfckb1w4iaXPvq//NOQCzBf65CxMz8Xhbh?=
	=?us-ascii?Q?z+v1UDr2if+TJMTcZlLzLilczO4SKvckYOznag4Fw/a8RO1p6LAfivf2hqXo?=
	=?us-ascii?Q?RbYybnhHaiayWrnGs9vH1BtCNmZ/fuJv5nvgPUtBynR0QCp5RBaew/A63oQT?=
	=?us-ascii?Q?hUAAUAMbYdvmwGGE1ZUmNxmImYp8Ze3iTobh2S5yIirCgG7W4y6wFVf+9nze?=
	=?us-ascii?Q?oa0g0+PNj2F7V/IMZ7lcRHdVq7oXFU/JMSum19Roye8FvFVjomANTozUFLO0?=
	=?us-ascii?Q?Mft5xDtMtLttMrlAhXckSEV7IQI0o3cXWC4AyktAzbqGbx+Glzd5SwpRMpa2?=
	=?us-ascii?Q?gZUmoCJqipXHawOk5h3NzqVRpCGC/zowEVdNvS7wXw7BmQgMCI9WG2wdYuDw?=
	=?us-ascii?Q?MFm8D+eVdtXlf5Q9/H7eneyJmpDQM3vtZK5gxFv9XrVJs3ltpWC1J1kPqONG?=
	=?us-ascii?Q?FSLVTpA+qcyPpfnrrsGqBk4chBW+zBydfju/SCTqvDzaN0vth98DXDitwhCN?=
	=?us-ascii?Q?GRgPacOJ99rCqtvJC0s0NfqDMq/ZLMaWzJKIOnpT7M/4icw4UOTG4dCODwlQ?=
	=?us-ascii?Q?3cLp+1UhO5Z8IZyvgZH0Lg0gqy+zjuDO+nmHZql293kKtszIw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT025;
	6:QxdCA7nUxwVZU/VAp/4B1bS2THa3Ro+wJapsisvpEAkaMR+9rhwkV4ZqEzcMiyVVs/uZn3TUFi8zbPrwGTrLL3yQ947Dzsti41uNByYlsF+/GxmhOs386hZc53dIokXPMXy33qxD1lK/OM02T7fzsMrNhxFeAI3m8ri17Ovjs+jCeIfli1HWB6BrmEufvbrI18XcirlvnvQ8jtm6BMflonq3mg7rAceQXRPXhNo1xthLIUk3CgIEZlbtb2YEa7eab7ZMyANDMScFu7tEwJHZo1rV72kEjL1L7MERPhxIy8TLHHrhpuZ0EtnPgNQAfJ5XZMm/BpUNtTwQoItwUP5e8A==;
	5:R640f0LCRaw6kDTvzkjdGc7gb928zMoDWch2haJb2MJ5oB+Wsut3aCOQoymDR/40Fd7fcE6qm6rn6DfULslusWfOPeI+GGZwQul6o+rEfOrRIpRwRHu/DeuOax+s1WiR91cVrvdbS/6qB4Y3YeD8Zw==;
	24:rX/v0PoNKWe9UdWW7Z6Fnomm/eEWLHmauwCKYesB0RN07yFSe1SCY1r12GJqUDO+0SA2KnCmdayJ7AejCmrvvFWsnlU2KlGiAj1RjwG5Zuk=;
	7:9JG2mTcTvwMeAwSM+Q14FlS1UQq6AucG2Bx7bIH/xUft4QYu6VH8YqSw1fJYsb1PQArD4Gfy9jqk9zSupP8WoirCzvMPSviT3J4DhKkEQe2NFqBnQBhMJiwXsZtTNHg5CA6pDDmQyGpwTm/5WWmYi2uoNTG1B21Jinejob86Lqa+z0D5QekLq4yP7Z6fTx/3bBY0GwMQKM+UaJA+lgkMfk2mtBOs0QuxMnXdxJP/hw7AJoKV7KUnfkdbjl3Fe5VC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 00:13:02.9240 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT025
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.58
Subject: [Qemu-arm] [PATCH v2 0/6] Add support for Cadence GEM priority
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
X-TUID: xHWuickv2Ge+


This patch series adds initial priority queue support to the Cadence GEM
device. This is based on original work by Peter C, that has been ported
to the latest version of QEMU.

There is more GEM work that I'd like to upstream after this, but I
figured this a good place to start. I have done limited testing on the
Xilinx machine, including running some of our GEM regressions, although
they don't cover everything. I can't really think of too many other test
cases that I can run at the moment.

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
 hw/net/cadence_gem.c         | 549 +++++++++++++++++++++++++++++++------------
 include/hw/net/cadence_gem.h |  17 +-
 3 files changed, 416 insertions(+), 152 deletions(-)

-- 
2.7.4

