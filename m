Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1081274wrt;
        Mon, 19 Nov 2018 08:54:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5cG4UR8UZV9MjGpVFbdbZXHX2o9S8MkEFOpZKb9NqgZqra0DZfe+qbAK4y4v6o+EBIoEQbO
X-Received: by 2002:a81:8785:: with SMTP id x127-v6mr22292856ywf.362.1542646486242;
        Mon, 19 Nov 2018 08:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542646486; cv=none;
        d=google.com; s=arc-20160816;
        b=H0qlZMPclsZUycuUbNYKyK9WvTZ5ZPrnkq1Vb306hmEnjlKmIR8oS3tnaW0Bu7+7KT
         O5y9i1lW2dEz9OCUpY09Pwd7qj000yTViLpIllsA1elE0rD9ieuFLPanfVHSENxMpp0a
         IQo7X2K78fOdGLUQzpyfLJFu7lArH2d33oRhY74L6+PKMNyUHy0ga5zk7mypPH00Ygq8
         z4HX72oYWXucIQJw7TXiusM9ajQL1d4zPwEvUxZCPHKT8F0QDkW5+GzisIcMfCgadmNP
         A9wZGLjJGdnb0WeDcX7OZIDiqwBP/s/8zFqdnHxcIDX1AuuBY23GrzMwYC+VLAEHXshz
         ZfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=EmP2Q3a6NljvFaDQ8cwgLQ/37K4cuCjSckcKBd2BAkA=;
        b=wTryRQIhkMY5sUFzB0RlO8jIIwwXdPGZYErPAVsr2SnnFsxbVRfdLLlzXlZNaAVjSJ
         1gHVGm+EZ68Sg/Y3tkjtDTlXMyIZhb+IooFOPklqt7TWjLFPR4WH0+CY9stH/7kVP73g
         a/EBuYqBDez1nxlg5qFVW5OCgu8YQlw2IuMDZK6cnLRvI+wIyOgHwoP6LF9HjYHdzwEU
         k/BUQg9bvbpK0zCO80UnBzO4h9MUIDcUCEc9dD6gNvEOPB1XiUwbKN9cBRzitrbPfHSM
         IEVJyKcZ3mwnFMsM5+fr3BfMnXvpUQHyNrxilLwm1cJejBJ4RPbPOVl6yF9RniIrJz3P
         vjcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=DON2z2Kx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v76si3722416ywa.38.2018.11.19.08.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 08:54:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=DON2z2Kx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOmov-0004Ff-IW
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 11:54:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gOmmN-0001B8-Q2
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 11:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gOmfg-0007RC-LI
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 11:45:13 -0500
Received: from mail-eopbgr680060.outbound.protection.outlook.com
	([40.107.68.60]:18638
	helo=NAM04-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gOmfc-0007KE-U7; Mon, 19 Nov 2018 11:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WwkeQv6RGLA9tUl6sUW9gc4KsTZxvCN4QbK0tQ8THO0=;
	b=DON2z2KxaG4CvZtx0uwWvkeSU4DmZ8hyX46UYIAF/kigs4Sqr5zYD5WQP1sUPcBKHD6xTC4TWTLXKz516t+IAyro4y6/MSlbmAA5VDQImoUZMWUj0+BIwWZ3XRrmnThwX9U0I0hMZxQPU6plDfa0hafZNjB4GUevR9WKb52NbD4=
Received: from MWHPR0201CA0062.namprd02.prod.outlook.com
	(2603:10b6:301:73::39) by SN6PR02MB4464.namprd02.prod.outlook.com
	(2603:10b6:805:a8::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.23;
	Mon, 19 Nov 2018 16:45:05 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by MWHPR0201CA0062.outlook.office365.com
	(2603:10b6:301:73::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.23 via
	Frontend Transport; Mon, 19 Nov 2018 16:45:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Mon, 19 Nov 2018 16:45:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gOmfY-0001Xt-1p; Mon, 19 Nov 2018 08:45:04 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gOmfS-00059G-Un; Mon, 19 Nov 2018 08:44:58 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAJGivwc022647; Mon, 19 Nov 2018 08:44:57 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gOmfQ-00058A-PE; Mon, 19 Nov 2018 08:44:57 -0800
Date: Mon, 19 Nov 2018 17:44:55 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181119164455.GB7447@toto>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-8-luc.michel@greensocs.com>
	<20181116100407.GQ7447@toto>
	<d4fc764e-f23f-0154-f6f5-29b509422b7b@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d4fc764e-f23f-0154-f6f5-29b509422b7b@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(438002)(54094003)(189003)(199004)(52054003)(9686003)(305945005)(126002)(486006)(426003)(9786002)(6246003)(229853002)(11346002)(4326008)(446003)(476003)(26005)(186003)(50466002)(53546011)(336012)(47776003)(77096007)(356004)(478600001)(1076002)(76176011)(2870700001)(106466001)(106002)(6916009)(36386004)(54906003)(58126008)(93886005)(33716001)(5660300001)(8676002)(23756003)(81156014)(8936002)(81166006)(316002)(63266004)(2906002)(33656002)(18370500001)(21314003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4464; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT041;
	1:7mP9BLAb0LSPZTc09DPkcJASjPcBZOVHMkmVl0r7fbemhImmLiEKZotvIv56CWmofc2ajELZ1JMqeUiPxzHejiQMDXuBNKS8GFv0J+Ca/o19REtgS6sjUhwV4vv15S1+
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c6dcc0-64d3-4d2b-3c15-08d64e3e5b6a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN6PR02MB4464; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	3:BEUs+wX7G/2ykeFgfHdfxnXVI3luJ2CS1uWSLm1Zyyf0jQUknQvFYu8y5aculmIjuUOBZVJmDNTCPkp7QW/orzCtRDJstvhrOIT/a3Kt0LWu/b/Bz8XQdB5yG4R1idTVJCua3nyvauDe9a8vEx860/a5GdEpc3B7OFTC/TIAU/120dySBv4p40ZGAPnPNIwO8zKheTVUCOFQtWOeaPwZQsWZwAbvl/T+X8PGk4Nk4WQhotUqvrVvvNbrPJ7MOoiVJLCaHjb3hpFFcJRFYim9+0AGmTRilYnOgBHbf/EMtFflStzXmefFtU+Viutl0SQzXp9dCpurNGlnEUMGzw7qSJ906p6YPN9G7VQLyZm5aZM=;
	25:kUjP1Rv5t2EFfEwhoISxyLU1vXdhq99nGPK6RZ2K2ICkVQoJQTQJkjBUaPgJ4dJuhavH00W49xfXTryqLJ5UvAnfw8S1XqYvRGEE7zA8CuFkZCei/CHpC7t6XeKEMYoQ5N8bD30iD3yso0v8bW9Gll4D9dHG6vgSkjoiYO/eAfcN37vD38GpTgvLHEbBzPVNRVENP+lL9fbR1bvmcqpxzEjhX7H4/6OGlhZNXTHrJcrdWlVEnw9Wl6i067r06RUfx8IG5iJByoOhULsiaAXNFfNo3qCS4z5UMWJ/YbvHl7652UzyHiG0tyWsemHNuyIW1LRhY5+MlaF/NNLUmjFZzg==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4464:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	31:UhKa0fDIMJNhUrC7XxiV/kHp9FuRJOKXQizBV9LaYmQoqw/HTyYovDI8+nmqKANyexz1e8hCnD7F0ThQ4TFYsO8kGPUI6pawJuoVGTcdnMwlRdodbumYykidh6529Flplm3MRp5OKNqn5hezWpnPi2KLOSIRyYOPrIDzkVaRA+Hq0m8YdjL3PM68INW4XWGRJgLuMID+sYc01HrPLkuG/5vrNbMsk9hk+kZD5pv9Tis=;
	20:QKoMt9L+ol1wT7WUsGXDwfEJl8AfsZ4yBr2pOwhSygchhPupQPv6Iat25qTlnwY8R9kjpR+gt9z1n33bOYzBnG794srXmJeZD/DzN1GtG49dZFUC6KWjqmuYL/HYCONXDgm7nyY7DlaXtRjVznV+ExJQxUZrzsH3CYULECXyKUCgyLZtRN8SkuUdYCDgek/NONz7yLgxDbmw+i9uQnVkzlFn53VmXBppuQuzUMtewLZiRl2roKyPA2RfMSdqA8b/zqjoF3HrtICIMTaUiyuuQRUUggi0JOodsZeav9MJXWdS3WTKzjJponW5vItJsKJaNyirvmrWpMmD9yArkOE31nydCwAVsbUbkkpGLCyPXzwkTC2FHLAZN3rBEAjUdUwk8lSsJCxtMhGP/s3031wKbSOiBM0ksvIQDJxpFapgbOk68E5T3n28Symx7KJ2fVz2iXNYYLOSWoLpgm1TzzsqVah7hhQAhqXvW4EjFvVLttIKJvNVU9XeD7ZubVBeoM+2
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB44646AC68590A3060B16FD5CABD80@SN6PR02MB4464.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4464; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4464; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	4:dnDEJNZXBvr7NxFOJhywasySIEDNwJetrBXiSWOi6UwmCidR6yV1VhmwhOZ8L9cuUFrErMUqTjomA865ZGHpsM+0SLP6zjVKM1JxoJa8iZ3+iOESXC1KCtgYu3HlAx+2ahuF31/hwI+9IvET7DchzYTnxeTqRVHWUN28o2R8SOFiHzlP6pnH7wYgzJNDZMTogKgiqn8InLfOhxucd95fkLTsP58wLloq+7BZMd/oP2DHo8lx+ZHjvQYetcVaDWYgzEsXaIDVuqnw/dvchLH8Vw==
X-Forefront-PRVS: 08617F610C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4464;
	23:R0NF0D7+sh/hr6RHPUyWk0fdZp5RfI+Z5VY+83p5i?=
	=?us-ascii?Q?vTi5bUWdFXpA9REtMhooYPZDJSeHFXOQfdLhN4Yaz7tzC0kl7+EsiiyF/Fhu?=
	=?us-ascii?Q?3M0FQLiPUrvtuZxPERM5k6xvVn3T3d3Z4HXFiSu+jDoQ0fdCDBuwIzqPNdXg?=
	=?us-ascii?Q?ZnL/JmtQLeXF6460ulNfjW/RE5Qqs8mW8N8h+w1rfAts5St157lh0OIy3BMZ?=
	=?us-ascii?Q?YJLH1SZutBcktt/MJEBWR7PV1U/VuxlwtdFXmkDcRikjP68JwoLFsFDZ22I6?=
	=?us-ascii?Q?fI17Y4sWFh2Q1iMAErZ4Y7vU/wZSzhNk4PWPPlkkwwmZ37rcJHg568ZtpAeO?=
	=?us-ascii?Q?8Vy5LZHPzqTu26VXCkPx/J+42AlAK1ipBTxFvvlel8GEwXUjhdHUTAGGWaS3?=
	=?us-ascii?Q?Dc173GsLFkbO1g4iDbBLTG7dUy5+tnl8h/iI14cSfc9HL/Bw6WPrsAaxiHbZ?=
	=?us-ascii?Q?BeNU99SyCn5r0uUyH3ucNukNxDtjk8MHIX6HS8vbHABK5HFopTrYdk3aAchh?=
	=?us-ascii?Q?mPy8mQcqpWcMtWeXxsHhSwVF9+Wwzkg8XFULcCUIjkqmdm1n9BMI9YZvFFj6?=
	=?us-ascii?Q?3CD/atMyCM1aK1qhoZeunrnoFfbWfx9QoylZRJr8deWPlvIA3MJHbd4fopxV?=
	=?us-ascii?Q?sR7BXgMs+8CAkMnXFD6mHjhRQ74CB9TXx29gdXu6SP2KTyxyHEU05qVr83ld?=
	=?us-ascii?Q?1yy/54Ouge32kAKkeC7jOZUTQlMscwYUc2VbPSFSXr/xWSPOLBLDr+52KOXS?=
	=?us-ascii?Q?Mb+OdJCrGdM+qOV2L4tk0P1swXPJZ9YAz9jOH9HOD8Gz+XtuV9Os1kKsYgTO?=
	=?us-ascii?Q?zhUNGV6rfuw4QETLxtVO6k9LDhiPBl2hz72bq7U97JzXDhKGUO3bjxcXV3K8?=
	=?us-ascii?Q?PKbyBATaWz6kTkyWR/4ERC7MntV/vsIarBvlWAmh2KUrPQr4fhLkwEvx7yW1?=
	=?us-ascii?Q?IG+BmAjoW9r6CCMlKR0F/LBxllzb0J0v7w9yJuvSpgJA84IznwalsCMl3/Sb?=
	=?us-ascii?Q?Y3qMYjq8+osDF+cmblOq1LWS7E3KTFrtLEr1/BFVkYp0yfYqu5JF2Gv982zd?=
	=?us-ascii?Q?e0G232iR62LfdtpC9TAczWeJ2VNKf3FNohw/YpVms3QPtgA07szeY4IGaF1S?=
	=?us-ascii?Q?YkfWoh1dJSTZZJrgEkqwKmO6Ag3mGrwknfi1vXkEIpjhdY4DGbsqR2DwG22x?=
	=?us-ascii?Q?68adZKuYuWUqbDonUw4nRD8IEJ+tTq142QdGFbLNODd0tO5D+JK/GngeZB4Y?=
	=?us-ascii?Q?JGoQF+mTakEMhB+yQu8vrhzIG1UQSZFhcKM3/wg?=
X-Microsoft-Antispam-Message-Info: ReIu+GEA6sUH8Iv91xKzGCu5aqykVrT2aphuWbtpzwQna2OfOnemDEDGLzffgsfnsUsCaMB6IMzsbOBCZqmtuw2INXxpoBvaM1JE9EJ1k4w1whjTTdhciR/tx1VZt1SgL4vSz+i6cM76+TXFFMB+7mcyJWlq5X75vBnausW3mbuzQd0te4WWbgeOhaUNq0v667LtpiACcublYk+hWP1YunVYweQsjKrSiOBU3Kt46KhZJVtmncHVnvU1SZr6G6hQkhc0lZ/AGL/SgYS8ulZ44jXpBMRl2ooanejNHtQ1bQtMs938m0FG4a2pJGXCxC9tP4fpQEMooKNs4Hlt3QlA7yFnekm5O1dMo3rDn+qT/P8=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4464;
	6:TUdsV1WhH+tGyDo9G5WqTZGqSFu4dei6vC+6KbEbWwQfkWPyDGwF958NYyq1+mmefGHAG5m3zgUUBiW5An/bzzLMMliDyEPD6+Tt8lhdvV0EKztJlb3fEzHFg6HXlDSMYnK63NQze+gbWvh2a+sts3FhVj8LhjSsQNErzHaIsppJM/Ve1TOdqSXNvO8NT+mnXkxzAbjh2lnefY9sWw/ndEbyVFDcXyW1GaEq5c5nDVWDjt9/jb8z0TsZOyf91Dh5lzcu256IuvC1WdmRd4VN+ftyqAHHcVzxIAY2mAXZULfAFGZBzSNHUpKV2HREOpvIEEpKSXqbWXGH7KfghEQ35JBDTWNseuSr8F5ZzLHDK1BDOv2qy3rCEOcBAbLnrZprtRFq8zMnBY5mpXCSf7IqNv5w9m87gBKLn5Dmxop/Szc4kGXwoSftn2G1d6lHnK0ec9VJv08klUk+5NE/KGQRSQ==;
	5:/SntA5LyKE72r6UOAIp7mgtL/TpwLV1tS13IWLhNOiE0vWCC7jexXt78dTixWtgOBFtE1ob/xKOHH+BRpucbHTFC70gyChkoHHXelYsejIMYR5YZsu3uKkAveXzeLDiVsDCBEhDXKYx2W7m5AX6TyNe8ifEpFRIZoHpPSvGaMdA=;
	7:XlTg9NQ2efKcgQjKzOvXuuGUciUVbNb4YTtf2zLw+2vP/95sl8/SFmA5so5Pnl3u4/pB/0q29MwzMBToM/p5O2aSqSRUYCPK5tf4k1uxexVT5IEiVX9B/UqJqec4b0e0+xgkeklZ4KPNrXllxtC0lw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2018 16:45:04.4225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c6dcc0-64d3-4d2b-3c15-08d64e3e5b6a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4464
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.68.60
Subject: Re: [Qemu-devel] [PATCH v6 07/16] gdbstub: add multiprocess support
 to (f|s)ThreadInfo and ThreadExtraInfo
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvFjWEsKQRA0

On Mon, Nov 19, 2018 at 11:12:45AM +0100, Luc Michel wrote:
>=20
>=20
> On 11/16/18 11:04 AM, Edgar E. Iglesias wrote:
> > On Thu, Nov 15, 2018 at 10:41:58AM +0100, Luc Michel wrote:
> >> Change the thread info related packets handling to support multiproces=
s
> >> extension.
> >>
> >> Add the CPUs class name in the extra info to help differentiate
> >> them in multiprocess mode.
> >>
> >> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> >> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> ---
> >>  gdbstub.c | 35 +++++++++++++++++++++++++----------
> >>  1 file changed, 25 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/gdbstub.c b/gdbstub.c
> >> index d19b0137e8..292dee8914 100644
> >> --- a/gdbstub.c
> >> +++ b/gdbstub.c
> >> @@ -1260,11 +1260,10 @@ out:
> >>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
> >>  {
> >>      CPUState *cpu;
> >>      CPUClass *cc;
> >>      const char *p;
> >> -    uint32_t thread;
> >>      uint32_t pid, tid;
> >>      int ch, reg_size, type, res;
> >>      uint8_t mem_buf[MAX_PACKET_LENGTH];
> >>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
> >>      char thread_id[16];
> >> @@ -1556,30 +1555,46 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
> >>              snprintf(buf, sizeof(buf), "QC%s",
> >>                       gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thre=
ad_id)));
> >>              put_packet(s, buf);
> >>              break;
> >>          } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
> >> -            s->query_cpu =3D first_cpu;
> >> +            s->query_cpu =3D gdb_first_cpu(s);
> >>              goto report_cpuinfo;
> >>          } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
> >>          report_cpuinfo:
> >>              if (s->query_cpu) {
> >> -                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->qu=
ery_cpu));
> >> +                snprintf(buf, sizeof(buf), "m%s",
> >> +                         gdb_fmt_thread_id(s, s->query_cpu,
> >> +                                       thread_id, sizeof(thread_id)))=
;
> >>                  put_packet(s, buf);
> >> -                s->query_cpu =3D CPU_NEXT(s->query_cpu);
> >> +                s->query_cpu =3D gdb_next_cpu(s, s->query_cpu);
> >>              } else
> >>                  put_packet(s, "l");
> >>              break;
> >>          } else if (strncmp(p,"ThreadExtraInfo,", 16) =3D=3D 0) {
> >> -            thread =3D strtoull(p+16, (char **)&p, 16);
> >> -            cpu =3D find_cpu(thread);
> >> +            if (read_thread_id(p + 16, &p, &pid, &tid) =3D=3D GDB_REA=
D_THREAD_ERR) {
> >> +                put_packet(s, "E22");
> >> +                break;
> >> +            }
> >> +            cpu =3D gdb_get_cpu(s, pid, tid);
> >>              if (cpu !=3D NULL) {
> >>                  cpu_synchronize_state(cpu);
> >> -                /* memtohex() doubles the required space */
> >> -                len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> >> -                               "CPU#%d [%s]", cpu->cpu_index,
> >> -                               cpu->halted ? "halted " : "running");
> >> +
> >> +                if (s->multiprocess && (s->process_num > 1)) {
> >> +                    /* Print the CPU model in multiprocess mode */
> >> +                    ObjectClass *oc =3D object_get_class(OBJECT(cpu))=
;
> >> +                    const char *cpu_model =3D object_class_get_name(o=
c);
> >> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2=
,
> >> +                                   "CPU#%d %s [%s]", cpu->cpu_index,
> >> +                                   cpu_model,
> >> +                                   cpu->halted ? "halted " : "running=
");
> >=20
> >=20
> >=20
> > I wonder if we could also print a friendly name here deducted from QOM?
> > In some of our use-cases we have an array of MicroBlazes that all live
> > in different HW subsystems and are named differently (e.g CSU, PMU, PMC=
,
> > PSM etc).
> >=20
> > Instead of just seeing a list of MicroBlaze cores it may be more useful
> > to see the actual core name of some sort, e.g:
> >=20
> > Instead of:
> > CPU#0 MicroBlaze [running]
> > CPU#1 MicroBlaze [running]
> > CPU#2 MicroBlaze [running]
> > CPU#3 MicroBlaze [running]
> >=20
> > Perhaps something like:
> > CPU#0 MicroBlaze PMU [running]
> > CPU#1 MicroBlaze PMC-PPU0 [running]
> > CPU#2 MicroBlaze PMC-PPU1 [running]
> > CPU#3 MicroBlaze PSM [running]
> >=20
> > Any thoughts on that?
> I wanted to avoid the ThreadExtraInfo packet to become too much cluttered=
.
>=20
> Here are some tests adding the component part of the CPU canonical name:
>=20
> (gdb) info threads
>   Id   Target Id         Frame
>   1.1  Thread 1.1 (CPU#0 cortex-a53-arm-cpu apu-cpu[0] [running])
> 0x0000000000000000 in ?? ()
>   1.2  Thread 1.2 (CPU#1 cortex-a53-arm-cpu apu-cpu[1] [halted ])
> 0x0000000000000000 in ?? ()
>   1.3  Thread 1.3 (CPU#2 cortex-a53-arm-cpu apu-cpu[2] [halted ])
> 0x0000000000000000 in ?? ()
>   1.4  Thread 1.4 (CPU#3 cortex-a53-arm-cpu apu-cpu[3] [halted ])
> 0x0000000000000000 in ?? ()
> * 2.1  Thread 2.5 (CPU#4 cortex-r5f-arm-cpu rpu-cpu[0] [halted ])
> 0xffff0000 in ?? ()
>   2.2  Thread 2.6 (CPU#5 cortex-r5f-arm-cpu rpu-cpu[1] [halted ])
> 0xffff0000 in ?? ()
>=20
> The model name takes quite some room. The interesting info are `arm` and
> `cortex-xxx`, but AFAIK there is no way of extracting that for a CPU
> generically.
>=20
> In this case, having the component part of the canonical name is ok
> because self-explanatory. However we could encounter cases where the
> parent name would be necessary to discriminate the CPUs, something like:
>   cluster[0]/cpu[0]
>             /cpu[1]
>   cluster[1]/cpu[0]
>             /cpu[1]
>   ...
>=20
> The "safest" way would be to have the whole path:
>=20
> (gdb) info threads
>   Id   Target Id         Frame
>   1.1  Thread 1.1 (CPU#0 cortex-a53-arm-cpu
> /machine/soc/apu-cluster/apu-cpu[0] [running]) 0x0000000000000000 in ?? (=
)
>   1.2  Thread 1.2 (CPU#1 cortex-a53-arm-cpu
> /machine/soc/apu-cluster/apu-cpu[1] [halted ]) 0x0000000000000000 in ?? (=
)
>   1.3  Thread 1.3 (CPU#2 cortex-a53-arm-cpu
> /machine/soc/apu-cluster/apu-cpu[2] [halted ]) 0x0000000000000000 in ?? (=
)
>   1.4  Thread 1.4 (CPU#3 cortex-a53-arm-cpu
> /machine/soc/apu-cluster/apu-cpu[3] [halted ]) 0x0000000000000000 in ?? (=
)
> * 2.1  Thread 2.5 (CPU#4 cortex-r5f-arm-cpu
> /machine/soc/rpu-cluster/rpu-cpu[0] [halted ]) 0xffff0000 in ?? ()
>   2.2  Thread 2.6 (CPU#5 cortex-r5f-arm-cpu
> /machine/soc/rpu-cluster/rpu-cpu[1] [halted ]) 0xffff0000 in ?? ()
>=20
> But that becomes really cluttered... We could also remove the CPU model
> completely.
>=20
> What are your thoughts?

Thanks Luc,

Not sure...

(CPU#0 cortex-a53-arm-cpu apu-cpu[0] [running])

Looks a little long but I think still the better option here. Would be inte=
resting to hear others opinion.

Also, would it make sense to remove the CPU#X alltogether here?
It's not of much use in GDB since we controll things by process and thread =
anyway...

Cheers,
Edgar



>=20
> Thanks,
> Luc
>=20
> >=20
> > Thanks,
> > Edgar
> >=20
> >> +                } else {
> >> +                    /* memtohex() doubles the required space */
> >> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2=
,
> >> +                                   "CPU#%d [%s]", cpu->cpu_index,
> >> +                                   cpu->halted ? "halted " : "running=
");
> >> +                }
> >>                  trace_gdbstub_op_extra_info((char *)mem_buf);
> >>                  memtohex(buf, mem_buf, len);
> >>                  put_packet(s, buf);
> >>              }
> >>              break;
> >> --=20
> >> 2.19.1
> >>
