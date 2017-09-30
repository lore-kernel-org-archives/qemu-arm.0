Received: by 10.223.197.9 with SMTP id q9csp1162659wrf;
        Fri, 29 Sep 2017 17:19:32 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDQ2c98ytI9edEiQ3BhPAj89xcHPB5RTsTcDeQLOGn5rkntn8243Wcfv51bQsEV58WyJKfr
X-Received: by 10.55.140.69 with SMTP id o66mr5759688qkd.312.1506730772410;
        Fri, 29 Sep 2017 17:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506730772; cv=none;
        d=google.com; s=arc-20160816;
        b=f/HP6wRQm0EMgqRAFD5Qp0Egf+Zn4aruRNfMa0gF1ZrGSMukkCx9nMOVlSk5KN+fjr
         90VL0upkyVCnGg3wUtLH3yJsJBfA15u0PwzDMEsU5lzuNOPy9wByNdtTKJ2U0h4lPsH9
         LOY9h8bGXJMt4dheiU1qdaonkc4ueCMB6LaPk1az9qR5b9YphJyab2n/QjaLR4pbUfH/
         Yh4qX5/sZMXchlWCS9aVgr0LolAgFsT8JcVa2OAfVrnJoV8eCMR78FEanRCnc+/D3N0K
         emsQFSCofd9cAhG5VAkQvVh+GJCbINzIX8g0vKZ/4HBofG+DN+/lmp8vlUg2qM0D3DW7
         BX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=scbbNc3RAtJ6fvV57j8ZVZqomy7fRDaWrCPxjhrnfMY=;
        b=rrh4BxywToiBN+X2+3KscepMYXHIEoVuqNODtk834ZZlEDqPYlHZIiHvvsTHLAQYrv
         p89OfG4e2IhWjP6qWHSmvdXQbLK10iXopAH0a7VdX1k1qZqwXbIm6PZjJRpmSooXIFde
         02pAOqBUE4nSh29Jk3GCqgz4mO3oXiGRzqC3hEwjl9vHHXa5Iu4g4tuUHREDkTtUPJRr
         H8D5lCRi5znrlnKLWY/2uQ4zPRtoO6oFo17yRQMLnY7RCeny+Q0GtFRJCUo9i2EYab29
         re93sbaESW53tRVaHMh1JNH1minXzGN2hrUKoPmtwX1MoszjS4cKb5QJIajE83P8vZ5a
         ULbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=U9bRC03p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si1207939qka.69.2017.09.29.17.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 17:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=U9bRC03p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy5VB-0003kU-JT
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 20:19:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dy5Uv-0003i1-Du
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 20:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dy5Us-0004Dv-4Y
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 20:19:13 -0400
Received: from mail-by2nam03on0067.outbound.protection.outlook.com
	([104.47.42.67]:11840
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dy5Ur-0004DC-JB; Fri, 29 Sep 2017 20:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=scbbNc3RAtJ6fvV57j8ZVZqomy7fRDaWrCPxjhrnfMY=;
	b=U9bRC03pC79eWbEMroQV9USb4Nsc+CsXweclH7c3XL39C22vtgg5Uv+Jxlv6iXRVXyMh4mVb+uHyI2saQE4F0ECTEBD1pT2DxuKNBHeD/qLGG/AJG0D+H9OmBIu+UZ/rQLevU3Aa+nLKNj/q2bNNMgZjmUWEX5hbd/KG+CGwfqA=
Received: from SN4PR0201CA0067.namprd02.prod.outlook.com (10.171.31.157) by
	BLUPR0201MB1924.namprd02.prod.outlook.com (10.162.239.158) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Sat, 30 Sep 2017 00:19:05 +0000
Received: from BL2NAM02FT010.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by SN4PR0201CA0067.outlook.office365.com
	(2603:10b6:803:20::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Sat, 30 Sep 2017 00:19:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT010.mail.protection.outlook.com (10.152.77.53) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Sat, 30 Sep 2017 00:19:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dy5Um-000825-Fl; Fri, 29 Sep 2017 17:19:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dy5Um-0006sY-BZ; Fri, 29 Sep 2017 17:19:04 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8U0J2Rf000324; Fri, 29 Sep 2017 17:19:02 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dy5Uk-0006ry-8I; Fri, 29 Sep 2017 17:19:02 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Sep 2017 17:15:14 -0700
Message-ID: <d057adf716f3dbd24ab2c0721baf8318c15a866c.1506730372.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506730372.git.alistair.francis@xilinx.com>
References: <cover.1506730372.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23358.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(199003)(189002)(81166006)(50226002)(316002)(77096006)(356003)(33646002)(36386004)(36756003)(81156014)(8676002)(16586007)(478600001)(47776003)(189998001)(106002)(5003940100001)(575784001)(9786002)(54906003)(118296001)(50986999)(6666003)(2906002)(76176999)(305945005)(39060400002)(4326008)(5890100001)(106466001)(50466002)(2351001)(2950100002)(5660300001)(48376002)(63266004)(8936002)(6916009)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1924;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT010;
	1:FOIQtfHPYHKBNyDcVoH3na9D9vHTsl/lo7V5Gj7neYYSqwuEBEdrQBRp8v5CY/1B+HdhylaOJ3skfgoKRJDeIWMc3Thq439nNSCkmAndsX+AxqmxtF7wDwri6Eu9LJX4
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bfba7d2-543a-4096-6179-08d50798dc51
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BLUPR0201MB1924; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	3:3fJI8354mjqGZ/qrwWGJr1CX1nYFlRDI+naGfBomCR9YWUY2+RX0RQZM5OYXfMy43O95d10TcqbvFSsY/YcyHQ5cODwLFz+FaXBU1NyJMluFL4KpbFK+KjtLh4ROi0o8dQ/M/hiCmXfjW19nqYtIdd8JvZJeR62GAN1skuoNePt/ZLSugFOOaCIPpyPQgOEwc/n7Tr6unPWM+0WJgV4836MvoabGzhhuQQJR+DHHAas2vQGi1nn2iw4WkGmz8AVmKKPGsfPapA+sdl9udR0LAGNFBk56xoN5wu3cq15dcGrjCga1LWwxmH/xehZBRyN4LFdmnRepMaMTu6U3w3I7nNDcT9rLlOovZvNoKUi9xQE=;
	25:FBYOseZhtp1CKH2gsH510x/syt6xiB0H6bUGJEfZeXgPmv5iCdwG5MQMYrixXgNBAKq6oU6WqIj0e6UuhvdNHnnQQYJja/X4p9T4WyMR4dYqPEMusOAg5eIWDFkaYKAPTI211IE9/RiFE4pC8k2EOtzuqnA0VLBDHbciZUD4ezgS/nIIqXjRiEEcuEZ7MffEUQ+h9iLFcAs/CBzeLHUOnxWrWaAMB23WZMu2JIXg8ZCBcndWK6hutSd6qz8SdRlu0UkjcAltB85YCJanIf/fhpe5c3H0kZy9pjjLfaVrPiCqyEz9yP7whuZb/tb5O5ZPjuW4+PFVrZ9f87wb9ZCxMg==
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1924:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	31:Ko3SYh/tdzgXyOZHL4ieEA/QutHvH7xHlMc3jp+l869dsCXuVnk4cXRQv6QinJrY6EOkDxbt6DJ4MUVYjC6lfCrvZCFdPpznRfRzIzc4Ptvjx7+VLyhjbqZ35NgzfnnI/kWJ/wmCazEZf4z0Q0hq63bgzLmu2C1IF/7wFikwEUqZr7UW4VTbYUwSdkn9mT27vMp8ZodqzVjyYYKb0kcZWRd7Z4nzF94rKqDiYuiAhIY=;
	20:vc9emelbU27hdc9TwmoS+2dk5i3lxJR76PdFTG4MFjWPK6N+KCeODBh13AdW4pu7W6naYtWftrrNUuFOiE+Dtvm8FH3E73y8+0lql/7ZuB3/npgdfHIxg0rm2xWpWG0Dr8owMPMgfT9DRFouU/0flEc3wRufVJ2L9fmCJj5wnYS3xvbvzuFUUZ6v+xUT4IfbVg31/vAocZWDW74vT6g8pEq3SobMs7Jtd3dK+MpfpnMgD56I5GpT7nF2POEzkY765t3MPcTnNCmzr9Y5yV1n0vqSi3vGeNGAygbGCgplFMTef5oIJhuwbuMHGo/ZzyyQKSNJ4kKTCHF+yCZxdNnut2tU/PG2/cib1hqBDZ3qWYUV8M3+Fxr0bCg8uTWekVTO0c+15iKnVdyMcjnFYsrPnzRShA5GEjQ7uOGN3AKOcatxczIX1lV/4fb1a1fvCyLL6gozVpF+GYnoOWxtLoUWgL2SAeMIs+vwP9zbgp0tYTgKXfCJ/RzYIpIAXn5Wcai5
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Microsoft-Antispam-PRVS: <BLUPR0201MB192456E776611355FDDF65E5DC7F0@BLUPR0201MB1924.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR0201MB1924; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR0201MB1924; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	4:UWt1fOQExKhFW+UDGZJckHZLb6MVNWFqSDtZcIlfAcrzFydi+IsQ2DRX4vX4hmBuXPwXA6YtRXqse3Vacuo18yYG8ZngjYcgyb6JfrWF7luyHbGf/Xw/xFhEtbhGX3uZLzOygk0oZWI5uVY0jBYe2YNvQI2pSnhMqyNGXOI08tF4auIU6wEMOJy2I+Li84sohR9AEMuLRsa/1C6faRzjlyv1PnpyUqmLsIdLSxt+pbKiWi7/2+035oP8ps7rpE4h3PPV+nv4HimmpQMzBtD+SgwRn2E2rJb3oFw4oU4UNEuyhhmzhGlHJQSY55OYcP1XiI96pqJRHvhTBCoc5B6Geg==
X-Forefront-PRVS: 0446F0FCE1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1924;
	23:Mi5SjyF5fMtYYtyA8aWMyUpqmC8bS1ImbrRaff+?=
	=?us-ascii?Q?PjgzVEfWO1MiFx/h3/IYz8nh6c52YJc8Ai8wl2y7m8nEA+mAzG88O/uIi72B?=
	=?us-ascii?Q?5rTEqCxL7xJz6JlWi8++YcbH/utyZhsZ4YKPvLyazkCTnQ/6OlTjhTp/IfV3?=
	=?us-ascii?Q?hNTvOVllxCOqUAfvmQkNFwLbcU0Dnf/R5x2AsDQCuM3couApasFLngNTIuNO?=
	=?us-ascii?Q?WUv4M5XbVRBxRM3ros6GRWaQMLyVzYeOITA37i39OReEoB1z3hgjVmgrX0p8?=
	=?us-ascii?Q?gz3ZbG3xd6VDPUTSrgg0WrigeVZ825+OwzC+uenKwP4ULDO2BNaQIZrygBWU?=
	=?us-ascii?Q?tzoip8JzlRW1vmkmv7FcfeYgGb7CCzH7mc2c3x5lVvAAGrB9jxacz78NMZOK?=
	=?us-ascii?Q?5N/IfiCDU51DQ8HNDmXXPI5fsdKikTccneifPFvU6tLVnUN8cjollkY2c86X?=
	=?us-ascii?Q?cdoT+5O1ZvFUpEgCS+N+Xo9xrX8m5Ef8jiQRr3UAkvO8vNV+XaKZ0BOibzVk?=
	=?us-ascii?Q?SpNny2n3xLmXl4PUoixJYPDc2+NIyIgdJHiu906Oxe4SMTaaYtP2F51fwO8m?=
	=?us-ascii?Q?A38xF7RdcuH0ouRrJnZFvzRLx3X1OzvjmF3C26i8zj13pavSxKJ1SH6P0k66?=
	=?us-ascii?Q?SnF4VAaDVWLbBXbLWMF1dEP8mK4LpXcM2XlRXB5KKTs5UEYQ8FjSbyflm5H7?=
	=?us-ascii?Q?ZHFSlkvA8uhkqL71frAFfLU/sqwE+BDJgqXF/uaa4/XUzc5A/mSOJ9Ulpi9f?=
	=?us-ascii?Q?yWcmqBu9dDP7uJeoQbzz6wjCazhvoYFoDiRMetwKxKIMboHvt534bKU3sIzF?=
	=?us-ascii?Q?4Ch7XYB0Zgvz4NtxPx4XuFY33dcK+qSE1fBxlsW2hbaxoMEMCpgjL1Drplmc?=
	=?us-ascii?Q?KWtr0q6MF5gd9gQP2DAdRL5oDV/EpwzmFc9xcxSyJ1BXxb3fm6IkJm4cz+yA?=
	=?us-ascii?Q?xeiTArhi7AmzypQduiPBYnvextjUYtM0YlTMDxTWA51unovHBnxeQGhCngLC?=
	=?us-ascii?Q?5v+RR6PnRy9kNJNxZ89OmjyceeEZ37iE265iFAm0kvhdGMuFhyvohsArL6Tz?=
	=?us-ascii?Q?GmptFID5JrET56czjUfy5Av5v5DSbkJoEqCWtPDUd/P6vXlSi9g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	6:cIfQxR/mCJUX7Bwc9vf2zYHcJSjt6HJUag5ki5fffklF3lhiksenwVjnkHI+dr3RyPMSkfuJR2DsEK5Kh/339cMVNYGNjqaUpuusB0SlYn2unEAgpcYukSEb1gft1LacvhIF5No2Y+swE37AbyHN7JgE59OkqremjSSWljVv+vf1Wi0G8nyEWCGJ2/45unYJnSS7ZTV7+YF6quJa4maKNsenuecczTSMTqdbexnoll/8Fv4GDvmQj/OaFBvQ79tuKHFeNkT5076N2b8EBJRpqi27KuvxakxCKtAzWj5ViOQJyRKD5MCTGAOOQ7vFdvkJlH8MQXeWPJjOq+YYcw2Abg==;
	5:c6fcQLxTbYLRWMbecLLey6bPO1syWNkE3FPXOaJ0qUmqDdTF6GozEcVNt4+akG5eP6uPRl5KoYrpkazRDWVOAUzxn3GPNbyh/ZzQ2UCX6qstinpBbofpIsBK3VB0mRhC9KCI3t7Zfui1zh+OOtbsWhWlEwy2eYXZ01zFu3DrdB8=;
	24:t/XGra4vNgRppHUvWYsKmbEAYzgcXJ1ZElbUWHijIpLpXHOAfyjs/JNBPSuuiDpzhdsfpdWSXTYwufBLjl5FaduYL37nurB0fMzpObgNJZ4=;
	7:hhPUFMazyPINI65DjhFwDdQFFdMnklFivD1OAdh2XBYC39bcCTvli+OkONnpkYH3pbVGMCol8PnKqUKwlt4LS5fCeI9O0h0LVd0noVyubJpidxSN1NlSWJhr60f3KDzHZXmPicw9TFX3Dzh6RUwXihS82PIm4gW+f9MtCsmTGrbeCtobnc/iItfnJDwaiHeg9s1z0ASY374GU7hrt003zpqC5AVS+DBVPme/xnATZPk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2017 00:19:05.1628 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1924
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.67
Subject: [Qemu-arm] [PATCH v2 05/47] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, armbru@redhat.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: X7Vip7QbIDh3

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm@nongnu.org
---
V2:
 - Split hw patch into individual directories

 hw/arm/armv7m.c      |  2 +-
 hw/arm/boot.c        | 34 +++++++++++++++++-----------------
 hw/arm/gumstix.c     | 13 +++++++------
 hw/arm/mainstone.c   |  7 ++++---
 hw/arm/musicpal.c    |  2 +-
 hw/arm/omap1.c       |  5 +++--
 hw/arm/omap2.c       | 23 ++++++++++++-----------
 hw/arm/omap_sx1.c    |  6 +++---
 hw/arm/palm.c        | 10 +++++-----
 hw/arm/pxa2xx.c      |  7 ++++---
 hw/arm/stellaris.c   |  3 ++-
 hw/arm/tosa.c        | 17 +++++++++--------
 hw/arm/versatilepb.c |  2 +-
 hw/arm/vexpress.c    |  8 ++++----
 hw/arm/z2.c          |  6 +++---
 15 files changed, 76 insertions(+), 69 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index bb2dfc942b..56770a7048 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -278,7 +278,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
 #endif
 
     if (!kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Guest image must be specified (using -kernel)\n");
+        error_report("Guest image must be specified (using -kernel)");
         exit(1);
     }
 
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..5b2d17f08a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include <libfdt.h>
 #include "hw/hw.h"
@@ -418,13 +419,13 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         char *filename;
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, binfo->dtb_filename);
         if (!filename) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", binfo->dtb_filename);
+            error_report("Couldn't open dtb file %s", binfo->dtb_filename);
             goto fail;
         }
 
         fdt = load_device_tree(filename, &size);
         if (!fdt) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", filename);
