Received: by 10.223.150.237 with SMTP id u100csp2946965wrb;
        Mon, 13 Nov 2017 14:42:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYABiYWzwlgQ3GmUImrgT/9miQ3CAazBvlJd7BqKg8kl3UTm0B4RmSwu2MCyGSghEjNdJ9b
X-Received: by 10.37.78.86 with SMTP id c83mr7202096ybb.187.1510612944390;
        Mon, 13 Nov 2017 14:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510612944; cv=none;
        d=google.com; s=arc-20160816;
        b=uCr2kWdg8t94L0dsBuVwamK6kQ/C0/lKfjA7u+ha169Ss2UcZHCEX0Z8kFtDBehHWX
         4iFpxQmq7BHDx+HRS+CCpIjZaoAf3i45+m75ofmTlNC0xmj6mChmOM23IKsUjlNeo+I8
         awI41C4ZTVYLHe/93wNTtYJq+9gAxi5l3s+PKG84kDG6iLyh1P7+5cJu7T2aWeoIWR8S
         3ZcFXCDAf87i+PYIj1KKMLbsz6sa8HhwPVyffjm9JFr+lSNZXf8eFOFq8pTA3FIRU3Ri
         EBPlFe6BM0OtHdqm6Blj+liek68NCvnOeLz4WGjnhlWRdnWRkNLTKzxubDL51bLZFlyY
         72aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=blVKKb0EslbdLCYLDuLmR6k5+3XkmK/SZLc8LEMAkso=;
        b=bsL8bfLC0W+4yMYXGyQZRc2+Fr+edVzCVx8NFBUI84/9oFUoK36KfwpSzkEh19sy1T
         l/2H9aNIyUa4RgDug5wgjgrEiSY3k75UW+aYKkS0MNUMYnoZLGRazF7BTu08eCEgaLIf
         hoJHgJzsaqIink1D40LbeSfn+qSkOmETtcghx2hfOqIl/dLyKWx5D88uOhKxf6oC5az+
         gQepPKhVVgleaK01jVu7jfax3KzYidxepenL9OJbGJcOldVxPJYhkM/fuqm4CEtQ4OhC
         VjZZbagrp6oScmepBjQuqJr2304llI8ciI+iR6jZznOWeqxC2sSx2I4C+0EJBUV0H+0c
         pHTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mkEEWgjI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b35si3773523ybi.148.2017.11.13.14.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 14:42:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mkEEWgjI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eENQt-00071I-Mm
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 17:42:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNk-00027F-V7
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 17:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNh-0006tf-CN
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 17:39:08 -0500
Received: from mail-cys01nam02on0046.outbound.protection.outlook.com
	([104.47.37.46]:59760
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNg-0006sK-VA; Mon, 13 Nov 2017 17:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DWX+8uzs60In0pDgNFxckd5/ULNdINuTHq6bVgozZzo=;
	b=mkEEWgjIOmpY8XvpHlc7OYO4MZvyuxBV9f3zBUMENvIeaEub3MWfcjJS//DoUhynLfLC/Bw7ZeyeVWOTKJQUxnC8VDDX7cAiKNVLgjq4jglyuFO6EsuYtKBnabzMEGWejkT2NMsltR/EmM4DtiiL9WGepp+za/2npaHQtY6Kv8E=
Received: from MWHPR0201CA0019.namprd02.prod.outlook.com (10.167.160.160) by
	DM5PR02MB3387.namprd02.prod.outlook.com (10.164.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:01 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by MWHPR0201CA0019.outlook.office365.com
	(2603:10b6:301:74::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45068
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNb-0004VN-TL; Mon, 13 Nov 2017 14:38:59 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNb-0000Md-Ng; Mon, 13 Nov 2017 14:38:59 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcnhH012436; Mon, 13 Nov 2017 14:38:49 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNQ-0000Ki-TN; Mon, 13 Nov 2017 14:38:48 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Date: Mon, 13 Nov 2017 14:34:48 -0800
Message-ID: <7e6bb381c0278c977ce5c0eee2de1b230c5005a1.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(76176999)(39060400002)(50986999)(47776003)(63266004)(4326008)(54906003)(478600001)(8936002)(106002)(5660300001)(2950100002)(316002)(189998001)(118296001)(23676003)(50226002)(110136005)(106466001)(5820100001)(50466002)(33646002)(575784001)(77096006)(356003)(36756003)(9786002)(5890100001)(2870700001)(2906002)(81156014)(305945005)(36386004)(8676002)(81166006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3387; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT030;
	1:DqsOrJZPr8j6jq3dtmdJh/AhyeVA6KnMhMW9Ij2vGBjQ8OeYtZ8oyP310/u6B8DTVkvT9mYGCQ2+U3C1eMap2i2U5di7jS1n0JDE4Mug8d4DgPp3WWEs6DhSOpjjeRx3
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc4f0938-9cc2-446e-27ca-08d52ae755e4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM5PR02MB3387; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	3:x71eKESTQV1ymZ1y5VRoDJi1p3KiHtZP2qVXYoU47r24zi9KQrQljxu+oMKkvQCQn0/Ov9dCGshJK5gWrdBzTAC7hwiun2eMYrm0oyrMXuvZCE0XXem+CCJdU0uJYvbIg7PJBDMgMXOSVU2XBAca83GDw56EVE2+EDgcRxhsuOxFqZbPQUXZrpxhX7GKEf1Zqcm2gwpTbLtDTWVSibumoyBx3+re9j/vXCVxhy8D50Lrx/Pn2Bq+VIlgesoFtSq0WZ3FVHB6uYT8UeimQicps9CmEMoaE1Wzkmr9WO2oimlFbSXinXB1NXEgfLA/NcDyTPuCyilafYuC41AZ1xsxTQNh0ba32RMr1G+P/7hAT60=;
	25:sEUSd5BoNg2z8Di2s11pVxpwa74TEQpkEXKLp4B8QzZ1E3pB5NEeC0hnix6kGPrxzNGhU9egF+1s+909ffTlslc5msodn4O5dOkBhQTV6NjKxoWjeQsWKk4K0pTCmxmyY/r5fn+NAilDHq5GBp2HnuaHLWyydbUVt5zAZJqRysF+QA1TbmwJYuuyWNM4kFkm5gZ8xtF9cezfNloFR69Qvaxy0IgGoT74gnjcWTnDwGvPXqrVWBYbWiOuJXghdrczs3hyJFVIuWMImf57RVKoEUu4XNBakd4snZg6bNYgyPLowcpasVxhhFUFkDjagPtgQFa6Ekr54lJBkkaHXCSHDhnu2CIvmpxDTmFaqJWLivs=
X-MS-TrafficTypeDiagnostic: DM5PR02MB3387:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	31:NsLheOEA2DOw0OngM/XkVWUC6dggpx+/VMxu+Wxws213FVTkpP7O01Lf1UmIY1ZFlr5IdqU0ULSG60f4/PVnJ232JJRymvblx7PwjKaqb2x/Wwzy9Xx7/2KS5yHCMgoGBp0TpnjigyU1PQVa9f4fI8JtsB53xiSjV35/2rEK92/LlywHTVqMMuZvUIvHTzQD7OkcDJk+18bEOCZ56cUa4CTClQwtDtxO9Vxk+wK6J24=;
	20:LWoy+wkISBrPLLcFiH8QS0QaDe7Ypgrjk4eNpT2IwqV/xWYgky8yVS8L+4+9ReM3jqa+KzkhPa06D/F5KhiyUoHrryjY1k6A5Fdhmx9DpaOsKa1V/r18Ogr/v+IhQOlxzqBRRFXAdjfc+fHfnaOL30BurPP1GGmb7HZwVMHM0XEaC8bG0AuomavHPrWpfZ61PE6P0PMDiVoE3AxAEtS5XuHFrqcPxyC7mVTpzDT03S7rlEJcQFRgfJzKclYNoEL3euETU3R77efC1n9Kn2Ftsft0cO/6QwXQYdmh0sck6NlxHyJX7J6I4IagDg3vqT+0AKcLXj6vb8tSL8ImDOgM6Z7SjGkcHH3U7XOc83IjnPma6wbPGYCBaTe9f8xqPJojAB66kPqLhYtsTLX1HaiF+l68oDBqTRNKHapd9aQQNG+jr72OS+7zOmQQ4wVRutVy6DbGsXr7scXQSh0iDJLjyEYWajFpOCevbQMWy67CYYBP8SLFVh5gn8CYo5T6L2SC
X-Microsoft-Antispam-PRVS: <DM5PR02MB338719F511EFD62B4411DCCFDC2B0@DM5PR02MB3387.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(3231022)(93006095)(93004095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123558100)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB3387; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB3387; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	4:JDDN15yPMS9WBm1Hbe3tUjjDfdycNmOcLyT5/9TK1KJUrm/04Sq+oueZTWamNy29NRK65ET2ZRYTlTtJtEzw44SImtxewCLtOc3CjCNqt5nlpWc5b1qhsCY8jrZXzlMIrgt8dfkXN0uFLEBftPnQ8Cd46FzLOqtit87BibouSnYUydpU6gNG2LJTg8VPFM5cCohTD8sBJldzNL8RBejDbfgfnPRA0HvcpzjzUfxCxrhXVKLIIpc0c65rBAfYjCu6odLK6sPrhPbNXjHmUTiwD1CRbHfBodfbH7aBrGrsGTQIGxBV3OTN5GkSIf3i8m+4NbjjQR6yANNwhGc0zAD3pg==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3387;
	23:u9S8P+DIcm4oFOYuAKlikGM75dMMTdieVBpwImpJO?=
	=?us-ascii?Q?+SuBjLGnP6jLAaXc++kr6bXHdjM+N/bFVJHnibGx9VMsJHlvB074x5YLdmjA?=
	=?us-ascii?Q?6v5Kdba44TNrP/nUzEmumFQIBwBfE0m34/0dyjXbiMlJXod4T04nnGCmhIU9?=
	=?us-ascii?Q?V0dwfCKSLW/bl4BMWhvGCu3Nfy13ruwgrijiJXIxrP1ja2lloctWrO1RAET2?=
	=?us-ascii?Q?vD+1Dc9py50yTHq73l4V08emc9U115sPwqxwrPcbfEVKQyX9hKQ5Mr9WLknb?=
	=?us-ascii?Q?ozzmmGdEew5I6y3jDSRNStAF7Qyv/4K0gbQVmZ6aps1ohdtGuNUTJUiXMEsT?=
	=?us-ascii?Q?gdypGhoGNok5TdNAm5xqkW8z+E5obKIbx0j9TarU0vgM3LoUlpzVGwCR25C+?=
	=?us-ascii?Q?23RVuXWuuaiBOXncRvfjPk/iOCVFeR+jgba34KmIXwN1tVQGQR1ArVlMW38U?=
	=?us-ascii?Q?4AvVUG+tt4JeP+nT+DJmc+XHgFb9TX23LSWzl7cf4x4TQGebID1TGpSB/q7c?=
	=?us-ascii?Q?NkS68MQxTXiGJfM/5H5+qXFAZuZj67tzJ6K7zBJkOW4JCZXlzlULOaqNjzrz?=
	=?us-ascii?Q?yuwk+/24fpDJzPDZA9+4seUk2Bli5A0yAOjFWntqkx7i352+rWGfyRr1Utqm?=
	=?us-ascii?Q?8XgFlYy0v5O2YpfqcV3wfWDL40lfHAPsuITs7H1yM8ybYIvn8lB/SYosW2ty?=
	=?us-ascii?Q?u6CZS1IjJLNI0LjsDPb4j87PtVrHqqnU0tXwAn7NeJbz18uPl+kSEvqmzzWR?=
	=?us-ascii?Q?yVt+7kOLDz+GL8ve9s3V6pNYeCRuseRP49cd/aP4WbJqfuiTAljXcgmmUFXL?=
	=?us-ascii?Q?yCDLJZLLflyWdudI/+HXXQw4SXdZBf4dRGZCMc0GBnGfgFGtV/+yrYvyI4If?=
	=?us-ascii?Q?RX31h4ASMw8XuLlCQGXbTMhlmOx5T9DNWiFy9RzNAbd3ljHLceFG0+KjC282?=
	=?us-ascii?Q?IkvWz81SGOqY7HKNPi688I9wlttExoEquZ6f1Zip53OCtblii7xZBzv9MxFe?=
	=?us-ascii?Q?P/F+W9fONUHdIk17UNs/VcAbE/bzlOijS08HHHMSKB9D/t7qOOiCRcXidMt7?=
	=?us-ascii?Q?EE7ierMqE7qaUw8cPmwiDYieZD7jo3KjsqLb00B8jKO+FitlQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	6:Gx8Yqdlnm3LV9LjstY7S/p7cJUD61YyUnvqbsTKjKo5rEl5Htqo+i0EEZZhwYI+sqOHNlRjodzNMkp31+3TvW+MQy9QlSszDg8gID71u9pgHKriRskbQwkDkpqyk+5zu7DFlFtj8Qd9pIFwRI/GZ98o49GjsmMvPclbt00f/iK/MVxXGP9lEsXDyHYj2CyIlCZJWwhOKrXI7NoOc3HYITJqVxRm77C7o5sEYd1aDRbaTIEiV6B3kWYsT7DivAGOzrZBFyvmijv9Q7RA1XfnCwcYUvaKjnt3dLlCMfwd3wYxci+A+H9pEAOrWk3/jAgPVHg2/2yaTxcff3lNm069BZTtH/HSL/fJ7s7Cbyrnmfuk=;
	5:zhSo/V868MDUvYQjts8eXzADGEHKo1lguz49IWyHjsLJtavZqvu3ZtDbLPkB1cwbRF9LCz6+sd3py1eLOFkdqMO8XQOlZn63RD2K+GRRz6g0d3ZECiMhGLywHioiimmUWiH7P1vPGyvE2+TxkfmDK4emF+L2+F4zVV0aKTmq4yA=;
	24:XCByJsa50SWNP8ItV2TUtg2Ojim+kp/xggxYYLz+4/vyR6IYrd6jZ5fFbh7M1mB8lgXYqfm6pllhSKWPKLrQdIA4PMeS1+9aC4BzDgrn6HI=;
	7:uBYAk/w2faB7l0whr7F7EU7n47WhLct0HdCDquXet8Sigces7m1wVItB5bRn6E4tUfcz1qftmxKcp9GlTUZCCZjP9f6T7t8RA0YDbd+0qphrQgXbQRRQbZAFuTLTtZ1fpXiTfpbhDUFzQeTYpxUBtmLmc2KyTrK8EgDo/y68azJdkuupBrtXXEp6dtSXh+suiOY2Mb8YMjYCd15ypeLfdFbN7GU7Nac0pascnwR+s9qyVFxXW8Y5Se3FmZNB4W+4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:00.5558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4f0938-9cc2-446e-27ca-08d52ae755e4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3387
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.46
Subject: [Qemu-arm] [PATCH v5 04/29] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, armbru@redhat.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fViY98xk18vm

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_re=
port("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V3:
 - Remoave 'qemu: ' prefix
V2:
 - Split hw patch into individual directories

 hw/arm/armv7m.c      |  2 +-
 hw/arm/boot.c        | 37 ++++++++++++++++++-------------------
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
 15 files changed, 77 insertions(+), 71 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index bb2dfc942b..56770a7048 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -278,7 +278,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel=
_filename, int mem_size)
 #endif
=20
     if (!kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Guest image must be specified (using -kernel)\n")=
;
+        error_report("Guest image must be specified (using -kernel)");
         exit(1);
     }
=20
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..6e6b8c0c6a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include <libfdt.h>
 #include "hw/hw.h"
@@ -418,13 +419,13 @@ static int load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
         char *filename;
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, binfo->dtb_filena=
me);
         if (!filename) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", binfo->dtb_file=
name);
+            error_report("Couldn't open dtb file %s", binfo->dtb_filename)=
;
             goto fail;
         }
=20
         fdt =3D load_device_tree(filename, &size);
         if (!fdt) {
-            fprintf(stderr, "Couldn't open dtb file %s\n", filename);
+            error_report("Couldn't open dtb file %s", filename);
             g_free(filename);
             goto fail;
         }
@@ -432,7 +433,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
     } else {
         fdt =3D binfo->get_dtb(binfo, &size);
         if (!fdt) {
-            fprintf(stderr, "Board was unable to create a dtb blob\n");
+            error_report("Board was unable to create a dtb blob");
             goto fail;
         }
     }
