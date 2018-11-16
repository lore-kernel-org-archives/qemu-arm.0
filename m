Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp185384wrw;
        Fri, 16 Nov 2018 02:07:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5duWnsD19S4Rc6JF/tNCXmXFwgBA3+VjOlwcc3HMxdugX7So+diBEQChGaDDVloG4AUI2nm
X-Received: by 2002:a0c:f403:: with SMTP id h3mr9639628qvl.137.1542362858358;
        Fri, 16 Nov 2018 02:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542362858; cv=none;
        d=google.com; s=arc-20160816;
        b=L0WqZQmqHn9UZc6qsmPwWgvRDFpiiFxXmImAy6TJzHI6K3W7tVhhtH+CF6Oxusm2oZ
         ckNItoPOkHAHgicB0UgDnyAeu6I5DiQ6dTurSoEBb7WxPmYoG/Gq9clvJRKKh6r3j46q
         +05LbJyq/kzvEchcLyqK8HWmmQyD/ZZs9Kd48R15xQm2BwnFIRJs1Ya3zi7UrFHTisz4
         Ru8tjGqRz5X2iiMtioxVYCESGxXMVVcHcQH9rnbJEYptNH1bxTvubyEsinZSylo4Zr8s
         tLMkcNXvbcEYJh6znceTzFdnWntAXPQPv/GiUD2kizVy8ZP8rvQYpI7xnfxwrW90ku1/
         vR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=ykL8G76KrTdgousqHaG9Xj9RC/sQZTAXaA2hlp7aP8o=;
        b=lKIBtqy4omx4Kj80+Fh932BrvEs3CBLn7w78SqL/XxAdmyBtNAEGYTrdPY3qRfXzd7
         Qasc1JEf8KQTUu7DjCW1GsKBVd4QwXdVFOy34tB9mcg2/wzZ5Bd1BCWmetC76bkKvDF6
         kMHVdfLB9nANfugPyoX+ySKzNQHnNdeDsrKQpGkkaaS73N7VFgbwOyMKkznXBVtFUJ5z
         apsHtVU+l07ocqcyH8MNkCfHfH/JsZ5Hf6jcOolmNxF4P2OIDlxMPvXWQfWS03i+fWw8
         ox/WjaFasOEhFYapgXHWMl4qaozE3lZFqI6e04je4ZoUwiznKaog7oc1pbPwSMLMdrHG
         2X4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lB494hUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si12950832qve.22.2018.11.16.02.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 02:07:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lB494hUq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNb2H-0003oj-Rk
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 05:07:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb27-0003n5-OU
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:07:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gNb21-0001vi-AK
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 05:07:26 -0500
Received: from mail-eopbgr700082.outbound.protection.outlook.com
	([40.107.70.82]:23376
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gNb21-0001vI-3A; Fri, 16 Nov 2018 05:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NQEu5kn9WqCLYeLdNvCEkEPz7peSb3BrsSEHtjE1J3A=;
	b=lB494hUqqf0wZAdT5lWihHXyFQOpkzqNTqp204fLa+qEPx1pPIuCh4GGkQQfJzjDqasbMPfCK1yXJHD2bTLh5m1C6PKIaAvJs22GDEfYXJW1X+TCB+y3dacPvplw1Lg6d9ud+ifOlFzWzqXoKuUC2gij1/eET8cKHJqYx2eTbeI=
Received: from BN6PR02CA0098.namprd02.prod.outlook.com (2603:10b6:405:60::39)
	by SN6PR02MB4461.namprd02.prod.outlook.com (2603:10b6:805:a8::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.45;
	Fri, 16 Nov 2018 10:07:19 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by BN6PR02CA0098.outlook.office365.com
	(2603:10b6:405:60::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.21 via
	Frontend Transport; Fri, 16 Nov 2018 10:07:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 10:07:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb1x-00008q-R2; Fri, 16 Nov 2018 02:07:17 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb1s-0005co-Nr; Fri, 16 Nov 2018 02:07:12 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGA71XO021130; Fri, 16 Nov 2018 02:07:01 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gNb1g-0005Xq-Ov; Fri, 16 Nov 2018 02:07:01 -0800
Date: Fri, 16 Nov 2018 11:06:59 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181116100659.GR7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-9-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115094207.22846-9-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(438002)(189003)(199004)(4326008)(8936002)(9786002)(47776003)(106466001)(8676002)(9686003)(81166006)(63266004)(6246003)(14444005)(5024004)(81156014)(58126008)(54906003)(316002)(106002)(356004)(336012)(2870700001)(76176011)(229853002)(5660300001)(33656002)(77096007)(186003)(1076002)(26005)(23756003)(2906002)(478600001)(305945005)(486006)(6916009)(126002)(476003)(11346002)(36386004)(426003)(446003)(33716001)(50466002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4461; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT028;
	1:VNHOeQL8UUey2p/XWoc/vDOYIU0pa+CgHCPL4m4e1BeZRttUtcZ/I3wC/ZiNqcvyq4ZCJE2haX34LsisJjMyzJEcB0Q3Y4aHMQrVR/xTBRU3i6QH6pbdd91AYbCPJbqa
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62314204-c812-4862-4d99-08d64bab4ad6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4461; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	3:miTObPOEBqAaOS8joFyDNktqr1DCAazZzL+AhBycYkfmFs0T1mCOAxSJgfm8XcJpaLxaLfxprfTVXCv55EBsFGD7Jq20EZPaby1pEibLH0e15jKs8t10/zUk0uDl1VbVwlWHywQpYhoufR3drNP0KmAVJp8MrDJK9BQoBt+rVjZXlJW1ZozhZINBgAEpoRVBCDi8r4OZNufYCk6hkXOEbqpXh/l6htG7+nIUo3eOusPbixnRzv8/l8tXRf3WOAmdplGW/uWWW49K8OAgxpdnddWKqmGoJsJVqZpMXpnlyiruZucTcjIvAq9kcX7nXnS4g1JurE0VhA7s3sF5GRqxrBfT8nGukmg5t0sZkUqb8UU=;
	25:kTcVV9J5tcVNuTsDbCfqvb+gzj95CScuUNxHLw7J7M4pVBk6Bo8RPJ3aXPsWWS4E/Z9b6fFroe0X3aqvSrB0xANQoFXno2kgHnc8opDrKDoZ8ZMCLSmji0cwlc2yCMEYsF3CS2vq7NrHuNDWPRuRWZ0ED8U+LZNgDGkXPvKa2+o8pJQjZ9d3jQnPotaociNiTqeG5wy1qrlBcuLe5jiGJ4ha+5l/0fsFiHZ7rI4JuqovPz+DDdfFe4H1ZfAVAs69Y0wmDXNS5MNGJP19Q+c7TPcA2LwAmHZ9Z6oaP7qei6X9m2QXQMrKqSYxfy8eRWj96Zya97IT2kLuZBVha1Sl2w==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4461:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	31:SHIwopWekFCNy8YvYEV1E7CCdKyFdz3N+qVufL407M+zwEk+Aw7MzOxnV56/EiYqmDMEMXrkXxUeDjksl6KDjeG9/MuEqEfI7PNJi2FFw/PinF+Uldd909qw5omuDZlpe/p55A51svHHmc8GxJeqBpdiGbcgM76Voqzd3oDXDHx9OEfsWYm6qg7gB3kKaq9utaOFqsKKvaSNRC52tUNE/gT/LS+OvKS0iMld0572jaI=;
	20:1sf/p4HhkIKwXywVMjB9zelugWFatCaTqi5a16pgZ5I9DOBacctVR0otns+BSflwxFTEUolZl09vL91LevLHa+p+gHjZQVY6V6c0/C+CnSTZGw8pPpUz8pHB1KmwuRXOcQJZakZUc4glPMm8C2EJlHZc09KjForM8Gx68jrYRWF4+N/hqNH6vuN3psiSP9JVOF+Hz02Zqz1dmr0+n146pG80+w5fdmokIXPS2kCpnpZgkH752u/4P4CbTXueoyNKuYESY9EMlS36Uc4ks+d7VRgbrhuKoY+CEG1yY7wdUjdu8XaKCUBJ7NXhzSjrRSzzq+36KrGDYmKIfdEgq+d/9Hwy881sVGY8Ovz4UySRI6AKNMU/0XW9/bKxiT59f5qA9dY42f9kzfyrgzS7oSwyEmmSeabPtKkt9G1ZPuICVi3IIxxtV85HDEv+YfU4Od6o/gja7pskrsE5+SjMVvS5Kmxo1vpJBVQbHzoJ0JeehO2IGEOcXcJTs81/WYtEmbGm
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4461B5D8B62BD44935E273EAABDD0@SN6PR02MB4461.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4461; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4461; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	4:Cw/CJu10S64034aSOQIPqRLwwhiY7GZhKmKWKDYuTjdEj7UXiIBilZH7e/T4Jv7wz4oTmUx+akLRpw0RLCOyrZ2BDF2yBLMNQAXVjbsnRHL+OzJMD3z0O6e4vTMO++pwaE+UP/aaCAtv/OoPJ8pvm6Gk/Nje6lNmWiXGSpuciH1wEDmaB1PD4K92xqnrI2mujA7cabtc4ZEf5OgHm2HOetVxmTwPYSw1FelYQV2IgdKLPPcghjYcQpr94xe+G4e9YNcdrbjhcJd2Nwvlr+FvZW4pg+wAt5v2P8GmI5+yUBwZWzX6KK1+6ybBoxC7HHx8
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4461;
	23:IPzqNAg95qEoSbZXeeiOC66eoG3t/3GWqH6BKTcBh?=
	=?us-ascii?Q?ytCUrWq+WMP42oXYVlE8bXmBJpvcM/uiMplDAk4ypTp85EHfCOIcqSZBjlhi?=
	=?us-ascii?Q?+JyuweQ0CORAq5kegjKF0UR82K6SwaK3TDGsXeYbFxuF1bwpOFIVMgeP16nk?=
	=?us-ascii?Q?iK1Tl2HvcXzGz7VPmJ23sJ/uRr0B72ch/iigl4ez8CY13N0oEOODjLZT8THo?=
	=?us-ascii?Q?TcBtK/myy7F8nSk9O8wJbbpQeqM3J8UjGQnPb32LKIUH2JIXswUtGFNiRrnz?=
	=?us-ascii?Q?eJaW9gqGipBxQs1QPTl1i1DD2u+7+9lHGSSeHpBqaPCxz9SVJUyWx17+R9Fj?=
	=?us-ascii?Q?bn0flPebEggNU7YVnF/KKtAAiajbAJVNwDTyZ0coYQ+P2IdEbI9ChDjZOt9E?=
	=?us-ascii?Q?RCyPU5lC/idBQZNe9g+NeOGTsDe3n89hG58O5XjNOvSAvgZmTNkAEXbEDqOq?=
	=?us-ascii?Q?yYrC0D/sxOtatXwBbp+b7zJc43OlUk5KnP153MynIJb7MYrPd9mNqEL6DgyV?=
	=?us-ascii?Q?EuZQ6sPpmysW4NXXE+CKJC0i+hx9ZqwG2UH6jVznde8Lgx5cx7zBwMzk5spt?=
	=?us-ascii?Q?2LyRT1joeiStZwbLXY8PGAMRZkS1JUcrPvOpV23H9mP+73F3sjwIdUyIkugc?=
	=?us-ascii?Q?YWm5US6SZOvJb2yyrcTctMSxQjf3FwKvZANoZ1WOuEXcjCtabPm72qQu268d?=
	=?us-ascii?Q?01pQ6pQR5+EqT6ar/WAHHAEJoXXiSc4f0ogvUsG7LWlakSG5gIEIFYX6bTPO?=
	=?us-ascii?Q?t3eghrVxi2yJPXyVnVZqBJ/AyoTNc6y/zhTdNTxy9ZgbfPg62LPT4qh2GKHS?=
	=?us-ascii?Q?m5gdA4WF7THWoA4PjLfEWUDPtRiZlMjlDkqsbw6EtmCFhG3decEKrOVkUvaW?=
	=?us-ascii?Q?xnNgba6zvgptt/Q1hfq6RMJRMiaKMtDcaTAvH1uXqfzrF7EDbCBLjsWBrT+H?=
	=?us-ascii?Q?eu8Le18nEzLdYrq52k8qDngldLn/5DbDsElzgpd00uqn99hqV4mg8kL5U6Ib?=
	=?us-ascii?Q?9T+KzjxF3ygMr9p4iXQ0Y8wCorjaerm3xQxeKSbAfOEwFIrzI5SxLVoP6YEZ?=
	=?us-ascii?Q?W1FVACh470z/f+FkGQjkrM/Xg9+fSt+pBKcqBRuSV0N7knOfZeTW306MUowG?=
	=?us-ascii?Q?m2uKHKybv5EK0Ay+Oj+FOvPN7qbtxELhUCXqIv+hcIOEeI9MQ1vGyMqPWhvw?=
	=?us-ascii?Q?GzcoHhdY6ZnXy4=3D?=
X-Microsoft-Antispam-Message-Info: Dh/cST7loI3Wno2I14M0sUEU2WqIq+/rWS7Yqku0EJDpzaFof8sbVNuJhBHaG69lnZma3y/0+Viq7vKHWeoaICVAYQ9CKkz26GVXRIsgcvvXfzH5gKCNZIpVnUHaNm4y2eybr07Jb/HMm4WJipmoSo5ZLc/7zwdsRkUxipVyznZVAyqE/aMdY8DQjxga7OipfRI0ppGUlCy00e0+llnOrvBb4A+a6t69fr9InKo85vts/YD/IXXuW/YR8gDjTY6sbk1hC2k2fswgJfgfhq39zBDEQFZAjEwTkkBsrplg1XcoWnLY6Eb/ipcHwZ04WxfVm/VpEbtK/1mQwZSpfI1PLrpEUwkjRd1OvUmW58Lmo8M=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	6:gUrxeUcv6/qBHIOQtqruKY0eb94WH3cy9PTUZgZi39jfQ68tXdqFgZXbXDD9bXSjWTKkEOMvXu2+/67Rok8xATJC6tp3QOok63Iluc4khLU1mG3jewvlXLwffeDYCumboJhxogeMsKXSzTdTAAOiOeXaX4hp45mFEUYpH07v7M99mAsipbDg1mPlxkOt2Vivc4emLSON18/0nwk1xHgqEzn6RqSnCy7hGH+qF+TjqxEkPY9om3h7PmdZ17bPOvxoW3qrT/Hf11flQ+JUmamtblBDEtR5JJUR7Yh3tDZdUvceDXG9aD8ao3D1NsL/oHU+/+tOJMomKJ+QQ/AmtkScbgQoH/a4hH4Z6DnTOJwOGO9zwR1vvZpcQD5gHQcbLXZObi3CW5Xnxx4Mlpkw13Wv0DcqZ7w9LNv/8MJQWu1RSqDysQjrLP8SIRpJh/CDRqQYZUZFK99eEvFVFNNm5AgM1g==;
	5:dzDlfib6fEE/1ZNaAsmxsB1pKAk0WzRXM68unrWiUDNDHqRLWFa1TNCwcsyqLUfe65LMHDJGjEZRnlJ96P9GAIeSKEX/Ji5CkotGqx+UCfH+K0sB1gZhcjlpHpOpsL7PBlNmFJ2C/IDiLJPr6DMhkU2KWxe2isrpbD/ZbzaqY+I=;
	7:L42hYXqHjTRlr/yAUKHwp2/gHgoFxU4YMYZFDE7g3D/wNAxnkQaumWFA5GsUI/efKv5oSIx6SygHroz5bdP3fU1+gTV1YpdjMNAv3g+UYgmG85RwcUGQoYirMDnz5nl3y6wbAyjfJxrmrPQoHFtG5g==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 10:07:18.2959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62314204-c812-4862-4d99-08d64bab4ad6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4461
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.82
Subject: Re: [Qemu-arm] [PATCH v6 08/16] gdbstub: add multiprocess support
 to Xfer:features:read:
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQK5BSTY2+kN

On Thu, Nov 15, 2018 at 10:41:59AM +0100, Luc Michel wrote:
> Change the Xfer:features:read: packet handling to support the
> multiprocess extension. This packet is used to request the XML
> description of the CPU. In multiprocess mode, different descriptions can
> be sent for different processes.
>=20
> This function now takes the process to send the description for as a
> parameter, and use a buffer in the process structure to store the
> generated description.
>=20
> It takes the first CPU of the process to generate the description.
>=20
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 47 +++++++++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 20 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 292dee8914..4cbc81ae5b 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -298,10 +298,12 @@ typedef struct GDBRegisterState {
>  } GDBRegisterState;
> =20
>  typedef struct GDBProcess {
>      uint32_t pid;
>      bool attached;
> +
> +    char target_xml[1024];
>  } GDBProcess;
> =20
>  enum RSState {
>      RS_INACTIVE,
>      RS_IDLE,
> @@ -804,55 +806,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
>      }
> =20
>      return cpu;
>  }
> =20
> -static const char *get_feature_xml(const char *p, const char **newp,
> -                                   CPUClass *cc)
> +static const char *get_feature_xml(const GDBState *s, const char *p,
> +                                   const char **newp, GDBProcess *proces=
s)
>  {
>      size_t len;
>      int i;
>      const char *name;
> -    static char target_xml[1024];
> +    CPUState *cpu =3D get_first_cpu_in_process(s, process);
> +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> =20
>      len =3D 0;
>      while (p[len] && p[len] !=3D ':')
>          len++;
>      *newp =3D p + len;
> =20
>      name =3D NULL;
>      if (strncmp(p, "target.xml", len) =3D=3D 0) {
> +        char *buf =3D process->target_xml;
> +        const size_t buf_sz =3D sizeof(process->target_xml);
> +
>          /* Generate the XML description for this CPU.  */
> -        if (!target_xml[0]) {
> +        if (!buf[0]) {
>              GDBRegisterState *r;
> -            CPUState *cpu =3D first_cpu;
> =20
> -            pstrcat(target_xml, sizeof(target_xml),
> +            pstrcat(buf, buf_sz,
>                      "<?xml version=3D\"1.0\"?>"
>                      "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
>                      "<target>");
>              if (cc->gdb_arch_name) {
>                  gchar *arch =3D cc->gdb_arch_name(cpu);
> -                pstrcat(target_xml, sizeof(target_xml), "<architecture>"=
);
> -                pstrcat(target_xml, sizeof(target_xml), arch);
> -                pstrcat(target_xml, sizeof(target_xml), "</architecture>=
");
> +                pstrcat(buf, buf_sz, "<architecture>");
> +                pstrcat(buf, buf_sz, arch);
> +                pstrcat(buf, buf_sz, "</architecture>");
>                  g_free(arch);
>              }
> -            pstrcat(target_xml, sizeof(target_xml), "<xi:include href=3D=
\"");
> -            pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_fil=
e);
> -            pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +            pstrcat(buf, buf_sz, "<xi:include href=3D\"");
> +            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
> +            pstrcat(buf, buf_sz, "\"/>");
>              for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> -                pstrcat(target_xml, sizeof(target_xml), "<xi:include hre=
f=3D\"");
> -                pstrcat(target_xml, sizeof(target_xml), r->xml);
> -                pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +                pstrcat(buf, buf_sz, "<xi:include href=3D\"");
> +                pstrcat(buf, buf_sz, r->xml);
> +                pstrcat(buf, buf_sz, "\"/>");
>              }
> -            pstrcat(target_xml, sizeof(target_xml), "</target>");
> +            pstrcat(buf, buf_sz, "</target>");
>          }
> -        return target_xml;
> +        return buf;
>      }
>      if (cc->gdb_get_dynamic_xml) {
> -        CPUState *cpu =3D first_cpu;
>          char *xmlname =3D g_strndup(p, len);
>          const char *xml =3D cc->gdb_get_dynamic_xml(cpu, xmlname);
> =20
>          g_free(xmlname);
>          if (xml) {
> @@ -1258,10 +1262,11 @@ out:
>  }
> =20
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
> +    GDBProcess *process;
>      CPUClass *cc;
>      const char *p;
>      uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
> @@ -1639,18 +1644,19 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>          }
>          if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
>              const char *xml;
>              target_ulong total_len;
> =20
> -            cc =3D CPU_GET_CLASS(first_cpu);
> +            process =3D gdb_get_cpu_process(s, s->g_cpu);
> +            cc =3D CPU_GET_CLASS(s->g_cpu);
>              if (cc->gdb_core_xml_file =3D=3D NULL) {
>                  goto unknown_command;
>              }
> =20
>              gdb_has_xml =3D true;
>              p +=3D 19;
> -            xml =3D get_feature_xml(p, &p, cc);
> +            xml =3D get_feature_xml(s, p, &p, process);
>              if (!xml) {
>                  snprintf(buf, sizeof(buf), "E00");
>                  put_packet(s, buf);
>                  break;
>              }
> @@ -2323,10 +2329,11 @@ static int find_cpu_clusters(Object *child, void =
*opaque)
>           * runtime, we enforce here that the machine does not use a clus=
ter ID
>           * that would lead to PID 0. */
>          assert(process->pid !=3D UINT32_MAX);
>          process->pid =3D cluster->cluster_id + 1;
>          process->attached =3D false;
> +        process->target_xml[0] =3D '\0';
> =20
>          return 0;
>      }
> =20
>      return object_child_foreach(child, find_cpu_clusters, opaque);
> --=20
> 2.19.1
>=20