+            error_report("Couldn't open dtb file %s", filename);
             g_free(filename);
             goto fail;
         }
@@ -432,7 +433,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     } else {
         fdt = binfo->get_dtb(binfo, &size);
         if (!fdt) {
-            fprintf(stderr, "Board was unable to create a dtb blob\n");
+            error_report("Board was unable to create a dtb blob");
             goto fail;
         }
     }
@@ -451,7 +452,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
                                    NULL, &error_fatal);
     if (acells == 0 || scells == 0) {
-        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
+        error_report("dtb file invalid (#address-cells or #size-cells 0)");
         goto fail;
     }
 
@@ -459,8 +460,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide
          */
-        fprintf(stderr, "qemu: dtb file not compatible with "
-                "RAM size > 4GB\n");
+        error_report("qemu: dtb file not compatible with RAM size > 4GB");
         goto fail;
     }
 
@@ -480,7 +480,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                                               acells, mem_base,
                                               scells, mem_len);
             if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
+                error_report("couldn't set %s/reg for node %d", nodename,
                         i);
                 goto fail;
             }
@@ -505,7 +505,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+            error_report("couldn't set /memory/reg");
             goto fail;
         }
     }
@@ -519,7 +519,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         rc = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                      binfo->kernel_cmdline);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/bootargs\n");
+            error_report("couldn't set /chosen/bootargs");
             goto fail;
         }
     }