@@ -451,7 +452,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
     scells =3D qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
                                    NULL, &error_fatal);
     if (acells =3D=3D 0 || scells =3D=3D 0) {
-        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0=
)\n");
+        error_report("dtb file invalid (#address-cells or #size-cells 0)")=
;
         goto fail;
     }
=20
@@ -459,8 +460,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide
          */
-        fprintf(stderr, "qemu: dtb file not compatible with "
-                "RAM size > 4GB\n");
+        error_report("dtb file not compatible with RAM size > 4GB");
         goto fail;
     }
=20
@@ -480,7 +480,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
                                               acells, mem_base,
                                               scells, mem_len);
             if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", noden=
ame,
+                error_report("couldn't set %s/reg for node %d", nodename,
                         i);
                 goto fail;
             }
@@ -505,7 +505,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+            error_report("couldn't set /memory/reg");
             goto fail;
         }
     }
@@ -519,7 +519,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         rc =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                      binfo->kernel_cmdline);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/bootargs\n");
+            error_report("couldn't set /chosen/bootargs");
             goto fail;
         }
     }
@@ -528,14 +528,14 @@ static int load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
         rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                    binfo->initrd_start);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+            error_report("couldn't set /chosen/linux,initrd-start");
             goto fail;
         }
=20
         rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                    binfo->initrd_start + binfo->initrd_siz=
