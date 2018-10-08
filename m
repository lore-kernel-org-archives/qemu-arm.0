Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3854191wrt;
        Mon, 8 Oct 2018 12:59:00 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61uOJA03YG0H0KMcYLhU8+hTbLPzFwXBjWGZy8XnxmjAnVrIANHdLjuLaTQQ3vHMpaiv41+
X-Received: by 2002:aed:3903:: with SMTP id l3-v6mr21179549qte.315.1539028740745;
        Mon, 08 Oct 2018 12:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539028740; cv=none;
        d=google.com; s=arc-20160816;
        b=gEoFXUELT9ox53mEM1ZWWWEMjpF2m2IL9O2Nk5FZfGZ+KnQpdGRIuzXpB5aMC4GR89
         xgi/tTudEeTKGThfbZJk/wM4Ha6xdR3e7L5kjaeimYeBDeTjjDzIGd3GttpAV9Nh2fbd
         XJ6Bgor8PNWFj63Xj8wBqH3ZzYao6Xrx6n0yGq+7Mbe7nQiWBFpC92Dg+qYanYif+AwI
         h+nUWSurEI8eSRCgLtPkR0P5tZ64q7ommSOzGSkTxVrgKkCKadLsLyP3+TfvXX4BHXZC
         RpKzp4HlMYzqm/9U3WrYLdVO02WZGqDYbE2jCg047rn0DDJ7dnCOLqmvL6NoAYPiuWTV
         34vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=mzSPd1TXP6+AnlvXq0ebbVYJFF1RaOodKFqhPYC5LN8=;
        b=TCg13J72t4bc9tBd+RJplTO1JXnfhlrn0WBt9ggzDuC7sPSHCpVlHgkWLX2JAz1N8U
         WYi5Ta2MBhVk6zRQLY+CdzOWCFnRkyCviTp61M07VRn3uNB/HMX6qTtlo3p5fg32Jlqr
         k8cM4ExGpgP7itzztIpESjSrCwC8pM1jznTc8QbhaZCYZZcpvjbtvvbME6VH9NBAxIKY
         slSA84inUlImiJ8XhNY07DvaNGTAHqKDU6tDSasOTaeK1J7KNTDBmld7qzadZhsCIWQo
         HxMjymjouCOuFxsv+HbWEIq35o7b8h6JDvwRXz7NzMbD7H5dVJgLuvqKHSG/G1AYjL4t
         tXTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=nhVTAW7n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w126-v6si3210228qka.53.2018.10.08.12.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 12:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=nhVTAW7n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9bgC-0003vF-BR
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 15:59:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9beK-00032Y-6m
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 15:57:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9beJ-00026w-42
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 15:57:04 -0400
Received: from mail-co1nam05on0630.outbound.protection.outlook.com
	([2a01:111:f400:fe50::630]:26950
	helo=NAM05-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9beE-00025I-Ni; Mon, 08 Oct 2018 15:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mzSPd1TXP6+AnlvXq0ebbVYJFF1RaOodKFqhPYC5LN8=;
	b=nhVTAW7nLM+4qkoP5WuB/Z2EKyWavVbSSpYEi06ERuPBHeaxwhLFceq7Ow7EDtmmFRki0A4kThWDq0mJS/WY6E/1gVHamzbakHzom/uhKvxdUYFUWOWoagHbUGOqAQMWOYeNy7xnua2yTEJhY8nevYc4PtoYFtFxDyUdMJso4MI=
Received: from SN4PR0201CA0059.namprd02.prod.outlook.com
	(2603:10b6:803:20::21) by BY2PR02MB091.namprd02.prod.outlook.com
	(2a01:111:e400:2c1c::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1185.24;
	Mon, 8 Oct 2018 19:56:51 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by SN4PR0201CA0059.outlook.office365.com
	(2603:10b6:803:20::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1207.18 via
	Frontend Transport; Mon, 8 Oct 2018 19:56:51 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Mon, 8 Oct 2018 19:56:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9be3-0006jm-3w; Mon, 08 Oct 2018 12:56:47 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bdy-0003ZX-0x; Mon, 08 Oct 2018 12:56:42 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w98JuYeP022366; Mon, 8 Oct 2018 12:56:34 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9bdq-0003Yp-A2; Mon, 08 Oct 2018 12:56:34 -0700
Date: Mon, 8 Oct 2018 21:56:33 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181008195633.GC4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-10-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA88T=VWXq5aSY2srgbo8PF7tLFJn-28nNpt3=ZGh5xM1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA88T=VWXq5aSY2srgbo8PF7tLFJn-28nNpt3=ZGh5xM1g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(8676002)(8936002)(6246003)(33716001)(81156014)(316002)(229853002)(9786002)(81166006)(305945005)(46406003)(36386004)(4326008)(107886003)(6346003)(33656002)(53546011)(106002)(2906002)(5660300001)(1076002)(23726003)(54906003)(126002)(6916009)(446003)(9686003)(11346002)(476003)(336012)(39060400002)(186003)(77096007)(356003)(97756001)(426003)(63266004)(106466001)(478600001)(486006)(76176011)(50466002)(58126008)(16586007)(47776003)(26005)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB091; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT053;
	1:HK8jKhkYbnqIsA+8cKo6IZQFl+JRK2ZpLxrxuWlWYXa1xfJYT/1Iw2rZ69mIumXz4A7LvrUh5f8kg4RNhwod9TUTMU6t5849xnPf6J2aWGYHYCnKb+raExgb3tU+uPpI
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2385be75-f173-4dfb-431a-08d62d583089
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR02MB091; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	3:rj45swDPeEqrJgJ3mb1bqoVQrI3qBtFzEAzSASqAKNu0hVWpX4ZtilnGRulWpjDRRd/146//J0QNT7KqLwFqAWH8QQaqtRwT1i+7+f3vDSVzyGgrHR5yS8T5x2RtA1FWGMswn+rvb3+ocyMNrHQGgOUll2De1qPjos1/v+p+OVTo1UZSD9auzhUVe/mCDXBO03U5vh3oDzbo8vI1W2V0ievynTWOM5nvY1XsI8E/7FRVHHrfNVc3OyrAKQ1xSkEjV8opVE/vRrvcLYgltz0PjAL4PP4pkCyLjOJ8TN04x8zOZk6U8fRPZr4q0jUdVSC7+wT22gJeQgi1mPdyzz7bbzea0IlKi24u7mxUMDfmmco=;
	25:ztBGAidK9j8/T5HbQfvueQjVtQT9qfo7jkGE+b/Z6cB24EUZorBMPKwEodLWp2kROOeJKr2C+YfotZAH1BLlIDnym49PpLkcfKzHPkf+DkMW/P8Gu+N+Bf9AmOECeY+FgOMRfljGpbMHCmKibHgrt8NEkfJdv6O924GJ951cTH8VMMzEK/20nP4qEW699878A46BE+GQRgCEfMB0TAQP5GoSOjnYC5vWMHAaVSMy0qdjhvguJNWYg/lDtzD5M3WXiDh8sZI6USczKR5H6emoDAJTWsbrP4pw/DXE0wCGqksoUwaR+se60U6+qQGYdkVbUrv1D1heT4xWiRR9yPGxOQ==
X-MS-TrafficTypeDiagnostic: BY2PR02MB091:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	31:XmUApMt1E6bX/ZQPLgPcAwL5id0/H9vRcnFsu7SMPXrkAC4hWvkqcCZhOuKCnK8Q/H/Ka6fn3YChfxfoRpKMZkRwOoOF7EQtM7qRbRu3pE/Vjm6t46ZyZAqbl+yLml2hIYTnPCCPRnWVdvMxa0djBTNzRAtAwnrO1Ku0ZwOnZdEloh3e8lLoAtPXfEJWbA/TAP48Ai6EBed3yjN9hhQOpMwLc5Ds9ijyoaxO+X6zrTE=;
	20:Hkn/eTsoySGGbMzSnrZqk7SHpZWI/QiQ4tDaRqtjWNxq0viAKO+6hB2uMtvnPuuxmD7siVRZ0WwZ0oDODRZIh1MkuTL+/2SDjiGbDPbGx/psim4KpLZ07Xz507W6WASwmxqHlcU6JOoS2vZ1xGzA1jWMx4ZbZXjwjH2XBjD6lhDDacLT4o+m0GG+CSwQTwnlYKCUaIaOcIFTirjVJbAPw16Gv3Va6HL7g6y2h8yvBJYJesltK8Z3JLMW9l0Ugg3MjY5SbZQDLSiSgzwBdvAPgB2J2zBAnnIw/kx5xZ598U166Xgmj5Rue99MohdZ+FKgqN77uXs/0MfWstlYl2rEBHA5uSEf/cgF7/WHBfbhJwhJ46AxhJSNutGLi/eBo0UqsJXFtpe0EkpM5qCIZX+Jsb4QlgddTyIByMqS+7/GjZ8aeMaLOe/H0l8A5w/Yz2H8+MO4hxHGTT3lhj1pR9QBclYfYezVaSX6cfLHoGvJCxMdh5CBpyq+LICCJXBe9cYq
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB0910EFAE87A401C63EF98BCABE60@BY2PR02MB091.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(10201501046)(93006095)(93004095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991055);
	SRVR:BY2PR02MB091; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB091; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	4:f+pdgPmrF9vlx2HylrSiQ+O5p+JarP2YVgI4oKKqPYdly0L5PHSKzddqcNgQxLWnjTyfr2MLQY9D8rjRqnffTOc4XxsP2gcYuoQYI4xQ3nwyAx5ZWn7Hq5HfntiyOJxW2oSWktuLkaVei49MbjpuxQ/K3QvxXKrqpcpIR2rcwEL2FiNnRCP8/D8r17asVBsQsqzPfLp5bY27By/TJbykDEoHV3DfUqbHD8c0ZdIQosxB7FPCuOcVZxvTSVOZ36g+KfYc0oVHBMGfdsB1PItHctnCnvQLXI2ArTk0tDGtjDyi3+oUUYfxPiLoypskzj8bGezTSQAe34genEBvDbuW5GIAPWdRRvn89GgSrsjnFjM=
X-Forefront-PRVS: 081904387B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB091;
	23:ur07GcGut2kOulit78Ixlf5yKoJmUCKvJTdGMXrnDf?=
	=?us-ascii?Q?KQcz/IGym4ZjbzqdC6YZ7j5HzVrhuTZpggwk1t02zRm8kwvq1XgGTdHkUOf6?=
	=?us-ascii?Q?a048O3KFEYwaL2vMb0ABfJB/ZHSkcOW+Qz5KFc5nlY1ZILgphFfisJJSHqhT?=
	=?us-ascii?Q?CqGLlkXE7hZJZtGeukT8TKOZE2w9pBDeLzZQwhB3pbP1LGUVu3L5URBF/RzT?=
	=?us-ascii?Q?MpzoK3g+obTFGIdCFaytg3AdH2UcO64Q7NjVngd6dUY4ODFnIgz2ULY5n6SV?=
	=?us-ascii?Q?QX/erYF0Z252zCYtOjwY4K+AAF7ptYL9kNePuhFvFxMHjDrjdxOmeJRNjKMp?=
	=?us-ascii?Q?p/RBLEZiYmG5FG9g+XqzlySPOFzep2BpO3GlPvRgyoWBCeSIK6Ib2gzDHfEI?=
	=?us-ascii?Q?o+Yj5shr1DQN5aB3BUghFpzHXzatCEBgV1ohGnD6m6Gs/alyIREV1ZSzELCi?=
	=?us-ascii?Q?Qv07afrbLXAC+vduqRMNcMMamkSHHJ5PEbnKpdYkTtgVSEm+DlvEc1iWDdz9?=
	=?us-ascii?Q?1qxKM4VV5R6LJpXn6FeEcW+FYLc4muVECzcuvvc9Xx99h6LRysGP6fcV30KY?=
	=?us-ascii?Q?UI2uCqs9+aWzUPFxRABIvBbollcszwCpmmh0cxymSQA8DvMpQpxzGUOjYOoy?=
	=?us-ascii?Q?/HczqlF+WIcXC4s9pT0oA030oXHbTqGv8NWWiwXsp/lZxT+8AmNGHfq1zUK9?=
	=?us-ascii?Q?OQkFyUhaam0z35qJeMo9rjzvHY0j+9Lobb3X0EiazdlF7uLmEuwWYdzIgdBd?=
	=?us-ascii?Q?+rK7Ck8wpIt5kmkdbqNaiPnbS3Iyy2BEBtlYrRPWnef8HpEmmMjcVMRmorft?=
	=?us-ascii?Q?UY8VI/AP3ufd6AVEV238+fHYLseHzgJiVmudhFMWySCzgi1EB35fAGbemvpk?=
	=?us-ascii?Q?o87NNbR9BgSSJyV1cDNdZM3AJG0Yg5OmaPD59UbDvT+kgZ1L/bHq20zV65+U?=
	=?us-ascii?Q?p6Dlz/mLXtQjNI2pFPA+SAAfJpn60ZWf0bVK15sgS3v6Td8FlftJBZulRqs/?=
	=?us-ascii?Q?2Q26gjA/Wcgw0hcRkmAB8L2QABmraJDWRcu4UNE5f/+JqMRN8HU2MYUce0H6?=
	=?us-ascii?Q?9uH4s9sLjq70AJovpwxLBCOSwjwWuItYUAk7e3vq0LKdcsyLT+/ncX9MY8ru?=
	=?us-ascii?Q?1cCkKYRT7tEs59V54oJc/7HfucTrAGrOTb4/sGgBYdtovnGtHm6WEp5ygkck?=
	=?us-ascii?Q?Ju1u8+pYWwstjiPMEzgjdAz6s4araVFlSkJGobFv/4qoIhZIMaliCa7CGPe6?=
	=?us-ascii?Q?6O9j9NwZ52G63p9lw8+llX4Z1BMfJA/03qxMoPJH9IuCXv5Bu3VDGWmx+P+g?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: wbkjACKew/GDa2tjstQXKLtb4vqNkYHELGYspdt/CwCIcZXG6N1TwYbkhgLEw1sY3b7tk05R7Zq8GZHeB1wbZX2+MDY3yWoUlFK5dyv41fpk0DvHCCN0b+C2CM3rCK7RnwjDILpMJpTLzLJk/mxrQV1Fr14nugB3sSfm24W61e8wIHGB7UW9ZX7VHvuq07nKp2CjRnk9+LRdzyWGn1d+mr39S+M5oe0jY4dboM7fjuSygj47Dcn4cH83Vbgr2ZPB7swnzK0NEBqrc8r/TkeYurBfznMh+pnxaNkZJiZOqcEL10FKfY2bm49kX9hTjsqksN+Gy8Bk0hxU8PPSHUybnmefUKMddQ8qTgErED5jfG0=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB091;
	6:0rqrRxWtRP6cutgxBVgQ5Xv1mGDuEN7TClhDf3Mrm8a5NgHAFiK9BaC8w5LdsbpwPLELZDd7Bfsywpt3s8ulqYehSLuvw/vH+otrCcYt1yRZkhYAtN9gmEVBaaWyI+AjfHwp2SUFaj2KRjME++Qugyn/nKtLjXq/r+pM1C7SSQg8fc0ASquwUl91qTp50QiJjh1RY0N/Q4hcbY/VHXVV7VPCBh4MtP/gpMKg9CXIPCandr6q08mC5yxNE7882Dqs8eJd1LE49RYQJp4T/vD6KV8n091zQIC2uq6WRFrCLzowWgUrEWPg2z2sN/CVmV3sDomxE/YKS2amugFG0EtyOaR/kkMtTlyHdxmMNTPCYprqDJXZ22+w3l/wZ1ZAGGd57g4rfe0wFPXA+AvMTk7Kk7uh8T5Toi0eprJ11GVW4hqJP3JcPK5khINEUhBoqTqgt/isO7QH4PrCO2OQY/mf5g==;
	5:T29zFp1hWd2j/gcMwypFjIGMpuq/6LV4fIlgGfE5LsDklopZpdFsBcMZaopNp3orB2duAcGf+HKDMIYVbthcUUDdh508w1TlaJyUYrn6XEy3prnBJ3FEOl3fpI6Ro5M0AHR80LY1X9/vbvxk4e5B1s8Olnfyjk/MoEAnFPbVhUE=;
	7:FdVGUe58RPkJYis/q5ruIx3vwdfhRwcCq7s4HpM426f0O8TFcpD4oMEHLRKoyaeJ3EGkNYRmzw1wY8xmWJKEGOuJkMJ/o8vum8apHyF4CV4wUvXZ570dTapDv/rWABC6PTMgCjS0ILMum21yNIUptz/NE8SYam97ac6dzBJQwbecYj4EXh3Q7vNuBQ9cFK/BcyDdQ7Rdiceszr+YENsvLS4m70c18H055GIj78izARCimJ37F3vg1bjkAtJyWb8Y
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2018 19:56:48.0738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2385be75-f173-4dfb-431a-08d62d583089
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB091
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe50::630
Subject: Re: [Qemu-devel] [PATCH v1 09/12] target-arm: powerctl: Enable HVC
 when starting CPUs to EL2
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hT6rZyGMBAMS

On Mon, Oct 08, 2018 at 01:41:36PM +0100, Peter Maydell wrote:
> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > When QEMU provides the equivalent of the EL3 firmware, we
> > need to enable HVCs in scr_el3 when turning on CPUs that
> > target EL2.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target/arm/arm-powerctl.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> > index ce55eeb..54f2974 100644
> > --- a/target/arm/arm-powerctl.c
> > +++ b/target/arm/arm-powerctl.c
> > @@ -63,6 +63,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
> >      struct CpuOnInfo *info = (struct CpuOnInfo *) data.host_ptr;
> >
> >      /* Initialize the cpu we are turning on */
> > +    qemu_log("CPU%d reset\n", target_cpu_state->cpu_index);
> 
> qemu_log logging should always be masked to a particular
> log kind (either via qemu_log_mask() or by explicit check on
> the log level). If this was accidentally left-in debug, you could
> just drop it :-)

Hah, yes this is an accidental leftover...


> 
> >      cpu_reset(target_cpu_state);
> >      target_cpu_state->halted = 0;
> >
> > @@ -103,6 +104,16 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
> >      } else {
> >          /* Processor is not in secure mode */
> >          target_cpu->env.cp15.scr_el3 |= SCR_NS;
> > +
> > +        /*
> > +         * If QEMU is providing the equivalent of EL3 firmware, then we need
> > +         * to make sure a CPU targeting EL2 comes out of reset with a
> > +         * functional HVC insn.
> > +         */
> > +        if (arm_feature(&target_cpu->env, ARM_FEATURE_EL3)
> > +            && info->target_el == 2) {
> > +            target_cpu->env.cp15.scr_el3 |= SCR_HCE;
> > +        }
> >      }
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> This is definitely required for PSCI and I think it makes sense
> in other cases that end up in this powerctl code with EL3 set.

Thanks,
Edgar