@@ -528,14 +528,14 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                    binfo->initrd_start);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+            error_report("couldn't set /chosen/linux,initrd-start");
             goto fail;
         }
 
         rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                    binfo->initrd_start + binfo->initrd_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+            error_report("couldn't set /chosen/linux,initrd-end");
             goto fail;
         }
     }
@@ -690,7 +690,7 @@ static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
         gsize length;
 
         if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            fprintf(stderr, "failed to load \"%s\"\n", image_name);
+            error_report("failed to load \"%s\"", image_name);
             exit(1);
         }
         size = length;
@@ -956,7 +956,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         is_linux = 1;
     }
     if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
+        error_report("qemu: could not load kernel '%s'",
                 info->kernel_filename);
         exit(1);
     }
@@ -976,7 +976,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
                                                   info->initrd_start);
             }
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initrd '%s'\n",
+                error_report("qemu: could not load initrd '%s'",
                         info->initrd_filename);
                 exit(1);
             }
@@ -1021,9 +1021,9 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         } else {
             fixupcontext[FIXUP_ARGPTR] = info->loader_start + KERNEL_ARGS_ADDR;
             if (info->ram_size >= (1ULL << 32)) {
-                fprintf(stderr, "qemu: RAM size must be less than 4GB to boot"
-                        " Linux kernel using ATAGS (try passing a device tree"
-                        " using -dtb)\n");
+                error_report("qemu: RAM size must be less than 4GB to boot"
+                            " Linux kernel using ATAGS (try passing a device tree"
+                            " using -dtb)");
                 exit(1);
             }
         }
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index bba9e9f57a..8bd34956b7 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
 