e);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+            error_report("couldn't set /chosen/linux,initrd-end");
             goto fail;
         }
     }
@@ -690,7 +690,7 @@ static void load_image_to_fw_cfg(FWCfgState *fw_cfg, ui=
nt16_t size_key,
         gsize length;
=20
         if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            fprintf(stderr, "failed to load \"%s\"\n", image_name);
+            error_report("failed to load \"%s\"", image_name);
             exit(1);
         }
         size =3D length;
@@ -956,8 +956,7 @@ static void arm_load_kernel_notify(Notifier *notifier, =
void *data)
         is_linux =3D 1;
     }
     if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                info->kernel_filename);
+        error_report("could not load kernel '%s'", info->kernel_filename);
         exit(1);
     }
     info->entry =3D entry;
@@ -976,8 +975,8 @@ static void arm_load_kernel_notify(Notifier *notifier, =
void *data)
                                                   info->initrd_start);
             }
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initrd '%s'\n",
-                        info->initrd_filename);
+                error_report("could not load initrd '%s'",
+                             info->initrd_filename);
                 exit(1);
             }
         } else {
@@ -1021,9 +1020,9 @@ static void arm_load_kernel_notify(Notifier *notifier=
, void *data)
         } else {
             fixupcontext[FIXUP_ARGPTR] =3D info->loader_start + KERNEL_ARG=
S_ADDR;
             if (info->ram_size >=3D (1ULL << 32)) {
-                fprintf(stderr, "qemu: RAM size must be less than 4GB to b=
oot"
-                        " Linux kernel using ATAGS (try passing a device t=
ree"
-                        " using -dtb)\n");
+                error_report("RAM size must be less than 4GB to boot"
+                             " Linux kernel using ATAGS (try passing a dev=
ice tree"
+                             " using -dtb)");
                 exit(1);
             }
         }
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index bba9e9f57a..8f11b03066 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, connex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
@@ -99,8 +100,8 @@ static void verdex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -113,7 +114,7 @@ static void verdex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, verdex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index d07972a966..189febf8b7 100644
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
@@ -143,8 +144,8 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
             if (qtest_enabled()) {
                 break;
             }
