Received: by 10.223.172.38 with SMTP id v35csp416240wrc;
        Thu, 7 Sep 2017 09:06:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAmNTEEKkHw6fdsqTHjBFq3oLcOax4Hqub5Zn+0VFFsmHy1mUDtmkXQyl3tHu0o9GBqx4Qt
X-Received: by 10.200.39.162 with SMTP id w31mr4403099qtw.234.1504800388200;
        Thu, 07 Sep 2017 09:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504800388; cv=none;
        d=google.com; s=arc-20160816;
        b=wLwwmHU95vY2TBASq1GxXJiqF7TYUVZ/SGRER7FplgauVQtaUWELqYSQq+ykbe3YWI
         OzkZAcCwpI269/tFTXilZNMALRV1O70pOjFlDnV60xeC9JBcx3bR4vUkEcKy5yKq4b4h
         1vTgS29vxSnBnh3MwIEouI2E8wZRWoM9OiazBYkM7AS5zEiLmcnAoFHZYxRk3fVBdTgz
         A33j2kbVJPglFkuH7bpQym54zxsLxeWAkjG+5QSPxIuxeCZipCWsufUWVd8ui17tqL/C
         r9CD2pcj+oVq+0dvkkQBphgdpSdX6LAXx0l53wrYv1v/sdZJk0/Eyx8mkRyYMPyijSkq
         5QBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=jN+rFe3RGpVDVz9bnIo7t/7jAD/krMrGu5rMRk4yPnM=;
        b=OQayFk6ao2V+DH1ezfySXvYnEY0lvhdjTvoW1f8X7N7XARNFRH+WdZL5YsH4ZumCEA
         Z8/8WJsakBbl+WKQJ46q/yIH+95EYfoFWd+S8kpt42YD4LXmy/nUSorqysCvOq5jVSTu
         6xd8NTsCeanWXRXXFtm7yN3QTuWiloeVmi1ut/uKX7422804w9jEidhUvQpfwwQy77An
         xNzc4xxM6eg/d5aKdmNpiSkyIClSA0kQ1bAeSiKBNfFuqu063oKg0Pj/AHOdKD5x4QPd
         rHrTfXfVsLDa9+NGdTiUqeY8Sj6BnW45X9oryfJze6lg6Ujdlh1cU7rOCMNwrYdDGK4N
         jCiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=xphjSeLK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h68si641qkd.506.2017.09.07.09.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=xphjSeLK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzJx-00082L-Mb
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:06:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dpzEb-0003rq-Eg
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 12:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dpzEW-0003YB-Jx
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 12:00:53 -0400
Received: from mail-sn1nam01on0075.outbound.protection.outlook.com
	([104.47.32.75]:8421
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dpzEW-0003XS-Cc; Thu, 07 Sep 2017 12:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jN+rFe3RGpVDVz9bnIo7t/7jAD/krMrGu5rMRk4yPnM=;
	b=xphjSeLKU4WI/BxoC3cBt6Qj2NjB2rRV+W1vaGqeB69cHga8ILSm6GL7zUbcZZGKPBXabStKsSkN3ygKxPsF+HvU0y/ekOIO6vnyHu/6CpBTtiJ0HuHrs7152Q1VKkDwtts9WiMCwfeUmmJSpby2tOaDxW7eJZETdoHY7gEhL74=
Received: from SN4PR0201CA0020.namprd02.prod.outlook.com (10.161.238.158) by
	BY2PR0201MB1926.namprd02.prod.outlook.com (10.163.75.156) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Thu, 7 Sep 2017 16:00:46 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by SN4PR0201CA0020.outlook.office365.com
	(2603:10b6:803:2b::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.35.12 via
	Frontend Transport; Thu, 7 Sep 2017 16:00:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 7 Sep 2017 16:00:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39694
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzER-0002Zi-3N; Thu, 07 Sep 2017 09:00:43 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEQ-0002gc-VB; Thu, 07 Sep 2017 09:00:43 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEJ-0002eC-LR; Thu, 07 Sep 2017 09:00:35 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 08:57:00 -0700
Message-ID: <c99a1085201651b4c7239f4875ce073988b03c55.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23310.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(47776003)(33646002)(305945005)(48376002)(54906002)(50466002)(50986999)(76176999)(4326008)(5003940100001)(36756003)(118296001)(626005)(50226002)(2950100002)(478600001)(8936002)(189998001)(63266004)(77096006)(36386004)(8676002)(2906002)(106466001)(2201001)(81166006)(5660300001)(107886003)(81156014)(9786002)(6666003)(356003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB1926;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT032;
	1:1HR5ia1tAb7Kt12wnDOTGr3HuOWSwGutk/RyRGJWZHXCFVggC98eA/nF7jMUDgG+Agw5oa6orKFuJBohR66jI+TyseFpeUbTSw2sTE15oEDBFf43o6AXCsp5Y95GIqg3
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a35f7e1-4de6-45c7-6a01-08d4f6099967
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR0201MB1926; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1926;
	3:xz+3fVGHE/fU/vVXiqXotnAy3MUDEtWABpKL4GTXgsc2eIk4ODIYpYruihaNFP69XMnTjKzJu3O8mxrPPC1oY+Jo/GkqwnyAWd65RIb804CIXVggKimrPEn/7wNxq0uGoIgn3Ut6v+tbESnkeewyEPsT7hRcifZsvjSibNdJjvvjjz0WnMBL08EbFpy0C7GFn4VBNVJu2gHX9XgpgUDtE/80e+ue8N8VeiV5b+nzXDSjZED+8h/feRRRFj9cPp4y9UmYB7d8WLTzh37eJQZkVVaNLY2lRlc4ZOt6SEYA4enDdcx3KrN75X5nW7rVPDRItv+eVxavyTaA4NTxwlIerIoqsg3ImiIwUwNXYARTJFA=;
	25:GDCK1H4Ugxs/9zApa3njBgBI5y5LwPMZHMZ2L5grlQdweIyUNIUOpd8S6FiPWbYqr8n3FpOnxNS5VJAB7qE5vmmlxarhFTli2SAqrctYj1oZzcAg706XeaVmWkKd62CCo0OvnTHV+m2CT1JiKt/PefLSeU5jzpmZHK5ygmhSPia8Likxonms8TjAE/9ySTV5QysNAN2NO0NdQufM3gyRmlJGXQ304wCYXzn0FUGK3ybVC6aV1rMpKSCKvYijF6NpPi2iC1/6OWiX5se4jBLMX40kwXri5FOJJgphkynW2MxBCO0eSp64p0rZMmps5CARTO8NwE5gxKeVMJUzITgjHg==
X-MS-TrafficTypeDiagnostic: BY2PR0201MB1926:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1926;
	31:hdwUxU3ewbAz9q6zn/iz8+6hmiR4zfWMiQBevfrdJOAtJvx7ZC7jpnkoadC3GrEqTERCZ30xlh7kxScr0/wxFCVQds8JUxE1ZmUxX3iAAEi145HVJqLZmJWSZEkAKVsBFoIpSEKC7NkqHo9QoAHwgSLtb+sh2iMNmZ13FOVw+hlqXuLjYfb/8MyMkn4DDbO0Lw3nErJKK+S/TUdlxd8JCeQLEFqAKpqly6Z1OrHtLzU=;
	20:upSwUm1CphLjEVlZ03KhFx6D46S+Z2AKL7jjFHen8qyDReQNjntXKkLp/syepIIw8cVH/Mb7CRwra5DBtCpwrCJfyrl/9pdbQhkstlrd6DtIIvUoFf5MXwisNuVbiFFCXCATwocx7Fn5wO9sg/Sth8HTIsCTT9hYuMn2z4OGiQzLQzPnWrRufitCwwpTue9X09t/Cj3Nkj6G2wxTI437+O/RjWG2cdNZYriqM9qvGW61K/bJtEfxqZDAJ8HgqRwuuiBzyiTpKrSgMJCBetxg8qYIAwXPmaal4++LfocJE3H4CXbx9RX5oxb1hurYEtCooxKNjyjs/Osc5/fJj42/GCT0IyLLoc3Rnv+MxA5cep1NIt5da4bB0H9pgkEJHpShdav7iOP/m3nWgg9qbTj+0it2aczbnx9c8Wx5l9i2lz5/KZ1qg1PQ/PRd+j4ifp/6UVee724pNi06CEtGgeHlHpKD2r8jnjPI5RQZ9IU+UDBHTCMyGuReWS1nT1hSElon
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BY2PR0201MB19261371F1E5E0084B0B7F95DC940@BY2PR0201MB1926.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0201MB1926; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0201MB1926; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1926;
	4:cZT6UPIncAPw4xAggqUPeh75bY0NCJNsBFAEPcXARS74BjFdLU8RyFaPVvOkbYGrGMGGywr/GuK5Jx3B6YWJYamlM+MnHOADpi1b2Pl9aPMYkINS02rjQ1JsCNDObMQJlBB6+FAbcrbaZbdq4uf5l0fTLGd4DTUnquNqWn+m6rFsoYb3X19sn06RWt/kucaH2D2hfIYEF524GnkNiWImo+8qW28t1GVQMezHkzHYkiVq7SQeoRE28BJiG6R4DCcKAUbwF0EPWF09vxSM/CkOujPmoJ9I77iRwnE5kKaIjq8=
X-Forefront-PRVS: 04238CD941
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB1926;
	23:ls/6FRjDCnZXOr8+hscm0ieIPIlt9ornfpxAsJ1?=
	=?us-ascii?Q?8i2osRzzfzLYTZupZMtho70OJAHl6oXjGKz24r+0ctDjQGSJRKQej+umD7yF?=
	=?us-ascii?Q?S/oFu/pXcfKtOlR99wGWGN+tsT5KbkghIhuFfOqRNNyDTHJQY5RT2yq44gY4?=
	=?us-ascii?Q?tcuaWr/PAcTAFcH6ugjIXUdF25mV4zRpcGSEakDgefg2HxJqoARte8U2hzBO?=
	=?us-ascii?Q?9S93DkoMykRot3B5xlG5R+u4loBFYAv9JfV0o7yzAdS9JIS1VbpAo2Vnx5S+?=
	=?us-ascii?Q?XvNoOMffn1rhQl+3O4EOVreaJWIl0TA3iSsk08OSYg+yraGsz3hVhm5+tf6f?=
	=?us-ascii?Q?WH2h+q5ZuLaYv/WjGD/TomVbQK2McAGC6bdLj4yRP866Se+5C5UOydak7Huk?=
	=?us-ascii?Q?HTsolM0rKElwGmA8U8XJL5r+9mccjU2k+rXHhB5qeRw2WBHEQcrZcssIMgED?=
	=?us-ascii?Q?WzC+tQny/CnUpBj6c0cGp8evPKxRA+bX2Dnudy7+f3jM8CtT03nNSnfyOiNW?=
	=?us-ascii?Q?FtU7JrFZqqpkXsnsKskzl/uqzNeGnKEWAWgoRGcbAAGzVMIf7NtZvGkuR5rB?=
	=?us-ascii?Q?//1QgCeVe8h+sY6DNXkmoQG9rMCxG3fR0qexJ1gPVTsjqHBpCEB5BIsBpcYv?=
	=?us-ascii?Q?/MAk2yBYP6HP1aTIELbleKFGIcYUYwfInQgX4Q8dMVysS6UZ9kbAMSnv9J16?=
	=?us-ascii?Q?OXRzDw3e9q9J+2lv0PXm6tpEzTfYsw1cdTTVe9vsanZbjPEw8/Bz8AeuEh94?=
	=?us-ascii?Q?MunqI80hFBrhlvEp4EZzr1aG4CBbVXJCxnY0sDmeHJ/3b1nN1oFFkZmMRrIA?=
	=?us-ascii?Q?rXbf1cHciuVOzpkjhJAp2qaPz2Luv3iBxvq/ScGDdaov73BaThF7JBdjB9He?=
	=?us-ascii?Q?nIBd+Gz+baoqLZk8Tn1Sg6S9T5D0xigohfE80jXG717rid+W1/g9eTlOuzeV?=
	=?us-ascii?Q?alXhnOzKgNQkvoUW8ugRHr671lbvvtvrQ3RjbN/1Nw/+YRoPW1mN1zA9kbgJ?=
	=?us-ascii?Q?wzCE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1926;
	6:e/0k4k5stFf4LsdDgi2Eznd2/6T55wl6xJ99nBA7fXWMxlpCzHkSrh8aF/9xWRC5NQU5VT6GriPa3nrRz3B4db8AyZ9n6TnXL+89XjlcYsML1vLIh7UZ4XyqEvWk/ocpmqWFTQdrwIFS5egrzDQI4Ni1qno8usT+PIq1DdZR2UJId7OEgwkxZ4tPFBn9XR6C1YwyMRyGKopyENfHvPJ10WXK4cNaJlcDtGC4dgIwdLIrpGGVh8aBScSBR5X0ywuz5hQv3uDm6eF/Qb7h2TnwM7rzS9xJR/N6DBPQeodXntKq+bLYoe6pCtDktKfjfq8DIdNfHqe6Te9tHVTWMZ5qKw==;
	5:jQ53Dpg5QeNi3oaOL5hc+2sssh9+hT0mea3lTtVFgnsfvWx+WzJLkF6TlwlSLSIVY8FxmiRR3wuFs8xGATTUtpjBNjZWlGFkksWmedmEk6AZCCZkO8UZQA2Y26jtWrFJg4rRBvQXkw2G636WAiMfPQ==;
	24:5GrcA4TNhvNNUeWtW1niijKyO9ySwxS67Tik3muMPbF/Az+1TO2g6Ga+fSMoP3Y5fvc4hPTUZbZl6seJOfeRQ62u5/Sv85nwb1lY5fyYUKo=;
	7:s9qFTWGfZ+qFBczR6G6vablaPrzAfWsjsmQsfuk46AgYTxEaPNWS1Oy4UjMYeb2AtTZmX/IQ0QYwyrZOEN2y0OkQ80WdVSUeZerDBG7AEtPtJRyXGZ/3OnVjd5pNNnoXf2OXfX0esHmogtSiEkarmBlnXlMa6EJ3Hjkr4+OBEywZWzeQIMSvG0oRz4tZWJT+NGFfWKZefrtfT9Fbd6K7zLAuI6tL4HjvAQac+i2U8L0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2017 16:00:44.2099 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1926
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.75
Subject: [Qemu-devel] [PATCH Resend v2 2/5] xlnx-zcu102: Manually create the
 machines
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cMRXbFCaJBpN
Message-ID: <20170907155700.yeAbPCekkI6jCPmeY5nKEhE625TzP_QxMRKKiU2GlVs@z>

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

