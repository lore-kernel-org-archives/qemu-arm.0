Received: by 10.25.221.202 with SMTP id w71csp1451809lfi;
        Fri, 11 Aug 2017 15:25:04 -0700 (PDT)
X-Received: by 10.200.40.135 with SMTP id i7mr24740412qti.55.1502490304277;
        Fri, 11 Aug 2017 15:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502490304; cv=none;
        d=google.com; s=arc-20160816;
        b=FrEWfaVrzvz8991rfXK1kR26YKPkTwycz0vaLRT+HuFw2P3B2M721fEG0LBDXGzU5W
         WSP++HV7fuNxc8a1DfL2AoOk7NoeWHMNzsAN3N2Op7OQ9X+daRklv6zxpE1Z+7/jyn/N
         Eeq4hLgy9rHj7VZ5G2qufqDzoHTcSUabxo/xM6hKIix4u4jZKp2uNNRAKt7smO2XX++S
         f00dHDnZQIjGMINNVIAEVZP0N8TMpni1GR9+vk4i0ERqA5jJ26j+rWaNFKEHPJFhOyqH
         GkZaBGdpiFSR/89rJrPmaJIr4F1ly3Kq1md3NZvH0RglWxxcRKgAztf4uMtWmgTIBFrC
         ve1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=6u1I+k4EhGhE0HIVi7Gdd4ihl5A3OvQ2M3Ur1Ttdn0c=;
        b=at3Oii8uKL89lFmxhyUt9lDCBh9NmY9EWSoJEAdAswCYK9xZYT5AxSXu/pR9HiqTXH
         09d5PwwkNfHK3QAi1/DsWF3jyocEdW7DvJpWAvgKw4u11oNF+tI6GkctpTYW0tPHAX1Y
         /AdkPRdq7SF9X7ISHtkSSVUX2VqenrQVEXW7B+LhxLWvQsca6yFeQHy+AmeBn+znFWzV
         U5NDcultCLmeyBJN8FxEFSgVIkJF5CNFCzoh6xKv3m14/JxiiPbbVfSP8V/Mui/TX5nU
         KIhnt0PCXmnbRqZXWOwcb10Cc5q7RS5D+s/WlA/efS+JzFiUk/GoBqxGu/gGD0Hj8g5N
         zWvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=0GS4ppAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p185si1652431qkb.1.2017.08.11.15.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 15:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=0GS4ppAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgIMX-00036m-Lx
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 18:25:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIJ2-00005p-IX
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIz-0007Ko-EL
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:24 -0400
Received: from mail-sn1nam02on0065.outbound.protection.outlook.com
	([104.47.36.65]:28360
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgIIz-0007Kd-66; Fri, 11 Aug 2017 18:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6u1I+k4EhGhE0HIVi7Gdd4ihl5A3OvQ2M3Ur1Ttdn0c=;
	b=0GS4ppAnkiLzVQlLNyDY6rHQE9cMnTldx8oT1mXsMx6/+foo65AQzTFM2J70sGzu84zI3pDPFeO5xKhHO0J0HR790IjZxOh+S3R28JaQen5jnRlVV9Nd8b/p1axDed1LKOrjcCSh8RUdBdGbOQZVbUDxDerFTV93qYYU/CAgah8=
Received: from BN6PR02CA0037.namprd02.prod.outlook.com (10.173.146.151) by
	CY4PR02MB2245.namprd02.prod.outlook.com (10.169.181.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.17; Fri, 11 Aug 2017 22:21:17 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by BN6PR02CA0037.outlook.office365.com
	(2603:10b6:404:5f::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 22:21:17 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 22:21:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIs-0006Vr-Eb; Fri, 11 Aug 2017 15:21:14 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIs-0006Ku-BN; Fri, 11 Aug 2017 15:21:14 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BML4tT011788; Fri, 11 Aug 2017 15:21:04 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIi-0006JG-E1; Fri, 11 Aug 2017 15:21:04 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 15:17:41 -0700
Message-ID: <bc18dddca56e8c2ea4a3def48d33ceb5d21d1fff.1502488636.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502488636.git.alistair.francis@xilinx.com>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(33646002)(6666003)(189998001)(118296001)(8936002)(36386004)(106466001)(81166006)(81156014)(8676002)(77096006)(54906002)(2950100002)(39060400002)(5660300001)(47776003)(36756003)(478600001)(305945005)(356003)(48376002)(4326008)(626005)(2906002)(63266004)(50986999)(5003940100001)(50466002)(50226002)(9786002)(76176999)(40753002)(133343001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2245; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT034;
	1:HC04t5b7WllarS5nEe+yCoVBWMbjzglw+w/lH2KD+Jm+3jEB7bD3tJMAmSQYXI5TIVq0ro+Xa2sD7aiZjT6P8OX+hy8HwC+okmyYx5Br0VMoUwla17KiMFj5wY5zN8Lm5dL2+11OjMjRIcDuokUL832az4815dNC+uvzKIJofghPf5uHRwXO1/1Uj9xwBo8dHQuusDumKdKoP5Nc51fKE70O9nSIKJbiAg7jY63iMimlp8kfAwLV1e/j5De3eKrpS0uvr+yAIUiAcjuIj9OV/iqZAB5VhmfFffZg4BJ7us5jca65TCc+WZEgdGoyg+UM4Vln00T1EW/J0F7C9r7G9MGDM1Feg9ieus/0GVlhIrIr+NuTvmq7HEyH8qcXdMrzwlQb4QZxD57ov5wp0/zNcGod1qrwlgeONeFxVkJ4sjbj1L5drC/OOCTH35pdABUTNcVQNKNMWc0CCcWE1YS2DKSwVM4B0F4uIKQ+T6kja7WEL3avJ/NFRV5nl78Sci5gujmKJhj7GTtFqb69BrFXj1it5x16Dw/7vH3V13rPVgrel5tP1XdDjPgbq9brVVhPfC5IpGzMy7YPrnqR2ny6FBcjV90Pe8d/JWCiU4pXZuIO56JaiRY8Jifezk+r1dsuUJMiyJObVXo1BeBeFUMc5MV0r3b8SgPUQieiYOIhko8m3AjZiCBOrODvxayoPMiS7Hog245LyLEH83AeFbeZro3GoxTl/L1XLIX4YDhk+PgWpJf8+NACdLMVMz6JZiRZcTTNJRxSNcuhH90WcJDeUAmXQir1LkHAFxHh0Xgb9Y78Ypbl35zH6MB05V7jzbR3YwTmrUNNaCrnGyQSrQrNGA==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fc64bd6-9eea-4d70-4a8f-08d4e1074930
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR02MB2245; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2245;
	3:QWpXnWaCPGNvEVQRygBpRYk4WAT4kUYMtRge7p5zsQixKl8ogxGLkU0G/3PJmx/BUODI7lKFU9nMWDpP8vHiFlDq7rmLtrcFwjU9m6cxqepC5JD/pTWBdqOg6Rv9B0F7t+pr4SOyCoTlcDz3FxNVxK5Nt3ZYOeFSWTIdXSZXwJw608auC2bHuIAASl984B79O51FuZFtI5RBC07/pnGE7iQIu2ebQ+kngEGeK6L4K+PiHINx3oLg4wfTH2/ee7HiRXHfucZHtP5p6s2gW/B3U8ATl5CzSsfEcaQkhysIRq94kQBL3ZLhR13bF4Cf0GmPoMBZDinqnoEBNhprcqXskgkIYEJs7wuOTMSAqHHt8To=;
	25:q7lh5vf8k7D8p3XmA78X5Hmp+If1cVhqxqDIU3MVQSXJa4sGqpMx+gcK0IJPDZqx+1XmppCxDZYyCBdhJTpf9ODrE9zjVN0Dq2RvXkAkwpyPADJbutVXXMIxZAE8YaXtz+ZMxo1nscbNTwX60zEGIGsUdpWkGp9vzVg52bn57S/ijFoZB1UlMW7u2uiPAHp53Xon91tkpgBz0qsW6zxYVQN5/C+l9VprMjVOurYXuN1fZgJRx30QY3pv6Fcul1/+u2PyOhQPj5e7qAMgA0o9nN/j246Ue3dCUIHF1cB2w+2VDKuMdjJl/hutGR9sH4A1rPSPS5FzgFdlMcA2FjmXag==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2245:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2245;
	31:Pfn3jL+AUCWg11qsVuRzJJM8rke4uc12up7BTKNTKNthdVC7BwFA9MOCA/+hp5REmm3jbLIEWtxSS9iAXGSBuqL/xByDuwPsemaiTv3E0auQd31l5bg5Akay8BTMo2m9yFR7tMEznwn143npsxwhj+qbbKlditUogkZnmcS8LCtVUqqV0m492QSppztgtnNnMlk9AJiNaE7MKcWRItC/b/0cft6fMBRY+r/fS++WS9o=;
	20:tyZhRKCysys/fcx8XqPvebbhQ/5RCogL3k8OsCBQBDbRQ3bontWMc9vkYcybj/LpWLGdPlZ5xXyYHMV+2PFPjtqMyWHf/wRjzmlbxrdwLz7IJQg1Y9/839/LqmNCGhKDhU/FT5wvJ0f+QHLVsVkbt+jITqt73aCzCN2UH/lAsjz1hLoaPXJbE3yVp0sEB1Gj3ieGpWzpwGZ7Ekj8kG3+Ty8peqJfTAtrsS3dOdYNh1WEwzeR4lrai3rY52fsaCRKSDP1Yp5EqzjDi5a1ot+CiIR8NkCoKq3+6OycHPRC09c1dPLDVkUDFxXjMTc2D2thmbS/+1NG3fAQAdl1yk5hXnNBblaPL3abX9eWAWkKuMGP7wOhCZNWJu3jHM2kkQQI2hWrHv16Q83ZOg8SxyXfTkvMRmBWtJUil4DK3CR517c9yuhmLVbDmdf7rAarpuqEoaXGvZlm1S/gIfyrdcIbxskmbLCSBWbLYdmi44Ygt+R+RFCN8ozHjGNoRa7LKfCX
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY4PR02MB224521A3CE3CC3F67F31EB43DC890@CY4PR02MB2245.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13018025)(13016025)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123560025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB2245; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB2245; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2245;
	4:kE/Rf4Eqq3aTUSRiiwa9mFaJ/J4sctH/qjbtqtaaRvF4DLwdAEew6NsAGm+gVKU3uDyg9Oz6mhrL8+qA0Q7B2wdf1a2jtdaucAn1H49W+rPu/sd5e3ut/QbtWzxFzUelxx5TCptKiHHP+4/GiI5yJYDaw3AgO0WR2/YExCB111fE+OOUnYH2QCEH0+yoHeqR29Ml/sCSGMq3ICQG2dFHN8bdAv0vEBCzakllnWgif11ycmb5ZpQs3Sv9rVORzMGahVqIeDDIeq1D8T+ebZh2uH1/RYFg3VDvqvxL6KhGVd8=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2245;
	23:SMNeB/uxwhqmXr8FtA+sT3WjFySbUrplO8pTD7One?=
	=?us-ascii?Q?L3eeGpK7OKHnGsIoEdjYTjYz7oMQ+DepYOvJveRKrJK2E59YNuL9ftv0W18F?=
	=?us-ascii?Q?z1TrJwUB4b1KYJSpfTPicGTukdTHFCuXEaoTZyeN3+4V7/CMdEqFZ+t/b07Z?=
	=?us-ascii?Q?r17k2Wph+CqhNK6Ub4I6FbGv73B0N7hureVG3IBj7+YDdXa++L4ONAZumeaC?=
	=?us-ascii?Q?2uYeJhJxq2Tf18GMuGpSI92JL9kGw3T+Hq8wZozHVIA4k1n6XcJvJWxr7EHB?=
	=?us-ascii?Q?ZQuGMMN3XNIgm7T/QD74ZEGn9oM4wptWpgfnOK2HlpqywrIhxYYbjU9pXZ1Q?=
	=?us-ascii?Q?d94yq6IbdRel+86puVOhclxjkbv47dzqyjYBzkYhtiKPrxSzd2P27ouKQI4f?=
	=?us-ascii?Q?FZSGIquS9fCt/MjcmaN3Q90r/mYM67zGQgSf+X2ot0HQbw6BlKCu6LG5qjgg?=
	=?us-ascii?Q?QY9z+gjWYg23Jlw+18DfJ/jmk27JOGbF1obr3otjyxdz3J6jFEtOK9HCbloC?=
	=?us-ascii?Q?90+wRU3HXon3LkmMFSrd2faC2hzVhvfu6gx9LVpo7nUPjVW9veKacmp6VoPg?=
	=?us-ascii?Q?bKeoWMuuFZ6rYT+evcTZPq8MiFssy8CDr7740DFBct+0V6Oxq1fypofme/sl?=
	=?us-ascii?Q?9RgO2f+TMHFtDwsLNqfzgp/YgwRK5tHwKY1vjv+CC3+j6jod8NGFrwYyihNc?=
	=?us-ascii?Q?LJ5lM4z8fcplDxlQSRMbgLfCc62zYmdNblG0lsbpw6QRyXbHQAW/Wzwh87sj?=
	=?us-ascii?Q?rsDRdZhq58+12rNxf3Iyof7yCMcP+nHwNeAEHssE0r8xNG90TWHk4OCOAVXb?=
	=?us-ascii?Q?EANki+7b+UaXdy81kk38gLysWmKrp0c/3p+wC3wtRg8wT9k83l3Qvrb1vCur?=
	=?us-ascii?Q?85J6qj4kwjS4jRUmjhvS5XA2JpKFhmJHwxH6PS2Bp+Ka0sEXfAKhsFbB+4Hc?=
	=?us-ascii?Q?W/selqq1BMzi/lLL9GPMsBYJFzqCPfbRtvzAf8CXUrtibzVplkmKlFLDG2PD?=
	=?us-ascii?Q?hs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2245;
	6:PsALFgUcPhNpK7nrBCfd6QaqVDqz2FlVzeCe3qOSzwtBs+qYyPjcXb23FyI8cRoSkxS7dtk6oeOth/KSURMw//5CM+/yFUf1mygx/rFEvgWy83zD5QgoRxYN/Zztl5Fzk01OXbtsKzOeuC/wCcgIz1ZYxaPAArrq8qvVs8/bxkkRWsOEABgA/Eush2sJpnNeNuO+v4Ro0tevSNlnjzWQrl3zEp0rny3Vw3Hjx9t7u/KXaOTqM8NvgUSaDVM3RHp/VtEt8dIXH8zHQoCNVCXbk1AAi/Ael2rUJW2FUHZLy9XLbg97zAwlKchsnmJnbJRI7ReT7PPTccNbaoNWESJRvQ==;
	5:R0ls08C7LIDFcpRoe5z6bmGwIQejbWVZz/XOJ7Tk1eoM94Vkjs+12WtwQjvCLJvmH17J/WaRdUpyVO633qGDGN3r3lkaXbv9vIaHiqNf1HfumNO9JZ9oXv8ZvKXJzs745t/Z2rTHIrO3JX7Ez70MZw==;
	24:ro5Cke1DoBWbz6i0l7cUotz0sOG/UVaDwb02BCDTa+gAcCShNAREZnTggJEMG09e3YNl8MXB5HeKRfD1shAEnrPONB0qOHHA0NsvvQlhXWY=;
	7:ma3J7oRia7rCTjumW/NXKAv7aN/m7o0Fm//LdQt1Fp4os7O+PD/PjNfwyIBPOO7kg+/fHVHv1wA+SLfGtkL0fXr8vvJxNcWqcsLXJ3xrVIq0mL3M53LTHIVcGjLlyHR7YF0gxy6/Dh+YJkjgLurD70HK+RT6WQvRN1fxh662Rb4acqLmHtUsTV+csr2wvUpDtU7ZChcJX46GbZ51acIm4fBxojfkZHXxPP7LKYuNU8k=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 22:21:16.9535 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2245
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.65
Subject: [Qemu-arm] [PATCH v1 3/3] target/arm: Correct exclusive store
 cmpxchg memop mask
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
X-TUID: 4d9Gupt9cyU/

When we perform the atomic_cmpxchg operation we want to perform the
operation on a pair of 32-bit registers. Previously we were just passing
the register size in which was set to MO_32. This would result in the
high register to be ignored. To fix this issue we hardcode the size to
be 64-bits long when operating on 32-bit pairs.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

This was caught with an internal fuzzy tester. These patches fix the
Xilinx 2.10-rc2 tree. I tested with the fuzzy tester (single CPU) and
Linux boot (4 CPUs) on the Xilinx tree. I don't have a good test case to
run on mainline, but am working with some internal teams to get one.
Also linux-user is fully untested.

All tests were with MTTCG enabled.

 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 245175e2f1..49b4d6918d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1913,7 +1913,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             tcg_gen_concat32_i64(val, cpu_exclusive_val, cpu_exclusive_high);
             tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
                                        get_mem_index(s),
-                                       size | MO_ALIGN | s->be_data);
+                                       MO_64 | MO_ALIGN | s->be_data);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
             tcg_temp_free_i64(val);
         } else if (s->be_data == MO_LE) {
-- 
2.11.0

