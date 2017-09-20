Received: by 10.223.172.38 with SMTP id v35csp1196001wrc;
        Wed, 20 Sep 2017 15:06:07 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAFSwUIvy4qLvcwuhCaAI5mKtfFhupZTX8ODRe3Z1PRxrtPURMfQjJ7qw8OtL6iD/4zaP0R
X-Received: by 10.80.180.227 with SMTP id x32mr150502edd.192.1505945167340;
        Wed, 20 Sep 2017 15:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945167; cv=none;
        d=google.com; s=arc-20160816;
        b=rOXSDvnzh67SClhfDOr4SJrKZRhRuws5Xk/Ygx8Pr1xzV+xUT+51yxVAYojeHa5l4d
         TFVCDNAwGogqMCeBp0C/LsqB2qPjaM/IC+tzy9eV7YChUKzFoIKV86PhSSX8qlKzGwwt
         7ibjyaL1F90Tf8Gs+/lD14IL0q8XvXFIjTbFHzwPy/RSKQ7+sziaoHcnXGeOAlZhOMEw
         sBPYA7ynUD993mvv+oIP4zNOhb9ORtc6FTHTQ8hzSUBre3jsiatbD9iKJAU+hVyBKvji
         D3FJuO5+Q7+Bf+aGbgIte9AOeQG+Hrz5cpmg/rOcqKj4quCSZImItORPeXfo12KEVkBS
         wJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=eGu65dTBtQds8MX3oPaYsmT69iz5y1r6bIITTky91oc=;
        b=Z/7WfebdiwOjFA/BfxxEryFfcw1MYOuMe0+u8P486hj5wlbYZ/als8CyCMShAguzP9
         wibz2r2KT+LyVwb3VM9YCJMAA2puqle5aecPtkYk+lsqNQtL/j6XB4XxbgqCx+g64Srx
         cwe6jomDo/FNeB5L5G10eLTmMztlz8iExpb6//u4yH+PwEQ1UsePgAkRIoxPi9vdOW6f
         +s+ZUbpDaKUtxgVj3pRCk1eu92GhqXchjQV83fU56JtHAgwwxkl99t4H9VbRCbqT1gXl
         KC9wP6WTfW7HvnD5Vy6aZoICGa72Y1i0dAIR9DxNldkgbWzyIu8now6gHbpThXmRXGru
         GzjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Gv93M060;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p32si220207edp.283.2017.09.20.15.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Gv93M060;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dun8A-0001A1-4S
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:06:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7g-0000v7-Pv
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7c-0008H9-Qy
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:36 -0400
Received: from mail-by2nam03on0042.outbound.protection.outlook.com
	([104.47.42.42]:50240
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7c-0008CB-Ez; Wed, 20 Sep 2017 18:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eGu65dTBtQds8MX3oPaYsmT69iz5y1r6bIITTky91oc=;
	b=Gv93M060tS4qv0dlFsCAj70R6yv6Gf9SiYaU9EVmEn/J5LI4Eo8Evp2MiU2ck6DOgxCfC8uAF8xM64y8mMDGe8T2+7b1QoXVWg/tP68Y+5iQrdZAyJjWZ3FJuxOf//yHBAO0pnwqTQRAamtD6uVjFybju3rE7NeGTduiAr9QnO8=
Received: from CY4PR02CA0026.namprd02.prod.outlook.com (10.175.57.140) by
	BN3PR02MB1127.namprd02.prod.outlook.com (10.162.168.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 20 Sep 2017 22:05:29 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by CY4PR02CA0026.outlook.office365.com
	(2603:10b6:903:117::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.8 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:29 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7X-0000eL-LX; Wed, 20 Sep 2017 15:05:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7X-0002LI-7Q; Wed, 20 Sep 2017 15:05:27 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5KjT025722; Wed, 20 Sep 2017 15:05:20 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7Q-0002Jm-3k; Wed, 20 Sep 2017 15:05:20 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:41 -0700
Message-ID: <e91f214abb3ae132f66f1052b45d44105fecc5f1.1505929556.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1505929556.git.alistair.francis@xilinx.com>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23340.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(305945005)(189998001)(77096006)(39060400002)(76176999)(478600001)(4326008)(36756003)(356003)(50986999)(2950100002)(2906002)(50226002)(50466002)(48376002)(5660300001)(47776003)(63266004)(118296001)(33646002)(16586007)(9786002)(110136005)(316002)(54906003)(8676002)(106466001)(36386004)(5003940100001)(6666003)(2201001)(8936002)(81166006)(81156014)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR02MB1127; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT015;
	1:JNFDHOiTaM3H9czD9bKndUED8mFw9cDYFzdk3cbEDpVxfYtPMnbYXIxYqvxdMR5geGJLjMZh7pFLZaQz7dHYmbYOwvakXjecVYAKzasJe4p+Mc7x2xqAvEVY2nvWzKM/
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3476bb3-995e-4495-8d77-08d50073b43d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN3PR02MB1127; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1127;
	3:UNOSsMvEBRNGyt7YdZtRV2wYZoYukZdm1lx27A8yaoVhqmyfb2IgYrq6/6xfV/2lCA8REJFzQaQ/ilZyuLFliu93FeBWQ6gBMOHP7Z+M3r45LQO685Qv1qZx7WSZyB6t3v4vTVQfa73gWw4+p6BnFMG1JZId/haVtjJqSzwUUbc9xSNZHUbxk4TOKg8AUjzCGhG2jIuCPLxunIqpSmOEZeM+bzN2QN8I7V4xph01HQFGofu3OlBn9g/bII85XzwcTMbQeOkMe/Jy4EUGoIVck4VjgZ+0z8lEWR04ele4UM9SFLZM3a+Jpu9wgaeQAHgJM/EWqf37csKHHRxadIPBXaqbR/WVrRjDnpgjotDjd5Y=;
	25:xR4ACgtmqd4jE9PGZ4Ds0SSf2s+ts8YeZNH0OT3TsFwq13oJMeQwMQ7vS+pgC1knz4ze1YyATtd99pT30XtjtydufZFNdEeagFyE5sIyL2+bffVaBycXdtto8KM77O7sVXSt7PLlVU97sq9W9zeNgnNzg1mkUdUGNv3h4lfmWBAmEJHYoXitiBLbdSm6XbR5MBkoew9UtZ03dVSTuw+eXp5dD0bzt+0ooILP9WZlsokfGptNjS3nt/P6blE2uMzYy7Mba2LhgTGnPmjL3q5e5k1YEcdkI9wAlnSsMbkCl9J6cPupWmbOcmOwYKQMSCJu5BdvXuVnt4oOLfYtmalqXQ==
X-MS-TrafficTypeDiagnostic: BN3PR02MB1127:
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1127;
	31:kyagCXv53ZveFQnj3n93kgkob4UhMi8QbGbBRgbybuBBU8W+qsixgNlJPK67GBnuBU9Zzo6uw50ZdrfZEVpXMv4iZ1r51oDroEp46vVnwTkPE8mhbIBOIQXvcGoTThz7hmy41f+tyO5ULFhAgfC9+QbZgnT13sakqUmntGwcss+nJOqN9ud2Xys/17zbDr83K/A7P63K8MM8QhqifPW9MB/Nv3VHzDudUNGJIEIMHIA=;
	20:8AmocngW/9oBuRd1N5EQLDyreC0m86Lktgt4ZvjLtuum3Nc1aicsXtH1bQD+GBbdnlJm5jkJgfS8UZzxOjir4lHUoJttcpVx9rmWydqyij/1Pg3uKFAnttypt2v5wZmdDYho57bco+8ykgo90J38Ivp1lckM/x+4BT3SOnARrtzcbKBHKHoHV94RRHNugk3nswZxWlSV0hw6ZB5YAAGIgO4RImAJ78zAtYddHDtHt/014k8/Cl0seLQBBQ9g8sGPNtte8sFGI1246om5HkAJsZO3kGozvdMKAnjOkma2UJi8YtErZKS6sdugPdXs87Up8e1tV1v3LejyuL0eF+DB5vvFV+V9lYMze+fe5QXKSJOuqch3ggoKqje06F3PQ4w+6P82KU52fWp/Jg0MYKZE8xIA1sPJetj/6Dde6xL/snsr156uLFCZwTNJ3oN9PcNvqgm0MB93WJdKrzvr4HEIJ8fPkwLggAHfwtAidZ/wT7pUBqLUTyCEgyob37qoFi/D
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BN3PR02MB1127AFCFE452EC1324E2BA7DDC610@BN3PR02MB1127.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN3PR02MB1127; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN3PR02MB1127; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1127;
	4:Gk4oN+D4AspDchRG9n8E0BC8KNMyV/D8raPFaMd/9eXEyREqnYu48WZT0E7xRBqydQa3Vs5W5kX89GUqTQJyzgeljNMdKv4OkWzWnJpp0JtFJ/oWkVAIITUfzt2WqkzhtQlyD4L2fVBZJ/6xcJT9bAoYx72Edea5Y5hN73OL+w5udlelGllbanjcQKl4FlDH7IATy+bM1j0uu68SZXiutkViJ054hxhoMHuZ1Qnr8SLOIAggTeGsLPcdjsbPLtLEFQtHWARxirnln10jAlUllCsYQ3UJYzzL+tv8KMezcXs=
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR02MB1127;
	23:NwtPLBhoPJeTbPBW1HUBMn772YR8Kr/+5FaNCwCPC?=
	=?us-ascii?Q?D1/Jc0N7obsHHjP49LiMZMvQY4lQd8NvvhwU2DpL3+YAdOYe3Zf5xBC6XLpN?=
	=?us-ascii?Q?TYpVccnR3oGhK8TwS0pf7qtsZfRklOu4XX8EnsuJ8vUSfP667Zlew7Eua/cM?=
	=?us-ascii?Q?G2MgpV292C7KGg5/plfgsQXQbz3ETCoopkl2hDafAMvqq2w2MM9cAqSHoiar?=
	=?us-ascii?Q?kJgAlvmKS1nwZU4QoDkRU47XnEEnq/cSGuC+PinitcYP7no3NYNLBG+YmpY1?=
	=?us-ascii?Q?GBPvMzHGFKWJlNGkETqx+CxpLWWkmKD4jGnomoddRDIjdD6cQGHFHmQoyRpE?=
	=?us-ascii?Q?OXZnthPkCsD1Xb07bsd4cKrUNh3lkSEVYiYmCPpjBrXVSXvwGX8T6RlJ90z9?=
	=?us-ascii?Q?R+iOJVYVppQsV9DZCi5zhd804B4MNGbi6tAnhS46CRK49l7R61yMeSZLUm8l?=
	=?us-ascii?Q?nmvkw580NtC8T2xNdjEHGkPEuDAwb4oQzWFEWxvBx4Vv+zX5JS5gawGfBCo8?=
	=?us-ascii?Q?i/C+5twKYYAHeYilbjpdUXTuFCuR4vYLHphBsCY2JvVB/2a+dBt+1HemOmK3?=
	=?us-ascii?Q?ran1RIS+0FgCNkLjBiyZhmaJwAaJLWEl+F2L7MaDD1F6KAXr9P95Biz9zhQm?=
	=?us-ascii?Q?WnVxNt2aEasslfBo9GujIJWaEgfmCvdY79bPNVpX1h1fKujLMDaynsv8gypE?=
	=?us-ascii?Q?YebrJ6d1iUzG/RtuDIgpVTpSIXhucyuJoy2S2ZFUCkH9x+yIJkgp0ktQbGrL?=
	=?us-ascii?Q?A4eFJMMMSqlf7txeHZjjEhqN4hgP2dc0TqEesXSzjBLK8I+yDeluxXnx/0YS?=
	=?us-ascii?Q?nkvjAy1Vb6dMJHo5OTBkzZ50AaMIn3TsznR+3lIye2kMPC9l+aQZGECllKym?=
	=?us-ascii?Q?Mtlba1+t/FKw8+Yrk7lv6sJdZrA6cZKrxTgfzstLhKZUuG4YyA05uYVScYqo?=
	=?us-ascii?Q?BlhCPU9xZFLdGNgyJzmPmEXM7PRY6gKwzdDib8jzYSiAdOSnf+CW8sFDsz0Q?=
	=?us-ascii?Q?tu6k0PfDcOeYliCj5okf0Gs8VrpozC6C6SgnpkMGsox/tu6cTPAhuKOMMdBU?=
	=?us-ascii?Q?Ij+Imk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR02MB1127;
	6:LL6+xU65R5LtoYV48m7WmIqOhsUAyDbHEwjsBMCMMm0qAOaC5S4kJP7NC0zgq98rf4PHMkI94BA8M7GeF8EJWVG+OuzuyjExVlpIIbdapY3WUHZgu+f3W2bBtV4wBl24It/q68CS9usTi8p1sik96hW/XVGaZddySuJEFQw2+6zRlfrzd9V+LURWTw47maSVbHdpwqmAGUoTaLUty6V/aNVxSyaTunrUJ4YsPIjLgW29asBQmduZLroytC+LUEOQrrgdnItk+EIdt2QjzKBMB8NpMD6fyoKq2k9Fh2jUeP/VtZTGr+5kP8ml4Zf8vTgqe5vmSBWFTKOR4Og4Z0xE5A==;
	5:cuNuBKVq3YIcMHZfqyH5sGh9Kz9RNR9I0VoradtTcm0VlOpXvMn3wwjymRX8uaQJhjKQu3qqriF9G/Zf84HYUhFKhM/4LQ8MdCLwkr6rrhkh7Q2lWud/EsccD4drInCQaNNliz7QTj3V7/ACfy9gYg==;
	24:iTYdAunBorbo85b+CftTd9r06FsV8Q15piv7dpvFL51dqhfOYMpMSnikrT5bGzksOMgnaMZxYmfjjhySWn3fPVGisVo5vo8gW2HliVqx/Zs=;
	7:PU7TCHBXSDyjdS0N38sJdgCmrgiIkixyaQMNK/qrt5VT8doVl0tNosvxLe15hpSfp7DbjoOW+AiDcjN96CJRrI78hW2fAEi0z5awwnckJ7Cpz10T5ixFMgzOY060w4UzoRwRtlgTusYdlQ4/IkfFaV4WQVljaxtRPbglnAqV7Qg6JmGNFkPLP5VA2mMcCDqr/4LA0Kl6f/cvEUUldlpS9MHUqWe/gk8cR2n0Gr67NTQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:28.5152 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR02MB1127
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.42
Subject: [Qemu-arm] [PATCH v3 3/8] aarch64-softmmu.mak: Use an ARM specific
 config
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
X-TUID: AvqFFqy4wxdP

In preperation for having an ARM and MicroBlaze ZynqMP machine let's
split out the current ARM specific config options.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---

 default-configs/aarch64-softmmu.mak | 1 +
 hw/arm/Makefile.objs                | 2 +-
 hw/display/Makefile.objs            | 2 +-
 hw/dma/Makefile.objs                | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 24494832cf..9ddccf855e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_XLNX_ZYNQMP_ARM=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 5ee6f7da5b..01138b05f5 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -13,7 +13,7 @@ obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-zcu102.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 551c050a6a..d3a4cb396e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -40,4 +40,4 @@ virtio-gpu.o-libs += $(VIRGL_LIBS)
 virtio-gpu-3d.o-cflags := $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs += $(VIRGL_LIBS)
 obj-$(CONFIG_DPCD) += dpcd.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dp.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dp.o
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 087c8e6855..be98d5d3d8 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-$(CONFIG_ZYNQ_DEVCFG) += xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) += sparc32_dma.o
 common-obj-$(CONFIG_SUN4M) += sun4m_iommu.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dpdma.o
 
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
-- 
2.11.0