-            fprintf(stderr, "Two flash images must be given with the "
-                    "'pflash' parameter\n");
+            error_report("Two flash images must be given with the "
+                         "'pflash' parameter");
             exit(1);
         }
=20
@@ -154,7 +155,7 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, MAINSTONE_FLASH / sector_le=
n,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("Error registering flash memory.");
             exit(1);
         }
     }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b648770882..06127a873d 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1626,7 +1626,7 @@ static void musicpal_init(MachineState *machine)
         flash_size =3D blk_getlength(blk);
         if (flash_size !=3D 8*1024*1024 && flash_size !=3D 16*1024*1024 &&
             flash_size !=3D 32*1024*1024) {
-            fprintf(stderr, "Invalid flash image size\n");
+            error_report("Invalid flash image size");
             exit(1);
         }
=20
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 92e58f09c8..b3a23a83d1 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -18,6 +18,7 @@
  */
=20
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
=20
@@ -3987,7 +3988,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *system_memory,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap_mmc_init(0xfffb7800, system_memory,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index b53878b8b9..3a1d995d6a 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s =
*s)
     /* TODO: update clocks */
=20
     if (mode[0] =3D=3D 1 || mode[0] =3D=3D 2 || mode[1] =3D=3D 1 || mode[1=
] =3D=3D 2)
-        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
-                        __func__);
+        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
+                     __func__);
 }
