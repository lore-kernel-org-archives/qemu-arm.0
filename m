Received: by 10.25.221.202 with SMTP id w71csp1448880lfi;
        Fri, 11 Aug 2017 15:21:25 -0700 (PDT)
X-Received: by 10.55.145.6 with SMTP id t6mr23397215qkd.101.1502490085505;
        Fri, 11 Aug 2017 15:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502490085; cv=none;
        d=google.com; s=arc-20160816;
        b=gt2BTlXDbF0t8XtD62JN8XWJKaTLpL2UkzHMdQld8ocnbzx6Jx7fQcbF4azxG92f2R
         trmEf3nyL7a/5UaZzitFZ8pZriSTv681+pFa+dVeU+KzH/437IPhqk1LdMWyhveuXB3V
         TR/DPuz+yFvyC7AKibVcQDHbtFBLpwzhVZ1ldZnQFgBj/MIgTBBfwY4S7apoigrp5895
         Zi2PELA/Moo4kEuYOGTLSBj0w3bND4wvZbwAyJvujpX7c8GwuK35IAP0k7DK+YLvbxTu
         sVQ7fcPn9aDb4R0VxfkbuYDeviKY46UfKlGn5hHe04uhiHKHFnq1pmx1JUuo2abSl39T
         qO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=BwRPzmgHrDpOisJpBVt/L6Vwsq47fQFkS/j48P/l2mk=;
        b=SQ7hjDC/GGDFabwbe9hawSCbg1Kirhx8iqOt9oKeRhpHA2ADfuhqOelAEofLAnleTO
         myfFe0A9J39/H7gyjkhgYbT/Mqa4ctIOIFz5scMPzO7xIHJhUJIW354mTExhOP7olozn
         JGKQyn9CEUUyFe+s/egrx7RDd34H+oXnbnaCzeddoWW8TAzkmrwhBuCDvcVxjWqQplGU
         d7VICPWTwuDX+OH615S6DvxCJ5lFJ/X5IIaqvsUx7T2dWeubjDqRHE5MhLoZQer9MT76
         yCcgSnEjRUSFoTvydRHRrOv1ZZyH4lG3o6zBEJe1Ax+uvJaep0H/O6FTMNL3aTxI9fdJ
         alKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=h6XYSJAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si1599292qkm.332.2017.08.11.15.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 15:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=h6XYSJAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgIJ0-0008Q9-Sf
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 18:21:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIr-0008PC-OD
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIo-0007Gm-KG
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:13 -0400
Received: from mail-sn1nam02on0057.outbound.protection.outlook.com
	([104.47.36.57]:40256
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgIIo-0007GM-B7; Fri, 11 Aug 2017 18:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BwRPzmgHrDpOisJpBVt/L6Vwsq47fQFkS/j48P/l2mk=;
	b=h6XYSJABxyC9bO1XyOviB0ObLCBkMS9xB6zpOYKbiPVuEc/M0SNS40NXsX2m9k8xy6gqgA+6G901q2OYIpaATQRt2lYk7szna3BxQWD5/b0FOkEyzjqZFgkQpFLND4tMLozUCiSPUfUkDF5x4fj0d/TCPTw0RGdfu5H3MtMAu9U=
Received: from MWHPR0201CA0034.namprd02.prod.outlook.com
	(2603:10b6:301:74::47) by BY1PR0201MB1045.namprd02.prod.outlook.com
	(2a01:111:e400:5110::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17;
	Fri, 11 Aug 2017 22:21:07 +0000
Received: from CY1NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by MWHPR0201CA0034.outlook.office365.com
	(2603:10b6:301:74::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 22:21:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT057.mail.protection.outlook.com (10.152.75.110) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 22:21:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIi-0006VY-2F; Fri, 11 Aug 2017 15:21:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIh-0006Ib-Uj; Fri, 11 Aug 2017 15:21:03 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BML28i011766; Fri, 11 Aug 2017 15:21:02 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIg-0006HS-1U; Fri, 11 Aug 2017 15:21:02 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 15:17:38 -0700
Message-ID: <885b354ba1e79510bfd6a905d62971c275645ad5.1502488636.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(63266004)(77096006)(2906002)(36386004)(4326008)(626005)(5660300001)(6666003)(2950100002)(478600001)(305945005)(5003940100001)(50466002)(48376002)(118296001)(356003)(50986999)(50226002)(76176999)(47776003)(9786002)(33646002)(8936002)(106466001)(39060400002)(36756003)(81166006)(54906002)(189998001)(8676002)(81156014)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0201MB1045;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT057;
	1:Ka+alyx2sI6OHrUT++3U9RIwuuqRYfQ0H4cJXx3SIlcx9YawM3QaGFmAKzGvxUDBJpvh2U+hiu/7EnLKG+c1BYw1arp3nBQllQeNvjbMdWmZ31Y1bQRDZNqXzLkv29NTBEtteWrVOPkE6SQq4FUiaTvNROtns6AmJhH2Q1h6EbF3osIaSA7GvDyJQWQYRh4rEb9uWwnX3+Pg9aLVjSvCKu4H6FKRtsFzNFre068pNNRYd/dVBCn/niHu0G739XUiVEP59NZmm8EPh77t5o8G9px/NWyk7Pi2Q7LahY4q7fmbtZccKfT+urJxeXPxMtp6rQeuKqGOPqkgrF7qP5H3G7k/Bw5QdbKJOnMw6tEe+uJyPQnteATSYodcqDUAyjFKWsSbhWVn/UiV7XfZnt5zL+almb+eJAZkhFsjlkjLSxF/tINdhDeVQ8xJUVCp0vVaC6+YMRaf4FVhOKWbLIdX72tkduqHPqHdcO9pKUmiCqYRd7F/DfwAfdfI5s/fNsLS+HTGR7xFiEXqn9g+cQRIn2ehIEBvAEHj8gw3HLtqr4mFemK8HodUgwEB5NGl/Q6DTNlLTmmvEsUY54egYwPyBRe14VTiJ4PbhCTu2dN8sJSgSsQ0lpc6Z5tFGQReVSLogOq7aFfAZpR+ZCw/e2XGxGZfnnPej0YADzKQpw27xsB8rvIJNDWUlGhrHXpkndQJc+XwAkcpxlOR0O776FA8GyKrMJs/ADx0tn41688TT0EhyHsOoD33wvIKZQ2jYvFyUhs6UXesC/lIwLdriieIYCtezUmv1a6l8tzBOv+IMaqqXtsHNc5D0rdtpxWwBpb4JaWsGBo6tpn6G5+MarqbSw==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3cd6071-4b12-488c-5b43-08d4e1074299
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY1PR0201MB1045; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1045;
	3:eyapd4tsB62sRU4Dxcr9MNj6ZWACfvmUG2t5W10Qp6yFhw/rUG37e/NggN7mCKh4uQJq6YMisEnvvczO1fmO6bCLnJH8QWExp0XtUUtsH7RU1FYeRPX+ys2qi5ITzJYxP1PTDmrqT7uDVZnRIseAIvEIGq7PC7YrzRCtN0OSRH3jcRJwBMZQ81w34cLZ/Ia3NclxAXU7VziQcHwYbTf9BkE5ZfDgBs99qLVo3kYNJWoFNsygP+ndhxs84XkSCwWUv/K/Xk5GzJcdJK2H240Dws3iptcAabW+08AQPG0MVyQqojuiQZO+QY8X+l0zmvBar/ju16oyZ8qAdOpzAcBTxY2+4JGNtBAuiReG+xXQ5Vc=;
	25:yN90ZaaA8PyORPMJGEmDkfXYqa6xGpoJzf9gFFoFmr05MHXLnLGIFe6TwCMo2+4952MJFp5TBl5CVZur/rnNXzmvILpVUrWjpYgn3g11MixGpyGXN0aGENO+28gtjHQFv1+2A2SLZ6zvFMtnLPxTmzxZE4CmnvsxTyIonfIqydeoeCy+lVkmWResiqOt1j6wxDIdAHUQic+BQulql4G47YEHTZVEdwquPvziSov0tyQc7lTlDeEXPcesoYsE1UZxKS3cW6/WrMjy+yYuQ7gh3Wcxhn166d6eofpxrp7GEvUKV6UotW0INmIwMThh8tmwcHTeR+AK61jZTSXM1jv5I70zzbJyctpobEHxS4yGIwo=
X-MS-TrafficTypeDiagnostic: BY1PR0201MB1045:
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1045;
	31:ndJVO5+/UBDw5Yu6QdL2FoiO24b2SWLzSINUMsrfwlzyk8/b4rmIRpQMZw5JaIykS9DydJTjC0F6/ObCwIFkzqd8YOHnAn0piF5HsMHJfegSXLRdlJBXOTB+IZ+lnvaFTL4MAaOSCrq2i1g6Vfrl8gjkllS5tSeyfG1pM3LrQkTsMJlRAVN+ADLuBplg6H/llDfmCt2mEOvugLT1F0DVQVdeKFGWeF8G8ectCv31gUs=;
	20:+oRQVN0Md0mqpizAUbVmicT3sU1iMi9lVgSabLHzf3MMVZcO4GXW396q6LWvW7n+7Zc1njY0Xpo/JB1G/bxidNs1p107OORS8jbF0su9J/vphZMX6//r+H1GWaf873jldnRiRsMGTrHQg9O3HvorGo/07nUUdvHhg12jF1y7Vi1AoqCmV1oNPKgnJDpHq5T5Giy7kegu9jUABGUTeSWrmrlORAztkFw+mPgNmCJPCUrYWNyOKG5Ws4BCYViMcqpLsyzJ8WSgW5hM8X4jnaCM0o3lOFV7sExyqSmrfRvH5kSBOtvlLMfo8JNnyoi3Olor6Y8S9WkIbcsZ4UGrzxJD9A4SlajGI1FoXvUgRWZtfVNlFvXzGPa/3T2OyrmSCbXBRiwNnZQl8xbh37tPc2OD4122xCguxLtnCEbp2XMxwsFMtBUbbnLYzqlirSCL/inutuSQ802wGbrpqE3O/fhHN+Kfubqa+/ns1tX5gPssj66eta+A+jGZiLsI8hxySHWK
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BY1PR0201MB10455BD839D44953F710DEEFDC890@BY1PR0201MB1045.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13018025)(8121501046)(13016025)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123564025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY1PR0201MB1045; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY1PR0201MB1045; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1045;
	4:ltXMKSPfRX8FbToSgq6XAv9t2JtrEaoEyPdbxpQdrKCdCIJLAjnP7xFsa28Ur2Cvro59LcdOMmOJCuMpl6dA5F+TdizlqDSlY0TDIgJQohrl8QRdaPgQwpChMEAviQDdPYWpg/0F+/HHnbigQ8Ha5PbbsqRHWRJTEsFTbndxcFECLb0e8GXD/xtcTz5qrovjnTbgNrBLvEWpnWGXYT5qQ0MxiSDOX6/V8rmpEfKGk1X0TfG+zUZbSU/vOf3xLhst+ZD7FcmYSu6qLFm2RcUPJuuakqzuwPWYqcKEVk1bmdU=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1045;
	23:Xh1fdyP8EJ1NWZA+IfGDZhGKbs4y6diKaqm2PUb1eIwaedOXaFJgMBFzbnKpHSSjYHinIx95a5kOYS6uO2wRs8vPKmznNm/fpXl4zRPcqk0FUl3a/HCVT5AQsxudi+ZR+P44SQsyKsW/DczBXkNlxx+Vy4TuAYnpH1hlYA0M6fhK9QQOFTz9uMrGcpXFVsKKA8tm8XhmBrUPLq/HXouBZrK8dAZsOfgd14ZvxHakdaqjekjwkE79k3iiRQWRNlNL4jx5hLrVQe18lKDASTJWrlcMwtVRiODRQ2MbCRY5cx44m1VO0O8LjxWU1ycY3opJCiPZhm+CWV+gnRiWwR6F5vaTNTfqUEuft0UFRv8RFYG5/S/2Xlqhk07kr2IMIS2ZEib2hvhXDUoq8VukptocPIlVE8kYhuqGRE0q/JjQcvSwgPBhyvWM9M769pL7g+noO4WLzpQRrhoY/8hSEG2jjQKA0J6QGDzHCrPzyN2CssvGpMI/ZAgs3wSnw76XOGQRpPd/OwifBaJkxU9R8gPY7NKEKXP4vWsK1tJoAxjZHqUwba5IZejRYYTKRLdIXUbuU1L+oqMDQ2q6+M4RN4j0aiOt6MCRS2ZQa8tV0vFCF23FU+odGOPLCV5cIg+EFZ4Z/sP8v7y3FQ6Y7Iaj8PusO2LY+RcP4Lc1FlpCbIQFyO08ZDCd5/qAjC3Ueyt8HkAuh7ZeUR/AwU4pp4Ul9Byo4ofXzssP2pBqziUsF/t4htPlRqBdA6PhSqpokWlMtqhGBuMYaj9sKGYJtLrUliEdpCxCoNGzhnfsh0mnfvKr3QosExvT2TkHT9t+Tr5IkYskzG51oPDnFbDkOXZgcVWc27shnkQu/pwKbA9o6rBpkxg2itotAqnMvtMrks9R8adX16TA5gpfVq0/Xee5YREDaVZJ9NfBWGxM8zBWHmxql2upSNAGL3/bZSWWDdiYrd6j
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0201MB1045;
	6:ZZ/cIoSEu3/Nd4QqRA2bBm8M4J1nx2bZrT3NRRtXtdXydGKLpUGQVAG8l81/epTAE6wFn/0b3xadYEj78jFnWnknGy1LdScUMjl9x7xUVXv+FO3+3qKuKuad+hYO+FTHbiZUKmA4sIyRavtfqrn/VDz1MplBbIUOVmOoDhK2KUWunAK1vzUOtzrdQ9xEn8OQha+CO2tKoXHEbXWsoIqbcOTXSQ2msDd6TpSMNjwPO3H+8LawqIaScmarnuVD5UBhfGQ0C9NFMpfNrWLbtThdlPGOm1WW3FETGmR9+0yl792sgDCMvvumDMNqbwWo7D7z/qkwf1tgmcnZdkb6ZQNR7Q==;
	5:p4A8IzvN8PlLqtliJNArzwxTdwyAr+RqCg51TTmL4qCNVuY/MRGPK6j8XIoC5Dy6fnLimBfBdBDwax1wLjj604kHm1kcn2Tgz3WAFX4vOAeaj1EtR8MdV33ApcX6QkLiYuKL7Z3oLTkNK5JAkwtcVw==;
	24:C+oXlOT33YJal9X9aXRZtUUh9pVdRJI9zIUvC7PkBgWYBwvaYqbuPRAi/NEVwRnNFEM/nN58Vt8E6im5dP3/AEdEHtyu+Z0UX2oiGbD1YTA=;
	7:1b7yxOVZn3IGEW9s5bTD3LojyOk+UvkgtgiTSJiXdzHTgWcRJq1naTV3T7VfoB9Zf80fpBAV0KdLUsfv5mPDPlFw8cGYx3z0BNiMUQbZJzhGlGqjpVBYUtvt7EO2Cigh0xOVyU2zqkF/zB/YLf53qmPfOcxzyow0xU6wP/Y3cndbcBRVd03z9IeU7ESXm4WGneJuG3s2c1B87JWzHX/pY+PI+rTWjUZ8PjSNZgpfthY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 22:21:05.7730 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0201MB1045
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.57
Subject: [Qemu-arm] [PATCH v1 2/3] tcg/tcg-op: Expose the tcg_gen_ext_i*
 functions
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
X-TUID: rfYKsRMIkPd0

Expose the tcg_gen_ext_i32() and tcg_gen_ext_i64() functions.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

Although I no longer am using these functions I have left this patch in
as Richard thought it was a good idea.

 tcg/tcg-op.c | 4 ++--
 tcg/tcg-op.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 87f673ef49..d25e3003ef 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2709,7 +2709,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp memop)
     gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
 }
 
-static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
+void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
 {
     switch (opc & MO_SSIZE) {
     case MO_SB:
@@ -2730,7 +2730,7 @@ static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
     }
 }
 
-static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
+void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
 {
     switch (opc & MO_SSIZE) {
     case MO_SB:
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 5d3278f243..8c45b79a92 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -835,6 +835,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
 void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
 void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
 void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
+void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc);
+void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc);
 
 static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
 {
-- 
2.11.0