@@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, connex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("qemu: Error registering flash memory.");
         exit(1);
     }
 
@@ -99,8 +100,8 @@ static void verdex_init(MachineState *machine)
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
 
@@ -113,7 +114,7 @@ static void verdex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, verdex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("qemu: Error registering flash memory.");
         exit(1);
     }
 
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index d07972a966..5c454c7109 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -143,8 +144,8 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
             if (qtest_enabled()) {
                 break;
             }
-            fprintf(stderr, "Two flash images must be given with the "
-                    "'pflash' parameter\n");
+            error_report("Two flash images must be given with the "
+                         "'pflash' parameter");
             exit(1);
         }
 
@@ -154,7 +155,7 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, MAINSTONE_FLASH / sector_len,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("qemu: Error registering flash memory.");
             exit(1);
         }
     }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b648770882..06127a873d 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1626,7 +1626,7 @@ static void musicpal_init(MachineState *machine)
         flash_size = blk_getlength(blk);
         if (flash_size != 8*1024*1024 && flash_size != 16*1024*1024 &&
             flash_size != 32*1024*1024) {
-            fprintf(stderr, "Invalid flash image size\n");
+            error_report("Invalid flash image size");
             exit(1);
         }
 
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 64f2ee8356..c6d19387fc 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2313,7 +2314,7 @@ void omap_uwire_attach(struct omap_uwire_s *s,
                 uWireSlave *slave, int chipselect)
 {
     if (chipselect < 0 || chipselect > 3) {
-        fprintf(stderr, "%s: Bad chipselect %i\n", __func__, chipselect);
+        error_report("%s: Bad chipselect %i", __func__, chipselect);
         exit(-1);
     }
 
@@ -3989,7 +3990,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
 
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("qemu: missing SecureDigital device");
         exit(1);
     }
     s->mmc = omap_mmc_init(0xfffb7800, system_memory,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 758a26f3d8..e7afcc822a 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
     /* TODO: update clocks */
 
     if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
-        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
-                __func__);
+        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
+                     __func__);
 }
 
 static void omap_prcm_dpll_update(struct omap_prcm_s *s)
