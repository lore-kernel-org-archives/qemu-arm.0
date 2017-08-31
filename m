Received: by 10.223.188.70 with SMTP id a6csp258013wrh;
        Thu, 31 Aug 2017 16:38:25 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7tnHm3ZlW8K5Ja0BYlrOd3ha9AD807XKi1QkxcvBJicUdOu74DtlwqyCn4NYCgkG8+nE/X
X-Received: by 10.237.35.220 with SMTP id k28mr143337qtc.337.1504222705094;
        Thu, 31 Aug 2017 16:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504222705; cv=none;
        d=google.com; s=arc-20160816;
        b=EYrScBd8J6sRBFvvvkD86u3N2EsXdCdsF8wPan820hbm9FxR2bDUoGjezQ3bF3Bzld
         0EaX4VGDSLuBOSKwbQiSPV/EnXNOKaYNrAB0k0NBLTbANc13Co+/3hs1Q9InqjPMsPVz
         MVvWGyGlqGUSqDG+cYgUHUL+araSRQ312QWATK8JLsfY7KOTItKMeZVBN/21G+r62Bq1
         /K7yDAtLMLp5qaECKvu3mcxOInAqFAULJ+CoGkOiMgAaZjUrh+Wu+1OjuTm4V0mPT6DZ
         gjjly8XNUsJKWFNH1w6iytMqw5jwEhbyuR/C41sYWiacdQ62DKbVwvTRy18v5GABtmOr
         BrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=x7YkyGnBxvpc+7eLi5n8j/348oMlMlaEbKAO5sgr804=;
        b=AAYViRBouQB1VRuPfgd6Nb7LZ37iINYMUkruWoU8IWG1Ie2pVz/O4cBB2FBUZ0at+t
         gPqG4OKWNs0VNjDc/Oz+wI1BYs+erWCMOKCyfsC2xkEekVwNLmn0Djwq6SrscDoDWKbq
         ih/W+hEiTGToagpIBszd27/cxtniqWoYDBckK1xVcCTCjJcILVlyfUKzJKXX3zeIREq3
         4LnG0lRUskiHx/pwviSTi8WsN8HteTpGkMWJAhBOutctXQlDU8mq0ovlIuldKz7LQRg4
         aID/ymmDagLejAcbZucaqAPoAiCn52Mo9qtWuQMhMqd105l9vAAQza9+lW1wOJtBeRtX
         q8cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=4w7URs+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q27si956247qtf.199.2017.08.31.16.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=4w7URs+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnZ2U-0003N6-Nq
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2K-0003L3-Mn
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2F-0003gR-N3
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:12 -0400
Received: from mail-dm3nam03on0042.outbound.protection.outlook.com
	([104.47.41.42]:55824
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnZ2F-0003gA-EJ; Thu, 31 Aug 2017 19:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=x7YkyGnBxvpc+7eLi5n8j/348oMlMlaEbKAO5sgr804=;
	b=4w7URs+KdQ3YxGyYZJAApnKieO1gG9Bp1/zG+qDPwYZpbbdIHQhO522JR19tDBRqhvDVlQy89JBB9xvQVlDlNPHEOwBb2ZiMyWm//NZt7uPOzx3UADpgSSTgkhjZQLmoO/MRrQODn+dClpqO73I/w+Ja5vge2EV1m572FnGmz1k=
Received: from CY4PR02CA0016.namprd02.prod.outlook.com (10.169.188.26) by
	BLUPR0201MB1921.namprd02.prod.outlook.com (10.162.239.155) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10;
	Thu, 31 Aug 2017 23:38:04 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by CY4PR02CA0016.outlook.office365.com
	(2603:10b6:903:18::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1385.9 via
	Frontend Transport; Thu, 31 Aug 2017 23:38:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 31 Aug 2017 23:38:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47854
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2A-0000CR-WB; Thu, 31 Aug 2017 16:38:03 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2A-0006sY-Sm; Thu, 31 Aug 2017 16:38:02 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7VNbxuk028339; Thu, 31 Aug 2017 16:37:59 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ27-0006rr-DC; Thu, 31 Aug 2017 16:37:59 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2017 16:34:25 -0700
Message-ID: <be926a221e31f7aaefe8558965a644a7ced817f2.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23292.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(4326008)(305945005)(106466001)(33646002)(118296001)(2201001)(626005)(356003)(9786002)(8936002)(5660300001)(77096006)(2950100002)(36386004)(6666003)(81166006)(81156014)(8676002)(39060400002)(50226002)(54906002)(5003940100001)(47776003)(50466002)(478600001)(50986999)(48376002)(76176999)(63266004)(36756003)(189998001)(2906002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1921;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT027;
	1:lEyCEDQU6wjvhGZqP2eoAjxb3LtS+a3hvnlpl31Ks0Nf/y7/4ZdZ5UDq/Siu/PQ/fhPXikqH5dX4QGI6bTCnr02PDmGnDuwAEca6IcfyqCm9iYz1btipn+9wY7g2YQWX
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a84dcc0-7c4a-44a8-8fca-08d4f0c95322
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR0201MB1921; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1921;
	3:kocvn2MAx7ZG9TMARN0dpCaBFGc8peSvGHvI84V6MFcZiVJGOTCivVd3G51W/iNejbUBacKojkHc+75u4RSwLF3uNKWAIF1QvCg4FPwja7KJGz1wgF3TV6pLkflK3uuzcSV8aSlRACJr/Gee768d51cGM9XMKvZ2RxleDicih41ZYPx65CnRhGZTnwfrHqITHYsQQwSyvjga5Al6en2Fsa+Lr3+/+HhFGSfmUrJXLgAgdaTPBvFcJ6B5CdU6BOh/AiT+IoQyZr0Fmm/Ih73IeII0Oor/hqziiSw4nz5rVMzO+Ktpkr6ty3TRqC5YFOlDldjB9XdZZ85zbayrLDcKa4w4h/2D4ke/MMAISebpWiA=;
	25:lKVZtbo7JC25IiMnKDX6CxAIzy/sUkTzMezgEp/pLPDN9vvJjIRwSq4besJYE8U8w6/0pSStqVJNJr4jQ528HGeG5JIahe7k762NHxXvcPSVLE9fVfvCdVpWCHp8x40of6en/UFrLuyQLdhWc+0kC+7nibFdjwqWmdxtbbEZaD7wOF3EL+Ao47CoyjE+FzS27daPsjOVGRYGeGAVP9jJuC16b2AAU1NvtiOx+na+Y7qHviOKSKnxFHnQqxJW6+K0AdiYO0B9RH16lonxcq2+f5RYuoyDjoADB3BdKpq0AlODsetBt9jp5Q89BXl0bGoi0hw1I+hWAjtOdACSrDtbZg==
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1921:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1921;
	31:rqkWmrJIwWg0eXYOsqgakeH4gBRb3bwbZewi14RFl0xRTPzAHJ8i1Qz2iI6/yC1dTg2vxcozM2ipewkZaDADzDTcLNd32q80xR57Tf1RC2BC+F8I2A2MgMLzQ9ybxUqB2BWpf2U7nmuECKFv/iYc76aD/yEWALIyC1K9M0G3eAoMKZG/OQDPqhRsw7ZX36uGkYao05ig61DrvAltG4ln9z33BLB0eqzvEjMXidd1/4U=;
	20:ivIDbZQ/EyLAr1OC7vsy9zmx7Az2PSaFbESrWdYrdjUFMF0BJYhsH2dAAbN8uqsm10KttQdYH9xB+DMUYF59FYXtmA4LfJSdDDr/Eq2cw4FwuXJtiBKRpwrhVdwoJBIFxFf6sMed9M9LzAXpnEd+HgE+Bc8CTeD4+8nO7nEAJ05AhkvSWEyRMlaFbVu0kOi+/7nLwEexKRog3bLIZpjDquwMNSvwCc0P8wfyGGV4CsasWa7cXRnRoQQBSDveMhAYEvvHe6/ImG1w04lJZW6JLp758e0pkimvkjw0RCjV8NpJNahpGJgY3avaKVc/a8lKMUEDQh3M/QhzEhEwoz6hL3NDkJKN6lKWwqHNBIRcX88zRRKA/81xeDaySemR63KZYenLZWy+uSxd9NzsIQYTcpmAUiN/dWuQ+Y1iAu0mt17wBzGJuorwCDlHUr5KPIklhSf1kW5BUVGRw8oR7Xmd0itp1X6536iAQZsXTnV5x/6VNOZA4SI4PutElTBS9pZ8
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Microsoft-Antispam-PRVS: <BLUPR0201MB19215123F050C967EE41D4BDDC9D0@BLUPR0201MB1921.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13016025)(13018025)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123558100)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR0201MB1921; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR0201MB1921; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1921;
	4:QIXIusVO3FCKRky7D61sJ7/bfWwRfue2a89/s+alcShPsCePH/+9s4i4xx7RGqSl/CstZE5eDG1XGHCqbDb8aFCpNNO0BYvmDuuqq9/UImsaPaLdHISNBiPvVzVUANSoeRgwHdNPrKMab5fZvvZRbmOWzLb7yZPgzRallJryRVilHKvHB0ifRXObNjgQnvbdIjZs3Gik3Ikg6gnr8/dcSaojV1U8O1VSdDeVcWgclowLV1GciH8AtFdqBlIVRcot9XeE/8bRFipMzI95PGHP89So51HwLcbA7KhPh6Ds8Rqop8Nf490hiPU2FJjgzQTTVWhV15JJ7eatiJh4jvOVYw==
X-Forefront-PRVS: 04163EF38A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1921;
	23:cDjBHJgalGWFP0DzZ0YgXzs82L/mK9OV2uubAMO?=
	=?us-ascii?Q?7tmYHPx0M2iaV0LqhG5GpKKciaGkLUCVoi33bJyoEVZpTkuQ7huoGf7IN2Vs?=
	=?us-ascii?Q?xIIn4g6BS//GaXECUTebSnwHX/Hy5rZKdvfOIq6QeVJU9nt4rrx7smYz/0IN?=
	=?us-ascii?Q?MWDRMSm9XPiFNlCv/VPARkgm6Tl7gdDf+n+OhuTt00fa0oYpyMa/ermRPiZC?=
	=?us-ascii?Q?wLMmyGIrZUkQ93nbNBzdE7JzA0Eb6/6rHxhJcrG3HZxiwLSW9D0h66boYAKm?=
	=?us-ascii?Q?F07bQSUoLjve6++W2Uer2+cyPuliZF3n1yE4tPMgvbdFgQHInS5sJmySMvWQ?=
	=?us-ascii?Q?mXLcTLR2G7YMf/k4MBTQnTqBEQZ8aeB9KRgG7TgtjxsWJxf0fzGF2lkz+MTC?=
	=?us-ascii?Q?STxKDlmBOkJvoO+E+4sXiMqhdFIdusl+TLL10IwksyQqRSF3Bl2XVoJxbjfd?=
	=?us-ascii?Q?724+MSTFvNxJqjnvoSaCc8GpX9JnnXQv8ik9rACNWrgWNfbHrzUAcbXo33JL?=
	=?us-ascii?Q?aQJbEicM94ju2zzLP/UhuR4a9v24fdnnBK5tlQd6pPXeOc8EnGVkoVBMVohi?=
	=?us-ascii?Q?u9CcrcCb3lWISM76iIeTVldA/bojdZ0MtSLFKhYASCOwgphtjJ5qguuPWiKs?=
	=?us-ascii?Q?yzDCWF8jP/pitsjq1zHPWWa2JvIjbQbLul3TatUXSFDnat539wSqx2/5TSqM?=
	=?us-ascii?Q?zM755ssu+PqEVkRPzHxEgxSuXQnytoQW7Qgz1inOn1Of50tLhbXkim8M2YE/?=
	=?us-ascii?Q?rx0J1jhaCsQfPVhvtJf7ZjG6NJ1CYHP1LPmAhvn2h45zMDfgLhz0zVPKY9lv?=
	=?us-ascii?Q?Fm9NvLmGqSxTl4k7hyuCXG7OI2qsAPWciSQ81oWVfbmCKBL6c4FqwY9PfgWf?=
	=?us-ascii?Q?Dvq+hhNddkJ8Tgs4tfTIQqfKNWbWRRAnya2yQcJCBoVEzC8WGVJ1tGgM9uQC?=
	=?us-ascii?Q?h9PLMuptHDGnBiciDLbyD0sgo73ewtmJN8nNPlP3SRkYurMfIVJXuSDp2Kbb?=
	=?us-ascii?Q?U2Es=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1921;
	6:+itiXlmnZ5EFgegC9cJd2/mXH/tmRmpJpMhPjunDIjCBZpy1ra/U/KGAQSXHVpfmRdtJ6tLr8RzvFeNOOZnbrPbJ3w47tczpaOXmi83oihdF2WwkrrlVgH9j2AUZkahUhJ/h77aANvK2zFR7J2AxGgLpmVO0tZQaX9UcbGf7ZlSN/imOX8+dcWXrX/AVCm9Rj5oMFAee39dNAAs6H9L2c/re/k0yjekietpSOB9tA1wpK850KLygHy6S2uromkb5GJXTGoV0w/5+WecYbNQ8sZdbbPnFZDYAl28G3rjJDLQzHQZzlahFDkB41NUOhRHq8BIaXp1JBsi7R1t+5+o3gQ==;
	5:OIVkushOhUnoIPSBCrBf1nTeVlxT7RxjrvNwZiyOTgZ0f/Jk3VcVCLHrZhj5Z/R4colDObeQend/uX2DmBwtUuF/6uehda9/knVXPrFICMSevG6Krk5HbNaVnWPBuDrKYaOy5rxd93g6A3Iax8+zJw==;
	24:4STeb2zowpFykElc91r7qm/cQCzfhlb7iAI+0miCCjrGKoRNADldSDbt7L06/p5+5v2HJ7WG01mZmAwYd4B/ByRxnJPpRVQhRJMSjHkxgDA=;
	7:/EhcYJGI5AYruZv4b1VUDG2dVsScfIslC51y8GXBSxe/C5lULdqmnq46GmUoffjUDZmEOKa1AkyXFmbGXymjgqJqx+kyV6YEkmqC8gzlgzOSfpKIGgEx75zZEJrD8qyJrlSv0lFD7gQ1LNLMU6u3dWGPaVrus9qhE2IiDc2EBdBp339DD9TN6a2P08LdpdIc2N9EGykLbwMMPaPLKGhmY8StYnVev4hfUnWGXyNOUAY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2017 23:38:03.5730 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1921
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.42
Subject: [Qemu-arm] [PATCH v2 4/5] xlnx-zcu102: Add a machine level
 virtualization property
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R+TSOTDHQQ4d

Add a machine level virtualization property. This defaults to false and can be
set to true using this machine command line argument:
    -machine xlnx-zcu102,virtualization=on

This follows what the ARM virt machine does.

This property only applies to the ZCU102 machine. The EP108 machine does
not have this property.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zcu102.c         | 30 +++++++++++++++++++++++++++++-
 hw/arm/xlnx-zynqmp.c         |  3 ++-
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 080507831a..40c1f5bbf6 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -32,6 +32,7 @@ typedef struct XlnxZCU102 {
     MemoryRegion ddr_ram;
 
     bool secure;
+    bool virt;
 } XlnxZCU102;
 
 #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
@@ -58,6 +59,20 @@ static void zcu102_set_secure(Object *obj, bool value, Error **errp)
     s->secure = value;
 }
 
