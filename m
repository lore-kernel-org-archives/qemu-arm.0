Received: by 10.25.221.202 with SMTP id w71csp1226922lfi;
        Fri, 11 Aug 2017 11:22:57 -0700 (PDT)
X-Received: by 10.200.53.181 with SMTP id k50mr21842372qtb.104.1502475777370;
        Fri, 11 Aug 2017 11:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502475777; cv=none;
        d=google.com; s=arc-20160816;
        b=oBcN4H5wbsKil6kDQs1GsD/9/MexYx92UkGHyWXJeBFLSCz1iNKCaOnUOVyGo1aP7l
         mK+9ec0dlKVfbqtTVPH7oGAvBYMU/TFbp+V+yOgkOG5lvrA6IZYWJdBQfLAMkG6PNtxq
         kcHdf2+MHrvcAcib/ejLAiHE0Q1w6eFHz/iqPrAwMqfLLnyhtOk8Mz+JWTR3FQdAKRJU
         yDSXU2CXuW+dWNMCO3bgxq5w1rhb2/sFM767/6qHi06HmlzSRxtWSgVwrhR3DjRwR9Y3
         p5iK/pBsh5bJpw0494SFf1xnW5GvoHeV9mQIpt5ZjaDAWil4uIdOj3Drfw4CiLcfRMTx
         DSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=7C91e172ASOhafgcHgk4cDbFdW9D6SjSkqyWNUM0nlA=;
        b=gNtrWMonMx08DcIK9uTwqbOhv+P0tCqbPHhLyhwkclUxjOxmbGPJBh1ATWEjIY3vPa
         K2SFYg/idBxCLEb4Ziux2Gr3BdmK9EWTiT0qpapCi7ewxi5eMfhaCX3eshe3zjXa4Iu6
         QHJ2cpwKZs//stzU6WgvZgIpzzwcMYJ+kBsj7sXo/iNT6Hzh3wYKuJJBXqk4wEsIOHFA
         FJ8ci+aKlWLEemDL+ydOKAdxLBq18VoEIddGmVbG+JaWoV6a8VRggYGEtsiSC5p4ZOAh
         xNak6dCO1e2lD2woKQGdf7yJrwv4NPOu/QH6rVcPLNSHZo3ch6UZCcoTMDovbBJKkZQY
         LYCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=c4cddnMc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f62si1216797qkb.331.2017.08.11.11.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 11:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=c4cddnMc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgEaE-00005W-PE
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 14:22:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaA-0008WT-RI
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEa7-0007OD-My
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:22:50 -0400
Received: from mail-co1nam03on0055.outbound.protection.outlook.com
	([104.47.40.55]:45251
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgEa7-0007NA-95; Fri, 11 Aug 2017 14:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7C91e172ASOhafgcHgk4cDbFdW9D6SjSkqyWNUM0nlA=;
	b=c4cddnMc/BT2Rh0v6r8S+fNEA1oxisMkhnFuzBozUvosgqweLc3N74EdYmmP2gZc/5Ug6R2yUHDWdT+EbAF1QtS+JHp8/qDFX9UmvS9UkMMZryEm2gcLZH2br4AdPhFd0uMtQVYera9yh+NnnGbscJyHrj5e9fe5Acugrsw9GO4=
Received: from BN6PR02CA0031.namprd02.prod.outlook.com (10.173.146.145) by
	BN6PR02MB2242.namprd02.prod.outlook.com (10.168.253.136) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.16; Fri, 11 Aug 2017 18:22:44 +0000
Received: from CY1NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BN6PR02CA0031.outlook.office365.com
	(2603:10b6:404:5f::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 18:22:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT054.mail.protection.outlook.com (10.152.74.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 18:22:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55110
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEa2-000412-58; Fri, 11 Aug 2017 11:22:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEa2-0006RL-2U; Fri, 11 Aug 2017 11:22:42 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BIMe1o013535; Fri, 11 Aug 2017 11:22:40 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEa0-0006R9-DC; Fri, 11 Aug 2017 11:22:40 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 11:19:17 -0700
Message-ID: <cover.1502474835.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(478600001)(81166006)(81156014)(50226002)(36756003)(5003940100001)(8936002)(8676002)(6666003)(9786002)(356003)(63266004)(106466001)(33646002)(626005)(305945005)(5660300001)(47776003)(77096006)(50986999)(4326008)(2906002)(189998001)(54906002)(50466002)(48376002)(39060400002)(36386004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2242; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT054;
	1:7X+HXGfRtLl+DKCakt2NffFOA9h5XF2KrW+3GuIE9OdkrclLISEhGagywIT7nloq6Rwdz0Ht7IwzRia1vX7ocoUhAEjCNgjmX/0ZzC22wAxN7RMg/iff06KmzNiBOcLB38wGvATC0PvIItEZYB7x7bo7XCF4Y+myAyFqVZObVU/GazNPvc0gpO+Y2OA0+KCfh6vN3gfZiu9jD/o9OLO7zSIQ4knagzV0mvyYMLWLPieT9S3hFX4yveX0VmZW57TUlaKUhZtrT6Br2AewhJPuKZIWR0nKd3GqZ+Lu+Pj4KriDFz26z3/lqI4Qddw1GBJN/WiQl19I2I6HyvWYUvBebp99NgLK659PcNhbl/e3OtBUSejOF22FdNr7xf3Pe3uOZcsS8Vhx8TuomPiIzPk6wZswSidALlIKgc1c67ME3spjrN1EDCFfpU9XciNzBZENQALiJ9Grp2AZXS7bQ+TofH1aLEPfTmhgcXlhIBbhAQksj6fOJojHGS8eVQpwmpuH5JcvtgteSjGT47vEq50dfUk82DwAoYMNhnRnVvM6M5H5zZ99P5AvxiojShsqQ3NoWtl8FruWKC1rOernWXYqAxOc+Bb+TgrqnUtRfwjoqOTSWuGT9vTOkne+68vfqx9dBMZxn/NNTI1pzxwf0yWP3Mnn5lcXQ/8JDcCXu6q1p6kxtaYP8Ha2/pLguYYyZL/NlHBuO85YgKh2ZIrmukllffrRtB4VTt8SU/J0kbyXbgDToZlG1hwVYSOodCwTUXcd+c73pBPRbRsBSkhTxuvgWB0BSTZ/DUx+OwnrXiYRj7z1IMsTxZcNGutWmpuvrBfl5yfVQm8uR1HQdN5Eu+0SAQ==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3332cbc0-73b6-4ae8-a4ac-08d4e0e5f53b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR02MB2242; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2242;
	3:cAIJCrJreOAgwbAefJwmD4C28b54QvCf6ED1tGiD591SbEOUlFmwPfIDzLoMIF3aPsMH9M/MgTGqHb3tfJUfUoxkvlqoUaEI9/yrqghVNK0Jfrq0C0bb8F3ws2/x6NtwjbMPsUrblWj4qjRyLJgo/Os+w4FD+f4NjBl2MrWIOxOD4zfQDXfTeK0RrcXMZl6tjmsTASxKo+wmFAM6jL9UkxLFkyyku3XkRWzORXL3ChvC57T1rS0IW2JvK6HlIrvoSbPzchwSAlT2o24Fud5wAvjyyyNM4NVVNWumbPIlMOOpuZxr2sbdoqeHEEVdvA/awdHJS2twQVjMLp1hV7oNYxkP/JAG8n+Qli3QEreGiLA=;
	25:ChYdBR+JG36DO7e9UfL2SHT42LYfTsiFszVznhz+zFhNMka5+GYntOuk3USCdcbRLo/vNCTW4qVv4JIG5xXSraKnoELXwk8lpMBXIWJZtKbNGaL965dBvoAJL82n0Hs0s3kT950Phi8BvL04U7O9s4ZVyxSNWCTB6M3OVD2k/ovWIDM4umgYLoI6C3/RnyJlSb8g1jVqltfyx9k4Csq+OKMuJSreij7s5keC+BKm1vZT6iwSD0I+GqFL3v1Hyw0XFFNODMFijFy01d2jvXracplMlWiy+x73DicZO8JWc3sjQGoD0lPAaCDFc2iRmhINI4NLFnVrZ4RiDXDRi02ooA==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2242:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2242;
	31:SNXRafWv//R0hy6zbQq0ZibSF5ZPZDeayA9lbmsa6NDgQDGgEjAU8mtZFfofMruNpMyZOVaMM3S5gEe1oIkG9mCyr5h9odsQ7V7BcRbBnP94JotsIjJL99VYApi0DQQdbyQmRy8l9pL679KH0uSiWBLY+WeuZM7watmYQDyAVLexmVgSR/SyOHRW/v3KTfbO4Dm0vKTNF60oiOY8u1cyUMRICmNeachSw3FhMV1uFyo=;
	20:Fy3PKu0NsqnK/NVwcksdLPVdzJq/p0wuEtZbQ0mRy+LlxrJc2Vwh2mM2jLpSAuu09sIqsQWUraQNOdlUew/0ZS3ULb+E3/vsfYdYyT6/3MpKEpOZIUp7fWjqtJJbt7dS4/m6WuRcJSxK561mOBSZav9SON/AdwKBn7SaVZK3Oj+4isboG7u1A92U+Pax8wk3sAD2ZJA9bJC5qAoIcD/1ROMQHrpDVqkVycI7jXeGvSrAtT15R8TOfIkF81SjALC3MypuUaFw9GZjCUs8oI1SN0tzMSrx2Fcx2nX7uQwHCCSVLuMTsdYmOC6C0p+O6VJjmzvzEpT+TwZm0cISgWb3uTYFQc+2ILLtBlGwXtoSHtdS9HvlpzNBBWrXrFcIUxfwU75F3mFuKRTqscDfsZ4oAztjNvTKzEyRu7A0gcJ8GlN5kt14PymWOyiGPV1S3wMcuy6/XJApAeYDGYtdpGfMo+MLXeq7awtKL41WQQPpjfNhBH8fijxrcED0NGZNVbj2
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <BN6PR02MB2242BA2F079475828EE1C4FBDC890@BN6PR02MB2242.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(20161123560025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB2242; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB2242; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2242;
	4:ob1RafVuqBi4zEuXqJXDO02jiyr4SD+ZuLUn+2TGPA8CRDiIWuzssjag3+xzuF8cefEX/O/WIIidVN44+VihLIhq00f9szpfOUClcnsolngitDZGQQHXGeuSVbPuqPAMeTXkKYGtMBNphnQfETrC5zncRYBHvLnxkrXJttcY33dTkaxUDe3HLIfXyKiukEtZOmOhSd+lGYTN50SA/Ck1Be72zaG0w/Hj86j+rsZLNP9Oz0y+L1FZrpuLWA8S5yFe
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2242;
	23:4FCcuAdzKcI4t+FZ/huoOsbYX1mZDtkgnXZz1/QXu6t3RFjGS4Q1yUog4H2c/5oYBlKqelIU6z1xDsJcSSJwQ14pUuOMlANBOjcwov661cv06XgySznCeC3Qaba0FkYDmXm2nUALFz2mHuHSOmpQRKWbFNeClvpwFlMeBZMzlgE7xqNuLxcraj1DuZYstw35K86encv/jAhwGCTgbgtxMOkPyEf2/33X4z/3SXR7nrANtoLMAaK9tNcD7GzckEZi9sPOnKWcXQlzWoeEShaNaB8g3aT9XI0Ny2kR7+tWenqwcvuj+qvx7XCD1eqgIOSY3Ai/QkUgK0d50xGE0gQVu69cqWCehQWgGnrRCU4h/fGsuD04RpC9UEtJVtTtJomKoIv61SvaD7vsCThIQF9xGw8Zp4FehHcqfiClZ2uacW81lMYysYMImlDgZpYL5pVzQse8vh/3acd3oqHlBsCHWJ7Udb0p1mGftqt/r5YO75/7Dcw3jTUeANZxgV1MD9GoX6KkcMrnVmBrLXVmrwDA9mbZ+HRyjvpZItB3NyEeH3eJ+iuzSfSy0i1j94QW+VGsWBQetSN8yhfi8lApicCKyh5fvSm5/kNQndMpJraai0lfOpPRVzlJAD4YNj1YQXo4KIfTn8Lsta5nlg1oeVwj3/2OW86r/JqZI+GezTz4X1A2AJAVpjpE/1m6Er6+yVYZSbu9MLvvAaXk2rREMpc99BJgvIp7hnZJYJA1Tmp3SAT9JXQk6iKHCu0r8lBJVcCLcCCtwapK/i2pULOf26N1Qetqgr3kkEAwAxChopqffMq6x3N4nhkWmcJxIicDH2sfQRBkq4kv809Ajy9W4FU+az/+DuSBwNxYcy0lLnu69B/xjhkvW6wnz1ASnOBPggC0LlpmhVpud29TY/Xe1HMoEg==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2242;
	6:axDpOeI74HFgQPkolw5NvkjFzBDXxkKPHupAhLsGA5tvkqvhrPpAAzq5vrrkIpHJtwKpsyuGYQ08uc/MR3a1wAe7Rc9qXJywgx+Ui9UDCK0gSqzVF8khW8ZWdvj8uAqoWxruhYU78omVd24lhPyWHwYcoKiJRV360huRkyII0Htvptpk1DFSWfIpuAbKeh4+CxU7e2N0iR2H62qr8gNNYIVKhKLr3z4qZ6vmgRTaWZUaOxkcv7jZfhBypawmUJWIt5SNFqpNysCQ+/9L27A0Exn7WXxAPxo5pYSxfU6aKnv4Ii3fkvDJQLU9hddZo5g6bZi2Wz5rQeCWkSsW8xvpgg==;
	5:bYr8YVmEco1SdtpzBC6N4RDIKzm4brWheO27rTzJ5Cry5x26BRet/THB0wkJo6KMnL3ZYfbVxZyFQxoLzad11bKD7lBntuavdD7tOtSuDnEccZznojRsWuSkSfj//3ES6ZGBWH6qohrdvtj+atXiaA==;
	24:utp1H8nYor3ENoYZMYJcpMBH4CjSvu5sJBPM+9P6Ny6o4L5HKW7o5f9gZeNk5dQB0/eFgrGMuZwaWMkxl5dYOaZrbgK84kjgjKnMZE5MG6c=;
	7:9jinZ+SChBZnH4zjP7RR0bq/81KEBMqIPMW3V/haWCsW/+Kx+AcbVaWa3pBtdFc2PjFP1z6motq/OhjBpChD3b7izqPNqPWP/UNKMu9vZfTosLA1stwQOIdUclDlWquxRwqgkAI58dkG8btF88sVl/0er6stXLZ+fORzRo6KuRc+HfInLR0oMC3BemU+ekfp7Hcn2ny4RW4AAGF7jM0tPBkpCJbNQnXaNNoYOVeiN24=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 18:22:42.9573 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2242
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.55
Subject: [Qemu-arm] [RFC v1 0/3]  Fixup exclusive store logic
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
X-TUID: SFozZUwshXo/

I found some issues with the way exclusive store was working. This patch
series seems to fix the test cases that were failing for me and also
seem to follow what the ARM ARM says.

The first patch is just a simple adjustment.

The second patch is just preparing for the third patch.

The third patch is where the big change is. It includes details of the
limited testing that I have done.

Alistair Francis (3):
  target/arm: Update the memops for exclusive load
  tcg/tcg-op: Expose the tcg_gen_ext_i* functions
  target/arm: Correct exclusive store return value

 target/arm/translate-a64.c | 24 +++++++++++++-----------
 tcg/tcg-op.c               |  4 ++--
 tcg/tcg-op.h               |  2 ++
 3 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.11.0

