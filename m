Received: by 10.25.150.194 with SMTP id y185csp1344072lfd;
        Mon, 7 Nov 2016 17:34:01 -0800 (PST)
X-Received: by 10.157.43.23 with SMTP id o23mr4606857otb.206.1478568841746;
        Mon, 07 Nov 2016 17:34:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m16si15906115otb.176.2016.11.07.17.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Nov 2016 17:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c3vIW-0006I5-WA
	for alex.bennee@linaro.org; Mon, 07 Nov 2016 20:34:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c3vHW-0005zZ-Du
	for qemu-devel@nongnu.org; Mon, 07 Nov 2016 20:32:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c3vHT-0007uu-AN
	for qemu-devel@nongnu.org; Mon, 07 Nov 2016 20:32:58 -0500
Received: from mail-by2nam01on0042.outbound.protection.outlook.com
	([104.47.34.42]:32197
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1c3vHS-0007uY-Ul
	for qemu-devel@nongnu.org; Mon, 07 Nov 2016 20:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=P43ItIA3LWnDzsGTLPPYYlHCXL5KV/za9lyTmkJq2qI=;
	b=ItajTQ9hOt/YmhdAVKweAQIhCXBO10yPxBAXK4pXZLdHTpyZ/fXaJkny2dUF+2lniiECFbrQI83xbSsj2kdATVK5jsO9ZIxA29Ip4thSw9t3Mly/XWPipy1QlTHJoEpo4CZV+CbOu42scygrwkWx6BR3UAICM8HtXrsu2gFAQ/M=
Received: from CY4PR02CA0025.namprd02.prod.outlook.com (10.175.57.139) by
	CO1PR02MB014.namprd02.prod.outlook.com (10.242.162.151) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.707.6; Tue, 8 Nov 2016 01:00:28 +0000
Received: from BL2NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by CY4PR02CA0025.outlook.office365.com
	(2603:10b6:903:117::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.707.6 via
	Frontend Transport; Tue, 8 Nov 2016 01:00:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT048.mail.protection.outlook.com (10.152.76.109) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.707.3
	via Frontend Transport; Tue, 8 Nov 2016 01:00:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1381; Count:15
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3um3-0003hM-Fs; Mon, 07 Nov 2016 17:00:27 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3um3-00010n-CB; Mon, 07 Nov 2016 17:00:27 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA810M92008512; Mon, 7 Nov 2016 17:00:23 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c3uly-0000yV-Pj; Mon, 07 Nov 2016 17:00:22 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Mon, 7 Nov 2016 16:58:54 -0800
Message-ID: <cover.1478566669.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22684.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(626004)(106466001)(4326007)(305945005)(5660300001)(87936001)(5003940100001)(2906002)(63266004)(2201001)(9786002)(92566002)(229853001)(8936002)(48376002)(77096005)(47776003)(81166006)(81156014)(189998001)(50986999)(586003)(8676002)(50466002)(6666003)(7846002)(36386004)(36756003)(5001770100001)(33646002)(356003)(50226002)(41533002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB014; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT048;
	1:9/F38bCfgguBLAGO0U5FUczBiP8GyLSHlHFY8VYgK2wpRrohfOGpbdomBh66by7upkncEwVyty767SVQmgSpIznS2oguh4xxkJMlhalmcijsA1AOq9QVTdnFUNqOl1oZCqviubeB39EaPUtfdHwhBpTiF2BTOl8rlK9IsbgZsdtxnFnVnRHtbCeJUBwTiEoABnNWSfseXSyIHkfuAqlucgr/wNlT2bjyYsVCz/6A320HlrzEtuz7M/EXRZA+zFlu7yz1n/0M4QYvzKKNoXa4tlefq7MB8E/ZIuXpgmIPthHjLlkfDAQQBG+R8/SkzMAyneES8g1Zukn2vp+9Uu+14YldTMaCbxV9TiRo+VRNyPw5uY5XexZHIGFFZ3FU3PzWtm77s16Q+TV9ejkOvx5mouFyp0KgE6a/8HpeoKkW+L90+DNZwJBL4FPZKKejq8l39TD+NLpvHgEk68pYkVy+mjxPMvU4XWNOsGPPfvrG0YoSfwRv+bT7H+jSG0SOaXEsV/jl+IwpP3J7hR4iBEujt01EXPD75XBK9o2/cRsbUBLubqhFDUhJC2sYCceEDRPWl6Qh3iMFNnUZq9VN5yykh1NXjEworQAOL0W8A3f3n7s=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26760af8-e22b-4f6e-967a-08d40772a196
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB014;
	2:yQfo4Uwr/z3y5ObwpKn6zAMTZ8LeVGN1o0ucUm57zMlVESPkCx6W7jlH+v6hnqgI2uEe1hi0P3kaMmFavColr4QPnDx3ZoyaXwrM+diTP/FrX2LxSiCya2T1hiXJtjtwtZnLsxLUjaW3dX6iGmzxMncDihhrSp/+YAzBghGHrkFIB2nRhS8s7GvbiZHx13saLfUhcpxAFUnyk+cRO42yFQ==;
	3:6eS2fciTCRx3GVjmq1xVoxTT8eqHi5+7aDNrMj8OMdwuTyV1CrT3h/QWKnGbbk984IjEX244lriLYfcUQJ3IzVIBVr01ECMlKlY3RKEvkWwqyrrmhg58JHII16wZCfP2XouikYXo6sGu5ivnLuZBd6HKAxNKLBrMi2M5qwYn7r9uUYymP6tt+KAVvCk8RcdR+hXEdC7L5o3FOtB96gH0fmGZTzc1WYSrMgM35WwAbmIpUb8NvJprE10mvuCTUBjDJAPHIf58WUSwx+XItFE4OUwZiG5iSlERGEwoUYWwMrM=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CO1PR02MB014; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB014;
	25:C3dS1roLAv+WKlB4BSRmhl4PZkWmLMQd3FJYLLyVdsWuDCp230o1oSBeHTaYee9G/wQh/O6tSOgbDL+HwVsFVxi2XjdWwznDQd+4dYvARAFyxJUL5fThpwI0z4lYTBg7Fm6//vl78TX5fWPr1WWL0W6HspUPIWbC/i+RSrNfDXaaikVmypUPa57s0S1MlvJYn/wUM46GpCViHBzje2wDcv2iDhNLz7twK9gp0Z6ksipYMwaMcRLMFdRIof5Lby+zCREHNE1rT13nhmsfOujITzyC3xhFlUXWzfecxAEwsBrs3t6MGl8Qh+5aPsxYYl+/Xeb+fGSWlMFBsX8ODNMRmj9/WfeZEQqoHVdiT2s77IbEn4D2VOsnMXrMrSrVmordoEgRcsWXW8oEjePxyzX941JiVYZY0JeWnzjTbXLDCzGg04AtXa7WiR6+XBg7O7MU;
	31:xDGdSIfkMg8fta8hlCRjs+HGE+uLSi6VRXoND/WUM7HkK53LwsxaZM+00Oz1AoxVGdBhEeFTB51o9UAejWaPbbLHWj7MSCiz+6JHdnAIKjP3XXyHkkrAAo2pxh0OcQCmKBpHCAYvaCedau6vMFk5vxEsbTGqWxn2l4/7FKyf3v+CaYYfIq2OerR6GR6nWpBTKc3zr6DFC5ww5gat9jwg+ZiKNxQN3JrZS49SBIdITHfm7ehSzOw88F+MknhwKXAJ
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB014;
	20:GZJc6CG/GYgPXr3PXBt/lih4N/uzqu1rMGyE8WZ2RGI8eWoMCkbi5875hriGn3zIAv3IfaK1VE0aF04e47vd93eqOvr3GgZEHamXR8nWnyZjE1KklynIiuPKmwTqSsr2eNSOAefRFh55LbnGBn57MsqL3z8AOY3Ekex6Qswtd4xhKETtNGK/EEGqy+PI1FlNY5UeeT1BCGFKCzEE7swTT5UQZqta6s2rNXL3/9eIB5cTIpBKjbQR5j5/Thlj2KTpTYEsrH9B4gPX0cGA7elckb/yqO1cqfeHMezXdU5Ec/ZQo63ANQ/B0Vb6KbwiimZiZmhpH3QhenwjQGDPboGjo0eE0IMAStE46A0LAkV+dfHnC6kjrTgaXsxYZNZm+2XnpDQzOpvzsxvl8WPRtvi/heGx6iPdH/DfCSJCLLPicENW7bcNHgPHTfxzBlQ/e4DjXAxJ0hotG3EWmE3g5gum0s1SYIa8Gbx4jTn14udLsxY4kmkv3/cP17HJ5Tr0GLpP
X-Microsoft-Antispam-PRVS: <CO1PR02MB014336BC34BE4E8CD38E30CDCA60@CO1PR02MB014.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(13015025)(13018025)(5005006)(13017025)(13024025)(13023025)(3002001)(10201501046)(6055026);
	SRVR:CO1PR02MB014; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB014; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB014;
	4:0QwR3UlHcdokLjmUKr8pp9vHERBVELw6dpoLwE2WEAVVOAyx+vr2vMkukh5V2umOLq6JcGMX5+RDST7r7X+jwZu4pfcrZu3gItofErwdHOcBKG9+asIHCQMmERPc9skdqkPel3PN3HYcuLvQLzVpOqjsjHyXG/RL50gRk1xo/2NQHIskZ6g2js4ElDSqM8C1v+HXQAVapLTPP98eFrfxackJun5sun4FKygNexiFw2eNqSpoao4DfpErBvKYX8sDV6YJd8GK6YsJQooYIVThYJcRRYHm9iAS31GGjtJ6YgVZjYriAUpNz9YRf0nRtzINHN197kqGvBNYNXhhuwyLSKNh8j20OhaJ9Q7eUaEHcg7l5MY8k/lCW+eXXTEQIPVXGEkJ1ERQw4Z4bor8wQ5ghqcz70unZU2xb6K5iL9jhkq6ItpwfVFVA1tM8KsGnwtHmyUtAaKG5omjmsI17+dgTTgi6JI6Od8EF7tsY7ZrY7vLilAQouNtXawasrpCCAkAqemqOIm/G25pKPtBB5I8Pe4EitD/zExlLW5OBTk5a2aZpaeDjnNrkwk/AwXIOmxJ
X-Forefront-PRVS: 01208B1E18
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB014;
	23:749MozsmCBW9GoxpUzsdV7VCmSECnReND7nUo3aaGs?=
	=?us-ascii?Q?vPQhyaBXXvV1V08f6oRhIvZvXhirfG2lN1p7SaA5FBhnegd5LOVXQVQtVN90?=
	=?us-ascii?Q?jwWjfBHygOBRyLx9nwe/0AOGfgpUV24xUBE6tYJVGythAz7G1MeiKVWtw+JX?=
	=?us-ascii?Q?eukBI5v6R1DjDQL2sN6dqzYg0VM6ajWEgHOS1XUqWJqfM7oGw4S6WKHqA2j+?=
	=?us-ascii?Q?cVMURkFpC1kZw3HETTJfkCVMNbOFUwj4ip2GZZ79acyvh/PWuXbttdz1JIz4?=
	=?us-ascii?Q?WD/HHUDsknw9bf6Vwb26ydPYRrXS/pOp7ofGDUb0dU1YDER04dBn41J2yp1G?=
	=?us-ascii?Q?lIFg8Vi/ZAYyAA692PEyjThOIfBMe+qGAS+vPbc3fs0/tpf4XppR50ws8oH+?=
	=?us-ascii?Q?eYF0KF06MxnavOz+QEi5GmeOsSnAS0azZygGmNFYgoAoShx6dsrSnBkH6GUr?=
	=?us-ascii?Q?UjSHVmMbQCz5vQ+3KioAnXYuVuqXxMjRPRlVUWodZ2STKmnnuSqStTdp1Bi3?=
	=?us-ascii?Q?iOJiQ5mdhMntv3j8xvOB3oDFq+7knncalIT+1VGEloqCHHPmWFlOMf5ZNEfA?=
	=?us-ascii?Q?jDF6iG6SurAJDWXrURrUM9pwWQSGjp1pcnj0cljzY98Qj1DEAYzX9cindUod?=
	=?us-ascii?Q?N3Thsk5Ra9Dbz7bqS/5MWglLXZlhecB52YH2u3sa3PYG7wQie/KfNeXzm5Xw?=
	=?us-ascii?Q?bafQGnU4JDYluFvjBw3VjnqIlr0QG8eg5Bkj29Vf9rm0BocljvXYX3e2yK3D?=
	=?us-ascii?Q?fZnbyFacP40IpYkb2a/LylamM6l6/U7ilbxNd32bokKAe6/M3kIwtq+TqsxZ?=
	=?us-ascii?Q?Yt2HLwk92NLQ+da3w9bt2h1A/4dpzoE6JJ830dlb26P6PGN3L98uSsK9bNJi?=
	=?us-ascii?Q?yQZaivkwXjKDedKdzWnyBuYk7T4/Am32W57EgpA/ZToj3oXdVrb42jtwsaQI?=
	=?us-ascii?Q?sz1xBqJGGZM5gwkbRawVaKbmrrNYLPiyH/NeNCHw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB014;
	6:Dn8bsLgt62TBNUP5AGj45zsYWYbHQTQd2j1353D7lSLdNdOmOk4PIr/9qrNMrpsQ0VRNHVFaO2qM58bgXUbfCv6KTMuEkBBQJzo3KQ5sNPr8c9yXEwxj9kVaC+BBIyWHa3aOqmvy8diKdlHHJLxEJBABiW4iW1uh1TBK0LYm9tY9GAfOugFUFRUnCUYeCGROKe8VugDurcVizDYC2EV6jyiknmwzzaqIHbiI2KSpigykD8hzeaM74qCh57ybUAPGF9V1fHLPPrjE4PiigSdHqmlzsB8rFQy0sE2Usxl53ZHBtcY6FQzulSZroFgR/IWJPXQGXtUaU6UNF03a080/fefVU8iVvUUe9tNG3KNL9F8=;
	5:1aiTde9/GJESS7oXJaE+KeZVj35T/vY0DxbrWtldHy2GEaNfeK5WR1WUUv4fo05BsUaJtYLQKkP/ipWdbzOy3JjVqnxQ0DicyL3VjKjADpujGMdeF+gQKWw2a7psOnxlc5MyVoo7VzTAho9PXJFriA==;
	24:cct9/oY17p0Kxgq4rp9dIyTTjywrWvJlAa6PYYsLCMmqy4ajASRsx195wsYpKVL5tIbLv4zylSRY+zNylxH7KcvWORh729G4/iq6NKswNy4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB014;
	7:YOjwPHhpsOdeRdpe1s9mOb0cmvDa52Jgh+6DXh+7T0J8NobED3J5DrF32mVRUikRq4uLHG7JupORcosEarsk7hirMuHdq18Rcdxph/IsRS+CjfTkdrPUrEFgU6B2gsN2/gCauhbY9zZR0R0RD36Lve2n8j19RRWViZAm8hYWUgrwMnlZE53NQqU0Y9rSEehp+iiHDfZusd+X6KQAZywXEKHDuzwZQMOxc3laAWX/vs2HH5sclYAVV0bcYlGuPzI+5gWzQx+njgKYT26qqgxvv8C6atVpRzKxMglMvJLdDcPUn9XbV+Ric6ldBY6lQfKNhzCd+93uBXn/wKu+InqODcyDEGJ568F0vMXpOybEbnc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2016 01:00:28.2874 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB014
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.42
Subject: [Qemu-devel] [PATCH v2 0/2]  Add the generic ARM timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TvzH6bOVhn+p

These two patches and and connect the Generic ARM Timer. This includes
support for dropping insecure writes.

V2:
 - Fix couter/counter typo

Alistair Francis (2):
  arm_generic_timer: Add the ARM Generic Timer
  xlnx-zynqmp: Connect the ARM Generic Timer

 hw/arm/xlnx-zynqmp.c                 |  13 +++
 hw/timer/Makefile.objs               |   1 +
 hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h         |   2 +
 include/hw/timer/arm_generic_timer.h |  60 ++++++++++
 5 files changed, 292 insertions(+)
 create mode 100644 hw/timer/arm_generic_timer.c
 create mode 100644 include/hw/timer/arm_generic_timer.h

-- 
2.7.4

