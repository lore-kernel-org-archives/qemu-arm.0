Received: by 10.80.166.35 with SMTP id d32csp230005edc;
        Wed, 2 Nov 2016 09:59:02 -0700 (PDT)
X-Received: by 10.31.92.215 with SMTP id q206mr2784586vkb.104.1478105942753;
        Wed, 02 Nov 2016 09:59:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si1024406uan.33.2016.11.02.09.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Nov 2016 09:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1ysQ-0002ZV-2B
	for alex.bennee@linaro.org; Wed, 02 Nov 2016 12:59:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1yrL-0002XK-RW
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1yrI-0002gP-Jq
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:57:55 -0400
Received: from mail-sn1nam01on0066.outbound.protection.outlook.com
	([104.47.32.66]:58336
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1c1yrI-0002fs-A8
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eS5REAqxhSN/Cu32OU+/v35sWxZD2+bCvNz0/E0KJXk=;
	b=V6EZByRfIvCyjpP//NCm7IQsjBR8QrviNdRKPfduNftSxQ65x8CLbcTnVnWjX3HY8uMcigSrUAHdJs4GmUs7VvX95TSHtB7oPux7nop9SL0XFEzSHYMAHz+ecO1VgTXmnrPE+ntEgugzbwGHYmo6hyMY/n9djAhKIF/+Ph7n9I8=
Received: from BY1PR0201CA0026.namprd02.prod.outlook.com (10.160.191.164) by
	SN1PR02MB2016.namprd02.prod.outlook.com (10.165.227.136) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Wed, 2 Nov 2016 16:42:46 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by BY1PR0201CA0026.outlook.office365.com
	(2a01:111:e400:4814::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Wed, 2 Nov 2016 16:42:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Wed, 2 Nov 2016 16:42:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycd-00037c-5W; Wed, 02 Nov 2016 09:42:43 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycd-00037U-1q; Wed, 02 Nov 2016 09:42:43 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA2GgcC9029059; Wed, 2 Nov 2016 09:42:38 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycY-00036d-02; Wed, 02 Nov 2016 09:42:38 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 2 Nov 2016 09:41:10 -0700
Message-ID: <609fbf406b3c1fdd159585301568dd05bfc5f1c9.1477599721.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477599721.git.alistair.francis@xilinx.com>
References: <cover.1477599721.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(63266004)(626004)(5003940100001)(81166006)(11100500001)(50986999)(81156014)(8676002)(76176999)(19580405001)(47776003)(19580395003)(50466002)(77096005)(5001770100001)(92566002)(36756003)(48376002)(36386004)(586003)(87936001)(2950100002)(575784001)(9786002)(305945005)(189998001)(356003)(8936002)(5660300001)(4326007)(229853001)(106466001)(118296001)(2201001)(33646002)(7846002)(2906002)(50226002)(6666003)(41533002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB2016; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT005;
	1:cUy9dgNWuU/aiSFsg7dWoBWelSCo/IxRPsO+MuK4wk+AFR6HwY/TGwtXwSRnfI+/eP96vUuiFCTyv5G6WsqxCLPYTmvo4NpfdJ+6N9TaWWOcRrdoAODL8onAA3Q2/r1DNeeHMBQ3cnWdWvID4RGF8MvBz1RL/NisboHA0rigw0CrX4sOVREwcst269xpNGdjlAghPP4IWwAWeARc8POvwj2fsl3TNqL+8OEra7RiKXsWpgBWmwUH2PVkvG1VH++ejlhTdwORL3qnUitUXon0yWjrN3mb7MmcjkQvwNwJGKHH+Mx6z8gOuOaQlESyBxXIcqBq8yISyEHfWDPU3X7z8JJQFWHv8mWzfM7b41BOxN7I/U51wrofyB9Wp6yTR0nodrqIrLEdMRy+7pXd3wWu8nScHhgyktqcNWyX0Nq+qlLfRKSIt8DRDFNulyvkLwaaWbKsexsl4jf5wz3tnJZz1toJtxKtA2x3PkcEJ3JQZnhmbmg9oD8fnGiG9p4ND2fHlF8YUOU50gwDF1XVrX6kg2IVc6eC1iV+1p6+uIDAQ2zH9S+tTh5Re+me4BdweKIYOY/ANOvuDy/GOJSco39ZcalSSuUHTlrHo7xAKYRDxm0=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5b78ea93-7bcf-466c-8405-08d4033f460d
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2016;
	2:tSfNR90rKjni8Y7ek/aR7JWrfrryprxUSzGC84J8hYaE9fEYScOa4LCPxWZym5ZCM3FvkEP4UZ6/FsFUrhEQwNvooWoDTUHueH1uLyDQf5NUr2Zgrhe+EqCiWf4O9EDgQQAyCGFWBvH02iguy8a4YJ2wgDCWJsRoQgqgNRhUz9gD5d0mItUdn7UXOrC3BdcxvsqBXHMl1Auzt/jIjuVbtg==;
	3:/WLONEr5n26bdb/wNH9vuxp1A1vu5jQNzgqyC2Uy62jieQ2e41xhNHpEh1zjtM/wm3LKUga68Gtsg4V6T4eQuHxRzvtG4+Hr+xWqbaBKM1F2Q043XVCOTFNdwpwl+10NOAQjGAKQekbUt45xyAxAaIL2DvSWjhssdM66dc/7SaM3ZxhPauJkksMOUeV8K3LEpT895qwbEGxN7DQhyeniYAtUwedaJtHHTZFZOwcGs9DkdSjpwddiO88p8EWwJTdC4U8h9apIT9GRH18osdw2eg37WDs7t2NRM/3Wr9BNXyw=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1PR02MB2016; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2016;
	25:yHFU4liR+ipy3nSeOxNkPYrSmkEBMo41P+eN4uDqcLwP8LFPXYDhnEgwRXz87Xv0l0hjSvL/U/BusouVmHnJTTD4mQK4scjkRdxuzcNKG8nk87oaP7NX4f/WZYqVb3jmwwh5cxdBUpqi3ry1NbHGm3hPsk3pfNSd8hD2p7I/kJtBcl+jBe7F3v/ptcq/NvDouElzyU1PExyB7VbfadHEKY3OBkbgoHShdeRoEhpQ4ziNQO661LnvvynB5QxT48u6SsyyVzzXHcYD2XTowk055aplIUMwT3WAMbqeAW+lAw9/fUXameHQi10RAZGERHSQu4oxOY7ESoUOu0ZUdYc/cxmZUGnaZg6eLQVIRDYL1/EHlgDEZFy1+/4Ay0VFkt3z/NyDEfI9eoj+UH0Gj2puaTZe5wW1F0hAAOyBtNpMz/5a40sZGNWuuGEuKt79AQNBzBAqvZRyyTf3f6NduoKV7WMytn0j+KbRFBZpkmv2EjaCw12Me/MSIDJ2HQ/q1Z8zqAcSBRmbK94v+hG2XYeszskRLeO8lkYC6hlInjv9GoRyrctH9ytqJMt5zFhh2WBq+n7EQvYG8k6RKto3EBjvm1i/+ZzhqtDjarhDNVBfeammA/Rqq5DCvPUqME9dOxR74R9LPvxwMB09L0XGqI7XJLh10sSWW7T+bvJ22gdF08YnvcBWvp2vxp50vEDffcaL4MPAUwRIjCTU9rbseQBNqr9qHQad7lL6PjJ1r6z4ifztRjqjfGg5nzeIOgL8YzCR8Tvn7698ZsPIBS0EIq2OpaG2q0Vf9JwPDwNqPG8r/jadQWZcEMfb0GQPajPQhe093ty4pnkHCoRNCYa+8eYsxw==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2016;
	31:+rta0M3J8v5M9tMGulBocHXCR/EOyuKUNQlXEKuZp/LqGJTj8oavceznFE5mviX2GNOEdXSbJULUjv0trUlA5zTyV4qr555pWZKCA49rHszXzhgudJ3FWDvPLeHL2lsdVJxDYn7xmO7pdckIDLIc0UBDcGVxdVZC+yqnoolf/TeSikMaJzePKkD6zgAAcmDPoHmQm0HC2Pq3qSVI2wPsAXTv7Cpfwsw1qbbT/4LaZxfFGclgi+MqzfdVnxS8Fs74OQpD2bUNaERISQ1Iz8FyHw==;
	20:Tu1Rs4a7CUwQ01OagZnrr+vTmteBV+L+HS4fN/4c7owQKJ3/YBhu/YbJ0TKNS0FmgGnQaXYj1dRzRj9XblmU9SaJ1zfJ1VerZc6qaGdtuB+I5KaWeCPfmmqYnlpp89HFUHCY0/f3M197TV3eIghAwaFLmZfz5sI0HvOuTAHG4s0MDK8OKZ7HCdNQAtTnS/mR1IMA6k87ZTspbUu0bPk84BqxXqPc9o1+3IBIXI0CLsKYoXPugH9T7pM/yvU1wLc3KrV/DQCdslMOfpIk7gO0FeljdNgGd03rRUXWBUF1Ywo25B/gH5f1v6elPDqS0FA5sRFF/ml0bUrLofbqezUPCKDv8hv0VBpHbtcYmDzzYygY8fEickLyTu4nHaxq6US1l0ygeu+HpXF6nifILDDtX9SiMbFUeld7VXp6AH31+hhk88NesTnYNGyrUlQ2aZGJsqYRVc5I6p/Y+CjRHQIzZ6HqVGHDq8fYTCPPkdA1Vd+/tMZywprCZ6mu7dIPV64O
X-Microsoft-Antispam-PRVS: <SN1PR02MB201696D5780FE872422220A4DCA00@SN1PR02MB2016.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13015025)(13018025)(13023025)(13024025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:SN1PR02MB2016; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB2016; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2016;
	4:eFjh3fJ9msOzZGxSs3vxtMQJOEmytFQDKNUT3XDgINo2K5Er1bu3EhclAl25ojnOpoJs4zuBY88ygjf3m96SqHsFIW9LaXdn5P2Ahn8Ys8Yi5svY7H4gDY3e5noo445LE5ANtv5JA1vXHzMLmzfTRVKaHT678V0SXqtkI1cQH4UrRUysbDmpQDf97cRJjdj58fpufNcOwI4UpDQcK8d1R8DzzE7fknFap8r7eCLZQl5NQdkpVhllZKuuH4T1Gy1mgIh2vDtcn3jyoNPnvuSuA1bD1+vEYE9l2mwjy/R3o7Qh3kDaLxuSeRy9ux0GRKI+/tITFPA+Hdt44ceD7yzgYL0TMnTvAQCnOMU45TmjFkOnbzzK63eBLYehfyj9tIUbwR8H3qESOyy4pJM4/BbFHwagOlAY9KTtZg5Z8/avA4tmn/zLOWwJuB9eFsJCbOmGCsY3sT4iXQMcNfQb/+oBFMPPK5p0CPFuE2esDtg9DTbdIFjsFaWaSMPNQZfSBrONIFpZZNuuLFN259rqhkmh7f5t8IYR+8dxaBEQx5mPDVp3W/2t1BHJyM/b/DFvLG9W
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB2016;
	23:pjUfUwfx1vgdnwWOxh8eFBPiOXyPCJkj+zfS4vkBu?=
	=?us-ascii?Q?ZznOB+mrXz8pdLdQ/2hdTvTdkwNeil9sQhNuSZJbich3VSCfDfXScyuD9asK?=
	=?us-ascii?Q?/zFnBgojnthLTfogVmi/qtgv2V43mqWYtEyuvvAttBwBbDO3qhtVhl39ULLR?=
	=?us-ascii?Q?u/Won54njo5YJuMQRP5F+M/fhdNy/f2LlMVPwU0MxcVrqXIG+CiASQvlAtfv?=
	=?us-ascii?Q?k1gn0KeN60blZNbxOQKS/+tI3yKGxx7kTSykCgH6YX44SuKsEfPsZTI7cuoe?=
	=?us-ascii?Q?IK7zzOrXDOIHioXBFge4YrgfOpZjQZNhnIxkJskk8RwQgcuVy2r6gp+WO5NB?=
	=?us-ascii?Q?mL1aCiwlACQkJX7XAbIgRNvNXx0uUMYUz2DPzm3Ie7OL0kLb6zFXqplmh3lu?=
	=?us-ascii?Q?5s/SBgxQUdm/5y+y2rBFbxKipNJzLngl6mwdzkL8/PrmcUeEDGio7ggWeD7q?=
	=?us-ascii?Q?pdDSYiW/2uEM4asXv0G9bIIl1nbr+y1tyC52PuhAVQkydzmemj7BqvPPWexU?=
	=?us-ascii?Q?f68ne4Wl1zvMxjKqSZHeQX6eTirOb221sjgMgdwOZDKj9ZRPYInn9mwYCuWX?=
	=?us-ascii?Q?2m3C0DIUzLMLm4fstgTj5nb9rldn2gMPbtzIq6CjdOKUJ+yxj/thv5ACdn4x?=
	=?us-ascii?Q?ThasL/KCP1iiTSWO2XP6LSk/j9/n/aouY5hOPJDBPLNN01IOubwGerHC+6At?=
	=?us-ascii?Q?fQVCgJ/tDiFvgbWG7SKvaYtArUB+gLUYsu07t9Cl9uQTo/o7lZ4DsENwR0Fa?=
	=?us-ascii?Q?25FFbH0iOwVy5inUIUf4lia06DME4xN4zZafFr/4g94its9AP/1vVZP3UMTq?=
	=?us-ascii?Q?f2TAlKIODTMGfbzCjbCP0mwT8k23BOQ92xnkEUMu9Fz9mI5wrTOncjJnTnzy?=
	=?us-ascii?Q?DNWD852Nw0aoIj761hBVI4ZeJmha0e2p9XYCN6+pDc+ap1rtX/BWVsSKzMMn?=
	=?us-ascii?Q?Nm5J4bUJyR2VMGLl3S8vWxhYx1KLnB9bDn/ixq2VXXl4el48jiuXpJXBpHBW?=
	=?us-ascii?Q?gWwCWTvbW41/q/kvtboqv+Poql2MfzJnN1dLdqFoyLNcUbhuTeJHIAmN8iJw?=
	=?us-ascii?Q?efOxzl9OZoOyjINgi3o6wWQBkfA/YGUaw7U1m9zw1kVplMIeaRs+qAFPiLtP?=
	=?us-ascii?Q?Ua21A8i+r7uEV8iAREqlNquV8H5vlDC?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2016;
	6:TWScodSSPNVA6ReXkt4A5Pj1RAPS3zqSdyGIG7XB6oW03w0lhy3TaegPLS2+GJEtIAG6nr13IBa2tZDQtUVP6Kfw9v78JjXsfdroKFRvThNlN5k8o7kQTAkT/VDTCUta99xNUII7J+fRb9GSWORU8oxGrfVNvQVOOd4yQYzkb+c508gTZ4qnIeUSQjlbh+UORRk/yXSL+Qvcpff1/jUjBATylchM4TTIjyKzVek2xmtyKb4MDjqGXUOQiXhXbwhbK0OdT4HTSz+GHc982ajOF2Z9TDYxwlarsMVfKcdRMfkusrSOHkohVCAJrd4562wXtUJP9LXtADkEl1VxJC94HzB723NUTScYjzyrrJnuhj4=;
	5:UNJ6Nr/hvTLliA74XpM427D4imV/5TYA1NRgwOY+55bgyXLMl9gTnOm5a8oAqQ8uf/psvuVRCO2fnSA0u9dd1JucrHSn6Zaw0h9tlMi8l4Egtss+w74Bkx+Bmylzsf5OZth08dU/+xwl4DkjK7M3hQ==;
	24:5SsjvA99qGc+HL7BVztMLro7X7xgqT12brUFT1IvfvDeK1X6TtKSTrNgB06Kip9qyaOcIFXgbFs6O5DscfnRqlaDhrJHycoSMM6fMu3bYFY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2016;
	7:QZOnYlKWWApvsABma81aPGwm79u6JlaGXXFKvEXfAPPAyUaUpcBqnIMZ5argk3nx9wh0gNFan04lHRPP4jDY6j2XVOoEFUAjx7h/ivMAjZrgdCQqzVdO2vxqXL9clU2Zg4DHvRtK1C2ftZrzuDPqjedU4gY33fFvnxwP+oWVybaMe72vBbfnAJhg746VLSJv7bIWW7DwYUlaSsCt+zMs916zuKqUFaABwLJMTr6MRz5UE3SEinper84XP1idUOJtsEUhtsX3nZzXGlyC9jId9O+eMwDOOr9chAX3U20M59J0xKuSIcHHu+yd/frFnfv8zrN2+T3inS7S9jfs4PDQ8xJ/8vxRa+7UWrSRqLRHJ9s=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2016 16:42:44.2633 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB2016
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.66
Subject: [Qemu-devel] [PATCH v1 1/2] arm_generic_timer: Add the ARM Generic
 Timer
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
X-TUID: RXgFezDJADHD

Add the ARM generic timer. This allows the guest to poll the timer for
values and also supports secure writes only.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/timer/Makefile.objs               |   1 +
 hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
 include/hw/timer/arm_generic_timer.h |  60 ++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 hw/timer/arm_generic_timer.c
 create mode 100644 include/hw/timer/arm_generic_timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 7ba8c23..f88c468 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
 common-obj-$(CONFIG_IMX) += imx_gpt.o
 common-obj-$(CONFIG_LM32) += lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += arm_generic_timer.o
 
 obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
new file mode 100644
index 0000000..8341e06
--- /dev/null
+++ b/hw/timer/arm_generic_timer.c
@@ -0,0 +1,216 @@
+/*
+ * QEMU model of the ARM Generic Timer
+ *
+ * Copyright (c) 2016 Xilinx Inc.
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/timer/arm_generic_timer.h"
+#include "qemu/timer.h"
+#include "qemu/log.h"
+
+#ifndef ARM_GEN_TIMER_ERR_DEBUG
+#define ARM_GEN_TIMER_ERR_DEBUG 0
+#endif
+
+static void counter_control_postw(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    bool new_status = extract32(s->regs[R_COUNTER_CONTROL_REGISTER],
+                                R_COUNTER_CONTROL_REGISTER_EN_SHIFT,
+                                R_COUNTER_CONTROL_REGISTER_EN_LENGTH);
+    uint64_t current_ticks;
+
+    current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                             NANOSECONDS_PER_SECOND, 1000000);
+
+    if ((s->enabled && !new_status) ||
+        (!s->enabled && new_status)) {
+        /* The timer is being disabled or enabled */
+        s->tick_offset = current_ticks - s->tick_offset;
+    }
+
+    s->enabled = new_status;
+}
+
+static uint64_t couter_low_value_postr(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    uint64_t current_ticks, total_ticks;
+    uint32_t low_ticks;
+
+    if (s->enabled) {
+        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                                 NANOSECONDS_PER_SECOND, 1000000);
+        total_ticks = current_ticks - s->tick_offset;
+        low_ticks = (uint32_t) total_ticks;
+    } else {
+        /* Timer is disabled, return the time when it was disabled */
+        low_ticks = (uint32_t) s->tick_offset;
+    }
+
+    return low_ticks;
+}
+
+static uint64_t couter_high_value_postr(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    uint64_t current_ticks, total_ticks;
+    uint32_t high_ticks;
+
+    if (s->enabled) {
+        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                                 NANOSECONDS_PER_SECOND, 1000000);
+        total_ticks = current_ticks - s->tick_offset;
+        high_ticks = (uint32_t) (total_ticks >> 32);
+    } else {
+        /* Timer is disabled, return the time when it was disabled */
+        high_ticks = (uint32_t) (s->tick_offset >> 32);
+    }
+
+    return high_ticks;
+}
+
+
+static RegisterAccessInfo arm_gen_timer_regs_info[] = {
+    {   .name = "COUNTER_CONTROL_REGISTER",
+        .addr = A_COUNTER_CONTROL_REGISTER,
+        .rsvd = 0xfffffffc,
+        .post_write = counter_control_postw,
+    },{ .name = "COUNTER_STATUS_REGISTER",
+        .addr = A_COUNTER_STATUS_REGISTER,
+        .rsvd = 0xfffffffd, .ro = 0x2,
+    },{ .name = "CURRENT_COUNTER_VALUE_LOWER_REGISTER",
+        .addr = A_CURRENT_COUNTER_VALUE_LOWER_REGISTER,
+        .post_read = couter_low_value_postr,
+    },{ .name = "CURRENT_COUNTER_VALUE_UPPER_REGISTER",
+        .addr = A_CURRENT_COUNTER_VALUE_UPPER_REGISTER,
+        .post_read = couter_high_value_postr,
+    },{ .name = "BASE_FREQUENCY_ID_REGISTER",
+        .addr = A_BASE_FREQUENCY_ID_REGISTER,
+    }
+};
+
+static void arm_gen_timer_reset(DeviceState *dev)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    s->tick_offset = 0;
+    s->enabled = false;
+}
+
+static MemTxResult arm_gen_timer_read(void *opaque,  hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    /* Reads are always supported, just blindly pass them through */
+    *data = register_read_memory(opaque, addr, size);
+
+    return MEMTX_OK;
+}
+
+static MemTxResult arm_gen_timer_write(void *opaque, hwaddr addr,
+                                       uint64_t data, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    /* Block insecure writes */
+    if (!attrs.secure) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Non secure writes to the system timestamp generator " \
+                      "are invalid\n");
+        return MEMTX_ERROR;
+    }
+
+    register_write_memory(opaque, addr, data, size);
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps arm_gen_timer_ops = {
+    .read_with_attrs = arm_gen_timer_read,
+    .write_with_attrs = arm_gen_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static const VMStateDescription vmstate_arm_gen_timer = {
+    .name = TYPE_ARM_GEN_TIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, ARMGenTimer, R_ARM_GEN_TIMER_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void arm_gen_timer_init(Object *obj)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
+                          TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), arm_gen_timer_regs_info,
+                              ARRAY_SIZE(arm_gen_timer_regs_info),
+                              s->regs_info, s->regs,
+                              &arm_gen_timer_ops,
+                              ARM_GEN_TIMER_ERR_DEBUG,
+                              R_ARM_GEN_TIMER_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                A_COUNTER_CONTROL_REGISTER,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void arm_gen_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = arm_gen_timer_reset;
+    dc->vmsd = &vmstate_arm_gen_timer;
+}
+
+static const TypeInfo arm_gen_timer_info = {
+    .name          = TYPE_ARM_GEN_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ARMGenTimer),
+    .class_init    = arm_gen_timer_class_init,
+    .instance_init = arm_gen_timer_init,
+};
+
+static void arm_gen_timer_register_types(void)
+{
+    type_register_static(&arm_gen_timer_info);
+}
+
+type_init(arm_gen_timer_register_types)
diff --git a/include/hw/timer/arm_generic_timer.h b/include/hw/timer/arm_generic_timer.h
new file mode 100644
index 0000000..4cc0ac9
--- /dev/null
+++ b/include/hw/timer/arm_generic_timer.h
@@ -0,0 +1,60 @@
+/*
+ * QEMU model of the ARM Generic Timer
+ *
+ * Copyright (c) 2016 Xilinx Inc.
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef ARM_GEN_TIMER_H
+#define ARM_GEN_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_ARM_GEN_TIMER "arm.generic-timer"
+#define ARM_GEN_TIMER(obj) \
+            OBJECT_CHECK(ARMGenTimer, (obj), TYPE_ARM_GEN_TIMER)
+
+REG32(COUNTER_CONTROL_REGISTER, 0x00)
+    FIELD(COUNTER_CONTROL_REGISTER, EN, 1, 1)
+    FIELD(COUNTER_CONTROL_REGISTER, HDBG, 0, 1)
+REG32(COUNTER_STATUS_REGISTER, 0x04)
+    FIELD(COUNTER_STATUS_REGISTER, DBGH, 1, 1)
+REG32(CURRENT_COUNTER_VALUE_LOWER_REGISTER, 0x08)
+REG32(CURRENT_COUNTER_VALUE_UPPER_REGISTER, 0x0C)
+REG32(BASE_FREQUENCY_ID_REGISTER, 0x20)
+
+#define R_ARM_GEN_TIMER_MAX (R_BASE_FREQUENCY_ID_REGISTER + 1)
+
+typedef struct ARMGenTimer {
+    /* <private> */
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    /* <public> */
+    bool enabled;
+    uint64_t tick_offset;
+
+    uint32_t regs[R_ARM_GEN_TIMER_MAX];
+    RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX];
+} ARMGenTimer;
+
+#endif
-- 
2.7.4