@@ -1331,7 +1332,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s *s)
     s->dpll_lock = 0;
     switch (mode) {
     case 0:
-        fprintf(stderr, "%s: bad EN_DPLL\n", __func__);
+        error_report("%s: bad EN_DPLL", __func__);
         break;
     case 1:	/* Low-power bypass mode (Default) */
     case 2:	/* Fast-relock bypass mode */
@@ -1358,7 +1359,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s *s)
         omap_clk_reparent(core, dpll_x2);
         break;
     case 3:
-        fprintf(stderr, "%s: bad CORE_CLK_SRC\n", __func__);
+        error_report("%s: bad CORE_CLK_SRC", __func__);
         break;
     }
 }
@@ -1627,8 +1628,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
 
     case 0x500:	/* CM_CLKEN_PLL */
         if (value & 0xffffff30)
-            fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKEN_PLL for "
+                         "future compatibility", __func__);
         if ((s->clken[9] ^ value) & 0xcc) {
             s->clken[9] &= ~0xcc;
             s->clken[9] |= value & 0xcc;
@@ -1646,8 +1647,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
         break;
     case 0x540:	/* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL1_PLL for "
+                         "future compatibility", __func__);
         if ((s->clksel[5] ^ value) & 0x003fff00) {
             s->clksel[5] = value & 0x03bfff28;
             omap_prcm_dpll_update(s);
@@ -1658,8 +1659,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
         break;
     case 0x544:	/* CM_CLKSEL2_PLL */
         if (value & ~3)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
+                         "future compatibility", __func__);
         if (s->clksel[6] != (value & 3)) {
             s->clksel[6] = value & 3;
             omap_prcm_dpll_update(s);
@@ -2486,7 +2487,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
 
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("qemu: missing SecureDigital device");
         exit(1);
     }
     s->mmc = omap2_mmc_init(omap_l4tao(s->l4, 9),
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 9a14270795..6eb56ae744 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -158,7 +158,7 @@ static void sx1_init(MachineState *machine, const int version)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("qemu: Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -182,7 +182,7 @@ static void sx1_init(MachineState *machine, const int version)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash1_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("qemu: Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -194,7 +194,7 @@ static void sx1_init(MachineState *machine, const int version)
     }
 
     if (!machine->kernel_filename && !fl_idx && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or Flash image must be specified\n");
+        error_report("Kernel or Flash image must be specified");
         exit(1);
     }
 
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709d..7f3637041a 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -233,8 +233,8 @@ static void palmte_init(MachineState *machine)
     if (nb_option_roms) {
         rom_size = get_image_size(option_rom[0].name);
         if (rom_size > flash_size) {
-            fprintf(stderr, "%s: ROM image too big (%x > %x)\n",
-                            __func__, rom_size, flash_size);
+            error_report("%s: ROM image too big (%x > %x)",
+                         __func__, rom_size, flash_size);
             rom_size = 0;
         }
         if (rom_size > 0) {
@@ -243,13 +243,13 @@ static void palmte_init(MachineState *machine)
             rom_loaded = 1;
         }
         if (rom_size < 0) {
-            fprintf(stderr, "%s: error loading '%s'\n",
-                            __func__, option_rom[0].name);
+            error_report("%s: error loading '%s'",
+                         __func__, option_rom[0].name);
         }
     }
 
     if (!rom_loaded && !kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or ROM image must be specified\n");
+        fprintf(stderr, "Kernel or ROM image must be specified");
         exit(1);
     }
 
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index db860c238e..ffcb83d1a3 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2062,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     s = g_new0(PXA2xxState, 1);
 
     if (strncmp(cpu_type, "pxa27", 5)) {
-        fprintf(stderr, "Machine requires a PXA27x processor.\n");
+        error_report("Machine requires a PXA27x processor.");
         exit(1);
     }
 
@@ -2095,7 +2096,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
 
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("qemu: missing SecureDigital device");
         exit(1);
     }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
