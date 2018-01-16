Received: by 10.28.173.206 with SMTP id w197csp4571527wme;
        Tue, 16 Jan 2018 15:27:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBotRQDdDmZ5E3204TK6tzS4AF4WeTf9bDTh9TeP1XG2vOGDCawcL7zGJPQltb5Y2qh12iIIr
X-Received: by 10.129.174.94 with SMTP id g30mr773728ywk.85.1516145237417;
        Tue, 16 Jan 2018 15:27:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145237; cv=none;
        d=google.com; s=arc-20160816;
        b=gKDbqw2N3xG5VrS2HO5x99N/HMhbvwXs1Njj7QV2wBm8N2BDwX4dl/X34X3FPOz9a8
         vJ8sK5Nm38Q8rI3FXyyuc0UlfAPOcEZ/whkWpPbem63aFqp1J5cNYm+6BLCxwA+ea2gE
         nstE2BEZ+T/gEgzuIxS9bIOZLXdfvtISxgoIbmPMLg5+SMfXjxpILxYHx2LkBaHIqwVO
         XKM5K3RaZm2MT114DPb66UveUdGAQlK8Ubm4jriZQUn6wo0/tKHDltmLApGANUY99czB
         SYnokGIGZrAyQu6xZSZAJ0ZoYOnhEVwaM+87IVJoe8jeTPPtkBaQQq8h3FSs9QLnmaNR
         vCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=38oCpqmuL4PFVkb9D4N0cQToIZriMVomWUm436memO4=;
        b=XZQJd6Bcf+C6pvif9OYgQtFrpgeXGu/5cOb+dN0Up+BAlIkx5lMi7OpieBZOoYS0A0
         WFX44Xq/QTFonaR/YsgVQypBe7Uc2G4FqCtZNrJ+eOm41AFdc4OC4Fe69nVLg1Y+cZET
         5W8gbPoTOkGygRj0/qy58RSHazhsrzIAN7kub8IsRboxM5aqSxeUXge7oZhaUk3vazvc
         jvfmdEq3o/FozRcHyMWF45/mNc7cl+CdGAK/tZDFojp4A41YhsebCpDrpZudcKPOXZvK
         Hl//89gHylLkGHjxenIZcT2lkjG9C5St37N0lGS9u0kQ8tAZ8o2ttDloHu4naDrR51aA
         Kh0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=fq+gInUR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13si747410ybm.177.2018.01.16.15.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=fq+gInUR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebadQ-0004Hc-Nr
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:27:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebadA-0004En-6u
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1ebad7-00022i-03
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:27:00 -0500
Received: from mail-dm3nam03on0624.outbound.protection.outlook.com
	([2a01:111:f400:fe49::624]:52064
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1ebad6-00022P-PR; Tue, 16 Jan 2018 18:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=38oCpqmuL4PFVkb9D4N0cQToIZriMVomWUm436memO4=;
	b=fq+gInURg6I8bAf9cEhvn7FR5qAOlB/Ns8D5oCCU4MFW2xh1z2HrDMLRUD9fuSBCu2luzBh9GNPdh/lYixqSjn48V4/tAMtE8f4RFmTQLlfmhiigSlq8qUD0yvguCuCSQVZdwMl3vi0Cn+TCTLzqmEEvB0QUKs0XAElFEhH89O8=
Received: from MWHPR02CA0047.namprd02.prod.outlook.com (2603:10b6:301:60::36)
	by DM2PR02MB1338.namprd02.prod.outlook.com (2a01:111:e400:50c8::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Tue, 16 Jan 2018 23:26:54 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by MWHPR02CA0047.outlook.office365.com
	(2603:10b6:301:60::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via
	Frontend Transport; Tue, 16 Jan 2018 23:26:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 16 Jan 2018 23:26:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55906
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad1-0004Nn-VA; Tue, 16 Jan 2018 15:26:51 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebad1-0003Kp-UF; Tue, 16 Jan 2018 15:26:51 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0GNQh4h031019; Tue, 16 Jan 2018 15:26:43 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1ebact-0003KI-II; Tue, 16 Jan 2018 15:26:43 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 16 Jan 2018 15:22:22 -0800
Message-ID: <3ce133738e77a4d370e117467754369c738a926d.1516144891.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516144891.git.alistair.francis@xilinx.com>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23598.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39860400002)(376002)(39380400002)(2980300002)(438002)(199004)(189003)(8746002)(59450400001)(478600001)(39060400002)(50226002)(77096006)(5660300001)(8676002)(36756003)(6666003)(81156014)(2950100002)(26005)(4326008)(8936002)(118296001)(230783001)(81166006)(2906002)(7696005)(76176011)(36386004)(106466001)(575784001)(50466002)(106002)(2201001)(5890100001)(63266004)(47776003)(356003)(110136005)(305945005)(48376002)(316002)(9786002)(51416003)(54906003)(2004002)(107986001)(2101003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1338; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT063;
	1:FTFzscuEs+iOvz12fyqCEBjMSBUL++MB9WNx8520Vs+XyZCFFraxVroHhyGENRALKcdKVrNBUru6VJuFOOpu6gm6R0Pd62SKg7ehux1qPmLnNSzHkzASEPSZ+SF2xEEs
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b41fad16-9fe2-452d-2a5d-08d55d38a045
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	3:B8WsAeQ5uAcXE1xCwWaS/CJ04nxOqJKAPBul9jUtT+N+idrPfBCQHWS1XE0bS8QNjH8iSJ8OTpPNqAKF4SQlEwAerg7gB+04Okp5cXQJrTEDWbhkCZ5AIFj3J+azJ+6KHjXBbjyyj5BLVGHBf32aWL9JVpjXsk9zb1KjMNmzQMqPAfiHJQouuxPLMnZKTGqJwKs/v8JRirZSSy4gSTBk2h0xRJxdsbDqRzGBmScCMr5Uy1uOBLX+/n7EI3ZlNap9Mw9v4wlpNUc6LKv4cQmOKG7U+/MEB4rr788kR86xGw5+xnGX/jNNQLLRsYhRJqiKtrGrTBenl5LUD0hp+hC7+JIwXYWYKfGSsmMJ5vElxYY=;
	25:KhNGQxPepfA6rHI84D32Lu0ebs97jG01ZIh1WlEYMtKZOIdLZRZ1AhBiTJsYhw6A1KOLW7boDAWWIwnVZe9ewqFwmgNWdMQcPqKy8oc8oMGH/2dJnlKd/HUEfCNRpnNt7cWNdNR/vbUCULFS0nBEYdk1ZR0Bkac3e+WjdHmz9j+/20chcK5hL/sdOiU2wFepxyoQ+4bvrrjvqf8KiSE2OXYArIU6VZw3SQzvOhvw88I/7RSfRJeuH0bNoCiby7y0bN5ltk0pvHciLgIuBcC3aE1g8xtxstfkmLHVR12fy3i6R7Pup/q4/akCSvqi5SEQS0rZdtGOUN6Uv7lZPpCbDqwlsyHOTMQsVe2X1jhp3mo=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1338:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	31:adxlP3slmVkkRE4uLoQFb2j0KWWkoWOfYpgj43KeOx2b/4GDa1uAZlIyjyjo2jKh011A5SLMEqGMZmpbxKOrmITrGuxXjz9ZqRl78Ecsu7vL/JBU03Uvt/z5p3xhILzHoObn5LehAlV5r4IGlwQlPeGpFbqT32tvTjFNwnznemWsb+QdOiJkpZOAAAwMVmH96oNTwCevvCXRlnXeEeIL24ktg+pvD2qsgpJA3OYwuW8=;
	20:nhZZUu7Qwvy00b0nMM99GU17opS04UtmU/Xb/v/BOLfZJCZc4nImlEDTGtYA4oYOpcQ8Bt32uEOmXohqxO76JNg7seQZhoa7z9CJ9EsQMmJjL+cBs9P5VeK9Yu8kdi2g4c/SiMBmX0isqzUU8VOYEMY7InBaCf+Oblyx7SAeN6wks/xAv8jalV+ryLHHJe/XvWK1QuAm0OGK0q3Y2fFmVqcYUB9gaTmSptnRGj2Fat+rPZdCdXEi7ZJ2BGgN4NE3kXHnlEie5eUnTUKHE5Dw+IVNhgmL8faN5zJ8M66UCWWrU5hinEyB/GCZAk23YcF4AXdrH7waT/E1t6QVniyVan94xypMY56XegyPTdildL0jweTk78gm6BbGx1WYefn2eC8CII6j5suDgdA1sq2/dgtvrhRPzS7MAQpSmKBPNw7UMcOJ3lnL6PiAFWVXyzrjnQAua1lIUCQcWPt/cijxcyCLtfA09Vj4Va3O6Ny4564YAQ/upycoWDljggZPZXV3
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB1338D1453FBDEC71ABE5904BDCEA0@DM2PR02MB1338.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501161)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041268)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1338; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	4:AdpStYHZM5pR5CTpk3XW+6riPsnIFFD9fi5z1Ra8szNZM8Zk8/UJTilj121olZ9z561VHPOOgnry6ZC98yWKkuAOS2IXMAqcjx2tEmGFuN4zKGClir7VgxNHBKpV1dqdSDP0z1fGBrX1wtAJx0lL/5lQKvixzIT+/QRvvhzfTMS5MiVX7nHVRKqnx7A3lrQ4wOtNiSO1DhIvxyHjbHwC7AF+321qBqEWkI35oz3k8vRzlHoVMkoSfN8+TipQrhjxIkWVjW6lYWzD5xCFvwxleHDq9RHlj0Eb+6b1ktSvCog/PD/cIVhGmSGrNs0aLDg4nCk97BdDvOZdNdKB4WJRq01YHJbzSbsEa5SwZFSZbTs=
X-Forefront-PRVS: 0554B1F54F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1338;
	23:e9yxULq4gaYvxzO9YUYdVUcp0lILx9mFRDezUUYK9?=
	=?us-ascii?Q?O4YTuoefc0jWGPDexA/Csf11de1HTONmqpmf3EcPazkRUG37EIo0sXhAtw82?=
	=?us-ascii?Q?VD2HYRw3ySrmwX7jFQBJ+dpJfvSNzGdMJumN3NbBqRbydgVF4Z86+kJiyaI3?=
	=?us-ascii?Q?f2Awl3lkOd8QdYXOMd7gmeMQFVtjGX/YQmJjBQvk3icngmQ/djEpO7HljgJ6?=
	=?us-ascii?Q?0plbWnZZiMNRP3AwsLdV1EM9Lp11xbdlWgQxNsCDwyEGzQqSSdSEKRMiwqp5?=
	=?us-ascii?Q?kYY9Lck9Vllg3m531nq+R5ssiJsOqcHzQ4BbSWytSNNWtDnBzNMYc9guPgJC?=
	=?us-ascii?Q?mN41lFdbSrqdG/Te6cTCbSzKed0ju1p8vSwkNmRl2sqKd1Zq1zymrY7q5pcJ?=
	=?us-ascii?Q?h7XAZr3fIsN6c08hOAUqBfy7Oo0pnYH/luTSC17UWTeE8XZ+FbStFjkGzRuM?=
	=?us-ascii?Q?HRJELY/GKEWHNkiW4lknuuqhLCfOahASxYwghP75LWan7XXNqXX6GXJxXXq0?=
	=?us-ascii?Q?EkAWrAwUq9QtCh1pZZAepiXVL2095d1ugZMvKbb6lREVYoLrda3OHXtmNKEH?=
	=?us-ascii?Q?MAhkZUdtXn+H5NeaolnyJW/CnwjGLZT5iN5cg7ni92bq0y9sGwcLIY1szc+y?=
	=?us-ascii?Q?KUexMX0BMf75DkZMyWr7t+0d+fpKhrUOzPa0NJ1/0upb5FriiXFZbWgAK7E+?=
	=?us-ascii?Q?S+4Ovr1vvwH3aJuMfzqb/QaTIVqXK7tF2wbtXS1Ykc027vEfri+zWkh+ylwM?=
	=?us-ascii?Q?cTfyPYZ3MwDPXfV+THLC0OJs5KAyalSEKAa45yrY3vCekIEhQP36BnWFvajP?=
	=?us-ascii?Q?RnXitmje4Fb+VO+4hDThU4Kcr0KOWajK74Jnha7kJDSf1K34umwoRgwTxMOT?=
	=?us-ascii?Q?P9Ob4WO0axlpJO7MwSyxwaXnI2Ym2hgkmAdhVtgn5qxWi4kEIF4WLm7Y5mNS?=
	=?us-ascii?Q?nzNL8b3x1K8PTLI7MeoU62OX1NpoxiL2FU1uPdaTz8HTc+h6+oLZku/yP1JY?=
	=?us-ascii?Q?kxxd0iLQq11IS07ylzD8aRvwEJzeBf3Wr/jihMHBj23AcV4ibQJXzYmokFVJ?=
	=?us-ascii?Q?flN0HBiLIX3q6REHEEccAkoZ8lo+WAHOjoty6+Hw275cx/vrMTHd6NZDCYKM?=
	=?us-ascii?Q?603Vu5m/fB6RFB+OYelqQtH7Nfn4Fc6OLXWW2Yw5/ZdxitwbOsFyEAXkrA5M?=
	=?us-ascii?Q?IAUEZ9wRrLghMM2m/maagtunPyBAOhjBgc4?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	6:Dd1EvtnQsTpga7bQQzV4muW7ARbxTIWmpVEJf/6ltMz27XqkkhL37nQgw7KeQ38TCBJJ5t6UjimekNkOSuCCgsK84dUSXUuFswTn/hP61dk/XXkDY+elkdXZg4EzNRDB1wqi/ZvtfdOM8G/ol7B02K7vxpNXP0ONmHnydOgxx4knbhcmPniB9cEjctwKGz0Oz10O3mwDaBEpCH+zcdZOjx9yOlZ95BdKrB4Lpvkbb2kqNOyQJXnetp7PTeOoHy/chuZfqUjuLx9XJiPLJjDf9+81JIfQWD/76vKF+khqK8p7n9Be1Go3CEtlQU7+n53kTWci+J8XL2RSXC4owwT4TA0vtGeTri71V6TWCP+36Kk=;
	5:k7gEWzbKx+h5371yE+97vB5wTfV6GG+pCmS9GK81sdRXNlZVJ4315Jl86Ld8zwiIVur2aDnvXsoLS45DU4DbRpbMwxQ54fv1ZhLmnqkUuxikVQWNvjcBVuK7JJKZvAN4c/NBiJRbEqdrukuLJ6TtmfasR+5ozjLao2bQ2CvNR6E=;
	24:sFsxyNjWA4XOEnFWCUP1jOje7ANPLLaBW28XqOK7RAbd6t7zmUUVO9D/a8k3TQUejVPR40+eRyYF/MuzssnG4EUI6e1N+MtZ91I+2ilcIsU=;
	7:GLF/elasQ8xN7F6dUexhKnZJKT82quEQ0keAU8OJjYxvOIpA3asgDGbUSh2i4EYnhDAaPg2OTfrFUR9bQqiJwvdSmDSBQyKBZmHM3q3yoh9//R5EAAljfj+EMLnBixUrRm3qAvdHBCUd9byogdEbn3CI/FTYYK8quv1JMgXt6jlGDifQIqJYho1+PyEVqG6zfmKfQSIaKCzy751S5rXAyFVgTaTHS/urkAyiUKEJKljWxlP0vYCqPJa6KQp4pNDA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2018 23:26:52.8576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41fad16-9fe2-452d-2a5d-08d55d38a045
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1338
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe49::624
Subject: [Qemu-arm] [PATCH v5 2/9] xlnx-zynqmp-pmu: Initial commit of the
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
X-TUID: NabckiT/P01+

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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

V4:
 - Rename to remove ZCU102 name

 hw/microblaze/Makefile.objs     |  1 +
 hw/microblaze/xlnx-zynqmp-pmu.c | 83 +++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 84 insertions(+)
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

diff --git a/hw/microblaze/Makefile.objs b/hw/microblaze/Makefile.objs
index b2517d87fe..ae9fd40de7 100644
--- a/hw/microblaze/Makefile.objs
+++ b/hw/microblaze/Makefile.objs
@@ -1,3 +1,4 @@
 obj-y +=3D petalogix_s3adsp1800_mmu.o
 obj-y +=3D petalogix_ml605_mmu.o
+obj-y +=3D xlnx-zynqmp-pmu.o
 obj-y +=3D boot.o
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pm=
u.c
new file mode 100644
index 0000000000..ac0f78928a
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
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
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
+#define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
+#define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj)=
, \
+                                              TYPE_XLNX_ZYNQMP_PMU_SOC)
+
+typedef struct XlnxZynqMPPMUSoCState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+}  XlnxZynqMPPMUSoCState;
+
+static void xlnx_zynqmp_pmu_soc_init(Object *obj)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+
+    dc->realize =3D xlnx_zynqmp_pmu_soc_realize;
+}
+
+static const TypeInfo xlnx_zynqmp_pmu_soc_type_info =3D {
+    .name =3D TYPE_XLNX_ZYNQMP_PMU_SOC,
+    .parent =3D TYPE_DEVICE,
+    .instance_size =3D sizeof(XlnxZynqMPPMUSoCState),
+    .instance_init =3D xlnx_zynqmp_pmu_soc_init,
+    .class_init =3D xlnx_zynqmp_pmu_soc_class_init,
+};
+
+static void xlnx_zynqmp_pmu_soc_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_pmu_soc_type_info);
+}
+
+type_init(xlnx_zynqmp_pmu_soc_register_types)
+
+/* Define the PMU Machine */
+
+static void xlnx_zynqmp_pmu_init(MachineState *machine)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
+{
+    mc->desc =3D "Xilinx ZynqMP PMU machine";
+    mc->init =3D xlnx_zynqmp_pmu_init;
+}
+
+DEFINE_MACHINE("xlnx-zynqmp-pmu", xlnx_zynqmp_pmu_machine_init)
+
--
2.14.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
