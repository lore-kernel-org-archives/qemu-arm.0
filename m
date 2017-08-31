Received: by 10.223.188.70 with SMTP id a6csp259922wrh;
        Thu, 31 Aug 2017 16:40:36 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6oromBSlIOBFo3zZ7gxRgc1KyFRXXNfR+iQmoTfdvbE9T8SAUm5eCuVcwxYLj4cFjKFtJX
X-Received: by 10.55.165.148 with SMTP id o142mr146034qke.275.1504222836223;
        Thu, 31 Aug 2017 16:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504222836; cv=none;
        d=google.com; s=arc-20160816;
        b=TD6MRLO0G1IGcuk+SoEdSvC4k4+2VrfWzRRfI1E8zCcV6tIXNd6az8+PNhdsjz9J44
         m3HQOidx80kA0x5lkBWQWbkN6d7Gui/6E3qLEif0A7LxTlIMZkb0OpZYyI9xRqFryEBM
         fUABo7SZkqLMcUowUkAHJePDe6NCv4UJ/cgx1tXgawuniOTFPpLshyhfsOyBpmO+j0Bf
         lFT8LdBKVKzvn2wzSZTA2TqJmBe+q4Vwzpbp+1ZByBfEmAIRt1Y9kuXT26SQYzucIIAB
         ZSTgt3DiIfcP+5ZpH9snAOl3c+bIUQj6mjNs4ca8+VbwbWLEtOco749q7kWO+ojfvRiE
         EAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=jN+rFe3RGpVDVz9bnIo7t/7jAD/krMrGu5rMRk4yPnM=;
        b=xluA6hhmOHpBmEjB/ajKpJ70a6PCEz/m1NQpjt4Nr7v3RZHARkky01gGQ+7Kuf9o2p
         omEXjNG0wQVwBTKY3BRkaaIEdGAVilnkawevh26E/CVYxVTE99aHc4F08QrCCa9JG17Q
         QLSBbaUOuqL2qTO3v8Km3ruqcvvbtOvNf2w/GPS2aR91TZBmlsJvcQZT0Lb++VFkQwGG
         mKBSxSTEDif7jZ0sqrYCclu7Wj0+bBZhl4fGp3fn717TdU5+rNLqIInjR0LIxouFOxdd
         gcOvEl3DTIDzhLGdDRaNbuvTREbkuIvjFUEmAGzLReo1WyVXMdVrrCGaMNrayxSzpXSs
         VX7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=SlO3Zp0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si906519qtb.383.2017.08.31.16.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=SlO3Zp0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnZ4b-00052k-SV
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:40:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2N-0003Lk-CJ
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2I-0003hH-Fz
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:15 -0400
Received: from mail-co1nam03on0044.outbound.protection.outlook.com
	([104.47.40.44]:20537
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnZ2I-0003gx-6J; Thu, 31 Aug 2017 19:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jN+rFe3RGpVDVz9bnIo7t/7jAD/krMrGu5rMRk4yPnM=;
	b=SlO3Zp0IZS5agJiVagG+QBOcxWIoPVk+92K/nkJiu8k+rbyaqCANR0V6kKeqknkLH4eNTp5m4wt26jnRCj1zkTF/jdePvg3vV8SIWMa6bldIouZN87CNXrmuFBo67qbKkD/LvDy2OSZGIoUm7wkqbGgm3LgUGA0TN1g28DmL2dw=
Received: from BLUPR0201CA0015.namprd02.prod.outlook.com
	(2a01:111:e400:52e7::25) by BY1PR02MB1130.namprd02.prod.outlook.com
	(2a01:111:e400:52a7::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10;
	Thu, 31 Aug 2017 23:38:04 +0000
Received: from SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by BLUPR0201CA0015.outlook.office365.com
	(2a01:111:e400:52e7::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Thu, 31 Aug 2017 23:38:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT043.mail.protection.outlook.com (10.152.72.184) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 31 Aug 2017 23:38:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2A-00022h-VJ; Thu, 31 Aug 2017 16:38:02 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ2A-0006sY-RB; Thu, 31 Aug 2017 16:38:02 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7VNbsnJ026260; Thu, 31 Aug 2017 16:37:54 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ22-0006rY-91; Thu, 31 Aug 2017 16:37:54 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2017 16:34:20 -0700
Message-ID: <c99a1085201651b4c7239f4875ce073988b03c55.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23292.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(5003940100001)(50226002)(48376002)(39060400002)(4326008)(8936002)(81166006)(626005)(33646002)(47776003)(305945005)(356003)(5660300001)(81156014)(50466002)(9786002)(478600001)(36756003)(8676002)(36386004)(118296001)(2201001)(50986999)(54906002)(76176999)(106466001)(189998001)(77096006)(2950100002)(2906002)(6666003)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR02MB1130; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT043;
	1:yTkojHIGkf+OJBzv4ciEimqp5AWKO5OIHoFwC9H3++SOZIalDlUsrkvF3r0W4Cs34DI4si+x5M9Fpa5YdroiEx0Qb2CkkoSNK8IfPuGa6VxvNUALLZwOiJx5IgvSpZAH
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79367c19-b763-4a36-736e-08d4f0c95312
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY1PR02MB1130; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	3:LCVbVXSyaDcxvR5X31y9JRKjBhvqC9oQ8LoesEg45/RNi6/GEPRaGmHiuiPFzL/sngPx5iBa6eFjr/bB5i39QmXalIiwnxz4/miT+ImZWH+A4zCVT/rOudHa2vMdDc5t0lJnk5mOX7Qs0My3KlzO9plg26AHEaPWppfuoIUddDl4xy4g76yxdVu5eq+2nUt6R8JFk2VbK8mpWgjyoba5O6B4jd8KI7LBDwtXzfvNGLZxR8l4SJSx9CkIxIlAUXRooig2Bt4tdS02lb5byRVde6LENtueM34T9EUslr26tJPlGBDxapNMZ0hJ6Hc+Xlq3RPZvivDdRD6Q+CJZcFYDocqTbDzaIqaSFd2lTa9geWs=;
	25:mMCsHGZoJvoJam7BncmUZYZK9jhUXRButQ0CjskUqDYaU/EU7UNXP45M0diqmko+/6ExSyXOtG9RwtA+PpmPKZw6Sa+Ud5e3Pp8NWThQgji/TWK4vjCjZ6jZEx7pPd8f/7kJCefAFgUcwOrW4nSErJDXp0YDukoE6Er24sZbsQ3p2yox2chnwJMH+yAYeK47IuzYzlk+NPkZowAbDIPjjm0Ioz5epHgyI6kYq1J0QIoeF8IvtQLK8KisQ7o+BORZhf4KUQqFJZ/c5RN27t2DskS1ONAcTIpINY3zcn7X8sbOVkXgyjTYocOaI0mbsNJQ4z8AwLEHkDIjL4Hh3v/auA==
X-MS-TrafficTypeDiagnostic: BY1PR02MB1130:
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	31:eeRR8u7z3EQPtOIaee0Xf7Z4unWUdcLzn32BHLxw4RDgl0g4utjTQFz8jOMjvsWY6eNznCYnyVBej3BfqnKNJMBo/qS0uUXwvVmi2Q9YHH5X9Cbgy/3N1yTxme+TE91VA+TUAxzRDdJnKh0tkIz+k7nBXM8r2i9aWdPaW+d8Vqc3XBBb/Us3aDIWofn5UvrC6zyBvtt3G9MRBUveQDng0dxrd9z2eWjKpEahA7bGLGo=;
	20:JRJgzPBVq6U5YDRkpznrG+YHQeTzmtPN9SdhnfRdctKanXBbRhVWWiq8zjYYgozeN5VSaZ2/A4HrseJ4/xhtMoXg8UF5dX00Z22mA6fZT7qCrrBq9eI2sA5+hrwDTJLGGDSscNI69k9L3bOVlcSMMErcpVtHm50zH+mVRHowkwIQKZmPWAmmVF1H/NnORnqcemF/klMKdSBdXwrgX1hngm58A//mbUQV9J3xMARxiO552wq7lPFnY4Enivv9ANmdG5TXtwex/vRKYWSGUjuFhRR2D7N8H7I2lNAL8V5F6aTdFEXCFJMdFbrp+eFAoku/u61sx3MKCRwvXyxr2VhJaaIx/+jESQHftA6Mj3gnycX9uC2kY2IMecHGKQ9MisnDo0aCPt7khYeX/vd7mYiuJNrlSE7BCHw8vgCvES7Hg0bsMGFa5mMP2TFyiLZq5+OTwCVhDYjekWLC0gsZNhyExd8QGRrZj/Wt76sTIlEqieGQ2TUa4/MeBKe0r992KO+d
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BY1PR02MB1130A27D032E0D5DDE3D224FDC9D0@BY1PR02MB1130.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(13016025)(13018025)(5005006)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY1PR02MB1130; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY1PR02MB1130; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	4:1nopBlcM51tqsk6jT8NvrBnoK+6RJlfDua2KKbe5gQSVWLPCR5PPLJlxuSMtsdHlxnyhj9k6doAkG+qeyjJ038xYpySg4yWNtlWcko9Pod7cp3Lb2aT5XQNLE+LPEPtxMYvFtC9v4XeS7dCfFeZTJjaNZjLqdaqmLyjvNz4X8yv/3UidAYWJ78rcWzqFrQP7VrImhtkrZ0VckPONS+n1xRAWZl8spLdmxkz0xCQone3gIg+3mfRYxn/cG7F/atb5SvPcw+YRVDwJqj3f/rb1tVo4aggG/y4DWM6jkTe3Xks=
X-Forefront-PRVS: 04163EF38A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR02MB1130;
	23:RUERgJhSldet2SWZ+ZtwEefsSPJCwgfn8aMz3bVWu?=
	=?us-ascii?Q?zGgpc2dkq9bFbXQ9ZrDq8T0vuzJ6uEPca1OBwQP4VlfD7gUAbcxi66O4CHk/?=
	=?us-ascii?Q?VDNm/vZhIgFGceypnDyjpRVoVODFh0fz1SurUTVX2AgNuEFHHr9vp0jlWyB+?=
	=?us-ascii?Q?nxVRpc42nxbpbCW0ek4bC2c2ODyDg0pVpc1nfJ1wI/Hm7dZ31Bbj4igN1ehF?=
	=?us-ascii?Q?DYzZIZsPzthVHYcB/o+GkeBDbnzsDYaNePghCW0YiRwJuyS/9SklMmjPtyuo?=
	=?us-ascii?Q?FTuWorjVCcLHwaMNAp7UI7YvBOFth12SRveAU+bbewLF5zVYleICTK4AFXc7?=
	=?us-ascii?Q?4clVM52y00UwfI48firDqaJdA2FEzlIVPtUYrC1eEeGIWsch060D8ixOD840?=
	=?us-ascii?Q?HVrGcBXdw/lfjltbOxXxIvjj7hm3u4eet0TMTE3HZewe6kZLFcm9f0a2kKYi?=
	=?us-ascii?Q?88sb2R4XMo5iC3JHHMZFEk9+2/IGCGMwsIClnzMcZyKY8yN2TVXWWedbaxmf?=
	=?us-ascii?Q?LhEWApQ5Wmu6b3Q90ZY0Z9EdF/V/kHcL872P3IYkzo8hl1gs3T4lHvVlBg8B?=
	=?us-ascii?Q?FcakPhiDorsa+05R9ggzKb0ZTfST/K7xK1tuOOuHud/oSCTd5HEGCIfvNriD?=
	=?us-ascii?Q?6Y7SFQhCqNiENIl1TNaBU0qhEyaxTtgEKa6mH3jvsaepVzzaDQrXaAs/2wRu?=
	=?us-ascii?Q?zPCYDSOj2hSs6MmsRHP6LR1TOB2Q08j3V4gYJS5nlu+hIwvc4cO1OTd4UjBx?=
	=?us-ascii?Q?tdBosMddVI9xPQ3FpAhUubcXDGONm5i1AANUEBYFNQIlbmUqISIEV4rrre6c?=
	=?us-ascii?Q?MtERwnSZP7TZ3PZBls7dfhe8UQVN/NNhn7Qgx589nZc4buUFqk+C/hCrVB5z?=
	=?us-ascii?Q?bXClDBd4p4QO5vAfe238DE32xaaDvJIhhBWnhAMDmooqCHukFxGhYNIh83qX?=
	=?us-ascii?Q?pTNAoPoeK/f2qivBuea92zKKWx2ilLnOg8PV5+1DQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	6:RsMXc07zR42/BYoFfKn8rLpBqua+8mBeUIV0+xeZ2lkxnol03Qa0XBLE2qZnvlCKjUdB7ekttv18dFlSV4Ba5t+o8pU1u0mhsxc1uzlqkesAP/OiQ30dwu9phlJE9FiNJvD7Ch8LGxyCRnDU3k6IYrL4dW3YG4TbX96vl2Hdk4z6auXCT0YHmkQLVXXRAFFY5VjQ/h7bMgKv6eqX6R1rfaUwOzw4s4FJ+Yepptdbe/razn0bk/vHmSWZFbfK8nasz9aXukYosYdzGtddhH31oIRQfZ0yLHh1I5JPScYHP8W7Un7TeDSTfSg5qianOVxaZspF+9/tX/qEsRnWo+k4ZA==;
	5:D3UXM9y5XCN/TVgLsuEqCDiaAEhFTN3HyIvJI7rpPqswPL+DYOki98xg6PgMBfETJHcHOcsayd15+EPuWrktHw8ZMtCyQZiucKKSNoWnPT+AienoFBFKXl0+TowDs0+lQWac6yDgElLxPiE30QWyKw==;
	24:fCV+K+S5P29ktUlZUYncvMu24qdz7YasGTzqi6RCIt9xHkEfmMnYBGnrWcsjN9rFyUkkalUCMlJz1hIcCjAN8PUw4VbzacO5cPYI+aT8s7k=;
	7:e8xTUawUwijnhMBJSAkK0yDQ0NLYk4y9lrVG237rjm5yr9BmAHnWX08HzUGSvoQeEFB5gdtUDz5Tgc21/MizJfCMSeQ1/NKjcrhmVf7PD202yCxYubu+e6cZviwhyh2ueABUU4xy85bVlQsPOpBKd4SpKYSCWnpIh5n9kFeCnf+6OXG51DNgnsi+YP/bBvynyLHK/QUa3uNM8VGYopNckGTsJV1vy5CfKk2MqyoG14E=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2017 23:38:03.6080 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB1130
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.44
Subject: [Qemu-arm] [PATCH v2 2/5] xlnx-zcu102: Manually create the machines
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
X-TUID: 4SgPDI6VPoFn

In preperation for future work let's manually create the Xilnx machines.
This will allow us to set properties for the machines in the future.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

V2:
 - Remove stray newline

 hw/arm/xlnx-zcu102.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 133a6a31a8..03dcd67bd8 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -26,15 +26,24 @@
 #include "qemu/log.h"
 
 typedef struct XlnxZCU102 {
+    MachineState parent_obj;
+
     XlnxZynqMPState soc;
     MemoryRegion ddr_ram;
 } XlnxZCU102;
 
+#define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
+#define ZCU102_MACHINE(obj) \
+    OBJECT_CHECK(XlnxZCU102, (obj), TYPE_ZCU102_MACHINE)
+
+#define TYPE_EP108_MACHINE   MACHINE_TYPE_NAME("xlnx-ep108")
+#define EP108_MACHINE(obj) \
+    OBJECT_CHECK(XlnxZCU102, (obj), TYPE_EP108_MACHINE)
+
 static struct arm_boot_info xlnx_zcu102_binfo;
 
-static void xlnx_zcu102_init(MachineState *machine)
+static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
 {
-    XlnxZCU102 *s = g_new0(XlnxZCU102, 1);
     int i;
     uint64_t ram_size = machine->ram_size;
 
@@ -116,22 +125,73 @@ static void xlnx_zcu102_init(MachineState *machine)
     arm_load_kernel(s->soc.boot_cpu_ptr, &xlnx_zcu102_binfo);
 }
 
-static void xlnx_ep108_machine_init(MachineClass *mc)
+static void xlnx_ep108_init(MachineState *machine)
+{
+    XlnxZCU102 *s = EP108_MACHINE(machine);
+
+    xlnx_zynqmp_init(s, machine);
+}
+
+static void xlnx_ep108_machine_instance_init(Object *obj)
 {
+}
+
+static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xilinx ZynqMP EP108 board";
-    mc->init = xlnx_zcu102_init;
+    mc->init = xlnx_ep108_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
 }
 
-DEFINE_MACHINE("xlnx-ep108", xlnx_ep108_machine_init)
+static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("xlnx-ep108"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xlnx_ep108_machine_class_init,
+    .instance_init = xlnx_ep108_machine_instance_init,
+    .instance_size = sizeof(XlnxZCU102),
+};
 
-static void xlnx_zcu102_machine_init(MachineClass *mc)
+static void xlnx_ep108_machine_init_register_types(void)
 {
+    type_register_static(&xlnx_ep108_machine_init_typeinfo);
+}
+
+static void xlnx_zcu102_init(MachineState *machine)
+{
+    XlnxZCU102 *s = ZCU102_MACHINE(machine);
+
+    xlnx_zynqmp_init(s, machine);
+}
+
+static void xlnx_zcu102_machine_instance_init(Object *obj)
+{
+}
+
+static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Xilinx ZynqMP ZCU102 board";
     mc->init = xlnx_zcu102_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
 }
 
-DEFINE_MACHINE("xlnx-zcu102", xlnx_zcu102_machine_init)
+static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("xlnx-zcu102"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xlnx_zcu102_machine_class_init,
+    .instance_init = xlnx_zcu102_machine_instance_init,
+    .instance_size = sizeof(XlnxZCU102),
+};
+
+static void xlnx_zcu102_machine_init_register_types(void)
+{
+    type_register_static(&xlnx_zcu102_machine_init_typeinfo);
+}
+
+type_init(xlnx_zcu102_machine_init_register_types)
+type_init(xlnx_ep108_machine_init_register_types)
-- 
2.11.0

