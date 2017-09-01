Received: by 10.223.188.70 with SMTP id a6csp1502331wrh;
        Fri, 1 Sep 2017 14:07:27 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5o4JsCQtBD5rSzoIAXgRni04D77cse+I9z5zyFUcBw4kwwsxEkd77iElqVK/YCBaMU6bX0
X-Received: by 10.55.158.148 with SMTP id h142mr4659989qke.336.1504300047746;
        Fri, 01 Sep 2017 14:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504300047; cv=none;
        d=google.com; s=arc-20160816;
        b=K8D3onsVP5iKHySHJ4WX3llxNCY7dp4VtHM7qzalDXhmT/gJoIsj005nT9irfB4H2a
         svSo930Eux4vjMysGd1DqRjohCFUjWt+CA6GTFf2nbPw3Ap5rJQ9aWOmqiw8GKPBU57J
         5myDdyVLaEtHzoKRPx/dVqgVu9uEu/60HGTX1LRUs7PS3VsJrirrK0IG2JdKA7xlh4Wt
         kac8/RAo+WAWLA+SMp73z/yYOtE59X6Xa5y1UIStQNyPhgIBhZuy45C9MbsPdhf8Sw1U
         drJKVFY3DENm3lvA5U31+Ngz0dgLnBOih2+s2V/SJvbErTBD0QocC7wQnq1l3Xpqwbtz
         jBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=7D0J84rGZ7R5hZDHdABR61FZiVrE6onyxuym3B1dl+s=;
        b=rRx0Bs7hMbRAzfj3cx7OepeOJOlBBfZXgruz6tnFyrf5Rpvzf5/lG3amUAUu0KQe3I
         EHz/9sk67mTaW3gf16SKkj7LHn6yu0z5CzHvVZKvtsHS+jX4cZvGTYOxd0yx8ByyH/yW
         DWsFFqgcGDwwmDLYJvw6HZALr74WuqdH1a3Ky2RRk3PD/21NkKfQL/jsjFa4k/91mCov
         52Z9NhMku0wSbZY9QYOpvfRG0dygxUPJVJcA8rk4xJ9gevS3hBcbhnxziAYXUhJlNRUF
         nwfZtOOW8zW/pJ76XGEyjYKvvY87yH6ECRKyiiJ4dFxpFnCSwrT5bRwXQbuzqadhDJtt
         P8kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Irlil5uB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si11061125qkf.118.2017.09.01.14.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Irlil5uB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnt9x-0002zz-CP
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:07:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt7J-0000Xo-M7
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 17:04:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt7E-0006tH-TB
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 17:04:41 -0400
Received: from mail-bn3nam01on0073.outbound.protection.outlook.com
	([104.47.33.73]:10332
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt78-0006no-EA; Fri, 01 Sep 2017 17:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7D0J84rGZ7R5hZDHdABR61FZiVrE6onyxuym3B1dl+s=;
	b=Irlil5uB7GLHixzahuTsEOHTSu3ybP2vbWieyNNraRabGPO0rdiOzk3+8z7Sx27vxAvM4jzWgbQhrU3VxqlAn/0HHDSp5CxkP4AbHneD5pOUk810K9+EAR2ERtOTlaE6DFcSkoH8G78XxShHmTRKlW7nDYPJ2N0Y4z/96FnMzrc=
Received: from MWHPR0201CA0007.namprd02.prod.outlook.com (10.167.160.148) by
	SN1PR0201MB1935.namprd02.prod.outlook.com (10.163.87.157) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 21:04:28 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by MWHPR0201CA0007.outlook.office365.com
	(2603:10b6:301:74::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:38302
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0002QC-O7; Fri, 01 Sep 2017 14:04:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0007gz-Kr; Fri, 01 Sep 2017 14:04:26 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L4Nui021037; Fri, 1 Sep 2017 14:04:23 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt71-0007gY-Ha; Fri, 01 Sep 2017 14:04:23 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:47 -0700
Message-ID: <75dabbf39e5c9e84a82a6d7a3e82ed4ff247a707.1504293917.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23296.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(36756003)(356003)(76176999)(8936002)(50986999)(54906002)(6666003)(626005)(2950100002)(305945005)(63266004)(106466001)(33646002)(9786002)(478600001)(47776003)(50226002)(77096006)(5660300001)(39060400002)(2906002)(4326008)(189998001)(2201001)(5003940100001)(50466002)(575784001)(81156014)(48376002)(8676002)(36386004)(81166006)(118296001)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR0201MB1935;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT027;
	1:WfMxOVlE3yWihQrQ449BhIXrwhg1L4xkJ7JSzrDe71o9q0vVoC0kZfMAbal7ZYxUo/ozu4gSEkL4wSoRhasXKd5i3wyJapu/ovJ1P64G5OX33cf299BS9LVoagVDtnK0
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a506430-ddc2-413c-d5e8-08d4f17d0824
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:SN1PR0201MB1935; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	3:LgoYc43qhJuf/0BBbOhp4cUzluC+QfzRR3fcGNI/cNXifoeLOpt3BQHidaK+T6UP/Rj76qhiWgbJh0wb6o/WEaUp0heTbBIsPLceFMuhAAVIicM0565deRTV0z9sYwt633KpeW0m8sLaiSD5QKd1Q4oUH7cIYWE+2KoegeUqp6OVj+SpETC21yPuWAw6tbd25J3MyEd/QUe69ZZHFheQLFnkFTy1J+kr9FWHEO/H+QXFYhvcjzRFoihPKdRIN33eO86i4Hah8A4923CCcOgecxDW4qwpx0pwiqZrL8xdqXhxa+BLMEDAHlQXLlFp9QTXjGobVMJjWTjrFoH5VPc5WAU28q3ny+O/5pyzcDSUwuw=;
	25:nhGEPi2UmbjbcH5NV/eeIu3nVlRRz/DkqBcR0Bsd9qk9cymOGY/mtaC+F6dP4cRwZzVVLwrlT9ZMSPP0pnd/474ytNh4o2DvZqFUj9wseVHhRDX8GmqF6vy/OpqQcEn3++V9tZeYkd8RHpGg5dLJXLmDlH6SlqOe26LW7oFn7CgeoFVmc7KjRscs1Nnf4ab+N87G/acOTMzVJXIn9X99kd7xLAhGF8MmSDWnL5rW9GTehGBe8qeH4nleZMMrZ2X0BnSzIbB2jswSWZBaJXMkdfwT6DH/Ad/SDs+a5WWXp9lKmxk9NT/Vd1k3O2zezWs4iKbEbSOCTgrZDSi0IZzSmw==
X-MS-TrafficTypeDiagnostic: SN1PR0201MB1935:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	31:p+M4EIFUzP4NuOYKILn4714VVLlGc3jjX/bs7clUU/HJpk4cXJ4LzTJN8CDWK4rJieOYhZk4S0wexYEoAUYDWnD/jY5yJCDiyp4K8SloV408t+m5dvfLIH5b55U3EruYKvnHOQYmSN5E3kF1r7d2CZfnFpFBXOTGQSjDEJHTaB61GIRBfZhVXduK8xQqTReADd+H5yqG3v+12RfBGmvgslP4vhBQM0siiOMwSyHpV+g=;
	20:mG427sAVMn5WTiRdzyEgt/i4hnkI5Vkh9tglxCn1o7vJxVmbNg7QvtBkvAiJi2IQRItuF9EwIe3d8uGet5auGP+xeLPunjBi9x3sSsSLlwtGQnAhldqEr2BE5mUY1cfq3fqq1mcSoqyhmNzEZqONiEovn21DWo0lyISq53Yn6/gP/pVtf8HLeteo/9jAA+K6+t5/pydxxXWPJgUsulRgOHMLAN73rfoSE9N8/UsHwR4zGidWMm958qctTXzAN0jsYmUSxSK+iaIalRF+pTtnLCvUG0sYkzndPU77t7QelqKnzW9ADN5IR32nYYjEnxi/5/xi3PNM/EOSfsgvs9xhtq/RiXJ279JPxkeVsbvTRH4uJS6MewvU76g7sJJulofL+CTycwepqO4UuFFzpo0aDIPPvm0PDXyj7AYsKk1A5ZfjK0wKJZPsSwaU5gLW0LaYN+XdqjBdRGbJhDgKEujGEX/0WT4cKaY7j4xjU/eLNtEtrcLHdJ3Fla8FJCY8Rgwx
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <SN1PR0201MB19354E7C248182AA2C8DD3A8DC920@SN1PR0201MB1935.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13018025)(13016025)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR0201MB1935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR0201MB1935; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	4:w8aRtnQ+O8VWIIei8L0SvcOK8CF/YxBEQ6Epp4cG7GCE8vs/ZolT4cKjfonOXKqQup1KU15Bu9Mk2XYfUITvw4cWg+GwwTOfHk8tQwf3hnwze2xdd7qelm7r81NWFWwIkvghIEWEEHVvTj5OtS1rXyuJ0ezK5Vu0dq7ppKAKTMQL44iyWkmFczJHL1LYUTFzBcIqpqig1yD+JwOHYsboohiE4/FNrLSGJtzy4RNlGc2AHbVgMQZ2Q4bIgs9FvnBckg8XW6xqInLCxrIqL+g8QpF+1gbuDU/1Abfk6qQhRX3E0Qs9uiTLMA8+G6vFeRmO1uAdSvGV4+n257yqg7talQ==
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0201MB1935;
	23:tQlbfe57EJzXYzrn8EJgZIPdyw9DJyuO3w/2oHj?=
	=?us-ascii?Q?Rzx5fGQ7byCI2F9si7ThpgbX5MNnPO1eGmybf2yEXUyC3f63gKxfPOhG/D0k?=
	=?us-ascii?Q?jOTf34kE7Uhycye3h9y9W1OIQ2lExLBA+u7n9A+2xEe4DRNqrJvFjxE5VOkE?=
	=?us-ascii?Q?bY6Ctgc0+c3COpgGTmd+1U0oYV+EvWkeCeSxSmND9GW1Cw4ewPRbTRDVQMPi?=
	=?us-ascii?Q?z547DvtcIhc9RNCXGCdxmuuDrW6+Dzx5KCI/fZ98eLeCAK3a/LM3IGlJJhGp?=
	=?us-ascii?Q?QK8jS5up1Qqwmg+wkM7cI6ZQiV7pLNdsO9D25853dDPREdeA01flmaxx8sER?=
	=?us-ascii?Q?1TYvpMAaMdF5YN96BZ+jJh3ThzIhqQ8faKj0U3YU2/4kGJF9J9CNJIARHoej?=
	=?us-ascii?Q?pcvWUENZRVwd8rxoiYYC6Ib6S3ufnEDY5ZctqE6NyqZ3SJthNOAMSU83Cx+b?=
	=?us-ascii?Q?9G7xR0yntGJs3mnShabdCbCH1Hwy08YkF1mA6vKzTxPh3UWKrWsrwBASjNzR?=
	=?us-ascii?Q?td9l0b54gxxWiJAaf0j0+V2pQOvLTtCvoTalUNfizXfHIdRp+IzSLk5Ysdnh?=
	=?us-ascii?Q?F6TiIZ/LTLCtYd2hIISigfcUmXrEHwzZwGCKAZyJ6PbfZJr29O72YpG3ut3H?=
	=?us-ascii?Q?q/tyXuJ7Q8/k3Jqq9lvXHaY6FmjwEjnuooNVfJQCOR3fgy0DdfBA0VpPMXAL?=
	=?us-ascii?Q?CK6DQBX3CUqlMdELIkd65szK1J9f8nRdgaWPixDazpcpP0YokZEDvKwFuQh4?=
	=?us-ascii?Q?kR4PBaqEIfDYGwtEPp8IS/jUwnpel3BDIBea7Be0HVIwBiwjZPOChXn6c0Yu?=
	=?us-ascii?Q?2lBJ8cvRr6suNzul7mWPpjG8qNwmfDJJvR8pM7cbBJdJ/qROe/y5NM5TcNls?=
	=?us-ascii?Q?4jKMdW+r25ky7fMYl0ZAib1t6zjnj39j5Fa4ERqbKZos5vhyLBsPzIE8oWis?=
	=?us-ascii?Q?4mHu0GH/maigryWmrJfHZIUGSzsPcPFnGsyNfJibbDCr2esnoQuU3+7Nd2bS?=
	=?us-ascii?Q?0JPHBjO5HQT+TB2qUbF563XT15qrcRJbLKv5OqaJj7KmbRg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	6:iveuqWLHKDAz6BrqtFVWMMNKYpw/bQS+cXEUzN1d0B0TRCcN9W9SFU+g2Va8s/wMIw2coWs7Ml7JKPxWS6TRsAtCLcSkd9TznAIyq0MrDljByZJ8rPt0tNclaa0KFWWekRDNSUq8r6omBElV8qrRBY5SeCMe1L0OtiuvXCGVWLs3UuLaebp01cHossIcKy77MINkfsFwVevA4Xr/SKunrjNP3l36r0FI9WzYDv7VV5kNV0S5x/spRVRC+20naUQFRBWvk9BuoWp4LwDLcRjK07IOGZHmSOIadcl6dtTJKqgbesibJy2AP8IExiKMU8buIf3BaciTZe4w0RvfLiA+wg==;
	5:MnN8VhORe5r8p5qYBNu+bTlAm3QM3hsqerdt4eN8pFUMXhCInuXYGMStBjs3PhF8T4NPop3C8bfrhA7YeOZWb81YaQmaplXC7Z4o/+gdKSDNNwPilv5aVxPVy1CoM3pl4y4S1DCelLEoWOaGKeQyog==;
	24:fulLuTBu/iu5N0PinbtsFOpTmN/G0abjFSp9BcqxsUGW3GVwWEe2JTrPrIs15Cxrs/qAkWkALLy/lgXW/3UtfmAGNlFrMrtNxqxqJNM6Vyw=;
	7:GWnkqTtTSdGgfE4vyipWzG3Qfu/Zkz9eNaxRCkAc9XrICcdwlulIzIi/9HrkvM6YWAI+Zkwh2KdpwNZW6d4zaH09POOkrMfq8T3J/OkDEVBMIP/U/pq/v1MQ4UPYcLmunQSmrnf1+8pU/3syt6hVwlXnuAZ2AlVXQ7jQWzjUaH990CF+KB/Vo06O/frCFwnutI+RRbOcDiR1He1tPIHNNLt5i/K8Ac2H8Nn+Bt0GLjE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:27.4045 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0201MB1935
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.73
Subject: [Qemu-devel] [PATCH v2 6/6] xlnx-zynqmp: Connect the IPI device to
 the ZynqMP SoC
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
X-TUID: MrQMqT3kOpOo

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9eceadbdc8..1988cb47f4 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -46,6 +46,9 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define IPI_ADDR            0xFF300000
+#define IPI_IRQ             64
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -179,6 +182,9 @@ static void xlnx_zynqmp_init(Object *obj)
 
     object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
     qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
+
+    object_initialize(&s->ipi, sizeof(s->ipi), TYPE_XLNX_ZYNQMP_IPI);
+    qdev_set_parent_bus(DEVICE(&s->ipi), sysbus_get_default());
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -427,6 +433,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                              &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dpdma), 0, DPDMA_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dpdma), 0, gic_spi[DPDMA_IRQ]);
+
+    object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c2931bf39c..02a89766e8 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -28,6 +28,7 @@
 #include "hw/ssi/xilinx_spips.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/display/xlnx_dp.h"
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
@@ -85,6 +86,7 @@ typedef struct XlnxZynqMPState {
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
     XlnxDPState dp;
     XlnxDPDMAState dpdma;
+    XlnxZynqMPIPI ipi;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
-- 
2.11.0