@@ -2220,7 +2221,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
 
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("qemu: missing SecureDigital device");
         exit(1);
     }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index de7c0fc4a6..f6f295b363 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
@@ -559,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        error_report("Peripheral reset not implemented");
         break;
     case 0x054: /* IMC */
         s->int_mask = value & 0x7f;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index a55b1a369c..a069c95f1c 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -70,19 +71,19 @@ static void tosa_out_switch(void *opaque, int line, int level)
 {
     switch (line) {
         case 0:
-            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
+            error_report("blue LED %s.", level ? "on" : "off");
             break;
         case 1:
-            fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
+            error_report("green LED %s.", level ? "on" : "off");
             break;
         case 2:
-            fprintf(stderr, "amber LED %s.\n", level ? "on" : "off");
+            error_report("amber LED %s.", level ? "on" : "off");
             break;
         case 3:
-            fprintf(stderr, "wlan LED %s.\n", level ? "on" : "off");
+            fprintf(stderr, "wlan LED %s.", level ? "on" : "off");
             break;
         default:
-            fprintf(stderr, "Uhandled out event: %d = %d\n", line, level);
+            fprintf(stderr, "Uhandled out event: %d = %d", line, level);
             break;
     }
 }
@@ -133,7 +134,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
 
 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
 {
-    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
+    error_report("TG: %d %02x", value >> 5, value & 0x1f);
     return 0;
 }
 