=20
 static void omap_prcm_dpll_update(struct omap_prcm_s *s)
@@ -1331,7 +1332,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s =
*s)
     s->dpll_lock =3D 0;
     switch (mode) {
     case 0:
-        fprintf(stderr, "%s: bad EN_DPLL\n", __func__);
+        error_report("%s: bad EN_DPLL", __func__);
         break;
     case 1:	/* Low-power bypass mode (Default) */
     case 2:	/* Fast-relock bypass mode */
@@ -1358,7 +1359,7 @@ static void omap_prcm_dpll_update(struct omap_prcm_s =
*s)
         omap_clk_reparent(core, dpll_x2);
         break;
     case 3:
-        fprintf(stderr, "%s: bad CORE_CLK_SRC\n", __func__);
+        error_report("%s: bad CORE_CLK_SRC", __func__);
         break;
     }
 }
@@ -1627,8 +1628,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
=20
     case 0x500:	/* CM_CLKEN_PLL */
         if (value & 0xffffff30)
-            fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKEN_PLL for "
+                         "future compatibility", __func__);
         if ((s->clken[9] ^ value) & 0xcc) {
             s->clken[9] &=3D ~0xcc;
             s->clken[9] |=3D value & 0xcc;
@@ -1646,8 +1647,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
         break;
     case 0x540:	/* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL1_PLL for "
+                         "future compatibility", __func__);
         if ((s->clksel[5] ^ value) & 0x003fff00) {
             s->clksel[5] =3D value & 0x03bfff28;
             omap_prcm_dpll_update(s);
@@ -1658,8 +1659,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr=
,
         break;
     case 0x544:	/* CM_CLKSEL2_PLL */
         if (value & ~3)
-            fprintf(stderr, "%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
-                            "future compatibility\n", __func__);
+            error_report("%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
+                         "future compatibility", __func__);
         if (s->clksel[6] !=3D (value & 3)) {
             s->clksel[6] =3D value & 3;
             omap_prcm_dpll_update(s);
@@ -2486,7 +2487,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sysmem,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap2_mmc_init(omap_l4tao(s->l4, 9),
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 9a14270795..e510465137 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -158,7 +158,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -182,7 +182,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_size, flash1_size / sector_size,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
+            error_report("Error registering flash memory %d.",
                            fl_idx);
         }
         fl_idx++;
@@ -194,7 +194,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
     }
=20
     if (!machine->kernel_filename && !fl_idx && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or Flash image must be specified\n");
+        error_report("Kernel or Flash image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709d..7f3637041a 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -233,8 +233,8 @@ static void palmte_init(MachineState *machine)
     if (nb_option_roms) {
         rom_size =3D get_image_size(option_rom[0].name);
         if (rom_size > flash_size) {
-            fprintf(stderr, "%s: ROM image too big (%x > %x)\n",
-                            __func__, rom_size, flash_size);
+            error_report("%s: ROM image too big (%x > %x)",
+                         __func__, rom_size, flash_size);
             rom_size =3D 0;
         }
         if (rom_size > 0) {
@@ -243,13 +243,13 @@ static void palmte_init(MachineState *machine)
             rom_loaded =3D 1;
         }
         if (rom_size < 0) {
-            fprintf(stderr, "%s: error loading '%s'\n",
-                            __func__, option_rom[0].name);
+            error_report("%s: error loading '%s'",
+                         __func__, option_rom[0].name);
         }
     }
=20
     if (!rom_loaded && !kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or ROM image must be specified\n");
+        fprintf(stderr, "Kernel or ROM image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index db860c238e..0386a0d8bf 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2062,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     s =3D g_new0(PXA2xxState, 1);
=20
     if (strncmp(cpu_type, "pxa27", 5)) {
-        fprintf(stderr, "Machine requires a PXA27x processor.\n");
+        error_report("Machine requires a PXA27x processor.");
         exit(1);
     }
=20
@@ -2095,7 +2096,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
@@ -2220,7 +2221,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space,=
 unsigned int sdram_size)
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index de7c0fc4a6..f6f295b363 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -8,6 +8,7 @@
  */
=20
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
         s->int_mask =3D value & 0x7f;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index a55b1a369c..a069c95f1c 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -12,6 +12,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -70,19 +71,19 @@ static void tosa_out_switch(void *opaque, int line, int=
 level)
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
-            fprintf(stderr, "Uhandled out event: %d =3D %d\n", line, level=
);
+            fprintf(stderr, "Uhandled out event: %d =3D %d", line, level);
             break;
     }
 }
@@ -133,7 +134,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
=20
 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
 {
-    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
+    error_report("TG: %d %02x", value >> 5, value & 0x1f);
     return 0;
 }
=20
@@ -159,13 +160,13 @@ static int tosa_dac_send(I2CSlave *i2c, uint8_t data)
     s->buf[s->len] =3D data;
     if (s->len ++ > 2) {
 #ifdef VERBOSE
-        fprintf(stderr, "%s: message too long (%i bytes)\n", __func__, s->=
len);
+        error_report("%s: message too long (%i bytes)", __func__, s->len);
 #endif
         return 1;
     }
=20
     if (s->len =3D=3D 2) {
-        fprintf(stderr, "dac: channel %d value 0x%02x\n",
+        error_report("dac: channel %d value 0x%02x",
                 s->buf[0], s->buf[1]);
     }
=20
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 418792cd02..56f9d60bed 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -364,7 +364,7 @@ static void versatile_init(MachineState *machine, int b=
oard_id)
                           VERSATILE_FLASH_SECT_SIZE,
                           VERSATILE_FLASH_SIZE / VERSATILE_FLASH_SECT_SIZE=
,
                           4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
     }
=20
     versatile_binfo.ram_size =3D machine->ram_size;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index efb5a29475..508629dfe9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -266,7 +266,7 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
=20
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
-        fprintf(stderr, "vexpress-a9: cannot model more than 1GB RAM\n");
+        error_report("vexpress-a9: cannot model more than 1GB RAM");
         exit(1);
     }
=20
@@ -355,7 +355,7 @@ static void a15_daughterboard_init(const VexpressMachin=
eState *vms,
          */
         uint64_t rsz =3D ram_size;
         if (rsz > (30ULL * 1024 * 1024 * 1024)) {
-            fprintf(stderr, "vexpress-a15: cannot model more than 30GB RAM=
\n");
+            error_report("vexpress-a15: cannot model more than 30GB RAM");
             exit(1);
         }
     }
@@ -640,7 +640,7 @@ static void vexpress_common_init(MachineState *machine)
     pflash0 =3D ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flas=
h0",
                                        dinfo);
     if (!pflash0) {
-        fprintf(stderr, "vexpress: error registering flash 0.\n");
+        error_report("vexpress: error registering flash 0.");
         exit(1);
     }
=20
@@ -655,7 +655,7 @@ static void vexpress_common_init(MachineState *machine)
     dinfo =3D drive_get_next(IF_PFLASH);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
-        fprintf(stderr, "vexpress: error registering flash 1.\n");
+        error_report("vexpress: error registering flash 1.");
         exit(1);
     }
=20
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 60561c7b7c..ee59142667 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -319,8 +319,8 @@ static void z2_init(MachineState *machine)
 #endif
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "Flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("Flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -329,7 +329,7 @@ static void z2_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, Z2_FLASH_SIZE / sector_len,
                                4, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory.");
         exit(1);
     }
=20
--=20
2.14.1