+static bool zcu102_get_virt(Object *obj, Error **errp)
+{
+    XlnxZCU102 *s = ZCU102_MACHINE(obj);
+
+    return s->virt;
+}
+
+static void zcu102_set_virt(Object *obj, bool value, Error **errp)
+{
+    XlnxZCU102 *s = ZCU102_MACHINE(obj);
+
+    s->virt = value;
+}
+
 static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
 {
     int i;
@@ -87,6 +102,8 @@ static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
                          "ddr-ram", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
                              &error_fatal);
+    object_property_set_bool(OBJECT(&s->soc), s->virt, "virtualization",
+                             &error_fatal);
 
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
 
@@ -154,8 +171,9 @@ static void xlnx_ep108_machine_instance_init(Object *obj)
 {
     XlnxZCU102 *s = EP108_MACHINE(obj);
 
-    /* EP108, we don't support setting secure */
+    /* EP108, we don't support setting secure or virt */
     s->secure = false;
+    s->virt = false;
 }
 
 static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
@@ -200,6 +218,16 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
                                     "Set on/off to enable/disable the ARM "
                                     "Security Extensions (TrustZone)",
                                     NULL);
+
+    /* Default to virt (EL2) being disabled */
+    s->virt = false;
+    object_property_add_bool(obj, "virtualization", zcu102_get_virt,
+                             zcu102_set_virt, NULL);
+    object_property_set_description(obj, "virtualization",
+                                    "Set on/off to enable/disable emulating a "
+                                    "guest CPU which implements the ARM "
+                                    "Virtualization Extensions",
+                                    NULL);
 }
 
 static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9eceadbdc8..37a8bf2ccd 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -260,7 +260,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                  s->secure, "has_el3", NULL);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
-                                 false, "has_el2", NULL);
+                                 s->virt, "has_el2", NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
                                 "reset-cbar", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
@@ -432,6 +432,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
+    DEFINE_PROP_BOOL("virtualization", XlnxZynqMPState, virt, false),
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c2931bf39c..6eff81a995 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -91,6 +91,8 @@ typedef struct XlnxZynqMPState {
 
     /* Has the ARM Security extensions?  */
     bool secure;
+    /* Has the ARM Virtualization extensions?  */
+    bool virt;
     /* Has the RPU subsystem?  */
     bool has_rpu;
 }  XlnxZynqMPState;
-- 
2.11.0