@@ -159,13 +160,13 @@ static int tosa_dac_send(I2CSlave *i2c, uint8_t data)
     s->buf[s->len] = data;
     if (s->len ++ > 2) {
 #ifdef VERBOSE
-        fprintf(stderr, "%s: message too long (%i bytes)\n", __func__, s->len);
+        error_report("%s: message too long (%i bytes)", __func__, s->len);
 #endif
         return 1;
     }
 
     if (s->len == 2) {
-        fprintf(stderr, "dac: channel %d value 0x%02x\n",
+        error_report("dac: channel %d value 0x%02x",
                 s->buf[0], s->buf[1]);
     }
 
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 418792cd02..f0ae069172 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -364,7 +364,7 @@ static void versatile_init(MachineState *machine, int board_id)
                           VERSATILE_FLASH_SECT_SIZE,
                           VERSATILE_FLASH_SIZE / VERSATILE_FLASH_SECT_SIZE,
                           4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("qemu: Error registering flash memory.");
     }
 
     versatile_binfo.ram_size = machine->ram_size;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index efb5a29475..508629dfe9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -266,7 +266,7 @@ static void a9_daughterboard_init(const VexpressMachineState *vms,
 
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
-        fprintf(stderr, "vexpress-a9: cannot model more than 1GB RAM\n");
+        error_report("vexpress-a9: cannot model more than 1GB RAM");
         exit(1);
     }
 
@@ -355,7 +355,7 @@ static void a15_daughterboard_init(const VexpressMachineState *vms,
          */
         uint64_t rsz = ram_size;
         if (rsz > (30ULL * 1024 * 1024 * 1024)) {
-            fprintf(stderr, "vexpress-a15: cannot model more than 30GB RAM\n");
+            error_report("vexpress-a15: cannot model more than 30GB RAM");
             exit(1);
         }
     }
@@ -640,7 +640,7 @@ static void vexpress_common_init(MachineState *machine)
     pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
                                        dinfo);
     if (!pflash0) {
-        fprintf(stderr, "vexpress: error registering flash 0.\n");
+        error_report("vexpress: error registering flash 0.");
         exit(1);
     }
 
@@ -655,7 +655,7 @@ static void vexpress_common_init(MachineState *machine)
     dinfo = drive_get_next(IF_PFLASH);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
-        fprintf(stderr, "vexpress: error registering flash 1.\n");
+        error_report("vexpress: error registering flash 1.");
         exit(1);
     }
 
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 60561c7b7c..5048439799 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -319,8 +319,8 @@ static void z2_init(MachineState *machine)
 #endif
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "Flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("Flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
 
@@ -329,7 +329,7 @@ static void z2_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, Z2_FLASH_SIZE / sector_len,
                                4, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("qemu: Error registering flash memory.");
         exit(1);
     }
 
-- 
2.11.0

