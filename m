Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4170033wru;
        Tue, 14 Aug 2018 07:54:36 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx9pL9VNLwAPpf4nMOSDvyqvVWv04MjuwMPEadfFTcHAv5YomqRTicOb6EM7SC4jEjpzfJr
X-Received: by 2002:ac8:302e:: with SMTP id f43-v6mr21349988qte.217.1534258475976;
        Tue, 14 Aug 2018 07:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534258475; cv=none;
        d=google.com; s=arc-20160816;
        b=P6ujh/wiKFGGJv522wYSzE3XM/bfewFxJ+g4jhF1iPqtWCcpwRapBghHsdyLUChfqm
         IUs0plpuI5mGDD50z71i9sbT2i4gEQ8rcz5zD4375DrZGd9cr1d2vWG6znKFk5FXzQLp
         kSsPrs4h15tGtMj+X1nG/LgAXQtN/fcwEhfKeR+NNhb/8FBAAmr7+D+64K9UoD2oUKIt
         uWkCnqpSnz+2Sr6dJW7/0o4qKC0iXjLQcsUBqwsgTFevqF/g0rceuhqq1e7VUgefVGO1
         zP4X736y5ca54GGispjtCLooFFxU19aYAuXZ3DnfPka7mrrRnDB0nhcPK466XxY9IJEX
         QKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=jQ7ERbTpMegwLLzM+u7om6U2xNhOq0cgO3xJLRFoQVE=;
        b=QwNFzXJpC04U2Z6xRVRx31KfIr9CJnSfb/pv/IGQnwrx+mRzgLHHoT0Smbdohe+B+t
         vdDGLY+yfoq+InWkzWwSMw3ILoXlm6svTe6cLYcN284s8RqEy57a0/C1gQm8vybRUga+
         woQGHCPYmYxxOVkFQAF3HQVr/j/+lHDil6X+TcIFqVqtgCckAuCXEblDWsgJJ7hvcBCG
         aIthvnw8QdpfkFcrdK9yNt2CiJrdy4nsNReoAzm5LZ4dT60SMX2/jNZZGFaylhDLpTUm
         905wzpsomxG7uDPI+TBomqeKYrDOQ7+OQAj/N3tn0KjKFvfFRkBoRFb2MfGQW4NdBdBc
         24FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=K+0NtQHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y131-v6si3734659qka.286.2018.08.14.07.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=K+0NtQHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaiR-0007hV-Cn
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:54:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpagr-0006Xq-VL
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:52:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpagr-0007R9-0G
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:52:58 -0400
Received: from mail-eopbgr730080.outbound.protection.outlook.com
	([40.107.73.80]:17056
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpagk-0007Oq-BF; Tue, 14 Aug 2018 10:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jQ7ERbTpMegwLLzM+u7om6U2xNhOq0cgO3xJLRFoQVE=;
	b=K+0NtQHSsY8CIKewODN+dINQG9lM9IYTjYYf8CZDTFnPTtEUhDgt+phWZ+RX/f8ApA13azlJ0CGAko6P3RVg7ybNJ9oe+eUfD9kAcJkebRhyWixGpKtxr2ATED7uBbmSFU23Jm/i5Ij+UOWgkJUg2IGl5qUoHNTF31xwNxgUN6Y=
Received: from MWHPR0201CA0079.namprd02.prod.outlook.com
	(2603:10b6:301:75::20) by CY4PR0201MB3508.namprd02.prod.outlook.com
	(2603:10b6:910:95::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.23;
	Tue, 14 Aug 2018 14:52:48 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by MWHPR0201CA0079.outlook.office365.com
	(2603:10b6:301:75::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.19 via
	Frontend Transport; Tue, 14 Aug 2018 14:52:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 14:52:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42168
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpagg-0004wo-VR; Tue, 14 Aug 2018 07:52:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpagb-0003I3-PW; Tue, 14 Aug 2018 07:52:41 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EEqa6f017024; Tue, 14 Aug 2018 07:52:36 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpagV-0003H8-K5; Tue, 14 Aug 2018 07:52:35 -0700
Date: Tue, 14 Aug 2018 16:52:29 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814145229.qd6hzmyjfqwf3tfi@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-6-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-6-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(438002)(199004)(189003)(6246003)(6666003)(107886003)(4326008)(8676002)(81166006)(81156014)(33716001)(5660300001)(9786002)(36386004)(97756001)(478600001)(2906002)(356003)(14444005)(46406003)(6916009)(54906003)(50466002)(305945005)(106002)(336012)(186003)(26005)(106466001)(77096007)(229853002)(76176011)(126002)(1076002)(23726003)(426003)(486006)(476003)(11346002)(316002)(446003)(9686003)(47776003)(16586007)(63266004)(58126008)(8936002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0201MB3508;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT026;
	1:GrMLKMFNTldf/LGQ65Lub1jAmteXke6irSajo2URSojzpIQKo+km7km4LSLK61mUOZAxP5vgbVR+LF1mFwRYTVyaYHdZ6gWfBSryTOEsUd+yB4/MqdVToiln1SEfaaIA
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 610406d5-fa7f-4161-c9b3-08d601f599c7
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR0201MB3508; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	3:q2gbgqOGLWTPW4IFXYSprJ0/hANpxPfcngFUVTDCirE/yfmtsuKkyyGrayLfarSIh3u5o18FQNkoeHAcl5dfoOGpOHlSjF4+kkLjYaEbrxZbQ2EBLZ32Et+zUrAmRc8BFfw4FgDKbt/XC6uqBHps0TBbzqpnceu+quCtw/xDqDl6WSYqhFNycqmvuEqKYAoPD4396j9R6dA70+JHqceXHhrlpWj4lCkbRc+1/KxuUvfz17hOFXQKiMN0K6wS4x9WYoqPNOEFf+tW0vajghl7tGaXmfo75FPo0w0vJQTS5FV3umxmByhM5lOaDt0w7uqNZYKS4OHDEmDpP4n3ZX8shFMQThuPhMOrqRTIqNSXvOk=;
	25:lMqCjcOtmHepFDVmdj9DwVGZ3xaP/+MpbL3rLf8AdBIT5cHP05RPwxEFS6UTE20JWZc/purYXjnDFWEXB4Il3XSxpjydsG1p0iOxkUkfnY53QVRUednl5bftbNdpcaGJWmdx7NrXQOMYau9YMfp0kk0JfLOai9PtyAhe/B+wL9opvYGdaBoce7zwJ04PA1DLW9TyUXGkZa1pp6AhJl5qP5UzG1oUPJwxHej1WxiqeAXx0RyYsxeu5+zjeUyz1EbE8Bb/BD4pFH5CYcot7n/R9QiYpwN/1Ny1t2JsATEkI9bSHlShjP+Ujl/ti962jpTp1JpsZ8gwH1xukfx5R5n7MQ==
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3508:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	31:r7hPaTJg+lnGMHreyPwDEjm8mHEUiUDrvEuQU2URu9YaQdkyN0qDWP1qD780TCKEoH92j39oCjPQcKqZrj6spSoxIAcqCWW3dpxvgbn2X/JLBibMg6QsHXC9cIhvNygbm3o5joVEGQdAB2F4efcKxBF+KAN/avpJJ6PZ+SCalFyG7SlHEBHkSiCDkTLrQD4h0Dftwscv8Vns/cQKEwDCJWn4iL7Fls7M943cPwc74wQ=;
	20:I404JDzOUcVVRKwILnmk1Hy4o9maPGtNuS5fyrLIHF3erwDRhcBoOnZqdSQrdTT5MN/9Uji9s7wYjuZqn5cD5wHsJcgscPXqW1MI7Bnsu2dvtlg3M5XoDehxQzOeN/85yB0WcM8eGmT2reKdiXjdZ7Vl0Bhn6G/N6kLBAKOWRW0U9grJXZdilB70Qu1Ebf414FZhmwC1XWGWLSXcNoJ+V1Sf+iZzaamdA31foS1vFIiMclKOTQcA60kzx+youD8Zlpsv1Mj9oGcDDegq9LK2on4qGMWdXOc269nN3vkSQbLe0RmDh8AN9qtYKujXvtISyMZ6okwZHdvakKV5ySYoKlGatB53TVbd1dX7qbfIuVs9D9dE051KIG8w8rs8Y71cDigN3G8FzZhXaanS/d4CzmKy6YC+DniRW8w3MKQNP9GoPfV1aiXn2atwWYb7pD2odcjwzJRaZDuWTl6ywOKreI+epsLwM3aHnaNJA87QMYfSSul7dVpSL/a+uPZVWPYZ
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR0201MB35084124BF879D1E05156C0FAB380@CY4PR0201MB3508.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR0201MB3508; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0201MB3508; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	4:9YRdhI6gDG66mHXa4SVx4t0nHD7h9DmDFuxoOHZtKk4iyUL7uRB3rctGC9+qTESfrDDS3Y5qAEW2VIcRIZDSotrYp8gR8hqC2T9HBCj1Qpf1D3Sik+9ZoPRFOAlHooaeEGaEbJIe+K5nbM+DxtAmYUUl3zYoZBA1kC20B2PoDG29ty+329576hN6BF8QIyjhNPtw9tdPZfC/MbZuErQi3f2goG3yWTRcSzH2w+7PZz68yy2/IuCQgJs9blUubP65uZ2XeNCcQgUOUU4cQ7kv2UXsfdovPn0+aqscPMUCrqBdbHdAK60trcQg4FtNXFPY
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0201MB3508;
	23:uJf9TA/eYD1OIZ/t3nU5/qojW8cdZM3e2IZRNZJ?=
	=?us-ascii?Q?KDkhLEGCDJ+z+mVGdO3xdp5ifrES2j+uWV97i5tF+/n0q8uZpzCmIsBWdqjx?=
	=?us-ascii?Q?V52xPsyWBS1/rKlxz+nNtROStOPg73DOwLNbWPN8uW1EGCw1jfKM+8KqZGGQ?=
	=?us-ascii?Q?hwK5uOpCNHk242bog3rLhLFg9KbheNPNyheTnnFT8c4b6d2O6hDJqXtT3J/l?=
	=?us-ascii?Q?hnOCqbV0sBo95K5lluD4AUk2mUiP91Xa6A8rVtBuIQ9f2WD4BQK8HOyWdi2S?=
	=?us-ascii?Q?ULQVTQsMVslrqYtbbOMvgiF56G4rSD4NQwcXaV2YrRANaQaDPhFSyc1djghN?=
	=?us-ascii?Q?emV5b0tRUUHKPVvQUkiabXTeW4jSPRyGLLaIjCUQWlrj52n66vxLTlfcbqoL?=
	=?us-ascii?Q?aFUaaELAwtlb30tXQHCCSfeXAzY8i8ALmmFIyYo21WooLG7g6Rrr26i+/dBd?=
	=?us-ascii?Q?MTuKbCQ4R0I2+qeKhTnRjpPdRwDxyVnw8n2FN+mjJ/jGX128XdqCDMRdOETo?=
	=?us-ascii?Q?auJSty3b3U91uaqB2Kul0OyokvtJ0EEn8a01M1LY4E1i5ub+mA+MrFUQ83Tu?=
	=?us-ascii?Q?tu0TSM8ECuoRQrXdPbhNBWaAJ1vM7fuXdRfY9oL9Ku+yG7cqVkCiHzgPm05D?=
	=?us-ascii?Q?laaGDdmjbT4kVLxcO0LPm9p/ekeuYIoJurphcG/27B+c2SrupZI6hkTqFEE+?=
	=?us-ascii?Q?QI8EajvKw0gwQ3njJ1Xks0ONzFolI3AB53rCtNCuFnk1HPtUwfU4LKPt+s6D?=
	=?us-ascii?Q?4DS3rop9tDx0iWFrVOdKl2a9OMU58klbstWmsfJ9xhNjUn5N5omJKrIpMV0D?=
	=?us-ascii?Q?qFt9Tiea0Sy9tGb9kseWOPyVN3d5eP1qbSlE4Y5g26U+KlEFAV7Nob4IIcn6?=
	=?us-ascii?Q?xsexnU8FL2Q9RmBB5m7CocG1gfIewqh5bcYOI4nLdpy7XQHbVHZx+/rJbDjo?=
	=?us-ascii?Q?CyZaDxWlPqqbROHpGYvEbzwRMwBtJZ03oGvbBDfglNoaPHGmbFWzqdlB/uUP?=
	=?us-ascii?Q?qX+Jw441Fqb6xuCSwmReCP2IRbh0G3fX0EVDRELP5MiE3bdqhqvIcRg/H6x4?=
	=?us-ascii?Q?4LMicVjE5XHPyu8zlqReG9rC/+kfGPfaXvdhvJtPYGo6ZiBxBP9h+Ej/zTy5?=
	=?us-ascii?Q?4Yj4UHiBa2Fkab4p1wZW/qvQJpT6qkrBOD23AxxrYRLNlXFl95pm21uEIDVg?=
	=?us-ascii?Q?KIa+AWobrFDzFYsi/SYvi8Z1LqbHXSk7NC1Z6p1Dls12Oqrz1b+d5uE7ZPw?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: /OpMUWAJtlmPkiOsVuefJrVoxVbyj23ce//m4PB2mjzYWU8e9PbiWclMkbdZBkcih73po6OLoWGXnWfsN9lcITgHQneXc9aAc9M1vaOgnctd0xabBwhqKwmofnVaxtVWaELl5zMxydj9fFIXtHz9uLbc+Clv6wdplYPAAiv+ekKB3RsHpRxLA7FAW/nQJ3FOD85BZjl3x7x1eFTMCz3QLXQ5DIXDNA3gj4avK6sblRISpwW0tibs5qGn1v95w8uUKgyV6CqmBhVirk4hUvOtxBjMiqkZolbtvx0sXDffLOSHNeAFn/Zfcxwexi5Q6thyuSyMPmJDa+sTFIqZj6ym0dh03KwyppMVpdp2GWQ9HUA=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	6:ATAl1ALRC46J0vKrt1lTfiCSDi7/mdbt+wlEK0PSMhmt7sNaoh1RQkEaOIz3AFru956X6PxnIvRp+7OJgWSAodcpjyL0n2Ar22FhdQlRVHUYputffU0VBsF2CxvwRCh9b8dEokVrngw5kbOujKJowrt/fAQar7E5ZfPb9lN3z96Vpkbj1NaCwHkiWurtfYEBS8wVtCUgdrNqvH59GxZh25LhMryvuNvWhGlk0P7/FYqx0XNS8vshR5yDRzTuUsKddcgI4kcPpD//gRJDqpr0L2mz6xhKa3jSeFKXykIBs57OyQ3dPIzGHZFUvUgP93Lg73op2K0Pevi1ra7rGSeWJjxtEX77QnmjdC6nAV4V2yP41Xi35m83h/dhdxCG6Xl3Be8GhjyA/i1ubUGP3VDQ7ZX97pQpNwyZX4ChkblZ1/5l59br/tocH0b4TfuJ/WnGM2sTNelcNvHDihy0fZXw5g==;
	5:GWUiKEWz/B9UxAG2VCPn4x92eT1MtUTsUz49R91j4NV7z97fTOtOUN2XrL4e/dRCSchRc9X66cKV//Fl/vwMmP5W76pJ01Sg2SOLVRw8j9WiziZeE9dFh/l04//Y/r0sLXLAU2rUfKrkHcirL/wuOtsgiS9LkGsJClZOkxV4YpY=;
	7:upu5OxAcCKZaXNVwycGLxHFBlN/PROXvKmFSjWL5yYEg5fxalgqTEZ/7R5Eq39qJ3b2tCg21VeXXqB+f/Ee6xBI7bj1xQ8YPQSxIkNnnBHmXrDdUJLJePdy0EOaHF0T4X0pI9h84ZanwyQtSJOiKpcnD6fnw0xnEj6vvNZb29WHVW+CkbHvn0WxYyLxkQDQmFqK49UejwV0U75c9dJDWgPLd6izdy3AYHu4Zk6xWZ19zbiriwvWPTbt4CRS6pS0X
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 14:52:47.3751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 610406d5-fa7f-4161-c9b3-08d601f599c7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3508
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.80
Subject: Re: [Qemu-arm] [PATCH 05/10] target/arm: Implement AArch32 HCR and
 HCR2
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ffRlEgTZ5CgG

On Tue, Aug 14, 2018 at 01:42:49PM +0100, Peter Maydell wrote:
> The AArch32 HCR and HCR2 registers alias HCR_EL2
> bits [31:0] and [63:32]; implement them.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b6412fe9d1f..9701e413859 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3754,11 +3754,15 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
>        .access = PL2_RW,
>        .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
> -    { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
> +    { .name = "HCR_EL2", .state = ARM_CP_STATE_BOTH,
>        .type = ARM_CP_NO_RAW,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL2_RW,
> -      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
> +      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
> +      .access = PL2_RW,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -3872,10 +3876,26 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>       * HCR_PTW forbids certain page-table setups
>       * HCR_DC Disables stage1 and enables stage2 translation
>       */
> -    if ((raw_read(env, ri) ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
> +    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
>          tlb_flush(CPU(cpu));
>      }
> -    raw_write(env, ri, value);
> +    env->cp15.hcr_el2 = value;
> +}
> +
> +static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    /* Handle HCR2 write, i.e. write to high half of HCR_EL2 */
> +    value = deposit64(env->cp15.hcr_el2, 32, 32, value);
> +    hcr_write(env, NULL, value);
> +}
> +
> +static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    /* Handle HCR write, i.e. write to low half of HCR_EL2 */
> +    value = deposit64(env->cp15.hcr_el2, 0, 32, value);
> +    hcr_write(env, NULL, value);
>  }
>  
>  static const ARMCPRegInfo el2_cp_reginfo[] = {
> @@ -3883,6 +3903,17 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
>        .writefn = hcr_write },
> +    { .name = "HCR", .state = ARM_CP_STATE_AA32,
> +      .type = ARM_CP_ALIAS,
> +      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
> +      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
> +      .writefn = hcr_writelow },
> +    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
> +      .type = ARM_CP_ALIAS,
> +      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
> +      .access = PL2_RW,
> +      .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
> +      .writefn = hcr_writehigh },
>      { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS,
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
> -- 
> 2.18.0
> 
