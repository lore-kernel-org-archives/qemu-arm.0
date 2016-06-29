Received: by 10.25.21.96 with SMTP id l93csp2177695lfi;
        Wed, 29 Jun 2016 06:41:36 -0700 (PDT)
X-Received: by 10.129.84.136 with SMTP id i130mr3443333ywb.135.1467207696856;
        Wed, 29 Jun 2016 06:41:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si3045122qkh.176.2016.06.29.06.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jun 2016 06:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIFkG-0000hT-8h
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 09:41:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bIB9r-0006XL-Oy
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 04:47:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bIB9n-0007yO-QT
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 04:47:43 -0400
Received: from mail-bn1on0068.outbound.protection.outlook.com
	([157.56.110.68]:37482
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bIB9n-0007yC-Hf; Wed, 29 Jun 2016 04:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sN1MXXpEen06j4AZJ5Ja92N+8iRBpnSaCtg7SAneqzU=;
	b=e+cX62P1ezskPnmPxaKmvWLPjHDLdmjmu5sh1sBhgCgV551GU0wHha+n8hWzlvdAsMIZHsighJ5UXFRZgs1Z7d0yw248sxJLAcNt0Dr0W8+aSWNRJmXyBO+4nNh9psi4uixPtJY1XhwdDhpvQzduSZujFzmcMMMwbJYEiSBKywI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	CY1PR0701MB1694.namprd07.prod.outlook.com (10.163.20.28) with Microsoft
	SMTP Server (TLS) id 15.1.528.16; Wed, 29 Jun 2016 08:47:33 +0000
From: <vijayak@cavium.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>
Date: Wed, 29 Jun 2016 14:17:08 +0530
Message-ID: <1467190029-694-1-git-send-email-vijayak@cavium.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: PN1PR01CA0037.INDPRD01.PROD.OUTLOOK.COM (10.164.136.137) To
	CY1PR0701MB1694.namprd07.prod.outlook.com (10.163.20.28)
X-MS-Office365-Filtering-Correlation-Id: e2989c9e-4967-4500-f691-08d39ffa04b3
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	2:PAhkBepPc65o31jdA4RYI7ryVgGgY24U7P0RzTcFzSALdpmoj/lE2VVi6dpG6aP+iPzPNTIN4hzT3PhxjmCuoF49Gy41nKmolYg+MxIdpvEm+88igZfkm0t5GjiNOndUc+yzolvOCFaVRHntQJxbu44b/+u8EZEp3w0N+qP22HueVZiCSR3v8KbvtfDWQYvX;
	3:WlDXW/SgQtZ6J1z4Jvbw2FljVhb6dkI0zxqZjq2xjl1Frw9pP4duVwfxFOfSnyUeHe+JclCS6ptFAX30n+fer9XvCryOlJ19t/p/yuF5YKlKQTecohhcaUPmFb4HhK8a
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0701MB1694;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	25:5vUPZMUaoT97+/JZjRGyayg/Dw97taQ4XwhoCVLSOoDJgxGeye7j8J/m18MqfpoUIJhVIvmEATPtCWrvtpXtWe6qLfX36oNmvh48M2oBaLLoa0xnQvoTqwt98mTnEPA9Xo4ouqnDBajfi1VFVT18qgq3vBFYdrvP2TJYuOBHdRtWYmPmjim2MAQe7JJU3RkwMQWcSPQH2xswR+RGELU9ss2SxZXbOvOfuIOWav+mN3OBels1OheIoighUkwRYwKpPS0VEyAli1QIAPBX1VEc34b7VUU8f5uKeq+tx8F7nWHHxtxrrDtEHVqS2JBCwKmYl9lDQMz7DPoPfcr1DOodMFhJ9YYLFgX5yVpdvHr8e/BSzDsdmBQTJkvAsHrYrEEQ5qWC0tHv9NhG7u90mA3n1Gh3W+vATL3OmJL92326xC268E77C6IlY8br7LOlI6UkxYO7j5NluNGy8FBK0jTWFEmH3ei5UOKm46UllMkM4QyxmaUQbuCKzvcjumAlPkV0AC4HsvO6bQ9FYoKmAlpwUV6RK7xJOf3/z+BD4lpUhAZCmDtF8ddfTUWevlzOiyKfLkMjE3Nbf5iQCg7miPISdfvU9x/uTNAcbysr4XQIYrXUchzEOr0Yf3uAxrZBTcU+tfeQhqiEouzjmWkids/p+1+B2ux4+nNuhklm9W6QZu/4oPP0hzA7hXyxfzsCYhn6TB/0n5nd7R9plpnyFCYKna6hl0T1vGwj/sAtouEPMDwokCShqKHp3wWkDyKsB7Abmrh9S74MI+PU5wqOTiJbyd3XkmHkuocB5dTg33PU9jb84pX+FN70G+PrlQB6qg3a
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	31:SD6J6tTk07B+9D+yt6xMOBRBB2L97SM64OxVcSSBkSZlv8dpoQM5/sFvJ8lKz7ubzf9/uL3rHr2DTR+9W0xVIBqJJlbz0ZSzV6qhbH8u4T+cqSE3baOdjt+Pfq1Y1BjHdDvKlPJGXkst7l8C27cIf0sccA5MNpreL7yYfgEwAA6nMnnXHBqSTvNI2phApJBpZL7UKeTajRLLRcE3ms5+oQ==;
	20:TNp/ZahovsQp+JpeEbry6X6P25K5bZ9RR23TBfczIqO5PeaQ3Wji76ehbbpcMMzxC9WbTh5oR2n+ocMhC7Qnbr1SDEllVLoWE8pri+vJwW1hblUhh8YipK0TG8WgxrV+H2uHSTr7fFzopEoJyZZgn3NUu91RLpP3oIPI7mPeSEGPZv+520EG1ejpvYAwnJWtQe2Ii6maFUSauUVeC1G5GeNIJmLqH372CP9rVqlrAJ96I5EJgTJ6GN1mlMx4jlsw16f0Zke8qHG37owiTtcsbsDCdzWw5WHIX6fHsvU7MtgBTlHir5WKKfm1Lu/ppEgMuyTUPEBg28u1zB5ySgAS5DMxB57Y2Dbis3pejqAIAJ11zCIA1QwW1PO0eohsJi1BkcFuvCXCFNToxoJoXwlLQWE2UTHLTokxe+ikCI1Qu+UuAacKh1QQZXIS2z7CPuqYAJLJMDuePlVClDsphbsn6r+W4VbSlxcQjzxFA9cpRupfTuMpBx9SlplygSvTlZz9
X-Microsoft-Antispam-PRVS: <CY1PR0701MB16948CFB996FEE79103135D5F2230@CY1PR0701MB1694.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226959686518644)(22074186197030);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:CY1PR0701MB1694; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0701MB1694; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	4:h4NL9dT+QvSjQ0kig5dDCYu+RBE33Fn/FpaQyAISipPjAuIMhsHPxaLpEa0Q+5knePGDtxI0EZ9r84WKYtvDJTvyhsJ+Z6j0GEXroYJF8kLOkZ4vXR0cNBBB2uyXbm2SQVBy0jxk8sgUsEeBL3oskAE6ozqyQobUKCzGnwCUk8FnB6whyeKvcAM2ngqJfkuYrp3LX0HlvKeKl6P6v01CVpSJ41I4LcfgAUs+LVFIIaej0+GvVOFcFYjtZq53cdZHRrKwpNvnJ9RflEh7Jt//WRGn6haxne9ZcHkk/xCbfbPWl3mAnCNN8Y01A79o6MT91okEfUknO8v8b+VqB7+dOcX/2fOwh4a9ccidjAsyga8SNuvf0N01obdARwGNiJh0BNEsnLcamhNPQDijx54KW/s/KD7eMlhdckn1dBDI+dq3wmQ5Sgibt/vVbnvRkyDm
X-Forefront-PRVS: 09888BC01D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(199003)(189002)(33646002)(50986999)(6116002)(3846002)(107886002)(586003)(50226002)(5009440100003)(2201001)(86152002)(4001430100002)(92566002)(50466002)(7736002)(47776003)(189998001)(42186005)(7846002)(19580395003)(68736007)(5001770100001)(97736004)(69596002)(2876002)(48376002)(53416004)(2906002)(5003940100001)(305945005)(4326007)(19580405001)(77096005)(15975445007)(81156014)(81166006)(8676002)(101416001)(105586002)(66066001)(229853001)(36756003)(106356001)(7099028)(4720700001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0701MB1694;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0701MB1694;
	23:1aRaD3qOl4zKwX5W6cwphmd9vL4V1ymHALaa0rk?=
	=?us-ascii?Q?xAW8EFWZshx/AIo8wD7tLPPYSBypMb8YRen7gYSr1Ju1SQq+ltOaGY4p4gjH?=
	=?us-ascii?Q?U/mramcLuODYwyS6T+eU38yml4Ltj3M+wuHZvbvka80/K3+KkjcuMxS5cBuu?=
	=?us-ascii?Q?1B8yYi2TLOIpPPJCBVahTVa1HzUqZ4HC9cShYxuFo45YBfKfDe5+abLDD7hI?=
	=?us-ascii?Q?L2M0vNjczppGfXVkZi3IY18X2f8SyWZcAtEYXfiVF/8BPgBc7bM41YsaTGK9?=
	=?us-ascii?Q?FvWUwZKcrLe63PLgiHHOmseaGVwr/OEI/WPikVBzTKCaQQ+J7/MZXo63hLTz?=
	=?us-ascii?Q?S7NLJi4Rwyrz+OlkTaxi0vMlbY3Yjgggrx9alEKL6mNpgiFX8JKHv8CalxIw?=
	=?us-ascii?Q?P4waQA99cDOcjZD6ycZEZGkNbjoA7xwyb6ARCL2ik70P9MH3/Q6jRPILS7JK?=
	=?us-ascii?Q?5IsLR3xtrkRcli2lKH0zPQNpNAkKiXSamD9uKaXxffzuJm/6q68aszKujXw5?=
	=?us-ascii?Q?e1WyIkJD/CNAqZEe96YRp8d/wW2T6t30P0Wg6cw13GeDxKP5X+HP8KFsE3Bu?=
	=?us-ascii?Q?0iA0T6Xdvqn2fMrwRUHl30jjhrNs+H9codzmUbVYgnKXnYzwxwfan9fUHmvH?=
	=?us-ascii?Q?PEMkcsEIc+sbIRkih1dla/mTd7pvpoPuSu5S6GXNPI6/ykIwV/xxf1gsR/6b?=
	=?us-ascii?Q?eOd9YVAGmw85f0fu7V9+UZhFKeczCwBoZPrMpENBroX1jYvT+LGEJr4t+x5z?=
	=?us-ascii?Q?PlRkrJcEty/aRDByJnwlp87ahUwBKwPzgRwQUd2pR1d209DcDU0KFF0C+7RK?=
	=?us-ascii?Q?xPGyeKIdlg73WIU+1gtMpXoXx/d1yfgo+44yYkJ01Bvl0EtoUJ8XjXiNolda?=
	=?us-ascii?Q?cT/p7xzX7uVSGxmoo1F1oUTBw/FhgMTRPJS0Aev3RfXUauZuf2KdKsmsZOeN?=
	=?us-ascii?Q?IxGyObV0xtImIx7ipcxpbq+mCnIkxFCzSfkemdizsI8OJlEt9GL1sI3RqunQ?=
	=?us-ascii?Q?Ks0YiqbDsCnDsy80CSe/BLMALNHtZx8Ogs25JTawic02LXpOo/sKfA6Jm0mk?=
	=?us-ascii?Q?MvqJ7AoqH4c38iGah0eCafDqvAkwWbGJgMM1l92sVkZbeWSR95Qj491UL4GD?=
	=?us-ascii?Q?Fb4tih/PdTN4+4pYuVDBxxJ3B/V9xOjwWA7NqhGhmVKqBM5bZyD97jYnS9Do?=
	=?us-ascii?Q?X2bE2L01k14c5mivQWwfgz6jSGr/2oi4qRMlB70TgHcJqz8dGvtsk2NwrlJr?=
	=?us-ascii?Q?7EbMODy6MwSdZCx91JsU0hNsCrMMblYTigvHDTnyK?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0701MB1694;
	6:6LlKmBWIuFbwKi2EhSlK/n3CbK/OYksQadGDeDI2ZtfQ2YnCczhlAJhCmt4UAID0fL8Ljzu0ZHC7XLKydyzlCd2aC/BDoubVYzqOcFokSNoqeXX4u0GBFsvsZKHyBEcwZlySZmx91GopGgGwlcM9uW9g6tZezNufH8MYDfOvLjoQW2Htetp7xp7nHnIn++jUCGuVl/akaZ2Xwiv49SL9JG52W54z9VY30QZByEmYGaVMdTKuUyquHdrV/fapD9nQPyWh01RRi2l5X7cu2NqR+ap2TsaTx6ICXT+i4OaBTHA=;
	5:rO50U7AIAWaBa1G4B7jWy/VdDEpbNUlXwaUferzAFXDywLUovqCI9D0HHW6TriaXzCJOb5vo5xnZjxoJbIrLuKXwwPFKQ0LkC1sH+lQsluDBje2Cg0katl/6jE0TM4MlqYtQV4pzbcHZHM78srDexg==;
	24:kxjQgRJRPP7CsWuS3JNukuKKb+/ctorTu+vim6W+cXJBz4ElGkzqBbP8KPR7ZMiAdKGLu1Zbv7iNunqRRTI9PoDxjywyIZpKF7XV/gDGRwg=;
	7:3UYN37dgaQmrOhP3Iv84xAv9Cr6q1qWon0kMQX3aeRCHfls8ZHMXJ04i0EL10u1KEIC3zTn3UXhz66URVO2XY0w+nQlPfsuqajtoDsNlRJx5DzGfmTZvxiSQyMBAIxExG1RdSNBM2O2UDtYmJQNbrEQvucUZ3mATFb9ORj39IicMlXwBtc+RarGnrE/OT8c57xgid9PJ4km9VcOXT7eczq0b4ZXap+cpyCcEBseCO29oQI8deDKBBBN4C7QkNAQ2
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2016 08:47:33.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0701MB1694
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.68
X-Mailman-Approved-At: Wed, 29 Jun 2016 09:41:32 -0400
Subject: [Qemu-arm] [PATCH v3 0/1]  ARM64: Live migration optimization
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
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>, Prasun.Kapoor@cavium.com,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5uqnV/GV8tWE

From: Vijaya Kumar K <vijayak@caviumnetworks.com>

To optimize Live migration time on ARM64 machine,
Neon instructions are used for Zero page checking.

With these changes, total migration time comes down
from 3.5 seconds to 2.9 seconds.

These patches are tested on top of (GICv3 live migration support)
https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05284.html
However there is no direct dependency on these patches.

v2 -> v3 changes:
  - Dropped Thunderx specific patches(2) from this series. Will
    be added on kernel exposing midr register to userspace.
  - Used generic zero page checking function. Only macros
    are updated.

v1 -> v2 changes:
----------------
  - Dropped 'target-arm: Update page size for aarch64' patch.
  - Each loop in zero buffer check function is reduced to
    16 from 32.
  - Replaced vorrq_u64 with '|' in Neon macros
  - Renamed local variable to reflect 128 bit.
  - Introduced new file cpuinfo.c to parse /proc/cpuinfo
  - Added Thunderx specific patches to add prefetch in
    zero buffer check function.

Vijay (1):
  target-arm: Use Neon for zero checking

 util/cutils.c |    7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.7.9.5

