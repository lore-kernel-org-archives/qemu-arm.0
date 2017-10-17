Received: by 10.223.197.9 with SMTP id q9csp4843327wrf;
        Tue, 17 Oct 2017 10:37:36 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBys0CmOgyO49cAaXD91EVmzvAIaXJnsSjH5XP9vm7tT3mAjKxDuvURwOsSkWSpLek4b5A8
X-Received: by 10.200.34.71 with SMTP id p7mr21975634qtp.81.1508261856071;
        Tue, 17 Oct 2017 10:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261856; cv=none;
        d=google.com; s=arc-20160816;
        b=BWLwIcs3tOpbt2CxeMeW/6aVFvjEjSp8vnb4QjQ5tDLm9rrupBWCwozqiYvLN5wvHJ
         7IooPHE7wPHSjASLwKIj18wEqgm7eK2SfLtltyT16eNc5b4W2nzVUrNOGH1aAeCiTYgR
         9LABUITnZHvN1MSitriSyqPF0pWRItPfcZIGGWk/T8xk/MW/NzMEjelDhpjP4afxLEBo
         IJc8qjcTz5Hh33fdqPLbdtaffVe+8rZTT2SPEHvJwa3da1MIC3tIgFlHT2huq9IVlwSb
         4YswxQVZvnlREcfhaQcKCj4gyv4l8YuevhJcKHLpIHEVdTSVxGSdnaTerz+u383rNk0A
         rmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=lSCyAUYnSsOUzabSN7Q+n3ALL4n1yVAknuOiXdIf0+c=;
        b=L47pLBb1zXUuakyr4Gto5YpENvoTInKhQvK19poPCtpD1nkHND2kQ3pOqk+/rlkI1O
         X7XpHdcLxy1KY6Qoxab2tPlnfR870BkMEqcXzHiikiMhLhWka8a04fHoHuy2cyJhItPP
         eq2SjX9XIXtLoXUVouDWdDknDFpJK3kUKCxRRydO/WAbwJxKlWIm0OmvVGXbh8es2h/8
         z3rb6ENVvwbF4mXdwHRuJSPzX6H4BGeUl/eQRgqF9WGRgwpPT7roH+UoRREFU7OG2esh
         Z7zaYHi/5G75dWFvq02x0XmtpZ9SLrTcJ+Ggh23VuKGzXHRLAwvWnCu0Hm5XBSSWbtiB
         nEtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=UkC7+cfd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4si3902550qkc.336.2017.10.17.10.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=UkC7+cfd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Vo5-0007hx-O0
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:37:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkS-0004w5-6q
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkN-0006HN-SP
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:48 -0400
Received: from mail-dm3nam03on0074.outbound.protection.outlook.com
	([104.47.41.74]:46304
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkN-0006GD-DZ; Tue, 17 Oct 2017 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lSCyAUYnSsOUzabSN7Q+n3ALL4n1yVAknuOiXdIf0+c=;
	b=UkC7+cfdYt5YXy8MhYTuv7nNVNyhIzDXaIS7OkcVHpZkaXW/YPuZduNQc4ywG5iW9vz3bXi9w4uTre4SqoJ+Ry8xj4zHhdGGUBwpfybvSVtChXPqBtgNoq6BPDmnPG3lFUkIIUFJjUN3RLcbJJuCqqFMBP7uzItwyt9sGBV8MZc=
Received: from BN6PR02CA0040.namprd02.prod.outlook.com (10.173.146.154) by
	CY4PR02MB3382.namprd02.prod.outlook.com (10.165.89.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:40 +0000
Received: from BL2NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by BN6PR02CA0040.outlook.office365.com
	(2603:10b6:404:5f::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT006.mail.protection.outlook.com (10.152.76.239) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0002Qf-9x; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0000mb-6M; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkF-0000m1-54; Tue, 17 Oct 2017 10:33:35 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:46 -0700
Message-ID: <94d28514b0604f92c262fcbc097245d593f497d8.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(199003)(189002)(575784001)(77096006)(5660300001)(8676002)(2906002)(39060400002)(106466001)(189998001)(356003)(50226002)(81156014)(4326008)(305945005)(8936002)(81166006)(63266004)(33646002)(47776003)(6666003)(36386004)(5003940100001)(2950100002)(76176999)(230783001)(9786002)(2201001)(118296001)(478600001)(50466002)(36756003)(316002)(110136005)(54906003)(48376002)(50986999)(16586007)(106002)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3382; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT006;
	1:u6HqkHsYeoB0eUg2jTW08gXeTRgE0/CNaBp0Fy7XhrLNFHy4N0fZwaZukMPH2h0ldgIir/7KsjluBDZU8WLj9tdyj4unp0c3P9L5jgNU1mXMSxWcGfgY1zu9F+oJ/gHW
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e704c5a9-779d-4750-f6a3-08d5158534a2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	3:9lR6D8ylEE9a/tlGpyTM9hOrWPaJ9MmAR+fugB6Y9O7wtWvfkr+FV/0yhzhLHd41COurBD8Zv5/LTVx1daq7P0mAYweLRJybhs8We5LMR4HxOH3ap8Ftg7d8igjvUGe5pcPU5fg8jMc9Q+S4hNbRSowBPj8A126j7wni02aDMQ4Dw34H6C1Lr6UX5WysSoFO9TE01DOE2u7NmbiTMPq8YuQ4DAzt/fYBBr6ljLgNBPIgnF9iZdtp4pYXOtfos5cqLNh4CXxEDh1m+uKLEHO87YQjYwtkzY7HrDmK8fcA0SQu2RWUeyvAEloWEvA6uzxhF2wdk3oE9PqoqqwA/sM5lgLM2hW7Xx36T+6BVcDFUiU=;
	25:BiVUYmXZ2lCZE9HtdfTtHEn8Q4fYOaNYntF1q9gE/qnHcnKEIzqXCK0cdgEfW+OEPH0izm/DZtt3/aQoFso0wicLxsJyIBCYW67ZpWUU1X+PDaDuo0HlpVuvvSw41dxwOI2aQWbLdnHdFsGK1ZkWThRqhfmT+o3Tp4PU+piZTgiOY8Iip4RAT++TwgpLqKbQiwL8y7D3lUElZQtEdrLKRqtrs1O/vtIan0xWWTw0Ax/b8+jnCjNTHeQxTyySMfCu6fVJAYZCo76lmFznqOIw5W0St0F82SzjnrHBaPLJpyQF1QJ2TlSNgMCxV5/+XB0Ovb79HyK8/H6V8oeaXQc2HA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3382:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	31:OQbtcapo9E5pfRuW7QlvjGZMcawtQa9o9TIcQx2PYuNzzDirW/MJWCyA79i25X2z6ecgTqh/wvjtkJbsNL8YtRgewrmxwvOQT72BsoXZxggK+ddWcqYrJsAS9YkmjNS7ke2apgg+8eBjFFFlfeS75BZcQ2vKr8KJe0Xg/aYHmPYbObwic7NTCBT2EYRe2ExJP0A20ay/JmAEJHKxUsSmjgZCPQJuLGo2I+CT9Lf1sdA=;
	20:SWRLgdu7BiCVw+cM7H6ptACTRIirmU4M4g13Y+1JZyV1oGk2J3Bx15iNOq5TN2jrEeK3GdeyJIuTW2xAlXuxTR3FPrqw1zgzNEDG3l2Md+Vbnl0RK0ZpceWNusExA9RXmEKTe1ouucSvI+us4MPx+JEdUzaqkuX++c2xWH6PLV37MRe90zX5iwF5Ykf5hyTchLPAQcPNf0Eh4QizfusMlVaj1flQk26ymiIqG3RoCRWynlc6h2GqkOV6QHc9Ku10xsfGTFs+m/W8EneDu7P8cpOYmKuUa3ZS/KFBV1ycveBw6wSm7S2vaIh5xCnD9IvXQavK31xuk7JAXR4qnZZ3CkO1Wk7C8gRlHN0iwmWLIV8b54vqIhwKlMRzroTx64lyVka1jrYnDDx+ETWRLjFYhrzFUUYYoe899o/Y7Rxfr/1kwUwzDfF9UOl4oRVlif87GGB7dMEUcyxEC8nCw6Dj09T9zRvw3/QbURQXVqOrk4spjy2k0IAUA04NQ9l6AvFn
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY4PR02MB3382E0BEB6091722457F5A01DC4C0@CY4PR02MB3382.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3382; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	4:I+2vWeNuMtZBLj+DMB/ln5yGYXRlBIl2isEhoI8B31up18XDvq8rCmtMAQmVkirMNwm7H933AtWBNasgtG/I2LFFJGYkj7MFH0NaLuG/wecQZcRj6NaeTFRK3mknKm7s4+GAtyw+mmDcoEic+4+FPGIWbT64gxB+wGD72YuzPsawm1VQ7DLiUUXPYpw48Nw7lb3IfMxF1srRU5kO3r1OOblRL9lF9TlR5pXd9VAZwmYkhngBK09zkN6gSuKTb2JMMiYpFCxZ0XnxyiLhEhUhGQM4/6pvuypmddWgeU+IkVk18mVPMgPHlv9AtopyqH5D5XIoQbwHpQvBJ5ju+lrc9g==
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3382;
	23:jNTBsi8Gp6r34TzPLK6QiSSqQw3w5KvF/NCUmYeQx?=
	=?us-ascii?Q?/H6l2Y+9Hx6AAE+j1aDd3x2jarwCwXQ+HPcsqfzMXaUNi/sJEemH3i97daG1?=
	=?us-ascii?Q?dblUJKXqdfo1ZLJ4J3okRmk8AuieLdc9RbDGevSzOsxlUn/6IZy9V5bjshOO?=
	=?us-ascii?Q?XrtGLKAkYMXMzPmzEc/zucbJ4pPm2sU6AAUXX05znExFT/zr/57/KJKmkxPl?=
	=?us-ascii?Q?4sUq/zpBzaToy4dnHpFYehMoeS170mPxgVSQivyDRkuAdKMqWkd5yRL/e7wA?=
	=?us-ascii?Q?5Wfvi3SA0ie4PXrMKbTlGt5VygP8msn/iuesKBagLowaln/rx92K9hGR1Jb1?=
	=?us-ascii?Q?gRoYGfpOxOnghV4k1eizbMaxJ3jgPjc50kHLqEigQfxoPKFN9lQogxbhbfuo?=
	=?us-ascii?Q?8hCOceLsg8YzNz8trsnSQtqrPRkyTyibpHLb0p4mf7ODvCeZCY3Wa5Xms7FT?=
	=?us-ascii?Q?ldaZqW8tKTRefZdwynBAlk3IOFp+JeQThm19D7hDn3YfZ/c7BkW6EeXKCuIh?=
	=?us-ascii?Q?EcrV/7EQ+NeFzzj+KX9hI9abVOZ/PBZlWPFQA73bpNpoFiFldgl5Fif9pUVe?=
	=?us-ascii?Q?JpS+qEV2XXFjkiYNhgummsKadiGpPCI5n46JK++EaVzVzBiJWGWQV1W//JOY?=
	=?us-ascii?Q?MR2c1LvQHIG3G8QqvUy/S26ygztqkV/H7EwobOqr7H7I75i6Tc0ow+gp3JF+?=
	=?us-ascii?Q?IE40tOqDPnm+h9WrzL128MVLApMhSZVyojwmC3tRecqW+RyHysT+K96ptWTX?=
	=?us-ascii?Q?e1vc+T/nMlsuvyfFVQAcMGVkUQd4fBsANbgdwUAjieL8JFNJH5CG9S5eMAml?=
	=?us-ascii?Q?CNpjPOxLLZctVI4SMKyyNOcaKU9YVCsmE4PqzcNa/nKWn70mDZAZJUgPXRQz?=
	=?us-ascii?Q?xVEaIW8OLK6CJ3C+r+zaAj5P/X2wHECM3f6B88A4XzmKiyDSEAA9TT1fSlEO?=
	=?us-ascii?Q?ui/fiLMUZDa8bRLoHvPiWT/UBx5cOKXDJYcwbZB3woi+pdM4b9YmbAr+hWhG?=
	=?us-ascii?Q?Z1dVfsXAoAvFFVZwRaYOCQ3gwXpynDJ4HUcE1GQpCBxbo+SL96e9I+LsZ7uU?=
	=?us-ascii?Q?lIV8X642m/7bIfbjoSR/DKwli9oZVIw/890fswawMb5lwqWNgFMQnvaEffr6?=
	=?us-ascii?Q?w2SgBM0BL4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	6:Lz77q4pfwUKEDDLYXvjQWsadbsvxaeJLi+haOufLfgwFDxZUHZ4+fPsyIJOO3Eg+zVbjFCSUUXrkT73WnDE6UfV5ETvrB32dhQB5EDWYaY7WnoxHXzZi5pvKr/Ie28FMvXKhDGpWQjRjEVQ3jB9v8IZKjlc7g41s8kfMVJ64VbyqGCc0Ybc7TPP7oWaMRiMsYQNtT6m4mjvazFUm9m5GzGy4bFNKxKDseDP22z2qXwWwhOidZk1HOi+4jJoRgQdK0t7hNX9vyGK28cRl9Nrjo1lEHpa0fZAzT2Joj7djTf1EgCMUSwKrdzdjrkgKsVMcEFHenoo3CeFHcPVYIx6QYQ==;
	5:62OEvKK47w8Uq6em93tx0ZU+nFUiP/vSGJvYFEyqHzw784Dcdis0sT72iu7bJd3sJOLOzx2TGTIjk8ytz11lY1BL6hhRMJtTHlUr0/OqXy6kGD4RZWYvJ/VVyrL6HbMfo5LL6QlE3d8W48nvQs4H/7vmAzbPWpszC783SCx/bWg=;
	24:5kvJGK4N+aTY8G4Iz8jVlmvh3x1max62jOp0wGmPSvUcivyzvLA80eyBY3eJGvmnquMD5mCr90B52jUeBeWVjnH8qFy+GOJP1NCwvE2lwfo=;
	7:7D3CXl0vYsbm7cCCAuFZ/UjX9s55FMMQZrndrVkCXR4MzRrR7WV3BRBQ7FQK48obuhN4YNwu+bePtiFSUWUyPZmFvY4BDj98IXbXPQHNNc33QdnPofcXBs0qERnDhhIS2xFvRaULgUJyBLL/Ls+hHOdj9kEqahSUdit7OXv1gFr9SiZvdbkCPROQKxY7QobJY0QU/vYcO7N/mD4NxwVITiafr7SQKDcrek7Vao296Zw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:39.8222 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3382
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.74
Subject: [Qemu-devel] [PATCH v4 2/8] xlnx-zynqmp-pmu: Add the CPU and memory
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3GfwQ/oojR3X

Connect the MicroBlaze CPU and the ROM and RAM memory regions.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

V4:
 - Remove the ZCU102 name
V2:
 - Fix the pmu-cpu name
 - Use err and errp for CPU realise instead of error_fatal

 hw/microblaze/xlnx-zynqmp-pmu.c | 70 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index ac0f78928a..c6a0b3b8a1 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -18,8 +18,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "exec/address-spaces.h"
 #include "hw/boards.h"
+#include "hw/qdev-properties.h"
 #include "cpu.h"
+#include "boot.h"
 
 /* Define the PMU device */
 
@@ -27,21 +30,56 @@
 #define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
                                               TYPE_XLNX_ZYNQMP_PMU_SOC)
 
+#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
+#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
+#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
+    MicroBlazeCPU cpu;
 }  XlnxZynqMPPMUSoCState;
 
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
+    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
 
+    object_initialize(&s->cpu, sizeof(s->cpu),
+                      TYPE_MICROBLAZE_CPU);
+    object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
+                              &error_abort);
 }
 
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
 {
-
+    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
+    Error *err = NULL;
+
+    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
+                             "base-vectors", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
+                             &error_abort);
+    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
+                            &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
@@ -70,7 +108,35 @@ type_init(xlnx_zynqmp_pmu_soc_register_types)
 
 static void xlnx_zynqmp_pmu_init(MachineState *machine)
 {
-
+    XlnxZynqMPPMUSoCState *pmu = g_new0(XlnxZynqMPPMUSoCState, 1);
+    MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
+    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+
+    /* Create the ROM */
+    memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
+                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
+                                pmu_rom);
+
+    /* Create the RAM */
+    memory_region_init_ram(pmu_ram, NULL, "xlnx-zynqmp-pmu.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                                pmu_ram);
+
+    /* Create the PMU device */
+    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQMP_PMU_SOC);
+    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
+                              &error_abort);
+    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
+
+    /* Load the kernel */
+    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                           machine->ram_size,
+                           machine->kernel_filename,
+                           machine->dtb,
+                           NULL);
 }
 
 static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
-- 
2.11.0

