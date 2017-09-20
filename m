Received: by 10.223.172.38 with SMTP id v35csp1195720wrc;
        Wed, 20 Sep 2017 15:05:51 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDe5HZ/K+O/HGsQ6MdPJ0dY0Ks3ZbF1349hlR+KCqyuYPKuMJUgq6vkAjH6vzKr63sk0Fze
X-Received: by 10.28.211.66 with SMTP id k63mr4864924wmg.33.1505945151456;
        Wed, 20 Sep 2017 15:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945151; cv=none;
        d=google.com; s=arc-20160816;
        b=QzIISRR2NfU/VxaMt2PqfcLX2o07KGW/uSUJW/smlS8j1Sx+skhyW0oLfc0vUJHoW3
         e2DJT35aL7dcGvCZzYGwxOwDWOd/XZ8r79HKotE1Q+r9wShWP+h/Av26H0jECe6M4CWs
         E1/CGospvznU7GAdZnZLfM0TK/keEktggBn5Gn+ZnXG/enGAhZmOZoNXa9jZ8PItAHj6
         p8me8Q1sgXZjgmbLrck1ycqz5o08WYUhZWFxawqkpc7PFZPMYwjMIRRY+4j3xIgzFd9f
         CBipZ8HXYjSHMvmrw3pj0A2ChKZwUfSQFn56QiA2Ly/pnsj82RKjByV+VWUznDgn9Yrs
         kbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=FNAzIUiukrqNoMRKfQ1Q6SiXhV7sOE9PEpQnRfqV1lc=;
        b=xirdwusmVqqFOBjWJb11P4myrBFgfraMgfgkwZk56YGxbyMZ/a0kFRQAgFJ3nt8rXc
         ZkCQ4xTnbvyZPHcEh0fnM4TRupFmDQ5sc1EmJw3572bPHz+nruBrfPrK5t3u1thyptwv
         PGeoF//zzf+76cK5CwQ8JkKtYJtWaHQUb9kcuDS+nnB3+UzrU/EprQpXT0A9D2gqKA1I
         H2Nh10zB/7u4cNZYWefj+lKfIZ/cfO7+RzPjkxZwoRzylIPOLHfl56DdcJ6tJ8optM+f
         Pz1nqr2PUOJ+yFn6qdNAQDWiTpXs3dYeaKDC7hFIFKn19UYIqGP8Q1T6P5Ui4JzXILVV
         SqgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=iRLz9DEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m184si156680wmg.132.2017.09.20.15.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=iRLz9DEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dun7u-0000vf-6R
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:05:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7W-0000nb-0r
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7S-0007eY-1D
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:26 -0400
Received: from mail-by2nam01on0085.outbound.protection.outlook.com
	([104.47.34.85]:14688
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7R-0007ZT-E7; Wed, 20 Sep 2017 18:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FNAzIUiukrqNoMRKfQ1Q6SiXhV7sOE9PEpQnRfqV1lc=;
	b=iRLz9DEkf3T4r6MKevzwpeyk8AvBVMtDKsO79NBXaiyWPP14BhJ28xOSn6sznmamG75ICIq3WHA0/Ffr+dK4Ske6WBJzVUqvcPdDZD1FbfXJuCnIIzDkH6WZYI7iBpY1ltdhyRnAolIoUCQq1Twj0wf62mW8iSphbu/W8I32jGU=
Received: from CY4PR02CA0002.namprd02.prod.outlook.com (10.169.188.12) by
	BLUPR02MB1122.namprd02.prod.outlook.com (10.163.79.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 20 Sep 2017 22:05:19 +0000
Received: from CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by CY4PR02CA0002.outlook.office365.com
	(2603:10b6:903:18::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.8 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT048.mail.protection.outlook.com (10.152.74.227) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7N-0000e9-6a; Wed, 20 Sep 2017 15:05:17 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7N-0002Ig-2T; Wed, 20 Sep 2017 15:05:17 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5Cth025598; Wed, 20 Sep 2017 15:05:13 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7I-0002GY-SE; Wed, 20 Sep 2017 15:05:12 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:33 -0700
Message-ID: <3e3eaffaff956a406588ed26cddcbe3a7fb385d6.1505929556.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(199003)(189002)(50986999)(47776003)(36386004)(356003)(76176999)(106466001)(2201001)(2906002)(77096006)(316002)(39060400002)(54906003)(50226002)(5003940100001)(9786002)(63266004)(305945005)(230783001)(118296001)(48376002)(6666003)(4326008)(16586007)(50466002)(110136005)(189998001)(478600001)(36756003)(81166006)(2950100002)(8936002)(33646002)(5660300001)(81156014)(8676002)(107986001)(2004002)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1122; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT048;
	1:yzE+o62imn6uxG9nVdf+UEB8992wuGutBjqh0ILBEUzc6n7VTF+fvnuKzwCV/QkW/8cmKdlQKlPhLauQcQ9EiNU3l5LQEr8wZNj+9S3jdSAwD49ADVOPtKCmkzYXjXpg
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ae97a95-41a8-442f-3f69-08d50073ae39
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR02MB1122; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	3:sH/qxDq7MRbMl3uhkxl6ABmJQnb0duncp4RpVhE+dKDatsk1ufgK8opDrMwr5l+sIOsBSLxXvYAWwNFT8JhM6UCGOU+6dS9xCFbUKK0PUym2df7YXxwNPrKCLwIEsaT4QrUFZCY1O7CSrO+yx4/0Ij9Em6k5AnYWgr8DerbOA/4mqydz+KQxB/OkJES/ROGd2r39UUZh+QGDaF7pI3NPVPCDMMbzfAgYWymFjd6THlowtBzKeW5TSDLG4KB13PNdspuL7kFbWExM5Zhk13VaFJ4yFYs9jTAXa/wK98fdyPF/A01sHv2Ig3HX5FNPQf7U58Dd2lsuJhSkBnFbTkRw+Bo60LBYYQj76+mOe3nhYmw=;
	25:gwet4ViyxLEOWD8T9zj2VC5FVm3V9c6WLdqn3SJ/5ICvoeEXjO4uTbKZ4aPy7DJRZkxgMre1tRiif/c/E62rOMLA85s6TyeGKVrTUrTRcZ0m6qj8FTZyIWUw6eJ6U/55m+NERF332RpcUaHvTf+6u81zHNpDw33bccv1dfq7bO8qGm/L20aFPrgwiHrGjo1Poi7PMbjdo2EOzw7YRXsMPKEo9F14xRaCidkFY0C3QR7JHlqnnESHPNb3ZgHRyo3GEcv+HmluEGjv8SghAT80R/31fWfl/oU3tDUS2FQ+CVWPPnJTxGgQOvlbuwqTx7iMzRxSR+Yyk0kn5Krqp5UBQg==
X-MS-TrafficTypeDiagnostic: BLUPR02MB1122:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	31:cILII8LvJOOx4MU5i+csr9lSN8Y3PCmb8GmTMPUhn/KsM4zQJTmMZQXYhvwl74xKHL33wYrEh7z/0sishHjr4Cdc6i51WWE52C61ob+JOpmjoUBvWe+lJEiLYpxawdfM0amus7VkkWQ43uSygzV4RgLa9pdqiDAV8R1byIBB+sCQT6B7stl3oIeNLVzmMpaz5R2P7k9OA51nsUQT+w3BRL6mcf7jg2lttJdnoyeTvrk=;
	20:aIVdDBmNNo+vzalzfjHHQBCufBG9oRwbUhJ+RgaGmVG8JT/iSX6df4Ir5st7zAfB2nsGY6Co8eO8q0UNLqZm/wETVPH0O4K36lM2EhjIKG4h5Ml2rmqH4WEbK33j8D7J15QFHdNNbpuxVwfCngCxwFmMA7GdDV4Tu7uLQW8yCvxsbUMCraglWZA0ihAbK+ElRUlz0ZLZ/XNyxBFHFpwtYVb5x32RTkSiOF9TTkLSbLhs+nznAoPojj4AwQ4RcGsBVjfg14oCp59zVeppVVXRHatLFAC/CLjCcu1g6EJUoItOWGpqk7b13RszMOCaFNR9xPkNPokjq5hRN2RDkKy2gQfGznbs2CBsTyPMt0T7LVoUVxKFRm/6vChFuIx0fpiY/Gn3wGjR5xyYlDclEK1PEgtnQiXNGPXpmMS76BNfH9zn2STsO8zRgEInE6TMzNEA4Kn5MsyfI+WvqvCDpGTk35zOnMuUg81GgF95s+FqFVDDcPRkDpJf81xfDc8e2RmA
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <BLUPR02MB11224FC31CE7D8961D7B4A77DC610@BLUPR02MB1122.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR02MB1122; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR02MB1122; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	4:QqVRu1yMO1nT3wqyz86IK6v8VmbQflFfqSoO470lw0Z7lN6uyATrHMziw8wqdcrNaB/IUn/j1EmWJOCDoOhdSSPzRv2kXdTW6s5DeNrxjwmCgsOZg8mlUCB/7+eBLsWad/x1VrkOYXAL1m/TLgBFhM5FG+Dbav/DETUrc1q5GyKq2BNEYxinhA9a2cHhbXlGxzMajhK4ZrtMhbZpLU3XxbklirpP9PQFP2UEQt9f+aVQ6AoLnYAJrF1UUzX0slG8LQIMpMzFermUtmfK6ZP6eHS7wPVAQir9p/RIky2YHahvXQMxEBoJT05C9Dt+PfiikEWVteaLm8U0yXuzMQWbNw==
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1122;
	23:1Aodie/j9a6HM6IKqhZ17bauH0uDedlaEg9zVKwld?=
	=?us-ascii?Q?P7wp2jTgQXc9Q7F3ZX8JRvJbEt5TgccFXMc/jTHd8S8RN4LVK7t1nF9R+GLg?=
	=?us-ascii?Q?HHiEkkFjvZ9gOiqw51jSF72En2bqUE7rh5rZRpmvfjXDjewbc7WLq06fgjqC?=
	=?us-ascii?Q?rYn9fmLV0fSNxuxPzE4WaZYnhj54k1KOHQkiSjfOfi6blnROZTw9HpQThbZR?=
	=?us-ascii?Q?GthD1VlB19TITGFZlL0p1SyIqFzHbuXf9xUj4VPMpPMzYGLpv8r135F7tonU?=
	=?us-ascii?Q?lj5Ive1AQMxs72dx4VgdSCK7iLIialax8jM4J24LvpiEeZefYji8qtv2MFwx?=
	=?us-ascii?Q?sbtAxBEJb4AT1kt8llor0DSWSnbaCspY6YtClivvfuqY3M5tgScPIyH6OMA7?=
	=?us-ascii?Q?NVK+rJrWvKzeGntBqjarr1UU0X5Amt+SVm2QRIs7GyT4ARy8W9T1qMJzJ1ZB?=
	=?us-ascii?Q?NRe8SmBNOGASbeik4gzhQ4N+Iy3bJhf8uvqQJlbS1kfF6DyAAhHeV32n7fio?=
	=?us-ascii?Q?9EdGoQXJyjy3H1SKWUDLt0mbp9wpEhoJhkxIAZAO+AViQwmuKD7NmHi4/kHy?=
	=?us-ascii?Q?N9f5giGvzX4WKJieZfZHOkn3jHohP1utnZRfyxsPELkqJStO4LfOfD31X0sg?=
	=?us-ascii?Q?Iemk5AFLFB7zAGGDyQyMGlEfmp+S5xKybBcv49VksSDRyxLonV8VIg/g0X4V?=
	=?us-ascii?Q?NHxiz2y1J5I242UQijw9yBkzqLR8jNfeygg7GsFRD8VGzThhXFI6Putt4Wdo?=
	=?us-ascii?Q?8lW9beVm60uxdeIkCRkiUQ0swLcYbmXACCEhUm1EQIvUZXSqsktzu545UTWS?=
	=?us-ascii?Q?s9Y2FowYB5mnSfx+EDgGW/5mlTVIA+ooIFfbaibDcnuypuVmOa9pmG0hdapm?=
	=?us-ascii?Q?rCIePUSJQGShAOfURlLhwbAuKUHnyxG+63Jp3I+4lOrS6YcDjLLbG/SoiI6F?=
	=?us-ascii?Q?he71TTGtkGxVrxC8omfXyi47xUbJ3sle1/a6Dzd9v/KW89/gvEqNh06O4Etm?=
	=?us-ascii?Q?cXxOXYBy2BsIEI3wD2s8k6CXccCrHZZxp5rB8rUK/qnxinX3KUJESDb6ghWF?=
	=?us-ascii?Q?MI4QEb43vI+BZDSZrvbRMrA5c7a08P1vtuPYESiSUkXt+VjaA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1122;
	6:Fh7oWbXnsB/3K2vfyK8mJq32EwWHq5LEmvxUqlB9ljvk2GxZrwVL4oGe/37cok9+b1Cw1L9XP4OXivgper+fV1pXddIdWtXOm1UPzF5bzdURJRpOKNpcIVGcM1JVW1xj1h01v4dSrq6nQHtr2FeTTKFh+eF3RuXAilrRrRghvWtLwuJyDZJGKkcdFk1zzJ9DkEc3WUpKdLjHDZaAhimUf0AABOiUxCXsYHh74CpykkqoEBNUJxTysJVlhE1uPy4ub0lXYCo3r8IfdYm7EJ0BUbPdXYlj2JNdKcFZ7yiBIJJOYcTqlw1nCI8Xqk3G4DTjv9j2l8CCA2TAOOZtGpifRw==;
	5:ldc5qDRFY4czVdiDMCgZ/ZqFbVznrGz8D2nv6bJb6JDTnuEFRHSSxaoZGD9A1VvDN4qWvG1m0O5UZ7fctN+Fy+aW19ggpGIlS+mHFaNIGRwmIIYQ3O3L4rxIkgOIT4OzvLSa6Y3Ln1HiKJay5EOWKw==;
	24:IzCSI79+09KDFzJO2murmt8RXcDZ1fj4TyDKRvnyPYW93zGRriqYGzpyhJ/AinAy/ULVsPZVvhl1tX8lOVPl//c7Lvq8kS7kfXWRFnjk8/k=;
	7:ZmVQPWuUJaxhdJQ4tf+zIBFxiP0sT+b1UjKPItcpcARxZgJyLrIjm1CK7vzyFYpQITZf/W3HFVkCmh6EWPCRA7FS+7dAiWIy7EvFYKSakavZsV3MbzzRE/nAXjqsxG2lwppPiurXLSmdc4vhCzVdaMdsFTDSjXR+xWOBLVdUm4GWbpunGl2dHZjPrCDVEJKTWbSwmmoLj7p/20f2mM/xJMyMiwZlx7to7pAmstfHgOU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:18.2800 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1122
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.85
Subject: [Qemu-arm] [PATCH v3 1/8] xlnx-zynqmp-pmu: Initial commit of the
 ZynqMP PMU
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
X-TUID: BTkAH17OJDCU

The Xilinx ZynqMP SoC has two main processing systems in it. The ARM
processing system (which is already modeled in QEMU) and the MicroBlaze
Power Management Unit (PMU). This is the inital work for adding support
for the PMU.

The PMU susbsystem runs along side the ARM system on hardware, but due
to architecture limitations in QEMU the two instances are seperate for
the time being.

Let's follow the same setup we do with the ARM system, where there is an
SoC device and a ZCU102 board. Although the PMU is less board specific
we are still going to follow the same split as maybe in future we can
connect the PMU device to the ARM ZCU102 board. As the machine will be
fairly small let's keep them both together in one file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/microblaze/Makefile.objs     |  1 +
 hw/microblaze/xlnx-zynqmp-pmu.c | 83 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

diff --git a/hw/microblaze/Makefile.objs b/hw/microblaze/Makefile.objs
index b2517d87fe..ae9fd40de7 100644
--- a/hw/microblaze/Makefile.objs
+++ b/hw/microblaze/Makefile.objs
@@ -1,3 +1,4 @@
 obj-y += petalogix_s3adsp1800_mmu.o
 obj-y += petalogix_ml605_mmu.o
+obj-y += xlnx-zynqmp-pmu.o
 obj-y += boot.o
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
new file mode 100644
index 0000000000..fc3c8b236f
--- /dev/null
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -0,0 +1,83 @@
+/*
+ * Xilinx Zynq MPSoC PMU (Power Management Unit) emulation
+ *
+ * Copyright (C) 2017 Xilinx Inc
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "cpu.h"
+
+/* Define the PMU device */
+
+#define TYPE_XLNX_ZYNQMP_PMU "xlnx,zynqmp-pmu"
+#define XLNX_ZYNQMP_PMU(obj) OBJECT_CHECK(XlnxZynqMPPMUState, (obj), \
+                                          TYPE_XLNX_ZYNQMP_PMU)
+
+typedef struct XlnxZynqMPPMUState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+}  XlnxZynqMPPMUState;
+
+static void xlnx_zynqmp_pmu_init(Object *obj)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = xlnx_zynqmp_pmu_realize;
+}
+
+static const TypeInfo xlnx_zynqmp_pmu_type_info = {
+    .name = TYPE_XLNX_ZYNQMP_PMU,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPPMUState),
+    .instance_init = xlnx_zynqmp_pmu_init,
+    .class_init = xlnx_zynqmp_pmu_class_init,
+};
+
+static void xlnx_zynqmp_pmu_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_pmu_type_info);
+}
+
+type_init(xlnx_zynqmp_pmu_register_types)
+
+/* Define the PMU Machine */
+
+static void xlnx_zcu102_pmu_init(MachineState *machine)
+{
+
+}
+
+static void xlnx_zcu102_pmu_machine_init(MachineClass *mc)
+{
+    mc->desc = "Xilinx ZynqMP ZCU102 PMU machine";
+    mc->init = xlnx_zcu102_pmu_init;
+}
+
+DEFINE_MACHINE("xlnx-zcu102-pmu", xlnx_zcu102_pmu_machine_init)
+
-- 
2.11.0

