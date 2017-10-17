Received: by 10.223.197.9 with SMTP id q9csp4840838wrf;
        Tue, 17 Oct 2017 10:34:28 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T7CsLagVv0qDOqwNZ1sEN8XjZ+5HjjLuhb05h5w13Uxxd0MV5PtpV4TtbWptAVvIn3d+K4
X-Received: by 10.237.53.17 with SMTP id a17mr20348181qte.223.1508261668166;
        Tue, 17 Oct 2017 10:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261668; cv=none;
        d=google.com; s=arc-20160816;
        b=Sj3pv2MXi3k2YuOBvuhxRmI92F/c9spZzRxPr5LpvIc9MXiyFsXQpKAxqUc1u8GfMW
         jGsOr29pFlwDa+lB84X2As+d3QXamMuBXcVokmvfMcVL2in8+LcxXL9Jrl/F2e1ILZQY
         g6cCC5YLlzpKFG2t1MeKZwyonWem7NoFVzKZ2Z6AtZeRXMPZfjK/dhg6+1re5LejThC4
         hkiFxNrsUmuw3/PWTaejCVTCb2Bz7OrcJhC8F7cUeQO9XBVR2tkr8VAozaa7k2wgcIQX
         +GYpOUDHMD7Rh6V5n1C00tcZ7sheXYZGFl1vjHex9pK9qTukHGPnkUIYZl6nBVxE3BKb
         FJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=ooFwvUhRqzPmsbxaakpa9kmSw3Bqf8yqRsJM+MhSmaI=;
        b=UgfJ4CPJflitr3MxHQcDkDADYSfprtYdudRjKsHV2xbj85eAUA1cumMmVC1/BwfQyG
         JO5uJCzHzZ+75Rxt5Iq2nCvwg7ZwgVW5hOu5VwwX+vFpneYUAZ6MdFsp/NGeWY+QnFPA
         C7cJFzMdCYdiKPPT8pZeiKSDoS+kOuJsuA1v6HPhAVrpAdulw/KHd5XzFFyrJKezgw1t
         QsGX0LRTvHVbysBPsfrXucAIWRVdxpdCmpVynrq9rJI8C6s5ChHiHP7OvOYo7K5Q8UlO
         LXpJwGEfYNsUwQ9hekd8Ar2+yTdRHJU+yHvdxFLBtVIyY6B2ADOViJud9KyB9imxcDDl
         r+vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=UzsRkDJH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j31si2506654qtk.186.2017.10.17.10.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=UzsRkDJH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Vl0-0005JB-8L
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:34:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4Vkg-0005BG-Nn
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4Vkf-0006Ra-PD
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:34:02 -0400
Received: from mail-by2nam01on0077.outbound.protection.outlook.com
	([104.47.34.77]:43861
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkX-0006N0-JH; Tue, 17 Oct 2017 13:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ooFwvUhRqzPmsbxaakpa9kmSw3Bqf8yqRsJM+MhSmaI=;
	b=UzsRkDJHNU3eFB+sxe08HQj407mFBXuQYsO2YlDEjFgghC+d9zowtA03dGy/QYPw3Yk3t5npWx/XIHUMJvTFfJxYgnDIBpYRk0U0xBpAvBQ9pyZ7TW6qDZ6y5BGK9lmxhCLstCKA3r+IIC9piqlZx79MK3eoWS+aHCyxbsP40Xo=
Received: from BN6PR02CA0080.namprd02.prod.outlook.com (10.161.158.21) by
	MWHPR02MB3391.namprd02.prod.outlook.com (10.164.192.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:51 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by BN6PR02CA0080.outlook.office365.com
	(2603:10b6:405:60::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.77.21 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:50 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55995
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0003jP-Ke; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0000oi-Ep; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkM-0000nR-JK; Tue, 17 Oct 2017 10:33:42 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:53 -0700
Message-ID: <fdad64bee58c8c460542a0316a066daad38d9ae9.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(39060400002)(47776003)(106002)(110136005)(8936002)(33646002)(76176999)(6666003)(50986999)(81166006)(2950100002)(77096006)(81156014)(36756003)(4326008)(106466001)(478600001)(5003940100001)(316002)(2906002)(63266004)(50466002)(118296001)(48376002)(2201001)(230783001)(54906003)(575784001)(9786002)(356003)(16586007)(5660300001)(189998001)(8676002)(305945005)(50226002)(36386004)(107986001)(5001870100001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3391; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT024;
	1:y91duGn+gKywlmtnC06r1r3RJiBkk0ssvZrP2Waz6fQ4AfxajII/8DzgvOAUBO9o3VwKYKgbijUns8vD7C05pqNOyH9LqH6nF58awh2XK0hwnYZ1m5ZRltor3i5GOkgA
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12325367-235d-40df-020d-08d515853ab0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	3:ncRnD6sppOTqhr53+09gRFxsOfHOMV6+zPurdiNmQ1Zv+g4BW9FPq/1MhpoEYSIa91c9xNMKGKo2DJi5w2v7k53vuhed0aPRkR9blay5neUtgdCZdPLbN+QeVwrnU/HTQ4JtttPfAnCov3ia5J3412qOieqdY9Wwdz1EEK2WOs38YttEM1h/xgVg0F09ifVzGA3Gj1VzQRoQYo/yVDqRq9FLPOr01KqbHbc5BkPyA+JOj6ntyeYV6nQ/pEOTAwh4wiQSP1MU8P+QQkRR6SVrgoQ9JaY0CPjby9ukcqfRNSFij93iXo6+lovAh8T7CmMXkCN60oK39j9oX9h/ps646eZPoI39iT9poUoaStTJdQs=;
	25:XX+1XNXBjr1OyHpaNkF8no8MhYt470AjdfRwuo/s8ozgGQgK2cHSMaX0lzSfTY1Y2gvQ2S7jmu0F2TzFPVdcw0NPLBvsrEAoY7cbqfgyY2zBExAJ9eN4LI0CdauGbfSXmXzxDIhe70s0ESQv1uFalhm+Gkj9TblWaCxSh5a1QESFwaVq0sjp82OF72oJm2IYExGa5MPDYijYIk97OD/xnCalQG8/nz53M9Llg4oM/wd3SkoGOI6JCIf1LvhYYqgAMacAU+zGijHiEyOgIOypkLCfGknq54ozBC55mb/pSl3tVE5IDVEdaiVrRKNcwtoeN82MnP2ckazeDp5meqXHGg==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3391:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	31:wbaXHUsIVkfDF+H8jiAsVIFupuchZ1TWNsz0kmVkgn+7CrjVqiGHIlbwpM+Gom7O+ZYA2IzfNwr5ehaqABevJhtwQZv3+ApwHN+VwC0JGrFUEut2tfgBdo5R2qLGZsPH+0J7xBaTeZz01yftn2MG42iIA97aCa1A93et8xpZo1mcv5HPgDrMsKHISgx06qnRBLtHvc+b0BF7H4YSBBII0bQ2SAPA/3raX6HdqrEYBwk=;
	20:WUzZEm5kLPo8FZFL5tERkRPNE6oVT06fN46In/q8twUA8sqxtloaw/Qtb9sLt/nd+ZeRbJs4tvMSQ7sAgLlocIc1n13fl1CAgZrdFbNkzNc4yMa+Fujma5gqsFr9W7iDuW9s/OX+ZGrgTrRyFsQByTjZsC/9tsSJCp7MrA7gDP3ynZDwTFkW8nYl8kC9MyTba7m2sPdUR3arvrmAPBiKN3EcNjQBXwVZ0MFRRfOxzkfZh1E3oelF7JpAB0ZtVJS+C9Q7aTU9+uFuiBRcKm6casZd9skMuJ+OUWMcL4Y7ETLol81Wozw9HR3QKsCt9nDX72uuWxg+51ClWMNGQCeiyFnFen4uEWfYuPX9Qtrnyd257/ygXnWhx6pUuWQjWFkCbGPy+e4hhWqA8Pgu0VUxobrghV3rKEIa2n1JUWgVvv9envQ6jwizywJ+Ar/ghq1osqypxlw/xsBYrM8XK8GF1BZIZAxKi69NEVl8l1wLtPnNJsFZKOyNiYOyJ5eMEjSM
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <MWHPR02MB339146E035C3977F0F501F96DC4C0@MWHPR02MB3391.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3391; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	4:EyTw+aZ7EA7vmwNzDjOGA8YXEsXb2CW7gWyeAFgOnyIoAgu/vX5sowbPRP7ZVAffbjZ9d4tOnR6ZIyCm1Nq4agUJf4q/56SG2IseJg+Mkq+ho7GnvyGnL4fLMNWvJ6WpkaQIZ3IO+IfmaPTOEZze14w+IqBJp3TxrPYhYGB3fRsot0Ps6TvWi5vuh0O0faKrE0nXM2eBzSykkIG3YeuJyrwT6vfF8GtFeJIHHOL8WV3uLGZI8sSpu/BMy8AyrWC6NoLRBrrlf3hsoUN6mOGdOX3iQYG4i2kyD//lFh9oVQZxljrsWLK2+1tID6wjUicij+DrdaZChh/T3zI1qyHYPA==
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3391;
	23:TrGlF+f7RkVA/W5D9nQR+JaOeDj8lu4341F6pwBym?=
	=?us-ascii?Q?oRfpVwnJAOc7WuNbhG3Uohd2OHtiWlHpC/IAFb5SNpQ4eNIfV0LruyHVF+l8?=
	=?us-ascii?Q?1slwj3axVOPhm8r9LCVeUAg6dzWWRTYnUsNdiqURB1mKRwPBmsrHPOXxcR5y?=
	=?us-ascii?Q?cT1UNmzl4NSSGuJYP/3a6BR+RND0cbhLtuEt2oCAbTcmhvNC6fp6UFedFAID?=
	=?us-ascii?Q?8PlVOx8nnU8h7THb7gC8+FwuhEHDum8/4XTVxLgJ7yHldjT6YBy1B9B7H+bL?=
	=?us-ascii?Q?tyVXk2rx75InHevy1cQEgUX7Ro7c27OpTYpbOuzclsg8zDdI/v95jZsN/mL6?=
	=?us-ascii?Q?Pj1O6AmAvuly/7z8ak/4VfzfS//K4iEYdoIeQBsT535p9l5IW6Jg/n4QIeDK?=
	=?us-ascii?Q?FifZkxUQrpApTgwfvCi9DP0QmML2QiGB33LXp48FCNEO5LNRhZ9nc4cMioGM?=
	=?us-ascii?Q?OTXcWac0eOasKZYHxLwIurrwS3JmmWG2ikFeWMT8VCCCWo8MfWn718lhOmdZ?=
	=?us-ascii?Q?sven/lI9FIUCn8UBEBmtJC2IFttT+zREs4HURmlEbHu1DCEg/A0HNJqtAkUc?=
	=?us-ascii?Q?F8irLFFYXW7KXqL5ekPS9fdgF8W4F/IDhDJx0PVSR197KpBDR6y1Prr2E2I9?=
	=?us-ascii?Q?GKbALz2j9Wgo1uVn58ChociRxfSZfUArfzcNVVs1tjr/2XSJnAp6LZxssXN1?=
	=?us-ascii?Q?CKuRxk5dNbsOBGIjSF6nloFPKm0pczoCPvIvCrFzksGK33Gsn7x7NdEzKfjE?=
	=?us-ascii?Q?w194LbjV39l/ao3z2pl0SjHduO5IQD06e+5vtCEsjqdb4v5hvZeXwDtWNkHA?=
	=?us-ascii?Q?jqMU4Vqg0VLei+RFZ35NzPFjCu/dkFOKNG+jVi3jqTthfg5b8npPhl1tGloZ?=
	=?us-ascii?Q?w8nVmraLWh2Y5L/HjNNMrjdXofYpPytTX57LfNHPv4u/yhsVt/vZzPmfWGkY?=
	=?us-ascii?Q?pLUTn7XFMDLQuVyPgbnfbbGIuzkdoHv+xW27qLchPkgBRvw9wwU1v+HaIht9?=
	=?us-ascii?Q?gAwOW2uRkmQQidVpiGpiPBG8ZeQQmE66kzYK997bJ8qc6YSIfhmI8cfdq5iz?=
	=?us-ascii?Q?SZZxbHqJmA86HJueESmejDBKH/n2qym9AM/6PKAqpOOfAkzY/TT1FmONE5WP?=
	=?us-ascii?Q?5FJh51XVihLbeFKM/JAwpPKEERyW22Z?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	6:M9Z3OYvsdqJvEHGSmH0DA3EAZlY+XmRP/LCXWV4PAlR35RRa7MW7M0F/elu9hhumoP+XJGewF8L8wkid9JgAdBhKDEQRv5DkXquCLq/6sJXCUcvlHuecp9JVgX+M2qixjZkPPe+zJl/aVpwpTk4zCyJdJueHfIbLjxjd5ZCJXrY6Ed0yfUf14qk9G/bg+5rtKazi8UK7ug7T/TX8gSV2kolT1bBB9AaEehmFfBvcg1nBBsGl9bhwfMamRRIC/jzOU03KMEw9CY173hpq6OI7UpYFIZDhhxXVNErPQoevcHs/RK3nN3fnR7hQCb7XfNnALBbpi8GyMW+zlMEZZYxEDA==;
	5:DaM6mKUrHMYlVr5kjVqOG2u63eNWg9Cs4/bo5zyKPQkhq871Lk4eVk2r1BGu4jxM4s3TnbVETm9BayKHa06FRX6VTOwidCsWHE2kpkrtB0ccqswZ6mod3NAAOCHXawrOo0I0y7AgvfclobKO/M8S21ZpWmNTzo1At6K+skdMLzw=;
	24:OfUsKf0ll4BYSIa1f+bGX1D0/vbaIHD0nOU5hSnvr0qv+wMeM2eEoc9iVNRG1ROZYV5hL8SqKvEehgz/G8Wfic9s5bb/w9LzRU5k4qcRtjQ=;
	7:eEvUWT1sB793aGHW6zOwdQc86qS4Bm1XvHxbI/l0+bOSMiaRVHfjWBR7yleyyUHMImgI14xF75EhCRz2zPt8K606uMriLqr15p9YMMB/ZiL3Gyase5KXNjql58r2QVYg3GRM59O2VnWAxJZ2hLlXgncs4EpnjZxG7G01KHgiPX1jjpCjj5g8pkRBbeNG0VbFP8OUnfRAJatTrbtPaBD5fsOWGpv85K7TK2/7kgg4UhM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:50.0365 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3391
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.77
Subject: [Qemu-arm] [PATCH v4 5/8] xlnx-zynqmp-pmu: Connect the PMU
 interrupt controller
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQan9H2a+YVY

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index c6a0b3b8a1..828eeedc9f 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,8 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
 /* Define the PMU device */
 
 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
@@ -34,14 +36,18 @@
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
 #define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
 
+#define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     MicroBlazeCPU cpu;
+    XlnxPMUIOIntc intc;
 }  XlnxZynqMPPMUSoCState;
 
+
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
     XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
@@ -50,6 +56,9 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
                       TYPE_MICROBLAZE_CPU);
     object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
                               &error_abort);
+
+    object_initialize(&s->intc, sizeof(s->intc), TYPE_XLNX_PMU_IO_INTC);
+    qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
 }
 
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
@@ -80,6 +89,21 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+
+    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
 }
 
 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
-- 
2.11.0

